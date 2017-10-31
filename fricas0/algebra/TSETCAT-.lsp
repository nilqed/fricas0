
(SDEFUN |TSETCAT-;=;2SB;1| ((|ts| S) (|us| S) ($ |Boolean|))
        (SPROG ((#1=#:G775 NIL) (#2=#:G772 NIL))
               (COND
                ((SPADCALL |ts| (QREFELT $ 12)) (SPADCALL |us| (QREFELT $ 12)))
                ((OR (SPADCALL |us| (QREFELT $ 12))
                     (NULL
                      (SPADCALL
                       (PROG2
                           (LETT #2# (SPADCALL |ts| (QREFELT $ 14))
                                 . #3=(|TSETCAT-;=;2SB;1|))
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (QREFELT $ 10)
                                         (|Union| (QREFELT $ 10) #4="failed")
                                         #2#))
                       (PROG2 (LETT #2# (SPADCALL |us| (QREFELT $ 14)) . #3#)
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (QREFELT $ 10)
                                         (|Union| (QREFELT $ 10) #4#) #2#))
                       (QREFELT $ 15))))
                 NIL)
                ('T
                 (SPADCALL
                  (PROG2 (LETT #1# (SPADCALL |ts| (QREFELT $ 17)) . #3#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #5="failed") #1#))
                  (PROG2 (LETT #1# (SPADCALL |us| (QREFELT $ 17)) . #3#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #5#) #1#))
                  (QREFELT $ 18)))))) 

(SDEFUN |TSETCAT-;infRittWu?;2SB;2| ((|ts| S) (|us| S) ($ |Boolean|))
        (SPROG ((|v| (V)) (|q| (P)) (#1=#:G783 NIL) (|p| (P)))
               (SEQ
                (COND
                 ((SPADCALL |us| (QREFELT $ 12))
                  (NULL (SPADCALL |ts| (QREFELT $ 12))))
                 ((SPADCALL |ts| (QREFELT $ 12)) NIL)
                 (#2='T
                  (SEQ
                   (LETT |p|
                         (PROG2
                             (LETT #1# (SPADCALL |ts| (QREFELT $ 20))
                                   . #3=(|TSETCAT-;infRittWu?;2SB;2|))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                           (|Union| (QREFELT $ 10) #4="failed")
                                           #1#))
                         . #3#)
                   (LETT |q|
                         (PROG2 (LETT #1# (SPADCALL |us| (QREFELT $ 20)) . #3#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                           (|Union| (QREFELT $ 10) #4#) #1#))
                         . #3#)
                   (EXIT
                    (COND ((SPADCALL |p| |q| (QREFELT $ 21)) 'T)
                          ((SPADCALL |p| |q| (QREFELT $ 22)) NIL)
                          (#2#
                           (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 23)) . #3#)
                                (EXIT
                                 (SPADCALL (SPADCALL |ts| |v| (QREFELT $ 24))
                                           (SPADCALL |us| |v| (QREFELT $ 24))
                                           (QREFELT $ 25))))))))))))) 

(SDEFUN |TSETCAT-;reduced?;PSMB;3|
        ((|p| P) (|ts| S) (|redOp?| |Mapping| (|Boolean|) P P) ($ |Boolean|))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (LETT |lp| (SPADCALL |ts| (QREFELT $ 28))
                      . #1=(|TSETCAT-;reduced?;PSMB;3|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |lp|) NIL)
                              ('T (SPADCALL |p| (|SPADfirst| |lp|) |redOp?|))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |lp| (CDR |lp|) . #1#))) NIL (GO G190)
                     G191 (EXIT NIL))
                (EXIT (NULL |lp|))))) 

(SDEFUN |TSETCAT-;basicSet;LMU;4|
        ((|ps| |List| P) (|redOp?| |Mapping| (|Boolean|) P P)
         ($ |Union| (|Record| (|:| |bas| S) (|:| |top| (|List| P))) "failed"))
        (SPROG ((|ts| (|List| P)) (|p| (P)) (|bs| (S)) (|b| (P)))
               (SEQ
                (LETT |ps| (SPADCALL (ELT $ 31) |ps| (QREFELT $ 33))
                      . #1=(|TSETCAT-;basicSet;LMU;4|))
                (EXIT
                 (COND
                  ((SPADCALL (ELT $ 34) |ps| (QREFELT $ 35)) (CONS 1 "failed"))
                  ('T
                   (SEQ
                    (LETT |ps| (SPADCALL (ELT $ 21) |ps| (QREFELT $ 36)) . #1#)
                    (LETT |bs| (SPADCALL (QREFELT $ 37)) . #1#)
                    (LETT |ts| NIL . #1#)
                    (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                         (SEQ (LETT |b| (|SPADfirst| |ps|) . #1#)
                              (LETT |bs| (SPADCALL |bs| |b| (QREFELT $ 38))
                                    . #1#)
                              (LETT |ps| (CDR |ps|) . #1#)
                              (EXIT
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (COND ((NULL |ps|) NIL)
                                             ('T
                                              (NULL
                                               (SPADCALL
                                                (LETT |p| (|SPADfirst| |ps|)
                                                      . #1#)
                                                |bs| |redOp?|
                                                (QREFELT $ 39))))))
                                      (GO G191)))
                                    (SEQ (LETT |ts| (CONS |p| |ts|) . #1#)
                                         (EXIT (LETT |ps| (CDR |ps|) . #1#)))
                                    NIL (GO G190) G191 (EXIT NIL))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 0 (CONS |bs| |ts|)))))))))) 

(SDEFUN |TSETCAT-;basicSet;LMMU;5|
        ((|ps| |List| P) (|pred?| |Mapping| (|Boolean|) P)
         (|redOp?| |Mapping| (|Boolean|) P P)
         ($ |Union| (|Record| (|:| |bas| S) (|:| |top| (|List| P))) "failed"))
        (SPROG
         ((|ts| (|List| P)) (|gps| (|List| P)) (|p| (P)) (|bs| (S)) (|b| (P))
          (|bps| (|List| P)))
         (SEQ
          (LETT |ps| (SPADCALL (ELT $ 31) |ps| (QREFELT $ 33))
                . #1=(|TSETCAT-;basicSet;LMMU;5|))
          (EXIT
           (COND ((SPADCALL (ELT $ 34) |ps| (QREFELT $ 35)) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |gps| NIL . #1#) (LETT |bps| NIL . #1#)
                       (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                            (SEQ (LETT |p| (|SPADfirst| |ps|) . #1#)
                                 (LETT |ps| (CDR |ps|) . #1#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |p| |pred?|)
                                    (LETT |gps| (CONS |p| |gps|) . #1#))
                                   ('T (LETT |bps| (CONS |p| |bps|) . #1#)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |gps| (SPADCALL (ELT $ 21) |gps| (QREFELT $ 36))
                             . #1#)
                       (LETT |bs| (SPADCALL (QREFELT $ 37)) . #1#)
                       (LETT |ts| NIL . #1#)
                       (SEQ G190 (COND ((NULL (NULL (NULL |gps|))) (GO G191)))
                            (SEQ (LETT |b| (|SPADfirst| |gps|) . #1#)
                                 (LETT |bs| (SPADCALL |bs| |b| (QREFELT $ 38))
                                       . #1#)
                                 (LETT |gps| (CDR |gps|) . #1#)
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (COND ((NULL |gps|) NIL)
                                                ('T
                                                 (NULL
                                                  (SPADCALL
                                                   (LETT |p|
                                                         (|SPADfirst| |gps|)
                                                         . #1#)
                                                   |bs| |redOp?|
                                                   (QREFELT $ 39))))))
                                         (GO G191)))
                                       (SEQ (LETT |ts| (CONS |p| |ts|) . #1#)
                                            (EXIT
                                             (LETT |gps| (CDR |gps|) . #1#)))
                                       NIL (GO G190) G191 (EXIT NIL))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |ts|
                             (SPADCALL (ELT $ 21)
                                       (SPADCALL |ts| |bps| (QREFELT $ 43))
                                       (QREFELT $ 36))
                             . #1#)
                       (EXIT (CONS 0 (CONS |bs| |ts|)))))))))) 

(SDEFUN |TSETCAT-;initials;SL;6| ((|ts| S) ($ |List| P))
        (SPROG ((|lp| (|List| P)) (|lip| (|List| P)) (|ip| (P)) (|p| (P)))
               (SEQ (LETT |lip| NIL . #1=(|TSETCAT-;initials;SL;6|))
                    (EXIT
                     (COND ((SPADCALL |ts| (QREFELT $ 12)) |lip|)
                           ('T
                            (SEQ
                             (LETT |lp| (SPADCALL |ts| (QREFELT $ 28)) . #1#)
                             (SEQ G190
                                  (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
                                  (SEQ (LETT |p| (|SPADfirst| |lp|) . #1#)
                                       (COND
                                        ((NULL
                                          (SPADCALL
                                           (LETT |ip|
                                                 (SPADCALL |p| (QREFELT $ 45))
                                                 . #1#)
                                           (QREFELT $ 34)))
                                         (LETT |lip|
                                               (CONS
                                                (SPADCALL |ip| (QREFELT $ 46))
                                                |lip|)
                                               . #1#)))
                                       (EXIT (LETT |lp| (CDR |lp|) . #1#)))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT (SPADCALL |lip| (QREFELT $ 47)))))))))) 

(SDEFUN |TSETCAT-;degree;SNni;7| ((|ts| S) ($ |NonNegativeInteger|))
        (SPROG ((|d| (|NonNegativeInteger|)) (|lp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT $ 12)) 0)
                      ('T
                       (SEQ
                        (LETT |lp| (SPADCALL |ts| (QREFELT $ 28))
                              . #1=(|TSETCAT-;degree;SNni;7|))
                        (LETT |d| (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 50))
                              . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (NULL (NULL (LETT |lp| (CDR |lp|) . #1#))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |d|
                                     (* |d|
                                        (SPADCALL (|SPADfirst| |lp|)
                                                  (QREFELT $ 50)))
                                     . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |d|))))))) 

(SDEFUN |TSETCAT-;quasiComponent;SR;8|
        ((|ts| S)
         ($ |Record| (|:| |close| (|List| P)) (|:| |open| (|List| P))))
        (CONS (SPADCALL |ts| (QREFELT $ 28)) (SPADCALL |ts| (QREFELT $ 52)))) 

(SDEFUN |TSETCAT-;normalized?;PSB;9| ((|p| P) (|ts| S) ($ |Boolean|))
        (SPADCALL |p| (SPADCALL |ts| (QREFELT $ 28)) (QREFELT $ 56))) 

(SDEFUN |TSETCAT-;stronglyReduced?;PSB;10| ((|p| P) (|ts| S) ($ |Boolean|))
        (SPADCALL |p| (SPADCALL |ts| (QREFELT $ 28)) (QREFELT $ 58))) 

(SDEFUN |TSETCAT-;headReduced?;PSB;11| ((|p| P) (|ts| S) ($ |Boolean|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 60)) |ts| (QREFELT $ 61))) 

(SDEFUN |TSETCAT-;initiallyReduced?;PSB;12| ((|p| P) (|ts| S) ($ |Boolean|))
        (SPROG ((|red| (|Boolean|)) (|lp| (|List| P)))
               (SEQ
                (LETT |lp| (SPADCALL |ts| (QREFELT $ 28))
                      . #1=(|TSETCAT-;initiallyReduced?;PSB;12|))
                (LETT |red| 'T . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((OR (NULL |lp|) (SPADCALL |p| (QREFELT $ 34))) NIL)
                         ('T |red|)))
                       (GO G191)))
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((NULL |lp|) NIL)
                                    ('T
                                     (SPADCALL
                                      (SPADCALL (|SPADfirst| |lp|)
                                                (QREFELT $ 23))
                                      (SPADCALL |p| (QREFELT $ 23))
                                      (QREFELT $ 63)))))
                             (GO G191)))
                           (SEQ (EXIT (LETT |lp| (CDR |lp|) . #1#))) NIL
                           (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL (NULL |lp|))
                         (COND
                          ((SPADCALL
                            (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 23))
                            (SPADCALL |p| (QREFELT $ 23)) (QREFELT $ 64))
                           (COND
                            ((SPADCALL |p| (|SPADfirst| |lp|) (QREFELT $ 65))
                             (SEQ (LETT |lp| (CDR |lp|) . #1#)
                                  (EXIT
                                   (LETT |p| (SPADCALL |p| (QREFELT $ 45))
                                         . #1#))))
                            ('T (LETT |red| NIL . #1#))))
                          ('T
                           (LETT |p| (SPADCALL |p| (QREFELT $ 45)) . #1#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |red|)))) 

(SDEFUN |TSETCAT-;reduce;PSMMP;13|
        ((|p| P) (|ts| S) (|redOp| |Mapping| P P P)
         (|redOp?| |Mapping| (|Boolean|) P P) ($ P))
        (SPROG ((#1=#:G898 NIL) (|reductor| (P)) (#2=#:G895 NIL) (|ts0| (S)))
               (SEQ
                (COND
                 ((OR (SPADCALL |ts| (QREFELT $ 12))
                      (SPADCALL |p| (QREFELT $ 34)))
                  |p|)
                 ('T
                  (SEQ (LETT |ts0| |ts| . #3=(|TSETCAT-;reduce;PSMMP;13|))
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((SPADCALL |ts| (QREFELT $ 12)) NIL)
                                     ('T
                                      (NULL (SPADCALL |p| (QREFELT $ 34))))))
                              (GO G191)))
                            (SEQ
                             (LETT |reductor|
                                   (PROG2
                                       (LETT #2# (SPADCALL |ts| (QREFELT $ 14))
                                             . #3#)
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (QREFELT $ 10)
                                                     (|Union| (QREFELT $ 10)
                                                              "failed")
                                                     #2#))
                                   . #3#)
                             (LETT |ts|
                                   (PROG2
                                       (LETT #1# (SPADCALL |ts| (QREFELT $ 17))
                                             . #3#)
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              "failed")
                                                     #1#))
                                   . #3#)
                             (EXIT
                              (COND
                               ((NULL (SPADCALL |p| |reductor| |redOp?|))
                                (SEQ
                                 (LETT |p| (SPADCALL |p| |reductor| |redOp|)
                                       . #3#)
                                 (EXIT (LETT |ts| |ts0| . #3#)))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |p|))))))) 

(SDEFUN |TSETCAT-;rewriteSetWithReduction;LSMML;14|
        ((|lp| |List| P) (|ts| S) (|redOp| |Mapping| P P P)
         (|redOp?| |Mapping| (|Boolean|) P P) ($ |List| P))
        (SPROG ((|rs| (|List| P)) (|p| (P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT $ 69)) |lp|)
                      (#1='T
                       (SEQ
                        (LETT |lp| (SPADCALL (ELT $ 31) |lp| (QREFELT $ 33))
                              . #2=(|TSETCAT-;rewriteSetWithReduction;LSMML;14|))
                        (EXIT
                         (COND ((NULL |lp|) |lp|)
                               ((SPADCALL (ELT $ 34) |lp| (QREFELT $ 35))
                                (LIST (|spadConstant| $ 70)))
                               (#1#
                                (SEQ (LETT |rs| NIL . #2#)
                                     (SEQ G190
                                          (COND
                                           ((NULL (NULL (NULL |lp|)))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |p| (|SPADfirst| |lp|) . #2#)
                                           (LETT |lp| (CDR |lp|) . #2#)
                                           (LETT |p|
                                                 (SPADCALL
                                                  (SPADCALL |p| |ts| |redOp|
                                                            |redOp?|
                                                            (QREFELT $ 71))
                                                  (QREFELT $ 46))
                                                 . #2#)
                                           (EXIT
                                            (COND
                                             ((NULL
                                               (SPADCALL |p| (QREFELT $ 31)))
                                              (COND
                                               ((SPADCALL |p| (QREFELT $ 34))
                                                (SEQ (LETT |lp| NIL . #2#)
                                                     (EXIT
                                                      (LETT |rs|
                                                            (LIST
                                                             (|spadConstant| $
                                                                             70))
                                                            . #2#))))
                                               ('T
                                                (LETT |rs| (CONS |p| |rs|)
                                                      . #2#)))))))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SPADCALL |rs| (QREFELT $ 47))))))))))))) 

(SDEFUN |TSETCAT-;stronglyReduce;PSP;15| ((|p| P) (|ts| S) ($ P))
        (SPADCALL |p| |ts| (ELT $ 73) (ELT $ 65) (QREFELT $ 71))) 

(SDEFUN |TSETCAT-;headReduce;PSP;16| ((|p| P) (|ts| S) ($ P))
        (SPADCALL |p| |ts| (ELT $ 75) (ELT $ 76) (QREFELT $ 71))) 

(SDEFUN |TSETCAT-;initiallyReduce;PSP;17| ((|p| P) (|ts| S) ($ P))
        (SPADCALL |p| |ts| (ELT $ 78) (ELT $ 79) (QREFELT $ 71))) 

(SDEFUN |TSETCAT-;removeZero;PSP;18| ((|p| P) (|ts| S) ($ P))
        (SPROG
         ((|q| (P)) (#1=#:G952 NIL) (#2=#:G942 NIL) (|ts_v-| (S)) (|v| (V)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |p| (QREFELT $ 34)) (SPADCALL |ts| (QREFELT $ 12)))
             |p|)
            ('T
             (SEQ
              (LETT |v| (SPADCALL |p| (QREFELT $ 23))
                    . #3=(|TSETCAT-;removeZero;PSP;18|))
              (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 81)) . #3#)
              (COND
               ((SPADCALL |v| |ts| (QREFELT $ 82))
                (SEQ
                 (LETT |q|
                       (SPADCALL |p|
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL |ts| |v| (QREFELT $ 83))
                                           . #3#)
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0)
                                                   (QREFELT $ 10)
                                                   (|Union| (QREFELT $ 10)
                                                            "failed")
                                                   #2#))
                                 (QREFELT $ 73))
                       . #3#)
                 (EXIT
                  (COND
                   ((SPADCALL |q| (QREFELT $ 31))
                    (PROGN (LETT #1# |q| . #3#) (GO #4=#:G951)))
                   ((SPADCALL (SPADCALL |q| |ts_v-| (QREFELT $ 84))
                              (QREFELT $ 31))
                    (PROGN
                     (LETT #1# (|spadConstant| $ 85) . #3#)
                     (GO #4#))))))))
              (EXIT
               (COND ((SPADCALL |ts_v-| (QREFELT $ 12)) |p|)
                     ('T
                      (SEQ (LETT |q| (|spadConstant| $ 85) . #3#)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (SPADCALL (SPADCALL |p| |v| (QREFELT $ 86))
                                             (QREFELT $ 88)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |q|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |p| (QREFELT $ 45)) |ts_v-|
                                          (QREFELT $ 84))
                                         (SPADCALL |p| (QREFELT $ 89))
                                         (QREFELT $ 90))
                                        |q| (QREFELT $ 91))
                                       . #3#)
                                 (EXIT
                                  (LETT |p| (SPADCALL |p| (QREFELT $ 92))
                                        . #3#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL |q| (SPADCALL |p| |ts_v-| (QREFELT $ 84))
                                      (QREFELT $ 91)))))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |TSETCAT-;reduceByQuasiMonic;PSP;19| ((|p| P) (|ts| S) ($ P))
        (COND
         ((OR (SPADCALL |p| (QREFELT $ 34)) (SPADCALL |ts| (QREFELT $ 12)))
          |p|)
         ('T
          (QVELT (SPADCALL |p| (SPADCALL |ts| (QREFELT $ 94)) (QREFELT $ 96))
                 1)))) 

(SDEFUN |TSETCAT-;autoReduced?;SMB;20|
        ((|ts| S) (|redOp?| |Mapping| (|Boolean|) P (|List| P)) ($ |Boolean|))
        (SPROG ((|lp| (|List| P)) (|p| (P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT $ 12)) 'T)
                      ('T
                       (SEQ
                        (LETT |lp| (SPADCALL |ts| (QREFELT $ 28))
                              . #1=(|TSETCAT-;autoReduced?;SMB;20|))
                        (LETT |p| (|SPADfirst| |lp|) . #1#)
                        (LETT |lp| (CDR |lp|) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |lp|) NIL)
                                      ('T (SPADCALL |p| |lp| |redOp?|))))
                               (GO G191)))
                             (SEQ (LETT |p| (|SPADfirst| |lp|) . #1#)
                                  (EXIT (LETT |lp| (CDR |lp|) . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (NULL |lp|)))))))) 

(SDEFUN |TSETCAT-;stronglyReduced?;SB;21| ((|ts| S) ($ |Boolean|))
        (SPADCALL |ts| (ELT $ 58) (QREFELT $ 100))) 

(SDEFUN |TSETCAT-;normalized?;SB;22| ((|ts| S) ($ |Boolean|))
        (SPADCALL |ts| (ELT $ 56) (QREFELT $ 100))) 

(SDEFUN |TSETCAT-;headReduced?;SB;23| ((|ts| S) ($ |Boolean|))
        (SPADCALL |ts| (ELT $ 103) (QREFELT $ 100))) 

(SDEFUN |TSETCAT-;initiallyReduced?;SB;24| ((|ts| S) ($ |Boolean|))
        (SPADCALL |ts| (ELT $ 105) (QREFELT $ 100))) 

(SDEFUN |TSETCAT-;mvar;SV;25| ((|ts| S) ($ V))
        (SPROG ((#1=#:G978 NIL))
               (COND
                ((SPADCALL |ts| (QREFELT $ 12))
                 (|error| "Error from TSETCAT in mvar : #1 is empty"))
                ('T
                 (SPADCALL
                  (PROG2
                      (LETT #1# (SPADCALL |ts| (QREFELT $ 14))
                            |TSETCAT-;mvar;SV;25|)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                    (|Union| (QREFELT $ 10) "failed") #1#))
                  (QREFELT $ 23)))))) 

(SDEFUN |TSETCAT-;first;SU;26| ((|ts| S) ($ |Union| P "failed"))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT $ 12)) (CONS 1 "failed"))
                      ('T
                       (SEQ
                        (LETT |lp|
                              (SPADCALL (ELT $ 22)
                                        (SPADCALL |ts| (QREFELT $ 28))
                                        (QREFELT $ 36))
                              |TSETCAT-;first;SU;26|)
                        (EXIT (CONS 0 (|SPADfirst| |lp|))))))))) 

(SDEFUN |TSETCAT-;last;SU;27| ((|ts| S) ($ |Union| P "failed"))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT $ 12)) (CONS 1 "failed"))
                      ('T
                       (SEQ
                        (LETT |lp|
                              (SPADCALL (ELT $ 21)
                                        (SPADCALL |ts| (QREFELT $ 28))
                                        (QREFELT $ 36))
                              |TSETCAT-;last;SU;27|)
                        (EXIT (CONS 0 (|SPADfirst| |lp|))))))))) 

(SDEFUN |TSETCAT-;rest;SU;28| ((|ts| S) ($ |Union| S "failed"))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT $ 12)) (CONS 1 "failed"))
                      ('T
                       (SEQ
                        (LETT |lp|
                              (SPADCALL (ELT $ 22)
                                        (SPADCALL |ts| (QREFELT $ 28))
                                        (QREFELT $ 36))
                              |TSETCAT-;rest;SU;28|)
                        (EXIT
                         (CONS 0 (SPADCALL (CDR |lp|) (QREFELT $ 110)))))))))) 

(SDEFUN |TSETCAT-;coerce;SL;29| ((|ts| S) ($ |List| P))
        (SPADCALL (ELT $ 22) (SPADCALL |ts| (QREFELT $ 28)) (QREFELT $ 36))) 

(SDEFUN |TSETCAT-;algebraicVariables;SL;30| ((|ts| S) ($ |List| V))
        (SPROG ((#1=#:G1012 NIL) (|p| NIL) (#2=#:G1011 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|TSETCAT-;algebraicVariables;SL;30|))
                 (SEQ (LETT |p| NIL . #3#)
                      (LETT #1# (SPADCALL |ts| (QREFELT $ 28)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 23)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |TSETCAT-;algebraic?;VSB;31| ((|v| V) (|ts| S) ($ |Boolean|))
        (SPADCALL |v| (SPADCALL |ts| (QREFELT $ 115)) (QREFELT $ 116))) 

(SDEFUN |TSETCAT-;select;SVU;32| ((|ts| S) (|v| V) ($ |Union| P "failed"))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (LETT |lp|
                      (SPADCALL (ELT $ 22) (SPADCALL |ts| (QREFELT $ 28))
                                (QREFELT $ 36))
                      . #1=(|TSETCAT-;select;SVU;32|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |lp|) NIL)
                              ('T
                               (NULL
                                (SPADCALL |v|
                                          (SPADCALL (|SPADfirst| |lp|)
                                                    (QREFELT $ 23))
                                          (QREFELT $ 64))))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |lp| (CDR |lp|) . #1#))) NIL (GO G190)
                     G191 (EXIT NIL))
                (EXIT
                 (COND ((NULL |lp|) (CONS 1 "failed"))
                       ('T (CONS 0 (|SPADfirst| |lp|)))))))) 

(SDEFUN |TSETCAT-;collectQuasiMonic;2S;33| ((|ts| S) ($ S))
        (SPROG ((|lp| (|List| P)) (|newlp| (|List| P)))
               (SEQ
                (LETT |lp| (SPADCALL |ts| (QREFELT $ 28))
                      . #1=(|TSETCAT-;collectQuasiMonic;2S;33|))
                (LETT |newlp| NIL . #1#)
                (SEQ G190 (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 45))
                                  (QREFELT $ 34))
                        (LETT |newlp| (CONS (|SPADfirst| |lp|) |newlp|)
                              . #1#)))
                      (EXIT (LETT |lp| (CDR |lp|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |newlp| (QREFELT $ 110)))))) 

(SDEFUN |TSETCAT-;collectUnder;SVS;34| ((|ts| S) (|v| V) ($ S))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (LETT |lp|
                      (SPADCALL (ELT $ 22) (SPADCALL |ts| (QREFELT $ 28))
                                (QREFELT $ 36))
                      . #1=(|TSETCAT-;collectUnder;SVS;34|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |lp|) NIL)
                              ('T
                               (NULL
                                (SPADCALL |v|
                                          (SPADCALL (|SPADfirst| |lp|)
                                                    (QREFELT $ 23))
                                          (QREFELT $ 63))))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |lp| (CDR |lp|) . #1#))) NIL (GO G190)
                     G191 (EXIT NIL))
                (EXIT (SPADCALL |lp| (QREFELT $ 110)))))) 

(SDEFUN |TSETCAT-;collectUpper;SVS;35| ((|ts| S) (|v| V) ($ S))
        (SPROG ((|lp1| (|List| P)) (|lp2| (|List| P)))
               (SEQ
                (LETT |lp1|
                      (SPADCALL (ELT $ 22) (SPADCALL |ts| (QREFELT $ 28))
                                (QREFELT $ 36))
                      . #1=(|TSETCAT-;collectUpper;SVS;35|))
                (LETT |lp2| NIL . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |lp1|) NIL)
                              ('T
                               (SPADCALL
                                (SPADCALL (|SPADfirst| |lp1|) (QREFELT $ 23))
                                |v| (QREFELT $ 63)))))
                       (GO G191)))
                     (SEQ (LETT |lp2| (CONS (|SPADfirst| |lp1|) |lp2|) . #1#)
                          (EXIT (LETT |lp1| (CDR |lp1|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL (REVERSE |lp2|) (QREFELT $ 110)))))) 

(SDEFUN |TSETCAT-;construct;LS;36| ((|lp| |List| P) ($ S))
        (SPROG ((|rif| (|Union| S "failed")))
               (SEQ
                (LETT |rif| (SPADCALL |lp| (QREFELT $ 122))
                      |TSETCAT-;construct;LS;36|)
                (EXIT
                 (COND ((QEQCAR |rif| 0) (QCDR |rif|))
                       ('T
                        (|error|
                         "in construct : LP -> % from TSETCAT : bad arg"))))))) 

(SDEFUN |TSETCAT-;retractIfCan;LU;37|
        ((|lp| |List| P) ($ |Union| S #1="failed"))
        (SPROG ((|rif| (|Union| S #1#)))
               (SEQ
                (COND ((NULL |lp|) (CONS 0 (SPADCALL (QREFELT $ 37))))
                      (#2='T
                       (SEQ
                        (LETT |lp| (SPADCALL (ELT $ 22) |lp| (QREFELT $ 36))
                              . #3=(|TSETCAT-;retractIfCan;LU;37|))
                        (LETT |rif| (SPADCALL (CDR |lp|) (QREFELT $ 122))
                              . #3#)
                        (EXIT
                         (COND
                          ((QEQCAR |rif| 0)
                           (SPADCALL (QCDR |rif|) (|SPADfirst| |lp|)
                                     (QREFELT $ 124)))
                          (#2#
                           (|error|
                            "in retractIfCan : LP -> ... from TSETCAT : bad arg")))))))))) 

(SDEFUN |TSETCAT-;extend;SPS;38| ((|ts| S) (|p| P) ($ S))
        (SPROG ((|eif| (|Union| S "failed")))
               (SEQ
                (LETT |eif| (SPADCALL |ts| |p| (QREFELT $ 124))
                      |TSETCAT-;extend;SPS;38|)
                (EXIT
                 (COND ((QEQCAR |eif| 0) (QCDR |eif|))
                       ('T
                        (|error|
                         "in extend : (%, P) -> % from TSETCAT : bad args"))))))) 

(SDEFUN |TSETCAT-;coHeight;SNni;39| ((|ts| S) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G1063 NIL) (|m| (|NonNegativeInteger|))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL (QREFELT $ 127))
                . #2=(|TSETCAT-;coHeight;SNni;39|))
          (LETT |m| (LENGTH (SPADCALL |ts| (QREFELT $ 28))) . #2#)
          (EXIT
           (PROG2 (LETT #1# (SPADCALL |n| |m| (QREFELT $ 128)) . #2#)
               (QCDR #1#)
             (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                             (|Union| (|NonNegativeInteger|) "failed") #1#)))))) 

(DECLAIM (NOTINLINE |TriangularSetCategory&;|)) 

(DEFUN |TriangularSetCategory&| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|TriangularSetCategory&|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|TriangularSetCategory&| DV$1 DV$2 DV$3 DV$4 DV$5)
          . #1#)
    (LETT $ (GETREFV 131) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#4| '(|Finite|))))
                    . #1#))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 129
                (CONS (|dispatchFunction| |TSETCAT-;coHeight;SNni;39|) $))))
    $))) 

(MAKEPROP '|TriangularSetCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Boolean|)
              (0 . |empty?|) (|Union| 10 '"failed") (5 . |first|) (10 . =)
              (|Union| $ '"failed") (16 . |rest|) (21 . =) |TSETCAT-;=;2SB;1|
              (27 . |last|) (32 . |infRittWu?|) (38 . |supRittWu?|)
              (44 . |mvar|) (49 . |collectUpper|) (55 . |infRittWu?|)
              |TSETCAT-;infRittWu?;2SB;2| (|List| 10) (61 . |members|)
              (|Mapping| 11 10 10) |TSETCAT-;reduced?;PSMB;3| (66 . |zero?|)
              (|Mapping| 11 10) (71 . |remove|) (77 . |ground?|) (82 . |any?|)
              (88 . |sort|) (94 . |empty|) (98 . |extend|) (104 . |reduced?|)
              (|Record| (|:| |bas| $) (|:| |top| 27)) (|Union| 40 '"failed")
              |TSETCAT-;basicSet;LMU;4| (111 . |concat|)
              |TSETCAT-;basicSet;LMMU;5| (117 . |init|)
              (122 . |primPartElseUnitCanonical|) (127 . |removeDuplicates|)
              |TSETCAT-;initials;SL;6| (|NonNegativeInteger|) (132 . |mdeg|)
              |TSETCAT-;degree;SNni;7| (137 . |initials|)
              (|Record| (|:| |close| 27) (|:| |open| 27))
              |TSETCAT-;quasiComponent;SR;8| (|List| $) (142 . |normalized?|)
              |TSETCAT-;normalized?;PSB;9| (148 . |reduced?|)
              |TSETCAT-;stronglyReduced?;PSB;10| (154 . |head|)
              (159 . |stronglyReduced?|) |TSETCAT-;headReduced?;PSB;11|
              (165 . >) (171 . =) (177 . |reduced?|)
              |TSETCAT-;initiallyReduced?;PSB;12| (|Mapping| 10 10 10)
              |TSETCAT-;reduce;PSMMP;13| (183 . |trivialIdeal?|) (188 . |One|)
              (192 . |reduce|) |TSETCAT-;rewriteSetWithReduction;LSMML;14|
              (200 . |lazyPrem|) |TSETCAT-;stronglyReduce;PSP;15|
              (206 . |headReduce|) (212 . |headReduced?|)
              |TSETCAT-;headReduce;PSP;16| (218 . |initiallyReduce|)
              (224 . |initiallyReduced?|) |TSETCAT-;initiallyReduce;PSP;17|
              (230 . |collectUnder|) (236 . |algebraic?|) (242 . |select|)
              (248 . |removeZero|) (254 . |Zero|) (258 . |degree|) (|Integer|)
              (264 . |positive?|) (269 . |mainMonomial|) (274 . *) (280 . +)
              (286 . |tail|) |TSETCAT-;removeZero;PSP;18|
              (291 . |collectQuasiMonic|)
              (|Record| (|:| |rnum| 7) (|:| |polnum| 10) (|:| |den| 7))
              (296 . |remainder|) |TSETCAT-;reduceByQuasiMonic;PSP;19|
              (|Mapping| 11 10 27) |TSETCAT-;autoReduced?;SMB;20|
              (302 . |autoReduced?|) |TSETCAT-;stronglyReduced?;SB;21|
              |TSETCAT-;normalized?;SB;22| (308 . |headReduced?|)
              |TSETCAT-;headReduced?;SB;23| (314 . |initiallyReduced?|)
              |TSETCAT-;initiallyReduced?;SB;24| |TSETCAT-;mvar;SV;25|
              |TSETCAT-;first;SU;26| |TSETCAT-;last;SU;27| (320 . |construct|)
              |TSETCAT-;rest;SU;28| |TSETCAT-;coerce;SL;29| (|List| 9)
              |TSETCAT-;algebraicVariables;SL;30| (325 . |algebraicVariables|)
              (330 . |member?|) |TSETCAT-;algebraic?;VSB;31|
              |TSETCAT-;select;SVU;32| |TSETCAT-;collectQuasiMonic;2S;33|
              |TSETCAT-;collectUnder;SVS;34| |TSETCAT-;collectUpper;SVS;35|
              (336 . |retractIfCan|) |TSETCAT-;construct;LS;36|
              (341 . |extendIfCan|) |TSETCAT-;retractIfCan;LU;37|
              |TSETCAT-;extend;SPS;38| (347 . |size|) (351 . |subtractIfCan|)
              (357 . |coHeight|) (|OutputForm|))
           '#(|stronglyReduced?| 362 |stronglyReduce| 373 |select| 379
              |rewriteSetWithReduction| 385 |retractIfCan| 393 |rest| 398
              |removeZero| 403 |reduced?| 409 |reduceByQuasiMonic| 416 |reduce|
              422 |quasiComponent| 430 |normalized?| 435 |mvar| 446 |last| 451
              |initials| 456 |initiallyReduced?| 461 |initiallyReduce| 472
              |infRittWu?| 478 |headReduced?| 484 |headReduce| 495 |first| 501
              |extend| 506 |degree| 512 |construct| 517 |collectUpper| 522
              |collectUnder| 528 |collectQuasiMonic| 534 |coerce| 539
              |coHeight| 549 |basicSet| 554 |autoReduced?| 567
              |algebraicVariables| 573 |algebraic?| 578 = 584)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 129
                                                 '(1 6 11 0 12 1 6 13 0 14 2 10
                                                   11 0 0 15 1 6 16 0 17 2 6 11
                                                   0 0 18 1 6 13 0 20 2 10 11 0
                                                   0 21 2 10 11 0 0 22 1 10 9 0
                                                   23 2 6 0 0 9 24 2 6 11 0 0
                                                   25 1 6 27 0 28 1 10 11 0 31
                                                   2 27 0 32 0 33 1 10 11 0 34
                                                   2 27 11 32 0 35 2 27 0 29 0
                                                   36 0 6 0 37 2 6 0 0 10 38 3
                                                   6 11 10 0 29 39 2 27 0 0 0
                                                   43 1 10 0 0 45 1 10 0 0 46 1
                                                   27 0 0 47 1 10 49 0 50 1 6
                                                   27 0 52 2 10 11 0 55 56 2 10
                                                   11 0 55 58 1 10 0 0 60 2 6
                                                   11 10 0 61 2 9 11 0 0 63 2 9
                                                   11 0 0 64 2 10 11 0 0 65 1 6
                                                   11 0 69 0 10 0 70 4 6 10 10
                                                   0 67 29 71 2 10 0 0 0 73 2
                                                   10 0 0 0 75 2 10 11 0 0 76 2
                                                   10 0 0 0 78 2 10 11 0 0 79 2
                                                   6 0 0 9 81 2 6 11 9 0 82 2 6
                                                   13 0 9 83 2 6 10 10 0 84 0
                                                   10 0 85 2 10 49 0 9 86 1 87
                                                   11 0 88 1 10 0 0 89 2 10 0 0
                                                   0 90 2 10 0 0 0 91 1 10 0 0
                                                   92 1 6 0 0 94 2 6 95 10 0 96
                                                   2 6 11 0 98 100 2 10 11 0 55
                                                   103 2 10 11 0 55 105 1 6 0
                                                   27 110 1 6 113 0 115 2 113
                                                   11 9 0 116 1 6 16 27 122 2 6
                                                   16 0 10 124 0 9 49 127 2 49
                                                   16 0 0 128 1 0 49 0 129 1 0
                                                   11 0 101 2 0 11 10 0 59 2 0
                                                   10 10 0 74 2 0 13 0 9 118 4
                                                   0 27 27 0 67 29 72 1 0 16 27
                                                   125 1 0 16 0 111 2 0 10 10 0
                                                   93 3 0 11 10 0 29 30 2 0 10
                                                   10 0 97 4 0 10 10 0 67 29 68
                                                   1 0 53 0 54 1 0 11 0 102 2 0
                                                   11 10 0 57 1 0 9 0 107 1 0
                                                   13 0 109 1 0 27 0 48 1 0 11
                                                   0 106 2 0 11 10 0 66 2 0 10
                                                   10 0 80 2 0 11 0 0 26 1 0 11
                                                   0 104 2 0 11 10 0 62 2 0 10
                                                   10 0 77 1 0 13 0 108 2 0 0 0
                                                   10 126 1 0 49 0 51 1 0 0 27
                                                   123 2 0 0 0 9 121 2 0 0 0 9
                                                   120 1 0 0 0 119 1 0 27 0 112
                                                   1 0 27 0 112 1 0 49 0 129 3
                                                   0 41 27 32 29 44 2 0 41 27
                                                   29 42 2 0 11 0 98 99 1 0 113
                                                   0 114 2 0 11 9 0 117 2 0 11
                                                   0 0 19)))))
           '|lookupComplete|)) 
