
(SDEFUN |RDETRS;monomRDEsys;3FMU;1|
        ((|f| |Fraction| UP) (|g1| |Fraction| UP) (|g2| |Fraction| UP)
         (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|Record| (|:| |a| UP) (|:| |b| (|Fraction| UP)) (|:| |h| UP)
                    (|:| |c1| (|Fraction| UP)) (|:| |c2| (|Fraction| UP))
                    (|:| |t| UP))
          "failed"))
        (SPROG
         ((|u| (|Union| UP #1="failed")) (|aa| (UP)) (|tt| (UP))
          (#2=#:G723 NIL) (|gg| (UP)) (|e| (UP)) (|d| (UP)))
         (SEQ
          (LETT |gg|
                (SPADCALL
                 (LETT |d| (SPADCALL |f| |derivation| (QREFELT $ 11))
                       . #3=(|RDETRS;monomRDEsys;3FMU;1|))
                 (LETT |e|
                       (SPADCALL (SPADCALL |g1| |derivation| (QREFELT $ 11))
                                 (SPADCALL |g2| |derivation| (QREFELT $ 11))
                                 (QREFELT $ 12))
                       . #3#)
                 (QREFELT $ 13))
                . #3#)
          (LETT |tt|
                (PROG2
                    (LETT #2#
                          (SPADCALL
                           (SPADCALL |e| (SPADCALL |e| (QREFELT $ 14))
                                     (QREFELT $ 13))
                           (SPADCALL |gg| (SPADCALL |gg| (QREFELT $ 14))
                                     (QREFELT $ 13))
                           (QREFELT $ 16))
                          . #3#)
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) #1#) #2#))
                . #3#)
          (LETT |u|
                (SPADCALL
                 (SPADCALL |tt|
                           (LETT |aa| (SPADCALL |d| |tt| (QREFELT $ 17)) . #3#)
                           (QREFELT $ 17))
                 |e| (QREFELT $ 16))
                . #3#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (VECTOR |aa|
                                (SPADCALL (SPADCALL |tt| |d| (QREFELT $ 17))
                                          |f| (QREFELT $ 18))
                                (SPADCALL
                                 (SPADCALL |d| (SPADCALL |tt| |derivation|)
                                           (QREFELT $ 17))
                                 (QREFELT $ 19))
                                (SPADCALL
                                 (SPADCALL (QCDR |u|) |e| (QREFELT $ 17)) |g1|
                                 (QREFELT $ 18))
                                (SPADCALL
                                 (SPADCALL (QCDR |u|) |e| (QREFELT $ 17)) |g2|
                                 (QREFELT $ 18))
                                |tt|)))))))) 

(SDEFUN |RDETRS;baseRDEsys;3FU;2|
        ((|f| |Fraction| UP) (|g1| |Fraction| UP) (|g2| |Fraction| UP)
         ($ |Union| (|List| (|Fraction| UP)) "failed"))
        (SPROG
         ((|l| (|List| UP)) (|v| (|Union| (|List| UP) "failed"))
          (|n| (|Integer|)) (|cc2| (UP)) (|cc1| (UP)) (|bb| (UP))
          (|u|
           (|Union|
            (|Record| (|:| |a| UP) (|:| |b| (|Fraction| UP)) (|:| |h| UP)
                      (|:| |c1| (|Fraction| UP)) (|:| |c2| (|Fraction| UP))
                      (|:| |t| UP))
            "failed")))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 24))
            (|error| "baseRDEsys: f must be nonzero"))
           (#1='T
            (SEQ
             (COND
              ((SPADCALL |g1| (QREFELT $ 24))
               (COND
                ((SPADCALL |g2| (QREFELT $ 24))
                 (EXIT
                  (CONS 0
                        (LIST (|spadConstant| $ 25)
                              (|spadConstant| $ 25))))))))
             (LETT |u| (SPADCALL |f| |g1| |g2| (ELT $ 14) (QREFELT $ 22))
                   . #2=(|RDETRS;baseRDEsys;3FU;2|))
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#1#
                     (SEQ
                      (LETT |n|
                            (|RDETRS;getBound| (QVELT (QCDR |u|) 0)
                             (LETT |bb|
                                   (SPADCALL (QVELT (QCDR |u|) 1)
                                             (QREFELT $ 26))
                                   . #2#)
                             (QVELT (QCDR |u|) 2)
                             (LETT |cc1|
                                   (SPADCALL (QVELT (QCDR |u|) 3)
                                             (QREFELT $ 26))
                                   . #2#)
                             (LETT |cc2|
                                   (SPADCALL (QVELT (QCDR |u|) 4)
                                             (QREFELT $ 26))
                                   . #2#)
                             $)
                            . #2#)
                      (LETT |v|
                            (|RDETRS;SPDEsys| (QVELT (QCDR |u|) 0) |bb|
                             (QVELT (QCDR |u|) 2) |cc1| |cc2| |n| (ELT $ 14)
                             (CONS #'|RDETRS;baseRDEsys;3FU;2!0| $) $)
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                             (#1#
                              (SEQ (LETT |l| (QCDR |v|) . #2#)
                                   (EXIT
                                    (CONS 0
                                          (LIST
                                           (SPADCALL (|SPADfirst| |l|)
                                                     (QVELT (QCDR |u|) 5)
                                                     (QREFELT $ 28))
                                           (SPADCALL
                                            (SPADCALL |l| (QREFELT $ 30))
                                            (QVELT (QCDR |u|) 5)
                                            (QREFELT $ 28))))))))))))))))))) 

(SDEFUN |RDETRS;baseRDEsys;3FU;2!0|
        ((|z1| NIL) (|z2| NIL) (|z3| NIL) (|z4| NIL) (|z5| NIL) (|z6| NIL)
         ($ NIL))
        (|RDETRS;DSPDEsys| |z1| (SPADCALL |z2| (QREFELT $ 27))
         (SPADCALL |z3| (QREFELT $ 27)) |z4| |z5| |z6| (ELT $ 14) $)) 

(SDEFUN |RDETRS;diophant|
        ((|a| UP) (|b| UP) (|c| UP) (|d1| UP) (|d2| UP)
         ($ |Union|
          (|Record| (|:| |z1| UP) (|:| |z2| UP) (|:| |r1| UP) (|:| |r2| UP))
          "failed"))
        (SPROG
         ((|qr2| #1=(|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|qr1| #1#) (|v| (|Vector| UP))
          (|u| (|Union| (|Vector| UP) "failed")))
         (SEQ
          (LETT |u|
                (QCAR
                 (SPADCALL
                  (SPADCALL
                   (LIST
                    (LIST |a| (|spadConstant| $ 33) |b|
                          (SPADCALL |c| (QREFELT $ 19)))
                    (LIST (|spadConstant| $ 33) |a| |c| |b|))
                   (QREFELT $ 36))
                  (SPADCALL (LIST |d1| |d2|) (QREFELT $ 38)) (QREFELT $ 42)))
                . #2=(|RDETRS;diophant|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCDR |u|) . #2#)
                       (LETT |qr1|
                             (SPADCALL (SPADCALL |v| 3 (QREFELT $ 44)) |a|
                                       (QREFELT $ 46))
                             . #2#)
                       (LETT |qr2|
                             (SPADCALL (SPADCALL |v| 4 (QREFELT $ 44)) |a|
                                       (QREFELT $ 46))
                             . #2#)
                       (EXIT
                        (CONS 0
                              (VECTOR
                               (SPADCALL
                                (SPADCALL (SPADCALL |v| 1 (QREFELT $ 44))
                                          (SPADCALL |b| (QCAR |qr1|)
                                                    (QREFELT $ 17))
                                          (QREFELT $ 49))
                                (SPADCALL |c| (QCAR |qr2|) (QREFELT $ 17))
                                (QREFELT $ 50))
                               (SPADCALL
                                (SPADCALL (SPADCALL |v| 2 (QREFELT $ 44))
                                          (SPADCALL |c| (QCAR |qr1|)
                                                    (QREFELT $ 17))
                                          (QREFELT $ 49))
                                (SPADCALL |b| (QCAR |qr2|) (QREFELT $ 17))
                                (QREFELT $ 49))
                               (QCDR |qr1|) (QCDR |qr2|))))))))))) 

(SDEFUN |RDETRS;SPDEsys|
        ((|a| UP) (|b| UP) (|h| UP) (|c1| UP) (|c2| UP) (|n| |Integer|)
         (|derivation| |Mapping| UP UP)
         (|degradation| |Mapping| (|Union| (|List| UP) #1="failed") F F F UP UP
          (|Integer|))
         ($ |Union| (|List| UP) #1#))
        (SPROG
         ((#2=#:G818 NIL) (|rh| #3=(|Union| F "failed")) (|rb| #3#) (|ra| (F))
          (|l| (|List| UP)) (|v| (|Union| (|List| UP) #1#))
          (|rec|
           (|Record| (|:| |z1| UP) (|:| |z2| UP) (|:| |r1| UP) (|:| |r2| UP)))
          (|u|
           (|Union|
            (|Record| (|:| |z1| UP) (|:| |z2| UP) (|:| |r1| UP) (|:| |r2| UP))
            "failed"))
          (|da| (|NonNegativeInteger|)) (#4=#:G789 NIL) (#5=#:G819 NIL)
          (|u2| #6=(|Union| UP #7="failed")) (|u1| #6#) (|g| (UP)))
         (SEQ
          (COND
           ((SPADCALL |c1| (QREFELT $ 51))
            (COND
             ((SPADCALL |c2| (QREFELT $ 51))
              (EXIT
               (CONS 0 (LIST (|spadConstant| $ 33) (|spadConstant| $ 33))))))))
          (EXIT
           (COND ((< |n| 0) (CONS 1 "failed"))
                 (#8='T
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |g|
                           (SPADCALL |a| (SPADCALL |b| |h| (QREFELT $ 13))
                                     (QREFELT $ 13))
                           . #9=(|RDETRS;SPDEsys|))
                     (SEQ (LETT |u1| (SPADCALL |c1| |g| (QREFELT $ 16)) . #9#)
                          (EXIT
                           (COND
                            ((QEQCAR |u1| 1)
                             (PROGN
                              (LETT #5# (CONS 1 #10="failed") . #9#)
                              (GO #11=#:G815)))
                            (#8#
                             (SEQ
                              (LETT |u2| (SPADCALL |c2| |g| (QREFELT $ 16))
                                    . #9#)
                              (EXIT
                               (COND
                                ((QEQCAR |u2| 1)
                                 (PROGN
                                  (LETT #5# (CONS 1 #10#) . #9#)
                                  (GO #11#))))))))))
                     (LETT |a|
                           (PROG2
                               (LETT #4# (SPADCALL |a| |g| (QREFELT $ 16))
                                     . #9#)
                               (QCDR #4#)
                             (|check_union2| (QEQCAR #4# 0) (QREFELT $ 7)
                                             (|Union| (QREFELT $ 7) #7#) #4#))
                           . #9#)
                     (LETT |b|
                           (PROG2
                               (LETT #4# (SPADCALL |b| |g| (QREFELT $ 16))
                                     . #9#)
                               (QCDR #4#)
                             (|check_union2| (QEQCAR #4# 0) (QREFELT $ 7)
                                             (|Union| (QREFELT $ 7) #7#) #4#))
                           . #9#)
                     (LETT |h|
                           (PROG2
                               (LETT #4# (SPADCALL |h| |g| (QREFELT $ 16))
                                     . #9#)
                               (QCDR #4#)
                             (|check_union2| (QEQCAR #4# 0) (QREFELT $ 7)
                                             (|Union| (QREFELT $ 7) #7#) #4#))
                           . #9#)
                     (LETT |c1| (QCDR |u1|) . #9#)
                     (LETT |c2| (QCDR |u2|) . #9#)
                     (LETT |da| (SPADCALL |a| (QREFELT $ 54)) . #9#)
                     (EXIT
                      (COND
                       ((SPADCALL |da| 0 (QREFELT $ 55))
                        (SEQ
                         (LETT |u| (|RDETRS;diophant| |a| |h| |b| |c1| |c2| $)
                               . #9#)
                         (EXIT
                          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                (#8#
                                 (SEQ (LETT |rec| (QCDR |u|) . #9#)
                                      (LETT |v|
                                            (|RDETRS;SPDEsys| |a| |b|
                                             (SPADCALL |h|
                                                       (SPADCALL |a|
                                                                 |derivation|)
                                                       (QREFELT $ 49))
                                             (SPADCALL (QVELT |rec| 0)
                                                       (SPADCALL
                                                        (QVELT |rec| 2)
                                                        |derivation|)
                                                       (QREFELT $ 50))
                                             (SPADCALL (QVELT |rec| 1)
                                                       (SPADCALL
                                                        (QVELT |rec| 3)
                                                        |derivation|)
                                                       (QREFELT $ 50))
                                             (- |n| |da|) |derivation|
                                             |degradation| $)
                                            . #9#)
                                      (EXIT
                                       (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                                             (#8#
                                              (SEQ (LETT |l| (QCDR |v|) . #9#)
                                                   (EXIT
                                                    (CONS 0
                                                          (LIST
                                                           (SPADCALL
                                                            (SPADCALL |a|
                                                                      (|SPADfirst|
                                                                       |l|)
                                                                      (QREFELT
                                                                       $ 17))
                                                            (QVELT |rec| 2)
                                                            (QREFELT $ 49))
                                                           (SPADCALL
                                                            (SPADCALL |a|
                                                                      (SPADCALL
                                                                       |l|
                                                                       (QREFELT
                                                                        $ 30))
                                                                      (QREFELT
                                                                       $ 17))
                                                            (QVELT |rec| 3)
                                                            (QREFELT $
                                                                     49)))))))))))))))
                       (#8#
                        (SEQ
                         (EXIT
                          (SEQ (LETT |ra| (SPADCALL |a| (QREFELT $ 56)) . #9#)
                               (SEQ
                                (LETT |rb| (SPADCALL |b| (QREFELT $ 58)) . #9#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |rb| 1)
                                   (PROGN
                                    (LETT #2#
                                          (|RDETRS;DSPDEsys| |ra| |b| |h| |c1|
                                           |c2| |n| |derivation| $)
                                          . #9#)
                                    (GO #12=#:G814)))
                                  (#8#
                                   (SEQ
                                    (LETT |rh| (SPADCALL |h| (QREFELT $ 58))
                                          . #9#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |rh| 1)
                                       (PROGN
                                        (LETT #2#
                                              (|RDETRS;DSPDEsys| |ra| |b| |h|
                                               |c1| |c2| |n| |derivation| $)
                                              . #9#)
                                        (GO #12#))))))))))
                               (EXIT
                                (SPADCALL |ra| (QCDR |rb|) (QCDR |rh|) |c1|
                                          |c2| |n| |degradation|))))
                         #12# (EXIT #2#)))))))
                   #11# (EXIT #5#)))))))) 

(SDEFUN |RDETRS;DSPDEsys|
        ((|a| F) (|b| UP) (|h| UP) (|c1| UP) (|c2| UP) (|n| |Integer|)
         (|derivation| |Mapping| UP UP) ($ |Union| (|List| UP) "failed"))
        (SPROG
         ((|det| (F)) (|lh| (F)) (|lb| (F)) (|hh| (|Integer|))
          (|bb| (|Integer|)))
         (SEQ
          (LETT |bb| (SPADCALL |b| (QREFELT $ 54)) . #1=(|RDETRS;DSPDEsys|))
          (LETT |hh|
                (COND ((SPADCALL |h| (QREFELT $ 51)) 0)
                      (#2='T (SPADCALL |h| (QREFELT $ 54))))
                . #1#)
          (LETT |lb| (SPADCALL |b| (QREFELT $ 59)) . #1#)
          (LETT |lh| (SPADCALL |h| (QREFELT $ 59)) . #1#)
          (EXIT
           (COND
            ((< |bb| |hh|)
             (|RDETRS;DSPDEsys0| |a| |b| |h| |c1| |c2| |lb| |lh| |n|
              |derivation| (CONS #'|RDETRS;DSPDEsys!0| (VECTOR $ |hh|)) $))
            ((SPADCALL |bb| |hh| (QREFELT $ 60))
             (|RDETRS;DSPDEsys0| |a| |b| |h| |c1| |c2| |lb| |lh| |n|
              |derivation| (CONS #'|RDETRS;DSPDEsys!1| (VECTOR $ |bb|)) $))
            (#2#
             (SEQ
              (LETT |det|
                    (SPADCALL (SPADCALL |lb| |lb| (QREFELT $ 61))
                              (SPADCALL |lh| |lh| (QREFELT $ 61))
                              (QREFELT $ 62))
                    . #1#)
              (EXIT
               (|RDETRS;DSPDEsys0| |a| |b| |h| |c1| |c2| |lb| |lh| |n|
                |derivation| (CONS #'|RDETRS;DSPDEsys!2| (VECTOR $ |det| |bb|))
                $))))))))) 

(SDEFUN |RDETRS;DSPDEsys!2|
        ((|z1| NIL) (|z2| NIL) (|z3| NIL) (|z4| NIL) (|z5| NIL) ($$ NIL))
        (PROG (|bb| |det| $)
          (LETT |bb| (QREFELT $$ 2) . #1=(|RDETRS;DSPDEsys|))
          (LETT |det| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|RDETRS;DSPDEmix| |z1| |z2| |z3| |z4| |z5| |bb| |det| $))))) 

(SDEFUN |RDETRS;DSPDEsys!1|
        ((|z1| NIL) (|z2| NIL) (|z3| NIL) (|z4| NIL) (|z5| NIL) ($$ NIL))
        (PROG (|bb| $)
          (LETT |bb| (QREFELT $$ 1) . #1=(|RDETRS;DSPDEsys|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|RDETRS;DSPDEbdom| |z1| |z2| |z3| |z4| |z5| |bb| $))))) 

(SDEFUN |RDETRS;DSPDEsys!0|
        ((|z1| NIL) (|z2| NIL) (|z3| NIL) (|z4| NIL) (|z5| NIL) ($$ NIL))
        (PROG (|hh| $)
          (LETT |hh| (QREFELT $$ 1) . #1=(|RDETRS;DSPDEsys|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|RDETRS;DSPDEhdom| |z1| |z2| |z3| |z4| |z5| |hh| $))))) 

(SDEFUN |RDETRS;DSPDEsys0|
        ((|a| F) (|b| UP) (|h| UP) (|c1| UP) (|c2| UP) (|lb| F) (|lh| F)
         (|n| |Integer|) (|derivation| |Mapping| UP UP)
         (|getlc| |Mapping| #1=(|Union| (|List| UP) #2="failed") UP UP F F
          (|NonNegativeInteger|))
         ($ |Union| (|List| UP) #2#))
        (SPROG
         ((|ans2| (UP)) (|ans1| (UP)) (|q2| (UP)) (|q1| (UP))
          (|lq| (|List| UP)) (#3=#:G844 NIL) (#4=#:G845 NIL) (|u| #1#)
          (#5=#:G838 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans1|
                  (LETT |ans2| (|spadConstant| $ 33) . #6=(|RDETRS;DSPDEsys0|))
                  . #6#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |c1| (QREFELT $ 51))
                       (COND
                        ((SPADCALL |c2| (QREFELT $ 51))
                         (EXIT
                          (PROGN
                           (LETT #4# (CONS 0 (LIST |ans1| |ans2|)) . #6#)
                           (GO #7=#:G843)))))))
                     (COND
                      ((< |n| 0)
                       (EXIT
                        (PROGN
                         (LETT #4# (CONS 1 #8="failed") . #6#)
                         (GO #7#))))
                      ('T
                       (SEQ
                        (LETT |u|
                              (SPADCALL |c1| |c2| |lb| |lh|
                                        (PROG1 (LETT #5# |n| . #6#)
                                          (|check_subtype2| (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #5#))
                                        |getlc|)
                              . #6#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 1)
                           (PROGN
                            (LETT #3#
                                  (PROGN
                                   (LETT #4# (CONS 1 #8#) . #6#)
                                   (GO #7#))
                                  . #6#)
                            (GO #9=#:G840))))))))
                     (LETT |lq| (QCDR |u|) . #6#)
                     (LETT |q1| (|SPADfirst| |lq|) . #6#)
                     (LETT |q2| (SPADCALL |lq| (QREFELT $ 30)) . #6#)
                     (LETT |c1|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL |c1|
                                       (SPADCALL |a|
                                                 (SPADCALL |q1| |derivation|)
                                                 (QREFELT $ 63))
                                       (QREFELT $ 50))
                             (SPADCALL |h| |q1| (QREFELT $ 17)) (QREFELT $ 50))
                            (SPADCALL |b| |q2| (QREFELT $ 17)) (QREFELT $ 49))
                           . #6#)
                     (LETT |c2|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL |c2|
                                       (SPADCALL |a|
                                                 (SPADCALL |q2| |derivation|)
                                                 (QREFELT $ 63))
                                       (QREFELT $ 50))
                             (SPADCALL |b| |q1| (QREFELT $ 17)) (QREFELT $ 50))
                            (SPADCALL |h| |q2| (QREFELT $ 17)) (QREFELT $ 50))
                           . #6#)
                     (LETT |n| (- |n| 1) . #6#)
                     (LETT |ans1| (SPADCALL |ans1| |q1| (QREFELT $ 49)) . #6#)
                     (EXIT
                      (LETT |ans2| (SPADCALL |ans2| |q2| (QREFELT $ 49))
                            . #6#))))
                   #9# (EXIT #3#))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #4#)))) 

(SDEFUN |RDETRS;DSPDEmix|
        ((|c1| UP) (|c2| UP) (|lb| F) (|lh| F) (|n| |NonNegativeInteger|)
         (|d| |Integer|) (|det| F) ($ |Union| (|List| UP) "failed"))
        (SPROG
         ((|q2| (F)) (|q1| (F)) (|rh2| (F)) (#1=#:G855 NIL)
          (|d2| #2=(|Integer|)) (|rh1| (F)) (|d1| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rh1|
                  (COND ((SPADCALL |c1| (QREFELT $ 51)) (|spadConstant| $ 52))
                        (#3='T
                         (SEQ
                          (LETT |d1| (- (SPADCALL |c1| (QREFELT $ 54)) |d|)
                                . #4=(|RDETRS;DSPDEmix|))
                          (EXIT
                           (COND ((< |d1| |n|) (|spadConstant| $ 52))
                                 ((SPADCALL |d1| |n| (QREFELT $ 60))
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed") . #4#)
                                   (GO #5=#:G854)))
                                 (#3# (SPADCALL |c1| (QREFELT $ 59))))))))
                  . #4#)
            (LETT |rh2|
                  (COND ((SPADCALL |c2| (QREFELT $ 51)) (|spadConstant| $ 52))
                        (#3#
                         (SEQ
                          (LETT |d2| (- (SPADCALL |c2| (QREFELT $ 54)) |d|)
                                . #4#)
                          (EXIT
                           (COND ((< |d2| |n|) (|spadConstant| $ 52))
                                 ((SPADCALL |d2| |n| (QREFELT $ 60))
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed") . #4#)
                                   (GO #5#)))
                                 (#3# (SPADCALL |c2| (QREFELT $ 59))))))))
                  . #4#)
            (LETT |q1|
                  (SPADCALL
                   (SPADCALL (SPADCALL |rh1| |lh| (QREFELT $ 61))
                             (SPADCALL |rh2| |lb| (QREFELT $ 61))
                             (QREFELT $ 62))
                   |det| (QREFELT $ 64))
                  . #4#)
            (LETT |q2|
                  (SPADCALL
                   (SPADCALL (SPADCALL |rh2| |lh| (QREFELT $ 61))
                             (SPADCALL |rh1| |lb| (QREFELT $ 61))
                             (QREFELT $ 65))
                   |det| (QREFELT $ 64))
                  . #4#)
            (EXIT
             (CONS 0
                   (LIST (SPADCALL |q1| |n| (QREFELT $ 66))
                         (SPADCALL |q2| |n| (QREFELT $ 66)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |RDETRS;DSPDEhdom|
        ((|c1| UP) (|c2| UP) (|lb| F) (|lh| F) (|n| |NonNegativeInteger|)
         (|d| |Integer|) ($ |Union| (|List| UP) "failed"))
        (SPROG
         ((|q2| (UP)) (#1=#:G865 NIL) (|d2| #2=(|Integer|)) (|q1| (UP))
          (|d1| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q1|
                  (COND ((SPADCALL |c1| (QREFELT $ 51)) (|spadConstant| $ 33))
                        (#3='T
                         (SEQ
                          (LETT |d1| (- (SPADCALL |c1| (QREFELT $ 54)) |d|)
                                . #4=(|RDETRS;DSPDEhdom|))
                          (EXIT
                           (COND ((< |d1| |n|) (|spadConstant| $ 33))
                                 ((SPADCALL |d1| |n| (QREFELT $ 60))
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed") . #4#)
                                   (GO #5=#:G864)))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |c1| (QREFELT $ 59))
                                             |lh| (QREFELT $ 64))
                                   |n| (QREFELT $ 66))))))))
                  . #4#)
            (LETT |q2|
                  (COND ((SPADCALL |c2| (QREFELT $ 51)) (|spadConstant| $ 33))
                        (#3#
                         (SEQ
                          (LETT |d2| (- (SPADCALL |c2| (QREFELT $ 54)) |d|)
                                . #4#)
                          (EXIT
                           (COND ((< |d2| |n|) (|spadConstant| $ 33))
                                 ((SPADCALL |d2| |n| (QREFELT $ 60))
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed") . #4#)
                                   (GO #5#)))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |c2| (QREFELT $ 59))
                                             |lh| (QREFELT $ 64))
                                   |n| (QREFELT $ 66))))))))
                  . #4#)
            (EXIT (CONS 0 (LIST |q1| |q2|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |RDETRS;DSPDEbdom|
        ((|c1| UP) (|c2| UP) (|lb| F) (|lh| F) (|n| |NonNegativeInteger|)
         (|d| |Integer|) ($ |Union| (|List| UP) "failed"))
        (SPROG
         ((|q2| (UP)) (#1=#:G875 NIL) (|d1| #2=(|Integer|)) (|q1| (UP))
          (|d2| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q1|
                  (COND ((SPADCALL |c2| (QREFELT $ 51)) (|spadConstant| $ 33))
                        (#3='T
                         (SEQ
                          (LETT |d2| (- (SPADCALL |c2| (QREFELT $ 54)) |d|)
                                . #4=(|RDETRS;DSPDEbdom|))
                          (EXIT
                           (COND ((< |d2| |n|) (|spadConstant| $ 33))
                                 ((SPADCALL |d2| |n| (QREFELT $ 60))
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed") . #4#)
                                   (GO #5=#:G874)))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |c2| (QREFELT $ 59))
                                             |lb| (QREFELT $ 64))
                                   |n| (QREFELT $ 66))))))))
                  . #4#)
            (LETT |q2|
                  (COND ((SPADCALL |c1| (QREFELT $ 51)) (|spadConstant| $ 33))
                        (#3#
                         (SEQ
                          (LETT |d1| (- (SPADCALL |c1| (QREFELT $ 54)) |d|)
                                . #4#)
                          (EXIT
                           (COND ((< |d1| |n|) (|spadConstant| $ 33))
                                 ((SPADCALL |d1| |n| (QREFELT $ 60))
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed") . #4#)
                                   (GO #5#)))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |c1| (QREFELT $ 59))
                                              |lb| (QREFELT $ 64))
                                    (QREFELT $ 67))
                                   |n| (QREFELT $ 66))))))))
                  . #4#)
            (EXIT (CONS 0 (LIST |q1| |q2|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |RDETRS;getBound|
        ((|a| UP) (|b| UP) (|h| UP) (|c1| UP) (|c2| UP) ($ |Integer|))
        (SPROG
         ((|n| (|Union| (|Integer|) "failed")) (|db| (|Integer|))
          (|bb| (|Integer|)) (|hh| (|Integer|)) (|dc| (|Integer|))
          (|da| (|Integer|)))
         (SEQ
          (LETT |da| (SPADCALL |a| (QREFELT $ 54)) . #1=(|RDETRS;getBound|))
          (LETT |dc|
                (COND
                 ((SPADCALL |c1| (QREFELT $ 51))
                  (SPADCALL |c2| (QREFELT $ 54)))
                 ((SPADCALL |c2| (QREFELT $ 51))
                  (SPADCALL |c1| (QREFELT $ 54)))
                 (#2='T
                  (MAX (SPADCALL |c1| (QREFELT $ 54))
                       (SPADCALL |c2| (QREFELT $ 54)))))
                . #1#)
          (LETT |hh|
                (COND ((SPADCALL |h| (QREFELT $ 51)) 0)
                      (#2# (SPADCALL |h| (QREFELT $ 54))))
                . #1#)
          (LETT |db| (MAX |hh| (LETT |bb| (SPADCALL |b| (QREFELT $ 54)) . #1#))
                . #1#)
          (EXIT
           (COND ((< |da| (+ |db| 1)) (- |dc| |db|))
                 ((SPADCALL |da| (+ |db| 1) (QREFELT $ 60))
                  (MAX 0 (+ (- |dc| |da|) 1)))
                 ((>= |bb| |hh|) (- |dc| |db|))
                 (#2#
                  (SEQ
                   (LETT |n|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |h| (QREFELT $ 59))
                                     (SPADCALL |a| (QREFELT $ 59))
                                     (QREFELT $ 64))
                           (QREFELT $ 67))
                          (QREFELT $ 69))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |n| 0) (MAX (QCDR |n|) (- |dc| |db|)))
                          (#2# (- |dc| |db|))))))))))) 

(DECLAIM (NOTINLINE |TranscendentalRischDESystem;|)) 

(DEFUN |TranscendentalRischDESystem| (&REST #1=#:G886)
  (SPROG NIL
         (PROG (#2=#:G887)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalRischDESystem|)
                                               '|domainEqualList|)
                    . #3=(|TranscendentalRischDESystem|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |TranscendentalRischDESystem;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TranscendentalRischDESystem|)))))))))) 

(DEFUN |TranscendentalRischDESystem;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalRischDESystem|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|TranscendentalRischDESystem| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 70) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TranscendentalRischDESystem|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TranscendentalRischDESystem| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Fraction| 7) (|Mapping| 7 7) (|MonomialExtensionTools| 6 7)
              (0 . |normalDenom|) (6 . |lcm|) (12 . |gcd|)
              (18 . |differentiate|) (|Union| $ '"failed") (23 . |exquo|)
              (29 . *) (35 . *) (41 . -)
              (|Record| (|:| |a| 7) (|:| |b| 8) (|:| |h| 7) (|:| |c1| 8)
                        (|:| |c2| 8) (|:| |t| 7))
              (|Union| 20 '"failed") |RDETRS;monomRDEsys;3FMU;1| (|Boolean|)
              (46 . |zero?|) (51 . |Zero|) (55 . |retract|) (60 . |coerce|)
              (65 . /) (|List| 7) (71 . |second|)
              (|Union| (|List| 8) '"failed") |RDETRS;baseRDEsys;3FU;2|
              (76 . |Zero|) (|List| 29) (|Matrix| 7) (80 . |matrix|)
              (|Vector| 7) (85 . |vector|) (|Union| 37 '"failed")
              (|Record| (|:| |particular| 39) (|:| |basis| (|List| 37)))
              (|SmithNormalForm| 7 37 37 35) (90 . |diophantineSystem|)
              (|Integer|) (96 . |elt|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (102 . |divide|) (108 . |One|) (112 . |One|) (116 . +) (122 . -)
              (128 . |zero?|) (133 . |Zero|) (|NonNegativeInteger|)
              (137 . |degree|) (142 . >) (148 . |retract|)
              (|Union| 6 '#1="failed") (153 . |retractIfCan|)
              (158 . |leadingCoefficient|) (163 . >) (169 . *) (175 . +)
              (181 . *) (187 . /) (193 . -) (199 . |monomial|) (205 . -)
              (|Union| 43 '#1#) (210 . |retractIfCan|))
           '#(|monomRDEsys| 215 |baseRDEsys| 223) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(2 10 7 8 9 11 2 7 0 0 0 12 2
                                                   7 0 0 0 13 1 7 0 0 14 2 7 15
                                                   0 0 16 2 7 0 0 0 17 2 8 0 7
                                                   0 18 1 7 0 0 19 1 8 23 0 24
                                                   0 8 0 25 1 8 7 0 26 1 7 0 6
                                                   27 2 8 0 7 7 28 1 29 7 0 30
                                                   0 7 0 33 1 35 0 34 36 1 37 0
                                                   29 38 2 41 40 35 37 42 2 37
                                                   7 0 43 44 2 7 45 0 0 46 0 6
                                                   0 47 0 7 0 48 2 7 0 0 0 49 2
                                                   7 0 0 0 50 1 7 23 0 51 0 6 0
                                                   52 1 7 53 0 54 2 53 23 0 0
                                                   55 1 7 6 0 56 1 7 57 0 58 1
                                                   7 6 0 59 2 43 23 0 0 60 2 6
                                                   0 0 0 61 2 6 0 0 0 62 2 7 0
                                                   6 0 63 2 6 0 0 0 64 2 6 0 0
                                                   0 65 2 7 0 6 53 66 1 6 0 0
                                                   67 1 6 68 0 69 4 0 21 8 8 8
                                                   9 22 3 0 31 8 8 8 32)))))
           '|lookupComplete|)) 
