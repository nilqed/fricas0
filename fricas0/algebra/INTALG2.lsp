
(SDEFUN |INTALG2;exp_hermite1|
        ((|f| R)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)))
        (SPROG
         ((|h| (|Record| (|:| |answer| R) (|:| |logpart| R))) (|fp| (R))
          (|ff| (R)) (|w| (|Vector| R))
          (|r|
           (|Record|
            (|:| |polyPart|
                 (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
            (|:| |fracPart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#1=#:G721 NIL) (|i| NIL)
          (|vf| #2=(|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|vp| #2#) (|n| (|NonNegativeInteger|))
          (|v| #3=(|Vector| (|SparseUnivariatePolynomial| F)))
          (|d| #4=(|SparseUnivariatePolynomial| F))
          (|c| (|Record| (|:| |num| #3#) (|:| |den| #4#))))
         (SEQ
          (LETT |d|
                (QCDR
                 (LETT |c| (SPADCALL |f| (QREFELT $ 10))
                       . #5=(|INTALG2;exp_hermite1|)))
                . #5#)
          (LETT |v| (QCAR |c|) . #5#)
          (LETT |vp|
                (MAKEARR1 (LETT |n| (QVSIZE |v|) . #5#) (|spadConstant| $ 12))
                . #5#)
          (LETT |vf| (MAKEARR1 |n| (|spadConstant| $ 12)) . #5#)
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 17)) . #5#)
               (LETT #1# (QVSIZE |v|) . #5#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL (QAREF1O |v| |i| 1) |d| (QREFELT $ 19))
                       (QREFELT $ 22))
                      . #5#)
                (QSETAREF1O |vf| |i| (QCDR |r|) 1)
                (EXIT
                 (QSETAREF1O |vp| |i| (SPADCALL (QCAR |r|) (QREFELT $ 23)) 1)))
               (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |ff|
                (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT $ 25)) . #5#)
                          (QREFELT $ 27))
                . #5#)
          (LETT |fp| (SPADCALL |vp| |w| (QREFELT $ 27)) . #5#)
          (LETT |h| (SPADCALL |ff| |der| (QREFELT $ 31)) . #5#)
          (EXIT (VECTOR (QCAR |h|) (QCDR |h|) |fp|))))) 

(SDEFUN |INTALG2;prim_hermite1|
        ((|f| R)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)))
        (SPROG
         ((|fp| (R)) (|ff| (R)) (|w| (|Vector| R))
          (|r|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (#1=#:G731 NIL) (|i| NIL)
          (|vf| #2=(|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|vp| #2#) (|n| (|NonNegativeInteger|))
          (|v| #3=(|Vector| (|SparseUnivariatePolynomial| F)))
          (|d| #4=(|SparseUnivariatePolynomial| F))
          (|c| (|Record| (|:| |num| #3#) (|:| |den| #4#))) (|hh| (R))
          (|h| (|Record| (|:| |answer| R) (|:| |logpart| R))))
         (SEQ
          (LETT |h| (SPADCALL |f| |der| (QREFELT $ 31))
                . #5=(|INTALG2;prim_hermite1|))
          (EXIT
           (COND
            ((SPADCALL (LETT |hh| (QCDR |h|) . #5#) (QREFELT $ 33))
             (VECTOR (QCAR |h|) (|spadConstant| $ 34) (|spadConstant| $ 34)))
            ('T
             (SEQ
              (LETT |d| (QCDR (LETT |c| (SPADCALL |hh| (QREFELT $ 10)) . #5#))
                    . #5#)
              (LETT |v| (QCAR |c|) . #5#)
              (LETT |vp|
                    (MAKEARR1 (LETT |n| (QVSIZE |v|) . #5#)
                              (|spadConstant| $ 12))
                    . #5#)
              (LETT |vf| (MAKEARR1 |n| (|spadConstant| $ 12)) . #5#)
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 17)) . #5#)
                   (LETT #1# (QVSIZE |v|) . #5#) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |r| (SPADCALL (QAREF1O |v| |i| 1) |d| (QREFELT $ 36))
                          . #5#)
                    (QSETAREF1O |vf| |i|
                                (SPADCALL (QCDR |r|) |d| (QREFELT $ 19)) 1)
                    (EXIT
                     (QSETAREF1O |vp| |i| (SPADCALL (QCAR |r|) (QREFELT $ 37))
                                 1)))
                   (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |ff|
                    (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT $ 25)) . #5#)
                              (QREFELT $ 27))
                    . #5#)
              (LETT |fp| (SPADCALL |vp| |w| (QREFELT $ 27)) . #5#)
              (EXIT (VECTOR (QCAR |h|) |ff| |fp|))))))))) 

(SDEFUN |INTALG2;list_hermite|
        ((|lf| |List| R)
         (|hermite1| |Mapping|
          (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)) R)
         ($ |List|
          (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
        (SPROG ((#1=#:G739 NIL) (|f| NIL) (#2=#:G738 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|INTALG2;list_hermite|))
                 (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |f| |hermite1|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |INTALG2;lin_comb2| ((|v| |Vector| F) (|lr| |List| R) ($ R))
        (SPROG
         ((|res| (R)) (#1=#:G744 NIL) (|i| NIL) (#2=#:G745 NIL) (|r| NIL))
         (SEQ (LETT |res| (|spadConstant| $ 34) . #3=(|INTALG2;lin_comb2|))
              (SEQ (LETT |r| NIL . #3#) (LETT #2# |lr| . #3#)
                   (LETT |i| 1 . #3#) (LETT #1# (QVSIZE |v|) . #3#) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |v| |i| (QREFELT $ 39))
                                        (QREFELT $ 40))
                                       (QREFELT $ 37))
                                      |r| (QREFELT $ 41))
                                     (QREFELT $ 42))
                           . #3#)))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTALG2;split_logpart|
        ((|p| |Fraction| (|SparseUnivariatePolynomial| F))
         (|lg| |Fraction| (|SparseUnivariatePolynomial| F))
         (|dden| |SparseUnivariatePolynomial| F)
         ($ |Record|
          (|:| |polypart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|b| #1=(|SparseUnivariatePolynomial| F))
          (|a| #2=(|SparseUnivariatePolynomial| F))
          (|#G21|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (#3=#:G752 NIL)
          (|eeu|
           (|Union| (|Record| (|:| |coef1| #2#) (|:| |coef2| #1#))
                    #4="failed"))
          (|d1| (|SparseUnivariatePolynomial| F)) (#5=#:G748 NIL)
          (|g| (|SparseUnivariatePolynomial| F))
          (|d0| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |d0| (SPADCALL |lg| (QREFELT $ 43))
                . #6=(|INTALG2;split_logpart|))
          (LETT |g| (SPADCALL |dden| |d0| (QREFELT $ 44)) . #6#)
          (EXIT
           (COND ((SPADCALL |g| (QREFELT $ 45)) (CONS |p| |lg|))
                 (#7='T
                  (SEQ
                   (LETT |d1|
                         (PROG2
                             (LETT #5# (SPADCALL |d0| |g| (QREFELT $ 47))
                                   . #6#)
                             (QCDR #5#)
                           (|check_union2| (QEQCAR #5# 0)
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7))
                                           (|Union|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))
                                            "failed")
                                           #5#))
                         . #6#)
                   (EXIT
                    (COND
                     ((SPADCALL |d1| (QREFELT $ 45))
                      (CONS (SPADCALL |p| |lg| (QREFELT $ 48))
                            (|spadConstant| $ 12)))
                     (#7#
                      (SEQ
                       (LETT |eeu|
                             (SPADCALL |g| |d1| (SPADCALL |lg| (QREFELT $ 49))
                                       (QREFELT $ 52))
                             . #6#)
                       (PROGN
                        (LETT |#G21|
                              (PROG2 (LETT #3# |eeu| . #6#)
                                  (QCDR #3#)
                                (|check_union2| (QEQCAR #3# 0)
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
                                                 #4#)
                                                #3#))
                              . #6#)
                        (LETT |a| (QCAR |#G21|) . #6#)
                        (LETT |b| (QCDR |#G21|) . #6#)
                        |#G21|)
                       (EXIT
                        (CONS
                         (SPADCALL |p| (SPADCALL |a| |d1| (QREFELT $ 19))
                                   (QREFELT $ 48))
                         (SPADCALL |b| |g| (QREFELT $ 19))))))))))))))) 

(SDEFUN |INTALG2;split_logparts|
        ((|lup| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|llog| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|dden| |SparseUnivariatePolynomial| F)
         ($ |Record|
          (|:| |polypart|
               (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|:| |logpart|
               (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|lres| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|pres| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lg2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|p2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|#G27|
           (|Record|
            (|:| |polypart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#1=#:G767 NIL) (|p1| NIL) (#2=#:G768 NIL) (|lg1| NIL))
         (SEQ (LETT |pres| NIL . #3=(|INTALG2;split_logparts|))
              (LETT |lres| NIL . #3#)
              (SEQ (LETT |lg1| NIL . #3#) (LETT #2# |llog| . #3#)
                   (LETT |p1| NIL . #3#) (LETT #1# |lup| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p1| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |lg1| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G27| (|INTALG2;split_logpart| |p1| |lg1| |dden| $)
                           . #3#)
                     (LETT |p2| (QCAR |#G27|) . #3#)
                     (LETT |lg2| (QCDR |#G27|) . #3#)
                     |#G27|)
                    (LETT |lres| (CONS |lg2| |lres|) . #3#)
                    (EXIT (LETT |pres| (CONS |p2| |pres|) . #3#)))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |pres| (NREVERSE |pres|) . #3#)
              (LETT |lres| (NREVERSE |lres|) . #3#)
              (EXIT (CONS |pres| |lres|))))) 

(SDEFUN |INTALG2;diagextint|
        ((|dden| |SparseUnivariatePolynomial| F)
         (|dm| |Matrix| (|SparseUnivariatePolynomial| F)) (|w| |Vector| R)
         (|lpv| |List|
          (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|lgv| |List|
          (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|ca0| |List| R)
         (|ext| |Mapping|
          #1=(|List|
              (|Record|
               (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
               (|:| |coeffs| #2=(|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|rde| |Mapping|
          #3=(|List|
              (|Record|
               (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
               (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|csolve| |Mapping| #4=(|List| (|Vector| F)) (|Matrix| F))
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#5=#:G816 NIL) (|ai| NIL) (#6=#:G817 NIL) (|bv| NIL) (#7=#:G815 NIL)
          (|ca| (|List| R)) (|cb| (|List| #2#)) (|nca1| (|List| R))
          (#8=#:G814 NIL) (|be| NIL) (#9=#:G813 NIL) (|wi| (R))
          (|ncb1| (|List| #10=(|Vector| F))) (#11=#:G812 NIL) (#12=#:G811 NIL)
          (|res2| #3#)
          (|lup2| (|List| #13=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (#14=#:G810 NIL) (#15=#:G809 NIL) (|nca0| (|List| R))
          (#16=#:G808 NIL) (#17=#:G807 NIL) (|ncb0| (|List| #10#))
          (#18=#:G806 NIL) (#19=#:G805 NIL) (|res1| #4#) (|rs2| (|Matrix| F))
          (|rs1| (|Matrix| (|SparseUnivariatePolynomial| F)))
          (|llog2| (|List| #13#)) (#20=#:G804 NIL) (#21=#:G803 NIL)
          (|llog1| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lup1| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|#G44|
           (|Record|
            (|:| |polypart|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |logpart|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|llog0| (|List| #22=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (#23=#:G802 NIL) (|gv| NIL) (#24=#:G801 NIL) (|lup0| (|List| #22#))
          (#25=#:G800 NIL) (|pv| NIL) (#26=#:G799 NIL)
          (|dmi| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (#27=#:G798 NIL) (|i| NIL) (#28=#:G797 NIL) (|be0| NIL)
          (#29=#:G796 NIL) (#30=#:G795 NIL) (#31=#:G794 NIL) (|res0| #1#)
          (|lrf| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#32=#:G792 NIL) (#33=#:G793 NIL) (#34=#:G791 NIL))
         (SEQ
          (LETT |lrf|
                (PROGN
                 (LETT #34# NIL . #35=(|INTALG2;diagextint|))
                 (SEQ (LETT |gv| NIL . #35#) (LETT #33# |lgv| . #35#)
                      (LETT |pv| NIL . #35#) (LETT #32# |lpv| . #35#) G190
                      (COND
                       ((OR (ATOM #32#)
                            (PROGN (LETT |pv| (CAR #32#) . #35#) NIL)
                            (ATOM #33#)
                            (PROGN (LETT |gv| (CAR #33#) . #35#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #34#
                              (CONS
                               (SPADCALL (SPADCALL |pv| 1 (QREFELT $ 55))
                                         (SPADCALL |gv| 1 (QREFELT $ 55))
                                         (QREFELT $ 48))
                               #34#)
                              . #35#)))
                      (LETT #32#
                            (PROG1 (CDR #32#) (LETT #33# (CDR #33#) . #35#))
                            . #35#)
                      (GO G190) G191 (EXIT (NREVERSE #34#))))
                . #35#)
          (LETT |res0| (SPADCALL |lrf| |ext|) . #35#)
          (LETT |cb|
                (PROGN
                 (LETT #31# NIL . #35#)
                 (SEQ (LETT |be0| NIL . #35#) (LETT #30# |res0| . #35#) G190
                      (COND
                       ((OR (ATOM #30#)
                            (PROGN (LETT |be0| (CAR #30#) . #35#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #31# (CONS (QCDR |be0|) #31#) . #35#)))
                      (LETT #30# (CDR #30#) . #35#) (GO G190) G191
                      (EXIT (NREVERSE #31#))))
                . #35#)
          (LETT |wi| (SPADCALL |w| 1 (QREFELT $ 57)) . #35#)
          (LETT |ca|
                (PROGN
                 (LETT #29# NIL . #35#)
                 (SEQ (LETT |be0| NIL . #35#) (LETT #28# |res0| . #35#) G190
                      (COND
                       ((OR (ATOM #28#)
                            (PROGN (LETT |be0| (CAR #28#) . #35#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #29#
                              (CONS (SPADCALL (QCAR |be0|) |wi| (QREFELT $ 41))
                                    #29#)
                              . #35#)))
                      (LETT #28# (CDR #28#) . #35#) (GO G190) G191
                      (EXIT (NREVERSE #29#))))
                . #35#)
          (SEQ (LETT |i| 2 . #35#) (LETT #27# (QVSIZE |w|) . #35#) G190
               (COND ((|greater_SI| |i| #27#) (GO G191)))
               (SEQ
                (LETT |dmi|
                      (SPADCALL (SPADCALL |dm| |i| |i| (QREFELT $ 59)) |dden|
                                (QREFELT $ 19))
                      . #35#)
                (LETT |lup0|
                      (PROGN
                       (LETT #26# NIL . #35#)
                       (SEQ (LETT |pv| NIL . #35#) (LETT #25# |lpv| . #35#)
                            G190
                            (COND
                             ((OR (ATOM #25#)
                                  (PROGN (LETT |pv| (CAR #25#) . #35#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #26#
                                    (CONS (SPADCALL |pv| |i| (QREFELT $ 55))
                                          #26#)
                                    . #35#)))
                            (LETT #25# (CDR #25#) . #35#) (GO G190) G191
                            (EXIT (NREVERSE #26#))))
                      . #35#)
                (LETT |llog0|
                      (PROGN
                       (LETT #24# NIL . #35#)
                       (SEQ (LETT |gv| NIL . #35#) (LETT #23# |lgv| . #35#)
                            G190
                            (COND
                             ((OR (ATOM #23#)
                                  (PROGN (LETT |gv| (CAR #23#) . #35#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #24#
                                    (CONS (SPADCALL |gv| |i| (QREFELT $ 55))
                                          #24#)
                                    . #35#)))
                            (LETT #23# (CDR #23#) . #35#) (GO G190) G191
                            (EXIT (NREVERSE #24#))))
                      . #35#)
                (PROGN
                 (LETT |#G44|
                       (|INTALG2;split_logparts| |lup0| |llog0|
                        (SPADCALL |dmi| (QREFELT $ 43)) $)
                       . #35#)
                 (LETT |lup1| (QCAR |#G44|) . #35#)
                 (LETT |llog1| (QCDR |#G44|) . #35#)
                 |#G44|)
                (LETT |llog2|
                      (PROGN
                       (LETT #21# NIL . #35#)
                       (SEQ (LETT |bv| NIL . #35#) (LETT #20# |cb| . #35#) G190
                            (COND
                             ((OR (ATOM #20#)
                                  (PROGN (LETT |bv| (CAR #20#) . #35#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #21#
                                    (CONS
                                     (SPADCALL |bv| |llog1| (QREFELT $ 62))
                                     #21#)
                                    . #35#)))
                            (LETT #20# (CDR #20#) . #35#) (GO G190) G191
                            (EXIT (NREVERSE #21#))))
                      . #35#)
                (LETT |rs1|
                      (SPADCALL (SPADCALL (LIST |llog2|) (QREFELT $ 65))
                                (QREFELT $ 67))
                      . #35#)
                (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 69)) . #35#)
                (LETT |res1| (SPADCALL |rs2| |csolve|) . #35#)
                (LETT |ncb0|
                      (PROGN
                       (LETT #19# NIL . #35#)
                       (SEQ (LETT |bv| NIL . #35#) (LETT #18# |res1| . #35#)
                            G190
                            (COND
                             ((OR (ATOM #18#)
                                  (PROGN (LETT |bv| (CAR #18#) . #35#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #19#
                                    (CONS (SPADCALL |bv| |cb| (QREFELT $ 71))
                                          #19#)
                                    . #35#)))
                            (LETT #18# (CDR #18#) . #35#) (GO G190) G191
                            (EXIT (NREVERSE #19#))))
                      . #35#)
                (LETT |nca0|
                      (PROGN
                       (LETT #17# NIL . #35#)
                       (SEQ (LETT |bv| NIL . #35#) (LETT #16# |res1| . #35#)
                            G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |bv| (CAR #16#) . #35#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #17#
                                    (CONS (|INTALG2;lin_comb2| |bv| |ca| $)
                                          #17#)
                                    . #35#)))
                            (LETT #16# (CDR #16#) . #35#) (GO G190) G191
                            (EXIT (NREVERSE #17#))))
                      . #35#)
                (LETT |cb| |ncb0| . #35#) (LETT |ca| |nca0| . #35#)
                (LETT |lup2|
                      (PROGN
                       (LETT #15# NIL . #35#)
                       (SEQ (LETT |bv| NIL . #35#) (LETT #14# |cb| . #35#) G190
                            (COND
                             ((OR (ATOM #14#)
                                  (PROGN (LETT |bv| (CAR #14#) . #35#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #15#
                                    (CONS (SPADCALL |bv| |lup1| (QREFELT $ 62))
                                          #15#)
                                    . #35#)))
                            (LETT #14# (CDR #14#) . #35#) (GO G190) G191
                            (EXIT (NREVERSE #15#))))
                      . #35#)
                (LETT |res2| (SPADCALL |dmi| |lup2| |rde|) . #35#)
                (LETT |ncb1|
                      (PROGN
                       (LETT #12# NIL . #35#)
                       (SEQ (LETT |be| NIL . #35#) (LETT #11# |res2| . #35#)
                            G190
                            (COND
                             ((OR (ATOM #11#)
                                  (PROGN (LETT |be| (CAR #11#) . #35#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #12#
                                    (CONS
                                     (SPADCALL (QCDR |be|) |cb| (QREFELT $ 71))
                                     #12#)
                                    . #35#)))
                            (LETT #11# (CDR #11#) . #35#) (GO G190) G191
                            (EXIT (NREVERSE #12#))))
                      . #35#)
                (LETT |wi| (SPADCALL |w| |i| (QREFELT $ 57)) . #35#)
                (LETT |nca1|
                      (PROGN
                       (LETT #9# NIL . #35#)
                       (SEQ (LETT |be| NIL . #35#) (LETT #8# |res2| . #35#)
                            G190
                            (COND
                             ((OR (ATOM #8#)
                                  (PROGN (LETT |be| (CAR #8#) . #35#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #9#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL (QCAR |be|) |wi|
                                                (QREFELT $ 41))
                                      (|INTALG2;lin_comb2| (QCDR |be|) |ca| $)
                                      (QREFELT $ 42))
                                     #9#)
                                    . #35#)))
                            (LETT #8# (CDR #8#) . #35#) (GO G190) G191
                            (EXIT (NREVERSE #9#))))
                      . #35#)
                (LETT |cb| |ncb1| . #35#) (EXIT (LETT |ca| |nca1| . #35#)))
               (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #7# NIL . #35#)
            (SEQ (LETT |bv| NIL . #35#) (LETT #6# |cb| . #35#)
                 (LETT |ai| NIL . #35#) (LETT #5# |ca| . #35#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |ai| (CAR #5#) . #35#) NIL)
                       (ATOM #6#) (PROGN (LETT |bv| (CAR #6#) . #35#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #7#
                         (CONS
                          (CONS
                           (SPADCALL |ai| (|INTALG2;lin_comb2| |bv| |ca0| $)
                                     (QREFELT $ 72))
                           |bv|)
                          #7#)
                         . #35#)))
                 (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #35#))
                       . #35#)
                 (GO G190) G191 (EXIT (NREVERSE #7#)))))))) 

(SDEFUN |INTALG2;R_to_VQF|
        ((|p| R) ($ |Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G822 NIL) (|i| NIL)
          (|cden| #2=(|SparseUnivariatePolynomial| F))
          (|res| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|n| (|NonNegativeInteger|))
          (|numv| #3=(|Vector| (|SparseUnivariatePolynomial| F)))
          (|c| (|Record| (|:| |num| #3#) (|:| |den| #2#))))
         (SEQ
          (LETT |c| (SPADCALL |p| (QREFELT $ 10)) . #4=(|INTALG2;R_to_VQF|))
          (LETT |numv| (QCAR |c|) . #4#) (LETT |n| (QVSIZE |numv|) . #4#)
          (LETT |res| (MAKEARR1 |n| (|spadConstant| $ 12)) . #4#)
          (LETT |cden| (QCDR |c|) . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #1# |n| . #4#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |res| |i|
                           (SPADCALL (SPADCALL |numv| |i| (QREFELT $ 73))
                                     |cden| (QREFELT $ 19))
                           (QREFELT $ 74))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |INTALG2;algprimextint|
        ((|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|ext| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|rde| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|ca0| (|List| R)) (#1=#:G842 NIL) (|h| NIL) (#2=#:G841 NIL)
          (|dden| #3=(|SparseUnivariatePolynomial| F))
          (|dm|
           (|Record| (|:| |num| (|Matrix| (|SparseUnivariatePolynomial| F)))
                     (|:| |den| #3#)))
          (|w| (|Vector| R))
          (|lgv|
           (|List| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|lpv|
           (|List| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#4=#:G840 NIL)
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1| (CONS #'|INTALG2;algprimextint!0| (VECTOR $ |der|))
                . #5=(|INTALG2;algprimextint|))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $) . #5#)
          (LETT |lpv| NIL . #5#) (LETT |lgv| NIL . #5#)
          (SEQ (LETT |h| NIL . #5#) (LETT #4# |lh| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lpv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 2) $) |lpv|)
                      . #5#)
                (EXIT
                 (LETT |lgv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 1) $) |lgv|)
                       . #5#)))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |lpv| (NREVERSE |lpv|) . #5#)
          (LETT |lgv| (NREVERSE |lgv|) . #5#)
          (LETT |w| (SPADCALL (QREFELT $ 25)) . #5#)
          (LETT |dm| (SPADCALL |der| (QREFELT $ 76)) . #5#)
          (LETT |dden| (QCDR |dm|) . #5#)
          (LETT |ca0|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |h| NIL . #5#) (LETT #1# |lh| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |h| 0) #2#) . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (COND
           ((SPADCALL (SPADCALL |w| 1 (QREFELT $ 57)) (|spadConstant| $ 77)
                      (QREFELT $ 78))
            (COND
             ((SPADCALL (QCAR |dm|) (QREFELT $ 79))
              (EXIT
               (|INTALG2;diagextint| |dden| (QCAR |dm|) |w| |lpv| |lgv| |ca0|
                |ext| |rde| |csolve| $))))))
          (EXIT (|error| "algprimextint: non-root case unimplemented"))))) 

(SDEFUN |INTALG2;algprimextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1) . #1=(|INTALG2;algprimextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTALG2;prim_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algexpextint|
        ((|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|ext| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|rde| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|ca0| (|List| R)) (#1=#:G862 NIL) (|h| NIL) (#2=#:G861 NIL)
          (|dden| #3=(|SparseUnivariatePolynomial| F))
          (|dm|
           (|Record| (|:| |num| (|Matrix| (|SparseUnivariatePolynomial| F)))
                     (|:| |den| #3#)))
          (|lgv|
           (|List| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|lpv|
           (|List| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#4=#:G860 NIL) (|n| (|NonNegativeInteger|)) (|w| (|Vector| R))
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1| (CONS #'|INTALG2;algexpextint!0| (VECTOR $ |der|))
                . #5=(|INTALG2;algexpextint|))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $) . #5#)
          (LETT |lpv| NIL . #5#) (LETT |lgv| NIL . #5#)
          (LETT |w| (SPADCALL (QREFELT $ 25)) . #5#)
          (LETT |n| (QVSIZE |w|) . #5#)
          (SEQ (LETT |h| NIL . #5#) (LETT #4# |lh| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lpv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 2) $) |lpv|)
                      . #5#)
                (EXIT
                 (LETT |lgv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 1) $) |lgv|)
                       . #5#)))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |lpv| (NREVERSE |lpv|) . #5#)
          (LETT |lgv| (NREVERSE |lgv|) . #5#)
          (LETT |dm| (SPADCALL |der| (QREFELT $ 76)) . #5#)
          (LETT |dden| (QCDR |dm|) . #5#)
          (LETT |ca0|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |h| NIL . #5#) (LETT #1# |lh| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |h| 0) #2#) . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (COND
           ((SPADCALL (SPADCALL |w| 1 (QREFELT $ 57)) (|spadConstant| $ 77)
                      (QREFELT $ 78))
            (COND
             ((SPADCALL (QCAR |dm|) (QREFELT $ 79))
              (EXIT
               (|INTALG2;diagextint| |dden| (QCAR |dm|) |w| |lpv| |lgv| |ca0|
                |ext| |rde| |csolve| $))))))
          (EXIT (|error| "algexpextint: non-root case unimplemented"))))) 

(SDEFUN |INTALG2;algexpextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1) . #1=(|INTALG2;algexpextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTALG2;exp_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algextint_base;MMLL;11|
        ((|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|csolve| |Mapping| #1=(|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G879 NIL) (|bv| NIL) (#3=#:G878 NIL) (|ca0| (|List| R))
          (#4=#:G877 NIL) (|h| NIL) (#5=#:G876 NIL) (|res1| #1#)
          (|rs3| (|Matrix| F))
          (|rs2| (|Matrix| (|SparseUnivariatePolynomial| F)))
          (|rs1| (|Matrix| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lg1| (|List| R)) (#6=#:G875 NIL) (#7=#:G874 NIL)
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1|
                (CONS #'|INTALG2;algextint_base;MMLL;11!0| (VECTOR $ |der|))
                . #8=(|INTALG2;algextint_base;MMLL;11|))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $) . #8#)
          (LETT |lg1|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |h| NIL . #8#) (LETT #6# |lh| . #8#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |h| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (SPADCALL (QVELT |h| 1) (QVELT |h| 2)
                                         (QREFELT $ 42))
                               #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |rs1|
                (SPADCALL (SPADCALL (LIST |lg1|) (QREFELT $ 82))
                          (QREFELT $ 83))
                . #8#)
          (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 67)) . #8#)
          (LETT |rs3| (SPADCALL |rs2| (QREFELT $ 69)) . #8#)
          (LETT |res1| (SPADCALL |rs3| |csolve|) . #8#)
          (LETT |ca0|
                (PROGN
                 (LETT #5# NIL . #8#)
                 (SEQ (LETT |h| NIL . #8#) (LETT #4# |lh| . #8#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#) . #8#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #5# (CONS (QVELT |h| 0) #5#) . #8#)))
                      (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #8#)
          (EXIT
           (PROGN
            (LETT #3# NIL . #8#)
            (SEQ (LETT |bv| NIL . #8#) (LETT #2# |res1| . #8#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |bv| (CAR #2#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (CONS
                           (SPADCALL (|INTALG2;lin_comb2| |bv| |ca0| $)
                                     (QREFELT $ 84))
                           |bv|)
                          #3#)
                         . #8#)))
                 (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |INTALG2;algextint_base;MMLL;11!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1) . #1=(|INTALG2;algextint_base;MMLL;11|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTALG2;prim_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algextint;MMMMLL;12|
        ((|der| |Mapping| #1=(|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|ext| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|rde| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G905 NIL)
          (|xx| (|Union| (|SparseUnivariatePolynomial| F) "failed")) (|x'| #1#)
          (|x| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |x'|
                (SPADCALL
                 (LETT |x| (SPADCALL (|spadConstant| $ 54) 1 (QREFELT $ 91))
                       . #3=(|INTALG2;algextint;MMMMLL;12|))
                 |der|)
                . #3#)
          (EXIT
           (COND
            ((ZEROP (SPADCALL |x'| (QREFELT $ 92)))
             (|INTALG2;algprimextint| |der| |ext| |rde| |csolve| |lg| $))
            ('T
             (SEQ
              (EXIT
               (SEQ
                (SEQ (LETT |xx| (SPADCALL |x'| |x| (QREFELT $ 47)) . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |xx| 0)
                        (COND
                         ((QEQCAR (SPADCALL (QCDR |xx|) (QREFELT $ 94)) 0)
                          (PROGN
                           (LETT #2#
                                 (|INTALG2;algexpextint| |der| |ext| |rde|
                                  |csolve| |lg| $)
                                 . #3#)
                           (GO #4=#:G899))))))))
                (EXIT (|error| "algextint: unhandled case"))))
              #4# (EXIT #2#)))))))) 

(DECLAIM (NOTINLINE |AlgebraicIntegrate2;|)) 

(DEFUN |AlgebraicIntegrate2| (&REST #1=#:G906)
  (SPROG NIL
         (PROG (#2=#:G907)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicIntegrate2|)
                                               '|domainEqualList|)
                    . #3=(|AlgebraicIntegrate2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicIntegrate2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicIntegrate2|)))))))))) 

(DEFUN |AlgebraicIntegrate2;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicIntegrate2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|AlgebraicIntegrate2| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 99) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|AlgebraicIntegrate2|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|AlgebraicIntegrate2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Record| (|:| |num| 16) (|:| |den| 18))
              (0 . |integralCoordinates|) (|Fraction| 18) (5 . |Zero|)
              (9 . |Zero|) (13 . |Zero|) (|Integer|) (|Vector| 18)
              (17 . |minIndex|) (|SparseUnivariatePolynomial| 7) (22 . /)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 11))
              (|LaurentPolynomial| 7 18) (28 . |separate|) (33 . |convert|)
              (|Vector| $) (38 . |integralBasis|) (|Vector| 11)
              (42 . |represents|) (|Record| (|:| |answer| 8) (|:| |logpart| 8))
              (|Mapping| 18 18)
              (|AlgebraicHermiteIntegration| 7 18
                                             (|SparseUnivariatePolynomial| 11)
                                             8)
              (48 . |HermiteIntegrate|) (|Boolean|) (54 . |zero?|)
              (59 . |Zero|) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (63 . |divide|) (69 . |coerce|) (|Vector| 7) (74 . |elt|)
              (80 . |coerce|) (85 . *) (91 . +) (97 . |denom|) (102 . |gcd|)
              (108 . |ground?|) (|Union| $ '"failed") (113 . |exquo|) (119 . +)
              (125 . |numer|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 50 '"failed") (130 . |extendedEuclidean|) (137 . |One|)
              (141 . |One|) (145 . |elt|) (|Vector| 8) (151 . |elt|)
              (|Matrix| 18) (157 . |elt|) (|List| 11)
              (|LinearCombinationUtilities| 7 18) (164 . |lin_comb|)
              (|List| 60) (|Matrix| 11) (170 . |matrix|) (|Matrix| $)
              (175 . |reducedSystem|) (|Matrix| 7) (180 . |reducedSystem|)
              (|List| 38) (185 . |lin_comb|) (191 . -) (197 . |elt|)
              (203 . |setelt!|) (|Record| (|:| |num| 58) (|:| |den| 18))
              (210 . |integralDerivationMatrix|) (215 . |One|) (219 . =)
              (225 . |diagonal?|) (|List| 88) (|Matrix| 8) (230 . |matrix|)
              (235 . |reducedSystem|) (240 . -)
              (|Record| (|:| |ratpart| 8) (|:| |coeffs| 38)) (|List| 85)
              (|Mapping| 70 68) (|List| 8) |INTALG2;algextint_base;MMLL;11|
              (|NonNegativeInteger|) (245 . |monomial|) (251 . |degree|)
              (|Union| 7 '"failed") (256 . |retractIfCan|)
              (|Record| (|:| |ratpart| 11) (|:| |coeffs| 38))
              (|Mapping| (|List| 95) 60) (|Mapping| (|List| 95) 11 60)
              |INTALG2;algextint;MMMMLL;12|)
           '#(|algextint_base| 261 |algextint| 268) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 98
                                                 '(1 8 9 0 10 0 11 0 12 0 6 0
                                                   13 0 7 0 14 1 16 15 0 17 2
                                                   11 0 18 18 19 1 21 20 11 22
                                                   1 21 11 0 23 0 8 24 25 2 8 0
                                                   26 24 27 2 30 28 8 29 31 1 8
                                                   32 0 33 0 8 0 34 2 18 35 0 0
                                                   36 1 11 0 18 37 2 38 7 0 15
                                                   39 1 18 0 7 40 2 8 0 11 0 41
                                                   2 8 0 0 0 42 1 11 18 0 43 2
                                                   18 0 0 0 44 1 18 32 0 45 2
                                                   18 46 0 0 47 2 11 0 0 0 48 1
                                                   11 18 0 49 3 18 51 0 0 0 52
                                                   0 6 0 53 0 7 0 54 2 26 11 0
                                                   15 55 2 56 8 0 15 57 3 58 18
                                                   0 15 15 59 2 61 11 38 60 62
                                                   1 64 0 63 65 1 11 58 66 67 1
                                                   18 68 66 69 2 61 38 38 70 71
                                                   2 8 0 0 0 72 2 16 18 0 15 73
                                                   3 26 11 0 15 11 74 1 8 75 29
                                                   76 0 8 0 77 2 8 32 0 0 78 1
                                                   58 32 0 79 1 81 0 80 82 1 8
                                                   64 66 83 1 8 0 0 84 2 18 0 7
                                                   90 91 1 18 90 0 92 1 18 93 0
                                                   94 3 0 86 29 87 88 89 5 0 86
                                                   29 96 97 87 88 98)))))
           '|lookupComplete|)) 
