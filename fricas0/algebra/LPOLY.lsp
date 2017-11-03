
(SDEFUN |LPOLY;eval1|
        ((|lw| |LyndonWord| |VarSet|) (|v| |VarSet|) (|nv| $) ($ $))
        (SPROG
         ((|r| (|LyndonWord| |VarSet|)) (|l| (|LyndonWord| |VarSet|))
          (|s| (|Union| |VarSet| "failed")))
         (SEQ
          (COND
           ((NULL (SPADCALL |v| (SPADCALL |lw| (QREFELT $ 11)) (QREFELT $ 13)))
            (SPADCALL |lw| (QREFELT $ 14)))
           ('T
            (SEQ (LETT |s| (SPADCALL |lw| (QREFELT $ 16)) . #1=(|LPOLY;eval1|))
                 (EXIT
                  (COND
                   ((QEQCAR |s| 0)
                    (COND ((SPADCALL (QCDR |s|) |v| (QREFELT $ 17)) |nv|)
                          (#2='T (SPADCALL |lw| (QREFELT $ 14)))))
                   (#2#
                    (SEQ (LETT |l| (SPADCALL |lw| (QREFELT $ 18)) . #1#)
                         (LETT |r| (SPADCALL |lw| (QREFELT $ 19)) . #1#)
                         (EXIT
                          (SPADCALL (|LPOLY;eval1| |l| |v| |nv| $)
                                    (|LPOLY;eval1| |r| |v| |nv| $)
                                    (QREFELT $ 20))))))))))))) 

(SDEFUN |LPOLY;eval2|
        ((|lw| |LyndonWord| |VarSet|) (|lv| |List| |VarSet|) (|lnv| |List| $)
         ($ $))
        (SPROG
         ((|r| (|LyndonWord| |VarSet|)) (|l| (|LyndonWord| |VarSet|))
          (|p| (|Integer|)) (|s| (|Union| |VarSet| "failed")))
         (SEQ (LETT |s| (SPADCALL |lw| (QREFELT $ 16)) . #1=(|LPOLY;eval2|))
              (EXIT
               (COND
                ((QEQCAR |s| 0)
                 (SEQ
                  (LETT |p| (SPADCALL (QCDR |s|) |lv| (QREFELT $ 22)) . #1#)
                  (EXIT
                   (COND ((EQL |p| 0) (SPADCALL |lw| (QREFELT $ 25)))
                         (#2='T (SPADCALL |lnv| |p| (QREFELT $ 27)))))))
                (#2#
                 (SEQ (LETT |l| (SPADCALL |lw| (QREFELT $ 18)) . #1#)
                      (LETT |r| (SPADCALL |lw| (QREFELT $ 19)) . #1#)
                      (EXIT
                       (SPADCALL (|LPOLY;eval2| |l| |lv| |lnv| $)
                                 (|LPOLY;eval2| |r| |lv| |lnv| $)
                                 (QREFELT $ 20)))))))))) 

(SDEFUN |LPOLY;eval;$VarSet2$;3| ((|p| $) (|v| |VarSet|) (|nv| $) ($ $))
        (SPROG
         ((#1=#:G745 NIL) (#2=#:G744 ($)) (#3=#:G746 ($)) (#4=#:G750 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|LPOLY;eval;$VarSet2$;3|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|LPOLY;eval1| (QCAR |t|) |v| |nv| $)
                                   (QREFELT $ 28))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 23))))))) 

(SDEFUN |LPOLY;eval;$LL$;4|
        ((|p| $) (|lv| |List| |VarSet|) (|lnv| |List| $) ($ $))
        (SPROG
         ((#1=#:G752 NIL) (#2=#:G751 ($)) (#3=#:G753 ($)) (#4=#:G755 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|LPOLY;eval;$LL$;4|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|LPOLY;eval2| (QCAR |t|) |lv| |lnv| $)
                                   (QREFELT $ 28))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 23))))))) 

(SDEFUN |LPOLY;lquo1|
        ((|p| |XRecursivePolynomial| |VarSet| R) (|lw| |LyndonWord| |VarSet|)
         ($ |XRecursivePolynomial| |VarSet| R))
        (COND ((SPADCALL |p| (QREFELT $ 34)) (|spadConstant| $ 35))
              ((SPADCALL |lw| (QREFELT $ 36))
               (SPADCALL |p| (SPADCALL |lw| (QREFELT $ 37)) (QREFELT $ 38)))
              ('T
               (SPADCALL
                (|LPOLY;lquo1|
                 (|LPOLY;lquo1| |p| (SPADCALL |lw| (QREFELT $ 18)) $)
                 (SPADCALL |lw| (QREFELT $ 19)) $)
                (|LPOLY;lquo1|
                 (|LPOLY;lquo1| |p| (SPADCALL |lw| (QREFELT $ 19)) $)
                 (SPADCALL |lw| (QREFELT $ 18)) $)
                (QREFELT $ 39))))) 

(SDEFUN |LPOLY;rquo1|
        ((|p| |XRecursivePolynomial| |VarSet| R) (|lw| |LyndonWord| |VarSet|)
         ($ |XRecursivePolynomial| |VarSet| R))
        (COND ((SPADCALL |p| (QREFELT $ 34)) (|spadConstant| $ 35))
              ((SPADCALL |lw| (QREFELT $ 36))
               (SPADCALL |p| (SPADCALL |lw| (QREFELT $ 37)) (QREFELT $ 40)))
              ('T
               (SPADCALL
                (|LPOLY;rquo1|
                 (|LPOLY;rquo1| |p| (SPADCALL |lw| (QREFELT $ 18)) $)
                 (SPADCALL |lw| (QREFELT $ 19)) $)
                (|LPOLY;rquo1|
                 (|LPOLY;rquo1| |p| (SPADCALL |lw| (QREFELT $ 19)) $)
                 (SPADCALL |lw| (QREFELT $ 18)) $)
                (QREFELT $ 39))))) 

(SDEFUN |LPOLY;coef;Xrp$R;7|
        ((|p| |XRecursivePolynomial| |VarSet| R) (|lp| $) ($ R))
        (SPADCALL |p| (SPADCALL |lp| (QREFELT $ 41)) (QREFELT $ 42))) 

(SDEFUN |LPOLY;lquo;Xrp$Xrp;8|
        ((|p| |XRecursivePolynomial| |VarSet| R) (|lp| $)
         ($ |XRecursivePolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G764 NIL) (#2=#:G763 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G765 #3#) (#5=#:G767 NIL) (|t| NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| (|spadConstant| $ 23) (QREFELT $ 44))
            (|spadConstant| $ 35))
           (#6='T
            (PROGN
             (LETT #1# NIL . #7=(|LPOLY;lquo;Xrp$Xrp;8|))
             (SEQ (LETT |t| NIL . #7#) (LETT #5# |lp| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (QCDR |t|)
                                     (|LPOLY;lquo1| |p| (QCAR |t|) $)
                                     (QREFELT $ 45))
                           . #7#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 46)) . #7#))
                      ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| $ 35))))))))) 

(SDEFUN |LPOLY;rquo;Xrp$Xrp;9|
        ((|p| |XRecursivePolynomial| |VarSet| R) (|lp| $)
         ($ |XRecursivePolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G769 NIL) (#2=#:G768 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G770 #3#) (#5=#:G772 NIL) (|t| NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| (|spadConstant| $ 23) (QREFELT $ 44))
            (|spadConstant| $ 35))
           (#6='T
            (PROGN
             (LETT #1# NIL . #7=(|LPOLY;rquo;Xrp$Xrp;9|))
             (SEQ (LETT |t| NIL . #7#) (LETT #5# |lp| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (QCDR |t|)
                                     (|LPOLY;rquo1| |p| (QCAR |t|) $)
                                     (QREFELT $ 45))
                           . #7#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 46)) . #7#))
                      ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| $ 35))))))))) 

(SDEFUN |LPOLY;LiePolyIfCan;XdpU;10|
        ((|p| . #1=(|XDistributedPolynomial| |VarSet| R))
         ($ |Union| $ "failed"))
        (SPROG
         ((|p1| #1#) (|r| ($)) (|lp| ($)) (#2=#:G786 NIL)
          (|l| (|Union| (|LyndonWord| |VarSet|) "failed")) (|coef| (R))
          (|w| (|FreeMonoid| |VarSet|))
          (|t| (|Record| (|:| |k| (|FreeMonoid| |VarSet|)) (|:| |c| R))))
         (SEQ
          (EXIT
           (COND ((NULL (SPADCALL |p| (QREFELT $ 50))) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |p1| |p| . #3=(|LPOLY;LiePolyIfCan;XdpU;10|))
                       (LETT |r| (|spadConstant| $ 23) . #3#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |p1| (|spadConstant| $ 51)
                                         (QREFELT $ 52)))
                              (GO G191)))
                            (SEQ
                             (LETT |t| (SPADCALL |p1| (QREFELT $ 54)) . #3#)
                             (LETT |w| (QCAR |t|) . #3#)
                             (LETT |coef| (QCDR |t|) . #3#)
                             (LETT |l| (SPADCALL |w| (QREFELT $ 57)) . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |l| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #3#)
                                 (GO #4=#:G785)))
                               ('T
                                (SEQ
                                 (LETT |lp|
                                       (SPADCALL |coef|
                                                 (SPADCALL (QCDR |l|)
                                                           (QREFELT $ 14))
                                                 (QREFELT $ 28))
                                       . #3#)
                                 (LETT |r| (SPADCALL |r| |lp| (QREFELT $ 29))
                                       . #3#)
                                 (EXIT
                                  (LETT |p1|
                                        (SPADCALL |p1|
                                                  (SPADCALL |lp|
                                                            (QREFELT $ 58))
                                                  (QREFELT $ 59))
                                        . #3#)))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (CONS 0 |r|))))))
          #4# (EXIT #2#)))) 

(SDEFUN |LPOLY;makeLyndon|
        ((|u| |LyndonWord| |VarSet|) (|v| |LyndonWord| |VarSet|)
         ($ |LyndonWord| |VarSet|))
        (SPADCALL (SPADCALL |u| (QREFELT $ 62)) (SPADCALL |v| (QREFELT $ 62))
                  (QREFELT $ 63))) 

(SDEFUN |LPOLY;crw|
        ((|u| |LyndonWord| |VarSet|) (|v| |LyndonWord| |VarSet|) ($ $))
        (COND ((SPADCALL |u| |v| (QREFELT $ 64)) (|spadConstant| $ 23))
              ((SPADCALL |u| |v| (QREFELT $ 65)) (|LPOLY;lyndon| |u| |v| $))
              ('T (SPADCALL (|LPOLY;lyndon| |v| |u| $) (QREFELT $ 66))))) 

(SDEFUN |LPOLY;lyndon|
        ((|u| |LyndonWord| |VarSet|) (|v| |LyndonWord| |VarSet|) ($ $))
        (SPROG ((|u2| (|LyndonWord| |VarSet|)) (|u1| (|LyndonWord| |VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |u| (QREFELT $ 36))
                  (SPADCALL (|spadConstant| $ 67)
                            (|LPOLY;makeLyndon| |u| |v| $) (QREFELT $ 68)))
                 (#1='T
                  (SEQ
                   (LETT |u1| (SPADCALL |u| (QREFELT $ 18))
                         . #2=(|LPOLY;lyndon|))
                   (LETT |u2| (SPADCALL |u| (QREFELT $ 19)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |u2| |v| (QREFELT $ 65))
                      (SPADCALL
                       (|LPOLY;cr1| |u1| (|LPOLY;lyndon| |u2| |v| $) $)
                       (|LPOLY;cr2| (|LPOLY;lyndon| |u1| |v| $) |u2| $)
                       (QREFELT $ 29)))
                     (#1#
                      (SPADCALL (|spadConstant| $ 67)
                                (|LPOLY;makeLyndon| |u| |v| $)
                                (QREFELT $ 68))))))))))) 

(SDEFUN |LPOLY;cr1| ((|l| |LyndonWord| |VarSet|) (|p| $) ($ $))
        (SPROG
         ((#1=#:G794 NIL) (#2=#:G793 ($)) (#3=#:G795 ($)) (#4=#:G797 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|LPOLY;cr1|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|) (|LPOLY;crw| |l| (QCAR |t|) $)
                                   (QREFELT $ 28))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 23))))))) 

(SDEFUN |LPOLY;cr2| ((|p| $) (|l| |LyndonWord| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G799 NIL) (#2=#:G798 ($)) (#3=#:G800 ($)) (#4=#:G802 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|LPOLY;cr2|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|) (|LPOLY;crw| (QCAR |t|) |l| $)
                                   (QREFELT $ 28))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 23))))))) 

(SDEFUN |LPOLY;DPoly|
        ((|w| |LyndonWord| |VarSet|) ($ |XDistributedPolynomial| |VarSet| R))
        (SPROG ((|r| #1=(|XDistributedPolynomial| |VarSet| R)) (|l| #1#))
               (SEQ
                (COND
                 ((SPADCALL |w| (QREFELT $ 36))
                  (SPADCALL (SPADCALL |w| (QREFELT $ 37)) (QREFELT $ 69)))
                 ('T
                  (SEQ
                   (LETT |l| (|LPOLY;DPoly| (SPADCALL |w| (QREFELT $ 18)) $)
                         . #2=(|LPOLY;DPoly|))
                   (LETT |r| (|LPOLY;DPoly| (SPADCALL |w| (QREFELT $ 19)) $)
                         . #2#)
                   (EXIT
                    (SPADCALL (SPADCALL |l| |r| (QREFELT $ 70))
                              (SPADCALL |r| |l| (QREFELT $ 70))
                              (QREFELT $ 59))))))))) 

(SDEFUN |LPOLY;RPoly|
        ((|w| |LyndonWord| |VarSet|) ($ |XRecursivePolynomial| |VarSet| R))
        (SPROG ((|r| #1=(|XRecursivePolynomial| |VarSet| R)) (|l| #1#))
               (SEQ
                (COND
                 ((SPADCALL |w| (QREFELT $ 36))
                  (SPADCALL (SPADCALL |w| (QREFELT $ 37)) (QREFELT $ 71)))
                 ('T
                  (SEQ
                   (LETT |l| (|LPOLY;RPoly| (SPADCALL |w| (QREFELT $ 18)) $)
                         . #2=(|LPOLY;RPoly|))
                   (LETT |r| (|LPOLY;RPoly| (SPADCALL |w| (QREFELT $ 19)) $)
                         . #2#)
                   (EXIT
                    (SPADCALL (SPADCALL |l| |r| (QREFELT $ 72))
                              (SPADCALL |r| |l| (QREFELT $ 72))
                              (QREFELT $ 39))))))))) 

(SDEFUN |LPOLY;coerce;VarSet$;18| ((|v| |VarSet|) ($ $))
        (SPADCALL (|spadConstant| $ 67) (SPADCALL |v| (QREFELT $ 73))
                  (QREFELT $ 68))) 

(SDEFUN |LPOLY;construct;3$;19| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G811 NIL) (#2=#:G810 ($)) (#3=#:G812 ($)) (#4=#:G814 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|LPOLY;construct;3$;19|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |x| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|) (|LPOLY;cr1| (QCAR |t|) |y| $)
                                   (QREFELT $ 28))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 23))))))) 

(SDEFUN |LPOLY;construct;Lw2$;20| ((|l| |LyndonWord| |VarSet|) (|p| $) ($ $))
        (|LPOLY;cr1| |l| |p| $)) 

(SDEFUN |LPOLY;construct;$Lw$;21| ((|p| $) (|l| |LyndonWord| |VarSet|) ($ $))
        (|LPOLY;cr2| |p| |l| $)) 

(SDEFUN |LPOLY;construct;2Lw$;22|
        ((|u| |LyndonWord| |VarSet|) (|v| |LyndonWord| |VarSet|) ($ $))
        (|LPOLY;crw| |u| |v| $)) 

(SDEFUN |LPOLY;coerce;$Xdp;23|
        ((|p| $) ($ |XDistributedPolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G819 NIL) (#2=#:G818 #3=(|XDistributedPolynomial| |VarSet| R))
          (#4=#:G820 #3#) (#5=#:G822 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|LPOLY;coerce;$Xdp;23|))
           (SEQ (LETT |t| NIL . #6#) (LETT #5# |p| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |t|) (|LPOLY;DPoly| (QCAR |t|) $)
                                   (QREFELT $ 78))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 79)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 51))))))) 

(SDEFUN |LPOLY;coerce;$Xrp;24| ((|p| $) ($ |XRecursivePolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G824 NIL) (#2=#:G823 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G825 #3#) (#5=#:G827 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|LPOLY;coerce;$Xrp;24|))
           (SEQ (LETT |t| NIL . #6#) (LETT #5# |p| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |t|) (|LPOLY;RPoly| (QCAR |t|) $)
                                   (QREFELT $ 45))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 46)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 35))))))) 

(SDEFUN |LPOLY;LiePoly;Lw$;25| ((|l| |LyndonWord| |VarSet|) ($ $))
        (SPADCALL (|spadConstant| $ 67) |l| (QREFELT $ 68))) 

(SDEFUN |LPOLY;varList;$L;26| ((|p| $) ($ |List| |VarSet|))
        (SPROG
         ((|le| #1=(|List| |VarSet|)) (#2=#:G830 NIL) (#3=#:G829 #1#)
          (#4=#:G831 #1#) (#5=#:G834 NIL) (|t| NIL))
         (SEQ
          (LETT |le|
                (PROGN
                 (LETT #2# NIL . #6=(|LPOLY;varList;$L;26|))
                 (SEQ (LETT |t| NIL . #6#) (LETT #5# |p| . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL (QCAR |t|) (QREFELT $ 11)) . #6#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 80)) . #6#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #6#)
                            (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T (|IdentityError| '|setUnion|))))
                . #6#)
          (EXIT (SPADCALL |le| (QREFELT $ 81)))))) 

(SDEFUN |LPOLY;mirror;2$;27| ((|p| $) ($ $))
        (SPROG ((#1=#:G839 NIL) (|t| NIL) (#2=#:G838 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|LPOLY;mirror;2$;27|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (QCAR |t|)
                                     (COND
                                      ((ODDP
                                        (SPADCALL (QCAR |t|) (QREFELT $ 84)))
                                       (QCDR |t|))
                                      ('T
                                       (SPADCALL (QCDR |t|) (QREFELT $ 85)))))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LPOLY;trunc;$Nni$;28| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (COND
         ((SPADCALL (SPADCALL |p| (QREFELT $ 88)) |n| (QREFELT $ 89))
          (SPADCALL (SPADCALL |p| (QREFELT $ 90)) |n| (QREFELT $ 91)))
         ('T |p|))) 

(SDEFUN |LPOLY;degree;$Nni;29| ((|p| $) ($ |NonNegativeInteger|))
        (COND ((NULL |p|) 0)
              ('T (SPADCALL (QCAR (|SPADfirst| |p|)) (QREFELT $ 84))))) 

(SDEFUN |LPOLY;outTerm| ((|r| R) (|lw| |LyndonWord| |VarSet|) ($ |OutputForm|))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 67) (QREFELT $ 92))
          (SPADCALL |lw| (QREFELT $ 94)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 95))
                    (SPADCALL |lw| (QREFELT $ 94)) (QREFELT $ 96))))) 

(SDEFUN |LPOLY;coerce;$Of;31| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G851 NIL) (|t| NIL) (#2=#:G850 NIL))
               (SEQ
                (COND
                 ((NULL |a|) (SPADCALL (|spadConstant| $ 24) (QREFELT $ 95)))
                 ('T
                  (SPADCALL (ELT $ 97)
                            (NREVERSE
                             (PROGN
                              (LETT #2# NIL . #3=(|LPOLY;coerce;$Of;31|))
                              (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |t| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|LPOLY;outTerm| (QCDR |t|)
                                             (QCAR |t|) $)
                                            #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                            (QREFELT $ 100))))))) 

(DECLAIM (NOTINLINE |LiePolynomial;|)) 

(DEFUN |LiePolynomial| (&REST #1=#:G861)
  (SPROG NIL
         (PROG (#2=#:G862)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LiePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|LiePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LiePolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|LiePolynomial|)))))))))) 

(DEFUN |LiePolynomial;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LiePolynomial|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LiePolynomial| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 112) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRing|))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (|HasCategory|
                                                (|LyndonWord| |#1|)
                                                '(|OrderedSet|)))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|Comparable|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|LyndonWord| |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|LyndonWord| |#1|)
                                                 '(|OrderedSet|))))
                                              (OR
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|LyndonWord| |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|LyndonWord| |#1|)
                                                 '(|OrderedSet|))))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#2|
                                                              '(|CancellationAbelianMonoid|)))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|CancellationAbelianMonoid|)))
                                              (|HasCategory| |#2| '(|Field|))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|AbelianMonoid|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|LyndonWord| |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|LyndonWord| |#1|)
                                                 '(|OrderedSet|))))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|CancellationAbelianMonoid|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|LyndonWord| |#1|)
                                                 '(|OrderedSet|))))
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|LiePolynomial| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|List|
                     (|Record| (|:| |k| (|LyndonWord| |#1|)) (|:| |c| |#2|))))
          $))) 

(MAKEPROP '|LiePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 10) (|local| |#1|)
              (|local| |#2|) '|Rep| (|List| 6) (|LyndonWord| 6) (0 . |varList|)
              (|Boolean|) (5 . |member?|) |LPOLY;LiePoly;Lw$;25|
              (|Union| 6 '"failed") (11 . |retractIfCan|) (16 . =)
              (22 . |left|) (27 . |right|) |LPOLY;construct;3$;19| (|Integer|)
              (32 . |position|) (38 . |Zero|) (42 . |Zero|) (46 . |coerce|)
              (|List| $$) (51 . |elt|) (57 . *) (63 . +)
              |LPOLY;eval;$VarSet2$;3| (|List| $) |LPOLY;eval;$LL$;4|
              (|XRecursivePolynomial| 6 7) (69 . |constant?|) (74 . |Zero|)
              (78 . |retractable?|) (83 . |retract|) (88 . |lquo|) (94 . -)
              (100 . |rquo|) |LPOLY;coerce;$Xrp;24| (106 . |coef|)
              |LPOLY;coef;Xrp$R;7| (112 . =) (118 . *) (124 . +)
              |LPOLY;lquo;Xrp$Xrp;8| |LPOLY;rquo;Xrp$Xrp;9|
              (|XDistributedPolynomial| 6 7) (130 . |quasiRegular?|)
              (135 . |Zero|) (139 . ~=) (|Record| (|:| |k| 56) (|:| |c| 7))
              (145 . |mindegTerm|) (|Union| $ '"failed") (|FreeMonoid| 6)
              (150 . |lyndonIfCan|) |LPOLY;coerce;$Xdp;23| (155 . -)
              |LPOLY;LiePolyIfCan;XdpU;10| (|FreeMagma| 6) (161 . |coerce|)
              (166 . *) (172 . =) (178 . |lexico|) (184 . -) (189 . |One|)
              (193 . |monomial|) (199 . |coerce|) (204 . *) (210 . |coerce|)
              (215 . *) (221 . |coerce|) |LPOLY;coerce;VarSet$;18|
              |LPOLY;construct;Lw2$;20| |LPOLY;construct;$Lw$;21|
              |LPOLY;construct;2Lw$;22| (226 . *) (232 . +) (238 . |setUnion|)
              (244 . |sort|) |LPOLY;varList;$L;26| (|PositiveInteger|)
              (249 . |length|) (254 . -) |LPOLY;mirror;2$;27|
              (|NonNegativeInteger|) |LPOLY;degree;$Nni;29| (259 . >)
              (265 . |reductum|) |LPOLY;trunc;$Nni$;28| (270 . =)
              (|OutputForm|) (276 . |coerce|) (281 . |coerce|) (286 . *)
              (292 . +) (|Mapping| 93 93 93) (|List| 93) (298 . |reduce|)
              |LPOLY;coerce;$Of;31| (|Mapping| 7 10) (|Union| 10 '"failed")
              (|Record| (|:| |k| 10) (|:| |c| 7)) (|List| 104) (|Mapping| 7 7)
              (|List| 10) (|List| 7) (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 304 |zero?| 310 |varList| 315 |trunc| 320 |support| 326 |sup|
              331 |subtractIfCan| 337 |smaller?| 343 |sample| 349 |rquo| 353
              |retractIfCan| 359 |retract| 364 |reductum| 369 |opposite?| 374
              |numberOfMonomials| 380 |monomials| 385 |monomial?| 390
              |monomial| 395 |mirror| 401 |min| 406 |max| 412 |map| 418 |lquo|
              424 |listOfTerms| 430 |linearExtend| 435 |leadingTerm| 441
              |leadingSupport| 446 |leadingMonomial| 451 |leadingCoefficient|
              456 |latex| 461 |hashUpdate!| 466 |hash| 472 |eval| 477 |degree|
              491 |constructOrdered| 496 |construct| 501 |coerce| 530
              |coefficients| 555 |coefficient| 560 |coef| 566 |Zero| 572
              |LiePolyIfCan| 576 |LiePoly| 581 >= 586 > 592 = 598 <= 604 < 610
              / 616 - 622 + 633 * 639)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(0 0 0 0 0 0 3 0 0 0 3 1 5 5 7 5 6 0 4 0 0 0 2
                                  5))
            (CONS
             '#(NIL |LieAlgebra&| |FreeModuleCategory&| |Module&| NIL NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |AbelianSemiGroup&| NIL |SetCategory&|
                |BasicType&| NIL |RetractableTo&| |PartialOrder&|)
             (CONS
              '#((|FreeLieAlgebra| 6 7) (|LieAlgebra| 7)
                 (|FreeModuleCategory| 7 (|LyndonWord| 6)) (|Module| 7)
                 (|IndexedDirectProductCategory| 7 (|LyndonWord| 6))
                 (|BiModule| 7 7) (|OrderedAbelianMonoidSup|)
                 (|AbelianProductCategory| 7) (|LeftModule| 7)
                 (|RightModule| 7) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|AbelianMonoid|) (|AbelianSemiGroup|)
                 (|Comparable|) (|SetCategory|) (|BasicType|)
                 (|CoercibleTo| 93) (|RetractableTo| (|LyndonWord| 6))
                 (|PartialOrder|))
              (|makeByteWordVec2| 111
                                  '(1 10 9 0 11 2 9 12 6 0 13 1 10 15 0 16 2 6
                                    12 0 0 17 1 10 0 0 18 1 10 0 0 19 2 9 21 6
                                    0 22 0 0 0 23 0 7 0 24 1 0 0 10 25 2 26 2 0
                                    21 27 2 0 0 7 0 28 2 0 0 0 0 29 1 33 12 0
                                    34 0 33 0 35 1 10 12 0 36 1 10 6 0 37 2 33
                                    0 0 6 38 2 33 0 0 0 39 2 33 0 0 6 40 2 33 7
                                    0 0 42 2 0 12 0 0 44 2 33 0 7 0 45 2 33 0 0
                                    0 46 1 49 12 0 50 0 49 0 51 2 49 12 0 0 52
                                    1 49 53 0 54 1 10 55 56 57 2 49 0 0 0 59 1
                                    10 61 0 62 2 61 0 0 0 63 2 10 12 0 0 64 2
                                    10 12 0 0 65 1 0 0 0 66 0 7 0 67 2 0 0 7 10
                                    68 1 49 0 6 69 2 49 0 0 0 70 1 33 0 6 71 2
                                    33 0 0 0 72 1 10 0 6 73 2 49 0 7 0 78 2 49
                                    0 0 0 79 2 9 0 0 0 80 1 9 0 0 81 1 10 83 0
                                    84 1 7 0 0 85 2 87 12 0 0 89 1 0 0 0 90 2 7
                                    12 0 0 92 1 10 93 0 94 1 7 93 0 95 2 93 0 0
                                    0 96 2 93 0 0 0 97 2 99 93 98 0 100 2 0 12
                                    0 0 1 1 9 12 0 1 1 0 9 0 82 2 0 0 0 87 91 1
                                    0 107 0 1 2 3 0 0 0 1 2 10 55 0 0 1 2 4 12
                                    0 0 1 0 9 0 1 2 0 33 33 0 48 1 2 103 0 1 1
                                    2 10 0 1 1 0 0 0 90 2 9 12 0 0 1 1 0 87 0 1
                                    1 0 31 0 1 1 0 12 0 1 2 0 0 7 10 68 1 0 0 0
                                    86 2 5 0 0 0 1 2 5 0 0 0 1 2 0 0 106 0 1 2
                                    0 33 33 0 47 1 0 105 0 1 2 11 7 102 0 1 1 0
                                    104 0 1 1 0 10 0 1 1 0 0 0 1 1 0 7 0 1 1 0
                                    109 0 1 2 0 111 111 0 1 1 0 110 0 1 3 0 0 0
                                    9 31 32 3 0 0 0 6 0 30 1 0 87 0 88 1 0 0
                                    105 1 2 0 0 10 0 75 2 0 0 0 10 76 2 0 0 10
                                    10 77 1 0 0 105 1 2 0 0 0 0 20 1 2 0 10 25
                                    1 0 33 0 41 1 0 0 6 74 1 0 49 0 58 1 0 93 0
                                    101 1 0 108 0 1 2 0 7 0 10 1 2 0 7 33 0 43
                                    0 9 0 23 1 0 55 49 60 1 0 0 10 14 2 5 12 0
                                    0 1 2 5 12 0 0 1 2 0 12 0 0 44 2 5 12 0 0 1
                                    2 5 12 0 0 1 2 8 0 0 7 1 1 1 0 0 66 2 1 0 0
                                    0 1 2 0 0 0 0 29 2 9 0 87 0 1 2 1 0 21 0 1
                                    2 0 0 10 7 1 2 0 0 7 10 1 2 0 0 0 7 1 2 0 0
                                    83 0 1 2 0 0 7 0 28)))))
           '|lookupComplete|)) 
