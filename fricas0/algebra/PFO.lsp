
(SDEFUN |PFO;torsion?;FdB;1| ((|d| |FiniteDivisor| F UP UPUP R) ($ |Boolean|))
        (QEQCAR (SPADCALL |d| (QREFELT $ 15)) 0)) 

(SDEFUN |PFO;Q2F| ((|x| |Fraction| (|Integer|)) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 21))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 22)) (QREFELT $ 21))
                  (QREFELT $ 23))) 

(SDEFUN |PFO;Q2UPUP|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ UPUP))
        (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 27))) 

(SDEFUN |PFO;raise|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 31))
                  (SPADCALL |k| (QREFELT $ 33)) (QREFELT $ 34))) 

(SDEFUN |PFO;raise2|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;raise2!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 38)))) 

(SDEFUN |PFO;raise2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;raise2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;raise| |z1| |k| $))))) 

(SDEFUN |PFO;qmod| ((|x| F) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 39))) 

(SDEFUN |PFO;fmod|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 42))) 

(SDEFUN |PFO;pmod|
        ((|p| UPUP)
         ($ |SparseUnivariatePolynomial|
          (|Fraction|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 44))) 

(SDEFUN |PFO;rmod|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 46))) 

(SDEFUN |PFO;kqmod|
        ((|x| F) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL |x| |k| (QREFELT $ 48))) 

(SDEFUN |PFO;krmod|
        ((|p| UP) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;krmod!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 51)))) 

(SDEFUN |PFO;krmod!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;krmod|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;kqmod| |z1| |k| $))))) 

(SDEFUN |PFO;kpmod|
        ((|p| UPUP) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;kpmod!0| (VECTOR |k| $)) |p|
                         (QREFELT $ 57)))) 

(SDEFUN |PFO;kpmod!0| ((|p1| NIL) ($$ NIL))
        (PROG ($ |k|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;kpmod|))
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;krmod| (SPADCALL |p1| (QREFELT $ 53)) |k| $))))) 

(SDEFUN |PFO;klist| ((|d| UP) ($ |List| (|Kernel| F)))
        (SPADCALL (SPADCALL |d| (QREFELT $ 59)) (QREFELT $ 62))) 

(SDEFUN |PFO;notIrr?|
        ((|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPADCALL
         (LENGTH (SPADCALL (SPADCALL |d| (QREFELT $ 65)) (QREFELT $ 68))) 1
         (QREFELT $ 71))) 

(SDEFUN |PFO;kbadBadNum|
        ((|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G776 NIL) (|c| NIL) (#2=#:G775 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PFO;kbadBadNum|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (SPADCALL |d| (QREFELT $ 73)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |c| |m| (QREFELT $ 74))
                                          (QREFELT $ 77))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 79))))) 

(SDEFUN |PFO;kbad3Num|
        ((|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G780 NIL) (|c| NIL) (#2=#:G779 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PFO;kbad3Num|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (SPADCALL |h| (QREFELT $ 81)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|PFO;kbadBadNum| |c| |m| $) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 82))))) 

(SDEFUN |PFO;torsionIfCan;FdU;17|
        ((|d| |FiniteDivisor| F UP UPUP R)
         ($ |Union|
          (|Record| (|:| |order| (|NonNegativeInteger|)) (|:| |function| R))
          "failed"))
        (SPROG ((|g| (|Union| R "failed")) (|n| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((ZEROP
                   (LETT |n|
                         (SPADCALL
                          (LETT |d| (SPADCALL |d| (QREFELT $ 83))
                                . #1=(|PFO;torsionIfCan;FdU;17|))
                          (QREFELT $ 84))
                         . #1#))
                  (CONS 1 "failed"))
                 (#2='T
                  (SEQ
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |d| (QREFELT $ 85))
                                    (QREFELT $ 83))
                          (QREFELT $ 87))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                          (#2# (CONS 0 (CONS |n| (QCDR |g|)))))))))))) 

(SDEFUN |PFO;UPQ2F|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 92))
                  (SPADCALL |k| (QREFELT $ 33)) (QREFELT $ 93))) 

(SDEFUN |PFO;UP22UP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP22UP!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 38)))) 

(SDEFUN |PFO;UP22UP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;UP22UP|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;UPQ2F| |p1| |k| $))))) 

(SDEFUN |PFO;UP32UPUP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|k| |Kernel| F) ($ UPUP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP32UPUP!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 97)))) 

(SDEFUN |PFO;UP32UPUP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;UP32UPUP|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|PFO;UP22UP| |p1| |k| $) (QREFELT $ 94)))))) 

(SDEFUN |PFO;cmult;LSmp;21|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPADCALL |l| (QREFELT $ 99))) 

(SDEFUN |PFO;cmult;LSmp;22|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((#1=#:G804 NIL)
          (#2=#:G803 #3=(|SparseMultivariatePolynomial| R0 (|Kernel| F)))
          (#4=#:G805 #3#) (#5=#:G807 NIL) (#6=#:G690 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|PFO;cmult;LSmp;22|))
           (SEQ (LETT #6# NIL . #7#) (LETT #5# |l| . #7#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# #6# . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 102)) . #7#))
                    ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 103))))))) 

(SDEFUN |PFO;doubleDisc|
        ((|f| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ |Integer|))
        (SPROG
         ((#1=#:G815 NIL) (|c| NIL) (#2=#:G814 NIL)
          (|e| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|d|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
          (#3=#:G809 NIL)
          (|g|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 104)) . #4=(|PFO;doubleDisc|))
              (LETT |g|
                    (SPADCALL |d| (SPADCALL |d| (QREFELT $ 105))
                              (QREFELT $ 106))
                    . #4#)
              (LETT |d|
                    (PROG2 (LETT #3# (SPADCALL |d| |g| (QREFELT $ 108)) . #4#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (|SparseUnivariatePolynomial|
                                        (|Fraction| (|Integer|))))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (|SparseUnivariatePolynomial|
                                         (|Fraction| (|Integer|))))
                                       "failed")
                                      #3#))
                    . #4#)
              (EXIT
               (COND
                ((SPADCALL (LETT |e| (SPADCALL |d| (QREFELT $ 110)) . #4#)
                           (QREFELT $ 111))
                 0)
                ('T
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #4#)
                   (SEQ (LETT |c| NIL . #4#)
                        (LETT #1# (SPADCALL |e| (QREFELT $ 113)) . #4#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |c| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 114)) #2#)
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 115)))))))) 

(SDEFUN |PFO;commonDen|
        ((|p| UP) ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((|l2| (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
          (#1=#:G820 NIL) (|c| NIL) (#2=#:G819 NIL) (|l1| (|List| F)))
         (SEQ (LETT |l1| (SPADCALL |p| (QREFELT $ 59)) . #3=(|PFO;commonDen|))
              (LETT |l2|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |c| NIL . #3#) (LETT #1# |l1| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 117)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |l2| (QREFELT $ 101)))))) 

(SDEFUN |PFO;polyred| ((|f| UPUP) ($ UPUP))
        (SPROG ((#1=#:G932 NIL) (|c| NIL) (#2=#:G931 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #3=(|PFO;polyred|))
                      (SEQ (LETT |c| NIL . #3#)
                           (LETT #1# (SPADCALL |f| (QREFELT $ 119)) . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|PFO;commonDen|
                                     (SPADCALL |c| (QREFELT $ 53)) $)
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 101))
                    (QREFELT $ 120))
                   (QREFELT $ 121))
                  (QREFELT $ 94))
                 |f| (QREFELT $ 122))))) 

(SDEFUN |PFO;aklist| ((|f| R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G937 NIL) (#2=#:G936 #3=(|List| (|Kernel| F))) (#4=#:G938 #3#)
          (#5=#:G941 NIL) (|c| NIL) (|r| (|Union| (|Fraction| UP) "failed")))
         (SEQ (LETT |r| (SPADCALL |f| (QREFELT $ 124)) . #6=(|PFO;aklist|))
              (EXIT
               (COND
                ((QEQCAR |r| 1)
                 (PROGN
                  (LETT #1# NIL . #6#)
                  (SEQ (LETT |c| NIL . #6#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |f| (QREFELT $ 125))
                                       (QREFELT $ 119))
                             . #6#)
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|PFO;klist| (SPADCALL |c| (QREFELT $ 53)) $)
                                . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 127))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7='T (|IdentityError| '|setUnion|)))))
                (#7# (|PFO;klist| (SPADCALL (QCDR |r|) (QREFELT $ 53)) $))))))) 

(SDEFUN |PFO;alglist0|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G946 NIL) (#2=#:G945 #3=(|List| (|Kernel| F))) (#4=#:G947 #3#)
          (#5=#:G950 NIL) (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|n| (|Vector| R)))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |i| (SPADCALL |d| (QREFELT $ 129))
                       . #6=(|PFO;alglist0|))
                 (QREFELT $ 131))
                . #6#)
          (EXIT
           (SPADCALL (CONS #'|PFO;alglist0!0| (VECTOR (QREFELT $ 11) $))
                     (SPADCALL (|PFO;klist| (SPADCALL |i| (QREFELT $ 136)) $)
                               (PROGN
                                (LETT #1# NIL . #6#)
                                (SEQ
                                 (LETT |i| (SPADCALL |n| (QREFELT $ 137))
                                       . #6#)
                                 (LETT #5# (QVSIZE |n|) . #6#) G190
                                 (COND ((> |i| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|PFO;aklist| (QAREF1O |n| |i| 1) $)
                                          . #6#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #4# (QREFELT $ 127))
                                            . #6#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #6#)
                                       (LETT #1# 'T . #6#)))))))
                                 (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                                 (EXIT NIL))
                                (COND (#1# #2#)
                                      ('T (|IdentityError| '|setUnion|))))
                               (QREFELT $ 127))
                     (QREFELT $ 139)))))) 

(SDEFUN |PFO;alglist0!0| ((|k1| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;alglist0|))
          (LETT ALGOP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |k1| (QREFELT $ 133)) ALGOP (QREFELT $ 135)))))) 

(SDEFUN |PFO;alglist|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |List| (|Kernel| F)))
        (SPROG
         ((|l1| #1=(|List| (|Kernel| F))) (#2=#:G952 NIL) (#3=#:G951 #1#)
          (#4=#:G953 #1#) (#5=#:G956 NIL) (|c| NIL) (|f| (UPUP)))
         (SEQ (LETT |f| (SPADCALL (QREFELT $ 140)) . #6=(|PFO;alglist|))
              (LETT |l1|
                    (PROGN
                     (LETT #2# NIL . #6#)
                     (SEQ (LETT |c| NIL . #6#)
                          (LETT #5# (SPADCALL |f| (QREFELT $ 119)) . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (|PFO;klist| (SPADCALL |c| (QREFELT $ 53))
                                    $)
                                   . #6#)
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 127))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #3# #4# . #6#)
                                (LETT #2# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) ('T (|IdentityError| '|setUnion|))))
                    . #6#)
              (EXIT (SPADCALL |l1| (|PFO;alglist0| |d| $) (QREFELT $ 127)))))) 

(SDEFUN |PFO;alglist2| ((|f| UPUP) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G958 NIL) (#2=#:G957 #3=(|List| (|Kernel| F))) (#4=#:G959 #3#)
          (#5=#:G961 NIL) (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|PFO;alglist2|))
           (SEQ (LETT |c| NIL . #6#)
                (LETT #5# (SPADCALL |f| (QREFELT $ 119)) . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|PFO;klist| (SPADCALL |c| (QREFELT $ 53)) $)
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 127)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))))) 

(SDEFUN |PFO;alglist1|
        ((|nc| UPUP) (|nva| |Vector| UPUP) (|nd| UPUP) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G963 NIL) (#2=#:G962 #3=(|List| (|Kernel| F))) (#4=#:G964 #3#)
          (#5=#:G967 NIL) (|f| NIL) (|l2| (|List| UPUP)) (|l1| (|List| UPUP)))
         (SEQ
          (LETT |l1| (SPADCALL |nva| (QREFELT $ 143)) . #6=(|PFO;alglist1|))
          (LETT |l2| (CONS |nc| (CONS |nd| |l1|)) . #6#)
          (EXIT
           (PROGN
            (LETT #1# NIL . #6#)
            (SEQ (LETT |f| NIL . #6#) (LETT #5# |l2| . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4# (|PFO;alglist2| |f| $) . #6#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 127)) . #6#))
                     ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|IdentityError| '|setUnion|)))))))) 

(SDEFUN |PFO;subst_mp_ni|
        ((|p| |SparseMultivariatePolynomial| R0 (|Kernel| F)) (|ni| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (CONS #'|PFO;subst_mp_ni!0| $) |p| (QREFELT $ 148))
          (QREFELT $ 120))
         (SPADCALL |ni|
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;subst_mp_ni!1| $) |p|
                              (QREFELT $ 148))
                    (QREFELT $ 120))
                   (QREFELT $ 150))
         (QREFELT $ 151))) 

(SDEFUN |PFO;subst_mp_ni!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 149)) (QREFELT $ 146))) 

(SDEFUN |PFO;subst_mp_ni!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 145)) (QREFELT $ 146))) 

(SDEFUN |PFO;subst_upup_ni| ((|upup| UPUP) (|ni| F) ($ UPUP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;subst_upup_ni!2| (VECTOR |ni| $)) |upup|
                         (QREFELT $ 158)))) 

(SDEFUN |PFO;subst_upup_ni!2| ((|a| NIL) ($$ NIL))
        (PROG ($ |ni|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;subst_upup_ni|))
          (LETT |ni| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;subst_upup_ni!1| (VECTOR $ |ni|)) |a|
                             (QREFELT $ 156))))))) 

(SDEFUN |PFO;subst_upup_ni!1| ((|b| NIL) ($$ NIL))
        (PROG (|ni| $)
          (LETT |ni| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;subst_upup_ni!0| (VECTOR |ni| $)) |b|
                             (QREFELT $ 154))))))) 

(SDEFUN |PFO;subst_upup_ni!0| ((|c| NIL) ($$ NIL))
        (PROG ($ |ni|)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |ni| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL (|PFO;subst_mp_ni| (SPADCALL |c| (QREFELT $ 152)) |ni| $)
                      (|PFO;subst_mp_ni| (SPADCALL |c| (QREFELT $ 117)) |ni| $)
                      (QREFELT $ 23)))))) 

(SDEFUN |PFO;handle_imaginary;FdR;33|
        ((|fd| |FiniteDivisor| F UP UPUP R)
         ($ |Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
          (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|))))
        (SPROG
         ((|nd| (UPUP)) (|nva| (|Vector| UPUP)) (#1=#:G1188 NIL) (|vi| NIL)
          (#2=#:G1187 NIL) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)) (|nf| (UPUP))
          (|f| (UPUP)) (|ni| (|Expression| R0))
          (|p0| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |p0|
                (SPADCALL (SPADCALL (|spadConstant| $ 159) 2 (QREFELT $ 160))
                          (|spadConstant| $ 161) (QREFELT $ 162))
                . #3=(|PFO;handle_imaginary;FdR;33|))
          (LETT |ni| (SPADCALL |p0| (QREFELT $ 165)) . #3#)
          (LETT |f| (SPADCALL (QREFELT $ 140)) . #3#)
          (LETT |nf| (|PFO;subst_upup_ni| |f| |ni| $) . #3#)
          (LETT |id| (SPADCALL |fd| (QREFELT $ 129)) . #3#)
          (LETT |n| (SPADCALL |id| (QREFELT $ 131)) . #3#)
          (LETT |nva|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |vi| NIL . #3#)
                       (LETT #1# (SPADCALL |n| (QREFELT $ 167)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |vi| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (|PFO;subst_upup_ni|
                                 (SPADCALL |vi| (QREFELT $ 125)) |ni| $)
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 168))
                . #3#)
          (LETT |nd|
                (|PFO;subst_upup_ni|
                 (SPADCALL
                  (SPADCALL (SPADCALL |id| (QREFELT $ 136)) (QREFELT $ 94))
                  (QREFELT $ 169))
                 |ni| $)
                . #3#)
          (EXIT (VECTOR |nf| |nva| |nd| (SPADCALL |f| |nf| (QREFELT $ 170))))))) 

(SDEFUN |PFO;handle_imaginary;FdR;34|
        ((|fd| |FiniteDivisor| F UP UPUP R)
         ($ |Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
          (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|))))
        (SPROG
         ((|nva| (|Vector| UPUP)) (#1=#:G1194 NIL) (|vi| NIL) (#2=#:G1193 NIL)
          (|d| (UP)) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ
          (LETT |id| (SPADCALL |fd| (QREFELT $ 129))
                . #3=(|PFO;handle_imaginary;FdR;34|))
          (LETT |n| (SPADCALL |id| (QREFELT $ 131)) . #3#)
          (LETT |d| (SPADCALL |id| (QREFELT $ 136)) . #3#)
          (LETT |nva|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |vi| NIL . #3#)
                       (LETT #1# (SPADCALL |n| (QREFELT $ 167)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |vi| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |vi| (QREFELT $ 125)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 168))
                . #3#)
          (EXIT
           (VECTOR (SPADCALL (QREFELT $ 140)) |nva|
                   (SPADCALL (SPADCALL |d| (QREFELT $ 94)) (QREFELT $ 169))
                   NIL))))) 

(SDEFUN |PFO;handle_imaginary;FdR;35|
        ((|fd| |FiniteDivisor| F UP UPUP R)
         ($ |Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
          (|:| |n_div_denom| UPUP) (|:| |need_change| (|Boolean|))))
        (SPROG
         ((|nva| (|Vector| UPUP)) (#1=#:G1200 NIL) (|vi| NIL) (#2=#:G1199 NIL)
          (|d| (UP)) (|n| (|Vector| R))
          (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ
          (LETT |id| (SPADCALL |fd| (QREFELT $ 129))
                . #3=(|PFO;handle_imaginary;FdR;35|))
          (LETT |n| (SPADCALL |id| (QREFELT $ 131)) . #3#)
          (LETT |d| (SPADCALL |id| (QREFELT $ 136)) . #3#)
          (LETT |nva|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |vi| NIL . #3#)
                       (LETT #1# (SPADCALL |n| (QREFELT $ 167)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |vi| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |vi| (QREFELT $ 125)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 168))
                . #3#)
          (EXIT
           (VECTOR (SPADCALL (QREFELT $ 140)) |nva|
                   (SPADCALL (SPADCALL |d| (QREFELT $ 94)) (QREFELT $ 169))
                   NIL))))) 

(SDEFUN |PFO;UPQ_to_UPF|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 31))) 

(SDEFUN |PFO;algcurve|
        ((|d| |FiniteDivisor| F UP UPUP R)
         (|rc| |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))
          (|:| |dfpoly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|k| |Kernel| F) ($ |NonNegativeInteger|))
        (SPROG
         ((|sae|
           (|Join|
            (|MonogenicAlgebra| |gf| (|SparseUnivariatePolynomial| |gf|))
            (CATEGORY |package|
             (IF (|has| |gf| (|Field|))
                 (IF (|has| |gf| (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|))))
          (|alpha| (|gf|)) (|m| (|SparseUnivariatePolynomial| |gf|))
          (|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|))))
          (|mm| #1=(|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|pp| (UPUP)) (|p| #2=(|PositiveInteger|))
          (|pr| (|Record| (|:| |prime| #2#) (|:| |poly| #1#)))
          (|dd|
           #3=(|SparseUnivariatePolynomial|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
          (|s| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|b2| (UP)) (|b| #3#)
          (|h|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|hh| (R)) (|mn| (|Integer|)) (|n| (|Vector| R))
          (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|k1| (|Kernel| F)) (|mp| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |k1|
                (SEQ
                 (LETT |mp| (SPADCALL |k| (QREFELT $ 173))
                       . #4=(|PFO;algcurve|))
                 (EXIT
                  (COND
                   ((SPADCALL (CONS #'|PFO;algcurve!0| $)
                              (SPADCALL |mp| (QREFELT $ 176)) (QREFELT $ 178))
                    |k|)
                   ((|HasCategory| (QREFELT $ 7) '(|AlgebraicallyClosedField|))
                    (|SPADfirst|
                     (SPADCALL
                      (SPADCALL (|PFO;UPQ_to_UPF| (QVELT |rc| 2) $)
                                (QREFELT $ 179))
                      (QREFELT $ 180))))
                   (#5='T (|error| "cannot reduce root")))))
                . #4#)
          (LETT |mn|
                (SPADCALL
                 (LETT |n|
                       (SPADCALL
                        (LETT |i|
                              (SPADCALL (SPADCALL |d| (QREFELT $ 129))
                                        (QREFELT $ 181))
                              . #4#)
                        (QREFELT $ 131))
                       . #4#)
                 (QREFELT $ 137))
                . #4#)
          (LETT |h|
                (|PFO;kpmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |n| (+ |mn| 1) (QREFELT $ 182)) . #4#)
                  (QREFELT $ 125))
                 |k| $)
                . #4#)
          (LETT |b2|
                (SPADCALL
                 (|PFO;raise2|
                  (LETT |b|
                        (|PFO;krmod|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |mn| (QREFELT $ 182))
                                    (QREFELT $ 183))
                          (QREFELT $ 53))
                         |k| $)
                        . #4#)
                  |k1| $)
                 (QREFELT $ 184))
                . #4#)
          (LETT |s|
                (|PFO;kqmod|
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (SPADCALL
                     (|PFO;raise2|
                      (|PFO;krmod|
                       (SPADCALL (SPADCALL |hh| (QREFELT $ 185))
                                 (QREFELT $ 53))
                       |k| $)
                      |k1| $)
                     |b2| (QREFELT $ 187)))
                   (QREFELT $ 184))
                  |b2| (QREFELT $ 188))
                 |k1| $)
                . #4#)
          (LETT |pr|
                (|PFO;kgetGoodPrime| |rc| |s| |h| |b|
                 (LETT |dd| (|PFO;krmod| (SPADCALL |i| (QREFELT $ 136)) |k| $)
                       . #4#)
                 $)
                . #4#)
          (LETT |p| (QCAR |pr|) . #4#)
          (LETT |pp| (|PFO;UP32UPUP| (QVELT |rc| 0) |k| $) . #4#)
          (LETT |mm| (QCDR |pr|) . #4#)
          (LETT |gf| (|InnerPrimeField| |p|) . #4#)
          (LETT |m|
                (SPADCALL (CONS #'|PFO;algcurve!1| (VECTOR |gf| $)) |mm|
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
                                                  |gf|)))
                . #4#)
          (EXIT
           (COND
            ((EQL
              (SPADCALL |m|
                        (|compiledLookupCheck| '|degree|
                                               (LIST
                                                (LIST '|NonNegativeInteger|)
                                                '$)
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
                                                             '$
                                                             (LIST
                                                              '|NonNegativeInteger|))
                                                       (|SparseUnivariatePolynomial|
                                                        |gf|)))
                      (SPADCALL |m|
                                (|compiledLookupCheck| '|leadingCoefficient|
                                                       (LIST (|devaluate| |gf|)
                                                             '$)
                                                       (|SparseUnivariatePolynomial|
                                                        |gf|)))
                      (|compiledLookupCheck| '/ (LIST '$ '$ '$) |gf|))
                     (|compiledLookupCheck| '- (LIST '$ '$) |gf|))
                    . #4#)
              (EXIT
               (SPADCALL |d| |pp|
                         (CONS #'|PFO;algcurve!3| (VECTOR |alpha| |k| $ |gf|))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT $ 7))
                                                       (|devaluate| (ELT $ 8))
                                                       (|devaluate| (ELT $ 9))
                                                       (|devaluate|
                                                        (ELT $ 10)))
                                                 (|devaluate| (ELT $ 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |gf|)
                                                       (|devaluate|
                                                        (ELT $ 7))))
                                                (|ReducedDivisor| (ELT $ 7)
                                                                  (ELT $ 8)
                                                                  (ELT $ 9)
                                                                  (ELT $ 10)
                                                                  |gf|))))))
            (#5#
             (SEQ
              (LETT |sae|
                    (|SimpleAlgebraicExtension| |gf|
                                                (|SparseUnivariatePolynomial|
                                                 |gf|)
                                                |m|)
                    . #4#)
              (EXIT
               (SPADCALL |d| |pp|
                         (CONS #'|PFO;algcurve!5| (VECTOR |sae| |k| $ |gf|))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT $ 7))
                                                       (|devaluate| (ELT $ 8))
                                                       (|devaluate| (ELT $ 9))
                                                       (|devaluate|
                                                        (ELT $ 10)))
                                                 (|devaluate| (ELT $ 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |sae|)
                                                       (|devaluate|
                                                        (ELT $ 7))))
                                                (|ReducedDivisor| (ELT $ 7)
                                                                  (ELT $ 8)
                                                                  (ELT $ 9)
                                                                  (ELT $ 10)
                                                                  |sae|))))))))))) 

(SDEFUN |PFO;algcurve!5| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $ |k| |sae|)
          (LETT |gf| (QREFELT $$ 3) . #1=(|PFO;algcurve|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |k| (QREFELT $$ 1) . #1#)
          (LETT |sae| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;algcurve!4| (VECTOR |gf| $))
                              (|PFO;kqmod| |z1| |k| $)
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
                                           (LIST '$
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| |gf|)))
                                           |sae|))))))) 

(SDEFUN |PFO;algcurve!4| ((|q1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |gf| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |q1| (QREFELT $ 20))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (SPADCALL (SPADCALL |q1| (QREFELT $ 22))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (|compiledLookupCheck| '/ (LIST '$ '$ '$) |gf|)))))) 

(SDEFUN |PFO;algcurve!3| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $ |k| |alpha|)
          (LETT |gf| (QREFELT $$ 3) . #1=(|PFO;algcurve|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |k| (QREFELT $$ 1) . #1#)
          (LETT |alpha| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;algcurve!2| (VECTOR |gf| $))
                              (|PFO;kqmod| |z1| |k| $)
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
                                           (LIST (|devaluate| |gf|) '$
                                                 (|devaluate| |gf|))
                                           (|SparseUnivariatePolynomial|
                                            |gf|)))))))) 

(SDEFUN |PFO;algcurve!2| ((|q1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |gf| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |q1| (QREFELT $ 20))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (SPADCALL (SPADCALL |q1| (QREFELT $ 22))
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              |gf|))
             (|compiledLookupCheck| '/ (LIST '$ '$ '$) |gf|)))))) 

(SDEFUN |PFO;algcurve!1| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;algcurve|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 114))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '$ (LIST '|Integer|))
                                             |gf|)))))) 

(SDEFUN |PFO;algcurve!0| ((|x| NIL) ($ NIL))
        (QEQCAR (SPADCALL |x| (QREFELT $ 175)) 0)) 

(SDEFUN |PFO;ratcurve|
        ((|d| |FiniteDivisor| F UP UPUP R)
         (|rc| |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|Fraction|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|)))
         ($ |NonNegativeInteger|))
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
                              (SPADCALL (SPADCALL |d| (QREFELT $ 129))
                                        (QREFELT $ 181))
                              . #2=(|PFO;ratcurve|))
                        (QREFELT $ 131))
                       . #2#)
                 (QREFELT $ 137))
                . #2#)
          (LETT |h|
                (|PFO;pmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |nm| (+ |mn| 1) (QREFELT $ 182)) . #2#)
                  (QREFELT $ 125))
                 $)
                . #2#)
          (LETT |b|
                (|PFO;rmod|
                 (SPADCALL
                  (SPADCALL (SPADCALL |nm| |mn| (QREFELT $ 182))
                            (QREFELT $ 183))
                  (QREFELT $ 53))
                 $)
                . #2#)
          (LETT |s|
                (QCAR
                 (SPADCALL
                  (|PFO;rmod|
                   (SPADCALL (SPADCALL |hh| (QREFELT $ 185)) (QREFELT $ 53)) $)
                  |b| (QREFELT $ 191)))
                . #2#)
          (LETT |bd|
                (SPADCALL (|PFO;rmod| (SPADCALL |i| (QREFELT $ 136)) $)
                          (QREFELT $ 77))
                . #2#)
          (LETT |r| (SPADCALL |s| |b| (QREFELT $ 192)) . #2#)
          (LETT |bad|
                (SPADCALL
                 (LIST (SPADCALL (SPADCALL (QREFELT $ 194)) (QREFELT $ 195))
                       (QCDR |rc|) (SPADCALL |r| (QREFELT $ 20))
                       (SPADCALL |r| (QREFELT $ 22))
                       (* (QCAR |bd|) (QCDR |bd|))
                       (SPADCALL |h| (QREFELT $ 196)))
                 (QREFELT $ 82))
                . #2#)
          (LETT |pp| (|PFO;Q2UPUP| (QCAR |rc|) $) . #2#)
          (LETT |n|
                (|PFO;rat| |pp| |d|
                 (LETT |p| (SPADCALL |bad| (QREFELT $ 197)) . #2#) $)
                . #2#)
          (EXIT
           (COND ((EQL |n| 1) |n|)
                 (#3='T
                  (SEQ
                   (LETT |m|
                         (|PFO;rat| |pp| |d|
                          (SPADCALL (SPADCALL |p| |bad| (QREFELT $ 198))
                                    (QREFELT $ 197))
                          $)
                         . #2#)
                   (EXIT (COND ((EQL |n| |m|) |n|) (#3# 0)))))))))) 

(SDEFUN |PFO;rat|
        ((|pp| UPUP) (|d| |FiniteDivisor| F UP UPUP R) (|p| |PositiveInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|)))))
         (SEQ (LETT |gf| (|InnerPrimeField| |p|) |PFO;rat|)
              (EXIT
               (SPADCALL |d| |pp| (CONS #'|PFO;rat!0| (VECTOR |gf| $))
                         (|compiledLookupCheck| '|order|
                                                (LIST
                                                 (LIST '|NonNegativeInteger|)
                                                 (LIST '|FiniteDivisor|
                                                       (|devaluate| (ELT $ 7))
                                                       (|devaluate| (ELT $ 8))
                                                       (|devaluate| (ELT $ 9))
                                                       (|devaluate|
                                                        (ELT $ 10)))
                                                 (|devaluate| (ELT $ 9))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |gf|)
                                                       (|devaluate|
                                                        (ELT $ 7))))
                                                (|ReducedDivisor| (ELT $ 7)
                                                                  (ELT $ 8)
                                                                  (ELT $ 9)
                                                                  (ELT $ 10)
                                                                  |gf|))))))) 

(SDEFUN |PFO;rat!0| ((|q1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;rat|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|qq| NIL))
                   (SEQ (LETT |qq| (|PFO;qmod| |q1| $) NIL)
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |qq| (QREFELT $ 20))
                                    (|compiledLookupCheck| '|coerce|
                                                           (LIST '$
                                                                 (LIST
                                                                  '|Integer|))
                                                           |gf|))
                          (SPADCALL (SPADCALL |qq| (QREFELT $ 22))
                                    (|compiledLookupCheck| '|coerce|
                                                           (LIST '$
                                                                 (LIST
                                                                  '|Integer|))
                                                           |gf|))
                          (|compiledLookupCheck| '/ (LIST '$ '$ '$)
                                                 |gf|))))))))) 

(SDEFUN |PFO;evalup|
        ((|upup| UPUP) (|la| |List| (|Kernel| F)) (|lrhs| |List| F) ($ UPUP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;evalup!2| (VECTOR $ |lrhs| |la|)) |upup|
                         (QREFELT $ 158)))) 

(SDEFUN |PFO;evalup!2| ((|a| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2) . #1=(|PFO;evalup|))
          (LETT |lrhs| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!1| (VECTOR |la| |lrhs| $)) |a|
                             (QREFELT $ 156))))))) 

(SDEFUN |PFO;evalup!1| ((|b| NIL) ($$ NIL))
        (PROG ($ |lrhs| |la|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lrhs| (QREFELT $$ 1) NIL)
          (LETT |la| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!0| (VECTOR $ |lrhs| |la|)) |b|
                             (QREFELT $ 154))))))) 

(SDEFUN |PFO;evalup!0| ((|c| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2) NIL)
          (LETT |lrhs| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |c| |la| |lrhs| (QREFELT $ 199)))))) 

(SDEFUN |PFO;simplifyCoeffs;RLNni;41|
        ((|irec| |Record| (|:| |ncurve| UPUP)
          (|:| |n_div_numer| (|Vector| UPUP)) (|:| |n_div_denom| UPUP)
          . #1=((|:| |need_change| (|Boolean|))))
         (|la| |List| (|Kernel| F)) ($ |NonNegativeInteger|))
        (SPROG
         ((|ndiv| (|nFD|)) (|va| (|Vector| |nR|)) (#2=#:G1262 NIL)
          (#3=#:G1264 NIL) (|ni| NIL) (#4=#:G1263 NIL) (|nd| (|nR|))
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
                   (CATEGORY |domain| (SIGNATURE |ideal| ($ (|Vector| |nR|)))
                    (SIGNATURE |basis| ((|Vector| |nR|) $))
                    (SIGNATURE |norm| ((|Fraction| UP) $))
                    (SIGNATURE |numer| ((|Vector| |nR|) $))
                    (SIGNATURE |denom| (UP $)) (SIGNATURE |minimize| ($ $))
                    (SIGNATURE |randomLC|
                     (|nR| (|NonNegativeInteger|) (|Vector| |nR|))))))
          (|nFD|
           (|Join| (|FiniteDivisorCategory| F UP UPUP |nR|)
                   (CATEGORY |domain|
                    (SIGNATURE |finiteBasis| ((|Vector| |nR|) $))
                    (SIGNATURE |lSpaceBasis| ((|Vector| |nR|) $)))))
          (|nR|
           (|Join| (|FunctionFieldCategory| F UP UPUP)
                   (CATEGORY |package|
                    (SIGNATURE |knownInfBasis|
                     ((|Void|) (|NonNegativeInteger|))))))
          (|nf| (UPUP)) (|lrhs| (|List| F)) (#5=#:G1261 NIL) (|pol| NIL)
          (#6=#:G1260 NIL) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |poly| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (#7=#:G1259 NIL) (|k| NIL) (#8=#:G1258 NIL)
          (|lp| (|List| (|SparseUnivariatePolynomial| F))) (#9=#:G1257 NIL)
          (#10=#:G1256 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #10# NIL . #11=(|PFO;simplifyCoeffs;RLNni;41|))
                 (SEQ (LETT |k| NIL . #11#) (LETT #9# |la| . #11#) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |k| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (SPADCALL |k| (QREFELT $ 173)) #10#)
                              . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |rec|
                (SPADCALL
                 (PROGN
                  (LETT #8# NIL . #11#)
                  (SEQ (LETT |k| NIL . #11#) (LETT #7# |la| . #11#) G190
                       (COND
                        ((OR (ATOM #7#)
                             (PROGN (LETT |k| (CAR #7#) . #11#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #8# (CONS (SPADCALL |k| (QREFELT $ 33)) #8#)
                               . #11#)))
                       (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                       (EXIT (NREVERSE #8#))))
                 (QREFELT $ 202))
                . #11#)
          (LETT |y| (SPADCALL (QVELT |rec| 2) (QREFELT $ 179)) . #11#)
          (LETT |lrhs|
                (PROGN
                 (LETT #6# NIL . #11#)
                 (SEQ (LETT |pol| NIL . #11#) (LETT #5# (QVELT |rec| 1) . #11#)
                      G190
                      (COND
                       ((OR (ATOM #5#)
                            (PROGN (LETT |pol| (CAR #5#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL |pol| |y| (QREFELT $ 34)) #6#)
                              . #11#)))
                      (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #11#)
          (LETT |nf| (|PFO;evalup| (QVELT |irec| 0) |la| |lrhs| $) . #11#)
          (LETT |nR|
                (|AlgebraicFunctionField| (QREFELT $ 7) (QREFELT $ 8)
                                          (QREFELT $ 9) |nf|)
                . #11#)
          (LETT |nFD|
                (|FiniteDivisor| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 9)
                                 |nR|)
                . #11#)
          (LETT |nFR|
                (|FractionalIdeal| (QREFELT $ 8) (|Fraction| (QREFELT $ 8))
                                   (QREFELT $ 9) |nR|)
                . #11#)
          (LETT |nPFO|
                (|PointsOfFiniteOrder| (QREFELT $ 6) (QREFELT $ 7)
                                       (QREFELT $ 8) (QREFELT $ 9) |nR|)
                . #11#)
          (LETT |nd|
                (SPADCALL (|PFO;evalup| (QVELT |irec| 2) |la| |lrhs| $)
                          (|compiledLookupCheck| '|reduce|
                                                 (LIST '$
                                                       (|devaluate| (ELT $ 9)))
                                                 |nR|))
                . #11#)
          (LETT |va|
                (PROGN
                 (LETT #4#
                       (GETREFV
                        (SIZE #12=(SPADCALL (QVELT |irec| 1) (QREFELT $ 143))))
                       . #11#)
                 (SEQ (LETT |ni| NIL . #11#) (LETT #3# #12# . #11#)
                      (LETT #2# 0 . #11#) G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |ni| (CAR #3#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #4# #2#
                                (SPADCALL
                                 (SPADCALL (|PFO;evalup| |ni| |la| |lrhs| $)
                                           (|compiledLookupCheck| '|reduce|
                                                                  (LIST '$
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              9)))
                                                                  |nR|))
                                 |nd|
                                 (|compiledLookupCheck| '/ (LIST '$ '$ '$)
                                                        |nR|)))))
                      (LETT #2#
                            (PROG1 (|inc_SI| #2#) (LETT #3# (CDR #3#) . #11#))
                            . #11#)
                      (GO G190) G191 (EXIT NIL))
                 #4#)
                . #11#)
          (LETT |ndiv|
                (SPADCALL
                 (SPADCALL |va|
                           (|compiledLookupCheck| '|ideal|
                                                  (LIST '$
                                                        (LIST '|Vector|
                                                              (|devaluate|
                                                               |nR|)))
                                                  |nFR|))
                 (|compiledLookupCheck| '|divisor|
                                        (LIST '$
                                              (LIST '|FractionalIdeal|
                                                    (|devaluate| (ELT $ 8))
                                                    (LIST '|Fraction|
                                                          (|devaluate|
                                                           (ELT $ 8)))
                                                    (|devaluate| (ELT $ 9))
                                                    (|devaluate| |nR|)))
                                        |nFD|))
                . #11#)
          (EXIT
           (SPADCALL |ndiv|
                     (|compiledLookupCheck| '|possibleOrder|
                                            (LIST (LIST '|NonNegativeInteger|)
                                                  (LIST '|FiniteDivisor|
                                                        (|devaluate| (ELT $ 7))
                                                        (|devaluate| (ELT $ 8))
                                                        (|devaluate| (ELT $ 9))
                                                        (|devaluate| |nR|)))
                                            |nPFO|)))))) 

(SDEFUN |PFO;possibleOrder;FdNni;42|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |NonNegativeInteger|))
        (SPROG
         ((|va| (|Vector| R)) (#1=#:G1279 NIL) (#2=#:G1281 NIL) (|ni| NIL)
          (#3=#:G1280 NIL) (|nden| (R)) (#4=#:G1278 NIL)
          (|la| (|List| (|Kernel| F)))
          (|irec|
           (|Record| (|:| |ncurve| UPUP) (|:| |n_div_numer| (|Vector| UPUP))
                     (|:| |n_div_denom| UPUP)
                     (|:| |need_change| (|Boolean|)))))
         (SEQ
          (EXIT
           (COND
            ((OR (ZEROP (SPADCALL (QREFELT $ 204)))
                 (EQL
                  (QVSIZE
                   (SPADCALL (SPADCALL |d| (QREFELT $ 129)) (QREFELT $ 131)))
                  1))
             1)
            ('T
             (SEQ
              (LETT |irec| (SPADCALL |d| (QREFELT $ 172))
                    . #5=(|PFO;possibleOrder;FdNni;42|))
              (LETT |la|
                    (|PFO;alglist1| (QVELT |irec| 0) (QVELT |irec| 1)
                     (QVELT |irec| 2) $)
                    . #5#)
              (EXIT
               (COND ((NULL |la|) (|PFO;ratcurve| |d| (|PFO;selIntegers| $) $))
                     (#6='T
                      (SEQ
                       (COND
                        ((NULL (CDR |la|))
                         (COND
                          ((QVELT |irec| 3)
                           (EXIT
                            (SEQ
                             (COND
                              ((|HasCategory| (QREFELT $ 6)
                                              '(|CharacteristicZero|))
                               (COND
                                ((|HasCategory| (QREFELT $ 7)
                                                '(|AlgebraicallyClosedField|))
                                 (PROGN
                                  (LETT #4#
                                        (SPADCALL |irec| |la| (QREFELT $ 203))
                                        . #5#)
                                  (GO #7=#:G1277))))))
                             (EXIT
                              (|error|
                               #8="PFO::possibleOrder: more than 1 algebraic constant")))))))
                        (#6#
                         (EXIT
                          (SEQ
                           (COND
                            ((|HasCategory| (QREFELT $ 6)
                                            '(|CharacteristicZero|))
                             (COND
                              ((|HasCategory| (QREFELT $ 7)
                                              '(|AlgebraicallyClosedField|))
                               (PROGN
                                (LETT #4#
                                      (SPADCALL |irec| |la| (QREFELT $ 203))
                                      . #5#)
                                (GO #7#))))))
                           (EXIT (|error| #8#))))))
                       (LETT |nden| (SPADCALL (QVELT |irec| 2) (QREFELT $ 205))
                             . #5#)
                       (LETT |va|
                             (PROGN
                              (LETT #3#
                                    (GETREFV
                                     (SIZE
                                      #9=(SPADCALL (QVELT |irec| 1)
                                                   (QREFELT $ 143))))
                                    . #5#)
                              (SEQ (LETT |ni| NIL . #5#) (LETT #2# #9# . #5#)
                                   (LETT #1# 0 . #5#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |ni| (CAR #2#) . #5#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SETELT #3# #1#
                                             (SPADCALL
                                              (SPADCALL |ni| (QREFELT $ 205))
                                              |nden| (QREFELT $ 206)))))
                                   (LETT #1#
                                         (PROG1 (|inc_SI| #1#)
                                           (LETT #2# (CDR #2#) . #5#))
                                         . #5#)
                                   (GO G190) G191 (EXIT NIL))
                              #3#)
                             . #5#)
                       (LETT |d|
                             (SPADCALL (SPADCALL |va| (QREFELT $ 207))
                                       (QREFELT $ 208))
                             . #5#)
                       (EXIT
                        (|PFO;algcurve| |d|
                         (|PFO;selectIntegers| (|SPADfirst| |la|) $)
                         (|SPADfirst| |la|) $))))))))))
          #7# (EXIT #4#)))) 

(SDEFUN |PFO;selIntegers|
        (($ |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|Fraction|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))))
        (SPROG
         ((#1=#:G1287 NIL) (|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|Fraction|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|f| (UPUP)))
         (SEQ
          (EXIT
           (SEQ (LETT |f| (SPADCALL (QREFELT $ 140)) . #2=(|PFO;selIntegers|))
                (LETT |n| (EXPT 10 6) . #2#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (SPADCALL |n| (QREFELT $ 210))
                           (LETT |d|
                                 (SPADCALL
                                  (LETT |r|
                                        (SPADCALL (|PFO;pmod| |f| $)
                                                  (QREFELT $ 211))
                                        . #2#)
                                  (QREFELT $ 212))
                                 . #2#)
                           (EXIT
                            (COND
                             ((NULL (ZEROP |d|))
                              (PROGN
                               (LETT #1# (CONS |r| |d|) . #2#)
                               (GO #3=#:G1286))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PFO;selectIntegers|
        ((|k| |Kernel| F)
         ($ |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))
          (|:| |dfpoly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG
         ((#1=#:G1296 NIL) (|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|p| (|SparseUnivariatePolynomial| F)) (|g| (UPUP))
          (|f| (UPUP)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g|
                  (|PFO;polyred|
                   (LETT |f| (SPADCALL (QREFELT $ 140))
                         . #2=(|PFO;selectIntegers|))
                   $)
                  . #2#)
            (LETT |p| (SPADCALL |k| (QREFELT $ 173)) . #2#)
            (LETT |n| (EXPT 10 6) . #2#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (SPADCALL |n| (QREFELT $ 210))
                       (LETT |d|
                             (|PFO;doubleDisc|
                              (LETT |r| (|PFO;kpmod| |g| |k| $) . #2#) $)
                             . #2#)
                       (COND
                        ((OR (ZEROP |d|) (|PFO;notIrr?| (|PFO;fmod| |p| $) $))
                         (EXIT "iterate")))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (VECTOR |r| |d|
                                       (QCAR
                                        (SPADCALL (|PFO;fmod| |p| $)
                                                  (QREFELT $ 215))))
                               . #2#)
                         (GO #3=#:G1295))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |PFO;order;FdU;45|
        ((|d| |FiniteDivisor| F UP UPUP R)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((OR
                  (ZEROP
                   (LETT |n|
                         (SPADCALL
                          (LETT |d| (SPADCALL |d| (QREFELT $ 83))
                                . #1=(|PFO;order;FdU;45|))
                          (QREFELT $ 84))
                         . #1#))
                  (NULL
                   (SPADCALL
                    (SPADCALL (SPADCALL |n| |d| (QREFELT $ 85)) (QREFELT $ 83))
                    (QREFELT $ 216))))
                 (CONS 1 "failed"))
                ('T (CONS 0 |n|))))) 

(SDEFUN |PFO;kgetGoodPrime|
        ((|rec| |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))
          (|:| |dfpoly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|res| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|b| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         ($ |Record| (|:| |prime| (|PositiveInteger|))
          (|:| |poly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG
         ((#1=#:G1306 NIL) (|p| (|PositiveInteger|)) (#2=#:G1308 NIL)
          (|u|
           (|Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                    #3="failed"))
          (#4=#:G1304 NIL))
         (SEQ
          (LETT |p|
                (PROG1
                    (LETT #4#
                          (SPADCALL (SPADCALL (QREFELT $ 194)) (QREFELT $ 218))
                          . #5=(|PFO;kgetGoodPrime|))
                  (|check_subtype2| (> #4# 0) '(|PositiveInteger|) '(|Integer|)
                                    #4#))
                . #5#)
          (SEQ G190
               (COND
                ((NULL
                  (QEQCAR
                   (LETT |u| (|PFO;goodRed| |rec| |res| |h| |b| |d| |p| $)
                         . #5#)
                   1))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |p|
                       (PROG1 (LETT #2# (SPADCALL |p| (QREFELT $ 218)) . #5#)
                         (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                           '(|Integer|) #2#))
                       . #5#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS |p|
                 (PROG2 (LETT #1# |u| . #5#)
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
        ((|rec| |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))
          (|:| |dfpoly|
               (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|res| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|b| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|p| |PositiveInteger|)
         ($ |Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
          "failed"))
        (SPROG
         ((|md| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|mdg| (|SparseUnivariatePolynomial| |gf|)) (#1=#:G1328 NIL)
          (|ff| NIL) (|l| (|List| (|SparseUnivariatePolynomial| |gf|)))
          (#2=#:G1327 NIL) (|f| NIL) (#3=#:G1326 NIL)
          (|gf|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|)))))
         (SEQ
          (COND ((ZEROP (REM (QVELT |rec| 1) |p|)) (CONS 1 "failed"))
                (#4='T
                 (SEQ (LETT |gf| (|InnerPrimeField| |p|) . #5=(|PFO;goodRed|))
                      (LETT |l|
                            (PROGN
                             (LETT #3# NIL . #5#)
                             (SEQ (LETT |f| NIL . #5#)
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (CONS #'|PFO;goodRed!0|
                                                 (VECTOR |gf| $))
                                           (QVELT |rec| 2)
                                           (|compiledLookupCheck| '|map|
                                                                  (LIST
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     |gf|))
                                                                   (LIST
                                                                    '|Mapping|
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
                                                                  (LIST
                                                                   '|Factored|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     |gf|)))
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    |gf|)))
                                                                 (|DistinctDegreeFactorize|
                                                                  |gf|
                                                                  (|SparseUnivariatePolynomial|
                                                                   |gf|))))
                                         (|compiledLookupCheck| '|factors|
                                                                (LIST
                                                                 (LIST '|List|
                                                                       (LIST
                                                                        '|Record|
                                                                        (LIST
                                                                         '|:|
                                                                         '|factor|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           |gf|)))
                                                                        (LIST
                                                                         '|:|
                                                                         '|exponent|
                                                                         (LIST
                                                                          '|Integer|))))
                                                                 '$)
                                                                (|Factored|
                                                                 (|SparseUnivariatePolynomial|
                                                                  |gf|))))
                                        . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |f| (CAR #2#) . #5#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL (QCDR |f|) 1)
                                      (LETT #3# (CONS (QCAR |f|) #3#)
                                            . #5#)))))
                                  (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            . #5#)
                      (EXIT
                       (COND ((NULL |l|) (CONS 1 "failed"))
                             (#4#
                              (SEQ (LETT |mdg| (|SPADfirst| |l|) . #5#)
                                   (SEQ (LETT |ff| NIL . #5#)
                                        (LETT #1# (CDR |l|) . #5#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |ff| (CAR #1#) . #5#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((<
                                             (SPADCALL |ff|
                                                       (|compiledLookupCheck|
                                                        '|degree|
                                                        (LIST
                                                         (LIST
                                                          '|NonNegativeInteger|)
                                                         '$)
                                                        (|SparseUnivariatePolynomial|
                                                         |gf|)))
                                             (SPADCALL |mdg|
                                                       (|compiledLookupCheck|
                                                        '|degree|
                                                        (LIST
                                                         (LIST
                                                          '|NonNegativeInteger|)
                                                         '$)
                                                        (|SparseUnivariatePolynomial|
                                                         |gf|))))
                                            (LETT |mdg| |ff| . #5#)))))
                                        (LETT #1# (CDR #1#) . #5#) (GO G190)
                                        G191 (EXIT NIL))
                                   (LETT |md|
                                         (SPADCALL
                                          (CONS #'|PFO;goodRed!1|
                                                (VECTOR $ |gf|))
                                          |mdg|
                                          (|compiledLookupCheck| '|map|
                                                                 (LIST
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|Integer|)))
                                                                  (LIST
                                                                   '|Mapping|
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
                                                                   (|Integer|)))))
                                         . #5#)
                                   (EXIT
                                    (COND
                                     ((|PFO;good?| |res| |h| |b| |d| |p| |md|
                                       $)
                                      (CONS 0 |md|))
                                     (#4# (CONS 1 "failed")))))))))))))) 

(SDEFUN |PFO;goodRed!1| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $)
          (LETT |gf| (QREFELT $$ 1) . #1=(|PFO;goodRed|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |z1|
                       (|compiledLookupCheck| '|convert|
                                              (LIST (LIST '|Integer|) '$)
                                              |gf|))
             (QREFELT $ 219)))))) 

(SDEFUN |PFO;goodRed!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;goodRed|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 114))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '$ (LIST '|Integer|))
                                             |gf|)))))) 

(SDEFUN |PFO;good?|
        ((|res| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|b| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|p| |PositiveInteger|)
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPROG
         ((|bd| (|Record| (|:| |den| (|Integer|)) (|:| |gcdnum| (|Integer|)))))
         (SEQ
          (LETT |bd|
                (SPADCALL (SPADCALL |res| |m| (QREFELT $ 74)) (QREFELT $ 77))
                |PFO;good?|)
          (EXIT
           (COND
            ((OR (ZEROP (REM (QCAR |bd|) |p|))
                 (OR (ZEROP (REM (QCDR |bd|) |p|))
                     (OR (ZEROP (REM (|PFO;kbadBadNum| |b| |m| $) |p|))
                         (ZEROP (REM (|PFO;kbadBadNum| |d| |m| $) |p|)))))
             NIL)
            ('T (NULL (ZEROP (REM (|PFO;kbad3Num| |h| |m| $) |p|))))))))) 

(DECLAIM (NOTINLINE |PointsOfFiniteOrder;|)) 

(DEFUN |PointsOfFiniteOrder| (&REST #1=#:G1336)
  (SPROG NIL
         (PROG (#2=#:G1337)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PointsOfFiniteOrder|)
                                               '|domainEqualList|)
                    . #3=(|PointsOfFiniteOrder|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PointsOfFiniteOrder;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PointsOfFiniteOrder|)))))))))) 

(DEFUN |PointsOfFiniteOrder;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PointsOfFiniteOrder|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|PointsOfFiniteOrder| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 220) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|AlgebraicallyClosedField|)))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|PointsOfFiniteOrder|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 '|%alg|)
    (QSETREFV $ 12 (|FunctionSpaceReduce| |#1| |#2|))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (QSETREFV $ 101 (CONS (|dispatchFunction| |PFO;cmult;LSmp;21|) $)))
     ('T (QSETREFV $ 101 (CONS (|dispatchFunction| |PFO;cmult;LSmp;22|) $))))
    (COND
     ((|domainEqual| |#1| (|Complex| (|Integer|)))
      (COND
       ((|domainEqual| |#2| (|Expression| |#1|))
        (PROGN
         (QSETREFV $ 172
                   (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;33|)
                         $))))
       ('T
        (QSETREFV $ 172
                  (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;34|)
                        $)))))
     ('T
      (QSETREFV $ 172
                (CONS (|dispatchFunction| |PFO;handle_imaginary;FdR;35|) $))))
    (COND
     ((|HasCategory| |#1| '(|CharacteristicZero|))
      (COND
       ((|HasCategory| |#2| '(|AlgebraicallyClosedField|))
        (QSETREFV $ 203
                  (CONS (|dispatchFunction| |PFO;simplifyCoeffs;RLNni;41|)
                        $))))))
    $))) 

(MAKEPROP '|PointsOfFiniteOrder| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) 'ALGOP '|q|
              (|Union| 70 '"failed") (|FiniteDivisor| 7 8 9 10)
              |PFO;order;FdU;45| (|Boolean|) |PFO;torsion?;FdB;1| (|Integer|)
              (|Fraction| 18) (0 . |numer|) (5 . |coerce|) (10 . |denom|)
              (15 . /) (|Mapping| 7 19)
              (|SparseUnivariatePolynomial| (|Fraction| 29))
              (|MultipleMap| 19 29 25 7 8 9) (21 . |map|)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomial| 19)
              (|SparseUnivariatePolynomialFunctions2| 19 7) (27 . |map|)
              (|Kernel| $) (33 . |coerce|) (38 . |elt|) (|Mapping| 7 29)
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
              (|List| $) (101 . |algtower|) (|Factored| 29)
              (|RationalFactorize| 29) (106 . |factor|)
              (|Record| (|:| |factor| 29) (|:| |exponent| 18)) (|List| 66)
              (111 . |factors|) (116 . |One|) (|NonNegativeInteger|) (120 . >)
              (|List| 29) (126 . |coefficients|) (131 . |rem|)
              (|Record| (|:| |den| 18) (|:| |gcdnum| 18))
              (|PointsOfFiniteOrderTools| 29 25) (137 . |badNum|) (|List| 75)
              (142 . |mix|) (|List| 36) (147 . |coefficients|) (152 . |lcm|)
              (157 . |reduce|) |PFO;possibleOrder;FdNni;42| (162 . *)
              (|Union| 10 '"failed") (168 . |generator|)
              (|Record| (|:| |order| 70) (|:| |function| 10))
              (|Union| 88 '"failed") |PFO;torsionIfCan;FdU;17|
              (|UnivariatePolynomialCategoryFunctions2| 19 29 7 8)
              (173 . |map|) (179 . |elt|) (185 . |coerce|) (|Mapping| 52 36)
              (|UnivariatePolynomialCategoryFunctions2| 36 54 52 9)
              (190 . |map|) (|SparseMultivariatePolynomial| 6 47) (196 . |lcm|)
              (|List| 98) (201 . |cmult|) (206 . *) (212 . |One|)
              (216 . |discriminant|) (221 . |differentiate|) (226 . |gcd|)
              (|Union| $ '"failed") (232 . |exquo|) (238 . |discriminant|)
              (242 . |discriminant|) (247 . |zero?|) (|List| 19)
              (252 . |coefficients|) (257 . |retract|) (262 . |gcd|)
              (|SparseMultivariatePolynomial| 6 32) (267 . |denom|) (|List| 52)
              (272 . |coefficients|) (277 . |coerce|) (282 . |coerce|)
              (287 . *) (|Union| 52 '#1="failed") (293 . |retractIfCan|)
              (298 . |lift|) (|List| 47) (303 . |setUnion|)
              (|FractionalIdeal| 8 52 9 10) (309 . |ideal|) (|Vector| 10)
              (314 . |numer|) (|BasicOperator|) (319 . |operator|) (|Symbol|)
              (324 . |has?|) (330 . |denom|) (335 . |minIndex|)
              (|Mapping| 16 47) (340 . |select!|) (346 . |definingPolynomial|)
              (|List| 9) (|Vector| 9) (350 . |entries|) (|Complex| 18)
              (355 . |real|) (360 . |coerce|) (|Mapping| 6 6) (365 . |map|)
              (371 . |imag|) (376 . *) (382 . +) (388 . |numer|)
              (|Mapping| 7 7) (393 . |map|) (|Mapping| 8 8) (399 . |map|)
              (|Mapping| 52 52) (405 . |map|) (411 . |One|) (415 . |monomial|)
              (421 . |One|) (425 . +) (|SparseUnivariatePolynomial| $)
              (|Expression| 6) (431 . |rootOf|) (|List| 10) (436 . |entries|)
              (441 . |vector|) (446 . |coerce|) (451 . ~=)
              (|Record| (|:| |ncurve| 9) (|:| |n_div_numer| 142)
                        (|:| |n_div_denom| 9) (|:| |need_change| 16))
              (457 . |handle_imaginary|) (462 . |minPoly|) (|Union| 19 '#1#)
              (467 . |retractIfCan|) (472 . |coefficients|) (|Mapping| 16 7)
              (477 . |every?|) (483 . |rootOf|) (488 . |kernels|)
              (493 . |minimize|) (498 . |elt|) (504 . |retract|)
              (509 . |primitivePart|) (514 . |norm|)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (519 . |separate|) (525 . |resultant|) (531 . |Zero|)
              (535 . |Zero|) (539 . |separate|) (545 . |resultant|)
              (|PositiveInteger|) (551 . |rank|) (555 . |factorial|)
              (560 . |badNum|) (565 . |getGoodPrime|) (570 . *) (576 . |eval|)
              (|Record| (|:| |primelt| 7) (|:| |poly| (|List| 28))
                        (|:| |prim| 28))
              (|FunctionSpacePrimitiveElement| 6 7) (583 . |primitiveElement|)
              (588 . |simplifyCoeffs|) (594 . |genus|) (598 . |reduce|)
              (603 . /) (609 . |ideal|) (614 . |divisor|) (|Void|)
              (619 . |newReduc|) (624 . |polyred|) (629 . |doubleDisc|)
              (|Record| (|:| |num| 29) (|:| |den| 18))
              (|UnivariatePolynomialCommonDenominator| 18 19 29)
              (634 . |splitDenominator|) (639 . |principal?|)
              (|IntegerPrimesPackage| 18) (644 . |nextPrime|) (649 . |coerce|))
           '#(|torsionIfCan| 654 |torsion?| 659 |simplifyCoeffs| 664
              |possibleOrder| 670 |order| 675 |handle_imaginary| 680 |cmult|
              685)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 219
                                                 '(1 19 18 0 20 1 7 0 18 21 1
                                                   19 18 0 22 2 7 0 0 0 23 2 26
                                                   9 24 25 27 2 30 28 24 29 31
                                                   1 7 0 32 33 2 28 7 0 7 34 2
                                                   37 8 35 36 38 1 12 19 7 39 2
                                                   41 29 40 28 42 2 43 25 40 9
                                                   44 2 45 29 40 8 46 2 12 29 7
                                                   47 48 2 50 36 49 8 51 1 52 8
                                                   0 53 2 56 54 55 9 57 1 8 58
                                                   0 59 1 7 60 61 62 1 64 63 29
                                                   65 1 63 67 0 68 0 6 0 69 2
                                                   70 16 0 0 71 1 36 72 0 73 2
                                                   29 0 0 0 74 1 76 75 29 77 1
                                                   76 18 78 79 1 54 80 0 81 1
                                                   18 0 61 82 1 14 0 0 83 2 14
                                                   0 18 0 85 1 14 86 0 87 2 91
                                                   8 24 29 92 2 8 7 0 7 93 1 52
                                                   0 8 94 2 96 9 95 54 97 1 98
                                                   0 61 99 1 0 98 100 101 2 98
                                                   0 0 0 102 0 98 0 103 1 54 36
                                                   0 104 1 36 0 0 105 2 36 0 0
                                                   0 106 2 36 107 0 0 108 0 10
                                                   52 109 1 36 29 0 110 1 29 16
                                                   0 111 1 29 112 0 113 1 19 18
                                                   0 114 1 18 0 61 115 1 7 116
                                                   0 117 1 9 118 0 119 1 7 0
                                                   116 120 1 8 0 7 121 2 9 0 52
                                                   0 122 1 10 123 0 124 1 10 9
                                                   0 125 2 126 0 0 0 127 1 14
                                                   128 0 129 1 128 130 0 131 1
                                                   47 132 0 133 2 132 16 0 134
                                                   135 1 128 8 0 136 1 130 18 0
                                                   137 2 126 0 138 0 139 0 10 9
                                                   140 1 142 141 0 143 1 144 18
                                                   0 145 1 6 0 18 146 2 98 0
                                                   147 0 148 1 144 18 0 149 2 7
                                                   0 0 0 150 2 7 0 0 0 151 1 7
                                                   116 0 152 2 8 0 153 0 154 2
                                                   52 0 155 0 156 2 9 0 157 0
                                                   158 0 7 0 159 2 28 0 7 70
                                                   160 0 28 0 161 2 28 0 0 0
                                                   162 1 164 0 163 165 1 130
                                                   166 0 167 1 142 0 141 168 1
                                                   9 0 52 169 2 9 16 0 0 170 1
                                                   0 171 14 172 1 7 163 32 173
                                                   1 7 174 0 175 1 28 58 0 176
                                                   2 58 16 177 0 178 1 7 0 163
                                                   179 1 7 60 0 180 1 128 0 0
                                                   181 2 130 10 0 18 182 1 10
                                                   52 0 183 1 8 0 0 184 1 10 52
                                                   0 185 2 8 186 0 0 187 2 8 7
                                                   0 0 188 0 6 0 189 0 7 0 190
                                                   2 29 186 0 0 191 2 29 19 0 0
                                                   192 0 10 193 194 1 18 0 0
                                                   195 1 76 18 25 196 1 76 193
                                                   18 197 2 18 0 193 0 198 3 7
                                                   0 0 60 61 199 1 201 200 58
                                                   202 2 0 70 171 126 203 0 10
                                                   70 204 1 10 0 9 205 2 10 0 0
                                                   0 206 1 128 0 130 207 1 14 0
                                                   128 208 1 12 209 18 210 1 76
                                                   25 25 211 1 76 18 25 212 1
                                                   214 213 29 215 1 14 16 0 216
                                                   1 217 18 18 218 1 19 0 18
                                                   219 1 0 89 14 90 1 0 16 14
                                                   17 2 1 70 171 126 203 1 0 70
                                                   14 84 1 0 13 14 15 1 0 171
                                                   14 172 1 0 98 100 101)))))
           '|lookupComplete|)) 
