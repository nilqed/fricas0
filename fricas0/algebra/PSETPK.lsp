
(SDEFUN |PSETPK;removeAssociates| ((|lp| |List| P) ($ |List| P))
        (SPROG ((#1=#:G809 NIL) (|p| NIL) (#2=#:G808 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PSETPK;removeAssociates|))
                  (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 10)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 12))))) 

(SDEFUN |PSETPK;selectPolynomials;MLR;2|
        ((|pred?| |Mapping| (|Boolean|) P) (|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPROG ((|bps| (|List| P)) (|gps| (|List| P)) (|p| (P)))
               (SEQ (LETT |gps| NIL . #1=(|PSETPK;selectPolynomials;MLR;2|))
                    (LETT |bps| NIL . #1#)
                    (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                         (SEQ (LETT |p| (|SPADfirst| |ps|) . #1#)
                              (LETT |ps| (CDR |ps|) . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL |p| |pred?|)
                                 (LETT |gps| (CONS |p| |gps|) . #1#))
                                ('T (LETT |bps| (CONS |p| |bps|) . #1#)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |gps| (SPADCALL (ELT $ 14) |gps| (QREFELT $ 16))
                          . #1#)
                    (LETT |bps| (SPADCALL (ELT $ 14) |bps| (QREFELT $ 16))
                          . #1#)
                    (EXIT (CONS |gps| |bps|))))) 

(SDEFUN |PSETPK;selectOrPolynomials;LLR;3|
        ((|lpred?| . #1=(|List| (|Mapping| (|Boolean|) P))) (|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPROG
         ((|bps| (|List| P)) (|gps| (|List| P)) (|clpred?| #1#) (|p| (P)))
         (SEQ (LETT |gps| NIL . #2=(|PSETPK;selectOrPolynomials;LLR;3|))
              (LETT |bps| NIL . #2#)
              (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                   (SEQ (LETT |p| (|SPADfirst| |ps|) . #2#)
                        (LETT |ps| (CDR |ps|) . #2#)
                        (LETT |clpred?| |lpred?| . #2#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |clpred?|) NIL)
                                      ('T
                                       (NULL
                                        (SPADCALL |p|
                                                  (|SPADfirst| |clpred?|))))))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT |clpred?| (CDR |clpred?|) . #2#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |clpred?|)
                           (LETT |bps| (CONS |p| |bps|) . #2#))
                          ('T (LETT |gps| (CONS |p| |gps|) . #2#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |gps| (SPADCALL (ELT $ 14) |gps| (QREFELT $ 16)) . #2#)
              (LETT |bps| (SPADCALL (ELT $ 14) |bps| (QREFELT $ 16)) . #2#)
              (EXIT (CONS |gps| |bps|))))) 

(SDEFUN |PSETPK;selectAndPolynomials;LLR;4|
        ((|lpred?| . #1=(|List| (|Mapping| (|Boolean|) P))) (|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPROG
         ((|bps| (|List| P)) (|gps| (|List| P)) (|clpred?| #1#) (|p| (P)))
         (SEQ (LETT |gps| NIL . #2=(|PSETPK;selectAndPolynomials;LLR;4|))
              (LETT |bps| NIL . #2#)
              (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                   (SEQ (LETT |p| (|SPADfirst| |ps|) . #2#)
                        (LETT |ps| (CDR |ps|) . #2#)
                        (LETT |clpred?| |lpred?| . #2#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |clpred?|) NIL)
                                      ('T
                                       (SPADCALL |p|
                                                 (|SPADfirst| |clpred?|)))))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT |clpred?| (CDR |clpred?|) . #2#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |clpred?|)
                           (LETT |gps| (CONS |p| |gps|) . #2#))
                          ('T (LETT |bps| (CONS |p| |bps|) . #2#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |gps| (SPADCALL (ELT $ 14) |gps| (QREFELT $ 16)) . #2#)
              (LETT |bps| (SPADCALL (ELT $ 14) |bps| (QREFELT $ 16)) . #2#)
              (EXIT (CONS |gps| |bps|))))) 

(SDEFUN |PSETPK;linear?;PB;5| ((|p| P) ($ |Boolean|))
        (COND ((SPADCALL |p| (QREFELT $ 23)) NIL)
              ('T (EQL (SPADCALL |p| (QREFELT $ 25)) 1)))) 

(SDEFUN |PSETPK;linearPolynomials;LR;6|
        ((|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPADCALL (ELT $ 27) |ps| (QREFELT $ 19))) 

(SDEFUN |PSETPK;univariate?;PB;7| ((|p| P) ($ |Boolean|))
        (SPROG ((|tp| (P)))
               (SEQ
                (COND
                 ((OR (SPADCALL |p| (QREFELT $ 23))
                      (NULL
                       (SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                 (QREFELT $ 23))))
                  NIL)
                 ('T
                  (SEQ
                   (LETT |tp| (SPADCALL |p| (QREFELT $ 30))
                         |PSETPK;univariate?;PB;7|)
                   (EXIT
                    (COND ((SPADCALL |tp| (QREFELT $ 23)) 'T)
                          ((NULL
                            (SPADCALL (SPADCALL |p| (QREFELT $ 31))
                                      (SPADCALL |tp| (QREFELT $ 31))
                                      (QREFELT $ 32)))
                           NIL)
                          ('T (SPADCALL |tp| (QREFELT $ 33))))))))))) 

(SDEFUN |PSETPK;univariatePolynomials;LR;8|
        ((|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPADCALL (ELT $ 33) |ps| (QREFELT $ 19))) 

(SDEFUN |PSETPK;bivariate?;PB;9| ((|p| P) ($ |Boolean|))
        (SPROG ((|vip| (V)) (|vtp| (V)) (|vp| (V)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 23)) NIL)
                      ((SPADCALL (SPADCALL |p| (QREFELT $ 30)) (QREFELT $ 23))
                       (SPADCALL (SPADCALL |p| (QREFELT $ 29)) (QREFELT $ 33)))
                      (#1='T
                       (SEQ
                        (LETT |vp| (SPADCALL |p| (QREFELT $ 31))
                              . #2=(|PSETPK;bivariate?;PB;9|))
                        (LETT |vtp|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                        (QREFELT $ 31))
                              . #2#)
                        (COND
                         ((SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                    (QREFELT $ 23))
                          (COND
                           ((SPADCALL |vp| |vtp| (QREFELT $ 32))
                            (EXIT
                             (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                       (QREFELT $ 35)))))))
                        (COND
                         ((SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                    (QREFELT $ 23))
                          (COND
                           ((SPADCALL |vp| |vtp| (QREFELT $ 36))
                            (EXIT
                             (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                       (QREFELT $ 33)))))))
                        (COND
                         ((NULL
                           (SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                     (QREFELT $ 33)))
                          (EXIT NIL)))
                        (LETT |vip|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                        (QREFELT $ 31))
                              . #2#)
                        (EXIT
                         (COND ((SPADCALL |vip| |vtp| (QREFELT $ 36)) NIL)
                               ((SPADCALL |vip| |vtp| (QREFELT $ 32))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                          (QREFELT $ 33)))
                               ((SPADCALL |vtp| |vp| (QREFELT $ 37)) NIL)
                               (#1#
                                (COND
                                 ((ZEROP
                                   (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                             |vip| (QREFELT $ 38)))
                                  (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                            (QREFELT $ 33)))
                                 (#1#
                                  (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                            (QREFELT $ 35))))))))))))) 

(SDEFUN |PSETPK;bivariatePolynomials;LR;10|
        ((|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPADCALL (ELT $ 35) |ps| (QREFELT $ 19))) 

(SDEFUN |PSETPK;quasiMonicPolynomials;LR;11|
        ((|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPADCALL (ELT $ 40) |ps| (QREFELT $ 19))) 

(SDEFUN |PSETPK;removeRoughlyRedundantFactorsInPols;2LBL;12|
        ((|lp| |List| P) (|lf| |List| P) (|opt| |Boolean|) ($ |List| P))
        (SPROG
         ((|newlp| (|List| P)) (|stop| (|Boolean|)) (|p| (P)) (#1=#:G880 NIL)
          (|test| (|Union| P "failed")) (|copylf| (|List| P)) (|f| (P)))
         (SEQ
          (COND ((NULL |lp|) |lp|)
                (#2='T
                 (SEQ
                  (LETT |newlp| NIL
                        . #3=(|PSETPK;removeRoughlyRedundantFactorsInPols;2LBL;12|))
                  (LETT |stop| NIL . #3#)
                  (LETT |lp| (SPADCALL (ELT $ 42) |lp| (QREFELT $ 43)) . #3#)
                  (LETT |lf| (SPADCALL (ELT $ 14) |lf| (QREFELT $ 16)) . #3#)
                  (SEQ G190
                       (COND ((NULL (NULL (OR (NULL |lp|) |stop|))) (GO G191)))
                       (SEQ (LETT |p| (|SPADfirst| |lp|) . #3#)
                            (LETT |lp| (CDR |lp|) . #3#)
                            (LETT |copylf| |lf| . #3#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND
                                     ((OR (NULL |copylf|)
                                          (SPADCALL |p| (QREFELT $ 23)))
                                      NIL)
                                     ('T
                                      (NULL
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 31))
                                                 (SPADCALL
                                                  (|SPADfirst| |copylf|)
                                                  (QREFELT $ 31))
                                                 (QREFELT $ 37))))))
                                   (GO G191)))
                                 (SEQ (LETT |f| (|SPADfirst| |copylf|) . #3#)
                                      (LETT |copylf| (CDR |copylf|) . #3#)
                                      (EXIT
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (QEQCAR
                                                (LETT |test|
                                                      (SPADCALL |p| |f|
                                                                (QREFELT $ 45))
                                                      . #3#)
                                                0))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |p|
                                                    (PROG2
                                                        (LETT #1# |test| . #3#)
                                                        (QCDR #1#)
                                                      (|check_union2|
                                                       (QEQCAR #1# 0)
                                                       (QREFELT $ 9)
                                                       (|Union| (QREFELT $ 9)
                                                                "failed")
                                                       #1#))
                                                    . #3#)))
                                            NIL (GO G190) G191 (EXIT NIL))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (LETT |stop|
                                  (COND (|opt| (SPADCALL |p| (QREFELT $ 23)))
                                        ('T NIL))
                                  . #3#)
                            (EXIT
                             (LETT |newlp|
                                   (CONS (SPADCALL |p| (QREFELT $ 46)) |newlp|)
                                   . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND (|stop| (LIST (|spadConstant| $ 47)))
                         (#2# |newlp|))))))))) 

(SDEFUN |PSETPK;removeRoughlyRedundantFactorsInPol;PLP;13|
        ((|p| P) (|lf| |List| P) ($ P))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 42)) |p|)
                      ('T
                       (SEQ
                        (LETT |lp| (LIST |p|)
                              |PSETPK;removeRoughlyRedundantFactorsInPol;PLP;13|)
                        (EXIT
                         (|SPADfirst|
                          (SPADCALL |lp| |lf| 'T (QREFELT $ 48)))))))))) 

(SDEFUN |PSETPK;removeRoughlyRedundantFactorsInPols;3L;14|
        ((|lp| |List| P) (|lf| |List| P) ($ |List| P))
        (SPADCALL |lp| |lf| 'NIL (QREFELT $ 48))) 

(SDEFUN |PSETPK;possiblyNewVariety?;LLB;15|
        ((|newlp| |List| P) (|llp| |List| (|List| P)) ($ |Boolean|))
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (COND ((NULL |llp|) NIL)
                       ('T
                        (NULL
                         (SPADCALL |newlp| (|SPADfirst| |llp|)
                                   (QREFELT $ 51))))))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT |llp| (CDR |llp|) |PSETPK;possiblyNewVariety?;LLB;15|)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT (NULL |llp|)))) 

(SDEFUN |PSETPK;certainlySubVariety?;2LB;16|
        ((|lp| |List| P) (|lq| |List| P) ($ |Boolean|))
        (SPROG ((|gs| (|GeneralPolynomialSet| R E V P)))
               (SEQ
                (LETT |gs| (SPADCALL |lp| (QREFELT $ 55))
                      . #1=(|PSETPK;certainlySubVariety?;2LB;16|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |lq|) NIL)
                              ('T
                               (SPADCALL
                                (QVELT
                                 (SPADCALL (|SPADfirst| |lq|) |gs|
                                           (QREFELT $ 57))
                                 1)
                                (QREFELT $ 42)))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |lq| (CDR |lq|) . #1#))) NIL (GO G190)
                     G191 (EXIT NIL))
                (EXIT (NULL |lq|))))) 

(SDEFUN |PSETPK;probablyZeroDim?;LB;17| ((|lp| |List| P) ($ |Boolean|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|lv| (|List| V))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (LENGTH |lp|) . #1=(|PSETPK;probablyZeroDim?;LB;17|))
              (LETT |lv| (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 59)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL (NULL (NULL (LETT |lp| (CDR |lp|) . #1#))))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |lv|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 59)) |lv|
                            (QREFELT $ 60))
                           . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |n| (LENGTH (SPADCALL |lv| (QREFELT $ 61))) . #1#)
              (EXIT (NULL (SPADCALL |n| |m| (QREFELT $ 62))))))) 

(SDEFUN |PSETPK;interReduce;2L;18| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|rs| (|List| P)) (|ps| (|List| P)) (#1=#:G931 NIL) (|r| (P))
          (|p| (P)))
         (SEQ
          (EXIT
           (SEQ (LETT |ps| |lp| . #2=(|PSETPK;interReduce;2L;18|))
                (LETT |rs| NIL . #2#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL |ps|)
                          (PROGN (LETT #1# |rs| . #2#) (GO #3=#:G930)))
                         ('T
                          (SEQ
                           (LETT |ps| (SPADCALL (ELT $ 64) |ps| (QREFELT $ 16))
                                 . #2#)
                           (LETT |p| (|SPADfirst| |ps|) . #2#)
                           (LETT |ps| (CDR |ps|) . #2#)
                           (LETT |r|
                                 (QVELT
                                  (SPADCALL |p| (SPADCALL |ps| (QREFELT $ 55))
                                            (QREFELT $ 57))
                                  1)
                                 . #2#)
                           (EXIT
                            (COND ((SPADCALL |r| (QREFELT $ 42)) "iterate")
                                  ((SPADCALL |r| (QREFELT $ 23))
                                   (PROGN (LETT #1# NIL . #2#) (GO #3#)))
                                  ((SPADCALL |r| |p| (QREFELT $ 65))
                                   (LETT |rs| (CONS |r| |rs|) . #2#))
                                  ('T
                                   (SEQ
                                    (LETT |ps|
                                          (SPADCALL |ps| (CONS |r| |rs|)
                                                    (QREFELT $ 66))
                                          . #2#)
                                    (EXIT (LETT |rs| NIL . #2#)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PSETPK;roughRed?| ((|p| P) (|q| P) ($ |Boolean|))
        (COND ((SPADCALL |p| (QREFELT $ 23)) NIL)
              ((SPADCALL |q| (QREFELT $ 23)) 'T)
              ('T
               (SPADCALL (SPADCALL |p| (QREFELT $ 31))
                         (SPADCALL |q| (QREFELT $ 31)) (QREFELT $ 36))))) 

(SDEFUN |PSETPK;roughBasicSet;LU;20|
        ((|lp| |List| P)
         ($ |Union|
          (|Record| (|:| |bas| (|GeneralTriangularSet| R E V P))
                    (|:| |top| (|List| P)))
          "failed"))
        (SPADCALL |lp| (CONS (|function| |PSETPK;roughRed?|) $) (QREFELT $ 71))) 

(SDEFUN |PSETPK;autoRemainder|
        ((|ts| |GeneralTriangularSet| R E V P) ($ |List| P))
        (SPROG ((|lp| (|List| P)) (|newlp| (|List| P)) (|p| (P)))
               (SEQ
                (COND
                 ((SPADCALL |ts| (QREFELT $ 75))
                  (SPADCALL |ts| (QREFELT $ 76)))
                 ('T
                  (SEQ
                   (LETT |lp|
                         (SPADCALL (ELT $ 14)
                                   (REVERSE (SPADCALL |ts| (QREFELT $ 76)))
                                   (QREFELT $ 16))
                         . #1=(|PSETPK;autoRemainder|))
                   (LETT |newlp|
                         (LIST (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 10)))
                         . #1#)
                   (LETT |lp| (CDR |lp|) . #1#)
                   (SEQ G190 (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
                        (SEQ
                         (LETT |p|
                               (QVELT
                                (SPADCALL (|SPADfirst| |lp|)
                                          (SPADCALL |newlp| (QREFELT $ 55))
                                          (QREFELT $ 57))
                                1)
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |p| (QREFELT $ 42))
                            (LETT |lp| (CDR |lp|) . #1#))
                           ((SPADCALL |p| (QREFELT $ 23))
                            (SEQ
                             (LETT |newlp| (LIST (|spadConstant| $ 47)) . #1#)
                             (EXIT (LETT |lp| NIL . #1#))))
                           ('T
                            (SEQ (LETT |newlp| (CONS |p| |newlp|) . #1#)
                                 (EXIT (LETT |lp| (CDR |lp|) . #1#)))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |newlp|))))))) 

(SDEFUN |PSETPK;crushedSet;2L;22| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|finished| #1=(|Boolean|)) (#2=#:G960 NIL) (|contradiction| #1#)
          (|rec|
           (|Union|
            (|Record| (|:| |bas| #3=(|GeneralTriangularSet| R E V P))
                      (|:| |top| #4=(|List| P)))
            #5="failed"))
          (|rs| #4#) (|bs| #3#))
         (SEQ
          (LETT |rec| (SPADCALL |lp| (QREFELT $ 74))
                . #6=(|PSETPK;crushedSet;2L;22|))
          (LETT |contradiction| (QEQCAR |rec| 1) . #6#)
          (LETT |finished| NIL . #6#)
          (SEQ G190
               (COND ((NULL (NULL (OR |finished| |contradiction|))) (GO G191)))
               (SEQ
                (LETT |bs|
                      (QCAR
                       (PROG2 (LETT #2# |rec| . #6#)
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0)
                                         (|Record|
                                          (|:| |bas|
                                               (|GeneralTriangularSet|
                                                (QREFELT $ 6) (QREFELT $ 7)
                                                (QREFELT $ 8) (QREFELT $ 9)))
                                          (|:| |top| (|List| (QREFELT $ 9))))
                                         (|Union|
                                          (|Record|
                                           (|:| |bas|
                                                (|GeneralTriangularSet|
                                                 (QREFELT $ 6) (QREFELT $ 7)
                                                 (QREFELT $ 8) (QREFELT $ 9)))
                                           (|:| |top| (|List| (QREFELT $ 9))))
                                          #5#)
                                         #2#)))
                      . #6#)
                (LETT |rs|
                      (QCDR
                       (PROG2 (LETT #2# |rec| . #6#)
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0)
                                         (|Record|
                                          (|:| |bas|
                                               (|GeneralTriangularSet|
                                                (QREFELT $ 6) (QREFELT $ 7)
                                                (QREFELT $ 8) (QREFELT $ 9)))
                                          (|:| |top| (|List| (QREFELT $ 9))))
                                         (|Union|
                                          (|Record|
                                           (|:| |bas|
                                                (|GeneralTriangularSet|
                                                 (QREFELT $ 6) (QREFELT $ 7)
                                                 (QREFELT $ 8) (QREFELT $ 9)))
                                           (|:| |top| (|List| (QREFELT $ 9))))
                                          #5#)
                                         #2#)))
                      . #6#)
                (LETT |rs| (SPADCALL |rs| |bs| (QREFELT $ 77)) . #6#)
                (LETT |contradiction|
                      (COND ((NULL |rs|) NIL)
                            ('T
                             (SPADCALL (|SPADfirst| |rs|) (|spadConstant| $ 47)
                                       (QREFELT $ 78))))
                      . #6#)
                (EXIT
                 (COND
                  ((NULL |contradiction|)
                   (SEQ
                    (LETT |rs|
                          (SPADCALL |rs| (|PSETPK;autoRemainder| |bs| $)
                                    (QREFELT $ 66))
                          . #6#)
                    (LETT |rec| (SPADCALL |rs| (QREFELT $ 74)) . #6#)
                    (LETT |contradiction| (QEQCAR |rec| 1) . #6#)
                    (EXIT
                     (COND
                      ((NULL |contradiction|)
                       (LETT |finished|
                             (NULL
                              (SPADCALL
                               (QCAR
                                (PROG2 (LETT #2# |rec| . #6#)
                                    (QCDR #2#)
                                  (|check_union2| (QEQCAR #2# 0)
                                                  (|Record|
                                                   (|:| |bas|
                                                        (|GeneralTriangularSet|
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)
                                                         (QREFELT $ 8)
                                                         (QREFELT $ 9)))
                                                   (|:| |top|
                                                        (|List|
                                                         (QREFELT $ 9))))
                                                  (|Union|
                                                   (|Record|
                                                    (|:| |bas|
                                                         (|GeneralTriangularSet|
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)
                                                          (QREFELT $ 8)
                                                          (QREFELT $ 9)))
                                                    (|:| |top|
                                                         (|List|
                                                          (QREFELT $ 9))))
                                                   #5#)
                                                  #2#)))
                               |bs| (QREFELT $ 79)))
                             . #6#)))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND (|contradiction| (LIST (|spadConstant| $ 47))) ('T |rs|)))))) 

(SDEFUN |PSETPK;rewriteSetByReducingWithParticularGenerators;LMMML;23|
        ((|ps| |List| P) (|pred?| |Mapping| (|Boolean|) P)
         (|redOp?| |Mapping| (|Boolean|) P P) (|redOp| |Mapping| P P P)
         ($ |List| P))
        (SPROG
         ((|rs| (|List| P)) (|contradiction| #1=(|Boolean|)) (#2=#:G977 NIL)
          (|stop| #1#) (|bs1| (|GeneralTriangularSet| R E V P))
          (|bs2| (|GeneralTriangularSet| R E V P)) (#3=#:G976 NIL)
          (|ar| (|Union| (|GeneralTriangularSet| R E V P) (|List| P)))
          (#4=#:G973 NIL)
          (|rec|
           (|Union|
            (|Record| (|:| |bas| (|GeneralTriangularSet| R E V P))
                      (|:| |top| (|List| P)))
            "failed")))
         (SEQ
          (LETT |rs| (SPADCALL (ELT $ 42) |ps| (QREFELT $ 43))
                . #5=(|PSETPK;rewriteSetByReducingWithParticularGenerators;LMMML;23|))
          (EXIT
           (COND
            ((SPADCALL (ELT $ 23) |rs| (QREFELT $ 81))
             (LIST (|spadConstant| $ 47)))
            ('T
             (SEQ (LETT |contradiction| NIL . #5#)
                  (LETT |bs1| (SPADCALL (QREFELT $ 82)) . #5#)
                  (LETT |stop| NIL . #5#)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (OR |contradiction| |stop|))) (GO G191)))
                       (SEQ
                        (LETT |rec|
                              (SPADCALL |rs| |pred?| |redOp?| (QREFELT $ 83))
                              . #5#)
                        (LETT |bs2|
                              (QCAR
                               (PROG2 (LETT #4# |rec| . #5#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|Record|
                                                  (|:| |bas|
                                                       (|GeneralTriangularSet|
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)
                                                        (QREFELT $ 8)
                                                        (QREFELT $ 9)))
                                                  (|:| |top|
                                                       (|List| (QREFELT $ 9))))
                                                 (|Union|
                                                  (|Record|
                                                   (|:| |bas|
                                                        (|GeneralTriangularSet|
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)
                                                         (QREFELT $ 8)
                                                         (QREFELT $ 9)))
                                                   (|:| |top|
                                                        (|List|
                                                         (QREFELT $ 9))))
                                                  #6="failed")
                                                 #4#)))
                              . #5#)
                        (LETT |rs|
                              (QCDR
                               (PROG2 (LETT #4# |rec| . #5#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|Record|
                                                  (|:| |bas|
                                                       (|GeneralTriangularSet|
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)
                                                        (QREFELT $ 8)
                                                        (QREFELT $ 9)))
                                                  (|:| |top|
                                                       (|List| (QREFELT $ 9))))
                                                 (|Union|
                                                  (|Record|
                                                   (|:| |bas|
                                                        (|GeneralTriangularSet|
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)
                                                         (QREFELT $ 8)
                                                         (QREFELT $ 9)))
                                                   (|:| |top|
                                                        (|List|
                                                         (QREFELT $ 9))))
                                                  #6#)
                                                 #4#)))
                              . #5#)
                        (LETT |ar| (CONS 0 |bs2|) . #5#)
                        (COND
                         ((QEQCAR |ar| 0)
                          (SEQ
                           (LETT |bs2|
                                 (PROG2 (LETT #3# |ar| . #5#)
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|GeneralTriangularSet|
                                                    (QREFELT $ 6) (QREFELT $ 7)
                                                    (QREFELT $ 8)
                                                    (QREFELT $ 9))
                                                   (|Union|
                                                    (|GeneralTriangularSet|
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)
                                                     (QREFELT $ 8)
                                                     (QREFELT $ 9))
                                                    (|List| (QREFELT $ 9)))
                                                   #3#))
                                 . #5#)
                           (COND
                            ((SPADCALL |bs2| |bs1| (QREFELT $ 79))
                             (SEQ
                              (LETT |rs|
                                    (SPADCALL |rs| |bs2| |redOp| |redOp?|
                                              (QREFELT $ 85))
                                    . #5#)
                              (EXIT (LETT |bs1| |bs2| . #5#))))
                            ('T (LETT |stop| 'T . #5#)))
                           (EXIT
                            (LETT |rs|
                                  (SPADCALL (SPADCALL |bs2| (QREFELT $ 76))
                                            |rs| (QREFELT $ 66))
                                  . #5#))))
                         ('T
                          (LETT |rs|
                                (SPADCALL
                                 (PROG2 (LETT #2# |ar| . #5#)
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 1)
                                                   (|List| (QREFELT $ 9))
                                                   (|Union|
                                                    (|GeneralTriangularSet|
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)
                                                     (QREFELT $ 8)
                                                     (QREFELT $ 9))
                                                    (|List| (QREFELT $ 9)))
                                                   #2#))
                                 |rs| (QREFELT $ 66))
                                . #5#)))
                        (EXIT
                         (COND
                          ((SPADCALL (ELT $ 23) |rs| (QREFELT $ 81))
                           (SEQ (LETT |contradiction| 'T . #5#)
                                (EXIT
                                 (LETT |rs| (LIST (|spadConstant| $ 47))
                                       . #5#)))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |rs|)))))))) 

(SDEFUN |PSETPK;removeRedundantFactors;2LML;24|
        ((|lp| |List| P) (|lq| |List| P)
         (|remOp| |Mapping| (|List| P) (|List| P)) ($ |List| P))
        (SEQ
         (LETT |lq| (SPADCALL |lq| |lp| NIL (QREFELT $ 48))
               . #1=(|PSETPK;removeRedundantFactors;2LML;24|))
         (LETT |lq| (SPADCALL |lq| |remOp|) . #1#)
         (EXIT
          (SPADCALL (ELT $ 14) (SPADCALL |lp| |lq| (QREFELT $ 66))
                    (QREFELT $ 16))))) 

(SDEFUN |PSETPK;removeRedundantFactors;3L;25|
        ((|lp| |List| P) (|lq| |List| P) ($ |List| P))
        (SEQ
         (LETT |lq| (SPADCALL |lq| |lp| NIL (QREFELT $ 48))
               . #1=(|PSETPK;removeRedundantFactors;3L;25|))
         (LETT |lq| (SPADCALL |lq| (QREFELT $ 89)) . #1#)
         (EXIT
          (SPADCALL (ELT $ 14) (SPADCALL |lp| |lq| (QREFELT $ 66))
                    (QREFELT $ 16))))) 

(SDEFUN |PSETPK;irreducibleFactors;2L;26| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|newlp| (|List| P)) (|lf| (|List| P)) (#1=#:G1023 NIL) (|rrz| NIL)
          (#2=#:G1022 NIL)
          (|lrrz|
           (|List| (|Record| (|:| |factor| P) (|:| |exponent| (|Integer|)))))
          (|fp| (|Factored| P)) (|p| (P)))
         (SEQ (LETT |newlp| NIL . #3=(|PSETPK;irreducibleFactors;2L;26|))
              (SEQ G190 (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
                   (SEQ (LETT |p| (|SPADfirst| |lp|) . #3#)
                        (LETT |lp| (CDR |lp|) . #3#)
                        (LETT |fp| (SPADCALL |p| (QREFELT $ 93)) . #3#)
                        (LETT |lrrz| (SPADCALL |fp| (QREFELT $ 96)) . #3#)
                        (LETT |lf|
                              (SPADCALL (ELT $ 23)
                                        (PROGN
                                         (LETT #2# NIL . #3#)
                                         (SEQ (LETT |rrz| NIL . #3#)
                                              (LETT #1# |lrrz| . #3#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |rrz| (CAR #1#)
                                                           . #3#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS (QCAR |rrz|) #2#)
                                                      . #3#)))
                                              (LETT #1# (CDR #1#) . #3#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        (QREFELT $ 43))
                              . #3#)
                        (EXIT
                         (LETT |newlp| (SPADCALL |lf| |newlp| (QREFELT $ 66))
                               . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |newlp| (QREFELT $ 12)))))) 

(SDEFUN |PSETPK;lazyIrreducibleFactors;2L;27| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|newlp| (|List| P)) (|lf| (|List| P)) (#1=#:G1033 NIL) (|rrz| NIL)
          (#2=#:G1032 NIL)
          (|lrrz|
           (|List| (|Record| (|:| |factor| P) (|:| |exponent| (|Integer|)))))
          (|fp| (|Factored| P)) (|p| (P)))
         (SEQ
          (LETT |lp| (SPADCALL |lp| (QREFELT $ 89))
                . #3=(|PSETPK;lazyIrreducibleFactors;2L;27|))
          (LETT |newlp| NIL . #3#)
          (SEQ G190 (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
               (SEQ (LETT |p| (|SPADfirst| |lp|) . #3#)
                    (LETT |lp| (CDR |lp|) . #3#)
                    (LETT |fp| (SPADCALL |p| (QREFELT $ 93)) . #3#)
                    (LETT |lrrz| (SPADCALL |fp| (QREFELT $ 96)) . #3#)
                    (LETT |lf|
                          (SPADCALL (ELT $ 23)
                                    (PROGN
                                     (LETT #2# NIL . #3#)
                                     (SEQ (LETT |rrz| NIL . #3#)
                                          (LETT #1# |lrrz| . #3#) G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |rrz| (CAR #1#) . #3#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2# (CONS (QCAR |rrz|) #2#)
                                                  . #3#)))
                                          (LETT #1# (CDR #1#) . #3#) (GO G190)
                                          G191 (EXIT (NREVERSE #2#))))
                                    (QREFELT $ 43))
                          . #3#)
                    (EXIT
                     (LETT |newlp| (SPADCALL |lf| |newlp| (QREFELT $ 66))
                           . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |newlp|)))) 

(SDEFUN |PSETPK;removeIrreducibleRedundantFactors;3L;28|
        ((|lp| |List| P) (|lq| |List| P) ($ |List| P))
        (SEQ
         (LETT |lq| (SPADCALL |lq| |lp| NIL (QREFELT $ 48))
               . #1=(|PSETPK;removeIrreducibleRedundantFactors;3L;28|))
         (LETT |lq| (SPADCALL |lq| (QREFELT $ 97)) . #1#)
         (EXIT
          (SPADCALL (ELT $ 14) (SPADCALL |lp| |lq| (QREFELT $ 66))
                    (QREFELT $ 16))))) 

(SDEFUN |PSETPK;squareFreeFactors;PL;29| ((|p| P) ($ |List| P))
        (SPROG
         ((|lsf| (|List| P)) (#1=#:G1043 NIL) (|foo| NIL) (#2=#:G1042 NIL)
          (|sfp| (|Factored| P)))
         (SEQ
          (LETT |sfp| (SPADCALL |p| (QREFELT $ 101))
                . #3=(|PSETPK;squareFreeFactors;PL;29|))
          (LETT |lsf|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |foo| NIL . #3#)
                      (LETT #1# (SPADCALL |sfp| (QREFELT $ 96)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |foo| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |foo|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT |lsf|)))) 

(SDEFUN |PSETPK;univariatePolynomialsGcds;LBL;30|
        ((|ps| |List| P) (|opt| |Boolean|) ($ |List| P))
        (SPROG
         ((|lg| (|List| P)) (|stop| (|Boolean|)) (|g| (P)) (|pInV| (|List| P))
          (|p| (P)) (|v| (V)))
         (SEQ (LETT |lg| NIL . #1=(|PSETPK;univariatePolynomialsGcds;LBL;30|))
              (LETT |stop| NIL . #1#)
              (LETT |ps| (SPADCALL (ELT $ 14) |ps| (QREFELT $ 16)) . #1#)
              (SEQ G190
                   (COND ((NULL (NULL (OR (NULL |ps|) |stop|))) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |ps|) NIL)
                                  ('T
                                   (NULL
                                    (SPADCALL
                                     (LETT |p| (|SPADfirst| |ps|) . #1#)
                                     (QREFELT $ 33))))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |ps| (CDR |ps|) . #1#))) NIL
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((NULL (NULL |ps|))
                       (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 31)) . #1#)
                            (LETT |pInV| (LIST |p|) . #1#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |ps|) NIL)
                                          ('T
                                           (SPADCALL
                                            (SPADCALL
                                             (LETT |p| (|SPADfirst| |ps|)
                                                   . #1#)
                                             (QREFELT $ 31))
                                            |v| (QREFELT $ 32)))))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   ((SPADCALL |p| (QREFELT $ 33))
                                    (LETT |pInV| (CONS |p| |pInV|) . #1#)))
                                  (EXIT (LETT |ps| (CDR |ps|) . #1#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (LETT |g| (SPADCALL |pInV| (QREFELT $ 104)) . #1#)
                            (LETT |stop|
                                  (COND (|opt| (SPADCALL |g| (QREFELT $ 23)))
                                        ('T NIL))
                                  . #1#)
                            (EXIT (LETT |lg| (CONS |g| |lg|) . #1#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (COND (|stop| (LIST (|spadConstant| $ 47))) ('T |lg|)))))) 

(SDEFUN |PSETPK;univariatePolynomialsGcds;2L;31| ((|ps| |List| P) ($ |List| P))
        (SPADCALL |ps| NIL (QREFELT $ 105))) 

(SDEFUN |PSETPK;removeSquaresIfCan;2L;32| ((|lp| |List| P) ($ |List| P))
        (SPROG ((#1=#:G1064 NIL) (|p| NIL) (#2=#:G1063 NIL))
               (SEQ
                (COND ((NULL |lp|) |lp|)
                      ('T
                       (SPADCALL
                        (PROGN
                         (LETT #2# NIL
                               . #3=(|PSETPK;removeSquaresIfCan;2L;32|))
                         (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 107)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 12))))))) 

(SDEFUN |PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;33|
        ((|ps| |List| P) (|redOp?| |Mapping| (|Boolean|) P P)
         (|redOp| |Mapping| P P P) ($ |List| P))
        (SPROG ((|ups| (|List| P)))
               (SEQ
                (LETT |ups|
                      (SPADCALL (SPADCALL |ps| 'T (QREFELT $ 105))
                                (QREFELT $ 108))
                      . #1=(|PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;33|))
                (LETT |ps|
                      (SPADCALL (SPADCALL |ups| |ps| (QREFELT $ 66))
                                (QREFELT $ 12))
                      . #1#)
                (EXIT
                 (SPADCALL |ps| (ELT $ 40) |redOp?| |redOp| (QREFELT $ 86)))))) 

(SDEFUN |PSETPK;removeRoughlyRedundantFactorsInContents;3L;34|
        ((|ps| |List| P) (|lf| |List| P) ($ |List| P))
        (SPROG
         ((|newps| (|List| P)) (|newp| (P)) (|newcp| (P)) (#1=#:G1073 NIL)
          (|test| (|Union| P "failed")) (|copylf| (|List| P)) (|f| (P))
          (#2=#:G1090 NIL) (#3=#:G1089 NIL) (|cp| (P)) (|p| (P)))
         (SEQ
          (COND ((NULL |ps|) |ps|)
                ('T
                 (SEQ
                  (LETT |newps| NIL
                        . #4=(|PSETPK;removeRoughlyRedundantFactorsInContents;3L;34|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                       (SEQ (LETT |p| (|SPADfirst| |ps|) . #4#)
                            (LETT |ps| (CDR |ps|) . #4#)
                            (LETT |cp| (SPADCALL |p| (QREFELT $ 110)) . #4#)
                            (LETT |newcp| (SPADCALL |cp| (QREFELT $ 107))
                                  . #4#)
                            (LETT |newp|
                                  (PROG2
                                      (LETT #1#
                                            (SPADCALL |p| |cp| (QREFELT $ 45))
                                            . #4#)
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (QREFELT $ 9)
                                                    (|Union| (QREFELT $ 9)
                                                             #5="failed")
                                                    #1#))
                                  . #4#)
                            (COND
                             ((NULL (SPADCALL |newcp| (QREFELT $ 23)))
                              (SEQ
                               (LETT |copylf|
                                     (PROGN
                                      (LETT #3# NIL . #4#)
                                      (SEQ (LETT |f| NIL . #4#)
                                           (LETT #2# |lf| . #4#) G190
                                           (COND
                                            ((OR (ATOM #2#)
                                                 (PROGN
                                                  (LETT |f| (CAR #2#) . #4#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |f| (QREFELT $ 31))
                                                (SPADCALL |newcp|
                                                          (QREFELT $ 31))
                                                (QREFELT $ 111))
                                               (LETT #3# (CONS |f| #3#)
                                                     . #4#)))))
                                           (LETT #2# (CDR #2#) . #4#) (GO G190)
                                           G191 (EXIT (NREVERSE #3#))))
                                     . #4#)
                               (EXIT
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (COND ((NULL |copylf|) NIL)
                                              ('T
                                               (NULL
                                                (SPADCALL |newcp|
                                                          (QREFELT $ 23))))))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |f| (|SPADfirst| |copylf|) . #4#)
                                      (LETT |copylf| (CDR |copylf|) . #4#)
                                      (LETT |test|
                                            (SPADCALL |newcp| |f|
                                                      (QREFELT $ 45))
                                            . #4#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |test| 0)
                                         (LETT |newcp|
                                               (PROG2 (LETT #1# |test| . #4#)
                                                   (QCDR #1#)
                                                 (|check_union2| (QEQCAR #1# 0)
                                                                 (QREFELT $ 9)
                                                                 (|Union|
                                                                  (QREFELT $ 9)
                                                                  #5#)
                                                                 #1#))
                                               . #4#)))))
                                     NIL (GO G190) G191 (EXIT NIL))))))
                            (COND
                             ((SPADCALL |newcp| (QREFELT $ 23))
                              (LETT |newp| (SPADCALL |newp| (QREFELT $ 46))
                                    . #4#))
                             ('T
                              (LETT |newp|
                                    (SPADCALL
                                     (SPADCALL |newp| |newcp| (QREFELT $ 112))
                                     (QREFELT $ 46))
                                    . #4#)))
                            (EXIT (LETT |newps| (CONS |newp| |newps|) . #4#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |newps|))))))) 

(SDEFUN |PSETPK;removeRedundantFactorsInContents;3L;35|
        ((|ps| |List| P) (|lf| . #1=(|List| P)) ($ |List| P))
        (SPROG
         ((|newps| (|List| P)) (|newp| (P)) (|newcp| (P)) (#2=#:G1093 NIL)
          (|g| (P)) (|copylf| #1#) (|f| (P)) (|cp| (P)) (|p| (P)))
         (SEQ
          (COND ((NULL |ps|) |ps|)
                ('T
                 (SEQ
                  (LETT |newps| NIL
                        . #3=(|PSETPK;removeRedundantFactorsInContents;3L;35|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                       (SEQ (LETT |p| (|SPADfirst| |ps|) . #3#)
                            (LETT |ps| (CDR |ps|) . #3#)
                            (LETT |cp| (SPADCALL |p| (QREFELT $ 110)) . #3#)
                            (LETT |newcp| (SPADCALL |cp| (QREFELT $ 107))
                                  . #3#)
                            (LETT |newp|
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL |p| |cp| (QREFELT $ 45))
                                            . #3#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT $ 9)
                                                    (|Union| (QREFELT $ 9)
                                                             #4="failed")
                                                    #2#))
                                  . #3#)
                            (COND
                             ((NULL (SPADCALL |newcp| (QREFELT $ 23)))
                              (SEQ (LETT |copylf| |lf| . #3#)
                                   (EXIT
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND ((NULL |copylf|) NIL)
                                                  ('T
                                                   (NULL
                                                    (SPADCALL |newcp|
                                                              (QREFELT $
                                                                       23))))))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |f| (|SPADfirst| |copylf|)
                                                . #3#)
                                          (LETT |copylf| (CDR |copylf|) . #3#)
                                          (LETT |g|
                                                (SPADCALL |newcp| |f|
                                                          (QREFELT $ 114))
                                                . #3#)
                                          (EXIT
                                           (COND
                                            ((NULL
                                              (SPADCALL |g| (QREFELT $ 23)))
                                             (LETT |newcp|
                                                   (PROG2
                                                       (LETT #2#
                                                             (SPADCALL |newcp|
                                                                       |g|
                                                                       (QREFELT
                                                                        $ 45))
                                                             . #3#)
                                                       (QCDR #2#)
                                                     (|check_union2|
                                                      (QEQCAR #2# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               #4#)
                                                      #2#))
                                                   . #3#)))))
                                         NIL (GO G190) G191 (EXIT NIL))))))
                            (COND
                             ((SPADCALL |newcp| (QREFELT $ 23))
                              (LETT |newp| (SPADCALL |newp| (QREFELT $ 46))
                                    . #3#))
                             ('T
                              (LETT |newp|
                                    (SPADCALL
                                     (SPADCALL |newp| |newcp| (QREFELT $ 112))
                                     (QREFELT $ 46))
                                    . #3#)))
                            (EXIT (LETT |newps| (CONS |newp| |newps|) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |newps|))))))) 

(SDEFUN |PSETPK;removeRedundantFactorsInPols;3L;36|
        ((|ps| |List| P) (|lf| . #1=(|List| P)) ($ |List| P))
        (SPROG
         ((|newps| (|List| P)) (|newp| (P)) (#2=#:G1109 NIL) (|g| (P))
          (|newcp| (P)) (|copylf| #1#) (|f| (P)) (|cp| (P)) (|p| (P)))
         (SEQ
          (COND ((NULL |ps|) |ps|)
                ('T
                 (SEQ
                  (LETT |newps| NIL
                        . #3=(|PSETPK;removeRedundantFactorsInPols;3L;36|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                       (SEQ (LETT |p| (|SPADfirst| |ps|) . #3#)
                            (LETT |ps| (CDR |ps|) . #3#)
                            (LETT |cp| (SPADCALL |p| (QREFELT $ 110)) . #3#)
                            (LETT |newcp| (SPADCALL |cp| (QREFELT $ 107))
                                  . #3#)
                            (LETT |newp|
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL |p| |cp| (QREFELT $ 45))
                                            . #3#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT $ 9)
                                                    (|Union| (QREFELT $ 9)
                                                             #4="failed")
                                                    #2#))
                                  . #3#)
                            (LETT |newp| (SPADCALL |newp| (QREFELT $ 107))
                                  . #3#)
                            (LETT |copylf| |lf| . #3#)
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (NULL |copylf|))) (GO G191)))
                                 (SEQ (LETT |f| (|SPADfirst| |copylf|) . #3#)
                                      (LETT |copylf| (CDR |copylf|) . #3#)
                                      (COND
                                       ((NULL
                                         (SPADCALL |newcp| (QREFELT $ 23)))
                                        (SEQ
                                         (LETT |g|
                                               (SPADCALL |newcp| |f|
                                                         (QREFELT $ 114))
                                               . #3#)
                                         (EXIT
                                          (COND
                                           ((NULL
                                             (SPADCALL |g| (QREFELT $ 23)))
                                            (LETT |newcp|
                                                  (PROG2
                                                      (LETT #2#
                                                            (SPADCALL |newcp|
                                                                      |g|
                                                                      (QREFELT
                                                                       $ 45))
                                                            . #3#)
                                                      (QCDR #2#)
                                                    (|check_union2|
                                                     (QEQCAR #2# 0)
                                                     (QREFELT $ 9)
                                                     (|Union| (QREFELT $ 9)
                                                              #4#)
                                                     #2#))
                                                  . #3#)))))))
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (SPADCALL |newp| (QREFELT $ 23)))
                                         (SEQ
                                          (LETT |g|
                                                (SPADCALL |newp| |f|
                                                          (QREFELT $ 114))
                                                . #3#)
                                          (EXIT
                                           (COND
                                            ((NULL
                                              (SPADCALL |g| (QREFELT $ 23)))
                                             (LETT |newp|
                                                   (PROG2
                                                       (LETT #2#
                                                             (SPADCALL |newp|
                                                                       |g|
                                                                       (QREFELT
                                                                        $ 45))
                                                             . #3#)
                                                       (QCDR #2#)
                                                     (|check_union2|
                                                      (QEQCAR #2# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               #4#)
                                                      #2#))
                                                   . #3#)))))))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((SPADCALL |newcp| (QREFELT $ 23))
                              (LETT |newp| (SPADCALL |newp| (QREFELT $ 46))
                                    . #3#))
                             ('T
                              (LETT |newp|
                                    (SPADCALL
                                     (SPADCALL |newp| |newcp| (QREFELT $ 112))
                                     (QREFELT $ 46))
                                    . #3#)))
                            (EXIT (LETT |newps| (CONS |newp| |newps|) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |newps|))))))) 

(SDEFUN |PSETPK;removeRedundantFactors;2PL;37| ((|a| P) (|b| P) ($ |List| P))
        (SPROG ((#1=#:G1128 NIL) (|#G88| (P)) (|#G87| (P)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (SPADCALL |a| (QREFELT $ 107))
                                  (QREFELT $ 10))
                        . #2=(|PSETPK;removeRedundantFactors;2PL;37|))
                  (LETT |b|
                        (SPADCALL (SPADCALL |b| (QREFELT $ 107))
                                  (QREFELT $ 10))
                        . #2#)
                  (COND
                   ((NULL (SPADCALL |a| |b| (QREFELT $ 14)))
                    (PROGN
                     (LETT |#G87| |b| . #2#)
                     (LETT |#G88| |a| . #2#)
                     (LETT |a| |#G87| . #2#)
                     (LETT |b| |#G88| . #2#))))
                  (EXIT
                   (COND
                    ((SPADCALL |a| (QREFELT $ 23))
                     (COND
                      ((SPADCALL |b| (QREFELT $ 23))
                       (PROGN (LETT #1# NIL . #2#) (GO #3=#:G1127)))
                      (#4='T (PROGN (LETT #1# (LIST |b|) . #2#) (GO #3#)))))
                    ((SPADCALL |b| (QREFELT $ 23))
                     (PROGN (LETT #1# (LIST |a|) . #2#) (GO #3#)))
                    (#4#
                     (PROGN
                      (LETT #1# (SPADCALL |a| |b| (QREFELT $ 117)) . #2#)
                      (GO #3#)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |PSETPK;unprotectedRemoveRedundantFactors;2PL;38|
        ((|a| P) (|b| P) ($ |List| P))
        (SPROG
         ((#1=#:G1136 NIL) (#2=#:G1130 NIL) (|g| (P)) (|d| (P))
          (|c| (|Union| P #3="failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |c| (SPADCALL |b| |a| (QREFELT $ 45))
                  . #4=(|PSETPK;unprotectedRemoveRedundantFactors;2PL;38|))
            (EXIT
             (COND
              ((QEQCAR |c| 0)
               (SEQ
                (LETT |d|
                      (PROG2 (LETT #2# |c| . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                        (|Union| (QREFELT $ 9) #3#) #2#))
                      . #4#)
                (EXIT
                 (COND
                  ((SPADCALL |d| (QREFELT $ 23))
                   (PROGN (LETT #1# (LIST |a|) . #4#) (GO #5=#:G1135)))
                  (#6='T (PROGN (LETT #1# (LIST |a| |d|) . #4#) (GO #5#)))))))
              (#6#
               (SEQ (LETT |g| (SPADCALL |a| |b| (QREFELT $ 114)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |g| (QREFELT $ 23))
                       (PROGN (LETT #1# (LIST |a| |b|) . #4#) (GO #5#)))
                      (#6#
                       (PROGN
                        (LETT #1#
                              (LIST |g|
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL |a| |g| (QREFELT $ 45))
                                              . #4#)
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               #3#)
                                                      #2#))
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL |b| |g| (QREFELT $ 45))
                                              . #4#)
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               #3#)
                                                      #2#)))
                              . #4#)
                        (GO #5#)))))))))))
          #5# (EXIT #1#)))) 

(PUT '|PSETPK;removeSquaresIfCan;2L;39| '|SPADreplace| '(XLAM (|lp|) |lp|)) 

(SDEFUN |PSETPK;removeSquaresIfCan;2L;39| ((|lp| |List| P) ($ |List| P)) |lp|) 

(SDEFUN |PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;40|
        ((|ps| |List| P) (|redOp?| |Mapping| (|Boolean|) P P)
         (|redOp| |Mapping| P P P) ($ |List| P))
        (SPADCALL |ps| (ELT $ 40) |redOp?| |redOp| (QREFELT $ 86))) 

(SDEFUN |PSETPK;removeRedundantFactors;2PL;41| ((|a| P) (|b| P) ($ |List| P))
        (SPROG ((#1=#:G1149 NIL) (|#G98| (P)) (|#G97| (P)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |a| (SPADCALL |a| (QREFELT $ 10))
                        . #2=(|PSETPK;removeRedundantFactors;2PL;41|))
                  (LETT |b| (SPADCALL |b| (QREFELT $ 10)) . #2#)
                  (COND
                   ((NULL (SPADCALL |a| |b| (QREFELT $ 14)))
                    (PROGN
                     (LETT |#G97| |b| . #2#)
                     (LETT |#G98| |a| . #2#)
                     (LETT |a| |#G97| . #2#)
                     (LETT |b| |#G98| . #2#))))
                  (EXIT
                   (COND
                    ((SPADCALL |a| (QREFELT $ 23))
                     (COND
                      ((SPADCALL |b| (QREFELT $ 23))
                       (PROGN (LETT #1# NIL . #2#) (GO #3=#:G1148)))
                      (#4='T (PROGN (LETT #1# (LIST |b|) . #2#) (GO #3#)))))
                    ((SPADCALL |b| (QREFELT $ 23))
                     (PROGN (LETT #1# (LIST |a|) . #2#) (GO #3#)))
                    (#4#
                     (PROGN
                      (LETT #1# (SPADCALL |a| |b| (QREFELT $ 117)) . #2#)
                      (GO #3#)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |PSETPK;unprotectedRemoveRedundantFactors;2PL;42|
        ((|a| P) (|b| P) ($ |List| P))
        (SPROG
         ((#1=#:G1158 NIL) (|d| (P)) (|#G102| (P)) (|#G101| (P))
          (#2=#:G1151 NIL) (|c| (|Union| P #3="failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |c| (SPADCALL |b| |a| (QREFELT $ 45))
                  . #4=(|PSETPK;unprotectedRemoveRedundantFactors;2PL;42|))
            (EXIT
             (COND
              ((QEQCAR |c| 0)
               (SEQ
                (LETT |d|
                      (PROG2 (LETT #2# |c| . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                        (|Union| (QREFELT $ 9) #3#) #2#))
                      . #4#)
                (EXIT
                 (COND
                  ((SPADCALL |d| (QREFELT $ 23))
                   (PROGN (LETT #1# (LIST |a|) . #4#) (GO #5=#:G1157)))
                  (#6='T
                   (SEQ
                    (COND
                     ((SPADCALL |d| |a| (QREFELT $ 14))
                      (PROGN
                       (LETT |#G101| |d| . #4#)
                       (LETT |#G102| |a| . #4#)
                       (LETT |a| |#G101| . #4#)
                       (LETT |d| |#G102| . #4#))))
                    (EXIT
                     (PROGN
                      (LETT #1# (SPADCALL |a| |d| (QREFELT $ 117)) . #4#)
                      (GO #5#)))))))))
              (#6# (PROGN (LETT #1# (LIST |a| |b|) . #4#) (GO #5#)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PSETPK;removeRedundantFactors;2L;43| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|top| (|List| P)) (|base| (|List| P)) (|p| (P)) (#1=#:G1176 NIL)
          (#2=#:G1175 NIL) (#3=#:G1174 NIL) (#4=#:G1173 NIL))
         (SEQ
          (LETT |lp| (SPADCALL (ELT $ 23) |lp| (QREFELT $ 43))
                . #5=(|PSETPK;removeRedundantFactors;2L;43|))
          (LETT |lp|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #5#)
                  (SEQ (LETT |p| NIL . #5#) (LETT #3# |lp| . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4# (CONS (SPADCALL |p| (QREFELT $ 10)) #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 12))
                . #5#)
          (LETT |lp| (SPADCALL |lp| (QREFELT $ 108)) . #5#)
          (LETT |lp|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #5#)
                  (SEQ (LETT |p| NIL . #5#) (LETT #1# |lp| . #5#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 46)) #2#)
                               . #5#)))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 12))
                . #5#)
          (EXIT
           (COND ((OR (NULL |lp|) (SPADCALL |lp| 1 (QREFELT $ 119))) |lp|)
                 ('T
                  (SEQ
                   (LETT |lp| (SPADCALL (ELT $ 14) |lp| (QREFELT $ 16)) . #5#)
                   (LETT |p| (|SPADfirst| |lp|) . #5#)
                   (LETT |lp| (CDR |lp|) . #5#)
                   (LETT |base|
                         (SPADCALL |p| (|SPADfirst| |lp|) (QREFELT $ 117))
                         . #5#)
                   (LETT |top| (CDR |lp|) . #5#)
                   (SEQ G190 (COND ((NULL (NULL (NULL |top|))) (GO G191)))
                        (SEQ (LETT |p| (|SPADfirst| |top|) . #5#)
                             (LETT |base| (SPADCALL |base| |p| (QREFELT $ 120))
                                   . #5#)
                             (EXIT (LETT |top| (CDR |top|) . #5#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |base|)))))))) 

(SDEFUN |PSETPK;removeRedundantFactors;LPL;44|
        ((|lp| |List| P) (|a| P) ($ |List| P))
        (SPROG
         ((|toSave| (|List| P)) (|e| (P)) (|rrf| (|List| P)) (|d| (P))
          (|toSee| (|List| P)) (|c| (P)) (|#G111| (P)) (|#G110| (P))
          (|#G109| (P)) (|#G108| (P)) (|b| (P)))
         (SEQ
          (LETT |lp| (SPADCALL (ELT $ 23) |lp| (QREFELT $ 43))
                . #1=(|PSETPK;removeRedundantFactors;LPL;44|))
          (LETT |lp| (SPADCALL (ELT $ 14) |lp| (QREFELT $ 16)) . #1#)
          (EXIT
           (COND ((SPADCALL |a| (QREFELT $ 23)) |lp|) ((NULL |lp|) (LIST |a|))
                 ('T
                  (SEQ (LETT |toSee| |lp| . #1#) (LETT |toSave| NIL . #1#)
                       (SEQ G190
                            (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                            (SEQ (LETT |b| (|SPADfirst| |toSee|) . #1#)
                                 (LETT |toSee| (CDR |toSee|) . #1#)
                                 (COND
                                  ((SPADCALL |b| |a| (QREFELT $ 14))
                                   (PROGN
                                    (LETT |#G108| |b| . #1#)
                                    (LETT |#G109| |a| . #1#)
                                    (LETT |c| |#G108| . #1#)
                                    (LETT |d| |#G109| . #1#)))
                                  ('T
                                   (PROGN
                                    (LETT |#G110| |a| . #1#)
                                    (LETT |#G111| |b| . #1#)
                                    (LETT |c| |#G110| . #1#)
                                    (LETT |d| |#G111| . #1#))))
                                 (LETT |rrf| (SPADCALL |c| |d| (QREFELT $ 117))
                                       . #1#)
                                 (EXIT
                                  (COND
                                   ((NULL |rrf|)
                                    (|error|
                                     "in removeRedundantFactors : (LP,P) -> LP from PSETPK"))
                                   ('T
                                    (SEQ (LETT |c| (|SPADfirst| |rrf|) . #1#)
                                         (LETT |rrf| (CDR |rrf|) . #1#)
                                         (COND
                                          ((NULL |rrf|)
                                           (COND
                                            ((SPADCALL |c| |b| (QREFELT $ 65))
                                             (SEQ
                                              (LETT |toSave|
                                                    (SPADCALL |toSave| |toSee|
                                                              (QREFELT $ 66))
                                                    . #1#)
                                              (LETT |a| |b| . #1#)
                                              (EXIT (LETT |toSee| NIL . #1#))))
                                            ('T
                                             (SEQ (LETT |a| |c| . #1#)
                                                  (LETT |toSee|
                                                        (SPADCALL |toSave|
                                                                  |toSee|
                                                                  (QREFELT $
                                                                           66))
                                                        . #1#)
                                                  (EXIT
                                                   (LETT |toSave| NIL
                                                         . #1#))))))
                                          ('T
                                           (SEQ
                                            (LETT |d| (|SPADfirst| |rrf|)
                                                  . #1#)
                                            (LETT |rrf| (CDR |rrf|) . #1#)
                                            (EXIT
                                             (COND
                                              ((NULL |rrf|)
                                               (COND
                                                ((SPADCALL |c| |b|
                                                           (QREFELT $ 65))
                                                 (SEQ
                                                  (LETT |toSave|
                                                        (SPADCALL |toSave|
                                                                  (LIST |b|)
                                                                  (QREFELT $
                                                                           66))
                                                        . #1#)
                                                  (EXIT (LETT |a| |d| . #1#))))
                                                ((SPADCALL |d| |b|
                                                           (QREFELT $ 65))
                                                 (SEQ
                                                  (LETT |toSave|
                                                        (SPADCALL |toSave|
                                                                  (LIST |b|)
                                                                  (QREFELT $
                                                                           66))
                                                        . #1#)
                                                  (EXIT (LETT |a| |c| . #1#))))
                                                ('T
                                                 (SEQ
                                                  (LETT |toSave|
                                                        (SPADCALL |toSave| |c|
                                                                  (QREFELT $
                                                                           120))
                                                        . #1#)
                                                  (EXIT
                                                   (LETT |a| |d| . #1#))))))
                                              ('T
                                               (SEQ
                                                (LETT |e| (|SPADfirst| |rrf|)
                                                      . #1#)
                                                (COND
                                                 ((NULL (NULL (CDR |rrf|)))
                                                  (EXIT
                                                   (|error|
                                                    "in removeRedundantFactors:(LP,P)->LP from PSETPK"))))
                                                (LETT |toSave|
                                                      (SPADCALL |toSave| |c|
                                                                (QREFELT $
                                                                         120))
                                                      . #1#)
                                                (LETT |toSave|
                                                      (SPADCALL |toSave| |d|
                                                                (QREFELT $
                                                                         120))
                                                      . #1#)
                                                (EXIT
                                                 (LETT |a| |e| . #1#)))))))))
                                         (EXIT
                                          (COND
                                           ((NULL |toSee|)
                                            (LETT |toSave|
                                                  (SPADCALL (ELT $ 14)
                                                            (CONS |a| |toSave|)
                                                            (QREFELT $ 16))
                                                  . #1#)))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |toSave|)))))))) 

(DECLAIM (NOTINLINE |PolynomialSetUtilitiesPackage;|)) 

(DEFUN |PolynomialSetUtilitiesPackage| (&REST #1=#:G1203)
  (SPROG NIL
         (PROG (#2=#:G1204)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialSetUtilitiesPackage|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialSetUtilitiesPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PolynomialSetUtilitiesPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialSetUtilitiesPackage|)))))))))) 

(DEFUN |PolynomialSetUtilitiesPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialSetUtilitiesPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|PolynomialSetUtilitiesPackage| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 121) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|)))
                                        (|HasCategory| |#1| '(|GcdDomain|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|PolynomialSetUtilitiesPackage|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|HasCategory| |#1| '(|CharacteristicZero|))
        (PROGN
         (QSETREFV $ 97
                   (CONS (|dispatchFunction| |PSETPK;irreducibleFactors;2L;26|)
                         $))
         (QSETREFV $ 98
                   (CONS
                    (|dispatchFunction| |PSETPK;lazyIrreducibleFactors;2L;27|)
                    $))
         (QSETREFV $ 99
                   (CONS
                    (|dispatchFunction|
                     |PSETPK;removeIrreducibleRedundantFactors;3L;28|)
                    $)))))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 102
                 (CONS (|dispatchFunction| |PSETPK;squareFreeFactors;PL;29|)
                       $))
       (QSETREFV $ 105
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;univariatePolynomialsGcds;LBL;30|)
                  $))
       (QSETREFV $ 106
                 (CONS
                  (|dispatchFunction| |PSETPK;univariatePolynomialsGcds;2L;31|)
                  $))
       (QSETREFV $ 108
                 (CONS (|dispatchFunction| |PSETPK;removeSquaresIfCan;2L;32|)
                       $))
       (QSETREFV $ 109
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;33|)
                  $))
       (QSETREFV $ 113
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;removeRoughlyRedundantFactorsInContents;3L;34|)
                  $))
       (QSETREFV $ 115
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;removeRedundantFactorsInContents;3L;35|)
                  $))
       (QSETREFV $ 116
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;removeRedundantFactorsInPols;3L;36|)
                  $))
       (QSETREFV $ 118
                 (CONS
                  (|dispatchFunction| |PSETPK;removeRedundantFactors;2PL;37|)
                  $))
       (QSETREFV $ 117
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;unprotectedRemoveRedundantFactors;2PL;38|)
                  $))))
     ('T
      (PROGN
       (QSETREFV $ 108
                 (CONS (|dispatchFunction| |PSETPK;removeSquaresIfCan;2L;39|)
                       $))
       (QSETREFV $ 109
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;40|)
                  $))
       (QSETREFV $ 118
                 (CONS
                  (|dispatchFunction| |PSETPK;removeRedundantFactors;2PL;41|)
                  $))
       (QSETREFV $ 117
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;unprotectedRemoveRedundantFactors;2PL;42|)
                  $)))))
    $))) 

(MAKEPROP '|PolynomialSetUtilitiesPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |primPartElseUnitCanonical|)
              (|List| 9) (5 . |removeDuplicates|) (|Boolean|)
              (10 . |infRittWu?|) (|Mapping| 13 9 9) (16 . |sort|)
              (|Record| (|:| |goodPols| 11) (|:| |badPols| 11))
              (|Mapping| 13 9) |PSETPK;selectPolynomials;MLR;2| (|List| 18)
              |PSETPK;selectOrPolynomials;LLR;3|
              |PSETPK;selectAndPolynomials;LLR;4| (22 . |ground?|)
              (|NonNegativeInteger|) (27 . |mdeg|) (32 . |One|)
              |PSETPK;linear?;PB;5| |PSETPK;linearPolynomials;LR;6|
              (36 . |init|) (41 . |tail|) (46 . |mvar|) (51 . =)
              |PSETPK;univariate?;PB;7| |PSETPK;univariatePolynomials;LR;8|
              |PSETPK;bivariate?;PB;9| (57 . >) (63 . <) (69 . |degree|)
              |PSETPK;bivariatePolynomials;LR;10| (75 . |quasiMonic?|)
              |PSETPK;quasiMonicPolynomials;LR;11| (80 . |zero?|)
              (85 . |remove|) (|Union| $ '"failed") (91 . |exquo|)
              (97 . |unitCanonical|) (102 . |One|)
              |PSETPK;removeRoughlyRedundantFactorsInPols;2LBL;12|
              |PSETPK;removeRoughlyRedundantFactorsInPol;PLP;13|
              |PSETPK;removeRoughlyRedundantFactorsInPols;3L;14|
              |PSETPK;certainlySubVariety?;2LB;16| (|List| 11)
              |PSETPK;possiblyNewVariety?;LLB;15|
              (|GeneralPolynomialSet| 6 7 8 9) (106 . |construct|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (111 . |remainder|) (|List| 8) (117 . |variables|)
              (122 . |concat|) (128 . |removeDuplicates|) (133 . >)
              |PSETPK;probablyZeroDim?;LB;17| (139 . |supRittWu?|)
              (145 . |associates?|) (151 . |concat|) |PSETPK;interReduce;2L;18|
              (|Record| (|:| |bas| $) (|:| |top| 11)) (|Union| 68 '"failed")
              (|GeneralTriangularSet| 6 7 8 9) (157 . |basicSet|)
              (|Record| (|:| |bas| 70) (|:| |top| 11)) (|Union| 72 '"failed")
              |PSETPK;roughBasicSet;LU;20| (163 . |empty?|) (168 . |members|)
              (173 . |rewriteIdealWithRemainder|) (179 . =)
              (185 . |infRittWu?|) |PSETPK;crushedSet;2L;22| (191 . |any?|)
              (197 . |empty|) (201 . |basicSet|) (|Mapping| 9 9 9)
              (208 . |rewriteSetWithReduction|)
              |PSETPK;rewriteSetByReducingWithParticularGenerators;LMMML;23|
              (|Mapping| 11 11) |PSETPK;removeRedundantFactors;2LML;24|
              |PSETPK;removeRedundantFactors;2L;43|
              |PSETPK;removeRedundantFactors;3L;25| (|Factored| 9)
              (|MultivariateFactorize| 8 7 6 9) (216 . |factor|)
              (|Record| (|:| |factor| 9) (|:| |exponent| (|Integer|)))
              (|List| 94) (221 . |factors|) (226 . |irreducibleFactors|)
              (231 . |lazyIrreducibleFactors|)
              (236 . |removeIrreducibleRedundantFactors|) (|Factored| $)
              (242 . |squareFree|) (247 . |squareFreeFactors|) (|List| $)
              (252 . |gcd|) (257 . |univariatePolynomialsGcds|)
              (263 . |univariatePolynomialsGcds|) (268 . |squareFreePart|)
              (273 . |removeSquaresIfCan|)
              (278 . |rewriteIdealWithQuasiMonicGenerators|)
              (285 . |mainContent|) (290 . <=) (296 . *)
              (302 . |removeRoughlyRedundantFactorsInContents|) (308 . |gcd|)
              (314 . |removeRedundantFactorsInContents|)
              (320 . |removeRedundantFactorsInPols|)
              (326 . |unprotectedRemoveRedundantFactors|)
              (332 . |removeRedundantFactors|) (338 . |size?|)
              |PSETPK;removeRedundantFactors;LPL;44|)
           '#(|unprotectedRemoveRedundantFactors| 344
              |univariatePolynomialsGcds| 350 |univariatePolynomials| 361
              |univariate?| 366 |squareFreeFactors| 371 |selectPolynomials| 376
              |selectOrPolynomials| 382 |selectAndPolynomials| 388
              |roughBasicSet| 394
              |rewriteSetByReducingWithParticularGenerators| 399
              |rewriteIdealWithQuasiMonicGenerators| 407 |removeSquaresIfCan|
              414 |removeRoughlyRedundantFactorsInPols| 419
              |removeRoughlyRedundantFactorsInPol| 432
              |removeRoughlyRedundantFactorsInContents| 438
              |removeRedundantFactorsInPols| 444
              |removeRedundantFactorsInContents| 450 |removeRedundantFactors|
              456 |removeIrreducibleRedundantFactors| 486
              |quasiMonicPolynomials| 492 |probablyZeroDim?| 497
              |possiblyNewVariety?| 502 |linearPolynomials| 508 |linear?| 513
              |lazyIrreducibleFactors| 518 |irreducibleFactors| 523
              |interReduce| 528 |crushedSet| 533 |certainlySubVariety?| 538
              |bivariatePolynomials| 544 |bivariate?| 549)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 120
                                                 '(1 9 0 0 10 1 11 0 0 12 2 9
                                                   13 0 0 14 2 11 0 15 0 16 1 9
                                                   13 0 23 1 9 24 0 25 0 6 0 26
                                                   1 9 0 0 29 1 9 0 0 30 1 9 8
                                                   0 31 2 8 13 0 0 32 2 8 13 0
                                                   0 36 2 8 13 0 0 37 2 9 24 0
                                                   8 38 1 9 13 0 40 1 9 13 0 42
                                                   2 11 0 18 0 43 2 9 44 0 0 45
                                                   1 9 0 0 46 0 9 0 47 1 54 0
                                                   11 55 2 54 56 9 0 57 1 9 58
                                                   0 59 2 58 0 0 0 60 1 58 0 0
                                                   61 2 24 13 0 0 62 2 9 13 0 0
                                                   64 2 9 13 0 0 65 2 11 0 0 0
                                                   66 2 70 69 11 15 71 1 70 13
                                                   0 75 1 70 11 0 76 2 70 11 11
                                                   0 77 2 9 13 0 0 78 2 70 13 0
                                                   0 79 2 11 13 18 0 81 0 70 0
                                                   82 3 70 69 11 18 15 83 4 70
                                                   11 11 0 84 15 85 1 92 91 9
                                                   93 1 91 95 0 96 1 0 11 11 97
                                                   1 0 11 11 98 2 0 11 11 11 99
                                                   1 9 100 0 101 1 0 11 9 102 1
                                                   9 0 103 104 2 0 11 11 13 105
                                                   1 0 11 11 106 1 9 0 0 107 1
                                                   0 11 11 108 3 0 11 11 15 84
                                                   109 1 9 0 0 110 2 8 13 0 0
                                                   111 2 9 0 0 0 112 2 0 11 11
                                                   11 113 2 9 0 0 0 114 2 0 11
                                                   11 11 115 2 0 11 11 11 116 2
                                                   0 11 9 9 117 2 0 11 9 9 118
                                                   2 11 13 0 24 119 2 0 11 9 9
                                                   117 1 2 11 11 106 2 2 11 11
                                                   13 105 1 0 17 11 34 1 0 13 9
                                                   33 1 2 11 9 102 2 0 17 18 11
                                                   19 2 0 17 20 11 21 2 0 17 20
                                                   11 22 1 0 73 11 74 4 0 11 11
                                                   18 15 84 86 3 0 11 11 15 84
                                                   109 1 0 11 11 108 3 0 11 11
                                                   11 13 48 2 0 11 11 11 50 2 0
                                                   9 9 11 49 2 2 11 11 11 113 2
                                                   2 11 11 11 116 2 2 11 11 11
                                                   115 2 0 11 9 9 118 1 0 11 11
                                                   89 2 0 11 11 11 90 2 0 11 11
                                                   9 120 3 0 11 11 11 87 88 2 1
                                                   11 11 11 99 1 0 17 11 41 1 0
                                                   13 11 63 2 0 13 11 52 53 1 0
                                                   17 11 28 1 0 13 9 27 1 1 11
                                                   11 98 1 1 11 11 97 1 0 11 11
                                                   67 1 0 11 11 80 2 0 13 11 11
                                                   51 1 0 17 11 39 1 0 13 9
                                                   35)))))
           '|lookupComplete|)) 
