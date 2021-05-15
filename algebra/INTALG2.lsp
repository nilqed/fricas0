
(SDEFUN |INTALG2;exp_hermite1|
        ((|f| R) (|der| |Mapping| UP UP)
         ($ |Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)))
        (SPROG
         ((|h| (|Record| (|:| |answer| R) (|:| |logpart| R))) (|fp| (R))
          (|ff| (R)) (|w| (|Vector| R))
          (|r|
           (|Record| (|:| |polyPart| (|LaurentPolynomial| F UP))
                     (|:| |fracPart| (|Fraction| UP))))
          (#1=#:G396 NIL) (|i| NIL) (|vf| #2=(|Vector| (|Fraction| UP)))
          (|vp| #2#) (|n| (|NonNegativeInteger|)) (|v| #3=(|Vector| UP))
          (|d| (UP)) (|c| (|Record| (|:| |num| #3#) (|:| |den| UP))))
         (SEQ (LETT |d| (QCDR (LETT |c| (SPADCALL |f| (QREFELT $ 12)))))
              (LETT |v| (QCAR |c|))
              (LETT |vp|
                    (MAKEARR1 (LETT |n| (QVSIZE |v|)) (|spadConstant| $ 14)))
              (LETT |vf| (MAKEARR1 |n| (|spadConstant| $ 14)))
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 19)))
                   (LETT #1# (QVSIZE |v|)) G190 (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL (QAREF1O |v| |i| 1) |d| (QREFELT $ 20))
                           (QREFELT $ 23)))
                    (QSETAREF1O |vf| |i| (QCDR |r|) 1)
                    (EXIT
                     (QSETAREF1O |vp| |i| (SPADCALL (QCAR |r|) (QREFELT $ 24))
                                 1)))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |ff|
                    (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT $ 26)))
                              (QREFELT $ 28)))
              (LETT |fp| (SPADCALL |vp| |w| (QREFELT $ 28)))
              (LETT |h| (SPADCALL |ff| |der| (QREFELT $ 32)))
              (EXIT (VECTOR (QCAR |h|) (QCDR |h|) |fp|))))) 

(SDEFUN |INTALG2;prim_hermite1|
        ((|f| R) (|der| |Mapping| UP UP)
         ($ |Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)))
        (SPROG
         ((|fp| (R)) (|ff| (R)) (|w| (|Vector| R))
          (|r| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (#1=#:G406 NIL) (|i| NIL) (|vf| #2=(|Vector| (|Fraction| UP)))
          (|vp| #2#) (|n| (|NonNegativeInteger|)) (|v| #3=(|Vector| UP))
          (|d| (UP)) (|c| (|Record| (|:| |num| #3#) (|:| |den| UP))) (|hh| (R))
          (|h| (|Record| (|:| |answer| R) (|:| |logpart| R))))
         (SEQ (LETT |h| (SPADCALL |f| |der| (QREFELT $ 32)))
              (EXIT
               (COND
                ((SPADCALL (LETT |hh| (QCDR |h|)) (QREFELT $ 34))
                 (VECTOR (QCAR |h|) (|spadConstant| $ 35)
                         (|spadConstant| $ 35)))
                ('T
                 (SEQ
                  (LETT |d| (QCDR (LETT |c| (SPADCALL |hh| (QREFELT $ 12)))))
                  (LETT |v| (QCAR |c|))
                  (LETT |vp|
                        (MAKEARR1 (LETT |n| (QVSIZE |v|))
                                  (|spadConstant| $ 14)))
                  (LETT |vf| (MAKEARR1 |n| (|spadConstant| $ 14)))
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 19)))
                       (LETT #1# (QVSIZE |v|)) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (LETT |r|
                              (SPADCALL (QAREF1O |v| |i| 1) |d|
                                        (QREFELT $ 37)))
                        (QSETAREF1O |vf| |i|
                                    (SPADCALL (QCDR |r|) |d| (QREFELT $ 20)) 1)
                        (EXIT
                         (QSETAREF1O |vp| |i|
                                     (SPADCALL (QCAR |r|) (QREFELT $ 38)) 1)))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (LETT |ff|
                        (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT $ 26)))
                                  (QREFELT $ 28)))
                  (LETT |fp| (SPADCALL |vp| |w| (QREFELT $ 28)))
                  (EXIT (VECTOR (QCAR |h|) |ff| |fp|))))))))) 

(SDEFUN |INTALG2;list_hermite|
        ((|lf| |List| R)
         (|hermite1| |Mapping|
          (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)) R)
         ($ |List|
          (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
        (SPROG ((#1=#:G410 NIL) (|f| NIL) (#2=#:G409 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (SPADCALL |f| |hermite1|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |INTALG2;lin_comb2| ((|v| |Vector| F) (|lr| |List| R) ($ R))
        (SPROG
         ((|res| (R)) (#1=#:G414 NIL) (|i| NIL) (#2=#:G415 NIL) (|r| NIL))
         (SEQ (LETT |res| (|spadConstant| $ 35))
              (SEQ (LETT |r| NIL) (LETT #2# |lr|) (LETT |i| 1)
                   (LETT #1# (QVSIZE |v|)) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |r| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |v| |i| (QREFELT $ 40))
                                        (QREFELT $ 41))
                                       (QREFELT $ 38))
                                      |r| (QREFELT $ 42))
                                     (QREFELT $ 43)))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTALG2;split_logpart|
        ((|p| |Fraction| UP) (|lg| |Fraction| UP) (|dden| UP)
         ($ |Record| (|:| |polypart| (|Fraction| UP))
          (|:| |logpart| (|Fraction| UP))))
        (SPROG
         ((|b| (UP)) (|a| (UP))
          (|#G23| (|Record| (|:| |coef1| UP) (|:| |coef2| UP))) (#1=#:G422 NIL)
          (|eeu|
           (|Union| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)) #2="failed"))
          (|d1| (UP)) (#3=#:G418 NIL) (|g| (UP)) (|d0| (UP)))
         (SEQ (LETT |d0| (SPADCALL |lg| (QREFELT $ 44)))
              (LETT |g| (SPADCALL |dden| |d0| (QREFELT $ 45)))
              (EXIT
               (COND ((SPADCALL |g| (QREFELT $ 46)) (CONS |p| |lg|))
                     (#4='T
                      (SEQ
                       (LETT |d1|
                             (PROG2
                                 (LETT #3# (SPADCALL |d0| |g| (QREFELT $ 48)))
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0) (QREFELT $ 8)
                                               (|Union| (QREFELT $ 8) "failed")
                                               #3#)))
                       (EXIT
                        (COND
                         ((SPADCALL |d1| (QREFELT $ 46))
                          (CONS (SPADCALL |p| |lg| (QREFELT $ 49))
                                (|spadConstant| $ 14)))
                         (#4#
                          (SEQ
                           (LETT |eeu|
                                 (SPADCALL |g| |d1|
                                           (SPADCALL |lg| (QREFELT $ 50))
                                           (QREFELT $ 53)))
                           (PROGN
                            (LETT |#G23|
                                  (PROG2 (LETT #1# |eeu|)
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (|Record|
                                                     (|:| |coef1|
                                                          (QREFELT $ 8))
                                                     (|:| |coef2|
                                                          (QREFELT $ 8)))
                                                    (|Union|
                                                     (|Record|
                                                      (|:| |coef1|
                                                           (QREFELT $ 8))
                                                      (|:| |coef2|
                                                           (QREFELT $ 8)))
                                                     #2#)
                                                    #1#)))
                            (LETT |a| (QCAR |#G23|))
                            (LETT |b| (QCDR |#G23|))
                            |#G23|)
                           (EXIT
                            (CONS
                             (SPADCALL |p| (SPADCALL |a| |d1| (QREFELT $ 20))
                                       (QREFELT $ 49))
                             (SPADCALL |b| |g| (QREFELT $ 20))))))))))))))) 

(SDEFUN |INTALG2;split_logparts|
        ((|lup| |List| (|Fraction| UP)) (|llog| |List| (|Fraction| UP))
         (|dden| UP)
         ($ |Record| (|:| |polypart| (|List| (|Fraction| UP)))
          (|:| |logpart| (|List| (|Fraction| UP)))))
        (SPROG
         ((|lres| (|List| (|Fraction| UP))) (|pres| (|List| (|Fraction| UP)))
          (|lg2| (|Fraction| UP)) (|p2| (|Fraction| UP))
          (|#G29|
           (|Record| (|:| |polypart| (|Fraction| UP))
                     (|:| |logpart| (|Fraction| UP))))
          (#1=#:G433 NIL) (|p1| NIL) (#2=#:G434 NIL) (|lg1| NIL))
         (SEQ (LETT |pres| NIL) (LETT |lres| NIL)
              (SEQ (LETT |lg1| NIL) (LETT #2# |llog|) (LETT |p1| NIL)
                   (LETT #1# |lup|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p1| (CAR #1#)) NIL)
                         (ATOM #2#) (PROGN (LETT |lg1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G29|
                           (|INTALG2;split_logpart| |p1| |lg1| |dden| $))
                     (LETT |p2| (QCAR |#G29|))
                     (LETT |lg2| (QCDR |#G29|))
                     |#G29|)
                    (LETT |lres| (CONS |lg2| |lres|))
                    (EXIT (LETT |pres| (CONS |p2| |pres|))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |pres| (NREVERSE |pres|)) (LETT |lres| (NREVERSE |lres|))
              (EXIT (CONS |pres| |lres|))))) 

(SDEFUN |INTALG2;diagextint|
        ((|dden| UP) (|dm| |Matrix| UP) (|w| |Vector| R)
         (|lpv| |List| (|Vector| (|Fraction| UP)))
         (|lgv| |List| (|Vector| (|Fraction| UP))) (|ca0| |List| R)
         (|ext| |Mapping|
          #1=(|List|
              (|Record| (|:| |ratpart| (|Fraction| UP))
                        (|:| |coeffs| #2=(|Vector| F))))
          (|List| (|Fraction| UP)))
         (|rde| |Mapping|
          #3=(|List|
              (|Record| (|:| |ratpart| (|Fraction| UP))
                        (|:| |coeffs| (|Vector| F))))
          (|Fraction| UP) (|List| (|Fraction| UP)))
         (|csolve| |Mapping| #4=(|List| (|Vector| F)) (|Matrix| F))
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#5=#:G478 NIL) (|ai| NIL) (#6=#:G479 NIL) (|bv| NIL) (#7=#:G477 NIL)
          (|ca| (|List| R)) (|cb| (|List| #2#)) (|nca1| (|List| R))
          (#8=#:G476 NIL) (|be| NIL) (#9=#:G475 NIL) (|wi| (R))
          (|ncb1| (|List| #10=(|Vector| F))) (#11=#:G474 NIL) (#12=#:G473 NIL)
          (|res2| #3#) (|lup2| (|List| #13=(|Fraction| UP))) (#14=#:G472 NIL)
          (#15=#:G471 NIL) (|nca0| (|List| R)) (#16=#:G470 NIL)
          (#17=#:G469 NIL) (|ncb0| (|List| #10#)) (#18=#:G468 NIL)
          (#19=#:G467 NIL) (|res1| #4#) (|rs2| (|Matrix| F))
          (|rs1| (|Matrix| UP)) (|llog2| (|List| #13#)) (#20=#:G466 NIL)
          (#21=#:G465 NIL) (|llog1| (|List| (|Fraction| UP)))
          (|lup1| (|List| (|Fraction| UP)))
          (|#G46|
           (|Record| (|:| |polypart| (|List| (|Fraction| UP)))
                     (|:| |logpart| (|List| (|Fraction| UP)))))
          (|llog0| (|List| #22=(|Fraction| UP))) (#23=#:G464 NIL) (|gv| NIL)
          (#24=#:G463 NIL) (|lup0| (|List| #22#)) (#25=#:G462 NIL) (|pv| NIL)
          (#26=#:G461 NIL) (|dmi| (|Fraction| UP)) (#27=#:G460 NIL) (|i| NIL)
          (#28=#:G459 NIL) (|be0| NIL) (#29=#:G458 NIL) (#30=#:G457 NIL)
          (#31=#:G456 NIL) (|res0| #1#) (|lrf| (|List| (|Fraction| UP)))
          (#32=#:G454 NIL) (#33=#:G455 NIL) (#34=#:G453 NIL))
         (SEQ
          (LETT |lrf|
                (PROGN
                 (LETT #34# NIL)
                 (SEQ (LETT |gv| NIL) (LETT #33# |lgv|) (LETT |pv| NIL)
                      (LETT #32# |lpv|) G190
                      (COND
                       ((OR (ATOM #32#) (PROGN (LETT |pv| (CAR #32#)) NIL)
                            (ATOM #33#) (PROGN (LETT |gv| (CAR #33#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #34#
                              (CONS
                               (SPADCALL (SPADCALL |pv| 1 (QREFELT $ 56))
                                         (SPADCALL |gv| 1 (QREFELT $ 56))
                                         (QREFELT $ 49))
                               #34#))))
                      (LETT #32# (PROG1 (CDR #32#) (LETT #33# (CDR #33#))))
                      (GO G190) G191 (EXIT (NREVERSE #34#)))))
          (LETT |res0| (SPADCALL |lrf| |ext|))
          (LETT |cb|
                (PROGN
                 (LETT #31# NIL)
                 (SEQ (LETT |be0| NIL) (LETT #30# |res0|) G190
                      (COND
                       ((OR (ATOM #30#) (PROGN (LETT |be0| (CAR #30#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #31# (CONS (QCDR |be0|) #31#))))
                      (LETT #30# (CDR #30#)) (GO G190) G191
                      (EXIT (NREVERSE #31#)))))
          (LETT |wi| (SPADCALL |w| 1 (QREFELT $ 58)))
          (LETT |ca|
                (PROGN
                 (LETT #29# NIL)
                 (SEQ (LETT |be0| NIL) (LETT #28# |res0|) G190
                      (COND
                       ((OR (ATOM #28#) (PROGN (LETT |be0| (CAR #28#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #29#
                              (CONS (SPADCALL (QCAR |be0|) |wi| (QREFELT $ 42))
                                    #29#))))
                      (LETT #28# (CDR #28#)) (GO G190) G191
                      (EXIT (NREVERSE #29#)))))
          (SEQ (LETT |i| 2) (LETT #27# (QVSIZE |w|)) G190
               (COND ((|greater_SI| |i| #27#) (GO G191)))
               (SEQ
                (LETT |dmi|
                      (SPADCALL (SPADCALL |dm| |i| |i| (QREFELT $ 60)) |dden|
                                (QREFELT $ 20)))
                (LETT |lup0|
                      (PROGN
                       (LETT #26# NIL)
                       (SEQ (LETT |pv| NIL) (LETT #25# |lpv|) G190
                            (COND
                             ((OR (ATOM #25#)
                                  (PROGN (LETT |pv| (CAR #25#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #26#
                                    (CONS (SPADCALL |pv| |i| (QREFELT $ 56))
                                          #26#))))
                            (LETT #25# (CDR #25#)) (GO G190) G191
                            (EXIT (NREVERSE #26#)))))
                (LETT |llog0|
                      (PROGN
                       (LETT #24# NIL)
                       (SEQ (LETT |gv| NIL) (LETT #23# |lgv|) G190
                            (COND
                             ((OR (ATOM #23#)
                                  (PROGN (LETT |gv| (CAR #23#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #24#
                                    (CONS (SPADCALL |gv| |i| (QREFELT $ 56))
                                          #24#))))
                            (LETT #23# (CDR #23#)) (GO G190) G191
                            (EXIT (NREVERSE #24#)))))
                (PROGN
                 (LETT |#G46|
                       (|INTALG2;split_logparts| |lup0| |llog0|
                        (SPADCALL |dmi| (QREFELT $ 44)) $))
                 (LETT |lup1| (QCAR |#G46|))
                 (LETT |llog1| (QCDR |#G46|))
                 |#G46|)
                (LETT |llog2|
                      (PROGN
                       (LETT #21# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #20# |cb|) G190
                            (COND
                             ((OR (ATOM #20#)
                                  (PROGN (LETT |bv| (CAR #20#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #21#
                                    (CONS
                                     (SPADCALL |bv| |llog1| (QREFELT $ 63))
                                     #21#))))
                            (LETT #20# (CDR #20#)) (GO G190) G191
                            (EXIT (NREVERSE #21#)))))
                (LETT |rs1|
                      (SPADCALL (SPADCALL (LIST |llog2|) (QREFELT $ 66))
                                (QREFELT $ 68)))
                (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 70)))
                (LETT |res1| (SPADCALL |rs2| |csolve|))
                (LETT |ncb0|
                      (PROGN
                       (LETT #19# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #18# |res1|) G190
                            (COND
                             ((OR (ATOM #18#)
                                  (PROGN (LETT |bv| (CAR #18#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #19#
                                    (CONS (SPADCALL |bv| |cb| (QREFELT $ 72))
                                          #19#))))
                            (LETT #18# (CDR #18#)) (GO G190) G191
                            (EXIT (NREVERSE #19#)))))
                (LETT |nca0|
                      (PROGN
                       (LETT #17# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #16# |res1|) G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |bv| (CAR #16#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #17#
                                    (CONS (|INTALG2;lin_comb2| |bv| |ca| $)
                                          #17#))))
                            (LETT #16# (CDR #16#)) (GO G190) G191
                            (EXIT (NREVERSE #17#)))))
                (LETT |cb| |ncb0|) (LETT |ca| |nca0|)
                (LETT |lup2|
                      (PROGN
                       (LETT #15# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #14# |cb|) G190
                            (COND
                             ((OR (ATOM #14#)
                                  (PROGN (LETT |bv| (CAR #14#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #15#
                                    (CONS (SPADCALL |bv| |lup1| (QREFELT $ 63))
                                          #15#))))
                            (LETT #14# (CDR #14#)) (GO G190) G191
                            (EXIT (NREVERSE #15#)))))
                (LETT |res2| (SPADCALL |dmi| |lup2| |rde|))
                (LETT |ncb1|
                      (PROGN
                       (LETT #12# NIL)
                       (SEQ (LETT |be| NIL) (LETT #11# |res2|) G190
                            (COND
                             ((OR (ATOM #11#)
                                  (PROGN (LETT |be| (CAR #11#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #12#
                                    (CONS
                                     (SPADCALL (QCDR |be|) |cb| (QREFELT $ 72))
                                     #12#))))
                            (LETT #11# (CDR #11#)) (GO G190) G191
                            (EXIT (NREVERSE #12#)))))
                (LETT |wi| (SPADCALL |w| |i| (QREFELT $ 58)))
                (LETT |nca1|
                      (PROGN
                       (LETT #9# NIL)
                       (SEQ (LETT |be| NIL) (LETT #8# |res2|) G190
                            (COND
                             ((OR (ATOM #8#) (PROGN (LETT |be| (CAR #8#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #9#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL (QCAR |be|) |wi|
                                                (QREFELT $ 42))
                                      (|INTALG2;lin_comb2| (QCDR |be|) |ca| $)
                                      (QREFELT $ 43))
                                     #9#))))
                            (LETT #8# (CDR #8#)) (GO G190) G191
                            (EXIT (NREVERSE #9#)))))
                (LETT |cb| |ncb1|) (EXIT (LETT |ca| |nca1|)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #7# NIL)
            (SEQ (LETT |bv| NIL) (LETT #6# |cb|) (LETT |ai| NIL)
                 (LETT #5# |ca|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |ai| (CAR #5#)) NIL) (ATOM #6#)
                       (PROGN (LETT |bv| (CAR #6#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #7#
                         (CONS
                          (CONS
                           (SPADCALL |ai| (|INTALG2;lin_comb2| |bv| |ca0| $)
                                     (QREFELT $ 73))
                           |bv|)
                          #7#))))
                 (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#)))) (GO G190)
                 G191 (EXIT (NREVERSE #7#)))))))) 

(SDEFUN |INTALG2;R_to_VQF| ((|p| R) ($ |Vector| (|Fraction| UP)))
        (SPROG
         ((#1=#:G484 NIL) (|i| NIL) (|cden| (UP))
          (|res| (|Vector| (|Fraction| UP))) (|n| (|NonNegativeInteger|))
          (|numv| #2=(|Vector| UP))
          (|c| (|Record| (|:| |num| #2#) (|:| |den| UP))))
         (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 12))) (LETT |numv| (QCAR |c|))
              (LETT |n| (QVSIZE |numv|))
              (LETT |res| (MAKEARR1 |n| (|spadConstant| $ 14)))
              (LETT |cden| (QCDR |c|))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |res| |i|
                               (SPADCALL (SPADCALL |numv| |i| (QREFELT $ 74))
                                         |cden| (QREFELT $ 20))
                               (QREFELT $ 75))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTALG2;algprimextint|
        ((|der| |Mapping| UP UP)
         (|ext| |Mapping|
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| UP)))
         (|rde| |Mapping|
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))
          (|Fraction| UP) (|List| (|Fraction| UP)))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|ca0| (|List| R)) (#1=#:G504 NIL) (|h| NIL) (#2=#:G503 NIL)
          (|dden| (UP))
          (|dm| (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
          (|w| (|Vector| R)) (|lgv| (|List| (|Vector| (|Fraction| UP))))
          (|lpv| (|List| (|Vector| (|Fraction| UP)))) (#3=#:G502 NIL)
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1| (CONS #'|INTALG2;algprimextint!0| (VECTOR $ |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $))
          (LETT |lpv| NIL) (LETT |lgv| NIL)
          (SEQ (LETT |h| NIL) (LETT #3# |lh|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |h| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (LETT |lpv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 2) $) |lpv|))
                (EXIT
                 (LETT |lgv|
                       (CONS (|INTALG2;R_to_VQF| (QVELT |h| 1) $) |lgv|))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (LETT |lpv| (NREVERSE |lpv|)) (LETT |lgv| (NREVERSE |lgv|))
          (LETT |w| (SPADCALL (QREFELT $ 26)))
          (LETT |dm| (SPADCALL |der| (QREFELT $ 77))) (LETT |dden| (QCDR |dm|))
          (LETT |ca0|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |h| NIL) (LETT #1# |lh|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |h| 0) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (COND
           ((SPADCALL (SPADCALL |w| 1 (QREFELT $ 58)) (|spadConstant| $ 78)
                      (QREFELT $ 79))
            (COND
             ((SPADCALL (QCAR |dm|) (QREFELT $ 80))
              (EXIT
               (|INTALG2;diagextint| |dden| (QCAR |dm|) |w| |lpv| |lgv| |ca0|
                |ext| |rde| |csolve| $))))))
          (EXIT (|error| "algprimextint: non-root case unimplemented"))))) 

(SDEFUN |INTALG2;algprimextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;prim_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algexpextint|
        ((|der| |Mapping| UP UP)
         (|ext| |Mapping|
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| UP)))
         (|rde| |Mapping|
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))
          (|Fraction| UP) (|List| (|Fraction| UP)))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|ca0| (|List| R)) (#1=#:G524 NIL) (|h| NIL) (#2=#:G523 NIL)
          (|dden| (UP))
          (|dm| (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
          (|lgv| (|List| (|Vector| (|Fraction| UP))))
          (|lpv| (|List| (|Vector| (|Fraction| UP)))) (#3=#:G522 NIL)
          (|n| (|NonNegativeInteger|)) (|w| (|Vector| R))
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1| (CONS #'|INTALG2;algexpextint!0| (VECTOR $ |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $))
          (LETT |lpv| NIL) (LETT |lgv| NIL)
          (LETT |w| (SPADCALL (QREFELT $ 26))) (LETT |n| (QVSIZE |w|))
          (SEQ (LETT |h| NIL) (LETT #3# |lh|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |h| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (LETT |lpv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 2) $) |lpv|))
                (EXIT
                 (LETT |lgv|
                       (CONS (|INTALG2;R_to_VQF| (QVELT |h| 1) $) |lgv|))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (LETT |lpv| (NREVERSE |lpv|)) (LETT |lgv| (NREVERSE |lgv|))
          (LETT |dm| (SPADCALL |der| (QREFELT $ 77))) (LETT |dden| (QCDR |dm|))
          (LETT |ca0|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |h| NIL) (LETT #1# |lh|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |h| 0) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (COND
           ((SPADCALL (SPADCALL |w| 1 (QREFELT $ 58)) (|spadConstant| $ 78)
                      (QREFELT $ 79))
            (COND
             ((SPADCALL (QCAR |dm|) (QREFELT $ 80))
              (EXIT
               (|INTALG2;diagextint| |dden| (QCAR |dm|) |w| |lpv| |lgv| |ca0|
                |ext| |rde| |csolve| $))))))
          (EXIT (|error| "algexpextint: non-root case unimplemented"))))) 

(SDEFUN |INTALG2;algexpextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;exp_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algextint_base;MMLL;11|
        ((|der| |Mapping| UP UP)
         (|csolve| |Mapping| #1=(|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G541 NIL) (|bv| NIL) (#3=#:G540 NIL) (|ca0| (|List| R))
          (#4=#:G539 NIL) (|h| NIL) (#5=#:G538 NIL) (|res1| #1#)
          (|rs3| (|Matrix| F)) (|rs2| (|Matrix| UP))
          (|rs1| (|Matrix| (|Fraction| UP))) (|lg1| (|List| R)) (#6=#:G537 NIL)
          (#7=#:G536 NIL)
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1|
                (CONS #'|INTALG2;algextint_base;MMLL;11!0| (VECTOR $ |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $))
          (LETT |lg1|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |h| NIL) (LETT #6# |lh|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |h| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (SPADCALL (QVELT |h| 1) (QVELT |h| 2)
                                         (QREFELT $ 43))
                               #7#))))
                      (LETT #6# (CDR #6#)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |rs1|
                (SPADCALL (SPADCALL (LIST |lg1|) (QREFELT $ 83))
                          (QREFELT $ 84)))
          (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 68)))
          (LETT |rs3| (SPADCALL |rs2| (QREFELT $ 70)))
          (LETT |res1| (SPADCALL |rs3| |csolve|))
          (LETT |ca0|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |h| NIL) (LETT #4# |lh|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #5# (CONS (QVELT |h| 0) #5#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (EXIT
           (PROGN
            (LETT #3# NIL)
            (SEQ (LETT |bv| NIL) (LETT #2# |res1|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |bv| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (CONS
                           (SPADCALL (|INTALG2;lin_comb2| |bv| |ca0| $)
                                     (QREFELT $ 85))
                           |bv|)
                          #3#))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |INTALG2;algextint_base;MMLL;11!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;prim_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algextint;MMMMLL;12|
        ((|der| |Mapping| UP UP)
         (|ext| |Mapping|
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| UP)))
         (|rde| |Mapping|
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))
          (|Fraction| UP) (|List| (|Fraction| UP)))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G567 NIL) (|xx| (|Union| UP "failed")) (|x'| (UP)) (|x| (UP)))
         (SEQ
          (LETT |x'|
                (SPADCALL
                 (LETT |x| (SPADCALL (|spadConstant| $ 55) 1 (QREFELT $ 92)))
                 |der|))
          (EXIT
           (COND
            ((ZEROP (SPADCALL |x'| (QREFELT $ 93)))
             (|INTALG2;algprimextint| |der| |ext| |rde| |csolve| |lg| $))
            ('T
             (SEQ
              (EXIT
               (SEQ
                (SEQ (LETT |xx| (SPADCALL |x'| |x| (QREFELT $ 48)))
                     (EXIT
                      (COND
                       ((QEQCAR |xx| 0)
                        (COND
                         ((QEQCAR (SPADCALL (QCDR |xx|) (QREFELT $ 95)) 0)
                          (PROGN
                           (LETT #1#
                                 (|INTALG2;algexpextint| |der| |ext| |rde|
                                  |csolve| |lg| $))
                           (GO #2=#:G561))))))))
                (EXIT (|error| "algextint: unhandled case"))))
              #2# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |AlgebraicIntegrate2;|)) 

(DEFUN |AlgebraicIntegrate2| (&REST #1=#:G568)
  (SPROG NIL
         (PROG (#2=#:G569)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicIntegrate2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicIntegrate2;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicIntegrate2|)))))))))) 

(DEFUN |AlgebraicIntegrate2;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|AlgebraicIntegrate2| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT $ (GETREFV 100))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|AlgebraicIntegrate2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|AlgebraicIntegrate2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|Record| (|:| |num| 18) (|:| |den| 8))
              (0 . |integralCoordinates|) (|Fraction| 8) (5 . |Zero|)
              (9 . |Zero|) (13 . |Zero|) (|Integer|) (|Vector| 8)
              (17 . |minIndex|) (22 . /)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 13))
              (|LaurentPolynomial| 7 8) (28 . |separate|) (33 . |convert|)
              (|Vector| $) (38 . |integralBasis|) (|Vector| 13)
              (42 . |represents|)
              (|Record| (|:| |answer| 10) (|:| |logpart| 10)) (|Mapping| 8 8)
              (|AlgebraicHermiteIntegration| 7 8 9 10)
              (48 . |HermiteIntegrate|) (|Boolean|) (54 . |zero?|)
              (59 . |Zero|) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (63 . |divide|) (69 . |coerce|) (|Vector| 7) (74 . |elt|)
              (80 . |coerce|) (85 . *) (91 . +) (97 . |denom|) (102 . |gcd|)
              (108 . |ground?|) (|Union| $ '"failed") (113 . |exquo|) (119 . +)
              (125 . |numer|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 51 '"failed") (130 . |extendedEuclidean|) (137 . |One|)
              (141 . |One|) (145 . |elt|) (|Vector| 10) (151 . |elt|)
              (|Matrix| 8) (157 . |elt|) (|List| 13)
              (|LinearCombinationUtilities| 7 8) (164 . |lin_comb|) (|List| 61)
              (|Matrix| 13) (170 . |matrix|) (|Matrix| $)
              (175 . |reducedSystem|) (|Matrix| 7) (180 . |reducedSystem|)
              (|List| 39) (185 . |lin_comb|) (191 . -) (197 . |elt|)
              (203 . |setelt!|) (|Record| (|:| |num| 59) (|:| |den| 8))
              (210 . |integralDerivationMatrix|) (215 . |One|) (219 . =)
              (225 . |diagonal?|) (|List| 89) (|Matrix| 10) (230 . |matrix|)
              (235 . |reducedSystem|) (240 . -)
              (|Record| (|:| |ratpart| 10) (|:| |coeffs| 39)) (|List| 86)
              (|Mapping| 71 69) (|List| 10) |INTALG2;algextint_base;MMLL;11|
              (|NonNegativeInteger|) (245 . |monomial|) (251 . |degree|)
              (|Union| 7 '"failed") (256 . |retractIfCan|)
              (|Record| (|:| |ratpart| 13) (|:| |coeffs| 39))
              (|Mapping| (|List| 96) 61) (|Mapping| (|List| 96) 13 61)
              |INTALG2;algextint;MMMMLL;12|)
           '#(|algextint_base| 261 |algextint| 268) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|algextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#5|)
                                             (|:| |coeffs| (|Vector| |#2|))))
                                  (|Mapping| |#3| |#3|)
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| (|Fraction| |#3|))
                                              (|:| |coeffs| (|Vector| |#2|))))
                                   (|List| (|Fraction| |#3|)))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| (|Fraction| |#3|))
                                              (|:| |coeffs| (|Vector| |#2|))))
                                   (|Fraction| |#3|)
                                   (|List| (|Fraction| |#3|)))
                                  (|Mapping| (|List| (|Vector| |#2|))
                                             (|Matrix| |#2|))
                                  (|List| |#5|)))
                                T)
                              '((|algextint_base|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#5|)
                                             (|:| |coeffs| (|Vector| |#2|))))
                                  (|Mapping| |#3| |#3|)
                                  (|Mapping| (|List| (|Vector| |#2|))
                                             (|Matrix| |#2|))
                                  (|List| |#5|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 99
                                            '(1 10 11 0 12 0 13 0 14 0 6 0 15 0
                                              7 0 16 1 18 17 0 19 2 13 0 8 8 20
                                              1 22 21 13 23 1 22 13 0 24 0 10
                                              25 26 2 10 0 27 25 28 2 31 29 10
                                              30 32 1 10 33 0 34 0 10 0 35 2 8
                                              36 0 0 37 1 13 0 8 38 2 39 7 0 17
                                              40 1 8 0 7 41 2 10 0 13 0 42 2 10
                                              0 0 0 43 1 13 8 0 44 2 8 0 0 0 45
                                              1 8 33 0 46 2 8 47 0 0 48 2 13 0
                                              0 0 49 1 13 8 0 50 3 8 52 0 0 0
                                              53 0 6 0 54 0 7 0 55 2 27 13 0 17
                                              56 2 57 10 0 17 58 3 59 8 0 17 17
                                              60 2 62 13 39 61 63 1 65 0 64 66
                                              1 13 59 67 68 1 8 69 67 70 2 62
                                              39 39 71 72 2 10 0 0 0 73 2 18 8
                                              0 17 74 3 27 13 0 17 13 75 1 10
                                              76 30 77 0 10 0 78 2 10 33 0 0 79
                                              1 59 33 0 80 1 82 0 81 83 1 10 65
                                              67 84 1 10 0 0 85 2 8 0 7 91 92 1
                                              8 91 0 93 1 8 94 0 95 3 0 87 30
                                              88 89 90 5 0 87 30 97 98 88 89
                                              99)))))
           '|lookupComplete|)) 
