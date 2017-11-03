
(SDEFUN |FMONOID;One;$;1| (($ $)) (SPADCALL (QREFELT $ 9))) 

(SDEFUN |FMONOID;one?;$B;2| ((|f| $) ($ |Boolean|))
        (NULL (SPADCALL |f| (QREFELT $ 12)))) 

(SDEFUN |FMONOID;coerce;$Of;3| ((|f| $) ($ |OutputForm|))
        (SPADCALL |f| (ELT $ 16) (ELT $ 17) 1 (QREFELT $ 20))) 

(SDEFUN |FMONOID;hcrf;3$;4| ((|f| $) (|g| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT $ 22)) (SPADCALL |g| (QREFELT $ 22))
                   (QREFELT $ 23))
         (QREFELT $ 24))) 

(SDEFUN |FMONOID;*;$S$;5| ((|f| $) (|s| S) ($ $))
        (SPADCALL |f| |s| (QREFELT $ 26))) 

(SDEFUN |FMONOID;*;S2$;6| ((|s| S) (|f| $) ($ $))
        (SPADCALL |s| |f| (QREFELT $ 28))) 

(SDEFUN |FMONOID;factors;$L;7|
        ((|f| $)
         ($ |List|
          (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
        (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 30))) 

(SDEFUN |FMONOID;mapExpon;M2$;8|
        ((|f| |Mapping| (|NonNegativeInteger|) (|NonNegativeInteger|)) (|x| $)
         ($ $))
        (SPADCALL |f| |x| (QREFELT $ 33))) 

(SDEFUN |FMONOID;mapGen;M2$;9| ((|f| |Mapping| S S) (|x| $) ($ $))
        (SPADCALL |f| |x| (QREFELT $ 36))) 

(SDEFUN |FMONOID;^;SNni$;10| ((|s| S) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |s| |n| (QREFELT $ 39))) 

(SDEFUN |FMONOID;*;3$;11| ((|f| $) (|g| $) ($ $))
        (SPROG
         ((|h|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|ls| (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))
          (|lf|
           #1=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|lg| #1#))
         (SEQ
          (COND ((SPADCALL |f| (|spadConstant| $ 7) (QREFELT $ 41)) |g|)
                ((SPADCALL |g| (|spadConstant| $ 7) (QREFELT $ 41)) |f|)
                (#2='T
                 (SEQ
                  (LETT |lg| (SPADCALL |g| (QREFELT $ 12))
                        . #3=(|FMONOID;*;3$;11|))
                  (LETT |ls|
                        (SPADCALL
                         (LETT |lf| (SPADCALL |f| (QREFELT $ 12)) . #3#)
                         (QREFELT $ 42))
                        . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR |ls|) (QCAR (|SPADfirst| |lg|))
                               (QREFELT $ 43))
                     (SEQ
                      (SPADCALL (LETT |h| (SPADCALL |lf| (QREFELT $ 30)) . #3#)
                                (CONS (QCAR (|SPADfirst| |lg|))
                                      (+ (QCDR (|SPADfirst| |lg|))
                                         (QCDR |ls|)))
                                (QREFELT $ 44))
                      (EXIT
                       (SPADCALL (SPADCALL |h| (CDR |lg|) (QREFELT $ 45))
                                 (QREFELT $ 46)))))
                    (#2#
                     (SPADCALL (SPADCALL |lf| |lg| (QREFELT $ 45))
                               (QREFELT $ 46))))))))))) 

(SDEFUN |FMONOID;overlap;2$R;12|
        ((|la| $) (|ar| $) ($ |Record| (|:| |lm| $) (|:| |mm| $) (|:| |rm| $)))
        (SPROG
         ((|lla|
           #1=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|l|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (#2=#:G793 NIL)
          (|m|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (#3=#:G781 NIL) (|ru| (|Union| $ "failed")) (#4=#:G775 NIL)
          (|lar| #1#) (|la0| #1#))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |la| (|spadConstant| $ 7) (QREFELT $ 41))
                 (SPADCALL |ar| (|spadConstant| $ 7) (QREFELT $ 41)))
             (VECTOR |la| (|spadConstant| $ 7) |ar|))
            ('T
             (SEQ
              (LETT |lla|
                    (LETT |la0| (SPADCALL |la| (QREFELT $ 12))
                          . #5=(|FMONOID;overlap;2$R;12|))
                    . #5#)
              (LETT |lar| (SPADCALL |ar| (QREFELT $ 12)) . #5#)
              (LETT |l| NIL . #5#)
              (SEQ G190 (COND ((NULL (NULL (NULL |lla|))) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL (QCAR (|SPADfirst| |lla|))
                                (QCAR (|SPADfirst| |lar|)) (QREFELT $ 43))
                      (SEQ
                       (COND
                        ((< (QCDR (|SPADfirst| |lla|))
                            (QCDR (|SPADfirst| |lar|)))
                         (COND
                          ((NULL (CDR |lla|))
                           (PROGN
                            (LETT #2#
                                  (VECTOR (SPADCALL |l| (QREFELT $ 46))
                                          (SPADCALL (QCAR (|SPADfirst| |lla|))
                                                    (QCDR (|SPADfirst| |lla|))
                                                    (QREFELT $ 39))
                                          (SPADCALL
                                           (CONS
                                            (CONS (QCAR (|SPADfirst| |lar|))
                                                  (PROG1
                                                      (LETT #4#
                                                            (-
                                                             (QCDR
                                                              (|SPADfirst|
                                                               |lar|))
                                                             (QCDR
                                                              (|SPADfirst|
                                                               |lla|)))
                                                            . #5#)
                                                    (|check_subtype2|
                                                     (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #4#)))
                                            (CDR |lar|))
                                           (QREFELT $ 46)))
                                  . #5#)
                            (GO #6=#:G792))))))
                       (EXIT
                        (COND
                         ((>= (QCDR (|SPADfirst| |lla|))
                              (QCDR (|SPADfirst| |lar|)))
                          (SEQ
                           (LETT |ru|
                                 (SPADCALL
                                  (SPADCALL (CDR |lar|) (QREFELT $ 46))
                                  (SPADCALL (CDR |lla|) (QREFELT $ 46))
                                  (QREFELT $ 49))
                                 . #5#)
                           (EXIT
                            (COND
                             ((QEQCAR |ru| 0)
                              (SEQ
                               (COND
                                ((SPADCALL (QCDR (|SPADfirst| |lla|))
                                           (QCDR (|SPADfirst| |lar|))
                                           (QREFELT $ 50))
                                 (SEQ
                                  (LETT |l|
                                        (SPADCALL |l|
                                                  (CONS
                                                   (QCAR (|SPADfirst| |lla|))
                                                   (PROG1
                                                       (LETT #3#
                                                             (-
                                                              (QCDR
                                                               (|SPADfirst|
                                                                |lla|))
                                                              (QCDR
                                                               (|SPADfirst|
                                                                |lar|)))
                                                             . #5#)
                                                     (|check_subtype2|
                                                      (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#)))
                                                  (QREFELT $ 51))
                                        . #5#)
                                  (EXIT
                                   (LETT |m|
                                         (CONS
                                          (CONS (QCAR (|SPADfirst| |lla|))
                                                (QCDR (|SPADfirst| |lar|)))
                                          (CDR |lla|))
                                         . #5#))))
                                ('T (LETT |m| |lla| . #5#)))
                               (EXIT
                                (PROGN
                                 (LETT #2#
                                       (VECTOR (SPADCALL |l| (QREFELT $ 46))
                                               (SPADCALL |m| (QREFELT $ 46))
                                               (QCDR |ru|))
                                       . #5#)
                                 (GO #6#))))))))))))))
                    (LETT |l| (SPADCALL |l| (|SPADfirst| |lla|) (QREFELT $ 51))
                          . #5#)
                    (EXIT (LETT |lla| (CDR |lla|) . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR (SPADCALL |la0| (QREFELT $ 46)) (|spadConstant| $ 7)
                       (SPADCALL |lar| (QREFELT $ 46))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |FMONOID;divide;2$U;13|
        ((|lar| $) (|a| $)
         ($ |Union| (|Record| (|:| |lm| $) (|:| |rm| $)) "failed"))
        (SPROG
         ((|Nlar| (|Integer|))
          (|llar|
           #1=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|l|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (#2=#:G818 NIL) (#3=#:G819 NIL) (#4=#:G804 NIL)
          (|q| (|Union| $ "failed")) (|Na| (|Integer|)) (|la| #1#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |a| (|spadConstant| $ 7) (QREFELT $ 41))
             (CONS 0 (CONS |lar| (|spadConstant| $ 7))))
            ('T
             (SEQ
              (LETT |Na|
                    (LENGTH
                     (LETT |la| (SPADCALL |a| (QREFELT $ 12))
                           . #5=(|FMONOID;divide;2$U;13|)))
                    . #5#)
              (LETT |Nlar|
                    (LENGTH
                     (LETT |llar| (SPADCALL |lar| (QREFELT $ 12)) . #5#))
                    . #5#)
              (LETT |l| NIL . #5#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |Na| |Nlar| (QREFELT $ 54))) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (COND
                       ((SPADCALL (QCAR (|SPADfirst| |llar|))
                                  (QCAR (|SPADfirst| |la|)) (QREFELT $ 43))
                        (COND
                         ((>= (QCDR (|SPADfirst| |llar|))
                              (QCDR (|SPADfirst| |la|)))
                          (SEQ
                           (LETT |q|
                                 (SPADCALL
                                  (SPADCALL (CDR |llar|) (QREFELT $ 46))
                                  (SPADCALL (CDR |la|) (QREFELT $ 46))
                                  (QREFELT $ 49))
                                 . #5#)
                           (EXIT
                            (COND
                             ((QEQCAR |q| 0)
                              (PROGN
                               (LETT #2#
                                     (SEQ
                                      (COND
                                       ((SPADCALL (QCDR (|SPADfirst| |llar|))
                                                  (QCDR (|SPADfirst| |la|))
                                                  (QREFELT $ 50))
                                        (LETT |l|
                                              (SPADCALL |l|
                                                        (CONS
                                                         (QCAR
                                                          (|SPADfirst| |la|))
                                                         (PROG1
                                                             (LETT #4#
                                                                   (-
                                                                    (QCDR
                                                                     (|SPADfirst|
                                                                      |llar|))
                                                                    (QCDR
                                                                     (|SPADfirst|
                                                                      |la|)))
                                                                   . #5#)
                                                           (|check_subtype2|
                                                            (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#)))
                                                        (QREFELT $ 51))
                                              . #5#)))
                                      (EXIT
                                       (PROGN
                                        (LETT #3#
                                              (CONS 0
                                                    (CONS
                                                     (SPADCALL |l|
                                                               (QREFELT $ 46))
                                                     (QCDR |q|)))
                                              . #5#)
                                        (GO #6=#:G817))))
                                     . #5#)
                               (GO #7=#:G810))))))))))
                      (LETT |l|
                            (SPADCALL |l| (|SPADfirst| |llar|) (QREFELT $ 51))
                            . #5#)
                      (LETT |llar| (CDR |llar|) . #5#)
                      (EXIT (LETT |Nlar| (- |Nlar| 1) . #5#))))
                    #7# (EXIT #2#))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 1 "failed"))))))
          #6# (EXIT #3#)))) 

(SDEFUN |FMONOID;hclf;3$;14| ((|f| $) (|g| $) ($ $))
        (SPROG
         ((#1=#:G826 NIL) (#2=#:G827 NIL)
          (|h|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (#3=#:G828 NIL) (|f0| NIL) (#4=#:G829 NIL) (|g0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |h| NIL . #5=(|FMONOID;hclf;3$;14|))
                (SEQ (LETT |g0| NIL . #5#)
                     (LETT #4# (SPADCALL |g| (QREFELT $ 12)) . #5#)
                     (LETT |f0| NIL . #5#)
                     (LETT #3# (SPADCALL |f| (QREFELT $ 12)) . #5#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |f0| (CAR #3#) . #5#) NIL)
                           (ATOM #4#) (PROGN (LETT |g0| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QCAR |f0|) (QCAR |g0|) (QREFELT $ 58))
                         (PROGN
                          (LETT #2# (SPADCALL |h| (QREFELT $ 46)) . #5#)
                          (GO #6=#:G825)))
                        ('T
                         (SEQ
                          (EXIT
                           (SEQ
                            (LETT |h|
                                  (SPADCALL |h|
                                            (CONS (QCAR |f0|)
                                                  (MIN (QCDR |f0|)
                                                       (QCDR |g0|)))
                                            (QREFELT $ 51))
                                  . #5#)
                            (EXIT
                             (COND
                              ((SPADCALL (QCDR |f0|) (QCDR |g0|)
                                         (QREFELT $ 59))
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# (SPADCALL |h| (QREFELT $ 46))
                                             . #5#)
                                       (GO #6#))
                                      . #5#)
                                (GO #7=#:G821)))))))
                          #7# (EXIT #1#))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#))
                           . #5#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |h| (QREFELT $ 46)))))
          #6# (EXIT #2#)))) 

(SDEFUN |FMONOID;lquo;2$U;15| ((|aq| $) (|a| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G837 NIL)
          (|laq|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (#2=#:G844 NIL) (#3=#:G845 NIL) (|a0| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |a| (QREFELT $ 60))
                       (LENGTH
                        (LETT |laq|
                              (SPADCALL (SPADCALL |aq| (QREFELT $ 12))
                                        (QREFELT $ 30))
                              . #4=(|FMONOID;lquo;2$U;15|)))
                       (QREFELT $ 50))
             (CONS 1 "failed"))
            ('T
             (SEQ
              (SEQ (LETT |a0| NIL . #4#)
                   (LETT #3# (SPADCALL |a| (QREFELT $ 12)) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |a0| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR
                        (SPADCALL (QCAR |a0|) (QCAR (|SPADfirst| |laq|))
                                  (QREFELT $ 58))
                        (SPADCALL (QCDR |a0|) (QCDR (|SPADfirst| |laq|))
                                  (QREFELT $ 50)))
                       (PROGN
                        (LETT #2# (CONS 1 "failed") . #4#)
                        (GO #5=#:G843)))
                      ((EQL (QCDR |a0|) (QCDR (|SPADfirst| |laq|)))
                       (LETT |laq| (CDR |laq|) . #4#))
                      ('T
                       (SPADCALL |laq|
                                 (CONS (QCAR (|SPADfirst| |laq|))
                                       (PROG1
                                           (LETT #1#
                                                 (- (QCDR (|SPADfirst| |laq|))
                                                    (QCDR |a0|))
                                                 . #4#)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#)))
                                 (QREFELT $ 61))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 (SPADCALL |laq| (QREFELT $ 46))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FMONOID;rquo;2$U;16| ((|qa| $) (|a| $) ($ |Union| $ "failed"))
        (SPROG ((|u| (|Union| $ "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |qa| (QREFELT $ 22))
                                (SPADCALL |a| (QREFELT $ 22)) (QREFELT $ 49))
                      |FMONOID;rquo;2$U;16|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 24))))))))) 

(SDEFUN |FMONOID;lquo;$SU;17| ((|w| $) (|l| S) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G855 NIL)
          (|fx| (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))
          (|x|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |x| (SPADCALL |w| (QREFELT $ 12)) . #2=(|FMONOID;lquo;$SU;17|))
          (EXIT
           (COND ((NULL |x|) (CONS 1 "failed"))
                 (#3='T
                  (SEQ (LETT |fx| (|SPADfirst| |x|) . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL (QCAR |fx|) |l| (QREFELT $ 58))
                          (CONS 1 "failed"))
                         ((EQL (QCDR |fx|) 1)
                          (CONS 0 (SPADCALL (CDR |x|) (QREFELT $ 46))))
                         (#3#
                          (CONS 0
                                (SPADCALL
                                 (CONS
                                  (CONS (QCAR |fx|)
                                        (PROG1
                                            (LETT #1# (- (QCDR |fx|) 1) . #2#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#)))
                                  (CDR |x|))
                                 (QREFELT $ 46))))))))))))) 

(SDEFUN |FMONOID;rquo;$SU;18| ((|w| $) (|l| S) ($ |Union| $ "failed"))
        (SPROG ((|r| (|Union| $ "failed")) (|u| ($)))
               (SEQ
                (LETT |u| (SPADCALL |w| (QREFELT $ 22))
                      . #1=(|FMONOID;rquo;$SU;18|))
                (LETT |r| (SPADCALL |u| |l| (QREFELT $ 63)) . #1#)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 24))))))))) 

(SDEFUN |FMONOID;length;$Nni;19| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G872 NIL) (|f| NIL) (#2=#:G871 NIL))
               (SEQ
                (SPADCALL (ELT $ 65)
                          (PROGN
                           (LETT #2# NIL . #3=(|FMONOID;length;$Nni;19|))
                           (SEQ (LETT |f| NIL . #3#)
                                (LETT #1# (SPADCALL |x| (QREFELT $ 12)) . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #2# (CONS (QCDR |f|) #2#) . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          0 (QREFELT $ 68))))) 

(SDEFUN |FMONOID;varList1| ((|x| $) ($ |List| S))
        (SPROG ((|le| (|List| S)) (#1=#:G878 NIL) (|t| NIL) (#2=#:G877 NIL))
               (SEQ
                (LETT |le|
                      (PROGN
                       (LETT #2# NIL . #3=(|FMONOID;varList1|))
                       (SEQ (LETT |t| NIL . #3#)
                            (LETT #1# (SPADCALL |x| (QREFELT $ 12)) . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #2# (CONS (QCAR |t|) #2#) . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT (SPADCALL |le| (QREFELT $ 71)))))) 

(SDEFUN |FMONOID;varList;$L;21| ((|x| $) ($ |List| S))
        (SPADCALL (|FMONOID;varList1| |x| $) (QREFELT $ 72))) 

(SDEFUN |FMONOID;varList;$L;22| ((|x| $) ($ |List| S))
        (|FMONOID;varList1| |x| $)) 

(SDEFUN |FMONOID;first;$S;23| ((|w| $) ($ S))
        (SPROG
         ((|x|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))))
         (SEQ (LETT |x| (SPADCALL |w| (QREFELT $ 12)) |FMONOID;first;$S;23|)
              (EXIT
               (COND ((NULL |x|) (|error| "empty word !!!"))
                     ('T (QCAR (|SPADfirst| |x|)))))))) 

(SDEFUN |FMONOID;rest;2$;24| ((|w| $) ($ $))
        (SPROG
         ((#1=#:G885 NIL)
          (|fx| (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))
          (|x|
           (|List|
            (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |x| (SPADCALL |w| (QREFELT $ 12)) . #2=(|FMONOID;rest;2$;24|))
          (EXIT
           (COND ((NULL |x|) (|error| "empty word !!!"))
                 (#3='T
                  (SEQ (LETT |fx| (|SPADfirst| |x|) . #2#)
                       (EXIT
                        (COND
                         ((EQL (QCDR |fx|) 1)
                          (SPADCALL (CDR |x|) (QREFELT $ 46)))
                         (#3#
                          (SPADCALL
                           (CONS
                            (CONS (QCAR |fx|)
                                  (PROG1 (LETT #1# (- (QCDR |fx|) 1) . #2#)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#)))
                            (CDR |x|))
                           (QREFELT $ 46)))))))))))) 

(SDEFUN |FMONOID;mirror;2$;25| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 22))) 

(SDEFUN |FMONOID;lexico;2$B;26| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((|la|
           #1=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|lb| #1#) (#2=#:G898 NIL) (#3=#:G895 NIL) (#4=#:G908 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |la| (SPADCALL |a| (QREFELT $ 12))
                  . #5=(|FMONOID;lexico;2$B;26|))
            (LETT |lb| (SPADCALL |b| (QREFELT $ 12)) . #5#)
            (SEQ G190
                 (COND
                  ((NULL (COND ((NULL |la|) NIL) ('T (NULL (NULL |lb|)))))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR (|SPADfirst| |la|))
                               (QCAR (|SPADfirst| |lb|)) (QREFELT $ 77))
                     (PROGN (LETT #4# NIL . #5#) (GO #6=#:G907)))
                    ((SPADCALL (QCAR (|SPADfirst| |la|))
                               (QCAR (|SPADfirst| |lb|)) (QREFELT $ 78))
                     (PROGN (LETT #4# 'T . #5#) (GO #6#)))
                    ((EQL (QCDR (|SPADfirst| |la|)) (QCDR (|SPADfirst| |lb|)))
                     (SEQ (LETT |la| (CDR |la|) . #5#)
                          (EXIT (LETT |lb| (CDR |lb|) . #5#))))
                    ((SPADCALL (QCDR (|SPADfirst| |la|))
                               (QCDR (|SPADfirst| |lb|)) (QREFELT $ 50))
                     (SEQ
                      (LETT |la|
                            (CONS
                             (CONS (QCAR (|SPADfirst| |la|))
                                   (PROG1
                                       (LETT #3#
                                             (- (QCDR (|SPADfirst| |la|))
                                                (QCDR (|SPADfirst| |lb|)))
                                             . #5#)
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#)))
                             (CDR |lb|))
                            . #5#)
                      (EXIT (LETT |lb| (CDR |lb|) . #5#))))
                    ('T
                     (SEQ
                      (LETT |lb|
                            (CONS
                             (CONS (QCAR (|SPADfirst| |lb|))
                                   (PROG1
                                       (LETT #2#
                                             (- (QCDR (|SPADfirst| |lb|))
                                                (QCDR (|SPADfirst| |la|)))
                                             . #5#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#)))
                             (CDR |la|))
                            . #5#)
                      (EXIT (LETT |la| (CDR |la|) . #5#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (COND ((NULL |la|) (NULL (NULL |lb|))) ('T NIL)))))
          #6# (EXIT #4#)))) 

(SDEFUN |FMONOID;<;2$B;27| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((|lb| #1=(|NonNegativeInteger|)) (|la| #1#))
               (SEQ
                (LETT |la| (SPADCALL |a| (QREFELT $ 69))
                      . #2=(|FMONOID;<;2$B;27|))
                (LETT |lb| (SPADCALL |b| (QREFELT $ 69)) . #2#)
                (EXIT
                 (COND ((EQL |la| |lb|) (SPADCALL |a| |b| (QREFELT $ 79)))
                       ('T (< |la| |lb|))))))) 

(SDEFUN |FMONOID;smaller?;2$B;28| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((|na| (|Integer|))
          (|la|
           #1=(|List|
               (|Record| (|:| |gen| S) (|:| |exp| (|NonNegativeInteger|)))))
          (|lb| #1#) (#2=#:G919 NIL) (|nb| (|Integer|)) (#3=#:G916 NIL)
          (#4=#:G929 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |la| (SPADCALL |a| (QREFELT $ 12))
                  . #5=(|FMONOID;smaller?;2$B;28|))
            (LETT |lb| (SPADCALL |b| (QREFELT $ 12)) . #5#)
            (LETT |na| (LENGTH |la|) . #5#) (LETT |nb| (LENGTH |lb|) . #5#)
            (SEQ G190
                 (COND
                  ((NULL
                    (COND
                     ((SPADCALL |na| 0 (QREFELT $ 81))
                      (SPADCALL |nb| 0 (QREFELT $ 81)))
                     ('T NIL)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR (|SPADfirst| |lb|))
                               (QCAR (|SPADfirst| |la|)) (QREFELT $ 82))
                     (PROGN (LETT #4# NIL . #5#) (GO #6=#:G928)))
                    ((SPADCALL (QCAR (|SPADfirst| |la|))
                               (QCAR (|SPADfirst| |lb|)) (QREFELT $ 82))
                     (PROGN (LETT #4# 'T . #5#) (GO #6#)))
                    ((EQL (QCDR (|SPADfirst| |la|)) (QCDR (|SPADfirst| |lb|)))
                     (SEQ (LETT |la| (CDR |la|) . #5#)
                          (LETT |lb| (CDR |lb|) . #5#)
                          (LETT |na| (- |na| 1) . #5#)
                          (EXIT (LETT |nb| (- |nb| 1) . #5#))))
                    ((SPADCALL (QCDR (|SPADfirst| |la|))
                               (QCDR (|SPADfirst| |lb|)) (QREFELT $ 50))
                     (SEQ
                      (LETT |la|
                            (CONS
                             (CONS (QCAR (|SPADfirst| |la|))
                                   (PROG1
                                       (LETT #3#
                                             (- (QCDR (|SPADfirst| |la|))
                                                (QCDR (|SPADfirst| |lb|)))
                                             . #5#)
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#)))
                             (CDR |lb|))
                            . #5#)
                      (LETT |lb| (CDR |lb|) . #5#)
                      (EXIT (LETT |nb| (- |nb| 1) . #5#))))
                    ('T
                     (SEQ
                      (LETT |lb|
                            (CONS
                             (CONS (QCAR (|SPADfirst| |lb|))
                                   (PROG1
                                       (LETT #2#
                                             (- (QCDR (|SPADfirst| |lb|))
                                                (QCDR (|SPADfirst| |la|)))
                                             . #5#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#)))
                             (CDR |la|))
                            . #5#)
                      (LETT |la| (CDR |la|) . #5#)
                      (EXIT (LETT |na| (- |na| 1) . #5#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (COND ((NULL |la|) (NULL (NULL |lb|))) ('T NIL)))))
          #6# (EXIT #4#)))) 

(DECLAIM (NOTINLINE |FreeMonoid;|)) 

(DEFUN |FreeMonoid| (#1=#:G937)
  (SPROG NIL
         (PROG (#2=#:G938)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FreeMonoid|)
                                               '|domainEqualList|)
                    . #3=(|FreeMonoid|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FreeMonoid;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FreeMonoid|)))))))))) 

(DEFUN |FreeMonoid;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G936 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|FreeMonoid|))
          (LETT |dv$| (LIST '|FreeMonoid| DV$1) . #2#)
          (LETT $ (GETREFV 89) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|Comparable|))
                                                    . #2#)
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|OrderedSet|)))
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|FreeMonoid| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|ListMonoidOps| |#1| (|NonNegativeInteger|) 1))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (COND
              ((|testBitVector| |pv$| 1)
               (QSETREFV $ 73
                         (CONS (|dispatchFunction| |FMONOID;varList;$L;21|)
                               $)))
              ('T
               (QSETREFV $ 73
                         (CONS (|dispatchFunction| |FMONOID;varList;$L;22|)
                               $)))))))
          (COND
           ((|testBitVector| |pv$| 2)
            (COND
             ((|testBitVector| |pv$| 1)
              (PROGN
               (QSETREFV $ 79
                         (CONS (|dispatchFunction| |FMONOID;lexico;2$B;26|) $))
               (QSETREFV $ 80
                         (CONS (|dispatchFunction| |FMONOID;<;2$B;27|) $))))
             ('T
              (QSETREFV $ 83
                        (CONS (|dispatchFunction| |FMONOID;smaller?;2$B;28|)
                              $))))))
          $))) 

(MAKEPROP '|FreeMonoid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ListMonoidOps| 6 38 (NRTEVAL 1))
              (|local| |#1|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FMONOID;One;$;1|) $))
              '|Rep| (0 . |makeUnit|) (|Record| (|:| |gen| 6) (|:| |exp| 38))
              (|List| 10) (4 . |listOfMonoms|) (|Boolean|) |FMONOID;one?;$B;2|
              (|OutputForm|) (9 . *) (15 . ^) (|Mapping| 15 15 15) (|Integer|)
              (21 . |outputForm|) |FMONOID;coerce;$Of;3| (29 . |reverse|)
              |FMONOID;hclf;3$;14| (34 . |reverse!|) |FMONOID;hcrf;3$;4|
              (39 . |rightMult|) |FMONOID;*;$S$;5| (45 . |leftMult|)
              |FMONOID;*;S2$;6| (51 . |copy|) |FMONOID;factors;$L;7|
              (|Mapping| 38 38) (56 . |mapExpon|) |FMONOID;mapExpon;M2$;8|
              (|Mapping| 6 6) (62 . |mapGen|) |FMONOID;mapGen;M2$;9|
              (|NonNegativeInteger|) (68 . |makeTerm|) |FMONOID;^;SNni$;10|
              (74 . =) (80 . |last|) (85 . =) (91 . |setlast!|) (97 . |concat|)
              (103 . |makeMulti|) |FMONOID;*;3$;11| (|Union| $ '"failed")
              |FMONOID;lquo;2$U;15| (108 . >) (114 . |concat!|)
              (|Record| (|:| |lm| $) (|:| |mm| $) (|:| |rm| $))
              |FMONOID;overlap;2$R;12| (120 . <=)
              (|Record| (|:| |lm| $) (|:| |rm| $)) (|Union| 55 '"failed")
              |FMONOID;divide;2$U;13| (126 . ~=) (132 . ~=) (138 . |size|)
              (143 . |setfirst!|) |FMONOID;rquo;2$U;16| |FMONOID;lquo;$SU;17|
              |FMONOID;rquo;$SU;18| (149 . +) (|Mapping| 38 38 38) (|List| 38)
              (155 . |reduce|) |FMONOID;length;$Nni;19| (|List| 6)
              (162 . |removeDuplicates|) (167 . |sort!|) (172 . |varList|)
              |FMONOID;first;$S;23| |FMONOID;rest;2$;24| |FMONOID;mirror;2$;25|
              (177 . >) (183 . <) (189 . |lexico|) (195 . <) (201 . >)
              (207 . |smaller?|) (213 . |smaller?|) (|Union| 6 '"failed")
              (|PositiveInteger|) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 219 |varList| 225 |smaller?| 230 |size| 236 |sample| 241
              |rquo| 245 |rightRecip| 257 |rightPower| 262 |retractIfCan| 274
              |retract| 279 |rest| 284 |recip| 289 |overlap| 294 |one?| 300
              |nthFactor| 305 |nthExpon| 311 |mirror| 317 |min| 322 |max| 328
              |mapGen| 334 |mapExpon| 340 |lquo| 346 |lexico| 358 |length| 364
              |leftRecip| 369 |leftPower| 374 |latex| 386 |hcrf| 391 |hclf| 397
              |hashUpdate!| 403 |hash| 409 |first| 414 |factors| 419 |divide|
              424 |coerce| 430 ^ 440 |One| 458 >= 462 > 468 = 474 <= 480 < 486
              * 492)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(1 0 1 0 0 1 0 3 0 0 0 0 1))
                 (CONS
                  '#(NIL NIL NIL NIL |MagmaWithUnit&| |OrderedSet&| |Magma&|
                     NIL |SetCategory&| |RetractableTo&| |BasicType&| NIL
                     |PartialOrder&|)
                  (CONS
                   '#((|OrderedMonoid|) (|Monoid|) (|OrderedSemiGroup|)
                      (|SemiGroup|) (|MagmaWithUnit|) (|OrderedSet|) (|Magma|)
                      (|Comparable|) (|SetCategory|) (|RetractableTo| 6)
                      (|BasicType|) (|CoercibleTo| 15) (|PartialOrder|))
                   (|makeByteWordVec2| 88
                                       '(0 8 0 9 1 8 11 0 12 2 15 0 0 0 16 2 15
                                         0 0 0 17 4 8 15 0 18 18 19 20 1 8 0 0
                                         22 1 8 0 0 24 2 8 0 0 6 26 2 8 0 6 0
                                         28 1 11 0 0 30 2 8 0 32 0 33 2 8 0 35
                                         0 36 2 8 0 6 38 39 2 0 13 0 0 41 1 11
                                         10 0 42 2 6 13 0 0 43 2 11 10 0 10 44
                                         2 11 0 0 0 45 1 8 0 11 46 2 38 13 0 0
                                         50 2 11 0 0 10 51 2 19 13 0 0 54 2 6
                                         13 0 0 58 2 38 13 0 0 59 1 0 38 0 60 2
                                         11 10 0 10 61 2 38 0 0 0 65 3 67 38 66
                                         0 38 68 1 70 0 0 71 1 70 0 0 72 1 0 70
                                         0 73 2 6 13 0 0 77 2 6 13 0 0 78 2 0
                                         13 0 0 79 2 0 13 0 0 80 2 19 13 0 0 81
                                         2 6 13 0 0 82 2 0 13 0 0 83 2 0 13 0 0
                                         1 1 4 70 0 73 2 2 13 0 0 83 1 0 38 0
                                         60 0 0 0 1 2 0 48 0 6 64 2 0 48 0 0 62
                                         1 0 48 0 1 2 0 0 0 38 1 2 0 0 0 85 1 1
                                         0 84 0 1 1 0 6 0 1 1 0 0 0 75 1 0 48 0
                                         1 2 0 52 0 0 53 1 0 13 0 14 2 0 6 0 19
                                         1 2 0 38 0 19 1 1 0 0 0 76 2 1 0 0 0 1
                                         2 1 0 0 0 1 2 0 0 35 0 37 2 0 0 32 0
                                         34 2 0 48 0 6 63 2 0 48 0 0 49 2 1 13
                                         0 0 79 1 0 38 0 69 1 0 48 0 1 2 0 0 0
                                         38 1 2 0 0 0 85 1 1 0 87 0 1 2 0 0 0 0
                                         25 2 0 0 0 0 23 2 0 86 86 0 1 1 0 88 0
                                         1 1 0 6 0 74 1 0 11 0 31 2 0 56 0 0 57
                                         1 0 0 6 1 1 0 15 0 21 2 0 0 6 38 40 2
                                         0 0 0 38 1 2 0 0 0 85 1 0 0 0 7 2 1 13
                                         0 0 1 2 1 13 0 0 1 2 0 13 0 0 41 2 1
                                         13 0 0 1 2 1 13 0 0 80 2 0 0 0 6 27 2
                                         0 0 6 0 29 2 0 0 0 0 47)))))
           '|lookupComplete|)) 
