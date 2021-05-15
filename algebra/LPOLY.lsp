
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
            (SEQ (LETT |s| (SPADCALL |lw| (QREFELT $ 16)))
                 (EXIT
                  (COND
                   ((QEQCAR |s| 0)
                    (COND ((SPADCALL (QCDR |s|) |v| (QREFELT $ 17)) |nv|)
                          (#1='T (SPADCALL |lw| (QREFELT $ 14)))))
                   (#1#
                    (SEQ (LETT |l| (SPADCALL |lw| (QREFELT $ 18)))
                         (LETT |r| (SPADCALL |lw| (QREFELT $ 19)))
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
         (SEQ (LETT |s| (SPADCALL |lw| (QREFELT $ 16)))
              (EXIT
               (COND
                ((QEQCAR |s| 0)
                 (SEQ (LETT |p| (SPADCALL (QCDR |s|) |lv| (QREFELT $ 22)))
                      (EXIT
                       (COND ((EQL |p| 0) (SPADCALL |lw| (QREFELT $ 25)))
                             (#1='T (SPADCALL |lnv| |p| (QREFELT $ 27)))))))
                (#1#
                 (SEQ (LETT |l| (SPADCALL |lw| (QREFELT $ 18)))
                      (LETT |r| (SPADCALL |lw| (QREFELT $ 19)))
                      (EXIT
                       (SPADCALL (|LPOLY;eval2| |l| |lv| |lnv| $)
                                 (|LPOLY;eval2| |r| |lv| |lnv| $)
                                 (QREFELT $ 20)))))))))) 

(SDEFUN |LPOLY;eval;$VarSet2$;3| ((|p| $) (|v| |VarSet|) (|nv| $) ($ $))
        (SPROG
         ((#1=#:G412 NIL) (#2=#:G411 ($)) (#3=#:G413 ($)) (#4=#:G415 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|LPOLY;eval1| (QCAR |t|) |v| |nv| $)
                                   (QREFELT $ 28)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 23))))))) 

(SDEFUN |LPOLY;eval;$LL$;4|
        ((|p| $) (|lv| |List| |VarSet|) (|lnv| |List| $) ($ $))
        (SPROG
         ((#1=#:G417 NIL) (#2=#:G416 ($)) (#3=#:G418 ($)) (#4=#:G420 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|LPOLY;eval2| (QCAR |t|) |lv| |lnv| $)
                                   (QREFELT $ 28)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
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
         ((#1=#:G429 NIL) (#2=#:G428 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G430 #3#) (#5=#:G432 NIL) (|t| NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| (|spadConstant| $ 23) (QREFELT $ 44))
            (|spadConstant| $ 35))
           (#6='T
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |t| NIL) (LETT #5# |lp|) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (QCDR |t|)
                                     (|LPOLY;lquo1| |p| (QCAR |t|) $)
                                     (QREFELT $ 45)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 46))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| $ 35))))))))) 

(SDEFUN |LPOLY;rquo;Xrp$Xrp;9|
        ((|p| |XRecursivePolynomial| |VarSet| R) (|lp| $)
         ($ |XRecursivePolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G434 NIL) (#2=#:G433 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G435 #3#) (#5=#:G437 NIL) (|t| NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| (|spadConstant| $ 23) (QREFELT $ 44))
            (|spadConstant| $ 35))
           (#6='T
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |t| NIL) (LETT #5# |lp|) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (QCDR |t|)
                                     (|LPOLY;rquo1| |p| (QCAR |t|) $)
                                     (QREFELT $ 45)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 46))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| $ 35))))))))) 

(SDEFUN |LPOLY;LiePolyIfCan;XdpU;10|
        ((|p| . #1=(|XDistributedPolynomial| |VarSet| R))
         ($ |Union| $ "failed"))
        (SPROG
         ((|p1| #1#) (|r| ($)) (|lp| ($)) (#2=#:G451 NIL)
          (|l| (|Union| (|LyndonWord| |VarSet|) "failed")) (|coef| (R))
          (|w| (|FreeMonoid| |VarSet|))
          (|t| (|Record| (|:| |k| (|FreeMonoid| |VarSet|)) (|:| |c| R))))
         (SEQ
          (EXIT
           (COND ((NULL (SPADCALL |p| (QREFELT $ 50))) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |p1| |p|) (LETT |r| (|spadConstant| $ 23))
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |p1| (|spadConstant| $ 51)
                                         (QREFELT $ 52)))
                              (GO G191)))
                            (SEQ (LETT |t| (SPADCALL |p1| (QREFELT $ 54)))
                                 (LETT |w| (QCAR |t|)) (LETT |coef| (QCDR |t|))
                                 (LETT |l| (SPADCALL |w| (QREFELT $ 57)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |l| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed"))
                                     (GO #3=#:G450)))
                                   ('T
                                    (SEQ
                                     (LETT |lp|
                                           (SPADCALL |coef|
                                                     (SPADCALL (QCDR |l|)
                                                               (QREFELT $ 14))
                                                     (QREFELT $ 28)))
                                     (LETT |r|
                                           (SPADCALL |r| |lp| (QREFELT $ 29)))
                                     (EXIT
                                      (LETT |p1|
                                            (SPADCALL |p1|
                                                      (SPADCALL |lp|
                                                                (QREFELT $ 58))
                                                      (QREFELT $ 59)))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (CONS 0 |r|))))))
          #3# (EXIT #2#)))) 

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
                  (SEQ (LETT |u1| (SPADCALL |u| (QREFELT $ 18)))
                       (LETT |u2| (SPADCALL |u| (QREFELT $ 19)))
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
         ((#1=#:G459 NIL) (#2=#:G458 ($)) (#3=#:G460 ($)) (#4=#:G462 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|) (|LPOLY;crw| |l| (QCAR |t|) $)
                                   (QREFELT $ 28)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 23))))))) 

(SDEFUN |LPOLY;cr2| ((|p| $) (|l| |LyndonWord| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G464 NIL) (#2=#:G463 ($)) (#3=#:G465 ($)) (#4=#:G467 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|) (|LPOLY;crw| (QCAR |t|) |l| $)
                                   (QREFELT $ 28)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
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
                   (LETT |l| (|LPOLY;DPoly| (SPADCALL |w| (QREFELT $ 18)) $))
                   (LETT |r| (|LPOLY;DPoly| (SPADCALL |w| (QREFELT $ 19)) $))
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
                   (LETT |l| (|LPOLY;RPoly| (SPADCALL |w| (QREFELT $ 18)) $))
                   (LETT |r| (|LPOLY;RPoly| (SPADCALL |w| (QREFELT $ 19)) $))
                   (EXIT
                    (SPADCALL (SPADCALL |l| |r| (QREFELT $ 72))
                              (SPADCALL |r| |l| (QREFELT $ 72))
                              (QREFELT $ 39))))))))) 

(SDEFUN |LPOLY;coerce;VarSet$;18| ((|v| |VarSet|) ($ $))
        (SPADCALL (|spadConstant| $ 67) (SPADCALL |v| (QREFELT $ 73))
                  (QREFELT $ 68))) 

(SDEFUN |LPOLY;construct;3$;19| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G476 NIL) (#2=#:G475 ($)) (#3=#:G477 ($)) (#4=#:G479 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |x|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|) (|LPOLY;cr1| (QCAR |t|) |y| $)
                                   (QREFELT $ 28)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
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
         ((#1=#:G484 NIL) (#2=#:G483 #3=(|XDistributedPolynomial| |VarSet| R))
          (#4=#:G485 #3#) (#5=#:G487 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #5# |p|) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |t|) (|LPOLY;DPoly| (QCAR |t|) $)
                                   (QREFELT $ 78)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 79))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 51))))))) 

(SDEFUN |LPOLY;coerce;$Xrp;24| ((|p| $) ($ |XRecursivePolynomial| |VarSet| R))
        (SPROG
         ((#1=#:G489 NIL) (#2=#:G488 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G490 #3#) (#5=#:G492 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #5# |p|) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |t|) (|LPOLY;RPoly| (QCAR |t|) $)
                                   (QREFELT $ 45)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 46))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 35))))))) 

(SDEFUN |LPOLY;LiePoly;Lw$;25| ((|l| |LyndonWord| |VarSet|) ($ $))
        (SPADCALL (|spadConstant| $ 67) |l| (QREFELT $ 68))) 

(SDEFUN |LPOLY;varList;$L;26| ((|p| $) ($ |List| |VarSet|))
        (SPROG
         ((|le| #1=(|List| |VarSet|)) (#2=#:G495 NIL) (#3=#:G494 #1#)
          (#4=#:G496 #1#) (#5=#:G499 NIL) (|t| NIL))
         (SEQ
          (LETT |le|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #5# |p|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL (QCAR |t|) (QREFELT $ 11)))
                         (COND
                          (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 80))))
                          ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T (|IdentityError| '|setUnion|)))))
          (EXIT (SPADCALL |le| (QREFELT $ 81)))))) 

(SDEFUN |LPOLY;mirror;2$;27| ((|p| $) ($ $))
        (SPROG ((#1=#:G504 NIL) (|t| NIL) (#2=#:G503 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
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
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LPOLY;trunc;$Nni$;28| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (COND
         ((> (SPADCALL |p| (QREFELT $ 88)) |n|)
          (SPADCALL (SPADCALL |p| (QREFELT $ 89)) |n| (QREFELT $ 90)))
         ('T |p|))) 

(SDEFUN |LPOLY;degree;$Nni;29| ((|p| $) ($ |NonNegativeInteger|))
        (COND ((NULL |p|) 0)
              ('T (SPADCALL (QCAR (|SPADfirst| |p|)) (QREFELT $ 84))))) 

(SDEFUN |LPOLY;outTerm| ((|r| R) (|lw| |LyndonWord| |VarSet|) ($ |OutputForm|))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 67) (QREFELT $ 91))
          (SPADCALL |lw| (QREFELT $ 93)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 94))
                    (SPADCALL |lw| (QREFELT $ 93)) (QREFELT $ 95))))) 

(SDEFUN |LPOLY;coerce;$Of;31| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G516 NIL) (|t| NIL) (#2=#:G515 NIL))
               (SEQ
                (COND
                 ((NULL |a|) (SPADCALL (|spadConstant| $ 24) (QREFELT $ 94)))
                 ('T
                  (SPADCALL (ELT $ 96)
                            (NREVERSE
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |t| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|LPOLY;outTerm| (QCDR |t|)
                                             (QCAR |t|) $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                            (QREFELT $ 99))))))) 

(DECLAIM (NOTINLINE |LiePolynomial;|)) 

(DEFUN |LiePolynomial| (&REST #1=#:G525)
  (SPROG NIL
         (PROG (#2=#:G526)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LiePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LiePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|LiePolynomial|)))))))))) 

(DEFUN |LiePolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G524 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|LiePolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 111))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         (|HasCategory| (|LyndonWord| |#1|)
                                                        '(|OrderedSet|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| (|LyndonWord| |#1|)
                                                         '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|LyndonWord| |#1|)
                                                         '(|OrderedSet|))))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|CancellationAbelianMonoid|)))
                                        (|HasCategory| |#2| '(|Field|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| (|LyndonWord| |#1|)
                                                         '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|LyndonWord| |#1|)
                                                         '(|OrderedSet|))))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|LyndonWord| |#1|)
                                                         '(|OrderedSet|))))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|LyndonWord| |#1|)
                                               '(|Comparable|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2| '(|Comparable|))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| (|LyndonWord| |#1|)
                                                         '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|LyndonWord| |#1|)
                                                         '(|OrderedSet|))))))))
    (|haddProp| |$ConstructorCache| '|LiePolynomial| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8
              (|List| (|Record| (|:| |k| (|LyndonWord| |#1|)) (|:| |c| |#2|))))
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
              (|NonNegativeInteger|) |LPOLY;degree;$Nni;29| (259 . |reductum|)
              |LPOLY;trunc;$Nni$;28| (264 . =) (|OutputForm|) (270 . |coerce|)
              (275 . |coerce|) (280 . *) (286 . +) (|Mapping| 92 92 92)
              (|List| 92) (292 . |reduce|) |LPOLY;coerce;$Of;31|
              (|Record| (|:| |k| 10) (|:| |c| 7)) (|List| 101) (|Mapping| 7 10)
              (|Union| 10 '"failed") (|Mapping| 7 7) (|List| 10) (|List| 7)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 298 |zero?| 304 |varList| 309 |trunc| 314 |support| 320 |sup|
              325 |subtractIfCan| 331 |smaller?| 337 |sample| 343 |rquo| 347
              |retractIfCan| 353 |retract| 358 |reductum| 363 |opposite?| 368
              |numberOfMonomials| 374 |monomials| 379 |monomial?| 384
              |monomial| 389 |mirror| 395 |min| 400 |max| 406 |map| 412 |lquo|
              418 |listOfTerms| 424 |linearExtend| 429 |leadingTerm| 435
              |leadingSupport| 440 |leadingMonomial| 445 |leadingCoefficient|
              450 |latex| 455 |hashUpdate!| 460 |hash| 466 |eval| 471 |degree|
              485 |constructOrdered| 490 |construct| 495 |coerce| 524
              |coefficients| 549 |coefficient| 554 |coef| 560 |Zero| 566
              |LiePolyIfCan| 570 |LiePoly| 575 >= 580 > 586 = 592 <= 598 < 604
              / 610 - 616 + 627 * 633)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 3 0 0 0 3 1 4 4 6 4 5 0 12 0 0 0
                                  2 4))
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
                 (|CoercibleTo| 92) (|RetractableTo| (|LyndonWord| 6))
                 (|PartialOrder|))
              (|makeByteWordVec2| 110
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
                                    84 1 7 0 0 85 1 0 0 0 89 2 7 12 0 0 91 1 10
                                    92 0 93 1 7 92 0 94 2 92 0 0 0 95 2 92 0 0
                                    0 96 2 98 92 97 0 99 2 0 12 0 0 1 1 8 12 0
                                    1 1 0 9 0 82 2 0 0 0 87 90 1 0 106 0 1 2 3
                                    0 0 0 1 2 9 55 0 0 1 2 12 12 0 0 1 0 8 0 1
                                    2 0 33 33 0 48 1 2 104 0 1 1 2 10 0 1 1 11
                                    0 0 89 2 8 12 0 0 1 1 0 87 0 1 1 0 31 0 1 1
                                    0 12 0 1 2 0 0 7 10 68 1 0 0 0 86 2 4 0 0 0
                                    1 2 4 0 0 0 1 2 0 0 105 0 1 2 0 33 33 0 47
                                    1 0 102 0 1 2 10 7 103 0 1 1 11 101 0 1 1
                                    11 10 0 1 1 11 0 0 1 1 11 7 0 1 1 0 108 0 1
                                    2 0 110 110 0 1 1 0 109 0 1 3 0 0 0 9 31 32
                                    3 0 0 0 6 0 30 1 0 87 0 88 1 11 0 102 1 2 0
                                    0 10 0 75 2 0 0 0 10 76 2 0 0 10 10 77 1 0
                                    0 102 1 2 0 0 0 0 20 1 2 0 10 25 1 0 33 0
                                    41 1 0 0 6 74 1 0 49 0 58 1 0 92 0 100 1 0
                                    107 0 1 2 0 7 0 10 1 2 0 7 33 0 43 0 8 0 23
                                    1 0 55 49 60 1 0 0 10 14 2 4 12 0 0 1 2 4
                                    12 0 0 1 2 0 12 0 0 44 2 4 12 0 0 1 2 4 12
                                    0 0 1 2 7 0 0 7 1 1 1 0 0 66 2 1 0 0 0 1 2
                                    0 0 0 0 29 2 8 0 87 0 1 2 1 0 21 0 1 2 0 0
                                    10 7 1 2 0 0 7 10 1 2 0 0 0 7 1 2 0 0 83 0
                                    1 2 0 0 7 0 28)))))
           '|lookupComplete|)) 
