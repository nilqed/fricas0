
(SDEFUN |RDEPAR;get_denom|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         (|lg| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|h| (|SparseUnivariatePolynomial| F)) (#1=#:G746 NIL)
          (|gg| (|SparseUnivariatePolynomial| F))
          (|s| #2=(|SparseUnivariatePolynomial| F))
          (|e| #3=(|SparseUnivariatePolynomial| F))
          (|#G8| (|Record| (|:| |normal| #3#) (|:| |special| #2#)))
          (|e0| (|SparseUnivariatePolynomial| F)) (#4=#:G751 NIL) (|g| NIL)
          (#5=#:G750 NIL) (|d| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |d| (SPADCALL |f| |der| (QREFELT $ 12))
                . #6=(|RDEPAR;get_denom|))
          (LETT |e0|
                (SPADCALL
                 (PROGN
                  (LETT #5# NIL . #6#)
                  (SEQ (LETT |g| NIL . #6#) (LETT #4# |lg| . #6#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |g| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #5# (CONS (SPADCALL |g| (QREFELT $ 13)) #5#)
                               . #6#)))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 (QREFELT $ 15))
                . #6#)
          (PROGN
           (LETT |#G8| (SPADCALL |e0| |der| (QREFELT $ 17)) . #6#)
           (LETT |e| (QCAR |#G8|) . #6#)
           (LETT |s| (QCDR |#G8|) . #6#)
           |#G8|)
          (LETT |gg| (SPADCALL |d| |e| (QREFELT $ 18)) . #6#)
          (LETT |h|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL |e| (SPADCALL |e| (QREFELT $ 19))
                                     (QREFELT $ 18))
                           (SPADCALL |gg| (SPADCALL |gg| (QREFELT $ 19))
                                     (QREFELT $ 18))
                           (QREFELT $ 21))
                          . #6#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   "failed")
                                  #1#))
                . #6#)
          (EXIT (LIST |d| |h|))))) 

(SDEFUN |RDEPAR;normalize|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         (|der| |Mapping| #1=(|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |List|
          (|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                    (|:| |xpnt| (|Integer|)))))
        (SPROG
         ((|rl|
           (|List|
            (|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                      (|:| |xpnt| (|Integer|)))))
          (|pi| #2=(|SparseUnivariatePolynomial| F)) (|m| (|Integer|))
          (|mu| (|Union| (|Integer|) "failed")) (#3=#:G781 NIL) (|rq| NIL)
          (|rql| (|List| (|Fraction| (|Integer|)))) (|r| (F)) (|dd1| #1#)
          (|zk| (|Kernel| F)) (|b| #4=(|SparseUnivariatePolynomial| F))
          (|a| #5=(|SparseUnivariatePolynomial| F))
          (|#G11|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (#6=#:G759 NIL)
          (|eeu|
           (|Union| (|Record| (|:| |coef1| #5#) (|:| |coef2| #4#))
                    #7="failed"))
          (|d2| (|SparseUnivariatePolynomial| F)) (#8=#:G755 NIL)
          (|d1| (|SparseUnivariatePolynomial| F)) (|dd| #2#)
          (|d0| (|SparseUnivariatePolynomial| F)) (|g| #2#)
          (|d| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |d| (SPADCALL |f| |der| (QREFELT $ 12))
                . #9=(|RDEPAR;normalize|))
          (LETT |g| (SPADCALL |d| (SPADCALL |d| (QREFELT $ 19)) (QREFELT $ 18))
                . #9#)
          (LETT |d0|
                (PROG2 (LETT #8# (SPADCALL |d| |g| (QREFELT $ 21)) . #9#)
                    (QCDR #8#)
                  (|check_union2| (QEQCAR #8# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   #10="failed")
                                  #8#))
                . #9#)
          (LETT |dd| (SPADCALL |d0| |g| (QREFELT $ 18)) . #9#)
          (LETT |d1|
                (PROG2 (LETT #8# (SPADCALL |d0| |dd| (QREFELT $ 21)) . #9#)
                    (QCDR #8#)
                  (|check_union2| (QEQCAR #8# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   #10#)
                                  #8#))
                . #9#)
          (LETT |d2|
                (PROG2
                    (LETT #8#
                          (SPADCALL (SPADCALL |f| (QREFELT $ 13)) |d1|
                                    (QREFELT $ 21))
                          . #9#)
                    (QCDR #8#)
                  (|check_union2| (QEQCAR #8# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   #10#)
                                  #8#))
                . #9#)
          (LETT |eeu|
                (SPADCALL |d2| |d1| (SPADCALL |f| (QREFELT $ 22))
                          (QREFELT $ 25))
                . #9#)
          (PROGN
           (LETT |#G11|
                 (PROG2 (LETT #6# |eeu| . #9#)
                     (QCDR #6#)
                   (|check_union2| (QEQCAR #6# 0)
                                   (|Record|
                                    (|:| |coef1|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 7)))
                                    (|:| |coef2|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 7))))
                                   (|Union|
                                    (|Record|
                                     (|:| |coef1|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7)))
                                     (|:| |coef2|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))
                                    #7#)
                                   #6#))
                 . #9#)
           (LETT |a| (QCAR |#G11|) . #9#)
           (LETT |b| (QCDR |#G11|) . #9#)
           |#G11|)
          (LETT |zk| (SPADCALL (SPADCALL (QREFELT $ 27)) (QREFELT $ 29)) . #9#)
          (LETT |dd1| (SPADCALL |d1| |der|) . #9#)
          (LETT |r|
                (SPADCALL
                 (SPADCALL |a|
                           (SPADCALL (SPADCALL |zk| (QREFELT $ 31)) |dd1|
                                     (QREFELT $ 32))
                           (QREFELT $ 33))
                 |d1| (QREFELT $ 34))
                . #9#)
          (LETT |rql| (SPADCALL |r| |zk| (QREFELT $ 37)) . #9#)
          (LETT |rl| NIL . #9#)
          (SEQ (LETT |rq| NIL . #9#) (LETT #3# |rql| . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |rq| (CAR #3#) . #9#) NIL))
                 (GO G191)))
               (SEQ (LETT |mu| (SPADCALL |rq| (QREFELT $ 40)) . #9#)
                    (EXIT
                     (COND
                      ((QEQCAR |mu| 0)
                       (SEQ (LETT |m| (QCDR |mu|) . #9#)
                            (EXIT
                             (COND
                              ((SPADCALL |m| 0 (QREFELT $ 45))
                               (SEQ
                                (LETT |pi|
                                      (SPADCALL
                                       (SPADCALL |a|
                                                 (SPADCALL
                                                  (SPADCALL |m| (QREFELT $ 46))
                                                  |dd1| (QREFELT $ 32))
                                                 (QREFELT $ 33))
                                       |d1| (QREFELT $ 18))
                                      . #9#)
                                (EXIT
                                 (LETT |rl| (CONS (CONS |pi| |m|) |rl|)
                                       . #9#)))))))))))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT |rl|)))) 

(SDEFUN |RDEPAR;RF_to_GP|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
        (SPROG ((#1=#:G785 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| (QREFELT $ 22))
                                    (QREFELT $ 48))
                          (SPADCALL (SPADCALL |f| (QREFELT $ 13))
                                    (QREFELT $ 48))
                          (QREFELT $ 49))
                         |RDEPAR;RF_to_GP|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LaurentPolynomial| (QREFELT $ 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 7)))
                                 (|Union|
                                  (|LaurentPolynomial| (QREFELT $ 7)
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 7)))
                                  "failed")
                                 #1#)))) 

(SDEFUN |RDEPAR;do_spde1|
        ((|b| |SparseUnivariatePolynomial| F)
         (|lc| |List| (|SparseUnivariatePolynomial| F))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| #1=(|Matrix| F) (|Matrix| F))
         ($ |List|
          (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                    (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G805 NIL) (|kv| NIL) (#3=#:G804 NIL)
          (|lkv| (|List| (|Vector| F))) (|rs2| #1#) (|rs1| (|Matrix| F))
          (|lrem| (|List| #4=(|SparseUnivariatePolynomial| F))) (#5=#:G803 NIL)
          (|ar| NIL) (#6=#:G802 NIL)
          (|la| (|List| #7=(|SparseUnivariatePolynomial| F))) (#8=#:G801 NIL)
          (#9=#:G800 NIL)
          (|lar| (|List| (|Record| (|:| |ans| #7#) (|:| |remainder| #4#))))
          (#10=#:G799 NIL) (|c| NIL) (#11=#:G798 NIL))
         (SEQ
          (LETT |lar|
                (PROGN
                 (LETT #11# NIL . #12=(|RDEPAR;do_spde1|))
                 (SEQ (LETT |c| NIL . #12#) (LETT #10# |lc| . #12#) G190
                      (COND
                       ((OR (ATOM #10#)
                            (PROGN (LETT |c| (CAR #10#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11#
                              (CONS (SPADCALL |b| |c| |der| (QREFELT $ 52))
                                    #11#)
                              . #12#)))
                      (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                . #12#)
          (LETT |la|
                (PROGN
                 (LETT #9# NIL . #12#)
                 (SEQ (LETT |ar| NIL . #12#) (LETT #8# |lar| . #12#) G190
                      (COND
                       ((OR (ATOM #8#)
                            (PROGN (LETT |ar| (CAR #8#) . #12#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #9# (CONS (QCAR |ar|) #9#) . #12#)))
                      (LETT #8# (CDR #8#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #12#)
          (LETT |lrem|
                (PROGN
                 (LETT #6# NIL . #12#)
                 (SEQ (LETT |ar| NIL . #12#) (LETT #5# |lar| . #12#) G190
                      (COND
                       ((OR (ATOM #5#)
                            (PROGN (LETT |ar| (CAR #5#) . #12#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #6# (CONS (QCDR |ar|) #6#) . #12#)))
                      (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #12#)
          (LETT |rs1|
                (SPADCALL (SPADCALL (LIST |lrem|) (QREFELT $ 55))
                          (QREFELT $ 58))
                . #12#)
          (LETT |rs2| (SPADCALL |rs1| |get_rs|) . #12#)
          (LETT |lkv| (SPADCALL |rs2| (QREFELT $ 60)) . #12#)
          (EXIT
           (PROGN
            (LETT #3# NIL . #12#)
            (SEQ (LETT |kv| NIL . #12#) (LETT #2# |lkv| . #12#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |kv| (CAR #2#) . #12#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS (CONS (SPADCALL |kv| |la| (QREFELT $ 64)) |kv|)
                               #3#)
                         . #12#)))
                 (LETT #2# (CDR #2#) . #12#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;param_SPDE|
        ((|a| |SparseUnivariatePolynomial| F)
         (|b| |SparseUnivariatePolynomial| F)
         (|lc| |List| (|SparseUnivariatePolynomial| F)) (|d| |Integer|)
         (|der| |Mapping| #1=(|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| #2=(|Matrix| F) (|Matrix| F))
         (|do_degrad| |Mapping|
          #3=(|List|
              (|Record|
               (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
               (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|x| |Symbol|)
         ($
          . #4=(|List|
                (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                          (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|nres|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F)))))
          (|ans1| (|SparseUnivariatePolynomial| F)) (|bv| (|Vector| F))
          (#5=#:G865 NIL) (|be| NIL) (|s2| #4#) (|n2| (|NonNegativeInteger|))
          (|nlc| (|List| (|SparseUnivariatePolynomial| F))) (#6=#:G864 NIL)
          (|kv| NIL) (#7=#:G863 NIL) (|q| NIL) (#8=#:G862 NIL)
          (|lkv| (|List| (|Vector| F))) (|rs2| #2#) (|rs1| (|Matrix| F))
          (|lr| (|List| #9=(|SparseUnivariatePolynomial| F))) (#10=#:G861 NIL)
          (#11=#:G860 NIL)
          (|lq|
           (|List|
            (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                      (|:| |remainder| #9#))))
          (#12=#:G859 NIL) (|c| NIL) (#13=#:G858 NIL)
          (|oans| #14=(|List| (|SparseUnivariatePolynomial| F)))
          (|aa| #15=(|SparseUnivariatePolynomial| F)) (#16=#:G828 NIL)
          (|g| #17=(|SparseUnivariatePolynomial| F))
          (|dres|
           (|Record| (|:| |ans| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |acoeff| (|SparseUnivariatePolynomial| F))
                     (|:| |eegen| (|SparseUnivariatePolynomial| F))
                     (|:| |bpar| (|SparseUnivariatePolynomial| F))
                     (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |dpar| (|Integer|))))
          (#18=#:G857 NIL) (#19=#:G856 NIL)
          (|a1l| (|List| #20=(|SparseUnivariatePolynomial| F)))
          (#21=#:G855 NIL) (|rsol| NIL) (#22=#:G854 NIL)
          (|m1| (|Matrix| (|SparseUnivariatePolynomial| F))) (#23=#:G853 NIL)
          (#24=#:G852 NIL)
          (|lrs|
           (|List|
            (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                      (|:| |remainder| (|SparseUnivariatePolynomial| F)))))
          (|s1|
           (|Union|
            (|List|
             (|Record| (|:| |ans| #20#)
                       (|:| |remainder| (|SparseUnivariatePolynomial| F))))
            (|Record| (|:| |ans| #14#) (|:| |acoeff| #15#) (|:| |eegen| #17#)
                      (|:| |bpar| (|SparseUnivariatePolynomial| F))
                      (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                      (|:| |dpar| (|Integer|)))))
          (|n1| (|NonNegativeInteger|)) (#25=#:G851 NIL) (|re| NIL)
          (#26=#:G850 NIL) (|res1| #3#)
          (|lcr| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#27=#:G849 NIL) (#28=#:G848 NIL) (|base_case| (|Boolean|))
          (|degt| (|Integer|)) (|dt| #1#))
         (SEQ
          (LETT |dt|
                (SPADCALL (SPADCALL (|spadConstant| $ 66) 1 (QREFELT $ 68))
                          |der|)
                . #29=(|RDEPAR;param_SPDE|))
          (EXIT
           (COND
            ((EQL (SPADCALL |a| (QREFELT $ 69)) 0)
             (COND
              ((SPADCALL |a| (|spadConstant| $ 70) (QREFELT $ 71))
               (|error| "param_SPDE: degree(a) = 0 but a ~= 1"))
              (#30='T
               (SEQ (LETT |degt| (- (SPADCALL |dt| (QREFELT $ 69)) 1) . #29#)
                    (LETT |base_case|
                          (SPADCALL |dt| (|spadConstant| $ 70) (QREFELT $ 72))
                          . #29#)
                    (COND
                     ((SPADCALL |b| (|spadConstant| $ 73) (QREFELT $ 71))
                      (COND
                       ((OR |base_case|
                            (SPADCALL (SPADCALL |b| (QREFELT $ 69))
                                      (MAX 0 |degt|) (QREFELT $ 45)))
                        (EXIT
                         (|RDEPAR;do_spde1| |b| |lc| |der| |get_rs| $))))))
                    (LETT |lcr|
                          (PROGN
                           (LETT #28# NIL . #29#)
                           (SEQ (LETT |c| NIL . #29#) (LETT #27# |lc| . #29#)
                                G190
                                (COND
                                 ((OR (ATOM #27#)
                                      (PROGN (LETT |c| (CAR #27#) . #29#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #28#
                                        (CONS (SPADCALL |c| (QREFELT $ 74))
                                              #28#)
                                        . #29#)))
                                (LETT #27# (CDR #27#) . #29#) (GO G190) G191
                                (EXIT (NREVERSE #28#))))
                          . #29#)
                    (LETT |res1|
                          (SPADCALL (SPADCALL |b| (QREFELT $ 74)) |lcr|
                                    |do_degrad|)
                          . #29#)
                    (EXIT
                     (PROGN
                      (LETT #26# NIL . #29#)
                      (SEQ (LETT |re| NIL . #29#) (LETT #25# |res1| . #29#)
                           G190
                           (COND
                            ((OR (ATOM #25#)
                                 (PROGN (LETT |re| (CAR #25#) . #29#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #26#
                                   (CONS
                                    (CONS (SPADCALL (QCAR |re|) (QREFELT $ 75))
                                          (QCDR |re|))
                                    #26#)
                                   . #29#)))
                           (LETT #25# (CDR #25#) . #29#) (GO G190) G191
                           (EXIT (NREVERSE #26#)))))))))
            (#30#
             (SEQ (LETT |n1| (LENGTH |lc|) . #29#)
                  (LETT |s1| (SPADCALL |a| |b| |lc| |d| |der| (QREFELT $ 78))
                        . #29#)
                  (EXIT
                   (COND
                    ((QEQCAR |s1| 0)
                     (SEQ (LETT |lrs| (QCDR |s1|) . #29#)
                          (LETT |m1|
                                (SPADCALL
                                 (LIST
                                  (PROGN
                                   (LETT #24# NIL . #29#)
                                   (SEQ (LETT |rsol| NIL . #29#)
                                        (LETT #23# |lrs| . #29#) G190
                                        (COND
                                         ((OR (ATOM #23#)
                                              (PROGN
                                               (LETT |rsol| (CAR #23#) . #29#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #24# (CONS (QCDR |rsol|) #24#)
                                                . #29#)))
                                        (LETT #23# (CDR #23#) . #29#) (GO G190)
                                        G191 (EXIT (NREVERSE #24#)))))
                                 (QREFELT $ 55))
                                . #29#)
                          (LETT |rs1| (SPADCALL |m1| (QREFELT $ 58)) . #29#)
                          (LETT |rs2| (SPADCALL |rs1| |get_rs|) . #29#)
                          (LETT |lkv| (SPADCALL |rs2| (QREFELT $ 60)) . #29#)
                          (LETT |a1l|
                                (PROGN
                                 (LETT #22# NIL . #29#)
                                 (SEQ (LETT |rsol| NIL . #29#)
                                      (LETT #21# |lrs| . #29#) G190
                                      (COND
                                       ((OR (ATOM #21#)
                                            (PROGN
                                             (LETT |rsol| (CAR #21#) . #29#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #22# (CONS (QCAR |rsol|) #22#)
                                              . #29#)))
                                      (LETT #21# (CDR #21#) . #29#) (GO G190)
                                      G191 (EXIT (NREVERSE #22#))))
                                . #29#)
                          (EXIT
                           (PROGN
                            (LETT #19# NIL . #29#)
                            (SEQ (LETT |kv| NIL . #29#)
                                 (LETT #18# |lkv| . #29#) G190
                                 (COND
                                  ((OR (ATOM #18#)
                                       (PROGN
                                        (LETT |kv| (CAR #18#) . #29#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #19#
                                         (CONS
                                          (CONS
                                           (SPADCALL |kv| |a1l| (QREFELT $ 64))
                                           |kv|)
                                          #19#)
                                         . #29#)))
                                 (LETT #18# (CDR #18#) . #29#) (GO G190) G191
                                 (EXIT (NREVERSE #19#)))))))
                    (#30#
                     (SEQ (LETT |dres| (QCDR |s1|) . #29#)
                          (LETT |g| (QVELT |dres| 2) . #29#)
                          (LETT |a|
                                (PROG2
                                    (LETT #16#
                                          (SPADCALL |a| |g| (QREFELT $ 21))
                                          . #29#)
                                    (QCDR #16#)
                                  (|check_union2| (QEQCAR #16# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))
                                                   #31="failed")
                                                  #16#))
                                . #29#)
                          (LETT |b|
                                (PROG2
                                    (LETT #16#
                                          (SPADCALL (QVELT |dres| 3) |g|
                                                    (QREFELT $ 21))
                                          . #29#)
                                    (QCDR #16#)
                                  (|check_union2| (QEQCAR #16# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))
                                                   #31#)
                                                  #16#))
                                . #29#)
                          (LETT |aa| (QVELT |dres| 1) . #29#)
                          (LETT |oans| (QVELT |dres| 0) . #29#)
                          (LETT |lq|
                                (PROGN
                                 (LETT #13# NIL . #29#)
                                 (SEQ (LETT |c| NIL . #29#)
                                      (LETT #12# (QVELT |dres| 4) . #29#) G190
                                      (COND
                                       ((OR (ATOM #12#)
                                            (PROGN
                                             (LETT |c| (CAR #12#) . #29#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #13#
                                              (CONS
                                               (SPADCALL |c| |g|
                                                         (QREFELT $ 80))
                                               #13#)
                                              . #29#)))
                                      (LETT #12# (CDR #12#) . #29#) (GO G190)
                                      G191 (EXIT (NREVERSE #13#))))
                                . #29#)
                          (LETT |lr|
                                (PROGN
                                 (LETT #11# NIL . #29#)
                                 (SEQ (LETT |q| NIL . #29#)
                                      (LETT #10# |lq| . #29#) G190
                                      (COND
                                       ((OR (ATOM #10#)
                                            (PROGN
                                             (LETT |q| (CAR #10#) . #29#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #11# (CONS (QCDR |q|) #11#)
                                              . #29#)))
                                      (LETT #10# (CDR #10#) . #29#) (GO G190)
                                      G191 (EXIT (NREVERSE #11#))))
                                . #29#)
                          (LETT |rs1|
                                (SPADCALL (SPADCALL (LIST |lr|) (QREFELT $ 55))
                                          (QREFELT $ 58))
                                . #29#)
                          (LETT |rs2| (SPADCALL |rs1| |get_rs|) . #29#)
                          (LETT |lkv| (SPADCALL |rs2| (QREFELT $ 60)) . #29#)
                          (EXIT
                           (COND ((NULL |lkv|) NIL)
                                 (#30#
                                  (SEQ
                                   (LETT |lc|
                                         (PROGN
                                          (LETT #8# NIL . #29#)
                                          (SEQ (LETT |q| NIL . #29#)
                                               (LETT #7# |lq| . #29#) G190
                                               (COND
                                                ((OR (ATOM #7#)
                                                     (PROGN
                                                      (LETT |q| (CAR #7#)
                                                            . #29#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #8#
                                                       (CONS (QCAR |q|) #8#)
                                                       . #29#)))
                                               (LETT #7# (CDR #7#) . #29#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #8#))))
                                         . #29#)
                                   (LETT |nlc| NIL . #29#)
                                   (SEQ (LETT |kv| NIL . #29#)
                                        (LETT #6# |lkv| . #29#) G190
                                        (COND
                                         ((OR (ATOM #6#)
                                              (PROGN
                                               (LETT |kv| (CAR #6#) . #29#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |nlc|
                                                (CONS
                                                 (SPADCALL |kv| |lc|
                                                           (QREFELT $ 64))
                                                 |nlc|)
                                                . #29#)))
                                        (LETT #6# (CDR #6#) . #29#) (GO G190)
                                        G191 (EXIT NIL))
                                   (LETT |nlc| (NREVERSE |nlc|) . #29#)
                                   (LETT |n2| (LENGTH |lkv|) . #29#)
                                   (LETT |s2|
                                         (|RDEPAR;param_SPDE| |a| |b| |nlc|
                                          (QVELT |dres| 5) |der| |get_rs|
                                          |do_degrad| |x| $)
                                         . #29#)
                                   (LETT |nres| NIL . #29#)
                                   (SEQ (LETT |be| NIL . #29#)
                                        (LETT #5# |s2| . #29#) G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN
                                               (LETT |be| (CAR #5#) . #29#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |bv|
                                               (SPADCALL (QCDR |be|) |lkv|
                                                         (QREFELT $ 81))
                                               . #29#)
                                         (LETT |ans1|
                                               (SPADCALL
                                                (SPADCALL |bv| |oans|
                                                          (QREFELT $ 64))
                                                (SPADCALL |aa| (QCAR |be|)
                                                          (QREFELT $ 82))
                                                (QREFELT $ 83))
                                               . #29#)
                                         (EXIT
                                          (LETT |nres|
                                                (CONS (CONS |ans1| |bv|)
                                                      |nres|)
                                                . #29#)))
                                        (LETT #5# (CDR #5#) . #29#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (NREVERSE |nres|))))))))))))))))) 

(SDEFUN |RDEPAR;integer_vector|
        ((|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Union| (|Vector| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G875 NIL) (|i| NIL) (#2=#:G874 NIL) (|d| #3=(|Integer|))
          (|nv| #4=(|Vector| (|Fraction| (|Integer|))))
          (|#G42| (|Record| (|:| |num| #4#) (|:| |den| #3#))))
         (SEQ
          (PROGN
           (LETT |#G42| (SPADCALL |v| (QREFELT $ 87))
                 . #5=(|RDEPAR;integer_vector|))
           (LETT |nv| (QCAR |#G42|) . #5#)
           (LETT |d| (QCDR |#G42|) . #5#)
           |#G42|)
          (EXIT
           (COND
            ((OR (SPADCALL |d| 1 (QREFELT $ 88))
                 (SPADCALL (SPADCALL |nv| 1 (QREFELT $ 89))
                           (|spadConstant| $ 90) (QREFELT $ 91)))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |i| 1 . #5#) (LETT #1# (QVSIZE |nv|) . #5#)
                          G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (SPADCALL |nv| |i| (QREFELT $ 89))
                                             (QREFELT $ 92))
                                   #2#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 95))))))))) 

(SDEFUN |RDEPAR;do_SPDE_prim0|
        ((|b| F) (|lc| |List| (|SparseUnivariatePolynomial| F))
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| (|Matrix| F) (|Matrix| F)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G926 NIL) (|ba| NIL) (#2=#:G927 NIL) (|bv| NIL) (#3=#:G925 NIL)
          (|lba| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|cb| (|List| (|Vector| F)))
          (|nlba| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#4=#:G899 NIL) (#5=#:G924 NIL) (|be| NIL) (#6=#:G923 NIL)
          (|cba| (|List| F)) (#7=#:G922 NIL) (#8=#:G921 NIL)
          (|ncb| (|List| (|Vector| F))) (#9=#:G920 NIL) (#10=#:G919 NIL)
          (|s2f|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgj1| (|List| F)) (|ff| (F)) (#11=#:G917 NIL) (#12=#:G918 NIL)
          (|aa| NIL) (|lgj| (|List| F)) (|gij| (F))
          (|gi| (|SparseUnivariatePolynomial| F)) (#13=#:G916 NIL) (|i| NIL)
          (|n1| (|NonNegativeInteger|)) (|j| NIL) (#14=#:G915 NIL)
          (#15=#:G914 NIL) (#16=#:G913 NIL) (#17=#:G912 NIL) (|dk| (F))
          (|d| (|Integer|)) (#18=#:G911 NIL) (|c| NIL) (#19=#:G910 NIL)
          (#20=#:G908 NIL) (#21=#:G909 NIL) (#22=#:G907 NIL) (#23=#:G906 NIL)
          (|vg2| (|Vector| (|SparseUnivariatePolynomial| F)))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |lc|) . #24=(|RDEPAR;do_SPDE_prim0|))
              (LETT |vg2| (SPADCALL |lc| (QREFELT $ 97)) . #24#)
              (LETT |cb|
                    (PROGN
                     (LETT #23# NIL . #24#)
                     (SEQ (LETT |i| 1 . #24#) (LETT #22# |n| . #24#) G190
                          (COND ((|greater_SI| |i| #22#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #23#
                                  (CONS (MAKEARR1 |n| (|spadConstant| $ 42))
                                        #23#)
                                  . #24#)))
                          (LETT |i| (|inc_SI| |i|) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #23#))))
                    . #24#)
              (SEQ (LETT |bv| NIL . #24#) (LETT #21# |cb| . #24#)
                   (LETT |i| 1 . #24#) (LETT #20# |n| . #24#) G190
                   (COND
                    ((OR (|greater_SI| |i| #20#) (ATOM #21#)
                         (PROGN (LETT |bv| (CAR #21#) . #24#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bv| |i| (|spadConstant| $ 66) (QREFELT $ 98))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|) (LETT #21# (CDR #21#) . #24#))
                         . #24#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |d|
                    (SPADCALL (ELT $ 99)
                              (PROGN
                               (LETT #19# NIL . #24#)
                               (SEQ (LETT |c| NIL . #24#)
                                    (LETT #18# |lc| . #24#) G190
                                    (COND
                                     ((OR (ATOM #18#)
                                          (PROGN
                                           (LETT |c| (CAR #18#) . #24#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #19#
                                            (CONS (SPADCALL |c| (QREFELT $ 69))
                                                  #19#)
                                            . #24#)))
                                    (LETT #18# (CDR #18#) . #24#) (GO G190)
                                    G191 (EXIT (NREVERSE #19#))))
                              0 (QREFELT $ 101))
                    . #24#)
              (LETT |dk|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 66) 1 (QREFELT $ 68)) |der|)
                     (QREFELT $ 102))
                    . #24#)
              (LETT |lba|
                    (PROGN
                     (LETT #17# NIL . #24#)
                     (SEQ (LETT |bv| NIL . #24#) (LETT #16# |cb| . #24#) G190
                          (COND
                           ((OR (ATOM #16#)
                                (PROGN (LETT |bv| (CAR #16#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17# (CONS (|spadConstant| $ 103) #17#)
                                  . #24#)))
                          (LETT #16# (CDR #16#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #17#))))
                    . #24#)
              (LETT |cba|
                    (PROGN
                     (LETT #15# NIL . #24#)
                     (SEQ (LETT |bv| NIL . #24#) (LETT #14# |cb| . #24#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |bv| (CAR #14#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15# (CONS (|spadConstant| $ 42) #15#)
                                  . #24#)))
                          (LETT #14# (CDR #14#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #15#))))
                    . #24#)
              (SEQ (LETT |j| |d| . #24#) G190 (COND ((< |j| 0) (GO G191)))
                   (SEQ (LETT |n1| (LENGTH |cb|) . #24#)
                        (LETT |lgj| NIL . #24#)
                        (SEQ (LETT |i| 1 . #24#) (LETT #13# |n| . #24#) G190
                             (COND ((|greater_SI| |i| #13#) (GO G191)))
                             (SEQ
                              (LETT |gi| (SPADCALL |vg2| |i| (QREFELT $ 104))
                                    . #24#)
                              (LETT |gij| (|spadConstant| $ 42) . #24#)
                              (COND
                               ((EQL (SPADCALL |gi| (QREFELT $ 69)) |j|)
                                (SEQ
                                 (LETT |gij| (SPADCALL |gi| (QREFELT $ 105))
                                       . #24#)
                                 (EXIT
                                  (SPADCALL |vg2| |i|
                                            (SPADCALL |gi| (QREFELT $ 106))
                                            (QREFELT $ 107))))))
                              (EXIT
                               (LETT |lgj|
                                     (CONS (SPADCALL |gij| (QREFELT $ 108))
                                           |lgj|)
                                     . #24#)))
                             (LETT |i| (|inc_SI| |i|) . #24#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |lgj| (NREVERSE |lgj|) . #24#)
                        (LETT |lgj1| NIL . #24#)
                        (SEQ (LETT |aa| NIL . #24#) (LETT #12# |cba| . #24#)
                             (LETT |bv| NIL . #24#) (LETT #11# |cb| . #24#)
                             G190
                             (COND
                              ((OR (ATOM #11#)
                                   (PROGN (LETT |bv| (CAR #11#) . #24#) NIL)
                                   (ATOM #12#)
                                   (PROGN (LETT |aa| (CAR #12#) . #24#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |ff|
                                    (SPADCALL
                                     (SPADCALL |bv| |lgj| (QREFELT $ 110))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (+ |j| 1) (QREFELT $ 46)) |dk|
                                       (QREFELT $ 111))
                                      |aa| (QREFELT $ 111))
                                     (QREFELT $ 112))
                                    . #24#)
                              (EXIT (LETT |lgj1| (CONS |ff| |lgj1|) . #24#)))
                             (LETT #11#
                                   (PROG1 (CDR #11#)
                                     (LETT #12# (CDR #12#) . #24#))
                                   . #24#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |lgj1| (NREVERSE |lgj1|) . #24#)
                        (LETT |s2f|
                              (SPADCALL |b| |lgj1| |x| |lk| |ext| |logi|
                                        (QREFELT $ 119))
                              . #24#)
                        (LETT |ncb|
                              (PROGN
                               (LETT #10# NIL . #24#)
                               (SEQ (LETT |be| NIL . #24#)
                                    (LETT #9# |s2f| . #24#) G190
                                    (COND
                                     ((OR (ATOM #9#)
                                          (PROGN
                                           (LETT |be| (CAR #9#) . #24#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #10#
                                            (CONS
                                             (SPADCALL (QCDR |be|) |cb|
                                                       (QREFELT $ 81))
                                             #10#)
                                            . #24#)))
                                    (LETT #9# (CDR #9#) . #24#) (GO G190) G191
                                    (EXIT (NREVERSE #10#))))
                              . #24#)
                        (LETT |cba|
                              (PROGN
                               (LETT #8# NIL . #24#)
                               (SEQ (LETT |be| NIL . #24#)
                                    (LETT #7# |s2f| . #24#) G190
                                    (COND
                                     ((OR (ATOM #7#)
                                          (PROGN
                                           (LETT |be| (CAR #7#) . #24#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #8# (CONS (QCAR |be|) #8#)
                                            . #24#)))
                                    (LETT #7# (CDR #7#) . #24#) (GO G190) G191
                                    (EXIT (NREVERSE #8#))))
                              . #24#)
                        (LETT |nlba|
                              (PROGN
                               (LETT #6# NIL . #24#)
                               (SEQ (LETT |be| NIL . #24#)
                                    (LETT #5# |s2f| . #24#) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN
                                           (LETT |be| (CAR #5#) . #24#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #6#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL (QCDR |be|) |lba|
                                                        (QREFELT $ 121))
                                              (SPADCALL
                                               (SPADCALL (QCAR |be|)
                                                         (PROG1
                                                             (LETT #4# |j|
                                                                   . #24#)
                                                           (|check_subtype2|
                                                            (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                                         (QREFELT $ 68))
                                               (QREFELT $ 74))
                                              (QREFELT $ 122))
                                             #6#)
                                            . #24#)))
                                    (LETT #5# (CDR #5#) . #24#) (GO G190) G191
                                    (EXIT (NREVERSE #6#))))
                              . #24#)
                        (LETT |cb| |ncb| . #24#)
                        (EXIT (LETT |lba| |nlba| . #24#)))
                   (LETT |j| (+ |j| -1) . #24#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #3# NIL . #24#)
                (SEQ (LETT |bv| NIL . #24#) (LETT #2# |cb| . #24#)
                     (LETT |ba| NIL . #24#) (LETT #1# |lba| . #24#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #24#) NIL)
                           (ATOM #2#) (PROGN (LETT |bv| (CAR #2#) . #24#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #3# (CONS (CONS |ba| |bv|) #3#) . #24#)))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #24#))
                           . #24#)
                     (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;do_ext|
        ((|ext| |Mapping|
          #1=(|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|lcr| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G939 NIL) (|be| NIL) (#3=#:G938 NIL) (|res1| #1#)
          (|lc| (|List| F)) (#4=#:G937 NIL) (|cr| NIL) (#5=#:G936 NIL))
         (SEQ
          (LETT |lc|
                (PROGN
                 (LETT #5# NIL . #6=(|RDEPAR;do_ext|))
                 (SEQ (LETT |cr| NIL . #6#) (LETT #4# |lcr| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |cr| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS (SPADCALL |cr| |k| (QREFELT $ 124)) #5#)
                              . #6#)))
                      (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |res1| (SPADCALL |lk| |lc| |ext|) . #6#)
          (EXIT
           (PROGN
            (LETT #3# NIL . #6#)
            (SEQ (LETT |be| NIL . #6#) (LETT #2# |res1| . #6#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |be| (CAR #2#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (CONS (SPADCALL (QCAR |be|) |k| (QREFELT $ 126))
                                (QCDR |be|))
                          #3#)
                         . #6#)))
                 (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;do_SPDE_prim|
        ((|a| |SparseUnivariatePolynomial| F)
         (|bbr| |Fraction| (|SparseUnivariatePolynomial| F))
         (|is_der| |Boolean|)
         (|lcr| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          #1=(|Record| (|:| |logands| #2=(|List| F))
                       (|:| |basis|
                            #3=(|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| (|Matrix| F) (|Matrix| F)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#4=#:G992 NIL) (|re| NIL) (#5=#:G991 NIL)
          (|res1|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F)))))
          (|do_degrad|
           (|Mapping|
            (|List|
             (|Record|
              (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
              (|:| |coeffs| (|Vector| F))))
            (|Fraction| (|SparseUnivariatePolynomial| F))
            (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|n| (|Integer|)) (|mu| (|Union| (|Integer|) "failed")) (|mf| (F))
          (|r0|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed"))
          (|f1| (F)) (|b1| (|SparseUnivariatePolynomial| F)) (|f0| (F))
          (|bvu| (|Union| (|Vector| (|Integer|)) "failed"))
          (|bv| (|Vector| (|Fraction| (|Integer|)))) (|bl| #3#) (|ll| #2#)
          (|#G86| #1#) (|dc| (|Integer|)) (#6=#:G990 NIL) (|c| NIL)
          (#7=#:G989 NIL) (|db| #8=(|NonNegativeInteger|)) (|da| #8#)
          (|lc| (|List| (|SparseUnivariatePolynomial| F))) (#9=#:G988 NIL)
          (|cr| NIL) (#10=#:G987 NIL) (|b| (|SparseUnivariatePolynomial| F))
          (|base_case| (|Boolean|)) (|fp| (F)))
         (SEQ
          (LETT |fp|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 66) 1 (QREFELT $ 68))
                           |der|)
                 (QREFELT $ 102))
                . #11=(|RDEPAR;do_SPDE_prim|))
          (LETT |base_case|
                (SPADCALL |fp| (|spadConstant| $ 66) (QREFELT $ 127)) . #11#)
          (LETT |b| (SPADCALL |bbr| (QREFELT $ 75)) . #11#)
          (LETT |lc|
                (PROGN
                 (LETT #10# NIL . #11#)
                 (SEQ (LETT |cr| NIL . #11#) (LETT #9# |lcr| . #11#) G190
                      (COND
                       ((OR (ATOM #9#)
                            (PROGN (LETT |cr| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (SPADCALL |cr| (QREFELT $ 75)) #10#)
                              . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |da| (SPADCALL |a| (QREFELT $ 69)) . #11#)
          (LETT |db| (SPADCALL |b| (QREFELT $ 69)) . #11#)
          (LETT |dc|
                (SPADCALL (ELT $ 99)
                          (PROGN
                           (LETT #7# NIL . #11#)
                           (SEQ (LETT |c| NIL . #11#) (LETT #6# |lc| . #11#)
                                G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |c| (CAR #6#) . #11#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS (SPADCALL |c| (QREFELT $ 69))
                                              #7#)
                                        . #11#)))
                                (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                                (EXIT (NREVERSE #7#))))
                          (QREFELT $ 128))
                . #11#)
          (COND
           ((NULL |base_case|)
            (COND
             ((EQL |da| 0)
              (COND
               ((EQL |db| 0)
                (EXIT
                 (SEQ
                  (LETT |b1|
                        (SPADCALL (SPADCALL |b| (QREFELT $ 102))
                                  (SPADCALL |a| (QREFELT $ 102))
                                  (QREFELT $ 129))
                        . #11#)
                  (EXIT
                   (COND
                    ((SPADCALL |b1| (|spadConstant| $ 42) (QREFELT $ 127))
                     (|RDEPAR;do_ext| |ext| |lcr| |k| |lk| $))
                    (#12='T
                     (SEQ
                      (COND
                       ((NULL |is_der|)
                        (SEQ
                         (PROGN
                          (LETT |#G86| (SPADCALL |lk| (LIST |b1|) |logi|)
                                . #11#)
                          (LETT |ll| (QCAR |#G86|) . #11#)
                          (LETT |bl| (QCDR |#G86|) . #11#)
                          |#G86|)
                         (EXIT
                          (COND
                           ((NULL (NULL |bl|))
                            (SEQ (LETT |bv| (|SPADfirst| |bl|) . #11#)
                                 (LETT |bvu| (|RDEPAR;integer_vector| |bv| $)
                                       . #11#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |bvu| 0)
                                    (|error|
                                     "need transform and call ext")))))))))))
                      (EXIT
                       (|RDEPAR;do_SPDE_prim0| |b1| |lc| |lk| |ext| |logi|
                        |der| |get_rs| |x| $))))))))))))))
          (LETT |n|
                (COND
                 ((SPADCALL |db| |da| (QREFELT $ 130)) (MAX 0 (- |dc| |db|)))
                 (#12# (MAX 0 (+ (- |dc| |da|) 1))))
                . #11#)
          (COND
           ((EQL |da| (+ |db| 1))
            (SEQ
             (LETT |f0|
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 105))
                              (SPADCALL |a| (QREFELT $ 105)) (QREFELT $ 129))
                    (QREFELT $ 108))
                   . #11#)
             (EXIT
              (COND
               (|base_case|
                (SEQ (LETT |mu| (SPADCALL |f0| (QREFELT $ 131)) . #11#)
                     (EXIT
                      (COND
                       ((QEQCAR |mu| 0)
                        (LETT |n| (MAX |n| (QCDR |mu|)) . #11#))))))
               (#12#
                (SEQ
                 (LETT |r0|
                       (QCAR
                        (SPADCALL
                         (SPADCALL |lk|
                                   (LIST (SPADCALL |f0| (QREFELT $ 108)) |fp|)
                                   |ext|)
                         (QREFELT $ 134)))
                       . #11#)
                 (EXIT
                  (COND
                   ((NULL (QEQCAR |r0| 1))
                    (SEQ
                     (LETT |mf| (SPADCALL (QCDR (QCDR |r0|)) 1 (QREFELT $ 135))
                           . #11#)
                     (LETT |mu| (SPADCALL |mf| (QREFELT $ 131)) . #11#)
                     (EXIT
                      (COND
                       ((QEQCAR |mu| 0)
                        (LETT |n| (MAX |n| (QCDR |mu|)) . #11#)))))))))))))))
          (COND
           ((NULL |base_case|)
            (COND
             ((EQL |da| |db|)
              (SEQ
               (LETT |f0|
                     (SPADCALL
                      (SPADCALL (SPADCALL |b| (QREFELT $ 105))
                                (SPADCALL |a| (QREFELT $ 105)) (QREFELT $ 129))
                      (QREFELT $ 108))
                     . #11#)
               (LETT |b1|
                     (SPADCALL (SPADCALL |f0| |a| (QREFELT $ 32)) |b|
                               (QREFELT $ 83))
                     . #11#)
               (EXIT
                (COND
                 ((EQL (+ (SPADCALL |b1| (QREFELT $ 69)) 1) |da|)
                  (SEQ
                   (LETT |f1|
                         (SPADCALL
                          (SPADCALL (SPADCALL |b1| (QREFELT $ 105))
                                    (SPADCALL |a| (QREFELT $ 105))
                                    (QREFELT $ 129))
                          (QREFELT $ 108))
                         . #11#)
                   (LETT |r0|
                         (QCAR
                          (SPADCALL
                           (SPADCALL |lk|
                                     (LIST (SPADCALL |f1| (QREFELT $ 108))
                                           |fp|)
                                     |ext|)
                           (QREFELT $ 134)))
                         . #11#)
                   (EXIT
                    (COND
                     ((NULL (QEQCAR |r0| 1))
                      (SEQ
                       (LETT |mf|
                             (SPADCALL (QCDR (QCDR |r0|)) 1 (QREFELT $ 135))
                             . #11#)
                       (LETT |mu| (SPADCALL |mf| (QREFELT $ 131)) . #11#)
                       (EXIT
                        (COND
                         ((QEQCAR |mu| 0)
                          (LETT |n| (MAX |n| (QCDR |mu|))
                                . #11#)))))))))))))))))
          (LETT |do_degrad|
                (CONS #'|RDEPAR;do_SPDE_prim!0|
                      (VECTOR |x| |get_rs| |der| |logi| |ext| |lk| |k| |is_der|
                              $))
                . #11#)
          (LETT |res1|
                (|RDEPAR;param_SPDE| |a| |b| |lc| |n| |der| |get_rs|
                 |do_degrad| |x| $)
                . #11#)
          (EXIT
           (PROGN
            (LETT #5# NIL . #11#)
            (SEQ (LETT |re| NIL . #11#) (LETT #4# |res1| . #11#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |re| (CAR #4#) . #11#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #5#
                         (CONS
                          (CONS (SPADCALL (QCAR |re|) (QREFELT $ 74))
                                (QCDR |re|))
                          #5#)
                         . #11#)))
                 (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                 (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |RDEPAR;do_SPDE_prim!0| ((|bb| NIL) (|lc1| NIL) ($$ NIL))
        (PROG ($ |is_der| |k| |lk| |ext| |logi| |der| |get_rs| |x|)
          (LETT $ (QREFELT $$ 8) . #1=(|RDEPAR;do_SPDE_prim|))
          (LETT |is_der| (QREFELT $$ 7) . #1#)
          (LETT |k| (QREFELT $$ 6) . #1#)
          (LETT |lk| (QREFELT $$ 5) . #1#)
          (LETT |ext| (QREFELT $$ 4) . #1#)
          (LETT |logi| (QREFELT $$ 3) . #1#)
          (LETT |der| (QREFELT $$ 2) . #1#)
          (LETT |get_rs| (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|RDEPAR;do_SPDE_prim| (|spadConstant| $ 70) |bb| |is_der| |lc1|
             |k| |lk| |ext| |logi| |der| |get_rs| |x| $))))) 

(SDEFUN |RDEPAR;do_SPDE_exp0|
        ((|a| F) (|b| F)
         (|lcr| |List|
          (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
         (|lk| |List| (|Kernel| F)) (|eta| F)
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G1036 NIL) (|re| NIL) (#2=#:G1037 NIL) (|bv| NIL)
          (#3=#:G1035 NIL) (|j| #4=(|Integer|))
          (|lba|
           (|List| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (|cb| (|List| (|Vector| F)))
          (|nlba|
           (|List| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (#5=#:G1034 NIL) (|be| NIL) (#6=#:G1033 NIL)
          (|ncb| (|List| (|Vector| F))) (#7=#:G1032 NIL) (#8=#:G1031 NIL)
          (|s2f|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgj1| (|List| F)) (|ff| (F)) (#9=#:G1030 NIL) (|lgj| (|List| F))
          (#10=#:G1020 NIL) (|gij| (F)) (|last_iter| (|Boolean|))
          (|gi| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (#11=#:G1029 NIL) (|i| NIL) (|n1| (|NonNegativeInteger|)) (|f0| (F))
          (|d| #4#) (#12=#:G1028 NIL) (|cr| NIL) (#13=#:G1027 NIL)
          (#14=#:G1026 NIL) (#15=#:G1025 NIL) (#16=#:G1023 NIL)
          (#17=#:G1024 NIL) (#18=#:G1022 NIL) (#19=#:G1021 NIL)
          (|vg2|
           (|Vector| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |lcr|) . #20=(|RDEPAR;do_SPDE_exp0|))
              (LETT |vg2| (SPADCALL |lcr| (QREFELT $ 138)) . #20#)
              (LETT |cb|
                    (PROGN
                     (LETT #19# NIL . #20#)
                     (SEQ (LETT |cr| NIL . #20#) (LETT #18# |lcr| . #20#) G190
                          (COND
                           ((OR (ATOM #18#)
                                (PROGN (LETT |cr| (CAR #18#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #19#
                                  (CONS (MAKEARR1 |n| (|spadConstant| $ 42))
                                        #19#)
                                  . #20#)))
                          (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #19#))))
                    . #20#)
              (SEQ (LETT |bv| NIL . #20#) (LETT #17# |cb| . #20#)
                   (LETT |i| 1 . #20#) (LETT #16# |n| . #20#) G190
                   (COND
                    ((OR (|greater_SI| |i| #16#) (ATOM #17#)
                         (PROGN (LETT |bv| (CAR #17#) . #20#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bv| |i| (|spadConstant| $ 66) (QREFELT $ 98))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|) (LETT #17# (CDR #17#) . #20#))
                         . #20#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |lba|
                    (PROGN
                     (LETT #15# NIL . #20#)
                     (SEQ (LETT |cr| NIL . #20#) (LETT #14# |lcr| . #20#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |cr| (CAR #14#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15# (CONS (|spadConstant| $ 139) #15#)
                                  . #20#)))
                          (LETT #14# (CDR #14#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #15#))))
                    . #20#)
              (LETT |d|
                    (SPADCALL (ELT $ 99)
                              (PROGN
                               (LETT #13# NIL . #20#)
                               (SEQ (LETT |cr| NIL . #20#)
                                    (LETT #12# |lcr| . #20#) G190
                                    (COND
                                     ((OR (ATOM #12#)
                                          (PROGN
                                           (LETT |cr| (CAR #12#) . #20#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #13#
                                            (CONS
                                             (SPADCALL |cr| (QREFELT $ 140))
                                             #13#)
                                            . #20#)))
                                    (LETT #12# (CDR #12#) . #20#) (GO G190)
                                    G191 (EXIT (NREVERSE #13#))))
                              (QREFELT $ 128))
                    . #20#)
              (LETT |j| |d| . #20#)
              (LETT |f0| (SPADCALL |b| |a| (QREFELT $ 129)) . #20#)
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |last_iter| 'T . #20#)
                          (LETT |n1| (LENGTH |cb|) . #20#)
                          (LETT |lgj| NIL . #20#)
                          (SEQ (LETT |i| 1 . #20#) (LETT #11# |n| . #20#) G190
                               (COND ((|greater_SI| |i| #11#) (GO G191)))
                               (SEQ
                                (LETT |gi| (SPADCALL |vg2| |i| (QREFELT $ 141))
                                      . #20#)
                                (LETT |gij| (|spadConstant| $ 42) . #20#)
                                (COND
                                 ((SPADCALL |gi| (|spadConstant| $ 139)
                                            (QREFELT $ 142))
                                  (SEQ (LETT |last_iter| NIL . #20#)
                                       (EXIT
                                        (COND
                                         ((EQL (SPADCALL |gi| (QREFELT $ 140))
                                               |j|)
                                          (SEQ
                                           (LETT |gij|
                                                 (SPADCALL |gi|
                                                           (QREFELT $ 143))
                                                 . #20#)
                                           (EXIT
                                            (SPADCALL |vg2| |i|
                                                      (SPADCALL |gi|
                                                                (QREFELT $
                                                                         144))
                                                      (QREFELT $ 145))))))))))
                                (EXIT (LETT |lgj| (CONS |gij| |lgj|) . #20#)))
                               (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            (|last_iter|
                             (PROGN
                              (LETT #10# |$NoValue| . #20#)
                              (GO #21=#:G1016)))
                            ('T
                             (SEQ (LETT |lgj| (NREVERSE |lgj|) . #20#)
                                  (LETT |lgj1| NIL . #20#)
                                  (SEQ (LETT |bv| NIL . #20#)
                                       (LETT #9# |cb| . #20#) G190
                                       (COND
                                        ((OR (ATOM #9#)
                                             (PROGN
                                              (LETT |bv| (CAR #9#) . #20#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |ff|
                                              (SPADCALL |bv| |lgj|
                                                        (QREFELT $ 110))
                                              . #20#)
                                        (EXIT
                                         (LETT |lgj1|
                                               (CONS
                                                (SPADCALL |ff| (QREFELT $ 108))
                                                |lgj1|)
                                               . #20#)))
                                       (LETT #9# (CDR #9#) . #20#) (GO G190)
                                       G191 (EXIT NIL))
                                  (LETT |lgj1| (NREVERSE |lgj1|) . #20#)
                                  (LETT |s2f|
                                        (SPADCALL
                                         (SPADCALL |f0|
                                                   (SPADCALL
                                                    (SPADCALL |j|
                                                              (QREFELT $ 46))
                                                    |eta| (QREFELT $ 111))
                                                   (QREFELT $ 112))
                                         |lgj1| |x| |lk| |ext| |logi|
                                         (QREFELT $ 119))
                                        . #20#)
                                  (LETT |ncb|
                                        (PROGN
                                         (LETT #8# NIL . #20#)
                                         (SEQ (LETT |be| NIL . #20#)
                                              (LETT #7# |s2f| . #20#) G190
                                              (COND
                                               ((OR (ATOM #7#)
                                                    (PROGN
                                                     (LETT |be| (CAR #7#)
                                                           . #20#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #8#
                                                      (CONS
                                                       (SPADCALL (QCDR |be|)
                                                                 |cb|
                                                                 (QREFELT $
                                                                          81))
                                                       #8#)
                                                      . #20#)))
                                              (LETT #7# (CDR #7#) . #20#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #8#))))
                                        . #20#)
                                  (LETT |nlba|
                                        (PROGN
                                         (LETT #6# NIL . #20#)
                                         (SEQ (LETT |be| NIL . #20#)
                                              (LETT #5# |s2f| . #20#) G190
                                              (COND
                                               ((OR (ATOM #5#)
                                                    (PROGN
                                                     (LETT |be| (CAR #5#)
                                                           . #20#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #6#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL (QCDR |be|)
                                                                  |lba|
                                                                  (QREFELT $
                                                                           146))
                                                        (SPADCALL (QCAR |be|)
                                                                  |j|
                                                                  (QREFELT $
                                                                           147))
                                                        (QREFELT $ 148))
                                                       #6#)
                                                      . #20#)))
                                              (LETT #5# (CDR #5#) . #20#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #6#))))
                                        . #20#)
                                  (LETT |cb| |ncb| . #20#)
                                  (LETT |lba| |nlba| . #20#)
                                  (EXIT (LETT |j| (- |j| 1) . #20#)))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #21# (EXIT #10#))
              (EXIT
               (PROGN
                (LETT #3# NIL . #20#)
                (SEQ (LETT |bv| NIL . #20#) (LETT #2# |cb| . #20#)
                     (LETT |re| NIL . #20#) (LETT #1# |lba| . #20#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |re| (CAR #1#) . #20#) NIL)
                           (ATOM #2#) (PROGN (LETT |bv| (CAR #2#) . #20#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #3#
                             (CONS (CONS (SPADCALL |re| (QREFELT $ 149)) |bv|)
                                   #3#)
                             . #20#)))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #20#))
                           . #20#)
                     (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;exp_lower_bound;SupLp2ILFMI;11|
        ((|a| |SparseUnivariatePolynomial| F)
         (|b| |LaurentPolynomial| F (|SparseUnivariatePolynomial| F))
         (|ob| |Integer|) (|nc0| |Integer|) (|lk| |List| (|Kernel| F))
         (|eta| F)
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |Integer|))
        (SPROG
         ((|nu| (|Union| (|Integer|) "failed"))
          (|bv| (|Vector| (|Fraction| (|Integer|))))
          (|bl| #1=(|List| (|Vector| (|Fraction| (|Integer|)))))
          (|ll| #2=(|List| F))
          (|#G116| (|Record| (|:| |logands| #2#) (|:| |basis| #1#))) (|c0| (F))
          (|n0| (|Integer|)))
         (SEQ
          (COND ((< |ob| 0) (MIN 0 (- |nc0| |ob|)))
                (#3='T
                 (SEQ
                  (LETT |n0| (MIN 0 |nc0|)
                        . #4=(|RDEPAR;exp_lower_bound;SupLp2ILFMI;11|))
                  (EXIT
                   (COND ((< 0 |ob|) |n0|)
                         (#3#
                          (SEQ
                           (LETT |c0|
                                 (SPADCALL (SPADCALL |b| 0 (QREFELT $ 150))
                                           (SPADCALL |a| 0 (QREFELT $ 151))
                                           (QREFELT $ 129))
                                 . #4#)
                           (PROGN
                            (LETT |#G116|
                                  (SPADCALL |lk| (LIST |c0| |eta|) |logi|)
                                  . #4#)
                            (LETT |ll| (QCAR |#G116|) . #4#)
                            (LETT |bl| (QCDR |#G116|) . #4#)
                            |#G116|)
                           (EXIT
                            (COND ((NULL |bl|) |n0|)
                                  (#3#
                                   (SEQ (LETT |bv| (|SPADfirst| |bl|) . #4#)
                                        (LETT |nu|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |bv| 2
                                                          (QREFELT $ 89))
                                                (SPADCALL |bv| 1
                                                          (QREFELT $ 89))
                                                (QREFELT $ 152))
                                               (QREFELT $ 40))
                                              . #4#)
                                        (EXIT
                                         (COND ((QEQCAR |nu| 1) |n0|)
                                               (#3#
                                                (MIN (QCDR |nu|)
                                                     |n0|)))))))))))))))))) 

(SDEFUN |RDEPAR;exp_upper_bound|
        ((|a| |SparseUnivariatePolynomial| F)
         (|b| |SparseUnivariatePolynomial| F) (|nc1| |Integer|)
         (|lk| |List| (|Kernel| F)) (|eta| F)
         (|logi| |Mapping|
          #1=(|Record| (|:| |logands| #2=(|List| F))
                       (|:| |basis|
                            #3=(|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |Integer|))
        (SPROG
         ((|nu| (|Union| (|Integer|) "failed"))
          (|bv| (|Vector| (|Fraction| (|Integer|)))) (|bl| #3#) (|ll| #2#)
          (|#G123| #1#) (|c1| (F)) (|n0| (|Integer|))
          (|db| #4=(|NonNegativeInteger|)) (|da| #4#))
         (SEQ
          (LETT |da| (SPADCALL |a| (QREFELT $ 69))
                . #5=(|RDEPAR;exp_upper_bound|))
          (LETT |db| (SPADCALL |b| (QREFELT $ 69)) . #5#)
          (EXIT
           (COND ((< |da| |db|) (- |nc1| |db|))
                 (#6='T
                  (SEQ (LETT |n0| (MAX 0 (- |nc1| |da|)) . #5#)
                       (EXIT
                        (COND ((< |db| |da|) |n0|)
                              (#6#
                               (SEQ
                                (LETT |c1|
                                      (SPADCALL (SPADCALL |b| (QREFELT $ 105))
                                                (SPADCALL |a| (QREFELT $ 105))
                                                (QREFELT $ 129))
                                      . #5#)
                                (PROGN
                                 (LETT |#G123|
                                       (SPADCALL |lk| (LIST |c1| |eta|) |logi|)
                                       . #5#)
                                 (LETT |ll| (QCAR |#G123|) . #5#)
                                 (LETT |bl| (QCDR |#G123|) . #5#)
                                 |#G123|)
                                (EXIT
                                 (COND ((NULL |bl|) |n0|)
                                       (#6#
                                        (SEQ
                                         (LETT |bv| (|SPADfirst| |bl|) . #5#)
                                         (LETT |nu|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |bv| 2
                                                           (QREFELT $ 89))
                                                 (SPADCALL |bv| 1
                                                           (QREFELT $ 89))
                                                 (QREFELT $ 152))
                                                (QREFELT $ 40))
                                               . #5#)
                                         (EXIT
                                          (COND ((QEQCAR |nu| 1) |n0|)
                                                (#6#
                                                 (MAX (QCDR |nu|)
                                                      |n0|))))))))))))))))))) 

(SDEFUN |RDEPAR;do_SPDE_exp|
        ((|a| |SparseUnivariatePolynomial| F)
         (|bbr| |Fraction| (|SparseUnivariatePolynomial| F))
         (|lcr| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| (|Matrix| F) (|Matrix| F)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G1111 NIL) (|re| NIL) (#2=#:G1110 NIL)
          (|tt| (|Fraction| (|SparseUnivariatePolynomial| F))) (#3=#:G1096 NIL)
          (|res1|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F)))))
          (|do_degrad|
           (|Mapping|
            (|List|
             (|Record|
              (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
              (|:| |coeffs| (|Vector| F))))
            (|Fraction| (|SparseUnivariatePolynomial| F))
            (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|n1| (|Integer|)) (|nc1| #4=(|Integer|)) (#5=#:G1109 NIL) (|cu| NIL)
          (#6=#:G1108 NIL) (|lcu| (|List| #7=(|SparseUnivariatePolynomial| F)))
          (#8=#:G1107 NIL) (|c| NIL) (#9=#:G1106 NIL)
          (|lc|
           (|List|
            #10=(|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (#11=#:G1105 NIL) (#12=#:G1104 NIL)
          (|t1| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (#13=#:G1074 NIL) (|m0| (|Integer|)) (|bu| #7#) (|b| #10#)
          (#14=#:G1072 NIL) (|n0| (|Integer|)) (|eta| (F)) (#15=#:G1060 NIL)
          (|nc0| #4#) (#16=#:G1103 NIL) (#17=#:G1102 NIL) (|nb0| (|Integer|))
          (#18=#:G1101 NIL) (|cr| NIL) (#19=#:G1100 NIL))
         (SEQ
          (LETT |b| (|RDEPAR;RF_to_GP| |bbr| $) . #20=(|RDEPAR;do_SPDE_exp|))
          (LETT |lc|
                (PROGN
                 (LETT #19# NIL . #20#)
                 (SEQ (LETT |cr| NIL . #20#) (LETT #18# |lcr| . #20#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |cr| (CAR #18#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #19# (CONS (|RDEPAR;RF_to_GP| |cr| $) #19#)
                              . #20#)))
                      (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #19#))))
                . #20#)
          (LETT |nb0| (SPADCALL |b| (QREFELT $ 154)) . #20#)
          (LETT |nc0|
                (SPADCALL (ELT $ 155)
                          (PROGN
                           (LETT #17# NIL . #20#)
                           (SEQ (LETT |c| NIL . #20#) (LETT #16# |lc| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #16#)
                                      (PROGN (LETT |c| (CAR #16#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #17#
                                        (CONS (SPADCALL |c| (QREFELT $ 154))
                                              #17#)
                                        . #20#)))
                                (LETT #16# (CDR #16#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #17#))))
                          (QREFELT $ 128))
                . #20#)
          (LETT |eta|
                (SPADCALL
                 (PROG2
                     (LETT #15#
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 66) 1 (QREFELT $ 68))
                             |der|)
                            (SPADCALL (|spadConstant| $ 66) 1 (QREFELT $ 68))
                            (QREFELT $ 21))
                           . #20#)
                     (QCDR #15#)
                   (|check_union2| (QEQCAR #15# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   (|Union|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 7))
                                    "failed")
                                   #15#))
                 (QREFELT $ 102))
                . #20#)
          (COND
           ((EQL (SPADCALL |a| (QREFELT $ 69)) 0)
            (COND
             ((EQL (SPADCALL |b| (QREFELT $ 140)) 0)
              (COND
               ((EQL |nb0| 0)
                (EXIT
                 (|RDEPAR;do_SPDE_exp0| (SPADCALL |a| (QREFELT $ 102))
                  (SPADCALL |b| (QREFELT $ 156)) |lc| |lk| |eta| |ext| |logi|
                  |x| $))))))))
          (LETT |n0|
                (SPADCALL |a| |b| |nb0| |nc0| |lk| |eta| |logi|
                          (QREFELT $ 153))
                . #20#)
          (COND
           ((< |n0| 0)
            (LETT |b|
                  (SPADCALL |b|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |n0| (QREFELT $ 46)) |eta|
                                        (QREFELT $ 111))
                              (QREFELT $ 157))
                             (SPADCALL |a| (QREFELT $ 48)) (QREFELT $ 158))
                            (QREFELT $ 148))
                  . #20#)))
          (COND
           ((< |nb0| 0)
            (SEQ
             (LETT |t1|
                   (SPADCALL (|spadConstant| $ 66)
                             (PROG1 (LETT #14# (- |nb0|) . #20#)
                               (|check_subtype2| (>= #14# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #14#))
                             (QREFELT $ 68))
                   . #20#)
             (LETT |b|
                   (SPADCALL (SPADCALL |t1| (QREFELT $ 48)) |b|
                             (QREFELT $ 158))
                   . #20#)
             (EXIT (LETT |a| (SPADCALL |t1| |a| (QREFELT $ 82)) . #20#)))))
          (LETT |bu| (SPADCALL |b| (QREFELT $ 159)) . #20#)
          (LETT |m0| (+ (MIN 0 |n0|) (MIN 0 |nb0|)) . #20#)
          (COND
           ((< |m0| 0)
            (SEQ
             (LETT |t1|
                   (SPADCALL (|spadConstant| $ 66)
                             (PROG1 (LETT #13# (- |m0|) . #20#)
                               (|check_subtype2| (>= #13# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #13#))
                             (QREFELT $ 147))
                   . #20#)
             (EXIT
              (LETT |lc|
                    (PROGN
                     (LETT #12# NIL . #20#)
                     (SEQ (LETT |c| NIL . #20#) (LETT #11# |lc| . #20#) G190
                          (COND
                           ((OR (ATOM #11#)
                                (PROGN (LETT |c| (CAR #11#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12#
                                  (CONS (SPADCALL |t1| |c| (QREFELT $ 158))
                                        #12#)
                                  . #20#)))
                          (LETT #11# (CDR #11#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #20#)))))
          (LETT |lcu|
                (PROGN
                 (LETT #9# NIL . #20#)
                 (SEQ (LETT |c| NIL . #20#) (LETT #8# |lc| . #20#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |c| (CAR #8#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9# (CONS (SPADCALL |c| (QREFELT $ 159)) #9#)
                              . #20#)))
                      (LETT #8# (CDR #8#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #20#)
          (LETT |nc1|
                (SPADCALL (ELT $ 99)
                          (PROGN
                           (LETT #6# NIL . #20#)
                           (SEQ (LETT |cu| NIL . #20#) (LETT #5# |lcu| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |cu| (CAR #5#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS (SPADCALL |cu| (QREFELT $ 69))
                                              #6#)
                                        . #20#)))
                                (LETT #5# (CDR #5#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          (QREFELT $ 128))
                . #20#)
          (LETT |n1|
                (|RDEPAR;exp_upper_bound| |a| |bu| |nc1| |lk| |eta| |logi| $)
                . #20#)
          (LETT |do_degrad|
                (CONS #'|RDEPAR;do_SPDE_exp!0|
                      (VECTOR |x| |logi| |ext| |eta| |lk| $))
                . #20#)
          (LETT |res1|
                (|RDEPAR;param_SPDE| |a| |bu| |lcu| |n1| |der| |get_rs|
                 |do_degrad| |x| $)
                . #20#)
          (LETT |tt|
                (COND
                 ((< |n0| 0)
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 66)
                             (PROG1 (LETT #3# (- |n0|) . #20#)
                               (|check_subtype2| (>= #3# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #3#))
                             (QREFELT $ 68))
                   (QREFELT $ 74)))
                 ('T (|spadConstant| $ 160)))
                . #20#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #20#)
            (SEQ (LETT |re| NIL . #20#) (LETT #1# |res1| . #20#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |re| (CAR #1#) . #20#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (CONS
                           (SPADCALL (SPADCALL (QCAR |re|) (QREFELT $ 74)) |tt|
                                     (QREFELT $ 161))
                           (QCDR |re|))
                          #2#)
                         . #20#)))
                 (LETT #1# (CDR #1#) . #20#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |RDEPAR;do_SPDE_exp!0| ((|bb| NIL) (|lc1| NIL) ($$ NIL))
        (PROG ($ |lk| |eta| |ext| |logi| |x|)
          (LETT $ (QREFELT $$ 5) . #1=(|RDEPAR;do_SPDE_exp|))
          (LETT |lk| (QREFELT $$ 4) . #1#)
          (LETT |eta| (QREFELT $$ 3) . #1#)
          (LETT |ext| (QREFELT $$ 2) . #1#)
          (LETT |logi| (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1090 NIL) (|c1| NIL) (#3=#:G1089 NIL))
                   (SEQ
                    (|RDEPAR;do_SPDE_exp0| (|spadConstant| $ 66)
                     (SPADCALL (SPADCALL |bb| (QREFELT $ 22)) (QREFELT $ 102))
                     (PROGN
                      (LETT #3# NIL NIL)
                      (SEQ (LETT |c1| NIL NIL) (LETT #2# |lc1| NIL) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |c1| (CAR #2#) NIL) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3# (CONS (|RDEPAR;RF_to_GP| |c1| $) #3#)
                                   NIL)))
                           (LETT #2# (CDR #2#) NIL) (GO G190) G191
                           (EXIT (NREVERSE #3#))))
                     |lk| |eta| |ext| |logi| |x| $))))))) 

(SDEFUN |RDEPAR;param_rde;I2FLSLMMR;14|
        ((|m| |Integer|) (|f| F) (|g0| F) (|lg| |List| F) (|x| |Symbol|)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |Record|
          (|:| |particular|
               (|Union|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                "failed"))
          (|:| |basis|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))))
        (SPROG
         ((|res1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lg1| (|List| F)))
         (SEQ
          (LETT |lg1| (CONS (SPADCALL |g0| (QREFELT $ 108)) |lg|)
                . #1=(|RDEPAR;param_rde;I2FLSLMMR;14|))
          (LETT |res1|
                (SPADCALL |m| |f| |lg1| |x| |lk| |ext| |logi| (QREFELT $ 162))
                . #1#)
          (EXIT (SPADCALL |res1| (QREFELT $ 134)))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15|
        ((|fp| F) (|lg| |List| F) (|x| |Symbol|) (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G1178 NIL) (|rs| NIL) (#2=#:G1177 NIL)
          (|res1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lg1| (|List| F)) (#3=#:G1176 NIL) (|g| NIL) (#4=#:G1175 NIL)
          (|pf| (F)) (|p| (|SparseUnivariatePolynomial| F)) (#5=#:G1158 NIL)
          (|fpu| #6=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ni| (|Integer|)) (|pii| (|SparseUnivariatePolynomial| F))
          (|#G156|
           #7=(|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                        (|:| |xpnt| (|Integer|))))
          (#8=#:G1174 NIL) (|re| NIL) (|rl| (|List| #7#))
          (|der1|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|denfp| (|SparseUnivariatePolynomial| F))
          (|dk| (|SparseUnivariatePolynomial| F)) (|dku| #6#) (#9=#:G1173 NIL)
          (|k1| NIL) (#10=#:G1172 NIL) (|k| (|Kernel| F)))
         (SEQ
          (LETT |k| (SPADCALL |lk| (QREFELT $ 165))
                . #11=(|RDEPAR;param_rde2;FLSLMML;15|))
          (LETT |lk|
                (PROGN
                 (LETT #10# NIL . #11#)
                 (SEQ (LETT |k1| NIL . #11#) (LETT #9# |lk| . #11#) G190
                      (COND
                       ((OR (ATOM #9#)
                            (PROGN (LETT |k1| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |k1| |k| (QREFELT $ 166))
                          (LETT #10# (CONS |k1| #10#) . #11#)))))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |k| (QREFELT $ 168)) '|%alg| (QREFELT $ 169))
             (|RDEPAR;do_alg_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| $))
            ((SPADCALL |k| '|%diff| (QREFELT $ 170))
             (|RDEPAR;do_diff_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| $))
            (#12='T
             (SEQ
              (LETT |dku|
                    (SPADCALL
                     (SPADCALL (SPADCALL |k| (QREFELT $ 31)) |x|
                               (QREFELT $ 171))
                     |k| (QREFELT $ 126))
                    . #11#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |dku| (QREFELT $ 13))
                           (|spadConstant| $ 70) (QREFELT $ 71))
                 NIL)
                (#12#
                 (SEQ (LETT |dk| (SPADCALL |dku| (QREFELT $ 22)) . #11#)
                      (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 126)) . #11#)
                      (LETT |denfp| (SPADCALL |fpu| (QREFELT $ 13)) . #11#)
                      (LETT |der1|
                            (CONS #'|RDEPAR;param_rde2;FLSLMML;15!1|
                                  (VECTOR |dk| |x| $))
                            . #11#)
                      (LETT |rl| (|RDEPAR;normalize| |fpu| |der1| $) . #11#)
                      (LETT |p| (|spadConstant| $ 70) . #11#)
                      (SEQ (LETT |re| NIL . #11#) (LETT #8# |rl| . #11#) G190
                           (COND
                            ((OR (ATOM #8#)
                                 (PROGN (LETT |re| (CAR #8#) . #11#) NIL))
                             (GO G191)))
                           (SEQ
                            (PROGN
                             (LETT |#G156| |re| . #11#)
                             (LETT |pii| (QCAR |#G156|) . #11#)
                             (LETT |ni| (QCDR |#G156|) . #11#)
                             |#G156|)
                            (LETT |fpu|
                                  (SPADCALL |fpu|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |ni| (QREFELT $ 46))
                                              (SPADCALL |pii| |der1|)
                                              (QREFELT $ 32))
                                             |pii| (QREFELT $ 174))
                                            (QREFELT $ 175))
                                  . #11#)
                            (EXIT
                             (LETT |p|
                                   (SPADCALL
                                    (SPADCALL |pii|
                                              (PROG1 (LETT #5# |ni| . #11#)
                                                (|check_subtype2| (>= #5# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #5#))
                                              (QREFELT $ 176))
                                    |p| (QREFELT $ 82))
                                   . #11#)))
                           (LETT #8# (CDR #8#) . #11#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |fp| (SPADCALL |fpu| |k| (QREFELT $ 124)) . #11#)
                      (LETT |pf|
                            (SPADCALL (SPADCALL |p| (QREFELT $ 74)) |k|
                                      (QREFELT $ 124))
                            . #11#)
                      (LETT |lg1|
                            (PROGN
                             (LETT #4# NIL . #11#)
                             (SEQ (LETT |g| NIL . #11#) (LETT #3# |lg| . #11#)
                                  G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN
                                         (LETT |g| (CAR #3#) . #11#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL |pf| |g| (QREFELT $ 111))
                                           #4#)
                                          . #11#)))
                                  (LETT #3# (CDR #3#) . #11#) (GO G190) G191
                                  (EXIT (NREVERSE #4#))))
                            . #11#)
                      (LETT |res1|
                            (|RDEPAR;do_param_rde| |fp| NIL |lg1| |x| |k| |lk|
                             |ext| |logi| $)
                            . #11#)
                      (EXIT
                       (PROGN
                        (LETT #2# NIL . #11#)
                        (SEQ (LETT |rs| NIL . #11#) (LETT #1# |res1| . #11#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |rs| (CAR #1#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (CONS
                                       (SPADCALL (QCAR |rs|) |pf|
                                                 (QREFELT $ 129))
                                       (QCDR |rs|))
                                      #2#)
                                     . #11#)))
                             (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))))))))))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15!1| ((|z1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|RDEPAR;param_rde2;FLSLMML;15|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEPAR;param_rde2;FLSLMML;15!0|
                                   (VECTOR $ |x|))
                             |dk| (QREFELT $ 173))))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 171)))))) 

(SDEFUN |RDEPAR;csolve1|
        ((|m| |Matrix| F) (|d1| |Mapping| F F) ($ |List| (|Vector| F)))
        (SPADCALL |m| (LIST |d1|) (QREFELT $ 179))) 

(SDEFUN |RDEPAR;do_diff_rde1|
        ((|lg| |List| (|SparseUnivariatePolynomial| F)) (|fp0| F) (|fp1| F)
         (|x| |Symbol|) (|k| |Kernel| F) (|lk| |List| #1=(|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G1276 NIL) (|ba| NIL) (#3=#:G1277 NIL) (|bv| NIL)
          (#4=#:G1275 NIL) (|nlca| (|List| F)) (#5=#:G1273 NIL)
          (#6=#:G1274 NIL) (|ca| NIL) (#7=#:G1272 NIL)
          (|ncb| (|List| (|Vector| F))) (#8=#:G1271 NIL) (#9=#:G1270 NIL)
          (|elca| (|List| F)) (#10=#:G1269 NIL) (|be| NIL) (#11=#:G1268 NIL)
          (|cb1| (|List| (|Vector| F))) (#12=#:G1267 NIL) (#13=#:G1266 NIL)
          (|res2|
           #14=(|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lk3| (|List| #1#)) (#15=#:G1265 NIL) (|ki| NIL) (#16=#:G1264 NIL)
          (|kk3| #17=(|Kernel| F)) (#18=#:G1263 NIL) (#19=#:G1262 NIL)
          (|m3| (|Matrix| F)) (|nlg| (|List| F)) (|ng| (F)) (#20=#:G1240 NIL)
          (|nu| (|SparseUnivariatePolynomial| F))
          (|du| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (#21=#:G1259 NIL) (#22=#:G1260 NIL) (|g1| NIL) (#23=#:G1261 NIL)
          (|g0| NIL) (|lca| (|List| F)) (|nlg0| (|List| F)) (#24=#:G1258 NIL)
          (#25=#:G1257 NIL) (|lg3| (|List| F)) (#26=#:G1256 NIL)
          (#27=#:G1255 NIL) (|v3| (|Vector| F)) (|v2| (|Vector| F))
          (#28=#:G1254 NIL) (#29=#:G1253 NIL) (|cb| #30=(|List| (|Vector| F)))
          (|m2| #31=(|Matrix| F))
          (|#G175| (|Record| (|:| |transform| #31#) (|:| |basis| #30#)))
          (|d1| (|Mapping| F F)) (|cb0| (|List| (|Vector| F)))
          (#32=#:G1252 NIL) (#33=#:G1251 NIL) (|res1| #14#)
          (|lk2| (|List| #34=(|Kernel| F))) (#35=#:G1250 NIL) (#36=#:G1249 NIL)
          (|kk1| #17#)
          (|logi1|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|Kernel| F)) (|List| F)))
          (|ext1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|Kernel| F)) (|List| F)))
          (|lk1| (|List| #34#)) (|lek| (|List| F)) (#37=#:G1248 NIL)
          (#38=#:G1247 NIL) (|fp2| (F)) (|lg2| (|List| F)) (#39=#:G1246 NIL)
          (|g| NIL) (#40=#:G1245 NIL) (|dvf| (F)) (|dv| (|Symbol|)) (|k1| (F))
          (|lg1| (|List| F)) (#41=#:G1244 NIL) (|up| NIL) (#42=#:G1243 NIL)
          (|lg0| (|List| F)) (#43=#:G1242 NIL) (#44=#:G1241 NIL) (|da3| (F))
          (|arg3| (F)) (|args| (|List| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |args| (SPADCALL |k| (QREFELT $ 180))
                  . #45=(|RDEPAR;do_diff_rde1|))
            (EXIT
             (COND
              ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 88))
               (|error| "internal error, k is not a diff"))
              (#46='T
               (SEQ (LETT |arg3| (SPADCALL |args| 3 (QREFELT $ 181)) . #45#)
                    (LETT |da3| (SPADCALL |arg3| |x| (QREFELT $ 171)) . #45#)
                    (EXIT
                     (COND
                      ((SPADCALL |da3| (|spadConstant| $ 42) (QREFELT $ 127))
                       NIL)
                      (#46#
                       (SEQ
                        (LETT |lg0|
                              (PROGN
                               (LETT #44# NIL . #45#)
                               (SEQ (LETT |up| NIL . #45#)
                                    (LETT #43# |lg| . #45#) G190
                                    (COND
                                     ((OR (ATOM #43#)
                                          (PROGN
                                           (LETT |up| (CAR #43#) . #45#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #44#
                                            (CONS
                                             (SPADCALL |up| 0 (QREFELT $ 151))
                                             #44#)
                                            . #45#)))
                                    (LETT #43# (CDR #43#) . #45#) (GO G190)
                                    G191 (EXIT (NREVERSE #44#))))
                              . #45#)
                        (LETT |lg1|
                              (PROGN
                               (LETT #42# NIL . #45#)
                               (SEQ (LETT |up| NIL . #45#)
                                    (LETT #41# |lg| . #45#) G190
                                    (COND
                                     ((OR (ATOM #41#)
                                          (PROGN
                                           (LETT |up| (CAR #41#) . #45#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #42#
                                            (CONS
                                             (SPADCALL |up| 1 (QREFELT $ 151))
                                             #42#)
                                            . #45#)))
                                    (LETT #41# (CDR #41#) . #45#) (GO G190)
                                    G191 (EXIT (NREVERSE #42#))))
                              . #45#)
                        (LETT |k1|
                              (SPADCALL (SPADCALL |args| 1 (QREFELT $ 181))
                                        (SPADCALL
                                         (SPADCALL |args| 2 (QREFELT $ 181))
                                         (QREFELT $ 182))
                                        |arg3| (QREFELT $ 183))
                              . #45#)
                        (LETT |dv| (SPADCALL (QREFELT $ 27)) . #45#)
                        (LETT |dvf| (SPADCALL |dv| (QREFELT $ 184)) . #45#)
                        (LETT |lg2|
                              (PROGN
                               (LETT #40# NIL . #45#)
                               (SEQ (LETT |g| NIL . #45#)
                                    (LETT #39# |lg1| . #45#) G190
                                    (COND
                                     ((OR (ATOM #39#)
                                          (PROGN
                                           (LETT |g| (CAR #39#) . #45#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #40#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |g| |da3|
                                                        (QREFELT $ 129))
                                              |k1| |dvf| (QREFELT $ 185))
                                             #40#)
                                            . #45#)))
                                    (LETT #39# (CDR #39#) . #45#) (GO G190)
                                    G191 (EXIT (NREVERSE #40#))))
                              . #45#)
                        (LETT |fp2|
                              (SPADCALL (SPADCALL |fp1| |da3| (QREFELT $ 129))
                                        |k1| |dvf| (QREFELT $ 185))
                              . #45#)
                        (LETT |lek|
                              (PROGN
                               (LETT #38# NIL . #45#)
                               (SEQ (LETT |ki| NIL . #45#)
                                    (LETT #37# |lk| . #45#) G190
                                    (COND
                                     ((OR (ATOM #37#)
                                          (PROGN
                                           (LETT |ki| (CAR #37#) . #45#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #38#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |ki| (QREFELT $ 31))
                                              |k1| |dvf| (QREFELT $ 185))
                                             #38#)
                                            . #45#)))
                                    (LETT #37# (CDR #37#) . #45#) (GO G190)
                                    G191 (EXIT (NREVERSE #38#))))
                              . #45#)
                        (LETT |lk1|
                              (SPADCALL
                               (SPADCALL
                                (CONS |dvf|
                                      (SPADCALL |lg2| |lek| (QREFELT $ 186)))
                                (QREFELT $ 188))
                               |dv| (QREFELT $ 189))
                              . #45#)
                        (LETT |ext1|
                              (CONS #'|RDEPAR;do_diff_rde1!0| (VECTOR $ |dv|))
                              . #45#)
                        (LETT |logi1|
                              (CONS #'|RDEPAR;do_diff_rde1!1| (VECTOR $ |dv|))
                              . #45#)
                        (LETT |kk1| (SPADCALL |lk1| (QREFELT $ 165)) . #45#)
                        (LETT |lk2|
                              (PROGN
                               (LETT #36# NIL . #45#)
                               (SEQ (LETT |ki| NIL . #45#)
                                    (LETT #35# |lk1| . #45#) G190
                                    (COND
                                     ((OR (ATOM #35#)
                                          (PROGN
                                           (LETT |ki| (CAR #35#) . #45#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |ki| |kk1| (QREFELT $ 166))
                                        (LETT #36# (CONS |ki| #36#) . #45#)))))
                                    (LETT #35# (CDR #35#) . #45#) (GO G190)
                                    G191 (EXIT (NREVERSE #36#))))
                              . #45#)
                        (LETT |res1|
                              (COND
                               ((SPADCALL |fp2| (|spadConstant| $ 42)
                                          (QREFELT $ 127))
                                (SPADCALL |lk1| |lg2| |ext1|))
                               (#46#
                                (|RDEPAR;do_param_rde| |fp2| 'T |lg2| |dv|
                                 |kk1| |lk2| |ext1| |logi1| $)))
                              . #45#)
                        (EXIT
                         (COND ((NULL |res1|) NIL)
                               (#46#
                                (SEQ
                                 (LETT |cb0|
                                       (PROGN
                                        (LETT #33# NIL . #45#)
                                        (SEQ (LETT |be| NIL . #45#)
                                             (LETT #32# |res1| . #45#) G190
                                             (COND
                                              ((OR (ATOM #32#)
                                                   (PROGN
                                                    (LETT |be| (CAR #32#)
                                                          . #45#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #33#
                                                     (CONS (QCDR |be|) #33#)
                                                     . #45#)))
                                             (LETT #32# (CDR #32#) . #45#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #33#))))
                                       . #45#)
                                 (LETT |d1|
                                       (CONS #'|RDEPAR;do_diff_rde1!2|
                                             (VECTOR $ |x|))
                                       . #45#)
                                 (PROGN
                                  (LETT |#G175|
                                        (SPADCALL |cb0| (LIST |d1|)
                                                  (QREFELT $ 194))
                                        . #45#)
                                  (LETT |m2| (QCAR |#G175|) . #45#)
                                  (LETT |cb| (QCDR |#G175|) . #45#)
                                  |#G175|)
                                 (EXIT
                                  (COND ((NULL |cb|) NIL)
                                        (#46#
                                         (SEQ
                                          (LETT |v2|
                                                (SPADCALL
                                                 (PROGN
                                                  (LETT #29# NIL . #45#)
                                                  (SEQ (LETT |be| NIL . #45#)
                                                       (LETT #28# |res1|
                                                             . #45#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #28#)
                                                             (PROGN
                                                              (LETT |be|
                                                                    (CAR #28#)
                                                                    . #45#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #29#
                                                               (CONS
                                                                (QCAR |be|)
                                                                #29#)
                                                               . #45#)))
                                                       (LETT #28# (CDR #28#)
                                                             . #45#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #29#))))
                                                 (QREFELT $ 195))
                                                . #45#)
                                          (LETT |v3|
                                                (SPADCALL |m2| |v2|
                                                          (QREFELT $ 196))
                                                . #45#)
                                          (LETT |lca|
                                                (SPADCALL |v3| (QREFELT $ 197))
                                                . #45#)
                                          (LETT |lg3|
                                                (PROGN
                                                 (LETT #27# NIL . #45#)
                                                 (SEQ (LETT |bv| NIL . #45#)
                                                      (LETT #26# |cb| . #45#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #26#)
                                                            (PROGN
                                                             (LETT |bv|
                                                                   (CAR #26#)
                                                                   . #45#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #27#
                                                              (CONS
                                                               (SPADCALL |bv|
                                                                         |lg1|
                                                                         (QREFELT
                                                                          $
                                                                          110))
                                                               #27#)
                                                              . #45#)))
                                                      (LETT #26# (CDR #26#)
                                                            . #45#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #27#))))
                                                . #45#)
                                          (LETT |nlg0|
                                                (PROGN
                                                 (LETT #25# NIL . #45#)
                                                 (SEQ (LETT |bv| NIL . #45#)
                                                      (LETT #24# |cb| . #45#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #24#)
                                                            (PROGN
                                                             (LETT |bv|
                                                                   (CAR #24#)
                                                                   . #45#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #25#
                                                              (CONS
                                                               (SPADCALL |bv|
                                                                         |lg0|
                                                                         (QREFELT
                                                                          $
                                                                          110))
                                                               #25#)
                                                              . #45#)))
                                                      (LETT #24# (CDR #24#)
                                                            . #45#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #25#))))
                                                . #45#)
                                          (LETT |lca|
                                                (SPADCALL
                                                 (CONS
                                                  #'|RDEPAR;do_diff_rde1!3|
                                                  (VECTOR |k1| $ |dv|))
                                                 |lca| (QREFELT $ 198))
                                                . #45#)
                                          (LETT |nlg| NIL . #45#)
                                          (SEQ (LETT |g0| NIL . #45#)
                                               (LETT #23# |nlg0| . #45#)
                                               (LETT |g1| NIL . #45#)
                                               (LETT #22# |lg3| . #45#)
                                               (LETT |ca| NIL . #45#)
                                               (LETT #21# |lca| . #45#) G190
                                               (COND
                                                ((OR (ATOM #21#)
                                                     (PROGN
                                                      (LETT |ca| (CAR #21#)
                                                            . #45#)
                                                      NIL)
                                                     (ATOM #22#)
                                                     (PROGN
                                                      (LETT |g1| (CAR #22#)
                                                            . #45#)
                                                      NIL)
                                                     (ATOM #23#)
                                                     (PROGN
                                                      (LETT |g0| (CAR #23#)
                                                            . #45#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |du|
                                                      (SPADCALL
                                                       (SPADCALL |ca| |x|
                                                                 (QREFELT $
                                                                          171))
                                                       |k| (QREFELT $ 126))
                                                      . #45#)
                                                (LETT |nu|
                                                      (SPADCALL |du|
                                                                (QREFELT $ 22))
                                                      . #45#)
                                                (COND
                                                 ((OR
                                                   (SPADCALL
                                                    (SPADCALL |du|
                                                              (QREFELT $ 13))
                                                    (|spadConstant| $ 70)
                                                    (QREFELT $ 71))
                                                   (SPADCALL
                                                    (SPADCALL |nu|
                                                              (QREFELT $ 69))
                                                    1 (QREFELT $ 130)))
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #20# NIL . #45#)
                                                    (GO #47=#:G1239)))))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |g1|
                                                               (SPADCALL |fp1|
                                                                         |ca|
                                                                         (QREFELT
                                                                          $
                                                                          111))
                                                               (QREFELT $ 112))
                                                     (SPADCALL |nu| 1
                                                               (QREFELT $ 151))
                                                     (QREFELT $ 112))
                                                    (|spadConstant| $ 42)
                                                    (QREFELT $ 199))
                                                   (PROGN
                                                    (LETT #20# NIL . #45#)
                                                    (GO #47#)))
                                                  ('T
                                                   (SEQ
                                                    (LETT |ng|
                                                          (SPADCALL
                                                           (SPADCALL |g0|
                                                                     (SPADCALL
                                                                      |fp0|
                                                                      |ca|
                                                                      (QREFELT
                                                                       $ 111))
                                                                     (QREFELT $
                                                                              112))
                                                           (SPADCALL |nu| 0
                                                                     (QREFELT $
                                                                              151))
                                                           (QREFELT $ 112))
                                                          . #45#)
                                                    (EXIT
                                                     (LETT |nlg|
                                                           (CONS |ng| |nlg|)
                                                           . #45#)))))))
                                               (LETT #21#
                                                     (PROG1 (CDR #21#)
                                                       (LETT #22#
                                                             (PROG1 (CDR #22#)
                                                               (LETT #23#
                                                                     (CDR #23#)
                                                                     . #45#))
                                                             . #45#))
                                                     . #45#)
                                               (GO G190) G191 (EXIT NIL))
                                          (LETT |nlg| (NREVERSE |nlg|) . #45#)
                                          (COND
                                           ((SPADCALL |fp1|
                                                      (|spadConstant| $ 42)
                                                      (QREFELT $ 199))
                                            (SEQ
                                             (LETT |m3|
                                                   (SPADCALL (LIST |nlg|)
                                                             (QREFELT $ 201))
                                                   . #45#)
                                             (LETT |cb1|
                                                   (|RDEPAR;csolve1| |m3| |d1|
                                                    $)
                                                   . #45#)
                                             (EXIT
                                              (LETT |elca|
                                                    (PROGN
                                                     (LETT #19# NIL . #45#)
                                                     (SEQ
                                                      (LETT |bv| NIL . #45#)
                                                      (LETT #18# |cb1| . #45#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #18#)
                                                            (PROGN
                                                             (LETT |bv|
                                                                   (CAR #18#)
                                                                   . #45#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #19#
                                                              (CONS
                                                               (|spadConstant|
                                                                $ 42)
                                                               #19#)
                                                              . #45#)))
                                                      (LETT #18# (CDR #18#)
                                                            . #45#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #19#))))
                                                    . #45#))))
                                           (#46#
                                            (SEQ
                                             (LETT |kk3|
                                                   (SPADCALL |lk|
                                                             (QREFELT $ 165))
                                                   . #45#)
                                             (LETT |lk3|
                                                   (PROGN
                                                    (LETT #16# NIL . #45#)
                                                    (SEQ (LETT |ki| NIL . #45#)
                                                         (LETT #15# |lk|
                                                               . #45#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #15#)
                                                               (PROGN
                                                                (LETT |ki|
                                                                      (CAR
                                                                       #15#)
                                                                      . #45#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (COND
                                                            ((SPADCALL |ki|
                                                                       |kk3|
                                                                       (QREFELT
                                                                        $ 166))
                                                             (LETT #16#
                                                                   (CONS |ki|
                                                                         #16#)
                                                                   . #45#)))))
                                                         (LETT #15# (CDR #15#)
                                                               . #45#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #16#))))
                                                   . #45#)
                                             (LETT |res2|
                                                   (|RDEPAR;do_param_rde| |fp0|
                                                    'T |nlg| |x| |kk3| |lk1|
                                                    |ext| |logi| $)
                                                   . #45#)
                                             (LETT |cb1|
                                                   (PROGN
                                                    (LETT #13# NIL . #45#)
                                                    (SEQ (LETT |be| NIL . #45#)
                                                         (LETT #12# |res2|
                                                               . #45#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #12#)
                                                               (PROGN
                                                                (LETT |be|
                                                                      (CAR
                                                                       #12#)
                                                                      . #45#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #13#
                                                                 (CONS
                                                                  (QCDR |be|)
                                                                  #13#)
                                                                 . #45#)))
                                                         (LETT #12# (CDR #12#)
                                                               . #45#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #13#))))
                                                   . #45#)
                                             (EXIT
                                              (LETT |elca|
                                                    (PROGN
                                                     (LETT #11# NIL . #45#)
                                                     (SEQ
                                                      (LETT |be| NIL . #45#)
                                                      (LETT #10# |res2| . #45#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #10#)
                                                            (PROGN
                                                             (LETT |be|
                                                                   (CAR #10#)
                                                                   . #45#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #11#
                                                              (CONS (QCAR |be|)
                                                                    #11#)
                                                              . #45#)))
                                                      (LETT #10# (CDR #10#)
                                                            . #45#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #11#))))
                                                    . #45#)))))
                                          (LETT |ncb|
                                                (PROGN
                                                 (LETT #9# NIL . #45#)
                                                 (SEQ (LETT |bv| NIL . #45#)
                                                      (LETT #8# |cb1| . #45#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #8#)
                                                            (PROGN
                                                             (LETT |bv|
                                                                   (CAR #8#)
                                                                   . #45#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #9#
                                                              (CONS
                                                               (SPADCALL |bv|
                                                                         |cb|
                                                                         (QREFELT
                                                                          $
                                                                          81))
                                                               #9#)
                                                              . #45#)))
                                                      (LETT #8# (CDR #8#)
                                                            . #45#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #9#))))
                                                . #45#)
                                          (LETT |nlca|
                                                (PROGN
                                                 (LETT #7# NIL . #45#)
                                                 (SEQ (LETT |ca| NIL . #45#)
                                                      (LETT #6# |elca| . #45#)
                                                      (LETT |bv| NIL . #45#)
                                                      (LETT #5# |cb1| . #45#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #5#)
                                                            (PROGN
                                                             (LETT |bv|
                                                                   (CAR #5#)
                                                                   . #45#)
                                                             NIL)
                                                            (ATOM #6#)
                                                            (PROGN
                                                             (LETT |ca|
                                                                   (CAR #6#)
                                                                   . #45#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #7#
                                                              (CONS
                                                               (SPADCALL |ca|
                                                                         (SPADCALL
                                                                          |bv|
                                                                          |lca|
                                                                          (QREFELT
                                                                           $
                                                                           110))
                                                                         (QREFELT
                                                                          $
                                                                          112))
                                                               #7#)
                                                              . #45#)))
                                                      (LETT #5#
                                                            (PROG1 (CDR #5#)
                                                              (LETT #6#
                                                                    (CDR #6#)
                                                                    . #45#))
                                                            . #45#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #7#))))
                                                . #45#)
                                          (EXIT
                                           (PROGN
                                            (LETT #4# NIL . #45#)
                                            (SEQ (LETT |bv| NIL . #45#)
                                                 (LETT #3# |ncb| . #45#)
                                                 (LETT |ba| NIL . #45#)
                                                 (LETT #2# |nlca| . #45#) G190
                                                 (COND
                                                  ((OR (ATOM #2#)
                                                       (PROGN
                                                        (LETT |ba| (CAR #2#)
                                                              . #45#)
                                                        NIL)
                                                       (ATOM #3#)
                                                       (PROGN
                                                        (LETT |bv| (CAR #3#)
                                                              . #45#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #4#
                                                         (CONS (CONS |ba| |bv|)
                                                               #4#)
                                                         . #45#)))
                                                 (LETT #2#
                                                       (PROG1 (CDR #2#)
                                                         (LETT #3# (CDR #3#)
                                                               . #45#))
                                                       . #45#)
                                                 (GO G190) G191
                                                 (EXIT
                                                  (NREVERSE
                                                   #4#)))))))))))))))))))))))
          #47# (EXIT #20#)))) 

(SDEFUN |RDEPAR;do_diff_rde1!3| ((|x1| NIL) ($$ NIL))
        (PROG (|dv| $ |k1|)
          (LETT |dv| (QREFELT $$ 2) . #1=(|RDEPAR;do_diff_rde1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |dv| (QREFELT $ 29)) |k1|
                      (QREFELT $ 183)))))) 

(SDEFUN |RDEPAR;do_diff_rde1!2| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEPAR;do_diff_rde1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 171)))))) 

(SDEFUN |RDEPAR;do_diff_rde1!1| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|dv| $)
          (LETT |dv| (QREFELT $$ 1) . #1=(|RDEPAR;do_diff_rde1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |dv| |x2| |x3| (QREFELT $ 192)))))) 

(SDEFUN |RDEPAR;do_diff_rde1!0| ((|x4| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|dv| $)
          (LETT |dv| (QREFELT $$ 1) . #1=(|RDEPAR;do_diff_rde1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |dv| |x4| |x3| (QREFELT $ 191)))))) 

(SDEFUN |RDEPAR;do_diff_rde|
        ((|fp| F) (|lg| |List| F) (|x| |Symbol|) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G1295 NIL) (|u| NIL) (#2=#:G1294 NIL)
          (|diff_rde1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|SparseUnivariatePolynomial| F))))
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|d1| (|Mapping| F F)) (|fp0| (F)) (|fp1| (F))
          (|nfpu| (|SparseUnivariatePolynomial| F))
          (|fpu| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 126))
                . #3=(|RDEPAR;do_diff_rde|))
          (COND
           ((OR
             (SPADCALL (SPADCALL |fpu| (QREFELT $ 13)) (|spadConstant| $ 70)
                       (QREFELT $ 71))
             (SPADCALL
              (SPADCALL (LETT |nfpu| (SPADCALL |fpu| (QREFELT $ 22)) . #3#)
                        (QREFELT $ 69))
              1 (QREFELT $ 45)))
            (EXIT NIL)))
          (LETT |fp1| (SPADCALL |nfpu| 1 (QREFELT $ 151)) . #3#)
          (LETT |fp0| (SPADCALL |nfpu| 0 (QREFELT $ 151)) . #3#)
          (LETT |d1| (CONS #'|RDEPAR;do_diff_rde!0| (VECTOR $ |x|)) . #3#)
          (LETT |cs1| (CONS #'|RDEPAR;do_diff_rde!1| (VECTOR $ |d1|)) . #3#)
          (LETT |diff_rde1|
                (CONS #'|RDEPAR;do_diff_rde!2|
                      (VECTOR $ |logi| |ext| |lk| |k| |x| |fp1| |fp0|))
                . #3#)
          (EXIT
           (SPADCALL |diff_rde1| |cs1|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |u| NIL . #3#) (LETT #1# |lg| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |u| |k| (QREFELT $ 126))
                                         #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 205)))))) 

(SDEFUN |RDEPAR;do_diff_rde!2| ((|x1| NIL) ($$ NIL))
        (PROG (|fp0| |fp1| |x| |k| |lk| |ext| |logi| $)
          (LETT |fp0| (QREFELT $$ 7) . #1=(|RDEPAR;do_diff_rde|))
          (LETT |fp1| (QREFELT $$ 6) . #1#)
          (LETT |x| (QREFELT $$ 5) . #1#)
          (LETT |k| (QREFELT $$ 4) . #1#)
          (LETT |lk| (QREFELT $$ 3) . #1#)
          (LETT |ext| (QREFELT $$ 2) . #1#)
          (LETT |logi| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|RDEPAR;do_diff_rde1| |x1| |fp0| |fp1| |x| |k| |lk| |ext| |logi|
             $))))) 

(SDEFUN |RDEPAR;do_diff_rde!1| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1) . #1=(|RDEPAR;do_diff_rde|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|RDEPAR;csolve1| |x4| |d1| $))))) 

(SDEFUN |RDEPAR;do_diff_rde!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEPAR;do_diff_rde|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 171)))))) 

(SDEFUN |RDEPAR;do_alg_rde0|
        ((|fp| F) (|lg| |List| F) (|x| |Symbol|) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G1332 NIL) (|ba| NIL) (#2=#:G1333 NIL) (|bv| NIL)
          (#3=#:G1331 NIL) (|kfi| (F)) (|lba| (|List| F))
          (|cb| (|List| (|Vector| F))) (|nlba| (|List| F)) (#4=#:G1330 NIL)
          (|be| NIL) (#5=#:G1329 NIL) (|ncb| (|List| (|Vector| F)))
          (#6=#:G1328 NIL) (#7=#:G1327 NIL)
          (|s1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgi1| (|List| F)) (#8=#:G1326 NIL) (#9=#:G1325 NIL)
          (|lgi| (|List| F)) (#10=#:G1324 NIL) (|j| NIL) (#11=#:G1323 NIL)
          (|i| NIL) (#12=#:G1322 NIL) (#13=#:G1321 NIL) (#14=#:G1319 NIL)
          (#15=#:G1320 NIL) (#16=#:G1318 NIL) (#17=#:G1317 NIL)
          (|m| (|NonNegativeInteger|)) (|llv| (|Vector| (|List| F)))
          (#18=#:G1316 NIL) (|g| NIL) (#19=#:G1315 NIL) (|kf| (F)) (|dlk| (F))
          (|ak1| (F)) (|n| (|Integer|)) (|ak2| (F)) (|ak| (|List| F)))
         (SEQ
          (LETT |ak| (SPADCALL |k| (QREFELT $ 180))
                . #20=(|RDEPAR;do_alg_rde0|))
          (LETT |ak2| (SPADCALL |ak| 2 (QREFELT $ 181)) . #20#)
          (LETT |n| (SPADCALL |ak2| (QREFELT $ 206)) . #20#)
          (LETT |ak1| (SPADCALL |ak| 1 (QREFELT $ 181)) . #20#)
          (LETT |dlk|
                (SPADCALL (SPADCALL |ak1| |x| (QREFELT $ 207))
                          (SPADCALL |ak2| |ak1| (QREFELT $ 111))
                          (QREFELT $ 129))
                . #20#)
          (LETT |kf| (SPADCALL |k| (QREFELT $ 31)) . #20#)
          (LETT |kfi| (|spadConstant| $ 66) . #20#)
          (LETT |llv|
                (SPADCALL
                 (PROGN
                  (LETT #19# NIL . #20#)
                  (SEQ (LETT |g| NIL . #20#) (LETT #18# |lg| . #20#) G190
                       (COND
                        ((OR (ATOM #18#)
                             (PROGN (LETT |g| (CAR #18#) . #20#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #19#
                               (CONS (SPADCALL |g| |k| |n| (QREFELT $ 209))
                                     #19#)
                               . #20#)))
                       (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                       (EXIT (NREVERSE #19#))))
                 (QREFELT $ 211))
                . #20#)
          (LETT |m| (LENGTH |lg|) . #20#)
          (LETT |cb|
                (PROGN
                 (LETT #17# NIL . #20#)
                 (SEQ (LETT |i| 1 . #20#) (LETT #16# |m| . #20#) G190
                      (COND ((|greater_SI| |i| #16#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #17#
                              (CONS (MAKEARR1 |m| (|spadConstant| $ 42)) #17#)
                              . #20#)))
                      (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #17#))))
                . #20#)
          (SEQ (LETT |bv| NIL . #20#) (LETT #15# |cb| . #20#)
               (LETT |i| 1 . #20#) (LETT #14# |m| . #20#) G190
               (COND
                ((OR (|greater_SI| |i| #14#) (ATOM #15#)
                     (PROGN (LETT |bv| (CAR #15#) . #20#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |bv| |i| (|spadConstant| $ 66) (QREFELT $ 98))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #15# (CDR #15#) . #20#))
                     . #20#)
               (GO G190) G191 (EXIT NIL))
          (LETT |lba|
                (PROGN
                 (LETT #13# NIL . #20#)
                 (SEQ (LETT |bv| NIL . #20#) (LETT #12# |cb| . #20#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |bv| (CAR #12#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13# (CONS (|spadConstant| $ 42) #13#) . #20#)))
                      (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #20#)
          (SEQ (LETT |i| 0 . #20#) (LETT #11# (- |n| 1) . #20#) G190
               (COND ((|greater_SI| |i| #11#) (GO G191)))
               (SEQ (LETT |lgi| NIL . #20#)
                    (SEQ (LETT |j| 1 . #20#) (LETT #10# |m| . #20#) G190
                         (COND ((|greater_SI| |j| #10#) (GO G191)))
                         (SEQ
                          (LETT |lgi|
                                (CONS
                                 (|SPADfirst|
                                  (SPADCALL |llv| |j| (QREFELT $ 212)))
                                 |lgi|)
                                . #20#)
                          (EXIT
                           (SPADCALL |llv| |j|
                                     (CDR (SPADCALL |llv| |j| (QREFELT $ 212)))
                                     (QREFELT $ 213))))
                         (LETT |j| (|inc_SI| |j|) . #20#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |lgi| (NREVERSE |lgi|) . #20#)
                    (LETT |lgi1|
                          (PROGN
                           (LETT #9# NIL . #20#)
                           (SEQ (LETT |bv| NIL . #20#) (LETT #8# |cb| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |bv| (CAR #8#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #9#
                                        (CONS
                                         (SPADCALL |bv| |lgi| (QREFELT $ 110))
                                         #9#)
                                        . #20#)))
                                (LETT #8# (CDR #8#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #9#))))
                          . #20#)
                    (LETT |s1|
                          (SPADCALL
                           (SPADCALL |fp|
                                     (SPADCALL (SPADCALL |i| (QREFELT $ 46))
                                               |dlk| (QREFELT $ 111))
                                     (QREFELT $ 112))
                           |lgi1| |x| |lk| |ext| |logi| (QREFELT $ 119))
                          . #20#)
                    (LETT |ncb|
                          (PROGN
                           (LETT #7# NIL . #20#)
                           (SEQ (LETT |be| NIL . #20#) (LETT #6# |s1| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |be| (CAR #6#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS
                                         (SPADCALL (QCDR |be|) |cb|
                                                   (QREFELT $ 81))
                                         #7#)
                                        . #20#)))
                                (LETT #6# (CDR #6#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #7#))))
                          . #20#)
                    (LETT |nlba|
                          (PROGN
                           (LETT #5# NIL . #20#)
                           (SEQ (LETT |be| NIL . #20#) (LETT #4# |s1| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |be| (CAR #4#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL (QCDR |be|) |lba|
                                                    (QREFELT $ 110))
                                          (SPADCALL (QCAR |be|) |kfi|
                                                    (QREFELT $ 111))
                                          (QREFELT $ 112))
                                         #5#)
                                        . #20#)))
                                (LETT #4# (CDR #4#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          . #20#)
                    (LETT |cb| |ncb| . #20#) (LETT |lba| |nlba| . #20#)
                    (EXIT
                     (LETT |kfi| (SPADCALL |kf| |kfi| (QREFELT $ 111))
                           . #20#)))
               (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #3# NIL . #20#)
            (SEQ (LETT |bv| NIL . #20#) (LETT #2# |cb| . #20#)
                 (LETT |ba| NIL . #20#) (LETT #1# |lba| . #20#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #20#) NIL)
                       (ATOM #2#) (PROGN (LETT |bv| (CAR #2#) . #20#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #3# (CONS (CONS |ba| |bv|) #3#) . #20#)))
                 (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #20#))
                       . #20#)
                 (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;do_alg_rde|
        ((|fp| F) (|lg| |List| F) (|x| |Symbol|) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($
          . #1=(|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((#2=#:G1374 NIL) (|be| NIL) (#3=#:G1373 NIL) (|res1| #1#)
          (#4=#:G1372 NIL) (|kk| NIL) (#5=#:G1371 NIL) (|lg1| (|List| F))
          (#6=#:G1370 NIL) (|g| NIL) (#7=#:G1369 NIL) (|fp1| (F))
          (|ky| (|Kernel| F)) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (|part2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#8=#:G1368 NIL) (|f| NIL) (#9=#:G1367 NIL)
          (|part1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#10=#:G1366 NIL) (#11=#:G1365 NIL) (|n| (|NonNegativeInteger|))
          (|k1| (|Kernel| F)))
         (SEQ
          (COND
           ((SPADCALL |k| '|nthRoot| (QREFELT $ 170))
            (COND
             ((NULL
               (SPADCALL |k| (SPADCALL |fp| (QREFELT $ 214)) (QREFELT $ 215)))
              (EXIT
               (|RDEPAR;do_alg_rde0| |fp| |lg| |x| |k| |lk| |ext| |logi|
                $))))))
          (LETT |k1| (SPADCALL |lk| (QREFELT $ 165))
                . #12=(|RDEPAR;do_alg_rde|))
          (EXIT
           (COND
            ((QEQCAR (SPADCALL |k1| (QREFELT $ 217)) 0)
             (SEQ
              (LETT |res1| (SPADCALL |fp| |lg| |k1| |k| (QREFELT $ 220))
                    . #12#)
              (LETT |n| (LENGTH |lg|) . #12#)
              (LETT |part1|
                    (PROGN
                     (LETT #11# NIL . #12#)
                     (SEQ (LETT |be| NIL . #12#)
                          (LETT #10# (QCAR |res1|) . #12#) G190
                          (COND
                           ((OR (ATOM #10#)
                                (PROGN (LETT |be| (CAR #10#) . #12#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #11#
                                  (CONS
                                   (CONS (SPADCALL (QCAR |be|) (QREFELT $ 108))
                                         (QCDR |be|))
                                   #11#)
                                  . #12#)))
                          (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                          (EXIT (NREVERSE #11#))))
                    . #12#)
              (LETT |part2|
                    (PROGN
                     (LETT #9# NIL . #12#)
                     (SEQ (LETT |f| NIL . #12#) (LETT #8# (QCDR |res1|) . #12#)
                          G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |f| (CAR #8#) . #12#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS
                                   (CONS |f|
                                         (MAKEARR1 |n| (|spadConstant| $ 42)))
                                   #9#)
                                  . #12#)))
                          (LETT #8# (CDR #8#) . #12#) (GO G190) G191
                          (EXIT (NREVERSE #9#))))
                    . #12#)
              (EXIT (SPADCALL |part1| |part2| (QREFELT $ 221)))))
            ((SPADCALL (SPADCALL |k1| (QREFELT $ 168)) '|%alg| (QREFELT $ 169))
             (SEQ
              (LETT |rec|
                    (SPADCALL (SPADCALL |k1| (QREFELT $ 31))
                              (SPADCALL |k| (QREFELT $ 31)) (QREFELT $ 224))
                    . #12#)
              (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 226)) . #12#)
              (LETT |ky| (SPADCALL |y| (QREFELT $ 182)) . #12#)
              (LETT |fp1|
                    (SPADCALL |fp| (LIST |k1| |k|)
                              (LIST
                               (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 227))
                               (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 227)))
                              (QREFELT $ 228))
                    . #12#)
              (LETT |lg1|
                    (PROGN
                     (LETT #7# NIL . #12#)
                     (SEQ (LETT |g| NIL . #12#) (LETT #6# |lg| . #12#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |g| (CAR #6#) . #12#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL |g| (LIST |k1| |k|)
                                             (LIST
                                              (SPADCALL (QVELT |rec| 1) |y|
                                                        (QREFELT $ 227))
                                              (SPADCALL (QVELT |rec| 2) |y|
                                                        (QREFELT $ 227)))
                                             (QREFELT $ 228))
                                   #7#)
                                  . #12#)))
                          (LETT #6# (CDR #6#) . #12#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #12#)
              (LETT |res1|
                    (|RDEPAR;do_alg_rde| |fp1| |lg1| |x| |ky|
                     (PROGN
                      (LETT #5# NIL . #12#)
                      (SEQ (LETT |kk| NIL . #12#) (LETT #4# |lk| . #12#) G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |kk| (CAR #4#) . #12#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |kk| |k1| (QREFELT $ 166))
                               (LETT #5# (CONS |kk| #5#) . #12#)))))
                           (LETT #4# (CDR #4#) . #12#) (GO G190) G191
                           (EXIT (NREVERSE #5#))))
                     |ext| |logi| $)
                    . #12#)
              (EXIT
               (PROGN
                (LETT #3# NIL . #12#)
                (SEQ (LETT |be| NIL . #12#) (LETT #2# |res1| . #12#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |be| (CAR #2#) . #12#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #3#
                             (CONS
                              (CONS
                               (SPADCALL (QCAR |be|) |ky| (QVELT |rec| 0)
                                         (QREFELT $ 183))
                               (QCDR |be|))
                              #3#)
                             . #12#)))
                     (LETT #2# (CDR #2#) . #12#) (GO G190) G191
                     (EXIT (NREVERSE #3#)))))))
            ('T (|error| "do_alg_rde: unimplemented kernel"))))))) 

(SDEFUN |RDEPAR;param_rde;IFLSLMML;21|
        ((|m| |Integer|) (|f| F) (|lg| |List| F) (|x| |Symbol|)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G1385 NIL) (|k1| NIL) (#2=#:G1384 NIL) (|k| (|Kernel| F))
          (|fp| (F)))
         (SEQ
          (LETT |fp|
                (SPADCALL (SPADCALL |m| |f| (QREFELT $ 229)) |x|
                          (QREFELT $ 207))
                . #3=(|RDEPAR;param_rde;IFLSLMML;21|))
          (EXIT
           (COND
            ((SPADCALL |fp| (|spadConstant| $ 42) (QREFELT $ 127))
             (SPADCALL |lk| |lg| |ext|))
            ('T
             (SEQ (LETT |k| (SPADCALL |lk| (QREFELT $ 165)) . #3#)
                  (LETT |lk|
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |k1| NIL . #3#) (LETT #1# |lk| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |k1| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| |k| (QREFELT $ 166))
                                  (LETT #2# (CONS |k1| #2#) . #3#)))))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #3#)
                  (EXIT
                   (|RDEPAR;do_param_rde| |fp| 'T |lg| |x| |k| |lk| |ext|
                    |logi| $))))))))) 

(SDEFUN |RDEPAR;do_param_rde|
        ((|fp| F) (|is_der| |Boolean|) (|lg| |List| F) (|x| |Symbol|)
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|res2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|anf| (F)) (|ans1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|bv| (|Vector| F)) (#1=#:G1464 NIL) (|re| NIL)
          (|res1|
           (|List|
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeffs| (|Vector| F)))))
          (#2=#:G1452 NIL)
          (|lgu1| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#3=#:G1463 NIL) (|kv| NIL) (|n2| (|NonNegativeInteger|))
          (|n1| (|NonNegativeInteger|))
          (|lgu| (|List| #4=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (#5=#:G1462 NIL) (|dr| NIL) (#6=#:G1461 NIL)
          (|lker| (|List| (|Vector| F))) (|rs3| #7=(|Matrix| F))
          (|get_rs| (|Mapping| #7# (|Matrix| F))) (|rs2| (|Matrix| F))
          (|rs1| (|Matrix| (|SparseUnivariatePolynomial| F)))
          (|lnor1| (|List| #8=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (#9=#:G1460 NIL) (#10=#:G1459 NIL)
          (|lgd|
           (|List|
            (|Record| (|:| |poly| (|SparseUnivariatePolynomial| F))
                      (|:| |normal| #8#)
                      (|:| |special|
                           (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (#11=#:G1458 NIL) (|gu| NIL) (#12=#:G1457 NIL) (#13=#:G1456 NIL)
          (#14=#:G1455 NIL) (|aa1| #15=(|SparseUnivariatePolynomial| F))
          (|bbr| (|Fraction| (|SparseUnivariatePolynomial| F))) (|aa| #15#)
          (|h| NIL) (|#G250| #16=(|List| (|SparseUnivariatePolynomial| F)))
          (|d| NIL) (|#G249| #16#)
          (|der1|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (#17=#:G1454 NIL) (|g| NIL) (#18=#:G1453 NIL)
          (|nfp| #19=(|SparseUnivariatePolynomial| F))
          (|denfp| (|SparseUnivariatePolynomial| F)) (|fpu| #4#) (|dk| #19#)
          (|dku| #4#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |k| (QREFELT $ 168)) '|%alg| (QREFELT $ 169))
             (|RDEPAR;do_alg_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| $))
            ((SPADCALL |k| '|%diff| (QREFELT $ 170))
             (|RDEPAR;do_diff_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| $))
            (#20='T
             (SEQ
              (LETT |dku|
                    (SPADCALL
                     (SPADCALL (SPADCALL |k| (QREFELT $ 31)) |x|
                               (QREFELT $ 171))
                     |k| (QREFELT $ 126))
                    . #21=(|RDEPAR;do_param_rde|))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |dku| (QREFELT $ 13))
                           (|spadConstant| $ 70) (QREFELT $ 71))
                 NIL)
                (#20#
                 (SEQ (LETT |dk| (SPADCALL |dku| (QREFELT $ 22)) . #21#)
                      (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 126)) . #21#)
                      (LETT |denfp| (SPADCALL |fpu| (QREFELT $ 13)) . #21#)
                      (LETT |nfp| (SPADCALL |fpu| (QREFELT $ 22)) . #21#)
                      (LETT |lgu|
                            (PROGN
                             (LETT #18# NIL . #21#)
                             (SEQ (LETT |g| NIL . #21#) (LETT #17# |lg| . #21#)
                                  G190
                                  (COND
                                   ((OR (ATOM #17#)
                                        (PROGN
                                         (LETT |g| (CAR #17#) . #21#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #18#
                                          (CONS
                                           (SPADCALL |g| |k| (QREFELT $ 126))
                                           #18#)
                                          . #21#)))
                                  (LETT #17# (CDR #17#) . #21#) (GO G190) G191
                                  (EXIT (NREVERSE #18#))))
                            . #21#)
                      (LETT |der1|
                            (CONS #'|RDEPAR;do_param_rde!1|
                                  (VECTOR |dk| |x| $))
                            . #21#)
                      (PROGN
                       (LETT |#G249| (|RDEPAR;get_denom| |fpu| |lgu| |der1| $)
                             . #21#)
                       (LETT |#G250| |#G249| . #21#)
                       (LETT |d| (|SPADfirst| |#G250|) . #21#)
                       (LETT |#G250| (CDR |#G250|) . #21#)
                       (LETT |h| (|SPADfirst| |#G250|) . #21#)
                       |#G249|)
                      (LETT |aa| (SPADCALL |d| |h| (QREFELT $ 82)) . #21#)
                      (LETT |bbr|
                            (SPADCALL (SPADCALL |aa| |fpu| (QREFELT $ 230))
                                      (SPADCALL
                                       (SPADCALL |d| (SPADCALL |h| |der1|)
                                                 (QREFELT $ 82))
                                       (QREFELT $ 74))
                                      (QREFELT $ 175))
                            . #21#)
                      (LETT |aa1| (SPADCALL |aa| |h| (QREFELT $ 82)) . #21#)
                      (LETT |lgu|
                            (PROGN
                             (LETT #14# NIL . #21#)
                             (SEQ (LETT |gu| NIL . #21#)
                                  (LETT #13# |lgu| . #21#) G190
                                  (COND
                                   ((OR (ATOM #13#)
                                        (PROGN
                                         (LETT |gu| (CAR #13#) . #21#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #14#
                                          (CONS
                                           (SPADCALL |aa1| |gu|
                                                     (QREFELT $ 230))
                                           #14#)
                                          . #21#)))
                                  (LETT #13# (CDR #13#) . #21#) (GO G190) G191
                                  (EXIT (NREVERSE #14#))))
                            . #21#)
                      (LETT |lgd|
                            (PROGN
                             (LETT #12# NIL . #21#)
                             (SEQ (LETT |gu| NIL . #21#)
                                  (LETT #11# |lgu| . #21#) G190
                                  (COND
                                   ((OR (ATOM #11#)
                                        (PROGN
                                         (LETT |gu| (CAR #11#) . #21#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #12#
                                          (CONS
                                           (SPADCALL |gu| |der1|
                                                     (QREFELT $ 232))
                                           #12#)
                                          . #21#)))
                                  (LETT #11# (CDR #11#) . #21#) (GO G190) G191
                                  (EXIT (NREVERSE #12#))))
                            . #21#)
                      (LETT |lnor1|
                            (PROGN
                             (LETT #10# NIL . #21#)
                             (SEQ (LETT |dr| NIL . #21#)
                                  (LETT #9# |lgd| . #21#) G190
                                  (COND
                                   ((OR (ATOM #9#)
                                        (PROGN
                                         (LETT |dr| (CAR #9#) . #21#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #10# (CONS (QVELT |dr| 1) #10#)
                                          . #21#)))
                                  (LETT #9# (CDR #9#) . #21#) (GO G190) G191
                                  (EXIT (NREVERSE #10#))))
                            . #21#)
                      (LETT |rs1|
                            (SPADCALL (SPADCALL (LIST |lnor1|) (QREFELT $ 235))
                                      (QREFELT $ 236))
                            . #21#)
                      (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 58)) . #21#)
                      (LETT |get_rs|
                            (CONS #'|RDEPAR;do_param_rde!3| (VECTOR |x| $))
                            . #21#)
                      (LETT |rs3| (SPADCALL |rs2| |get_rs|) . #21#)
                      (LETT |lker| (SPADCALL |rs3| (QREFELT $ 60)) . #21#)
                      (EXIT
                       (COND ((NULL |lker|) NIL)
                             (#20#
                              (SEQ
                               (LETT |lgu|
                                     (PROGN
                                      (LETT #6# NIL . #21#)
                                      (SEQ (LETT |dr| NIL . #21#)
                                           (LETT #5# |lgd| . #21#) G190
                                           (COND
                                            ((OR (ATOM #5#)
                                                 (PROGN
                                                  (LETT |dr| (CAR #5#) . #21#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #6#
                                                   (CONS
                                                    (SPADCALL
                                                     (SPADCALL (QVELT |dr| 0)
                                                               (QREFELT $ 74))
                                                     (QVELT |dr| 2)
                                                     (QREFELT $ 122))
                                                    #6#)
                                                   . #21#)))
                                           (LETT #5# (CDR #5#) . #21#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #6#))))
                                     . #21#)
                               (LETT |n1| (LENGTH |lgu|) . #21#)
                               (LETT |n2| (LENGTH |lker|) . #21#)
                               (LETT |lgu1| NIL . #21#)
                               (SEQ (LETT |kv| NIL . #21#)
                                    (LETT #3# |lker| . #21#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |kv| (CAR #3#) . #21#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |lgu1|
                                            (CONS
                                             (SPADCALL |kv| |lgu|
                                                       (QREFELT $ 121))
                                             |lgu1|)
                                            . #21#)))
                                    (LETT #3# (CDR #3#) . #21#) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |lgu1| (NREVERSE |lgu1|) . #21#)
                               (LETT |res1|
                                     (COND
                                      ((OR
                                        (QEQCAR (SPADCALL |k| (QREFELT $ 217))
                                                0)
                                        (OR
                                         (SPADCALL |k| '|log| (QREFELT $ 170))
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 168))
                                          '|prim| (QREFELT $ 169))))
                                       (|RDEPAR;do_SPDE_prim| |aa| |bbr|
                                        |is_der| |lgu1| |k| |lk| |ext| |logi|
                                        |der1| |get_rs| |x| $))
                                      ((SPADCALL |k| '|exp| (QREFELT $ 170))
                                       (|RDEPAR;do_SPDE_exp| |aa| |bbr| |lgu1|
                                        |lk| |ext| |logi| |der1| |get_rs| |x|
                                        $))
                                      (#20#
                                       (PROGN
                                        (LETT #2# NIL . #21#)
                                        (GO #22=#:G1451))))
                                     . #21#)
                               (LETT |res2| NIL . #21#)
                               (SEQ (LETT |re| NIL . #21#)
                                    (LETT #1# |res1| . #21#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |re| (CAR #1#) . #21#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |bv|
                                           (SPADCALL (QCDR |re|) |lker|
                                                     (QREFELT $ 81))
                                           . #21#)
                                     (LETT |ans1|
                                           (SPADCALL
                                            (SPADCALL (QCAR |re|)
                                                      (SPADCALL |h|
                                                                (QREFELT $ 74))
                                                      (QREFELT $ 161))
                                            (QREFELT $ 238))
                                           . #21#)
                                     (LETT |anf|
                                           (SPADCALL |ans1| |k|
                                                     (QREFELT $ 124))
                                           . #21#)
                                     (EXIT
                                      (LETT |res2|
                                            (CONS (CONS |anf| |bv|) |res2|)
                                            . #21#)))
                                    (LETT #1# (CDR #1#) . #21#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (NREVERSE |res2|))))))))))))))
          #22# (EXIT #2#)))) 

(SDEFUN |RDEPAR;do_param_rde!3| ((|m| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1) . #1=(|RDEPAR;do_param_rde|))
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |m|
                             (LIST
                              (CONS #'|RDEPAR;do_param_rde!2| (VECTOR $ |x|)))
                             (QREFELT $ 237))))))) 

(SDEFUN |RDEPAR;do_param_rde!2| ((|ff| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |ff| |x| (QREFELT $ 171)))))) 

(SDEFUN |RDEPAR;do_param_rde!1| ((|z1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|RDEPAR;do_param_rde|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEPAR;do_param_rde!0| (VECTOR $ |x|))
                             |dk| (QREFELT $ 173))))))) 

(SDEFUN |RDEPAR;do_param_rde!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 171)))))) 

(DECLAIM (NOTINLINE |ParametricRischDE;|)) 

(DEFUN |ParametricRischDE| (&REST #1=#:G1465)
  (SPROG NIL
         (PROG (#2=#:G1466)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricRischDE|)
                                               '|domainEqualList|)
                    . #3=(|ParametricRischDE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ParametricRischDE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ParametricRischDE|)))))))))) 

(DEFUN |ParametricRischDE;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ParametricRischDE|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ParametricRischDE| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 239) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ParametricRischDE| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ParametricRischDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| 7) (|Fraction| 8) (|Mapping| 8 8)
              (|MonomialExtensionTools| 7 8) (0 . |normalDenom|) (6 . |denom|)
              (|List| $) (11 . |lcm|)
              (|Record| (|:| |normal| 8) (|:| |special| 8)) (16 . |split|)
              (22 . |gcd|) (28 . |differentiate|) (|Union| $ '"failed")
              (33 . |exquo|) (39 . |numer|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 23 '"failed")
              (44 . |extendedEuclidean|) (|Symbol|) (51 . |new|) (|Kernel| 7)
              (55 . |kernel|) (|Kernel| $) (60 . |coerce|) (65 . *) (71 . -)
              (77 . |resultant|) (|List| 39) (|FunctionSpaceRationalRoots| 6 7)
              (83 . |get_rational_roots|) (|Union| 44 '"failed")
              (|Fraction| 44) (89 . |retractIfCan|) (94 . |Zero|) (98 . |Zero|)
              (|Boolean|) (|Integer|) (102 . >) (108 . |coerce|)
              (|LaurentPolynomial| 7 8) (113 . |coerce|) (118 . |exquo|)
              (|Record| (|:| |ans| 8) (|:| |remainder| 8)) (|RDEaux| 7)
              (124 . SPDE1) (|List| 62) (|Matrix| 8) (131 . |matrix|)
              (|Matrix| 7) (|Matrix| $) (136 . |reducedSystem|) (|List| 61)
              (141 . |nullSpace|) (|Vector| 7) (|List| 8)
              (|LinearCombinationUtilities| 7 8) (146 . |lin_comb|)
              (152 . |One|) (156 . |One|) (|NonNegativeInteger|)
              (160 . |monomial|) (166 . |degree|) (171 . |One|) (175 . ~=)
              (181 . =) (187 . |Zero|) (191 . |coerce|) (196 . |retract|)
              (|Record| (|:| |ans| 62) (|:| |acoeff| 8) (|:| |eegen| 8)
                        (|:| |bpar| 8) (|:| |lcpar| 62) (|:| |dpar| 44))
              (|Union| (|List| 50) 76) (201 . |multi_SPDE|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (210 . |divide|) (216 . |lin_comb|) (222 . *) (228 . +)
              (|Record| (|:| |num| 85) (|:| |den| 44)) (|Vector| 39)
              (|CommonDenominator| 44 39 85) (234 . |splitDenominator|)
              (239 . ~=) (245 . |elt|) (251 . |One|) (255 . ~=)
              (261 . |retract|) (|List| 44) (|Vector| 44) (266 . |vector|)
              (|Vector| 8) (271 . |vector|) (276 . |setelt!|) (283 . |max|)
              (|Mapping| 44 44 44) (289 . |reduce|) (296 . |retract|)
              (301 . |Zero|) (305 . |elt|) (311 . |leadingCoefficient|)
              (316 . |reductum|) (321 . |setelt!|) (328 . -) (|List| 7)
              (333 . |lin_comb|) (339 . *) (345 . +)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 61)) (|List| 113)
              (|List| 28) (|Mapping| 114 115 109)
              (|Record| (|:| |logands| 109) (|:| |basis| (|List| 85)))
              (|Mapping| 117 115 109) |RDEPAR;param_rde2;FLSLMML;15| (|List| 9)
              (351 . |lin_comb|) (357 . +)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 28) 28
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 28)
                                                     7)
              (363 . |multivariate|) (|Fraction| 225) (369 . |univariate|)
              (375 . =) (381 . |reduce|) (387 . /) (393 . >)
              (399 . |retractIfCan|) (|Union| 113 '"failed")
              (|Record| (|:| |particular| 132) (|:| |basis| 114))
              (404 . |dehomogenize|) (409 . |elt|) (|List| 47) (|Vector| 47)
              (415 . |vector|) (420 . |Zero|) (424 . |degree|) (429 . |elt|)
              (435 . ~=) (441 . |leadingCoefficient|) (446 . |reductum|)
              (451 . |setelt!|) (458 . |lin_comb|) (464 . |monomial|) (470 . +)
              (476 . |convert|) (481 . |coefficient|) (487 . |coefficient|)
              (493 . /) |RDEPAR;exp_lower_bound;SupLp2ILFMI;11| (499 . |order|)
              (504 . |min|) (510 . |retract|) (515 . |coerce|) (520 . *)
              (526 . |retract|) (531 . |One|) (535 . /)
              |RDEPAR;param_rde;IFLSLMML;21| |RDEPAR;param_rde;I2FLSLMMR;14|
              (|IntegrationTools| 6 7) (541 . |kmax|) (546 . ~=)
              (|BasicOperator|) (552 . |operator|) (557 . |has?|) (563 . |is?|)
              (569 . |differentiate|) (|Mapping| 7 7) (575 . |differentiate|)
              (582 . /) (588 . -) (594 . ^) (|List| 172)
              (|ConstantLinearDependence| 6 7) (600 . |nullSpaceOverConstants|)
              (606 . |argument|) (611 . |elt|) (617 . |retract|) (622 . |eval|)
              (629 . |coerce|) (634 . |eval|) (641 . |append|) (|List| 30)
              (647 . |tower|) (652 . |varselect|) (|ParametricIntegration| 6 7)
              (658 . |extendedint|) (665 . |logextint|)
              (|Record| (|:| |transform| 56) (|:| |basis| 59))
              (672 . |constant_subspace|) (678 . |vector|) (683 . *)
              (689 . |entries|) (694 . |map|) (700 . ~=) (|List| 109)
              (706 . |matrix|) (|Mapping| 114 62) (|Mapping| 59 56)
              (|ParametricTranscendentalIntegration| 7 8) (711 . |diffextint|)
              (718 . |retract|) (723 . D) (|RootFSSplit| 6 7)
              (729 . |alg_split_root0|) (|Vector| 109) (736 . |vector|)
              (741 . |elt|) (747 . |setelt!|) (754 . |kernels|)
              (759 . |member?|) (|Union| 26 '"failed") (765 . |symbolIfCan|)
              (|Record| (|:| |particular| 114) (|:| |basis| 109))
              (|PureAlgebraicIntegration| 6 7 7) (770 . |param_RDE|)
              (778 . |concat|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 8) (|:| |pol2| 8)
                        (|:| |prim| 8))
              (|FunctionSpacePrimitiveElement| 6 7) (784 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (790 . |rootOf|) (795 . |elt|)
              (801 . |eval|) (808 . *) (814 . *)
              (|Record| (|:| |poly| 8) (|:| |normal| 9) (|:| |special| 9))
              (820 . |decompose|) (|List| 120) (|Matrix| 9) (826 . |matrix|)
              (831 . |reducedSystem|) (836 . |reducedSystem|) (842 . -))
           '#(|param_rde2| 847 |param_rde| 857 |exp_lower_bound| 880) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 238
                                                 '(2 11 8 9 10 12 1 9 8 0 13 1
                                                   8 0 14 15 2 11 16 8 10 17 2
                                                   8 0 0 0 18 1 8 0 0 19 2 8 20
                                                   0 0 21 1 9 8 0 22 3 8 24 0 0
                                                   0 25 0 26 0 27 1 28 0 26 29
                                                   1 7 0 30 31 2 8 0 7 0 32 2 8
                                                   0 0 0 33 2 8 7 0 0 34 2 36
                                                   35 7 28 37 1 39 38 0 40 0 6
                                                   0 41 0 7 0 42 2 44 43 0 0 45
                                                   1 7 0 44 46 1 47 0 8 48 2 47
                                                   20 0 0 49 3 51 50 8 8 10 52
                                                   1 54 0 53 55 1 8 56 57 58 1
                                                   56 59 0 60 2 63 8 61 62 64 0
                                                   6 0 65 0 7 0 66 2 8 0 7 67
                                                   68 1 8 67 0 69 0 8 0 70 2 8
                                                   43 0 0 71 2 8 43 0 0 72 0 8
                                                   0 73 1 9 0 8 74 1 9 8 0 75 5
                                                   51 77 8 8 62 44 10 78 2 8 79
                                                   0 0 80 2 63 61 61 59 81 2 8
                                                   0 0 0 82 2 8 0 0 0 83 1 86
                                                   84 85 87 2 44 43 0 0 88 2 85
                                                   39 0 44 89 0 39 0 90 2 39 43
                                                   0 0 91 1 39 44 0 92 1 94 0
                                                   93 95 1 96 0 62 97 3 61 7 0
                                                   44 7 98 2 44 0 0 0 99 3 93
                                                   44 100 0 44 101 1 8 7 0 102
                                                   0 9 0 103 2 96 8 0 44 104 1
                                                   8 7 0 105 1 8 0 0 106 3 96 8
                                                   0 44 8 107 1 7 0 0 108 2 63
                                                   7 61 109 110 2 7 0 0 0 111 2
                                                   7 0 0 0 112 2 63 9 61 120
                                                   121 2 9 0 0 0 122 2 123 7 9
                                                   28 124 2 7 125 0 30 126 2 7
                                                   43 0 0 127 2 93 44 100 0 128
                                                   2 7 0 0 0 129 2 67 43 0 0
                                                   130 1 7 38 0 131 1 63 133
                                                   114 134 2 61 7 0 44 135 1
                                                   137 0 136 138 0 47 0 139 1
                                                   47 44 0 140 2 137 47 0 44
                                                   141 2 47 43 0 0 142 1 47 7 0
                                                   143 1 47 0 0 144 3 137 47 0
                                                   44 47 145 2 63 47 61 136 146
                                                   2 47 0 7 44 147 2 47 0 0 0
                                                   148 1 47 9 0 149 2 47 7 0 44
                                                   150 2 8 7 0 67 151 2 39 0 0
                                                   0 152 1 47 44 0 154 2 44 0 0
                                                   0 155 1 47 7 0 156 1 47 0 7
                                                   157 2 47 0 0 0 158 1 47 8 0
                                                   159 0 9 0 160 2 9 0 0 0 161
                                                   1 164 28 115 165 2 28 43 0 0
                                                   166 1 28 167 0 168 2 167 43
                                                   0 26 169 2 28 43 0 26 170 2
                                                   7 0 0 26 171 3 8 0 0 172 0
                                                   173 2 9 0 8 8 174 2 9 0 0 0
                                                   175 2 8 0 0 67 176 2 178 59
                                                   56 177 179 1 28 109 0 180 2
                                                   109 7 0 44 181 1 7 30 0 182
                                                   3 7 0 0 30 0 183 1 7 0 26
                                                   184 3 7 0 0 0 0 185 2 109 0
                                                   0 0 186 1 7 187 14 188 2 164
                                                   115 115 26 189 3 190 114 26
                                                   115 109 191 3 190 117 26 115
                                                   109 192 2 178 193 59 177 194
                                                   1 61 0 109 195 2 56 61 0 61
                                                   196 1 61 109 0 197 2 109 0
                                                   172 0 198 2 7 43 0 0 199 1
                                                   56 0 200 201 3 204 114 202
                                                   203 120 205 1 7 44 0 206 2 7
                                                   0 0 26 207 3 208 109 7 28 44
                                                   209 1 210 0 200 211 2 210
                                                   109 0 44 212 3 210 109 0 44
                                                   109 213 1 7 187 0 214 2 115
                                                   43 28 0 215 1 28 216 0 217 4
                                                   219 218 7 109 28 28 220 2
                                                   114 0 0 0 221 2 223 222 7 7
                                                   224 1 7 0 225 226 2 8 7 0 7
                                                   227 3 7 0 0 187 14 228 2 7 0
                                                   44 0 229 2 9 0 8 0 230 2 11
                                                   231 9 10 232 1 234 0 233 235
                                                   1 9 54 57 236 2 178 56 56
                                                   177 237 1 9 0 0 238 6 0 114
                                                   7 109 26 115 116 118 119 8 0
                                                   133 44 7 7 109 26 115 116
                                                   118 163 7 0 114 44 7 109 26
                                                   115 116 118 162 7 0 44 8 47
                                                   44 44 115 7 118 153)))))
           '|lookupComplete|)) 
