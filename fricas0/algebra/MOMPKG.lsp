
(SDEFUN |MOMPKG;cumulant2moment;2S;1| ((|cum| |Sequence| R) ($ |Sequence| R))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |cum| (QREFELT $ 9)) (QREFELT $ 11))
                   (QREFELT $ 12))
         (QREFELT $ 13))) 

(SDEFUN |MOMPKG;moment2cumulant;2S;2| ((|mom| |Sequence| R) ($ |Sequence| R))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |mom| (QREFELT $ 9)) (QREFELT $ 15))
                   (QREFELT $ 12))
         (QREFELT $ 13))) 

(SDEFUN |MOMPKG;freeCumulant2moment;2S;3|
        ((|cum| |Sequence| R) ($ |Sequence| R))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL (|spadConstant| $ 17) (SPADCALL |cum| (QREFELT $ 9))
                      (QREFELT $ 18))
            (QREFELT $ 20))
           (QREFELT $ 12))
          (QREFELT $ 12))
         (QREFELT $ 21))) 

(SDEFUN |MOMPKG;moment2freeCumulant;2S;4|
        ((|mom| |Sequence| R) ($ |Sequence| R))
        (SPROG
         ((#1=#:G696 NIL) (|f1| #2=(|Union| (|Stream| R) "failed"))
          (|f| (|Stream| R)) (|g1| #2#) (|g| (|Stream| R)))
         (SEQ
          (LETT |g|
                (SPADCALL (|spadConstant| $ 17) (SPADCALL |mom| (QREFELT $ 9))
                          (QREFELT $ 23))
                . #3=(|MOMPKG;moment2freeCumulant;2S;4|))
          (LETT |g1| (SPADCALL |g| (QREFELT $ 25)) . #3#)
          (LETT |f|
                (SPADCALL
                 (PROG2 (LETT #1# |g1| . #3#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6))
                                   (|Union| (|Stream| (QREFELT $ 6))
                                            #4="failed")
                                   #1#))
                 (QREFELT $ 20))
                . #3#)
          (LETT |f1| (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 25))
                . #3#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (PROG2 (LETT #1# |f1| . #3#)
                 (QCDR #1#)
               (|check_union2| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6))
                               (|Union| (|Stream| (QREFELT $ 6)) #4#) #1#))
             (QREFELT $ 12))
            (QREFELT $ 21)))))) 

(SDEFUN |MOMPKG;booleanCumulant2moment;2S;5|
        ((|x| |Sequence| R) ($ |Sequence| R))
        (SPROG
         ((#1=#:G701 NIL) (|boo| (|Union| (|Stream| R) "failed"))
          (|rec| (|Stream| R)))
         (SEQ
          (LETT |rec|
                (SPADCALL (|spadConstant| $ 17)
                          (SPADCALL (SPADCALL |x| (QREFELT $ 27))
                                    (QREFELT $ 9))
                          (QREFELT $ 23))
                . #2=(|MOMPKG;booleanCumulant2moment;2S;5|))
          (LETT |boo| (SPADCALL |rec| (QREFELT $ 25)) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (PROG2 (LETT #1# |boo| . #2#)
                 (QCDR #1#)
               (|check_union2| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6))
                               (|Union| (|Stream| (QREFELT $ 6)) "failed")
                               #1#))
             (QREFELT $ 13))
            (QREFELT $ 28)))))) 

(SDEFUN |MOMPKG;moment2booleanCumulant;2S;6|
        ((|x| |Sequence| R) ($ |Sequence| R))
        (SPROG
         ((#1=#:G706 NIL) (|mom| (|Union| (|Stream| R) "failed"))
          (|boo| (|Stream| R)))
         (SEQ
          (LETT |boo|
                (SPADCALL (|spadConstant| $ 17) (SPADCALL |x| (QREFELT $ 9))
                          (QREFELT $ 23))
                . #2=(|MOMPKG;moment2booleanCumulant;2S;6|))
          (LETT |mom| (SPADCALL |boo| (QREFELT $ 25)) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (PROG2 (LETT #1# |mom| . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6))
                                (|Union| (|Stream| (QREFELT $ 6)) "failed")
                                #1#))
              (QREFELT $ 13))
             (QREFELT $ 27))
            (QREFELT $ 28)))))) 

(SDEFUN |MOMPKG;hankelDeterminant;SNniR;7|
        ((|x| |Sequence| R) (|n| |NonNegativeInteger|) ($ R))
        (SPADCALL
         (SPADCALL
          (CONS (|spadConstant| $ 17)
                (SPADCALL |x| (SPADCALL 2 |n| (QREFELT $ 33)) (QREFELT $ 35)))
          (QREFELT $ 38))
         (QREFELT $ 39))) 

(SDEFUN |MOMPKG;moment2nthJacobi;LR;8|
        ((|mom| |List| R)
         ($ |Record| (|:| |an| (|List| R)) (|:| |bn| (|List| R))))
        (SPROG
         ((N (|Integer|)) (G (|List| R)) (#1=#:G756 NIL) (|h| NIL)
          (#2=#:G755 NIL) (H (|List| R)) (|Hk| (R)) (#3=#:G754 NIL) (|l| NIL)
          (#4=#:G753 NIL) (|k| NIL) (|bb| #5=(|List| R)) (|aa| #5#) (|bk| (R))
          (|ak| (R)))
         (SEQ (LETT N (LENGTH |mom|) . #6=(|MOMPKG;moment2nthJacobi;LR;8|))
              (LETT G |mom| . #6#) (LETT |aa| NIL . #6#) (LETT |bb| NIL . #6#)
              (SEQ G190 (COND ((NULL (SPADCALL N 1 (QREFELT $ 43))) (GO G191)))
                   (SEQ (LETT |ak| (|SPADfirst| G) . #6#)
                        (LETT |bk|
                              (SPADCALL (SPADCALL G (QREFELT $ 44))
                                        (SPADCALL |ak| |ak| (QREFELT $ 45))
                                        (QREFELT $ 46))
                              . #6#)
                        (LETT |aa| (SPADCALL |aa| |ak| (QREFELT $ 47)) . #6#)
                        (LETT |bb| (SPADCALL |bb| |bk| (QREFELT $ 47)) . #6#)
                        (LETT H
                              (LIST (SPADCALL |ak| (QREFELT $ 48))
                                    (SPADCALL |bk| (QREFELT $ 48)))
                              . #6#)
                        (SEQ (LETT |k| 3 . #6#) (LETT #4# N . #6#) G190
                             (COND ((> |k| #4#) (GO G191)))
                             (SEQ
                              (LETT |Hk|
                                    (SPADCALL (SPADCALL G |k| (QREFELT $ 49))
                                              (QREFELT $ 48))
                                    . #6#)
                              (SEQ (LETT |l| 1 . #6#)
                                   (LETT #3# (- |k| 1) . #6#) G190
                                   (COND ((|greater_SI| |l| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |Hk|
                                           (SPADCALL |Hk|
                                                     (SPADCALL
                                                      (SPADCALL G |l|
                                                                (QREFELT $ 49))
                                                      (SPADCALL H (- |k| |l|)
                                                                (QREFELT $ 49))
                                                      (QREFELT $ 45))
                                                     (QREFELT $ 46))
                                           . #6#)))
                                   (LETT |l| (|inc_SI| |l|) . #6#) (GO G190)
                                   G191 (EXIT NIL))
                              (EXIT
                               (LETT H (SPADCALL H |Hk| (QREFELT $ 47))
                                     . #6#)))
                             (LETT |k| (+ |k| 1) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((|HasCategory| (QREFELT $ 6) '(|Field|))
                          (SEQ
                           (LETT G
                                 (PROGN
                                  (LETT #2# NIL . #6#)
                                  (SEQ (LETT |h| NIL . #6#) (LETT #1# H . #6#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |h| (CAR #1#) . #6#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |h| |bk|
                                                           (QREFELT $ 50))
                                                 (QREFELT $ 48))
                                                #2#)
                                               . #6#)))
                                       (LETT #1# (CDR #1#) . #6#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 . #6#)
                           (EXIT (LETT G (CDR (CDR G)) . #6#)))))
                        (EXIT (LETT N (- N 2) . #6#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |aa| |bb|))))) 

(SDEFUN |MOMPKG;moment2jacobi2;SS;9|
        ((|mom| |Sequence| R)
         ($ |Stream| (|Record| (|:| |an| R) (|:| |bn| R))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|MOMPKG;moment2jacobi2;SS;9!0|
                       (VECTOR (QREFELT $ 6) |mom| $))
                 (QREFELT $ 63))))) 

(SDEFUN |MOMPKG;moment2jacobi2;SS;9!0| (($$ NIL))
        (PROG ($ |mom| R)
          (LETT $ (QREFELT $$ 2) . #1=(|MOMPKG;moment2jacobi2;SS;9|))
          (LETT |mom| (QREFELT $$ 1) . #1#)
          (LETT R (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|gseries| NIL) (#2=#:G758 NIL) (|a| NIL) (|gseries1| NIL)
              (|b| NIL) (|b1| NIL))
             (SEQ
              (LETT |gseries|
                    (SPADCALL (|spadConstant| $ 17)
                              (SPADCALL |mom| (QREFELT $ 9)) (QREFELT $ 23))
                    NIL)
              (LETT |gseries1|
                    (PROG2 (LETT #2# (SPADCALL |gseries| (QREFELT $ 25)) NIL)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (|Stream| R)
                                      (|Union| (|Stream| R) "failed") #2#))
                    NIL)
              (LETT |gseries1| (SPADCALL |gseries1| (QREFELT $ 12)) NIL)
              (LETT |a|
                    (SPADCALL (SPADCALL |gseries1| (QREFELT $ 53))
                              (QREFELT $ 48))
                    NIL)
              (LETT |gseries1| (SPADCALL |gseries1| (QREFELT $ 12)) NIL)
              (LETT |b|
                    (SPADCALL (SPADCALL |gseries1| (QREFELT $ 53))
                              (QREFELT $ 48))
                    NIL)
              (LETT |b1|
                    (SPADCALL (SPADCALL |b| (QREFELT $ 54)) (QREFELT $ 48))
                    NIL)
              (EXIT
               (SPADCALL (CONS |a| |b|)
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |b| (QREFELT $ 54))
                                     (SPADCALL
                                      (SPADCALL |gseries1| (QREFELT $ 55))
                                      (QREFELT $ 13))
                                     (QREFELT $ 56))
                           (QREFELT $ 27))
                          (QREFELT $ 59))
                         (QREFELT $ 60))))))))) 

(SDEFUN |MOMPKG;moment2jacobi;SR;10|
        ((|mom| |Sequence| R)
         ($ |Record| (|:| |an| (|Stream| R)) (|:| |bn| (|Stream| R))))
        (SPROG ((|res| (|Stream| (|Record| (|:| |an| R) (|:| |bn| R)))))
               (SEQ
                (LETT |res| (SPADCALL |mom| (QREFELT $ 59))
                      |MOMPKG;moment2jacobi;SR;10|)
                (EXIT
                 (CONS
                  (SPADCALL (LIST #'|MOMPKG;moment2jacobi;SR;10!0|) |res|
                            (QREFELT $ 66))
                  (SPADCALL (LIST #'|MOMPKG;moment2jacobi;SR;10!1|) |res|
                            (QREFELT $ 66))))))) 

(SDEFUN |MOMPKG;moment2jacobi;SR;10!1| ((|y| NIL) ($$ NIL)) (QCDR |y|)) 

(SDEFUN |MOMPKG;moment2jacobi;SR;10!0| ((|y| NIL) ($$ NIL)) (QCAR |y|)) 

(SDEFUN |MOMPKG;jacobi2polypq|
        ((|aa| |Stream| R) (|bb| |Stream| R)
         (|p| |SparseUnivariatePolynomial| R)
         (|q| |SparseUnivariatePolynomial| R)
         ($ |Stream|
          (|Record| (|:| |first| (|SparseUnivariatePolynomial| R))
                    (|:| |second| (|SparseUnivariatePolynomial| R)))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|MOMPKG;jacobi2polypq!0|
                       (VECTOR |p| |bb| |q| $ |aa| (QREFELT $ 72)))
                 (QREFELT $ 79))))) 

(SDEFUN |MOMPKG;jacobi2polypq!0| (($$ NIL))
        (PROG (|xsup| |aa| $ |q| |bb| |p|)
          (LETT |xsup| (QREFELT $$ 5) . #1=(|MOMPKG;jacobi2polypq|))
          (LETT |aa| (QREFELT $$ 4) . #1#)
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |q| (QREFELT $$ 2) . #1#)
          (LETT |bb| (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|q1| NIL) (|pq1| NIL))
                   (SEQ
                    (LETT |q1|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |xsup|
                                      (SPADCALL (SPADCALL |aa| (QREFELT $ 53))
                                                (|spadConstant| $ 70)
                                                (QREFELT $ 73))
                                      (QREFELT $ 74))
                            |q| (QREFELT $ 75))
                           (SPADCALL (SPADCALL |bb| (QREFELT $ 53)) |p|
                                     (QREFELT $ 73))
                           (QREFELT $ 74))
                          NIL)
                    (LETT |pq1| (CONS |q| |q1|) NIL)
                    (EXIT
                     (SPADCALL |pq1|
                               (|MOMPKG;jacobi2polypq|
                                (SPADCALL |aa| (QREFELT $ 12))
                                (SPADCALL |bb| (QREFELT $ 12)) |q| |q1| $)
                               (QREFELT $ 78))))))))) 

(SDEFUN |MOMPKG;jacobi2poly;2SS;12|
        ((|aa| |Stream| R) (|bb| |Stream| R)
         ($ |Stream| (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res|
           (|Stream|
            (|Record| (|:| |first| (|SparseUnivariatePolynomial| R))
                      (|:| |second| (|SparseUnivariatePolynomial| R)))))
          (|p1| (|SparseUnivariatePolynomial| R))
          (|p0| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (LETT |p0| (|spadConstant| $ 70) . #1=(|MOMPKG;jacobi2poly;2SS;12|))
          (LETT |p1|
                (SPADCALL (QREFELT $ 72)
                          (SPADCALL (SPADCALL |aa| (QREFELT $ 53)) |p0|
                                    (QREFELT $ 73))
                          (QREFELT $ 74))
                . #1#)
          (LETT |res|
                (|MOMPKG;jacobi2polypq| (SPADCALL |aa| (QREFELT $ 12)) |bb|
                 |p0| |p1| $)
                . #1#)
          (EXIT
           (SPADCALL (LIST #'|MOMPKG;jacobi2poly;2SS;12!0|) |res|
                     (QREFELT $ 83)))))) 

(SDEFUN |MOMPKG;jacobi2poly;2SS;12!0| ((|pp| NIL) ($$ NIL)) (QCAR |pp|)) 

(SDEFUN |MOMPKG;moment2Stransform;SR;13|
        ((|x| |Sequence| R)
         ($ |Record| (|:| |puiseux| (|Fraction| (|Integer|)))
          (|:| |laurent| (|Fraction| (|Integer|)))
          (|:| |coef| (|Sequence| R))))
        (SPROG
         ((S #1=(|Sequence| R)) (|chi| #2=(|Stream| R)) (|mom| (|Stream| R))
          (S2 #1#) (|chi2s| (|Sequence| R)) (|chi2| #2#) (|mom2| (|Stream| R)))
         (SEQ
          (LETT |mom| (SPADCALL |x| (QREFELT $ 9))
                . #3=(|MOMPKG;moment2Stransform;SR;13|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |mom| (QREFELT $ 53)) (QREFELT $ 85))
             (SEQ
              (LETT |mom2|
                    (SPADCALL (|spadConstant| $ 86)
                              (SPADCALL (SPADCALL 1 2 (QREFELT $ 89))
                                        (SPADCALL |mom| (QREFELT $ 12))
                                        (QREFELT $ 90))
                              (QREFELT $ 23))
                    . #3#)
              (LETT |chi2| (SPADCALL |mom2| (QREFELT $ 91)) . #3#)
              (LETT |chi2s| (SPADCALL |chi2| (QREFELT $ 13)) . #3#)
              (LETT S2
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 86) |chi2s| (QREFELT $ 92))
                     (SPADCALL |chi2s| (QREFELT $ 28)) (QREFELT $ 93))
                    . #3#)
              (EXIT
               (VECTOR (SPADCALL 1 2 (QREFELT $ 89))
                       (SPADCALL (|spadConstant| $ 94) (QREFELT $ 95)) S2))))
            ('T
             (SEQ
              (LETT |mom| (SPADCALL (|spadConstant| $ 86) |mom| (QREFELT $ 23))
                    . #3#)
              (LETT |chi| (SPADCALL |mom| (QREFELT $ 91)) . #3#)
              (LETT S
                    (SPADCALL (SPADCALL |chi| (QREFELT $ 13))
                              (SPADCALL (SPADCALL |chi| (QREFELT $ 12))
                                        (QREFELT $ 13))
                              (QREFELT $ 93))
                    . #3#)
              (EXIT
               (VECTOR (|spadConstant| $ 94) (|spadConstant| $ 96) S))))))))) 

(SDEFUN |MOMPKG;moment2monotoneCumulantGenerator|
        ((|srm| |Record| (|:| |momt| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |cum| (|List| R)) (|:| |mom| (|Stream| R)))
         ($ |Record| (|:| |momt| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |cum| (|List| R)) (|:| |mom| (|Stream| R))))
        (SPROG
         ((#1=#:G797 NIL) (|mtnew| (|List| (|SparseUnivariatePolynomial| R)))
          (|rrnew| (|List| R)) (|mnt| (|SparseUnivariatePolynomial| R))
          (|rn| (R)) (|tmp| (|SparseUnivariatePolynomial| R)) (#2=#:G798 NIL)
          (|k| NIL) (#3=#:G799 NIL) (|r| NIL) (#4=#:G800 NIL) (|m| NIL)
          (|n| (|Integer|)) (|mm| (|Stream| R)) (|rr| (|List| R))
          (|mt| (|List| (|SparseUnivariatePolynomial| R))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mt| (QVELT |srm| 0)
                  . #5=(|MOMPKG;moment2monotoneCumulantGenerator|))
            (LETT |rr| (QVELT |srm| 1) . #5#) (LETT |mm| (QVELT |srm| 2) . #5#)
            (LETT |n| (+ (LENGTH |rr|) 1) . #5#)
            (LETT |tmp| (|spadConstant| $ 87) . #5#)
            (SEQ (LETT |m| NIL . #5#) (LETT #4# (REVERSE |mt|) . #5#)
                 (LETT |r| NIL . #5#) (LETT #3# |rr| . #5#) (LETT |k| 2 . #5#)
                 (LETT #2# |n| . #5#) G190
                 (COND
                  ((OR (|greater_SI| |k| #2#) (ATOM #3#)
                       (PROGN (LETT |r| (CAR #3#) . #5#) NIL) (ATOM #4#)
                       (PROGN (LETT |m| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |tmp|
                         (SPADCALL |tmp|
                                   (SPADCALL (SPADCALL |k| |m| (QREFELT $ 100))
                                             |r| (QREFELT $ 101))
                                   (QREFELT $ 102))
                         . #5#)))
                 (LETT |k|
                       (PROG1 (|inc_SI| |k|)
                         (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#))
                               . #5#))
                       . #5#)
                 (GO G190) G191 (EXIT NIL))
            (LETT |mnt| (SPADCALL |tmp| (QREFELT $ 103)) . #5#)
            (LETT |rn|
                  (SPADCALL (SPADCALL |mm| (QREFELT $ 53))
                            (SPADCALL |mnt| (|spadConstant| $ 17)
                                      (QREFELT $ 104))
                            (QREFELT $ 46))
                  . #5#)
            (LETT |mnt|
                  (SPADCALL |mnt|
                            (SPADCALL (QREFELT $ 99) |rn| (QREFELT $ 101))
                            (QREFELT $ 102))
                  . #5#)
            (LETT |rrnew| (CONS |rn| |rr|) . #5#)
            (LETT |mtnew| (CONS |mnt| |mt|) . #5#)
            (EXIT
             (PROGN
              (LETT #1# (VECTOR |mtnew| |rrnew| (SPADCALL |mm| (QREFELT $ 12)))
                    . #5#)
              (GO #6=#:G796)))))
          #6# (EXIT #1#)))) 

(SDEFUN |MOMPKG;moment2monotoneCumulant;2S;15|
        ((|mm| |Sequence| R) ($ |Sequence| R))
        (SPROG
         ((|res1| (|Stream| R))
          (|res|
           (|Stream|
            (|Record| (|:| |momt| (|List| (|SparseUnivariatePolynomial| R)))
                      (|:| |cum| (|List| R)) (|:| |mom| (|Stream| R)))))
          (|mtr1|
           (|Record| (|:| |momt| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |cum| (|List| R)) (|:| |mom| (|Stream| R))))
          (|r1| (R)) (|m1t| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (LETT |m1t|
                (SPADCALL (SPADCALL |mm| (QREFELT $ 105)) 1 (QREFELT $ 71))
                . #1=(|MOMPKG;moment2monotoneCumulant;2S;15|))
          (LETT |r1| (SPADCALL |mm| (QREFELT $ 105)) . #1#)
          (LETT |mtr1|
                (VECTOR (LIST |m1t|) (LIST |r1|)
                        (SPADCALL (SPADCALL |mm| (QREFELT $ 9))
                                  (QREFELT $ 12)))
                . #1#)
          (LETT |res|
                (SPADCALL
                 (CONS (|function| |MOMPKG;moment2monotoneCumulantGenerator|)
                       $)
                 |mtr1| (QREFELT $ 109))
                . #1#)
          (LETT |res1|
                (SPADCALL (CONS #'|MOMPKG;moment2monotoneCumulant;2S;15!0| $)
                          |res| (QREFELT $ 113))
                . #1#)
          (EXIT (SPADCALL |res1| (QREFELT $ 13)))))) 

(SDEFUN |MOMPKG;moment2monotoneCumulant;2S;15!0| ((|s| NIL) ($ NIL))
        (SPADCALL (QVELT |s| 1) (QREFELT $ 110))) 

(SDEFUN |MOMPKG;monotoneCumulant2momentGenerator|
        ((|srm| |Record| (|:| |cum| (|Stream| R))
          (|:| |momt| (|List| (|SparseUnivariatePolynomial| R))))
         ($ |Record| (|:| |cum| (|Stream| R))
          (|:| |momt| (|List| (|SparseUnivariatePolynomial| R)))))
        (SPROG
         ((#1=#:G812 NIL) (|mtnew| (|List| (|SparseUnivariatePolynomial| R)))
          (|mnt| (|SparseUnivariatePolynomial| R)) (|rr| (|Stream| R))
          (|tmp| (|SparseUnivariatePolynomial| R)) (#2=#:G813 NIL) (|k| NIL)
          (#3=#:G814 NIL) (|m| NIL) (|n| (|Integer|))
          (|mt| (|List| (|SparseUnivariatePolynomial| R))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mt| (QCDR |srm|)
                  . #4=(|MOMPKG;monotoneCumulant2momentGenerator|))
            (LETT |rr| (QCAR |srm|) . #4#) (LETT |n| (+ (LENGTH |mt|) 1) . #4#)
            (LETT |tmp| (|spadConstant| $ 87) . #4#)
            (SEQ (LETT |m| NIL . #4#) (LETT #3# |mt| . #4#) (LETT |k| 1 . #4#)
                 (LETT #2# (- |n| 1) . #4#) G190
                 (COND
                  ((OR (|greater_SI| |k| #2#) (ATOM #3#)
                       (PROGN (LETT |m| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |tmp|
                        (SPADCALL |tmp|
                                  (SPADCALL
                                   (SPADCALL (- (+ |n| 1) |k|) |m|
                                             (QREFELT $ 115))
                                   (SPADCALL |rr| (QREFELT $ 53))
                                   (QREFELT $ 101))
                                  (QREFELT $ 102))
                        . #4#)
                  (EXIT (LETT |rr| (SPADCALL |rr| (QREFELT $ 12)) . #4#)))
                 (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #3# (CDR #3#) . #4#))
                       . #4#)
                 (GO G190) G191 (EXIT NIL))
            (LETT |mnt|
                  (SPADCALL
                   (SPADCALL (QREFELT $ 99) (SPADCALL |rr| (QREFELT $ 53))
                             (QREFELT $ 101))
                   (SPADCALL |tmp| (QREFELT $ 103)) (QREFELT $ 102))
                  . #4#)
            (LETT |mtnew| (CONS |mnt| |mt|) . #4#)
            (EXIT
             (PROGN
              (LETT #1# (CONS (QCAR |srm|) |mtnew|) . #4#)
              (GO #5=#:G811)))))
          #5# (EXIT #1#)))) 

(SDEFUN |MOMPKG;monotoneCumulant2moment;2S;17|
        ((|rr| |Sequence| R) ($ |Sequence| R))
        (SPROG
         ((|res1| (|Stream| R))
          (|res|
           (|Stream|
            (|Record| (|:| |cum| (|Stream| R))
                      (|:| |momt| (|List| (|SparseUnivariatePolynomial| R))))))
          (|mtr1|
           (|Record| (|:| |cum| (|Stream| R))
                     (|:| |momt| (|List| (|SparseUnivariatePolynomial| R)))))
          (|m1t| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (LETT |m1t|
                (SPADCALL (SPADCALL |rr| (QREFELT $ 105)) 1 (QREFELT $ 71))
                . #1=(|MOMPKG;monotoneCumulant2moment;2S;17|))
          (LETT |mtr1| (CONS (SPADCALL |rr| (QREFELT $ 9)) (LIST |m1t|)) . #1#)
          (LETT |res|
                (SPADCALL
                 (CONS (|function| |MOMPKG;monotoneCumulant2momentGenerator|)
                       $)
                 |mtr1| (QREFELT $ 119))
                . #1#)
          (LETT |res1|
                (SPADCALL (CONS #'|MOMPKG;monotoneCumulant2moment;2S;17!0| $)
                          |res| (QREFELT $ 124))
                . #1#)
          (EXIT (SPADCALL |res1| (QREFELT $ 13)))))) 

(SDEFUN |MOMPKG;monotoneCumulant2moment;2S;17!0| ((|s| NIL) ($ NIL))
        (SPADCALL (SPADCALL (QCDR |s|) (QREFELT $ 121)) (|spadConstant| $ 17)
                  (QREFELT $ 104))) 

(SDEFUN |MOMPKG;monotoneCumulant2momentPoly;SS;18|
        ((|rr| |Sequence| R) ($ |Sequence| (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res1| (|Stream| (|SparseUnivariatePolynomial| R)))
          (|res|
           (|Stream|
            (|Record| (|:| |cum| (|Stream| R))
                      (|:| |momt| (|List| (|SparseUnivariatePolynomial| R))))))
          (|mtr1|
           (|Record| (|:| |cum| (|Stream| R))
                     (|:| |momt| (|List| (|SparseUnivariatePolynomial| R)))))
          (|m1t| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (LETT |m1t|
                (SPADCALL (SPADCALL |rr| (QREFELT $ 105)) 1 (QREFELT $ 71))
                . #1=(|MOMPKG;monotoneCumulant2momentPoly;SS;18|))
          (LETT |mtr1| (CONS (SPADCALL |rr| (QREFELT $ 9)) (LIST |m1t|)) . #1#)
          (LETT |res|
                (SPADCALL
                 (CONS (|function| |MOMPKG;monotoneCumulant2momentGenerator|)
                       $)
                 |mtr1| (QREFELT $ 119))
                . #1#)
          (LETT |res1|
                (SPADCALL
                 (CONS #'|MOMPKG;monotoneCumulant2momentPoly;SS;18!0| $) |res|
                 (QREFELT $ 128))
                . #1#)
          (EXIT (SPADCALL |res1| (QREFELT $ 130)))))) 

(SDEFUN |MOMPKG;monotoneCumulant2momentPoly;SS;18!0| ((|s| NIL) ($ NIL))
        (SPADCALL (QCDR |s|) (QREFELT $ 121))) 

(DECLAIM (NOTINLINE |MomentPackage;|)) 

(DEFUN |MomentPackage| (#1=#:G826)
  (SPROG NIL
         (PROG (#2=#:G827)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|MomentPackage|)
                                               '|domainEqualList|)
                    . #3=(|MomentPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|MomentPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|MomentPackage|)))))))))) 

(DEFUN |MomentPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MomentPackage|))
          (LETT |dv$| (LIST '|MomentPackage| DV$1) . #1#)
          (LETT $ (GETREFV 132) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1| '(|Field|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|MomentPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 52
                       (CONS
                        (|dispatchFunction| |MOMPKG;moment2nthJacobi;LR;8|) $))
             (QSETREFV $ 59
                       (CONS (|dispatchFunction| |MOMPKG;moment2jacobi2;SS;9|)
                             $))
             (QSETREFV $ 68
                       (CONS (|dispatchFunction| |MOMPKG;moment2jacobi;SR;10|)
                             $)))))
          (QSETREFV $ 72 (SPADCALL (|spadConstant| $ 17) 1 (QREFELT $ 71)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 98
                       (CONS
                        (|dispatchFunction| |MOMPKG;moment2Stransform;SR;13|)
                        $))
             (QSETREFV $ 99 (SPADCALL (|spadConstant| $ 17) 1 (QREFELT $ 71)))
             (QSETREFV $ 114
                       (CONS
                        (|dispatchFunction|
                         |MOMPKG;moment2monotoneCumulant;2S;15|)
                        $))
             (SETELT $ 99 (SPADCALL (|spadConstant| $ 17) 1 (QREFELT $ 71)))
             (QSETREFV $ 125
                       (CONS
                        (|dispatchFunction|
                         |MOMPKG;monotoneCumulant2moment;2S;17|)
                        $))
             (QSETREFV $ 131
                       (CONS
                        (|dispatchFunction|
                         |MOMPKG;monotoneCumulant2momentPoly;SS;18|)
                        $)))))
          $))) 

(MAKEPROP '|MomentPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Stream| 6)
              (|Sequence| 6) (0 . |stream|)
              (|StreamExponentialSeriesOperations| 6) (5 . |exp0|)
              (10 . |rest|) (15 . |sequence|) |MOMPKG;cumulant2moment;2S;1|
              (20 . |log1|) |MOMPKG;moment2cumulant;2S;2| (25 . |One|)
              (29 . |concat|) (|StreamTaylorSeriesOperations| 6)
              (35 . |lagrange|) (40 . |coerce|)
              |MOMPKG;freeCumulant2moment;2S;3| (45 . |cons|)
              (|Union| 7 '"failed") (51 . |recip|)
              |MOMPKG;moment2freeCumulant;2S;4| (56 . -) (61 . |rest|)
              |MOMPKG;booleanCumulant2moment;2S;5|
              |MOMPKG;moment2booleanCumulant;2S;6| (|PositiveInteger|)
              (|NonNegativeInteger|) (66 . *) (|List| 6) (72 . |firstn|)
              (|Matrix| 6) (|HankelPackage| 6) (78 . |HankelMatrix|)
              (83 . |determinant|) |MOMPKG;hankelDeterminant;SNniR;7|
              (|Boolean|) (|Integer|) (88 . >) (94 . |second|) (99 . *)
              (105 . -) (111 . |concat|) (117 . -) (122 . |elt|) (128 . /)
              (|Record| (|:| |an| 34) (|:| |bn| 34)) (134 . |moment2nthJacobi|)
              (139 . |first|) (144 . |inv|) (149 . |rst|) (154 . *)
              (|Record| (|:| |an| 6) (|:| |bn| 6)) (|Stream| 57)
              (160 . |moment2jacobi2|) (165 . |cons|) (171 . |One|)
              (|Mapping| $) (175 . |delay|) (|Mapping| 6 57)
              (|StreamFunctions2| 57 6) (180 . |map|)
              (|Record| (|:| |an| 7) (|:| |bn| 7)) (186 . |moment2jacobi|)
              (|SparseUnivariatePolynomial| 6) (191 . |One|) (195 . |monomial|)
              '|xsup| (201 . *) (207 . -) (213 . *)
              (|Record| (|:| |first| 69) (|:| |second| 69)) (|Stream| 76)
              (219 . |cons|) (225 . |delay|) (|Stream| 69) (|Mapping| 69 76)
              (|StreamFunctions2| 76 69) (230 . |map|)
              |MOMPKG;jacobi2poly;2SS;12| (236 . |zero?|) (241 . |Zero|)
              (245 . |Zero|) (|Fraction| 42) (249 . /) (255 . |powern|)
              (261 . |revert|) (266 . |cons|) (272 . +) (278 . |One|) (282 . -)
              (287 . |Zero|)
              (|Record| (|:| |puiseux| 88) (|:| |laurent| 88) (|:| |coef| 8))
              (291 . |moment2Stransform|) '|t| (296 . *) (302 . *) (308 . +)
              (314 . |integrate|) (319 . |elt|) (325 . |first|)
              (|Record| (|:| |momt| 120) (|:| |cum| 34) (|:| |mom| 7))
              (|Mapping| 106 106) (|Stream| 106) (330 . |stream|)
              (336 . |first|) (|Mapping| 6 106) (|StreamFunctions2| 106 6)
              (341 . |map|) (347 . |moment2monotoneCumulant|) (352 . *)
              (|Record| (|:| |cum| 7) (|:| |momt| 120)) (|Mapping| 116 116)
              (|Stream| 116) (358 . |stream|) (|List| 69) (364 . |first|)
              (|Mapping| 6 116) (|StreamFunctions2| 116 6) (369 . |map|)
              (375 . |monotoneCumulant2moment|) (|Mapping| 69 116)
              (|StreamFunctions2| 116 69) (380 . |map|) (|Sequence| 69)
              (386 . |sequence|) (391 . |monotoneCumulant2momentPoly|))
           '#(|qcumulant2nthmoment| 396 |monotoneCumulant2momentPoly| 403
              |monotoneCumulant2moment| 408 |moment2nthJacobi| 413
              |moment2monotoneCumulant| 418 |moment2jacobi2| 428
              |moment2jacobi| 433 |moment2freeCumulant| 438 |moment2cumulant|
              443 |moment2booleanCumulant| 448 |moment2Stransform| 453
              |jacobi2poly| 458 |hankelDeterminant| 464 |freeCumulant2moment|
              470 |cumulant2moment| 475 |booleanCumulant2moment| 480)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 131
                                                 '(1 8 7 0 9 1 10 7 7 11 1 7 0
                                                   0 12 1 8 0 7 13 1 10 7 7 15
                                                   0 6 0 17 2 7 0 6 0 18 1 19 7
                                                   7 20 1 8 0 7 21 2 7 0 6 0 23
                                                   1 19 24 7 25 1 8 0 0 27 1 8
                                                   0 0 28 2 32 0 31 0 33 2 8 34
                                                   0 32 35 1 37 36 34 38 1 36 6
                                                   0 39 2 42 41 0 0 43 1 34 6 0
                                                   44 2 6 0 0 0 45 2 6 0 0 0 46
                                                   2 34 0 0 6 47 1 6 0 0 48 2
                                                   34 6 0 42 49 2 6 0 0 0 50 1
                                                   0 51 34 52 1 7 6 0 53 1 6 0
                                                   0 54 1 7 0 0 55 2 8 0 6 0 56
                                                   1 0 58 8 59 2 58 0 57 0 60 0
                                                   31 0 61 1 58 0 62 63 2 65 7
                                                   64 58 66 1 0 67 8 68 0 69 0
                                                   70 2 69 0 6 32 71 2 69 0 6 0
                                                   73 2 69 0 0 0 74 2 69 0 0 0
                                                   75 2 77 0 76 0 78 1 77 0 62
                                                   79 2 82 80 81 77 83 1 6 41 0
                                                   85 0 6 0 86 0 69 0 87 2 88 0
                                                   42 42 89 2 19 7 88 7 90 1 19
                                                   7 7 91 2 8 0 6 0 92 2 8 0 0
                                                   0 93 0 88 0 94 1 88 0 0 95 0
                                                   88 0 96 1 0 97 8 98 2 69 0
                                                   32 0 100 2 69 0 0 6 101 2 69
                                                   0 0 0 102 1 69 0 0 103 2 69
                                                   6 0 6 104 1 8 6 0 105 2 108
                                                   0 107 106 109 1 34 6 0 110 2
                                                   112 7 111 108 113 1 0 8 8
                                                   114 2 69 0 42 0 115 2 118 0
                                                   117 116 119 1 120 69 0 121 2
                                                   123 7 122 118 124 1 0 8 8
                                                   125 2 127 80 126 118 128 1
                                                   129 0 80 130 1 0 129 8 131 3
                                                   0 6 6 8 32 1 1 0 129 8 131 1
                                                   0 8 8 125 1 2 51 34 52 1 1 8
                                                   8 114 1 0 8 8 114 1 2 58 8
                                                   59 1 2 67 8 68 1 0 8 8 26 1
                                                   0 8 8 16 1 0 8 8 30 1 1 97 8
                                                   98 2 0 80 7 7 84 2 0 6 8 32
                                                   40 1 0 8 8 22 1 0 8 8 14 1 0
                                                   8 8 29)))))
           '|lookupComplete|)) 
