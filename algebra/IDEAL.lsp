
(SDEFUN |IDEAL;npoly| ((|f| |DPoly|) ($ |newPoly|))
        (COND
         ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15))
          (|spadConstant| $ 16))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |f| (QREFELT $ 17))
                     (SPADCALL 0 (SPADCALL |f| (QREFELT $ 20)) (QREFELT $ 22))
                     (QREFELT $ 23))
           (|IDEAL;npoly| (SPADCALL |f| (QREFELT $ 24)) $) (QREFELT $ 25))))) 

(SDEFUN |IDEAL;oldpoly| ((|q| |newPoly|) ($ . #1=(|Union| |DPoly| "failed")))
        (SPROG ((|g| #1#) (|n| (|NonNegativeInteger|)) (|dq| (|newExpon|)))
               (SEQ
                (COND
                 ((SPADCALL |q| (|spadConstant| $ 16) (QREFELT $ 26))
                  (CONS 0 (|spadConstant| $ 13)))
                 (#2='T
                  (SEQ (LETT |dq| (SPADCALL |q| (QREFELT $ 27)))
                       (LETT |n| (SPADCALL |dq| (QREFELT $ 28)))
                       (EXIT
                        (COND
                         ((SPADCALL |n| 0 (QREFELT $ 29)) (CONS 1 "failed"))
                         (#2#
                          (SEQ
                           (LETT |g|
                                 (|IDEAL;oldpoly| (SPADCALL |q| (QREFELT $ 30))
                                  $))
                           (EXIT
                            (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                                  (#2#
                                   (CONS 0
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |q| (QREFELT $ 31))
                                           (SPADCALL |dq| (QREFELT $ 32))
                                           (QREFELT $ 33))
                                          (QCDR |g|)
                                          (QREFELT $ 34)))))))))))))))) 

(SDEFUN |IDEAL;leadterm| ((|f| |DPoly|) (|lvar| |List| |VarSet|) ($ |DPoly|))
        (SPROG ((|lf| (|List| |VarSet|)))
               (COND
                ((OR (NULL (LETT |lf| (SPADCALL |f| (QREFELT $ 36))))
                     (SPADCALL |lf| |lvar| (QREFELT $ 37)))
                 |f|)
                ('T
                 (|IDEAL;leadterm|
                  (SPADCALL (SPADCALL |f| (|SPADfirst| |lf|) (QREFELT $ 39))
                            (QREFELT $ 41))
                  |lvar| $))))) 

(SDEFUN |IDEAL;choosel| ((|f| |DPoly|) (|g| |DPoly|) ($ |DPoly|))
        (SPROG ((|f1| (|Union| |DPoly| "failed")))
               (SEQ
                (COND ((SPADCALL |g| (|spadConstant| $ 13) (QREFELT $ 15)) |f|)
                      (#1='T
                       (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 43)))
                            (EXIT
                             (COND ((QEQCAR |f1| 1) |f|)
                                   (#1#
                                    (|IDEAL;choosel| (QCDR |f1|) |g| $)))))))))) 

(SDEFUN |IDEAL;contractGrob| ((I1 |List| |newPoly|) ($ $))
        (SPROG
         ((#1=#:G414 NIL) (#2=#:G431 NIL) (|f| NIL) (#3=#:G430 NIL)
          (J1 (|List| |newPoly|)))
         (SEQ (LETT J1 (SPADCALL I1 (QREFELT $ 46)))
              (SEQ G190
                   (COND
                    ((NULL (QEQCAR (|IDEAL;oldpoly| (|SPADfirst| J1) $) 1))
                     (GO G191)))
                   (SEQ (EXIT (LETT J1 (CDR J1)))) NIL (GO G190) G191
                   (EXIT NIL))
              (EXIT
               (CONS
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# J1) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROG2 (LETT #1# (|IDEAL;oldpoly| |f| $))
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                                 (|Union| (QREFELT $ 9)
                                                          "failed")
                                                 #1#))
                               #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                'T))))) 

(SDEFUN |IDEAL;makeleast|
        ((|fullVars| |List| |VarSet|) (|leastVars| |List| |VarSet|)
         ($ |List| |VarSet|))
        (SPROG
         ((#1=#:G437 NIL) (|vv| NIL) (#2=#:G436 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |leastVars|))
              (EXIT
               (COND ((< (LENGTH |fullVars|) |n|) (|error| "wrong vars"))
                     ((EQL |n| 0) |fullVars|)
                     ('T
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |vv| NIL) (LETT #1# |fullVars|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |vv| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |vv| |leastVars| (QREFELT $ 47)))
                                 (LETT #2# (CONS |vv| #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       |leastVars| (QREFELT $ 48)))))))) 

(SDEFUN |IDEAL;isMonic?| ((|f| |DPoly|) (|x| |VarSet|) ($ |Boolean|))
        (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 39)) (QREFELT $ 41))
                  (QREFELT $ 49))) 

(SDEFUN |IDEAL;subset|
        ((|lv| |List| |VarSet|) ($ . #1=(|List| (|List| |VarSet|))))
        (SPROG
         ((|l1| (|List| (|List| |VarSet|))) (#2=#:G445 NIL) (|set| NIL)
          (#3=#:G444 NIL) (|ll| #1#) (|v| (|VarSet|)))
         (SEQ
          (COND ((EQL (LENGTH |lv|) 1) (LIST |lv| NIL))
                ('T
                 (SEQ (LETT |v| (SPADCALL |lv| 1 (QREFELT $ 53)))
                      (LETT |ll| (|IDEAL;subset| (CDR |lv|) $))
                      (LETT |l1|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |set| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |set| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3# (CONS (CONS |v| |set|) #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                      (EXIT (SPADCALL |l1| |ll| (QREFELT $ 55))))))))) 

(SDEFUN |IDEAL;monomDim|
        ((|listm| $) (|lv| . #1=(|List| |VarSet|)) ($ |NonNegativeInteger|))
        (SPROG
         ((#2=#:G457 NIL) (|ldif| #1#) (#3=#:G460 NIL)
          (|mvset| (|List| |VarSet|)) (#4=#:G459 NIL) (|subs| NIL)
          (|lsubset| (|List| (|List| |VarSet|)))
          (|monvar| (|List| (|List| |VarSet|))) (#5=#:G458 NIL) (|f| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |monvar| NIL)
                (SEQ (LETT |f| NIL)
                     (LETT #5# (SPADCALL |listm| (QREFELT $ 57))) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |mvset| (SPADCALL |f| (QREFELT $ 36)))
                          (EXIT
                           (COND
                            ((> (LENGTH |mvset|) 1)
                             (LETT |monvar| (CONS |mvset| |monvar|)))
                            ('T
                             (LETT |lv|
                                   (SPADCALL |lv|
                                             (SPADCALL
                                              (SPADCALL |mvset| 1
                                                        (QREFELT $ 53))
                                              |lv| (QREFELT $ 59))
                                             (QREFELT $ 60)))))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((NULL |lv|) 0)
                       ('T
                        (SEQ
                         (LETT |lsubset|
                               (SPADCALL (CONS #'|IDEAL;monomDim!0| $)
                                         (|IDEAL;subset| |lv| $)
                                         (QREFELT $ 64)))
                         (SEQ (LETT |subs| NIL) (LETT #4# |lsubset|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |subs| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |ldif| |lv|)
                                   (SEQ (LETT |mvset| NIL) (LETT #3# |monvar|)
                                        G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |mvset| (CAR #3#))
                                               NIL)
                                              (NULL
                                               (SPADCALL |ldif| NIL
                                                         (QREFELT $ 65))))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |ldif|
                                                (SPADCALL |mvset| |subs|
                                                          (QREFELT $ 66)))))
                                        (LETT #3# (CDR #3#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((NULL (NULL |ldif|))
                                      (PROGN
                                       (LETT #2# (LENGTH |subs|))
                                       (GO #6=#:G456))))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 0)))))))
          #6# (EXIT #2#)))) 

(SDEFUN |IDEAL;monomDim!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 61)) (SPADCALL |z2| (QREFELT $ 61))
                  (QREFELT $ 62))) 

(SDEFUN |IDEAL;=;2$B;10| ((I $) (J $) ($ |Boolean|))
        (COND ((SPADCALL I J (QREFELT $ 67)) (SPADCALL J I (QREFELT $ 67)))
              ('T NIL))) 

(SDEFUN |IDEAL;element?;DPoly$B;11| ((|f| |DPoly|) (I $) ($ |Boolean|))
        (SPROG ((|Id| (|List| |DPoly|)))
               (SEQ (LETT |Id| (QCAR (SPADCALL I (QREFELT $ 69))))
                    (EXIT
                     (COND
                      ((NULL |Id|)
                       (SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15)))
                      ('T
                       (SPADCALL (SPADCALL |f| |Id| (QREFELT $ 71))
                                 (|spadConstant| $ 13) (QREFELT $ 15)))))))) 

(SDEFUN |IDEAL;in?;2$B;12| ((I $) (J $) ($ |Boolean|))
        (SPROG
         ((#1=#:G467 NIL) (#2=#:G466 #3=(|Boolean|)) (#4=#:G468 #3#)
          (#5=#:G471 NIL) (|f| NIL))
         (SEQ (LETT J (SPADCALL J (QREFELT $ 69)))
              (EXIT
               (COND ((NULL (QCAR I)) 'T)
                     (#6='T
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |f| NIL) (LETT #5# (QCAR I)) G190
                            (COND
                             ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #4# (SPADCALL |f| J (QREFELT $ 72)))
                               (COND (#1# (LETT #2# (COND (#2# #4#) ('T NIL))))
                                     ('T
                                      (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                            (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                       (COND (#1# #2#) (#6# 'T))))))))) 

(SDEFUN |IDEAL;groebner;2$;13| ((I $) ($ $))
        (SPROG
         ((#1=#:G473 NIL) (#2=#:G472 #3=(|Boolean|)) (#4=#:G474 #3#)
          (#5=#:G479 NIL) (|f| NIL))
         (SEQ
          (COND
           ((QCDR I)
            (COND
             ((PROGN
               (LETT #1# NIL)
               (SEQ (LETT |f| NIL) (LETT #5# (QCAR I)) G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #4# (NULL (SPADCALL |f| (QREFELT $ 73))))
                       (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#))))
                             ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                    (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
               (COND (#1# #2#) (#6='T NIL)))
              I)
             (#6# (CONS NIL 'T))))
           (#6# (CONS (SPADCALL (QCAR I) (QREFELT $ 74)) 'T)))))) 

(SDEFUN |IDEAL;intersect;3$;14| ((I $) (J $) ($ $))
        (SPROG
         ((#1=#:G490 NIL) (|f| NIL) (#2=#:G489 NIL) (#3=#:G488 NIL)
          (#4=#:G487 NIL) (|tp1| (|newPoly|)) (|tp| (|newPoly|))
          (|Jd| #5=(|List| |DPoly|)) (|Id| #5#))
         (SEQ
          (COND ((NULL (LETT |Id| (QCAR I))) I) ((NULL (LETT |Jd| (QCAR J))) J)
                ('T
                 (SEQ
                  (LETT |tp|
                        (SPADCALL (|spadConstant| $ 50)
                                  (SPADCALL 1 (|spadConstant| $ 19)
                                            (QREFELT $ 22))
                                  (QREFELT $ 23)))
                  (LETT |tp1|
                        (SPADCALL |tp| (|spadConstant| $ 75) (QREFELT $ 76)))
                  (EXIT
                   (|IDEAL;contractGrob|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |f| NIL) (LETT #3# |Id|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (SPADCALL |tp| (|IDEAL;npoly| |f| $)
                                              (QREFELT $ 77))
                                    #4#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |f| NIL) (LETT #1# |Jd|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |tp1| (|IDEAL;npoly| |f| $)
                                              (QREFELT $ 77))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 78))
                    $)))))))) 

(SDEFUN |IDEAL;intersect;L$;15| ((|lid| |List| $) ($ $))
        (SPROG
         ((#1=#:G492 NIL) (#2=#:G491 ($)) (#3=#:G493 ($)) (#4=#:G495 NIL)
          (|l| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |l| NIL) (LETT #4# |lid|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# |l|)
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 79))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|IdentityError| '|intersect|))))))) 

(SDEFUN |IDEAL;quotient;$DPoly$;16| ((I $) (|f| |DPoly|) ($ $))
        (SPROG ((#1=#:G414 NIL) (#2=#:G501 NIL) (|g| NIL) (#3=#:G500 NIL))
               (SEQ
                (CONS
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL)
                   (SEQ (LETT |g| NIL)
                        (LETT #2#
                              (QCAR
                               (SPADCALL I (SPADCALL (LIST |f|) (QREFELT $ 82))
                                         (QREFELT $ 79))))
                        G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3#
                                (CONS
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL |g| |f| (QREFELT $ 43)))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                                   (|Union| (QREFELT $ 9)
                                                            "failed")
                                                   #1#))
                                 #3#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 84))
                 'T)))) 

(SDEFUN |IDEAL;quotient;3$;17| ((I $) (J $) ($ $))
        (SPROG
         ((#1=#:G506 NIL) (#2=#:G505 ($)) (#3=#:G507 ($)) (#4=#:G510 NIL)
          (|f| NIL) (|Jdl| (|List| |DPoly|)))
         (SEQ (LETT |Jdl| (QCAR J))
              (EXIT
               (COND
                ((NULL |Jdl|)
                 (SPADCALL (LIST (|spadConstant| $ 51)) (QREFELT $ 86)))
                (#5='T
                 (CONS
                  (QCAR
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |f| NIL) (LETT #4# |Jdl|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #3# (SPADCALL I |f| (QREFELT $ 85)))
                            (COND
                             (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 79))))
                             ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                         (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                    (COND (#1# #2#) (#5# (|IdentityError| '|intersect|)))))
                  'T))))))) 

(SDEFUN |IDEAL;+;3$;18| ((I $) (J $) ($ $))
        (CONS
         (SPADCALL (SPADCALL (QCAR I) (QCAR J) (QREFELT $ 88)) (QREFELT $ 74))
         'T)) 

(SDEFUN |IDEAL;*;3$;19| ((I $) (J $) ($ $))
        (SPROG
         ((#1=#:G513 NIL) (#2=#:G512 #3=(|List| |DPoly|)) (#4=#:G514 #3#)
          (#5=#:G519 NIL) (|f| NIL) (#6=#:G518 NIL) (#7=#:G517 NIL) (|g| NIL))
         (SEQ
          (CONS
           (SPADCALL
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |g| NIL) (LETT #7# (QCAR J)) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #6# NIL)
                            (SEQ (LETT |f| NIL) (LETT #5# (QCAR I)) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |f| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6#
                                         (CONS
                                          (SPADCALL |f| |g| (QREFELT $ 90))
                                          #6#))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT (NREVERSE #6#)))))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 91))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T NIL)))
            (QREFELT $ 74))
           'T)))) 

(SDEFUN |IDEAL;^;$Nni$;20| ((I $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G520 NIL))
               (COND ((EQL |n| 0) (CONS (LIST (|spadConstant| $ 51)) 'T))
                     ('T
                      (SPADCALL I
                                (SPADCALL I
                                          (PROG1 (LETT #1# (- |n| 1))
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT $ 93))
                                (QREFELT $ 92)))))) 

(SDEFUN |IDEAL;saturate;$DPoly$;21| ((I $) (|f| |DPoly|) ($ $))
        (SPROG ((#1=#:G526 NIL) (|g| NIL) (#2=#:G525 NIL) (|tp| (|newPoly|)))
               (SEQ
                (COND
                 ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15))
                  (|error| "f is zero"))
                 ('T
                  (SEQ
                   (LETT |tp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 50)
                                     (SPADCALL 1 (|spadConstant| $ 19)
                                               (QREFELT $ 22))
                                     (QREFELT $ 23))
                           (|IDEAL;npoly| |f| $) (QREFELT $ 77))
                          (|spadConstant| $ 75) (QREFELT $ 76)))
                   (EXIT
                    (|IDEAL;contractGrob|
                     (CONS |tp|
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |g| NIL) (LETT #1# (QCAR I)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |g| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (|IDEAL;npoly| |g| $) #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#)))))
                     $)))))))) 

(SDEFUN |IDEAL;saturate;$DPolyL$;22|
        ((I $) (|f| |DPoly|) (|lvar| |List| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G552 NIL) (|g| NIL) (#2=#:G551 NIL)
          (|fullPol| (|List| |DPoly|)) (#3=#:G550 NIL) (|vv| NIL)
          (#4=#:G549 NIL) (|s| (|DPoly|)) (#5=#:G535 NIL) (#6=#:G534 (|DPoly|))
          (#7=#:G536 (|DPoly|)) (#8=#:G548 NIL) (|ltg| NIL)
          (|ltJ| (|List| |DPoly|)) (#9=#:G547 NIL) (#10=#:G546 NIL)
          (J (|List| |DPoly|)) (#11=#:G545 NIL) (#12=#:G544 NIL)
          (|subVars| (|List| |DPoly|)) (#13=#:G543 NIL) (#14=#:G542 NIL)
          (|newVars| (|List| |VarSet|)) (|fullVars| #15=(|List| |VarSet|))
          (#16=#:G528 NIL) (#17=#:G527 #15#) (#18=#:G529 #15#) (#19=#:G541 NIL)
          (|Id| (|List| |DPoly|)))
         (SEQ (LETT |Id| (QCAR I))
              (LETT |fullVars|
                    (PROGN
                     (LETT #16# NIL)
                     (SEQ (LETT |g| NIL) (LETT #19# |Id|) G190
                          (COND
                           ((OR (ATOM #19#) (PROGN (LETT |g| (CAR #19#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #18# (SPADCALL |g| (QREFELT $ 36)))
                             (COND
                              (#16#
                               (LETT #17# (SPADCALL #17# #18# (QREFELT $ 95))))
                              ('T (PROGN (LETT #17# #18#) (LETT #16# 'T)))))))
                          (LETT #19# (CDR #19#)) (GO G190) G191 (EXIT NIL))
                     (COND (#16# #17#)
                           (#20='T (|IdentityError| '|setUnion|)))))
              (LETT |newVars| (|IDEAL;makeleast| |fullVars| |lvar| $))
              (LETT |subVars|
                    (PROGN
                     (LETT #14# NIL)
                     (SEQ (LETT |vv| NIL) (LETT #13# |newVars|) G190
                          (COND
                           ((OR (ATOM #13#) (PROGN (LETT |vv| (CAR #13#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS
                                   (SPADCALL (|spadConstant| $ 51) |vv| 1
                                             (QREFELT $ 96))
                                   #14#))))
                          (LETT #13# (CDR #13#)) (GO G190) G191
                          (EXIT (NREVERSE #14#)))))
              (LETT J
                    (SPADCALL
                     (PROGN
                      (LETT #12# NIL)
                      (SEQ (LETT |g| NIL) (LETT #11# |Id|) G190
                           (COND
                            ((OR (ATOM #11#) (PROGN (LETT |g| (CAR #11#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #12#
                                   (CONS
                                    (SPADCALL |g| |fullVars| |subVars|
                                              (QREFELT $ 97))
                                    #12#))))
                           (LETT #11# (CDR #11#)) (GO G190) G191
                           (EXIT (NREVERSE #12#))))
                     (QREFELT $ 74)))
              (LETT |ltJ|
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |g| NIL) (LETT #9# J) G190
                          (COND
                           ((OR (ATOM #9#) (PROGN (LETT |g| (CAR #9#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS (|IDEAL;leadterm| |g| |lvar| $)
                                        #10#))))
                          (LETT #9# (CDR #9#)) (GO G190) G191
                          (EXIT (NREVERSE #10#)))))
              (LETT |s|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |ltg| NIL) (LETT #8# |ltJ|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |ltg| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #7# (|IDEAL;choosel| |ltg| |f| $))
                             (COND
                              (#5#
                               (LETT #6# (SPADCALL #6# #7# (QREFELT $ 90))))
                              ('T (PROGN (LETT #6# #7#) (LETT #5# 'T)))))))
                          (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #6#) (#20# (|spadConstant| $ 51)))))
              (LETT |fullPol|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |vv| NIL) (LETT #3# |fullVars|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |vv| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL (|spadConstant| $ 51) |vv| 1
                                             (QREFELT $ 96))
                                   #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (EXIT
               (CONS
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |g| NIL)
                      (LETT #1#
                            (QCAR
                             (SPADCALL (SPADCALL J (QREFELT $ 82)) |s|
                                       (QREFELT $ 94))))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |g| |newVars| |fullPol|
                                         (QREFELT $ 97))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                'T))))) 

(SDEFUN |IDEAL;zeroDim?;$LB;23| ((I $) (|lvar| |List| |VarSet|) ($ |Boolean|))
        (SPROG
         ((|x| (|VarSet|)) (#1=#:G555 NIL) (#2=#:G564 NIL) (|f| NIL)
          (|n| (|NonNegativeInteger|)) (J (|List| |DPoly|)))
         (SEQ (LETT J (QCAR (SPADCALL I (QREFELT $ 69))))
              (EXIT
               (COND
                ((OR (NULL J)
                     (SPADCALL J (LIST (|spadConstant| $ 51)) (QREFELT $ 99)))
                 NIL)
                ('T
                 (SEQ (LETT |n| (LENGTH |lvar|))
                      (EXIT
                       (COND ((< (LENGTH J) |n|) NIL)
                             ('T
                              (SEQ
                               (SEQ (LETT |f| NIL) (LETT #2# J) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |f| (CAR #2#)) NIL)
                                          (NULL (NULL (NULL |lvar|))))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |x|
                                           (PROG2
                                               (LETT #1#
                                                     (SPADCALL |f|
                                                               (QREFELT $
                                                                        101)))
                                               (QCDR #1#)
                                             (|check_union2| (QEQCAR #1# 0)
                                                             (QREFELT $ 8)
                                                             (|Union|
                                                              (QREFELT $ 8)
                                                              "failed")
                                                             #1#)))
                                     (EXIT
                                      (COND
                                       ((|IDEAL;isMonic?| |f| |x| $)
                                        (LETT |lvar|
                                              (SPADCALL |lvar|
                                                        (SPADCALL |x| |lvar|
                                                                  (QREFELT $
                                                                           59))
                                                        (QREFELT $ 60)))))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (NULL |lvar|))))))))))))) 

(SDEFUN |IDEAL;zeroDim?;$B;24| ((I $) ($ |Boolean|))
        (SPROG
         ((#1=#:G566 NIL) (#2=#:G565 #3=(|List| |VarSet|)) (#4=#:G567 #3#)
          (#5=#:G570 NIL) (|g| NIL))
         (SEQ
          (SPADCALL I
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |g| NIL) (LETT #5# (QCAR I)) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4# (SPADCALL |g| (QREFELT $ 36)))
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 95))))
                              ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                    (QREFELT $ 102))))) 

(SDEFUN |IDEAL;inRadical?;DPoly$B;25| ((|f| |DPoly|) (I $) ($ |Boolean|))
        (SPROG
         ((#1=#:G633 NIL) (|g| NIL) (#2=#:G632 NIL) (|Id| (|List| |DPoly|))
          (|tp| (|newPoly|)))
         (SEQ
          (COND ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15)) 'T)
                ('T
                 (SEQ
                  (LETT |tp|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 50)
                                    (SPADCALL 1 (|spadConstant| $ 19)
                                              (QREFELT $ 22))
                                    (QREFELT $ 23))
                          (|IDEAL;npoly| |f| $) (QREFELT $ 77))
                         (|spadConstant| $ 75) (QREFELT $ 76)))
                  (LETT |Id| (QCAR I))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 75)
                              (SPADCALL
                               (CONS |tp|
                                     (PROGN
                                      (LETT #2# NIL)
                                      (SEQ (LETT |g| NIL) (LETT #1# |Id|) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |g| (CAR #1#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #2#
                                                   (CONS (|IDEAL;npoly| |g| $)
                                                         #2#))))
                                           (LETT #1# (CDR #1#)) (GO G190) G191
                                           (EXIT (NREVERSE #2#)))))
                               (QREFELT $ 46))
                              (QREFELT $ 104))
                    (|spadConstant| $ 16) (QREFELT $ 26))))))))) 

(SDEFUN |IDEAL;dimension;$LI;26| ((I $) (|lvar| |List| |VarSet|) ($ |Integer|))
        (SPROG
         ((|n1| (|Integer|)) (|leadid| ($)) (|ed| (|Integer|))
          (|truelist| #1=(|List| |VarSet|)) (#2=#:G639 NIL)
          (#3=#:G638 #4=(|Boolean|)) (#5=#:G640 #4#) (#6=#:G648 NIL) (|vv| NIL)
          (#7=#:G635 NIL) (#8=#:G634 #1#) (#9=#:G636 #1#) (#10=#:G647 NIL)
          (|f| NIL))
         (SEQ (LETT I (SPADCALL I (QREFELT $ 69)))
              (EXIT
               (COND ((NULL (QCAR I)) (LENGTH |lvar|))
                     ((SPADCALL (|spadConstant| $ 51) I (QREFELT $ 72)) -1)
                     (#11='T
                      (SEQ
                       (LETT |truelist|
                             (PROGN
                              (LETT #7# NIL)
                              (SEQ (LETT |f| NIL) (LETT #10# (QCAR I)) G190
                                   (COND
                                    ((OR (ATOM #10#)
                                         (PROGN (LETT |f| (CAR #10#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #9# (SPADCALL |f| (QREFELT $ 36)))
                                      (COND
                                       (#7#
                                        (LETT #8#
                                              (SPADCALL #8# #9#
                                                        (QREFELT $ 95))))
                                       ('T
                                        (PROGN
                                         (LETT #8# #9#)
                                         (LETT #7# 'T)))))))
                                   (LETT #10# (CDR #10#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#7# #8#)
                                    (#11# (|IdentityError| '|setUnion|)))))
                       (EXIT
                        (COND
                         ((PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |vv| NIL) (LETT #6# |truelist|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |vv| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #5#
                                         (NULL
                                          (SPADCALL |vv| |lvar|
                                                    (QREFELT $ 47))))
                                   (COND
                                    (#2# (LETT #3# (COND (#3# 'T) ('T #5#))))
                                    ('T
                                     (PROGN (LETT #3# #5#) (LETT #2# 'T)))))))
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (COND (#2# #3#) (#11# NIL)))
                          (|error| "wrong variables"))
                         (#11#
                          (SEQ
                           (LETT |truelist|
                                 (SPADCALL |lvar|
                                           (SPADCALL |lvar| |truelist|
                                                     (QREFELT $ 66))
                                           (QREFELT $ 66)))
                           (LETT |ed| (- (LENGTH |lvar|) (LENGTH |truelist|)))
                           (LETT |leadid| (SPADCALL I (QREFELT $ 106)))
                           (LETT |n1| (|IDEAL;monomDim| |leadid| |truelist| $))
                           (EXIT (+ |ed| |n1|))))))))))))) 

(SDEFUN |IDEAL;dimension;$I;27| ((I $) ($ |Integer|))
        (SPROG
         ((#1=#:G650 NIL) (#2=#:G649 #3=(|List| |VarSet|)) (#4=#:G651 #3#)
          (#5=#:G654 NIL) (|g| NIL))
         (SEQ
          (SPADCALL I
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |g| NIL) (LETT #5# (QCAR I)) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4# (SPADCALL |g| (QREFELT $ 36)))
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 95))))
                              ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                    (QREFELT $ 107))))) 

(SDEFUN |IDEAL;leadingIdeal;2$;28| ((I $) ($ $))
        (SPROG
         ((#1=#:G659 NIL) (|f| NIL) (#2=#:G658 NIL) (|Idl| (|List| |DPoly|)))
         (SEQ (LETT |Idl| (QCAR (SPADCALL I (QREFELT $ 69))))
              (EXIT
               (CONS
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |f| NIL) (LETT #1# |Idl|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |f| (SPADCALL |f| (QREFELT $ 24))
                                         (QREFELT $ 109))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                'T))))) 

(SDEFUN |IDEAL;monompol|
        ((|df| |List| (|NonNegativeInteger|)) (|lcf| F) (|lv| |List| |VarSet|)
         ($ |Polynomial| F))
        (SPROG
         ((|g| (|Polynomial| F)) (#1=#:G663 NIL) (|dd| NIL) (#2=#:G664 NIL)
          (|v| NIL))
         (SEQ (LETT |g| (SPADCALL |lcf| (QREFELT $ 111)))
              (SEQ (LETT |v| NIL) (LETT #2# |lv|) (LETT |dd| NIL)
                   (LETT #1# |df|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#)) NIL)
                         (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |g|
                           (SPADCALL |g| (SPADCALL |v| (QREFELT $ 113)) |dd|
                                     (QREFELT $ 114)))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |g|)))) 

(SDEFUN |IDEAL;relationsIdeal;LSt;30|
        ((|listf| |List| |DPoly|)
         ($ |SuchThat| (|List| (|Polynomial| F))
          (|List| (|Equation| (|Polynomial| F)))))
        (SPROG
         ((|solsn| (|List| (|Polynomial| F))) (|g| #1=(|Polynomial| F))
          (#2=#:G684 NIL) (#3=#:G683 #4=(|Polynomial| F)) (#5=#:G685 #4#)
          (#6=#:G708 NIL) (|p| NIL) (|j| NIL)
          (|vdq| (|Vector| (|NonNegativeInteger|))) (|q| (|nPoly|)) (|lcq| (F))
          (|dq| (|nExponent|)) (#7=#:G707 NIL) (|lf| (|List| |nPoly|))
          (#8=#:G693 NIL) (|n| (|Expon|))
          (|leq| (|List| (|Equation| (|Polynomial| F)))) (#9=#:G705 NIL)
          (#10=#:G706 NIL) (|pol| #1#) (#11=#:G704 NIL)
          (|npol| (|List| (|Polynomial| F))) (#12=#:G703 NIL) (|v| NIL)
          (#13=#:G702 NIL) (|lp| (|List| (|Polynomial| F))) (|f| (|DPoly|))
          (|lcf| (F)) (|df| (|List| (|NonNegativeInteger|)))
          (|vec2| (|Vector| (|NonNegativeInteger|))) (#14=#:G701 NIL) (|i| NIL)
          (|gp|
           (CATEGORY |package|
            (SIGNATURE |groebner| ((|List| |nPoly|) (|List| |nPoly|)))
            (SIGNATURE |groebner|
             ((|List| |nPoly|) (|List| |nPoly|) (|String|)))
            (SIGNATURE |groebner|
             ((|List| |nPoly|) (|List| |nPoly|) (|String|) (|String|)))
            (IF (|has| F (|Field|))
                (SIGNATURE |normalForm| (|nPoly| |nPoly| (|List| |nPoly|)))
                |noBranch|)))
          (|nPoly|
           (|Join| (|FiniteAbelianMonoidRing| F |nExponent|)
                   (|VariablesCommuteWithCoefficients|)
                   (CATEGORY |package|
                    (IF (|has| F (|canonicalUnitNormal|))
                        (ATTRIBUTE (|canonicalUnitNormal|))
                        |noBranch|)
                    (IF (|has| F (|Comparable|))
                        (ATTRIBUTE (|Comparable|))
                        |noBranch|))))
          (|nExponent|
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (IF (|has| |Expon| (|Finite|))
                        (IF (|has| |DirP| (|Finite|))
                            (ATTRIBUTE (|Finite|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Monoid|))
                        (IF (|has| |DirP| (|Monoid|))
                            (ATTRIBUTE (|Monoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|AbelianMonoid|))
                        (IF (|has| |DirP| (|AbelianMonoid|))
                            (ATTRIBUTE (|AbelianMonoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|CancellationAbelianMonoid|))
                        (IF (|has| |DirP| (|CancellationAbelianMonoid|))
                            (ATTRIBUTE (|CancellationAbelianMonoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Group|))
                        (IF (|has| |DirP| (|Group|))
                            (ATTRIBUTE (|Group|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|AbelianGroup|))
                        (IF (|has| |DirP| (|AbelianGroup|))
                            (ATTRIBUTE (|AbelianGroup|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|OrderedAbelianMonoidSup|))
                        (IF (|has| |DirP| (|OrderedAbelianMonoidSup|))
                            (ATTRIBUTE (|OrderedAbelianMonoidSup|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|OrderedSet|))
                        (IF (|has| |DirP| (|OrderedSet|))
                            (ATTRIBUTE (|OrderedSet|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Comparable|))
                        (IF (|has| |DirP| (|Comparable|))
                            (ATTRIBUTE (|Comparable|))
                            |noBranch|)
                        |noBranch|)
                    (SIGNATURE |construct| ($ |Expon| |DirP|))
                    (SIGNATURE |first| (|Expon| $))
                    (SIGNATURE |second| (|DirP| $)))))
          (|DirP| (|DirectProductCategory| |nf| (|NonNegativeInteger|)))
          (|lv1| (|List| |VarSet1|)) (#15=#:G672 NIL) (#16=#:G700 NIL)
          (|vv| NIL) (#17=#:G699 NIL)
          (|VarSet1|
           (|Join| (|OrderedFinite|) (|ConvertibleTo| (|Symbol|))
                   (|ConvertibleTo| (|InputForm|))
                   (|ConvertibleTo| (|Pattern| (|Float|)))
                   (|ConvertibleTo| (|Pattern| (|Integer|)))
                   (CATEGORY |domain|
                    (SIGNATURE |variable| ((|Union| $ "failed") (|Symbol|))))))
          (|nvar| (|List| (|Symbol|))) (#18=#:G698 NIL) (#19=#:G697 NIL)
          (|vl| (|List| (|Symbol|))) (#20=#:G696 NIL) (#21=#:G695 NIL)
          (|lvint| #22=(|List| |VarSet|)) (#23=#:G666 NIL) (#24=#:G665 #22#)
          (#25=#:G667 #22#) (#26=#:G694 NIL) (|nf| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |listf|) (SPADCALL NIL NIL (QREFELT $ 118)))
                (#27='T
                 (SEQ (LETT |nf| (LENGTH |listf|))
                      (LETT |lvint|
                            (PROGN
                             (LETT #23# NIL)
                             (SEQ (LETT |g| NIL) (LETT #26# |listf|) G190
                                  (COND
                                   ((OR (ATOM #26#)
                                        (PROGN (LETT |g| (CAR #26#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #25# (SPADCALL |g| (QREFELT $ 36)))
                                     (COND
                                      (#23#
                                       (LETT #24#
                                             (SPADCALL #24# #25#
                                                       (QREFELT $ 95))))
                                      ('T
                                       (PROGN
                                        (LETT #24# #25#)
                                        (LETT #23# 'T)))))))
                                  (LETT #26# (CDR #26#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#23# #24#)
                                   (#27# (|IdentityError| '|setUnion|)))))
                      (LETT |vl|
                            (PROGN
                             (LETT #21# NIL)
                             (SEQ (LETT |vv| NIL) (LETT #20# |lvint|) G190
                                  (COND
                                   ((OR (ATOM #20#)
                                        (PROGN (LETT |vv| (CAR #20#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #21#
                                          (CONS (SPADCALL |vv| (QREFELT $ 113))
                                                #21#))))
                                  (LETT #20# (CDR #20#)) (GO G190) G191
                                  (EXIT (NREVERSE #21#)))))
                      (LETT |nvar|
                            (PROGN
                             (LETT #19# NIL)
                             (SEQ (LETT |i| 1) (LETT #18# |nf|) G190
                                  (COND ((|greater_SI| |i| #18#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #19#
                                          (CONS (SPADCALL (QREFELT $ 119))
                                                #19#))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #19#)))))
                      (LETT |VarSet1|
                            (|OrderedVariableList|
                             (SPADCALL |vl| |nvar| (QREFELT $ 121))))
                      (LETT |lv1|
                            (PROGN
                             (LETT #17# NIL)
                             (SEQ (LETT |vv| NIL) (LETT #16# |nvar|) G190
                                  (COND
                                   ((OR (ATOM #16#)
                                        (PROGN (LETT |vv| (CAR #16#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #17#
                                          (CONS
                                           (PROG2
                                               (LETT #15#
                                                     (SPADCALL |vv|
                                                               (|compiledLookupCheck|
                                                                '|variable|
                                                                (LIST
                                                                 (LIST '|Union|
                                                                       '$
                                                                       '#28="failed")
                                                                 (LIST
                                                                  '|Symbol|))
                                                                |VarSet1|)))
                                               (QCDR #15#)
                                             (|check_union2| (QEQCAR #15# 0)
                                                             |VarSet1|
                                                             (|Union| |VarSet1|
                                                                      #28#)
                                                             #15#))
                                           #17#))))
                                  (LETT #16# (CDR #16#)) (GO G190) G191
                                  (EXIT (NREVERSE #17#)))))
                      (LETT |DirP|
                            (|DirectProduct| |nf| (|NonNegativeInteger|)))
                      (LETT |nExponent| (|Product| (QREFELT $ 7) |DirP|))
                      (LETT |nPoly|
                            (|PolynomialRing| (QREFELT $ 6) |nExponent|))
                      (LETT |gp|
                            (|GroebnerPackage| (QREFELT $ 6) |nExponent|
                                               |nPoly|))
                      (LETT |lf| NIL) (LETT |lp| NIL)
                      (SEQ (LETT |i| 1) (LETT |f| NIL) (LETT #14# |listf|) G190
                           (COND
                            ((OR (ATOM #14#) (PROGN (LETT |f| (CAR #14#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |vec2| (SPADCALL |nf| 0 (QREFELT $ 123)))
                                (SPADCALL |vec2| |i| 1 (QREFELT $ 124))
                                (LETT |g|
                                      (SPADCALL
                                       (|compiledLookupCheck| '|Zero| (LIST '$)
                                                              |nPoly|)))
                                (LETT |pol| (|spadConstant| $ 125))
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL |f| (|spadConstant| $ 13)
                                                  (QREFELT $ 126)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |df|
                                            (SPADCALL
                                             (SPADCALL |f|
                                                       (SPADCALL |f|
                                                                 (QREFELT $
                                                                          24))
                                                       (QREFELT $ 109))
                                             |lvint| (QREFELT $ 128)))
                                      (LETT |lcf|
                                            (SPADCALL |f| (QREFELT $ 17)))
                                      (LETT |pol|
                                            (SPADCALL |pol|
                                                      (|IDEAL;monompol| |df|
                                                       |lcf| |lvint| $)
                                                      (QREFELT $ 129)))
                                      (LETT |g|
                                            (SPADCALL |g|
                                                      (SPADCALL |lcf|
                                                                (SPADCALL
                                                                 (SPADCALL |f|
                                                                           (QREFELT
                                                                            $
                                                                            20))
                                                                 (SPADCALL
                                                                  (|compiledLookupCheck|
                                                                   '|Zero|
                                                                   (LIST '$)
                                                                   |DirP|))
                                                                 (|compiledLookupCheck|
                                                                  '|construct|
                                                                  (LIST '$
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              7))
                                                                        (|devaluate|
                                                                         |DirP|))
                                                                  |nExponent|))
                                                                (|compiledLookupCheck|
                                                                 '|monomial|
                                                                 (LIST '$
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             6))
                                                                       (|devaluate|
                                                                        |nExponent|))
                                                                 |nPoly|))
                                                      (|compiledLookupCheck| '+
                                                                             (LIST
                                                                              '$
                                                                              '$
                                                                              '$)
                                                                             |nPoly|)))
                                      (EXIT
                                       (LETT |f|
                                             (SPADCALL |f| (QREFELT $ 24)))))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (LETT |lp| (CONS |pol| |lp|))
                                (EXIT
                                 (LETT |lf|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 50)
                                                   (SPADCALL
                                                    (|spadConstant| $ 19)
                                                    (SPADCALL |vec2|
                                                              (|compiledLookupCheck|
                                                               '|directProduct|
                                                               (LIST '$
                                                                     (LIST
                                                                      '|Vector|
                                                                      (LIST
                                                                       '|NonNegativeInteger|)))
                                                               |DirP|))
                                                    (|compiledLookupCheck|
                                                     '|construct|
                                                     (LIST '$
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (|devaluate|
                                                            |DirP|))
                                                     |nExponent|))
                                                   (|compiledLookupCheck|
                                                    '|monomial|
                                                    (LIST '$
                                                          (|devaluate|
                                                           (ELT $ 6))
                                                          (|devaluate|
                                                           |nExponent|))
                                                    |nPoly|))
                                         |g|
                                         (|compiledLookupCheck| '-
                                                                (LIST '$ '$ '$)
                                                                |nPoly|))
                                        |lf|))))
                           (LETT #14#
                                 (PROG1 (CDR #14#) (LETT |i| (|inc_SI| |i|))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |npol|
                            (PROGN
                             (LETT #13# NIL)
                             (SEQ (LETT |v| NIL) (LETT #12# |nvar|) G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN (LETT |v| (CAR #12#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13#
                                          (CONS (SPADCALL |v| (QREFELT $ 132))
                                                #13#))))
                                  (LETT #12# (CDR #12#)) (GO G190) G191
                                  (EXIT (NREVERSE #13#)))))
                      (LETT |leq|
                            (PROGN
                             (LETT #11# NIL)
                             (SEQ (LETT |pol| NIL) (LETT #10# (REVERSE |lp|))
                                  (LETT |p| NIL) (LETT #9# |npol|) G190
                                  (COND
                                   ((OR (ATOM #9#)
                                        (PROGN (LETT |p| (CAR #9#)) NIL)
                                        (ATOM #10#)
                                        (PROGN (LETT |pol| (CAR #10#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #11#
                                          (CONS
                                           (SPADCALL |p| |pol| (QREFELT $ 133))
                                           #11#))))
                                  (LETT #9#
                                        (PROG1 (CDR #9#)
                                          (LETT #10# (CDR #10#))))
                                  (GO G190) G191 (EXIT (NREVERSE #11#)))))
                      (LETT |lf|
                            (SPADCALL |lf|
                                      (|compiledLookupCheck| '|groebner|
                                                             (LIST
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |nPoly|))
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |nPoly|)))
                                                             |gp|)))
                      (SEQ
                       (EXIT
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |lf| NIL
                                          (|compiledLookupCheck| '~=
                                                                 (LIST
                                                                  (LIST
                                                                   '|Boolean|)
                                                                  '$ '$)
                                                                 (|List|
                                                                  |nPoly|))))
                               (GO G191)))
                             (SEQ (LETT |q| (|SPADfirst| |lf|))
                                  (LETT |dq|
                                        (SPADCALL |q|
                                                  (|compiledLookupCheck|
                                                   '|degree|
                                                   (LIST
                                                    (|devaluate| |nExponent|)
                                                    '$)
                                                   |nPoly|)))
                                  (LETT |n|
                                        (SPADCALL |dq|
                                                  (|compiledLookupCheck|
                                                   '|first|
                                                   (LIST
                                                    (|devaluate| (ELT $ 7)) '$)
                                                   |nExponent|)))
                                  (COND
                                   ((SPADCALL |n| (|spadConstant| $ 19)
                                              (QREFELT $ 134))
                                    (PROGN
                                     (LETT #8# |$NoValue|)
                                     (GO #29=#:G682))))
                                  (EXIT (LETT |lf| (CDR |lf|))))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #29# (EXIT #8#))
                      (LETT |solsn| NIL)
                      (SEQ (LETT |q| NIL) (LETT #7# |lf|) G190
                           (COND
                            ((OR (ATOM #7#) (PROGN (LETT |q| (CAR #7#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |g| (|spadConstant| $ 125))
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL |q|
                                                  (SPADCALL
                                                   (|compiledLookupCheck|
                                                    '|Zero| (LIST '$) |nPoly|))
                                                  (|compiledLookupCheck| '~=
                                                                         (LIST
                                                                          (LIST
                                                                           '|Boolean|)
                                                                          '$
                                                                          '$)
                                                                         |nPoly|)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |dq|
                                            (SPADCALL |q|
                                                      (|compiledLookupCheck|
                                                       '|degree|
                                                       (LIST
                                                        (|devaluate|
                                                         |nExponent|)
                                                        '$)
                                                       |nPoly|)))
                                      (LETT |lcq|
                                            (SPADCALL |q|
                                                      (|compiledLookupCheck|
                                                       '|leadingCoefficient|
                                                       (LIST
                                                        (|devaluate| (ELT $ 6))
                                                        '$)
                                                       |nPoly|)))
                                      (LETT |q|
                                            (SPADCALL |q|
                                                      (|compiledLookupCheck|
                                                       '|reductum| (LIST '$ '$)
                                                       |nPoly|)))
                                      (LETT |vdq|
                                            (SPADCALL |dq|
                                                      (|compiledLookupCheck|
                                                       '|second|
                                                       (LIST
                                                        (|devaluate| |DirP|)
                                                        '$)
                                                       |nExponent|)))
                                      (EXIT
                                       (LETT |g|
                                             (SPADCALL |g|
                                                       (SPADCALL |lcq|
                                                                 (PROGN
                                                                  (LETT #2#
                                                                        NIL)
                                                                  (SEQ
                                                                   (LETT |j| 1)
                                                                   (LETT |p|
                                                                         NIL)
                                                                   (LETT #6#
                                                                         |npol|)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #6#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |p|
                                                                        (CAR
                                                                         #6#))
                                                                       NIL))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (PROGN
                                                                      (LETT #5#
                                                                            (SPADCALL
                                                                             |p|
                                                                             (SPADCALL
                                                                              |vdq|
                                                                              |j|
                                                                              (QREFELT
                                                                               $
                                                                               135))
                                                                             (QREFELT
                                                                              $
                                                                              136)))
                                                                      (COND
                                                                       (#2#
                                                                        (LETT
                                                                         #3#
                                                                         (SPADCALL
                                                                          #3#
                                                                          #5#
                                                                          (QREFELT
                                                                           $
                                                                           137))))
                                                                       ('T
                                                                        (PROGN
                                                                         (LETT
                                                                          #3#
                                                                          #5#)
                                                                         (LETT
                                                                          #2#
                                                                          'T)))))))
                                                                   (LETT #6#
                                                                         (PROG1
                                                                             (CDR
                                                                              #6#)
                                                                           (LETT
                                                                            |j|
                                                                            (|inc_SI|
                                                                             |j|))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                                  (COND
                                                                   (#2# #3#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     $ 138))))
                                                                 (QREFELT $
                                                                          139))
                                                       (QREFELT $ 129)))))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (EXIT (LETT |solsn| (CONS |g| |solsn|))))
                           (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL |solsn| |leq| (QREFELT $ 118))))))))) 

(PUT '|IDEAL;coerce;L$;31| '|SPADreplace| '(XLAM (|Id|) (CONS |Id| NIL))) 

(SDEFUN |IDEAL;coerce;L$;31| ((|Id| |List| |DPoly|) ($ $)) (CONS |Id| NIL)) 

(SDEFUN |IDEAL;coerce;$Of;32| ((I $) ($ |OutputForm|))
        (SPROG ((|Idl| (|List| |DPoly|)))
               (SEQ (LETT |Idl| (QCAR I))
                    (EXIT
                     (COND
                      ((NULL |Idl|)
                       (SPADCALL (LIST (|spadConstant| $ 13)) (QREFELT $ 142)))
                      ('T (SPADCALL |Idl| (QREFELT $ 142)))))))) 

(SDEFUN |IDEAL;ideal;L$;33| ((|Id| |List| |DPoly|) ($ $))
        (SPROG ((#1=#:G715 NIL) (|f| NIL) (#2=#:G714 NIL))
               (SEQ
                (CONS
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |f| NIL) (LETT #1# |Id|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 126))
                           (LETT #2# (CONS |f| #2#))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 NIL)))) 

(SDEFUN |IDEAL;groebnerIdeal;L$;34| ((|Id| |List| |DPoly|) ($ $))
        (CONS |Id| 'T)) 

(PUT '|IDEAL;generators;$L;35| '|SPADreplace| 'QCAR) 

(SDEFUN |IDEAL;generators;$L;35| ((I $) ($ |List| |DPoly|)) (QCAR I)) 

(PUT '|IDEAL;groebner?;$B;36| '|SPADreplace| 'QCDR) 

(SDEFUN |IDEAL;groebner?;$B;36| ((I $) ($ |Boolean|)) (QCDR I)) 

(SDEFUN |IDEAL;one?;$B;37| ((I $) ($ |Boolean|))
        (SPADCALL (|spadConstant| $ 51) I (QREFELT $ 72))) 

(SDEFUN |IDEAL;zero?;$B;38| ((I $) ($ |Boolean|))
        (NULL (QCAR (SPADCALL I (QREFELT $ 69))))) 

(DECLAIM (NOTINLINE |PolynomialIdeal;|)) 

(DEFUN |PolynomialIdeal| (&REST #1=#:G722)
  (SPROG NIL
         (PROG (#2=#:G723)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialIdeal|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialIdeal;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialIdeal|)))))))))) 

(DEFUN |PolynomialIdeal;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PolynomialIdeal| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 152))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|ConvertibleTo|
                                                         (|Symbol|)))))))
    (|haddProp| |$ConstructorCache| '|PolynomialIdeal|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10
              (|Record| (|:| |idl| (|List| |#4|)) (|:| |isGr| (|Boolean|))))
    (QSETREFV $ 11 (|Product| (|NonNegativeInteger|) |#2|))
    (QSETREFV $ 12 (|PolynomialRing| |#1| (QREFELT $ 11)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 140
                 (CONS (|dispatchFunction| |IDEAL;relationsIdeal;LSt;30|)
                       $)))))
    $))) 

(MAKEPROP '|PolynomialIdeal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| '|newExpon| '|newPoly|
              (0 . |Zero|) (|Boolean|) (4 . =) (10 . |Zero|)
              (14 . |leadingCoefficient|) (19 . |Zero|) (23 . |Zero|)
              (27 . |degree|) (|NonNegativeInteger|) (32 . |construct|)
              (38 . |monomial|) (44 . |reductum|) (49 . +) (55 . =)
              (61 . |degree|) (66 . |first|) (71 . ~=) (77 . |reductum|)
              (82 . |leadingCoefficient|) (87 . |second|) (92 . |monomial|)
              (98 . +) (|List| 8) (104 . |variables|) (109 . =)
              (|SparseUnivariatePolynomial| $) (115 . |univariate|)
              (|SparseUnivariatePolynomial| 9) (121 . |leadingCoefficient|)
              (|Union| $ '"failed") (126 . |exquo|) (|List| 12)
              (|GroebnerPackage| 6 11 12) (132 . |groebner|) (137 . |member?|)
              (143 . |append|) (149 . |ground?|) (154 . |One|) (158 . |One|)
              (|Integer|) (162 . |elt|) (|List| 35) (168 . |concat|) (|List| 9)
              |IDEAL;generators;$L;35| (174 . |One|) (178 . |position|)
              (184 . |delete|) (190 . |#|) (195 . >) (|Mapping| 14 35 35)
              (201 . |sort|) (207 . ~=) (213 . |setDifference|)
              |IDEAL;in?;2$B;12| |IDEAL;=;2$B;10| |IDEAL;groebner;2$;13|
              (|GroebnerPackage| 6 7 9) (219 . |normalForm|)
              |IDEAL;element?;DPoly$B;11| (225 . |zero?|) (230 . |groebner|)
              (235 . |One|) (239 . -) (245 . *) (251 . |concat|)
              |IDEAL;intersect;3$;14| (|List| $) |IDEAL;intersect;L$;15|
              |IDEAL;coerce;L$;31| (|GroebnerInternalPackage| 6 7 9)
              (257 . |minGbasis|) |IDEAL;quotient;$DPoly$;16|
              |IDEAL;ideal;L$;33| |IDEAL;quotient;3$;17| (262 . |concat|)
              |IDEAL;+;3$;18| (268 . *) (274 . |append|) |IDEAL;*;3$;19|
              |IDEAL;^;$Nni$;20| |IDEAL;saturate;$DPoly$;21| (280 . |setUnion|)
              (286 . |monomial|) (293 . |eval|) |IDEAL;saturate;$DPolyL$;22|
              (300 . =) (|Union| 8 '"failed") (306 . |mainVariable|)
              |IDEAL;zeroDim?;$LB;23| |IDEAL;zeroDim?;$B;24|
              (311 . |normalForm|) |IDEAL;inRadical?;DPoly$B;25|
              |IDEAL;leadingIdeal;2$;28| |IDEAL;dimension;$LI;26|
              |IDEAL;dimension;$I;27| (317 . -) (|Polynomial| 6)
              (323 . |coerce|) (|Symbol|) (328 . |convert|) (333 . |monomial|)
              (|List| 110) (|List| 130) (|SuchThat| 115 116)
              (340 . |construct|) (346 . |new|) (|List| 112) (350 . |concat|)
              (|Vector| 21) (356 . |new|) (362 . |setelt!|) (369 . |Zero|)
              (373 . ~=) (|List| 21) (379 . |degree|) (385 . +)
              (|Equation| 110) (391 . |Zero|) (395 . |coerce|) (400 . =)
              (406 . =) (412 . |elt|) (418 . ^) (424 . *) (430 . |One|)
              (434 . *) (440 . |relationsIdeal|) (|OutputForm|)
              (445 . |coerce|) |IDEAL;coerce;$Of;32|
              |IDEAL;groebnerIdeal;L$;34| |IDEAL;groebner?;$B;36|
              |IDEAL;one?;$B;37| |IDEAL;zero?;$B;38|
              (|Record| (|:| |mval| (|Matrix| 6)) (|:| |invmval| (|Matrix| 6))
                        (|:| |genIdeal| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 450 |zeroDim?| 456 |zero?| 467 |saturate| 472 |relationsIdeal|
              485 |quotient| 490 |one?| 502 |leadingIdeal| 507 |latex| 512
              |intersect| 517 |inRadical?| 528 |in?| 534 |ideal| 540
              |hashUpdate!| 545 |hash| 551 |groebnerIdeal| 556 |groebner?| 561
              |groebner| 566 |generators| 571 |generalPosition| 576 |element?|
              582 |dimension| 588 |coerce| 599 |backOldPos| 609 ^ 614 = 620 +
              626 * 632)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 141))
                        (|makeByteWordVec2| 151
                                            '(0 9 0 13 2 9 14 0 0 15 0 12 0 16
                                              1 9 6 0 17 0 6 0 18 0 7 0 19 1 9
                                              7 0 20 2 11 0 21 7 22 2 12 0 6 11
                                              23 1 9 0 0 24 2 12 0 0 0 25 2 12
                                              14 0 0 26 1 12 11 0 27 1 11 21 0
                                              28 2 21 14 0 0 29 1 12 0 0 30 1
                                              12 6 0 31 1 11 7 0 32 2 9 0 6 7
                                              33 2 9 0 0 0 34 1 9 35 0 36 2 35
                                              14 0 0 37 2 9 38 0 8 39 1 40 9 0
                                              41 2 9 42 0 0 43 1 45 44 44 46 2
                                              35 14 8 0 47 2 35 0 0 0 48 1 9 14
                                              0 49 0 6 0 50 0 9 0 51 2 35 8 0
                                              52 53 2 54 0 0 0 55 0 21 0 58 2
                                              35 52 8 0 59 2 35 0 0 52 60 1 35
                                              21 0 61 2 21 14 0 0 62 2 54 0 63
                                              0 64 2 35 14 0 0 65 2 35 0 0 0 66
                                              2 70 9 9 56 71 1 9 14 0 73 1 70
                                              56 56 74 0 12 0 75 2 12 0 0 0 76
                                              2 12 0 0 0 77 2 44 0 0 0 78 1 83
                                              56 56 84 2 56 0 0 0 88 2 9 0 0 0
                                              90 2 56 0 0 0 91 2 35 0 0 0 95 3
                                              9 0 0 8 21 96 3 9 0 0 35 80 97 2
                                              56 14 0 0 99 1 9 100 0 101 2 45
                                              12 12 44 104 2 9 0 0 0 109 1 110
                                              0 6 111 1 8 112 0 113 3 110 0 0
                                              112 21 114 2 117 0 115 116 118 0
                                              112 0 119 2 120 0 0 0 121 2 122 0
                                              21 21 123 3 122 21 0 52 21 124 0
                                              110 0 125 2 9 14 0 0 126 2 9 127
                                              0 35 128 2 110 0 0 0 129 0 130 0
                                              131 1 110 0 112 132 2 130 0 110
                                              110 133 2 7 14 0 0 134 2 122 21 0
                                              52 135 2 110 0 0 21 136 2 110 0 0
                                              0 137 0 110 0 138 2 110 0 6 0 139
                                              1 0 117 56 140 1 56 141 0 142 2 0
                                              14 0 0 1 1 0 14 0 103 2 0 14 0 35
                                              102 1 0 14 0 147 3 0 0 0 9 35 98
                                              2 0 0 0 9 94 1 1 117 56 140 2 0 0
                                              0 9 85 2 0 0 0 0 87 1 0 14 0 146
                                              1 0 0 0 106 1 0 149 0 1 1 0 0 80
                                              81 2 0 0 0 0 79 2 0 14 9 0 105 2
                                              0 14 0 0 67 1 0 0 56 86 2 0 151
                                              151 0 1 1 0 150 0 1 1 0 0 56 144
                                              1 0 14 0 145 1 0 0 0 69 1 0 56 0
                                              57 2 0 148 0 35 1 2 0 14 9 0 72 1
                                              0 52 0 108 2 0 52 0 35 107 1 0 0
                                              56 82 1 0 141 0 143 1 0 0 148 1 2
                                              0 0 0 21 93 2 0 14 0 0 68 2 0 0 0
                                              0 89 2 0 0 0 0 92)))))
           '|lookupComplete|)) 
