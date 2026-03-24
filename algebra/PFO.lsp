
(SDEFUN |PFO;torsion?;FdB;1|
        ((|d| (|FiniteDivisor| F UP UPUP R)) (% (|Boolean|)))
        (QEQCAR (SPADCALL |d| (QREFELT % 15)) 0)) 

(SDEFUN |PFO;Q2F| ((|x| (|Fraction| (|Integer|))) (% (F)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 20)) (QREFELT % 21))
                  (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 21))
                  (QREFELT % 23))) 

(SDEFUN |PFO;Q2UPUP|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|Fraction|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (% (UPUP)))
        (SPADCALL (CONS (|function| |PFO;Q2F|) %) |p| (QREFELT % 27))) 

(SDEFUN |PFO;raise|
        ((|p| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| (|Kernel| F)) (% (F)))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) %) |p| (QREFELT % 31))
                  (SPADCALL |k| (QREFELT % 33)) (QREFELT % 34))) 

(SDEFUN |PFO;raise2|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|k| (|Kernel| F)) (% (UP)))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;raise2!0| (VECTOR % |k|)) |p|
                         (QREFELT % 38)))) 

(SDEFUN |PFO;raise2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| %)
          (LETT |k| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|PFO;raise| |z1| |k| %))))) 

(SDEFUN |PFO;qmod| ((|x| (F)) (% (|Fraction| (|Integer|))))
        (SPADCALL |x| (QREFELT % 39))) 

(SDEFUN |PFO;fmod|
        ((|p| (|SparseUnivariatePolynomial| F))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPADCALL (CONS (|function| |PFO;qmod|) %) |p| (QREFELT % 42))) 

(SDEFUN |PFO;pmod|
        ((|p| (UPUP))
         (%
          (|SparseUnivariatePolynomial|
           (|Fraction|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))))
        (SPADCALL (CONS (|function| |PFO;qmod|) %) |p| (QREFELT % 44))) 

(SDEFUN |PFO;rmod|
        ((|p| (UP))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPADCALL (CONS (|function| |PFO;qmod|) %) |p| (QREFELT % 46))) 

(SDEFUN |PFO;kqmod|
        ((|x| (F)) (|k| (|Kernel| F))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPADCALL |x| |k| (QREFELT % 48))) 

(SDEFUN |PFO;krmod|
        ((|p| (UP)) (|k| (|Kernel| F))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;krmod!0| (VECTOR % |k|)) |p|
                         (QREFELT % 51)))) 

(SDEFUN |PFO;krmod!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| %)
          (LETT |k| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|PFO;kqmod| |z1| |k| %))))) 

(SDEFUN |PFO;kpmod|
        ((|p| (UPUP)) (|k| (|Kernel| F))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;kpmod!0| (VECTOR |k| %)) |p|
                         (QREFELT % 57)))) 

(SDEFUN |PFO;kpmod!0| ((|p1| NIL) ($$ NIL))
        (PROG (% |k|)
          (LETT % (QREFELT $$ 1))
          (LETT |k| (QREFELT $$ 0))
          (RETURN (PROGN (|PFO;krmod| (SPADCALL |p1| (QREFELT % 53)) |k| %))))) 

(SDEFUN |PFO;klist| ((|d| (UP)) (% (|List| (|Kernel| F))))
        (SPADCALL (SPADCALL |d| (QREFELT % 59)) (QREFELT % 62))) 

(SDEFUN |PFO;notIrr?|
        ((|d| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (% (|Boolean|)))
        (> (LENGTH (SPADCALL (SPADCALL |d| (QREFELT % 65)) (QREFELT % 69))) 1)) 

(SDEFUN |PFO;kbadBadNum|
        ((|d|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|m| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (% (|Integer|)))
        (SPROG ((#1=#:G57 NIL) (|c| NIL) (#2=#:G56 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |c| NIL) (LETT #1# (SPADCALL |d| (QREFELT % 72)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |c| |m| (QREFELT % 73))
                                          (QREFELT % 76))
                                #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT % 78))))) 

(SDEFUN |PFO;kbad3Num|
        ((|h|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (|m| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (% (|Integer|)))
        (SPROG ((#1=#:G62 NIL) (|c| NIL) (#2=#:G61 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |c| NIL) (LETT #1# (SPADCALL |h| (QREFELT % 80)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|PFO;kbadBadNum| |c| |m| %) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT % 81))))) 

(SDEFUN |PFO;torsionIfCan;FdU;17|
        ((|d| (|FiniteDivisor| F UP UPUP R))
         (%
          (|Union|
           (|Record| (|:| |order| (|NonNegativeInteger|)) (|:| |function| R))
           "failed")))
        (SPROG ((|g| (|Union| R "failed")) (|n| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((ZEROP
                   (LETT |n|
                         (SPADCALL (LETT |d| (SPADCALL |d| (QREFELT % 82)))
                                   (QREFELT % 84))))
                  (CONS 1 "failed"))
                 (#1='T
                  (SEQ
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |d| (QREFELT % 85))
                                    (QREFELT % 82))
                          (QREFELT % 87)))
                   (EXIT
                    (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                          (#1# (CONS 0 (CONS |n| (QCDR |g|)))))))))))) 

(SDEFUN |PFO;UPQ2F|
        ((|p| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| (|Kernel| F)) (% (F)))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) %) |p| (QREFELT % 92))
                  (SPADCALL |k| (QREFELT % 33)) (QREFELT % 93))) 

(SDEFUN |PFO;UP22UP|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|k| (|Kernel| F)) (% (UP)))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP22UP!0| (VECTOR % |k|)) |p|
                         (QREFELT % 38)))) 

(SDEFUN |PFO;UP22UP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| %)
          (LETT |k| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|PFO;UPQ2F| |p1| |k| %))))) 

(SDEFUN |PFO;UP32UPUP|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (|k| (|Kernel| F)) (% (UPUP)))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP32UPUP!0| (VECTOR % |k|)) |p|
                         (QREFELT % 97)))) 

(SDEFUN |PFO;UP32UPUP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| %)
          (LETT |k| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (|PFO;UP22UP| |p1| |k| %) (QREFELT % 94)))))) 

(SDEFUN |PFO;cmult;LSmp;21|
        ((|l| (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
         (% (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
        (SPADCALL |l| (QREFELT % 99))) 

(SDEFUN |PFO;cmult;LSmp;22|
        ((|l| (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
         (% (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
        (SPROG
         ((#1=#:G86 NIL)
          (#2=#:G85 #3=(|SparseMultivariatePolynomial| R0 (|Kernel| F)))
          (#4=#:G87 #3#) (#5=#:G89 NIL) (#6=#:G0 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT #6# NIL) (LETT #5# |l|) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# #6#)
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 102))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 103))))))) 

(SDEFUN |PFO;commonDen|
        ((|p| (UP)) (% (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
        (SPROG
         ((|l2| (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
          (#1=#:G95 NIL) (|c| NIL) (#2=#:G94 NIL) (|l1| (|List| F)))
         (SEQ (LETT |l1| (SPADCALL |p| (QREFELT % 59)))
              (LETT |l2|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |c| NIL) (LETT #1# |l1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |c| (QREFELT % 105)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (SPADCALL |l2| (QREFELT % 101)))))) 

(SDEFUN |PFO;polyred| ((|f| (UPUP)) (% (UPUP)))
        (SPROG ((#1=#:G314 NIL) (|c| NIL) (#2=#:G313 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |c| NIL)
                           (LETT #1# (SPADCALL |f| (QREFELT % 107))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|PFO;commonDen|
                                     (SPADCALL |c| (QREFELT % 53)) %)
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT % 101))
                    (QREFELT % 108))
                   (QREFELT % 109))
                  (QREFELT % 94))
                 |f| (QREFELT % 110))))) 

(SDEFUN |PFO;aklist| ((|f| (R)) (% (|List| (|Kernel| F))))
        (SPROG
         ((#1=#:G319 NIL) (#2=#:G318 #3=(|List| (|Kernel| F))) (#4=#:G320 #3#)
          (#5=#:G323 NIL) (|c| NIL) (|r| (|Union| (|Fraction| UP) "failed")))
         (SEQ (LETT |r| (SPADCALL |f| (QREFELT % 112)))
              (EXIT
               (COND
                ((QEQCAR |r| 1)
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |c| NIL)
                       (LETT #5#
                             (SPADCALL (SPADCALL |f| (QREFELT % 113))
                                       (QREFELT % 107)))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|PFO;klist| (SPADCALL |c| (QREFELT % 53)) %))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 115))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6='T (|IdentityError| '|setUnion|)))))
                (#6# (|PFO;klist| (SPADCALL (QCDR |r|) (QREFELT % 53)) %))))))) 

(SDEFUN |PFO;alglist0|
        ((|d| (|FiniteDivisor| F UP UPUP R)) (% (|List| (|Kernel| F))))
        (SPROG
         ((#1=#:G326 NIL) (#2=#:G325 #3=(|List| (|Kernel| F))) (#4=#:G327 #3#)
          (#5=#:G330 NIL) (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|n| (|Vector| R)))
         (SEQ
          (LETT |n|
                (SPADCALL (LETT |i| (SPADCALL |d| (QREFELT % 117)))
                          (QREFELT % 119)))
          (EXIT
           (SPADCALL (CONS #'|PFO;alglist0!0| (VECTOR (QREFELT % 11) %))
                     (SPADCALL (|PFO;klist| (SPADCALL |i| (QREFELT % 124)) %)
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |i| (SPADCALL |n| (QREFELT % 125)))
                                     (LETT #5# (QVSIZE |n|)) G190
                                     (COND ((> |i| #5#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #4#
                                              (|PFO;aklist| (QAREF1O |n| |i| 1)
                                               %))
                                        (COND
                                         (#1#
                                          (LETT #2#
                                                (SPADCALL #2# #4#
                                                          (QREFELT % 115))))
                                         ('T
                                          (PROGN
                                           (LETT #2# #4#)
                                           (LETT #1# 'T)))))))
                                     (LETT |i| (+ |i| 1)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#1# #2#)
                                      ('T (|IdentityError| '|setUnion|))))
                               (QREFELT % 115))
                     (QREFELT % 127)))))) 

(SDEFUN |PFO;alglist0!0| ((|k1| NIL) ($$ NIL))
        (PROG (% ALGOP)
          (LETT % (QREFELT $$ 1))
          (LETT ALGOP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |k1| (QREFELT % 121)) ALGOP (QREFELT % 123)))))) 

(SDEFUN |PFO;alglist|
        ((|d| (|FiniteDivisor| F UP UPUP R)) (% (|List| (|Kernel| F))))
        (SPROG
         ((|l1| #1=(|List| (|Kernel| F))) (#2=#:G332 NIL) (#3=#:G331 #1#)
          (#4=#:G333 #1#) (#5=#:G336 NIL) (|c| NIL) (|f| (UPUP)))
         (SEQ (LETT |f| (SPADCALL (QREFELT % 128)))
              (LETT |l1|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |c| NIL)
                          (LETT #5# (SPADCALL |f| (QREFELT % 107))) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (|PFO;klist| (SPADCALL |c| (QREFELT % 53))
                                    %))
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT % 115))))
                              ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) ('T (|IdentityError| '|setUnion|)))))
              (EXIT (SPADCALL |l1| (|PFO;alglist0| |d| %) (QREFELT % 115)))))) 

(SDEFUN |PFO;alglist2| ((|f| (UPUP)) (% (|List| (|Kernel| F))))
        (SPROG
         ((#1=#:G338 NIL) (#2=#:G337 #3=(|List| (|Kernel| F))) (#4=#:G339 #3#)
          (#5=#:G341 NIL) (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |c| NIL) (LETT #5# (SPADCALL |f| (QREFELT % 107))) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|PFO;klist| (SPADCALL |c| (QREFELT % 53)) %))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 115))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))))) 

(SDEFUN |PFO;alglist1|
        ((|nc| (UPUP)) (|nva| (|Vector| UPUP)) (|nd| (UPUP))
         (% (|List| (|Kernel| F))))
        (SPROG
         ((#1=#:G343 NIL) (#2=#:G342 #3=(|List| (|Kernel| F))) (#4=#:G344 #3#)
          (#5=#:G347 NIL) (|f| NIL) (|l2| (|List| UPUP)) (|l1| (|List| UPUP)))
         (SEQ (LETT |l1| (SPADCALL |nva| (QREFELT % 131)))
              (LETT |l2| (CONS |nc| (CONS |nd| |l1|)))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |f| NIL) (LETT #5# |l2|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #4# (|PFO;alglist2| |f| %))
                        (COND
                         (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 115))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|IdentityError| '|setUnion|)))))))) 

(SDEFUN |PFO;subst_mp_ni|
        ((|p| (|SparseMultivariatePolynomial| R0 (|Kernel| F))) (|ni| (F))
         (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (CONS #'|PFO;subst_mp_ni!0| %) |p| (QREFELT % 136))
          (QREFELT % 108))
         (SPADCALL |ni|
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;subst_mp_ni!1| %) |p|
                              (QREFELT % 136))
                    (QREFELT % 108))
                   (QREFELT % 138))
         (QREFELT % 139))) 

(SDEFUN |PFO;subst_mp_ni!1| ((|c| NIL) (% NIL))
        (SPADCALL (SPADCALL |c| (QREFELT % 137)) (QREFELT % 134))) 

(SDEFUN |PFO;subst_mp_ni!0| ((|c| NIL) (% NIL))
        (SPADCALL (SPADCALL |c| (QREFELT % 133)) (QREFELT % 134))) 

(SDEFUN |PFO;subst_upup_ni| ((|upup| (UPUP)) (|ni| (F)) (% (UPUP)))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;subst_upup_ni!2| (VECTOR |ni| %)) |upup|
                         (QREFELT % 146)))) 

(SDEFUN |PFO;subst_upup_ni!2| ((|a| NIL) ($$ NIL))
        (PROG (% |ni|)
          (LETT % (QREFELT $$ 1))
          (LETT |ni| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;subst_upup_ni!1| (VECTOR % |ni|)) |a|
                             (QREFELT % 144))))))) 

(SDEFUN |PFO;subst_upup_ni!1| ((|b| NIL) ($$ NIL))
        (PROG (|ni| %)
          (LETT |ni| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;subst_upup_ni!0| (VECTOR |ni| %)) |b|
                             (QREFELT % 142))))))) 

(SDEFUN |PFO;subst_upup_ni!0| ((|c| NIL) ($$ NIL))
        (PROG (% |ni|)
          (LETT % (QREFELT $$ 1))
          (LETT |ni| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|PFO;subst_mp_ni| (SPADCALL |c| (QREFELT % 140)) |ni| %)
                      (|PFO;subst_mp_ni| (SPADCALL |c| (QREFELT % 105)) |ni| %)
                      (QREFELT % 23)))))) 

(SDEFUN |PFO;handle_imaginary;FdR;32|
        ((|fd| (|FiniteDivisor| F UP UPUP R))
         (%
          (|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                    (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|)))))
        (SPROG
         ((|nd| (UPUP)) (|nva| (|Vector| UPUP)) (#1=#:G604 NIL) (|vi| NIL)
          (#2=#:G603 NIL) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)) (|nf| (UPUP))
          (|f| (UPUP)) (|ni| (|Expression| R0))
          (|p0| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |p0|
                (SPADCALL (SPADCALL (|spadConstant| % 147) 2 (QREFELT % 148))
                          (|spadConstant| % 149) (QREFELT % 150)))
          (LETT |ni| (SPADCALL |p0| (QREFELT % 153)))
          (LETT |f| (SPADCALL (QREFELT % 128)))
          (LETT |nf| (|PFO;subst_upup_ni| |f| |ni| %))
          (LETT |id| (SPADCALL |fd| (QREFELT % 117)))
          (LETT |n| (SPADCALL |id| (QREFELT % 119)))
          (LETT |nva|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |vi| NIL)
                       (LETT #1# (SPADCALL |n| (QREFELT % 155))) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |vi| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (|PFO;subst_upup_ni|
                                 (SPADCALL |vi| (QREFELT % 113)) |ni| %)
                                #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT % 156)))
          (LETT |nd|
                (|PFO;subst_upup_ni|
                 (SPADCALL
                  (SPADCALL (SPADCALL |id| (QREFELT % 124)) (QREFELT % 94))
                  (QREFELT % 157))
                 |ni| %))
          (EXIT (VECTOR |nf| |nva| |nd| (SPADCALL |f| |nf| (QREFELT % 158))))))) 

(SDEFUN |PFO;handle_imaginary;FdR;33|
        ((|fd| (|FiniteDivisor| F UP UPUP R))
         (%
          (|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                    (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|)))))
        (SPROG
         ((|nva| (|Vector| UPUP)) (#1=#:G611 NIL) (|vi| NIL) (#2=#:G610 NIL)
          (|d| (UP)) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ (LETT |id| (SPADCALL |fd| (QREFELT % 117)))
              (LETT |n| (SPADCALL |id| (QREFELT % 119)))
              (LETT |d| (SPADCALL |id| (QREFELT % 124)))
              (LETT |nva|
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |vi| NIL)
                           (LETT #1# (SPADCALL |n| (QREFELT % 155))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |vi| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |vi| (QREFELT % 113))
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT % 156)))
              (EXIT
               (VECTOR (SPADCALL (QREFELT % 128)) |nva|
                       (SPADCALL (SPADCALL |d| (QREFELT % 94)) (QREFELT % 157))
                       NIL))))) 

(SDEFUN |PFO;handle_imaginary;FdR;34|
        ((|fd| (|FiniteDivisor| F UP UPUP R))
         (%
          (|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                    (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|)))))
        (SPROG
         ((|nva| (|Vector| UPUP)) (#1=#:G618 NIL) (|vi| NIL) (#2=#:G617 NIL)
          (|d| (UP)) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ (LETT |id| (SPADCALL |fd| (QREFELT % 117)))
              (LETT |n| (SPADCALL |id| (QREFELT % 119)))
              (LETT |d| (SPADCALL |id| (QREFELT % 124)))
              (LETT |nva|
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |vi| NIL)
                           (LETT #1# (SPADCALL |n| (QREFELT % 155))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |vi| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |vi| (QREFELT % 113))
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT % 156)))
              (EXIT
               (VECTOR (SPADCALL (QREFELT % 128)) |nva|
                       (SPADCALL (SPADCALL |d| (QREFELT % 94)) (QREFELT % 157))
                       NIL))))) 

(SDEFUN |PFO;UPQ_to_UPF|
        ((|p| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (% (|SparseUnivariatePolynomial| F)))
        (SPADCALL (CONS (|function| |PFO;Q2F|) %) |p| (QREFELT % 31))) 

(SDEFUN |PFO;algcurve|
        ((|d| (|FiniteDivisor| F UP UPUP R))
         (|rc|
          (|Record|
           (|:| |ncurve|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
           (|:| |disc| (|SparseUnivariatePolynomial| (|Integer|)))
           (|:| |dfpoly|
                (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (|k| (|Kernel| F)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|sae|
           (|Join|
            (|MonogenicAlgebra| |gf| #1=(|SparseUnivariatePolynomial| |gf|))
            (CATEGORY |package|
             (IF (|has| |gf| (|Field|))
                 (IF (|has| |gf| (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|)
             (IF (|has| #1# (|Hashable|))
                 (ATTRIBUTE (|Hashable|))
                 |noBranch|))))
          (|alpha| (|gf|)) (|m| (|SparseUnivariatePolynomial| |gf|))
          (|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| %)
                   (|ConvertibleTo| (|Integer|)) (|Canonical|)
                   (CATEGORY |domain| (SIGNATURE |sqrt| (% %))
                    (SIGNATURE |quadraticNonResidue| (%)))))
          (|mm| #2=(|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|pp| (UPUP)) (|p| #3=(|PositiveInteger|))
          (|pr| (|Record| (|:| |prime| #3#) (|:| |poly| #2#)))
          (|dd|
           #4=(|SparseUnivariatePolynomial|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
          (|s| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|b2| (UP)) (|b| #4#)
          (|h|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|hh| (R)) (|mn| (|Integer|)) (|n| (|Vector| R))
          (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|k1| (|Kernel| F)) (|mp| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |k1|
                (SEQ (LETT |mp| (SPADCALL |k| (QREFELT % 161)))
                     (EXIT
                      (COND
                       ((SPADCALL (CONS #'|PFO;algcurve!0| %)
                                  (SPADCALL |mp| (QREFELT % 164))
                                  (QREFELT % 166))
                        |k|)
                       ((|HasCategory| (QREFELT % 7)
                                       '(|AlgebraicallyClosedField|))
                        (|SPADfirst|
                         (SPADCALL
                          (SPADCALL (|PFO;UPQ_to_UPF| (QVELT |rc| 2) %)
                                    (QREFELT % 167))
                          (QREFELT % 168))))
                       (#5='T (|error| "cannot reduce root"))))))
          (LETT |mn|
                (SPADCALL
                 (LETT |n|
                       (SPADCALL
                        (LETT |i|
                              (SPADCALL (SPADCALL |d| (QREFELT % 117))
                                        (QREFELT % 169)))
                        (QREFELT % 119)))
                 (QREFELT % 125)))
          (LETT |h|
                (|PFO;kpmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |n| (+ |mn| 1) (QREFELT % 170)))
                  (QREFELT % 113))
                 |k| %))
          (LETT |b2|
                (SPADCALL
                 (|PFO;raise2|
                  (LETT |b|
                        (|PFO;krmod|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |mn| (QREFELT % 170))
                                    (QREFELT % 171))
                          (QREFELT % 53))
                         |k| %))
                  |k1| %)
                 (QREFELT % 172)))
          (LETT |s|
                (|PFO;kqmod|
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (SPADCALL
                     (|PFO;raise2|
                      (|PFO;krmod|
                       (SPADCALL (SPADCALL |hh| (QREFELT % 173))
                                 (QREFELT % 53))
                       |k| %)
                      |k1| %)
                     |b2| (QREFELT % 175)))
                   (QREFELT % 172))
                  |b2| (QREFELT % 176))
                 |k1| %))
          (LETT |pr|
                (|PFO;kgetGoodPrime| |rc| |s| |h| |b|
                 (LETT |dd| (|PFO;krmod| (SPADCALL |i| (QREFELT % 124)) |k| %))
                 %))
          (LETT |p| (QCAR |pr|))
          (LETT |pp| (|PFO;UP32UPUP| (QVELT |rc| 0) |k| %))
          (LETT |mm| (QCDR |pr|)) (LETT |gf| (|InnerPrimeField| |p|))
          (LETT |m|
                (SPADCALL (CONS #'|PFO;algcurve!1| (VECTOR |gf| %)) |mm|
                          (|compiledLookupCheck| '|map|
                                                 (LIST
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (|devaluate| |gf|))
                                                  (LIST '|Mapping|
                                                        (|devaluate| |gf|)
                                                        (LIST '|Fraction|
                                                              (LIST
                                                               '|Integer|)))
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (LIST '|Fraction|
                                                         (LIST '|Integer|))))
                                                 (|SparseUnivariatePolynomialFunctions2|
                                                  (|Fraction| (|Integer|))
                                                  |gf|))))
          (EXIT
           (COND
            ((EQL
              (SPADCALL |m|
                        (|compiledLookupCheck| '|degree|
                                               (LIST
                                                (LIST '|NonNegativeInteger|)
                                                '%)
                                               (|SparseUnivariatePolynomial|
                                                |gf|)))
              1)
             (SEQ
              (LETT |alpha|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |m| 0
                                (|compiledLookupCheck| '|coefficient|
                                                       (LIST (|devaluate| |gf|)
                                                             '%
                                                             (LIST
                                                              '|NonNegativeInteger|))
                                                       (|SparseUnivariatePolynomial|
                                                        |gf|)))
                      (SPADCALL |m|
                                (|compiledLookupCheck| '|leadingCoefficient|
                                                       (LIST (|devaluate| |gf|)
                                                             '%)
                                                       (|SparseUnivariatePolynomial|
                                                        |gf|)))
                      (|compiledLookupCheck| '/ (LIST '% '% '%) |gf|))
                     (|compiledLookupCheck| '- (LIST '% '%) |gf|)))
              (EXIT
               (SPADCALL |d| |pp|
                         (CONS #'|PFO;algcurve!3| (VECTOR |alpha| |k| % |gf|))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT % 7))
                                                       (|devaluate| (ELT % 8))
                                                       (|devaluate| (ELT % 9))
                                                       (|devaluate|
                                                        (ELT % 10)))
                                                 (|devaluate| (ELT % 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |gf|)
                                                       (|devaluate|
                                                        (ELT % 7))))
                                                (|ReducedDivisor| (ELT % 7)
                                                                  (ELT % 8)
                                                                  (ELT % 9)
                                                                  (ELT % 10)
                                                                  |gf|))))))
            (#5#
             (SEQ
              (LETT |sae|
                    (|SimpleAlgebraicExtension| |gf|
                                                (|SparseUnivariatePolynomial|
                                                 |gf|)
                                                |m|))
              (EXIT
               (SPADCALL |d| |pp|
                         (CONS #'|PFO;algcurve!5| (VECTOR |sae| |k| % |gf|))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT % 7))
                                                       (|devaluate| (ELT % 8))
                                                       (|devaluate| (ELT % 9))
                                                       (|devaluate|
                                                        (ELT % 10)))
                                                 (|devaluate| (ELT % 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |sae|)
                                                       (|devaluate|
                                                        (ELT % 7))))
                                                (|ReducedDivisor| (ELT % 7)
                                                                  (ELT % 8)
                                                                  (ELT % 9)
                                                                  (ELT % 10)
                                                                  |sae|))))))))))) 

(SDEFUN |PFO;algcurve!5| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| % |k| |sae|)
          (LETT |gf| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |k| (QREFELT $$ 1))
          (LETT |sae| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;algcurve!4| (VECTOR |gf| %))
                              (|PFO;kqmod| |z1| |k| %)
                              (|compiledLookupCheck| '|map|
                                                     (LIST
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate| |gf|))
                                                      (LIST '|Mapping|
                                                            (|devaluate| |gf|)
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Integer|)))
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (LIST '|Fraction|
                                                             (LIST
                                                              '|Integer|))))
                                                     (|SparseUnivariatePolynomialFunctions2|
                                                      (|Fraction| (|Integer|))
                                                      |gf|)))
                    (|compiledLookupCheck| '|reduce|
                                           (LIST '%
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| |gf|)))
                                           |sae|))))))) 

(SDEFUN |PFO;algcurve!4| ((|q1| NIL) ($$ NIL))
        (PROG (% |gf|)
          (LETT % (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |q1| (QREFELT % 20))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '% (LIST '|Integer|))
                                              |gf|))
             (SPADCALL (SPADCALL |q1| (QREFELT % 22))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '% (LIST '|Integer|))
                                              |gf|))
             (|compiledLookupCheck| '/ (LIST '% '% '%) |gf|)))))) 

(SDEFUN |PFO;algcurve!3| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| % |k| |alpha|)
          (LETT |gf| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |k| (QREFELT $$ 1))
          (LETT |alpha| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;algcurve!2| (VECTOR |gf| %))
                              (|PFO;kqmod| |z1| |k| %)
                              (|compiledLookupCheck| '|map|
                                                     (LIST
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate| |gf|))
                                                      (LIST '|Mapping|
                                                            (|devaluate| |gf|)
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Integer|)))
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (LIST '|Fraction|
                                                             (LIST
                                                              '|Integer|))))
                                                     (|SparseUnivariatePolynomialFunctions2|
                                                      (|Fraction| (|Integer|))
                                                      |gf|)))
                    |alpha|
                    (|compiledLookupCheck| '|elt|
                                           (LIST (|devaluate| |gf|) '%
                                                 (|devaluate| |gf|))
                                           (|SparseUnivariatePolynomial|
                                            |gf|)))))))) 

(SDEFUN |PFO;algcurve!2| ((|q1| NIL) ($$ NIL))
        (PROG (% |gf|)
          (LETT % (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |q1| (QREFELT % 20))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '% (LIST '|Integer|))
                                              |gf|))
             (SPADCALL (SPADCALL |q1| (QREFELT % 22))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '% (LIST '|Integer|))
                                              |gf|))
             (|compiledLookupCheck| '/ (LIST '% '% '%) |gf|)))))) 

(SDEFUN |PFO;algcurve!1| ((|z1| NIL) ($$ NIL))
        (PROG (% |gf|)
          (LETT % (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT % 177))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '% (LIST '|Integer|))
                                             |gf|)))))) 

(SDEFUN |PFO;algcurve!0| ((|x| NIL) (% NIL))
        (QEQCAR (SPADCALL |x| (QREFELT % 163)) 0)) 

(SDEFUN |PFO;ratcurve|
        ((|d| (|FiniteDivisor| F UP UPUP R))
         (|rc|
          (|Record|
           (|:| |ncurve|
                (|SparseUnivariatePolynomial|
                 (|Fraction|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
           (|:| |disc| (|Integer|))))
         (% (|NonNegativeInteger|)))
        (SPROG
         ((|m| #1=(|NonNegativeInteger|)) (|n| #1#) (|p| (|PositiveInteger|))
          (|pp| (UPUP)) (|bad| (|Integer|)) (|r| (|Fraction| (|Integer|)))
          (|bd| (|Record| (|:| |den| (|Integer|)) (|:| |gcdnum| (|Integer|))))
          (|s| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|b| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|h|
           (|SparseUnivariatePolynomial|
            (|Fraction|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|hh| (R)) (|mn| (|Integer|)) (|nm| (|Vector| R))
          (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ
          (LETT |mn|
                (SPADCALL
                 (LETT |nm|
                       (SPADCALL
                        (LETT |i|
                              (SPADCALL (SPADCALL |d| (QREFELT % 117))
                                        (QREFELT % 169)))
                        (QREFELT % 119)))
                 (QREFELT % 125)))
          (LETT |h|
                (|PFO;pmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |nm| (+ |mn| 1) (QREFELT % 170)))
                  (QREFELT % 113))
                 %))
          (LETT |b|
                (|PFO;rmod|
                 (SPADCALL
                  (SPADCALL (SPADCALL |nm| |mn| (QREFELT % 170))
                            (QREFELT % 171))
                  (QREFELT % 53))
                 %))
          (LETT |s|
                (QCAR
                 (SPADCALL
                  (|PFO;rmod|
                   (SPADCALL (SPADCALL |hh| (QREFELT % 173)) (QREFELT % 53)) %)
                  |b| (QREFELT % 180))))
          (LETT |bd|
                (SPADCALL (|PFO;rmod| (SPADCALL |i| (QREFELT % 124)) %)
                          (QREFELT % 76)))
          (LETT |r| (SPADCALL |s| |b| (QREFELT % 181)))
          (LETT |bad|
                (SPADCALL
                 (LIST (SPADCALL (SPADCALL (QREFELT % 183)) (QREFELT % 184))
                       (QCDR |rc|) (SPADCALL |r| (QREFELT % 20))
                       (SPADCALL |r| (QREFELT % 22))
                       (* (QCAR |bd|) (QCDR |bd|))
                       (SPADCALL |h| (QREFELT % 185)))
                 (QREFELT % 81)))
          (LETT |pp| (|PFO;Q2UPUP| (QCAR |rc|) %))
          (LETT |n|
                (|PFO;rat| |pp| |d| (LETT |p| (SPADCALL |bad| (QREFELT % 186)))
                 %))
          (EXIT
           (COND ((EQL |n| 1) |n|)
                 (#2='T
                  (SEQ
                   (LETT |m|
                         (|PFO;rat| |pp| |d|
                          (SPADCALL (* |p| |bad|) (QREFELT % 186)) %))
                   (EXIT (COND ((EQL |n| |m|) |n|) (#2# 0)))))))))) 

(SDEFUN |PFO;rat|
        ((|pp| (UPUP)) (|d| (|FiniteDivisor| F UP UPUP R))
         (|p| (|PositiveInteger|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| %)
                   (|ConvertibleTo| (|Integer|)) (|Canonical|)
                   (CATEGORY |domain| (SIGNATURE |sqrt| (% %))
                    (SIGNATURE |quadraticNonResidue| (%))))))
         (SEQ (LETT |gf| (|InnerPrimeField| |p|))
              (EXIT
               (SPADCALL |d| |pp| (CONS #'|PFO;rat!0| (VECTOR |gf| %))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT % 7))
                                                       (|devaluate| (ELT % 8))
                                                       (|devaluate| (ELT % 9))
                                                       (|devaluate|
                                                        (ELT % 10)))
                                                 (|devaluate| (ELT % 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |gf|)
                                                       (|devaluate|
                                                        (ELT % 7))))
                                                (|ReducedDivisor| (ELT % 7)
                                                                  (ELT % 8)
                                                                  (ELT % 9)
                                                                  (ELT % 10)
                                                                  |gf|))))))) 

(SDEFUN |PFO;rat!0| ((|q1| NIL) ($$ NIL))
        (PROG (% |gf|)
          (LETT % (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|qq| NIL))
                   (SEQ (LETT |qq| (|PFO;qmod| |q1| %))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |qq| (QREFELT % 20))
                                    (|compiledLookupCheck| '|coerce|
                                                           (LIST '%
                                                                 (LIST
                                                                  '|Integer|))
                                                           |gf|))
                          (SPADCALL (SPADCALL |qq| (QREFELT % 22))
                                    (|compiledLookupCheck| '|coerce|
                                                           (LIST '%
                                                                 (LIST
                                                                  '|Integer|))
                                                           |gf|))
                          (|compiledLookupCheck| '/ (LIST '% '% '%)
                                                 |gf|))))))))) 

(SDEFUN |PFO;evalup|
        ((|upup| (UPUP)) (|la| (|List| (|Kernel| F))) (|lrhs| (|List| F))
         (% (UPUP)))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;evalup!2| (VECTOR % |lrhs| |la|)) |upup|
                         (QREFELT % 146)))) 

(SDEFUN |PFO;evalup!2| ((|a| NIL) ($$ NIL))
        (PROG (|la| |lrhs| %)
          (LETT |la| (QREFELT $$ 2))
          (LETT |lrhs| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!1| (VECTOR |la| |lrhs| %)) |a|
                             (QREFELT % 144))))))) 

(SDEFUN |PFO;evalup!1| ((|b| NIL) ($$ NIL))
        (PROG (% |lrhs| |la|)
          (LETT % (QREFELT $$ 2))
          (LETT |lrhs| (QREFELT $$ 1))
          (LETT |la| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!0| (VECTOR % |lrhs| |la|)) |b|
                             (QREFELT % 142))))))) 

(SDEFUN |PFO;evalup!0| ((|c| NIL) ($$ NIL))
        (PROG (|la| |lrhs| %)
          (LETT |la| (QREFELT $$ 2))
          (LETT |lrhs| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |la| |lrhs| (QREFELT % 187)))))) 

(SDEFUN |PFO;simplifyCoeffs;RLNni;40|
        ((|irec|
          (|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                    (|:| |n_div_denom| UPUP)
                    . #1=((|:| |need_change| (|Boolean|)))))
         (|la| (|List| (|Kernel| F))) (% (|NonNegativeInteger|)))
        (SPROG
         ((|ndiv| (|nFD|)) (|va| (|Vector| |nR|)) (#2=#:G673 NIL)
          (#3=#:G675 NIL) (|ni| NIL) (#4=#:G674 NIL) (|nd| (|nR|))
          (|nPFO|
           (CATEGORY |package|
            (SIGNATURE |order|
             ((|Union| (|NonNegativeInteger|) "failed")
              (|FiniteDivisor| F UP UPUP |nR|)))
            (SIGNATURE |torsion?|
             ((|Boolean|) (|FiniteDivisor| F UP UPUP |nR|)))
            (SIGNATURE |torsionIfCan|
             ((|Union|
               (|Record| (|:| |order| (|NonNegativeInteger|))
                         (|:| |function| |nR|))
               "failed")
              (|FiniteDivisor| F UP UPUP |nR|)))
            (SIGNATURE |cmult|
             ((|SparseMultivariatePolynomial| R0 (|Kernel| F))
              (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))))
            (SIGNATURE |possibleOrder|
             ((|NonNegativeInteger|) (|FiniteDivisor| F UP UPUP |nR|)))
            (SIGNATURE |handle_imaginary|
             ((|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                        (|:| |n_div_denom| UPUP)
                        (|:| |need_change| (|Boolean|)))
              (|FiniteDivisor| F UP UPUP |nR|)))
            (IF (|has| R0 (|CharacteristicZero|))
                (IF (|has| F (|AlgebraicallyClosedField|))
                    (SIGNATURE |simplifyCoeffs|
                     ((|NonNegativeInteger|)
                      (|Record| (|:| |ncurve| UPUP)
                                (|:| |n_div_numer| (|Vector| UPUP))
                                (|:| |n_div_denom| UPUP) . #1#)
                      (|List| (|Kernel| F))))
                    |noBranch|)
                |noBranch|)))
          (|nFR|
           (|Join| (|Group|)
                   (CATEGORY |domain| (SIGNATURE |ideal| (% (|Vector| |nR|)))
                    (SIGNATURE |basis| ((|Vector| |nR|) %))
                    (SIGNATURE |norm| ((|Fraction| UP) %))
                    (SIGNATURE |numer| ((|Vector| |nR|) %))
                    (SIGNATURE |denom| (UP %)) (SIGNATURE |minimize| (% %))
                    (SIGNATURE |randomLC|
                     (|nR| (|NonNegativeInteger|) (|Vector| |nR|))))))
          (|nFD|
           (|Join| (|FiniteDivisorCategory| F UP UPUP |nR|)
                   (CATEGORY |domain|
                    (SIGNATURE |finiteBasis| ((|Vector| |nR|) %))
                    (SIGNATURE |lSpaceBasis| ((|Vector| |nR|) %)))))
          (|nR|
           (|Join| (|FunctionFieldCategory| F UP UPUP)
                   (CATEGORY |package|
                    (SIGNATURE |knownInfBasis|
                     ((|Void|) (|NonNegativeInteger|))))))
          (|nf| (UPUP)) (|lrhs| (|List| F)) (#5=#:G672 NIL) (|pol| NIL)
          (#6=#:G671 NIL) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |poly| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (#7=#:G670 NIL) (|k| NIL) (#8=#:G669 NIL))
         (SEQ
          (LETT |rec|
                (SPADCALL
                 (PROGN
                  (LETT #8# NIL)
                  (SEQ (LETT |k| NIL) (LETT #7# |la|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #8# (CONS (SPADCALL |k| (QREFELT % 33)) #8#))))
                       (LETT #7# (CDR #7#)) (GO G190) G191
                       (EXIT (NREVERSE #8#))))
                 (QREFELT % 190)))
          (LETT |y| (SPADCALL (QVELT |rec| 2) (QREFELT % 167)))
          (LETT |lrhs|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |pol| NIL) (LETT #5# (QVELT |rec| 1)) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |pol| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL |pol| |y| (QREFELT % 34)) #6#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |nf| (|PFO;evalup| (QVELT |irec| 0) |la| |lrhs| %))
          (LETT |nR|
                (|AlgebraicFunctionField| (QREFELT % 7) (QREFELT % 8)
                                          (QREFELT % 9) |nf|))
          (LETT |nFD|
                (|FiniteDivisor| (QREFELT % 7) (QREFELT % 8) (QREFELT % 9)
                                 |nR|))
          (LETT |nFR|
                (|FractionalIdeal| (QREFELT % 8) (|Fraction| (QREFELT % 8))
                                   (QREFELT % 9) |nR|))
          (LETT |nPFO|
                (|PointsOfFiniteOrder| (QREFELT % 6) (QREFELT % 7)
                                       (QREFELT % 8) (QREFELT % 9) |nR|))
          (LETT |nd|
                (SPADCALL (|PFO;evalup| (QVELT |irec| 2) |la| |lrhs| %)
                          (|compiledLookupCheck| '|reduce|
                                                 (LIST '%
                                                       (|devaluate| (ELT % 9)))
                                                 |nR|)))
          (LETT |va|
                (PROGN
                 (LETT #4#
                       (GETREFV
                        (SIZE #9=(SPADCALL (QVELT |irec| 1) (QREFELT % 131)))))
                 (SEQ (LETT |ni| NIL) (LETT #3# #9#) (LETT #2# 0) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |ni| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #4# #2#
                                (SPADCALL
                                 (SPADCALL (|PFO;evalup| |ni| |la| |lrhs| %)
                                           (|compiledLookupCheck| '|reduce|
                                                                  (LIST '%
                                                                        (|devaluate|
                                                                         (ELT %
                                                                              9)))
                                                                  |nR|))
                                 |nd|
                                 (|compiledLookupCheck| '/ (LIST '% '% '%)
                                                        |nR|)))))
                      (LETT #2# (PROG1 (|inc_SI| #2#) (LETT #3# (CDR #3#))))
                      (GO G190) G191 (EXIT NIL))
                 #4#))
          (LETT |ndiv|
                (SPADCALL
                 (SPADCALL |va|
                           (|compiledLookupCheck| '|ideal|
                                                  (LIST '%
                                                        (LIST '|Vector|
                                                              (|devaluate|
                                                               |nR|)))
                                                  |nFR|))
                 (|compiledLookupCheck| '|divisor|
                                        (LIST '%
                                              (LIST '|FractionalIdeal|
                                                    (|devaluate| (ELT % 8))
                                                    (LIST '|Fraction|
                                                          (|devaluate|
                                                           (ELT % 8)))
                                                    (|devaluate| (ELT % 9))
                                                    (|devaluate| |nR|)))
                                        |nFD|)))
          (EXIT
           (SPADCALL |ndiv|
                     (|compiledLookupCheck| '|possibleOrder|
                                            (LIST (LIST '|NonNegativeInteger|)
                                                  (LIST '|FiniteDivisor|
                                                        (|devaluate| (ELT % 7))
                                                        (|devaluate| (ELT % 8))
                                                        (|devaluate| (ELT % 9))
                                                        (|devaluate| |nR|)))
                                            |nPFO|)))))) 

(SDEFUN |PFO;possibleOrder;FdNni;41|
        ((|d| (|FiniteDivisor| F UP UPUP R)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|va| (|Vector| R)) (#1=#:G692 NIL) (#2=#:G694 NIL) (|ni| NIL)
          (#3=#:G693 NIL) (|nden| (R)) (#4=#:G691 NIL)
          (|la| (|List| (|Kernel| F)))
          (|irec|
           (|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                     (|:| |n_div_denom| UPUP)
                     (|:| |need_change| (|Boolean|)))))
         (SEQ
          (EXIT
           (COND
            ((OR (ZEROP (SPADCALL (QREFELT % 192)))
                 (EQL
                  (QVSIZE
                   (SPADCALL (SPADCALL |d| (QREFELT % 117)) (QREFELT % 119)))
                  1))
             1)
            ('T
             (SEQ
              (LETT |d|
                    (SPADCALL (QCAR (SPADCALL |d| (QREFELT % 194)))
                              (QREFELT % 195)))
              (LETT |irec| (SPADCALL |d| (QREFELT % 160)))
              (LETT |la|
                    (|PFO;alglist1| (QVELT |irec| 0) (QVELT |irec| 1)
                     (QVELT |irec| 2) %))
              (EXIT
               (COND ((NULL |la|) (|PFO;ratcurve| |d| (|PFO;selIntegers| %) %))
                     (#5='T
                      (SEQ
                       (COND
                        ((NULL (CDR |la|))
                         (COND
                          ((QVELT |irec| 3)
                           (EXIT
                            (SEQ
                             (COND
                              ((|HasCategory| (QREFELT % 6)
                                              '(|CharacteristicZero|))
                               (COND
                                ((|HasCategory| (QREFELT % 7)
                                                '(|AlgebraicallyClosedField|))
                                 (PROGN
                                  (LETT #4#
                                        (SPADCALL |irec| |la| (QREFELT % 191)))
                                  (GO #6=#:G690))))))
                             (EXIT
                              (|error|
                               #7="PFO::possibleOrder: more than 1 algebraic constant")))))))
                        (#5#
                         (EXIT
                          (SEQ
                           (COND
                            ((|HasCategory| (QREFELT % 6)
                                            '(|CharacteristicZero|))
                             (COND
                              ((|HasCategory| (QREFELT % 7)
                                              '(|AlgebraicallyClosedField|))
                               (PROGN
                                (LETT #4#
                                      (SPADCALL |irec| |la| (QREFELT % 191)))
                                (GO #6#))))))
                           (EXIT (|error| #7#))))))
                       (LETT |nden|
                             (SPADCALL (QVELT |irec| 2) (QREFELT % 196)))
                       (LETT |va|
                             (PROGN
                              (LETT #3#
                                    (GETREFV
                                     (SIZE
                                      #8=(SPADCALL (QVELT |irec| 1)
                                                   (QREFELT % 131)))))
                              (SEQ (LETT |ni| NIL) (LETT #2# #8#) (LETT #1# 0)
                                   G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |ni| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SETELT #3# #1#
                                             (SPADCALL
                                              (SPADCALL |ni| (QREFELT % 196))
                                              |nden| (QREFELT % 197)))))
                                   (LETT #1#
                                         (PROG1 (|inc_SI| #1#)
                                           (LETT #2# (CDR #2#))))
                                   (GO G190) G191 (EXIT NIL))
                              #3#))
                       (LETT |d|
                             (SPADCALL (SPADCALL |va| (QREFELT % 198))
                                       (QREFELT % 195)))
                       (EXIT
                        (|PFO;algcurve| |d|
                         (|PFO;selectIntegers| (|SPADfirst| |la|) %)
                         (|SPADfirst| |la|) %))))))))))
          #6# (EXIT #4#)))) 

(SDEFUN |PFO;double_disc| ((|f| (UPUP)) (% (F)))
        (SPROG ((#1=#:G696 NIL) (|g| (UP)) (|d| (UP)))
               (SEQ
                (LETT |d|
                      (SPADCALL (SPADCALL |f| (QREFELT % 199)) (QREFELT % 53)))
                (LETT |g|
                      (SPADCALL |d| (SPADCALL |d| (QREFELT % 200))
                                (QREFELT % 201)))
                (EXIT
                 (SPADCALL
                  (PROG2 (LETT #1# (SPADCALL |d| |g| (QREFELT % 203)))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT % 8)
                                    (|Union| (QREFELT % 8) "failed") #1#))
                  (QREFELT % 204)))))) 

(SDEFUN |PFO;selIntegers|
        ((%
          (|Record|
           (|:| |ncurve|
                (|SparseUnivariatePolynomial|
                 (|Fraction|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
           (|:| |disc| (|Integer|)))))
        (SPROG
         ((#1=#:G706 NIL) (|d| (|Integer|)) (|n| (|Integer|)) (|d0| (F))
          (|g| (UPUP)) (|f| (UPUP)))
         (SEQ
          (EXIT
           (SEQ (LETT |f| (SPADCALL (QREFELT % 128)))
                (LETT |g| (|PFO;polyred| |f| %))
                (LETT |d0| (|PFO;double_disc| |g| %)) (LETT |n| (EXPT 10 6))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (SPADCALL |n| (QREFELT % 206))
                           (LETT |d|
                                 (SPADCALL (|PFO;qmod| |d0| %)
                                           (QREFELT % 177)))
                           (EXIT
                            (COND
                             ((NULL (ZEROP |d|))
                              (PROGN
                               (LETT #1# (CONS (|PFO;pmod| |g| %) |d|))
                               (GO #2=#:G705))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |PFO;selectIntegers|
        ((|k| (|Kernel| F))
         (%
          (|Record|
           (|:| |ncurve|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
           (|:| |disc| (|SparseUnivariatePolynomial| (|Integer|)))
           (|:| |dfpoly|
                (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#1=#:G717 NIL)
          (|r|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (#2=#:G716 NIL) (|d| (|SparseUnivariatePolynomial| (|Integer|)))
          (|d1| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|n| (|Integer|)) (|p| (|SparseUnivariatePolynomial| F)) (|d0| (F))
          (|g| (UPUP)) (|f| (UPUP)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g| (|PFO;polyred| (LETT |f| (SPADCALL (QREFELT % 128))) %))
            (LETT |d0| (|PFO;double_disc| |g| %))
            (LETT |p| (SPADCALL |k| (QREFELT % 161))) (LETT |n| (EXPT 10 6))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (SEQ (SPADCALL |n| (QREFELT % 206))
                         (LETT |d1| (|PFO;kqmod| |d0| |k| %))
                         (LETT |d| (SPADCALL (ELT % 177) |d1| (QREFELT % 210)))
                         (EXIT
                          (COND
                           ((SPADCALL |d| (QREFELT % 211))
                            (PROGN (LETT #2# |$NoValue|) (GO #3=#:G708)))
                           ('T
                            (SEQ (LETT |r| (|PFO;kpmod| |g| |k| %))
                                 (EXIT
                                  (PROGN
                                   (LETT #1#
                                         (VECTOR |r| |d|
                                                 (QCAR
                                                  (SPADCALL (|PFO;fmod| |p| %)
                                                            (QREFELT % 214)))))
                                   (GO #4=#:G715)))))))))
                   #3# (EXIT #2#))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #1#)))) 

(SDEFUN |PFO;order;FdU;45|
        ((|d| (|FiniteDivisor| F UP UPUP R))
         (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((OR
                  (ZEROP
                   (LETT |n|
                         (SPADCALL (LETT |d| (SPADCALL |d| (QREFELT % 82)))
                                   (QREFELT % 84))))
                  (NULL
                   (SPADCALL
                    (SPADCALL (SPADCALL |n| |d| (QREFELT % 85)) (QREFELT % 82))
                    (QREFELT % 215))))
                 (CONS 1 "failed"))
                ('T (CONS 0 |n|))))) 

(SDEFUN |PFO;kgetGoodPrime|
        ((|rec|
          (|Record|
           (|:| |ncurve|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
           (|:| |disc| (|SparseUnivariatePolynomial| (|Integer|)))
           (|:| |dfpoly|
                (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|h|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (|b|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|d|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (%
          (|Record| (|:| |prime| (|PositiveInteger|))
                    (|:| |poly|
                         (|SparseUnivariatePolynomial|
                          (|Fraction| (|Integer|)))))))
        (SPROG
         ((#1=#:G728 NIL) (|p| (|PositiveInteger|)) (#2=#:G730 NIL)
          (|u|
           (|Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                    #3="failed"))
          (#4=#:G725 NIL))
         (SEQ
          (LETT |p|
                (PROG1
                    (LETT #4#
                          (SPADCALL (SPADCALL (QREFELT % 183))
                                    (QREFELT % 217)))
                  (|check_subtype2| (> #4# 0) '(|PositiveInteger|) '(|Integer|)
                                    #4#)))
          (SEQ G190
               (COND
                ((NULL
                  (QEQCAR
                   (LETT |u| (|PFO;goodRed| |rec| |res| |h| |b| |d| |p| %)) 1))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |p|
                       (PROG1 (LETT #2# (SPADCALL |p| (QREFELT % 217)))
                         (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                           '(|Integer|) #2#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS |p|
                 (PROG2 (LETT #1# |u|)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial|
                                    (|Fraction| (|Integer|)))
                                   (|Union|
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction| (|Integer|)))
                                    #3#)
                                   #1#))))))) 

(SDEFUN |PFO;goodRed|
        ((|rec|
          (|Record|
           (|:| |ncurve|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
           (|:| |disc| (|SparseUnivariatePolynomial| (|Integer|)))
           (|:| |dfpoly|
                (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|h|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (|b|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|d|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|p| (|PositiveInteger|))
         (%
          (|Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                   "failed")))
        (SPROG
         ((|md| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|is_good| (|Boolean|)) (|mdg| (|SparseUnivariatePolynomial| |gf|))
          (#1=#:G759 NIL) (#2=#:G762 NIL) (|ff| NIL)
          (|discp| (|SparseUnivariatePolynomial| |gf|))
          (|l| (|List| (|SparseUnivariatePolynomial| |gf|))) (#3=#:G761 NIL)
          (|f| NIL) (#4=#:G760 NIL)
          (|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| %)
                   (|ConvertibleTo| (|Integer|)) (|Canonical|)
                   (CATEGORY |domain| (SIGNATURE |sqrt| (% %))
                    (SIGNATURE |quadraticNonResidue| (%))))))
         (SEQ
          (COND
           ((SPADCALL (CONS #'|PFO;goodRed!0| (VECTOR % |p|))
                      (SPADCALL (QVELT |rec| 1) (QREFELT % 221))
                      (QREFELT % 223))
            (CONS 1 "failed"))
           (#5='T
            (SEQ (LETT |gf| (|InnerPrimeField| |p|))
                 (LETT |l|
                       (PROGN
                        (LETT #4# NIL)
                        (SEQ (LETT |f| NIL)
                             (LETT #3#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (CONS #'|PFO;goodRed!1| (VECTOR |gf| %))
                                      (QVELT |rec| 2)
                                      (|compiledLookupCheck| '|map|
                                                             (LIST
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (|devaluate|
                                                                |gf|))
                                                              (LIST '|Mapping|
                                                                    (|devaluate|
                                                                     |gf|)
                                                                    (LIST
                                                                     '|Fraction|
                                                                     (LIST
                                                                      '|Integer|)))
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (LIST
                                                                '|Fraction|
                                                                (LIST
                                                                 '|Integer|))))
                                                             (|SparseUnivariatePolynomialFunctions2|
                                                              (|Fraction|
                                                               (|Integer|))
                                                              |gf|)))
                                     (|compiledLookupCheck| '|factor|
                                                            (LIST
                                                             (LIST '|Factored|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     |gf|)))
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (|devaluate|
                                                               |gf|)))
                                                            (|UnivariateFiniteFieldFactorize|
                                                             |gf|
                                                             (|SparseUnivariatePolynomial|
                                                              |gf|))))
                                    (|compiledLookupCheck| '|factorList|
                                                           (LIST
                                                            (LIST '|List|
                                                                  (LIST
                                                                   '|Record|
                                                                   (LIST '|:|
                                                                         '|flag|
                                                                         (LIST
                                                                          '|Union|
                                                                          '"nil"
                                                                          '"sqfr"
                                                                          '"irred"
                                                                          '"prime"))
                                                                   (LIST '|:|
                                                                         '|factor|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           |gf|)))
                                                                   (LIST '|:|
                                                                         '|exponent|
                                                                         (LIST
                                                                          '|NonNegativeInteger|))))
                                                            '%)
                                                           (|Factored|
                                                            (|SparseUnivariatePolynomial|
                                                             |gf|)))))
                             G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL (QVELT |f| 2) 1)
                                 (LETT #4# (CONS (QVELT |f| 1) #4#))))))
                             (LETT #3# (CDR #3#)) (GO G190) G191
                             (EXIT (NREVERSE #4#)))))
                 (EXIT
                  (COND ((NULL |l|) (CONS 1 "failed"))
                        (#5#
                         (SEQ
                          (LETT |discp|
                                (SPADCALL
                                 (|compiledLookupCheck| '|coerce|
                                                        (LIST '%
                                                              (LIST
                                                               '|Integer|))
                                                        |gf|)
                                 (QVELT |rec| 1)
                                 (|compiledLookupCheck| '|map|
                                                        (LIST
                                                         (LIST
                                                          '|SparseUnivariatePolynomial|
                                                          (|devaluate| |gf|))
                                                         (LIST '|Mapping|
                                                               (|devaluate|
                                                                |gf|)
                                                               (LIST
                                                                '|Integer|))
                                                         (LIST
                                                          '|SparseUnivariatePolynomial|
                                                          (LIST '|Integer|)))
                                                        (|SparseUnivariatePolynomialFunctions2|
                                                         (|Integer|) |gf|))))
                          (LETT |mdg| (|SPADfirst| |l|)) (LETT |is_good| NIL)
                          (SEQ (LETT |ff| NIL) (LETT #2# |l|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |ff| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (SPADCALL |discp| |ff|
                                              (|compiledLookupCheck| '|rem|
                                                                     (LIST '%
                                                                           '%
                                                                           '%)
                                                                     (|SparseUnivariatePolynomial|
                                                                      |gf|)))
                                    (SPADCALL
                                     (|compiledLookupCheck| '|Zero| (LIST '%)
                                                            (|SparseUnivariatePolynomial|
                                                             |gf|)))
                                    (|compiledLookupCheck| '=
                                                           (LIST
                                                            (LIST '|Boolean|)
                                                            '% '%)
                                                           (|SparseUnivariatePolynomial|
                                                            |gf|)))
                                   (PROGN
                                    (LETT #1# |$NoValue|)
                                    (GO #6=#:G748)))
                                  ('T
                                   (SEQ
                                    (COND
                                     (|is_good|
                                      (COND
                                       ((<
                                         (SPADCALL |ff|
                                                   (|compiledLookupCheck|
                                                    '|degree|
                                                    (LIST
                                                     (LIST
                                                      '|NonNegativeInteger|)
                                                     '%)
                                                    (|SparseUnivariatePolynomial|
                                                     |gf|)))
                                         (SPADCALL |mdg|
                                                   (|compiledLookupCheck|
                                                    '|degree|
                                                    (LIST
                                                     (LIST
                                                      '|NonNegativeInteger|)
                                                     '%)
                                                    (|SparseUnivariatePolynomial|
                                                     |gf|))))
                                        (EXIT (LETT |mdg| |ff|))))))
                                    (EXIT (LETT |is_good| 'T))))))
                                #6# (EXIT #1#))
                               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (COND
                            (|is_good|
                             (SEQ
                              (LETT |md|
                                    (SPADCALL
                                     (CONS #'|PFO;goodRed!2| (VECTOR % |gf|))
                                     |mdg|
                                     (|compiledLookupCheck| '|map|
                                                            (LIST
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (LIST '|Fraction|
                                                                    (LIST
                                                                     '|Integer|)))
                                                             (LIST '|Mapping|
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|Integer|))
                                                                   (|devaluate|
                                                                    |gf|))
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (|devaluate|
                                                               |gf|)))
                                                            (|SparseUnivariatePolynomialFunctions2|
                                                             |gf|
                                                             (|Fraction|
                                                              (|Integer|))))))
                              (EXIT
                               (COND
                                ((|PFO;good?| |res| |h| |b| |d| |p| |md| %)
                                 (CONS 0 |md|))
                                (#5# (CONS 1 "failed"))))))
                            (#5# (CONS 1 "failed")))))))))))))) 

(SDEFUN |PFO;goodRed!2| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| %)
          (LETT |gf| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |z1|
                       (|compiledLookupCheck| '|convert|
                                              (LIST (LIST '|Integer|) '%)
                                              |gf|))
             (QREFELT % 224)))))) 

(SDEFUN |PFO;goodRed!1| ((|z1| NIL) ($$ NIL))
        (PROG (% |gf|)
          (LETT % (QREFELT $$ 1))
          (LETT |gf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT % 177))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '% (LIST '|Integer|))
                                             |gf|)))))) 

(SDEFUN |PFO;goodRed!0| ((|c| NIL) ($$ NIL))
        (PROG (|p| %)
          (LETT |p| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |p| (QREFELT % 218)) (QREFELT % 219)))))) 

(SDEFUN |PFO;good?|
        ((|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|h|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (|b|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|d|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|p| (|PositiveInteger|))
         (|m| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (% (|Boolean|)))
        (SPROG
         ((|bd| (|Record| (|:| |den| (|Integer|)) (|:| |gcdnum| (|Integer|)))))
         (SEQ
          (LETT |bd|
                (SPADCALL (SPADCALL |res| |m| (QREFELT % 73)) (QREFELT % 76)))
          (EXIT
           (COND
            ((OR (ZEROP (REM (QCAR |bd|) |p|))
                 (OR (ZEROP (REM (QCDR |bd|) |p|))
                     (OR (ZEROP (REM (|PFO;kbadBadNum| |b| |m| %) |p|))
                         (ZEROP (REM (|PFO;kbadBadNum| |d| |m| %) |p|)))))
             NIL)
            ('T (NULL (ZEROP (REM (|PFO;kbad3Num| |h| |m| %) |p|))))))))) 

(DECLAIM (NOTINLINE |PointsOfFiniteOrder;|)) 

(DEFUN |PointsOfFiniteOrder;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|PointsOfFiniteOrder| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 225))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|AlgebraicallyClosedField|)))))))
    (|haddProp| |$ConstructorCache| '|PointsOfFiniteOrder|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 11 '|%alg|)
    (QSETREFV % 12 (|FunctionSpaceReduce| |#1| |#2|))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (QSETREFV % 101 (CONS (|dispatchFunction| |PFO;cmult;LSmp;21|) %)))
     ('T (QSETREFV % 101 (CONS (|dispatchFunction| |PFO;cmult;LSmp;22|) %))))
    (COND
     ((|domainEqual| |#1| (|Complex| (|Integer|)))
      (COND
       ((|domainEqual| |#2| (|Expression| |#1|))
        (PROGN
         (QSETREFV % 160
                   (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;32|)
                         %))))
       ('T
        (QSETREFV % 160
                  (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;33|)
                        %)))))
     ('T
      (QSETREFV % 160
                (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;34|) %))))
    (COND
     ((|HasCategory| |#1| '(|CharacteristicZero|))
      (COND
       ((|HasCategory| |#2| '(|AlgebraicallyClosedField|))
        (QSETREFV % 191
                  (CONS (|dispatchFunction| |PFO;simplifyCoeffs;RLNni;40|)
                        %))))))
    %))) 

(DEFUN |PointsOfFiniteOrder| (&REST #1=#:G770)
  (SPROG NIL
         (PROG (#2=#:G771)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PointsOfFiniteOrder|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PointsOfFiniteOrder;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PointsOfFiniteOrder|)))))))))) 

(MAKEPROP '|PointsOfFiniteOrder| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) 'ALGOP '|q|
              (|Union| 83 '#1="failed") (|FiniteDivisor| 7 8 9 10)
              |PFO;order;FdU;45| (|Boolean|) |PFO;torsion?;FdB;1| (|Integer|)
              (|Fraction| 18) (0 . |numer|) (5 . |coerce|) (10 . |denom|)
              (15 . /) (|Mapping| 7 19)
              (|SparseUnivariatePolynomial| (|Fraction| 29))
              (|MultipleMap| 19 29 25 7 8 9) (21 . |map|)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomial| 19)
              (|SparseUnivariatePolynomialFunctions2| 19 7) (27 . |map|)
              (|Kernel| %) (33 . |coerce|) (38 . |elt|) (|Mapping| 7 29)
              (|SparseUnivariatePolynomial| 29)
              (|UnivariatePolynomialCategoryFunctions2| 29 36 7 8) (44 . |map|)
              (50 . |bringDown|) (|Mapping| 19 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 28 19 29)
              (55 . |map|) (|MultipleMap| 7 8 9 19 29 25) (61 . |map|)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 19 29) (67 . |map|)
              (|Kernel| 7) (73 . |bringDown|) (|Mapping| 29 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 29 36) (79 . |map|)
              (|Fraction| 8) (85 . |retract|) (|SparseUnivariatePolynomial| 36)
              (|Mapping| 36 52)
              (|UnivariatePolynomialCategoryFunctions2| 52 9 36 54)
              (90 . |map|) (|List| 7) (96 . |coefficients|) (|List| 32)
              (|List| %) (101 . |algtower|) (|Factored| 29)
              (|RationalFactorize| 29) (106 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 66) (|:| |factor| 29) (|:| |exponent| 83))
              (|List| 67) (111 . |factorList|) (116 . |One|) (|List| 29)
              (120 . |coefficients|) (125 . |rem|)
              (|Record| (|:| |den| 18) (|:| |gcdnum| 18))
              (|PointsOfFiniteOrderTools| 29 25) (131 . |badNum|) (|List| 74)
              (136 . |mix|) (|List| 36) (141 . |coefficients|) (146 . |lcm|)
              (151 . |reduce|) (|NonNegativeInteger|)
              |PFO;possibleOrder;FdNni;41| (156 . *) (|Union| 10 '"failed")
              (162 . |generator|)
              (|Record| (|:| |order| 83) (|:| |function| 10))
              (|Union| 88 '#2="failed") |PFO;torsionIfCan;FdU;17|
              (|UnivariatePolynomialCategoryFunctions2| 19 29 7 8)
              (167 . |map|) (173 . |elt|) (179 . |coerce|) (|Mapping| 52 36)
              (|UnivariatePolynomialCategoryFunctions2| 36 54 52 9)
              (184 . |map|) (|SparseMultivariatePolynomial| 6 47) (190 . |lcm|)
              (|List| 98) (195 . |cmult|) (200 . *) (206 . |One|)
              (|SparseMultivariatePolynomial| 6 32) (210 . |denom|) (|List| 52)
              (215 . |coefficients|) (220 . |coerce|) (225 . |coerce|)
              (230 . *) (|Union| 52 '#3="failed") (236 . |retractIfCan|)
              (241 . |lift|) (|List| 47) (246 . |setUnion|)
              (|FractionalIdeal| 8 52 9 10) (252 . |ideal|) (|Vector| 10)
              (257 . |numer|) (|BasicOperator|) (262 . |operator|) (|Symbol|)
              (267 . |has?|) (273 . |denom|) (278 . |minIndex|)
              (|Mapping| 16 47) (283 . |select!|) (289 . |definingPolynomial|)
              (|List| 9) (|Vector| 9) (293 . |entries|) (|Complex| 18)
              (298 . |real|) (303 . |coerce|) (|Mapping| 6 6) (308 . |map|)
              (314 . |imag|) (319 . *) (325 . +) (331 . |numer|)
              (|Mapping| 7 7) (336 . |map|) (|Mapping| 8 8) (342 . |map|)
              (|Mapping| 52 52) (348 . |map|) (354 . |One|) (358 . |monomial|)
              (364 . |One|) (368 . +) (|SparseUnivariatePolynomial| %)
              (|Expression| 6) (374 . |rootOf|) (|List| 10) (379 . |entries|)
              (384 . |vector|) (389 . |coerce|) (394 . ~=)
              (|Record| (|:| |ncurve| 9) (|:| |n_div_numer| 130)
                        (|:| |n_div_denom| 9) (|:| |need_change| 16))
              (400 . |handle_imaginary|) (405 . |minPoly|) (|Union| 19 '#3#)
              (410 . |retractIfCan|) (415 . |coefficients|) (|Mapping| 16 7)
              (420 . |every?|) (426 . |rootOf|) (431 . |kernels|)
              (436 . |minimize|) (441 . |elt|) (447 . |retract|)
              (452 . |primitivePart|) (457 . |norm|)
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (462 . |separate|) (468 . |resultant|) (474 . |retract|)
              (479 . |Zero|) (483 . |Zero|) (487 . |separate|)
              (493 . |resultant|) (|PositiveInteger|) (499 . |rank|)
              (503 . |factorial|) (508 . |badNum|) (513 . |getGoodPrime|)
              (518 . |eval|)
              (|Record| (|:| |primelt| 7) (|:| |poly| (|List| 28))
                        (|:| |prim| 28))
              (|FunctionSpacePrimitiveElement| 6 7) (525 . |primitiveElement|)
              (530 . |simplifyCoeffs|) (536 . |genus|)
              (|Record| (|:| |id| 116) (|:| |principalPart| 10))
              (540 . |decompose|) (545 . |divisor|) (550 . |reduce|) (555 . /)
              (561 . |ideal|) (566 . |discriminant|) (571 . |differentiate|)
              (576 . |gcd|) (|Union| % '"failed") (582 . |exquo|)
              (588 . |discriminant|) (|Void|) (593 . |newReduc|)
              (|SparseUnivariatePolynomial| 18) (|Mapping| 18 19)
              (|SparseUnivariatePolynomialFunctions2| 19 18) (598 . |map|)
              (604 . |zero?|) (|Record| (|:| |num| 29) (|:| |den| 18))
              (|UnivariatePolynomialCommonDenominator| 18 19 29)
              (609 . |splitDenominator|) (614 . |principal?|)
              (|IntegerPrimesPackage| 18) (619 . |nextPrime|) (624 . |rem|)
              (630 . |zero?|) (|List| 18) (635 . |coefficients|)
              (|Mapping| 16 18) (640 . |every?|) (646 . |coerce|))
           '#(|torsionIfCan| 651 |torsion?| 656 |simplifyCoeffs| 661
              |possibleOrder| 667 |order| 672 |handle_imaginary| 677 |cmult|
              682)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|order|
                                 ((|Union| (|NonNegativeInteger|) #1#)
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|torsion?|
                                 ((|Boolean|)
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|torsionIfCan|
                                 ((|Union|
                                   (|Record|
                                    (|:| |order| (|NonNegativeInteger|))
                                    (|:| |function| |#5|))
                                   #2#)
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|cmult|
                                 ((|SparseMultivariatePolynomial| |#1|
                                                                  (|Kernel|
                                                                   |#2|))
                                  (|List|
                                   (|SparseMultivariatePolynomial| |#1|
                                                                   (|Kernel|
                                                                    |#2|)))))
                                T)
                              '((|possibleOrder|
                                 ((|NonNegativeInteger|)
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|handle_imaginary|
                                 ((|Record| (|:| |ncurve| |#4|)
                                            (|:| |n_div_numer| (|Vector| |#4|))
                                            (|:| |n_div_denom| |#4|)
                                            (|:| |need_change| (|Boolean|)))
                                  (|FiniteDivisor| |#2| |#3| |#4| |#5|)))
                                T)
                              '((|simplifyCoeffs|
                                 ((|NonNegativeInteger|)
                                  (|Record| (|:| |ncurve| |#4|)
                                            (|:| |n_div_numer| (|Vector| |#4|))
                                            (|:| |n_div_denom| |#4|)
                                            (|:| |need_change| (|Boolean|)))
                                  (|List| (|Kernel| |#2|))))
                                (AND (|has| 7 (|AlgebraicallyClosedField|))
                                     (|has| 6 (|CharacteristicZero|)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 224
                                            '(1 19 18 0 20 1 7 0 18 21 1 19 18
                                              0 22 2 7 0 0 0 23 2 26 9 24 25 27
                                              2 30 28 24 29 31 1 7 0 32 33 2 28
                                              7 0 7 34 2 37 8 35 36 38 1 12 19
                                              7 39 2 41 29 40 28 42 2 43 25 40
                                              9 44 2 45 29 40 8 46 2 12 29 7 47
                                              48 2 50 36 49 8 51 1 52 8 0 53 2
                                              56 54 55 9 57 1 8 58 0 59 1 7 60
                                              61 62 1 64 63 29 65 1 63 68 0 69
                                              0 6 0 70 1 36 71 0 72 2 29 0 0 0
                                              73 1 75 74 29 76 1 75 18 77 78 1
                                              54 79 0 80 1 18 0 61 81 1 14 0 0
                                              82 2 14 0 18 0 85 1 14 86 0 87 2
                                              91 8 24 29 92 2 8 7 0 7 93 1 52 0
                                              8 94 2 96 9 95 54 97 1 98 0 61 99
                                              1 0 98 100 101 2 98 0 0 0 102 0
                                              98 0 103 1 7 104 0 105 1 9 106 0
                                              107 1 7 0 104 108 1 8 0 7 109 2 9
                                              0 52 0 110 1 10 111 0 112 1 10 9
                                              0 113 2 114 0 0 0 115 1 14 116 0
                                              117 1 116 118 0 119 1 47 120 0
                                              121 2 120 16 0 122 123 1 116 8 0
                                              124 1 118 18 0 125 2 114 0 126 0
                                              127 0 10 9 128 1 130 129 0 131 1
                                              132 18 0 133 1 6 0 18 134 2 98 0
                                              135 0 136 1 132 18 0 137 2 7 0 0
                                              0 138 2 7 0 0 0 139 1 7 104 0 140
                                              2 8 0 141 0 142 2 52 0 143 0 144
                                              2 9 0 145 0 146 0 7 0 147 2 28 0
                                              7 83 148 0 28 0 149 2 28 0 0 0
                                              150 1 152 0 151 153 1 118 154 0
                                              155 1 130 0 129 156 1 9 0 52 157
                                              2 9 16 0 0 158 1 0 159 14 160 1 7
                                              151 32 161 1 7 162 0 163 1 28 58
                                              0 164 2 58 16 165 0 166 1 7 0 151
                                              167 1 7 60 0 168 1 116 0 0 169 2
                                              118 10 0 18 170 1 10 52 0 171 1 8
                                              0 0 172 1 10 52 0 173 2 8 174 0 0
                                              175 2 8 7 0 0 176 1 19 18 0 177 0
                                              6 0 178 0 7 0 179 2 29 174 0 0
                                              180 2 29 19 0 0 181 0 10 182 183
                                              1 18 0 0 184 1 75 18 25 185 1 75
                                              182 18 186 3 7 0 0 60 61 187 1
                                              189 188 58 190 2 0 83 159 114 191
                                              0 10 83 192 1 14 193 0 194 1 14 0
                                              116 195 1 10 0 9 196 2 10 0 0 0
                                              197 1 116 0 118 198 1 9 52 0 199
                                              1 8 0 0 200 2 8 0 0 0 201 2 8 202
                                              0 0 203 1 8 7 0 204 1 12 205 18
                                              206 2 209 207 208 29 210 1 207 16
                                              0 211 1 213 212 29 214 1 14 16 0
                                              215 1 216 18 18 217 2 18 0 0 0
                                              218 1 18 16 0 219 1 207 220 0 221
                                              2 220 16 222 0 223 1 19 0 18 224
                                              1 0 89 14 90 1 0 16 14 17 2 1 83
                                              159 114 191 1 0 83 14 84 1 0 13
                                              14 15 1 0 159 14 160 1 0 98 100
                                              101)))))
           '|lookupComplete|)) 
