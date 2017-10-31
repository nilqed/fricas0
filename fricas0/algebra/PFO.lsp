
(SDEFUN |PFO;torsion?;FdB;1| ((|d| |FiniteDivisor| F UP UPUP R) ($ |Boolean|))
        (QEQCAR (SPADCALL |d| (QREFELT $ 15)) 0)) 

(SDEFUN |PFO;Q2F| ((|x| |Fraction| (|Integer|)) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 21))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 22)) (QREFELT $ 21))
                  (QREFELT $ 23))) 

(SDEFUN |PFO;qmod| ((|x| F) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 24))) 

(SDEFUN |PFO;kqmod|
        ((|x| F) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL |x| |k| (QREFELT $ 27))) 

(SDEFUN |PFO;fmod|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 31))) 

(SDEFUN |PFO;pmod|
        ((|p| UPUP)
         ($ |SparseUnivariatePolynomial|
          (|Fraction|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 34))) 

(SDEFUN |PFO;Q2UPUP|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ UPUP))
        (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 37))) 

(SDEFUN |PFO;klist| ((|d| UP) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G737 NIL) (#2=#:G736 #3=(|List| (|Kernel| F))) (#4=#:G738 #3#)
          (#5=#:G740 NIL) (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|PFO;klist|))
           (SEQ (LETT |c| NIL . #6#)
                (LETT #5# (SPADCALL |d| (QREFELT $ 39)) . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (SPADCALL |c| (QREFELT $ 41)) . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 43)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))))) 

(SDEFUN |PFO;notIrr?|
        ((|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPADCALL
         (LENGTH (SPADCALL (SPADCALL |d| (QREFELT $ 46)) (QREFELT $ 49))) 1
         (QREFELT $ 52))) 

(SDEFUN |PFO;kbadBadNum|
        ((|d| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G762 NIL) (|c| NIL) (#2=#:G761 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PFO;kbadBadNum|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (SPADCALL |d| (QREFELT $ 55)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |c| |m| (QREFELT $ 56))
                                          (QREFELT $ 59))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 61))))) 

(SDEFUN |PFO;kbad3Num|
        ((|h| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|m| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG ((#1=#:G766 NIL) (|c| NIL) (#2=#:G765 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|PFO;kbad3Num|))
                  (SEQ (LETT |c| NIL . #3#)
                       (LETT #1# (SPADCALL |h| (QREFELT $ 64)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|PFO;kbadBadNum| |c| |m| $) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 66))))) 

(SDEFUN |PFO;torsionIfCan;FdU;12|
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
                          (LETT |d| (SPADCALL |d| (QREFELT $ 67))
                                . #1=(|PFO;torsionIfCan;FdU;12|))
                          (QREFELT $ 68))
                         . #1#))
                  (CONS 1 "failed"))
                 (#2='T
                  (SEQ
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |d| (QREFELT $ 69))
                                    (QREFELT $ 67))
                          (QREFELT $ 71))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                          (#2# (CONS 0 (CONS |n| (QCDR |g|)))))))))))) 

(SDEFUN |PFO;UPQ2F|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 76))
                  (SPADCALL |k| (QREFELT $ 78)) (QREFELT $ 79))) 

(SDEFUN |PFO;UP22UP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;UP22UP!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 82)))) 

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
                         (QREFELT $ 87)))) 

(SDEFUN |PFO;UP32UPUP!0| ((|p1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;UP32UPUP|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|PFO;UP22UP| |p1| |k| $) (QREFELT $ 84)))))) 

(SDEFUN |PFO;cmult;LSmp;16|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPADCALL |l| (QREFELT $ 89))) 

(SDEFUN |PFO;cmult;LSmp;17|
        ((|l| |List| (|SparseMultivariatePolynomial| R0 (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((#1=#:G790 NIL)
          (#2=#:G789 #3=(|SparseMultivariatePolynomial| R0 (|Kernel| F)))
          (#4=#:G791 #3#) (#5=#:G793 NIL) (#6=#:G690 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|PFO;cmult;LSmp;17|))
           (SEQ (LETT #6# NIL . #7#) (LETT #5# |l| . #7#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# #6# . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 92)) . #7#))
                    ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 93))))))) 

(SDEFUN |PFO;doubleDisc|
        ((|f| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         ($ |Integer|))
        (SPROG
         ((#1=#:G801 NIL) (|c| NIL) (#2=#:G800 NIL)
          (|e| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|d|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
          (#3=#:G795 NIL)
          (|g|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 94)) . #4=(|PFO;doubleDisc|))
              (LETT |g|
                    (SPADCALL |d| (SPADCALL |d| (QREFELT $ 95)) (QREFELT $ 96))
                    . #4#)
              (LETT |d|
                    (PROG2 (LETT #3# (SPADCALL |d| |g| (QREFELT $ 98)) . #4#)
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
                ((SPADCALL (LETT |e| (SPADCALL |d| (QREFELT $ 100)) . #4#)
                           (QREFELT $ 101))
                 0)
                ('T
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #4#)
                   (SEQ (LETT |c| NIL . #4#)
                        (LETT #1# (SPADCALL |e| (QREFELT $ 103)) . #4#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |c| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 104)) #2#)
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 105)))))))) 

(SDEFUN |PFO;commonDen|
        ((|p| UP) ($ |SparseMultivariatePolynomial| R0 (|Kernel| F)))
        (SPROG
         ((|l2| (|List| (|SparseMultivariatePolynomial| R0 (|Kernel| F))))
          (#1=#:G806 NIL) (|c| NIL) (#2=#:G805 NIL) (|l1| (|List| F)))
         (SEQ (LETT |l1| (SPADCALL |p| (QREFELT $ 39)) . #3=(|PFO;commonDen|))
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
                            (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 107)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |l2| (QREFELT $ 91)))))) 

(SDEFUN |PFO;polyred| ((|f| UPUP) ($ UPUP))
        (SPROG ((#1=#:G917 NIL) (|c| NIL) (#2=#:G916 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #3=(|PFO;polyred|))
                      (SEQ (LETT |c| NIL . #3#)
                           (LETT #1# (SPADCALL |f| (QREFELT $ 109)) . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|PFO;commonDen|
                                     (SPADCALL |c| (QREFELT $ 110)) $)
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 91))
                    (QREFELT $ 111))
                   (QREFELT $ 112))
                  (QREFELT $ 84))
                 |f| (QREFELT $ 113))))) 

(SDEFUN |PFO;aklist| ((|f| R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G922 NIL) (#2=#:G921 #3=(|List| (|Kernel| F))) (#4=#:G923 #3#)
          (#5=#:G926 NIL) (|c| NIL) (|r| (|Union| (|Fraction| UP) "failed")))
         (SEQ (LETT |r| (SPADCALL |f| (QREFELT $ 115)) . #6=(|PFO;aklist|))
              (EXIT
               (COND
                ((QEQCAR |r| 1)
                 (PROGN
                  (LETT #1# NIL . #6#)
                  (SEQ (LETT |c| NIL . #6#)
                       (LETT #5#
                             (SPADCALL (SPADCALL |f| (QREFELT $ 116))
                                       (QREFELT $ 109))
                             . #6#)
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|PFO;klist| (SPADCALL |c| (QREFELT $ 110)) $)
                                . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 43)) . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7='T (|IdentityError| '|setUnion|)))))
                (#7# (|PFO;klist| (SPADCALL (QCDR |r|) (QREFELT $ 110)) $))))))) 

(SDEFUN |PFO;alglist|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |List| (|Kernel| F)))
        (SPROG
         ((#1=#:G930 NIL) (#2=#:G929 #3=(|List| (|Kernel| F))) (#4=#:G931 #3#)
          (#5=#:G934 NIL) (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|n| (|Vector| R)))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |i| (SPADCALL |d| (QREFELT $ 118)) . #6=(|PFO;alglist|))
                 (QREFELT $ 120))
                . #6#)
          (EXIT
           (SPADCALL (CONS #'|PFO;alglist!0| (VECTOR (QREFELT $ 11) $))
                     (SPADCALL (|PFO;klist| (SPADCALL |i| (QREFELT $ 125)) $)
                               (PROGN
                                (LETT #1# NIL . #6#)
                                (SEQ
                                 (LETT |i| (SPADCALL |n| (QREFELT $ 126))
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
                                            (SPADCALL #2# #4# (QREFELT $ 43))
                                            . #6#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #6#)
                                       (LETT #1# 'T . #6#)))))))
                                 (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                                 (EXIT NIL))
                                (COND (#1# #2#)
                                      ('T (|IdentityError| '|setUnion|))))
                               (QREFELT $ 43))
                     (QREFELT $ 128)))))) 

(SDEFUN |PFO;alglist!0| ((|k1| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;alglist|))
          (LETT ALGOP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |k1| (QREFELT $ 122)) ALGOP (QREFELT $ 124)))))) 

(SDEFUN |PFO;krmod|
        ((|p| UP) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;krmod!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 131)))) 

(SDEFUN |PFO;krmod!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;krmod|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;kqmod| |z1| |k| $))))) 

(SDEFUN |PFO;rmod|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (CONS (|function| |PFO;qmod|) $) |p| (QREFELT $ 133))) 

(SDEFUN |PFO;raise|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         (|k| |Kernel| F) ($ F))
        (SPADCALL
         (SPADCALL (CONS (|function| |PFO;Q2F|) $) |p| (QREFELT $ 135))
         (SPADCALL |k| (QREFELT $ 78)) (QREFELT $ 136))) 

(SDEFUN |PFO;raise2|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|k| |Kernel| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;raise2!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 82)))) 

(SDEFUN |PFO;raise2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|PFO;raise2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;raise| |z1| |k| $))))) 

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
          (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ
          (LETT |mn|
                (SPADCALL
                 (LETT |n|
                       (SPADCALL
                        (LETT |i|
                              (SPADCALL (SPADCALL |d| (QREFELT $ 118))
                                        (QREFELT $ 137))
                              . #4=(|PFO;algcurve|))
                        (QREFELT $ 120))
                       . #4#)
                 (QREFELT $ 126))
                . #4#)
          (LETT |h|
                (|PFO;kpmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |n| (+ |mn| 1) (QREFELT $ 139)) . #4#)
                  (QREFELT $ 116))
                 |k| $)
                . #4#)
          (LETT |b2|
                (SPADCALL
                 (|PFO;raise2|
                  (LETT |b|
                        (|PFO;krmod|
                         (SPADCALL
                          (SPADCALL (SPADCALL |n| |mn| (QREFELT $ 139))
                                    (QREFELT $ 140))
                          (QREFELT $ 110))
                         |k| $)
                        . #4#)
                  |k| $)
                 (QREFELT $ 141))
                . #4#)
          (LETT |s|
                (|PFO;kqmod|
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (SPADCALL
                     (|PFO;raise2|
                      (|PFO;krmod|
                       (SPADCALL (SPADCALL |hh| (QREFELT $ 142))
                                 (QREFELT $ 110))
                       |k| $)
                      |k| $)
                     |b2| (QREFELT $ 144)))
                   (QREFELT $ 141))
                  |b2| (QREFELT $ 145))
                 |k| $)
                . #4#)
          (LETT |pr|
                (|PFO;kgetGoodPrime| |rc| |s| |h| |b|
                 (LETT |dd| (|PFO;krmod| (SPADCALL |i| (QREFELT $ 125)) |k| $)
                       . #4#)
                 $)
                . #4#)
          (LETT |p| (QCAR |pr|) . #4#)
          (LETT |pp| (|PFO;UP32UPUP| (QVELT |rc| 0) |k| $) . #4#)
          (LETT |mm| (QCDR |pr|) . #4#)
          (LETT |gf| (|InnerPrimeField| |p|) . #4#)
          (LETT |m|
                (SPADCALL (CONS #'|PFO;algcurve!0| (VECTOR |gf| $)) |mm|
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
                         (CONS #'|PFO;algcurve!2| (VECTOR |alpha| |k| $ |gf|))
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
            ('T
             (SEQ
              (LETT |sae|
                    (|SimpleAlgebraicExtension| |gf|
                                                (|SparseUnivariatePolynomial|
                                                 |gf|)
                                                |m|)
                    . #4#)
              (EXIT
               (SPADCALL |d| |pp|
                         (CONS #'|PFO;algcurve!4| (VECTOR |sae| |k| $ |gf|))
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

(SDEFUN |PFO;algcurve!4| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $ |k| |sae|)
          (LETT |gf| (QREFELT $$ 3) . #1=(|PFO;algcurve|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |k| (QREFELT $$ 1) . #1#)
          (LETT |sae| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;algcurve!3| (VECTOR |gf| $))
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

(SDEFUN |PFO;algcurve!3| ((|q1| NIL) ($$ NIL))
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

(SDEFUN |PFO;algcurve!2| ((|z1| NIL) ($$ NIL))
        (PROG (|gf| $ |k| |alpha|)
          (LETT |gf| (QREFELT $$ 3) . #1=(|PFO;algcurve|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |k| (QREFELT $$ 1) . #1#)
          (LETT |alpha| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL (CONS #'|PFO;algcurve!1| (VECTOR |gf| $))
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

(SDEFUN |PFO;algcurve!1| ((|q1| NIL) ($$ NIL))
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

(SDEFUN |PFO;algcurve!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;algcurve|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 104))
                      (|compiledLookupCheck| '|coerce|
                                             (LIST '$ (LIST '|Integer|))
                                             |gf|)))))) 

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
                              (SPADCALL (SPADCALL |d| (QREFELT $ 118))
                                        (QREFELT $ 137))
                              . #2=(|PFO;ratcurve|))
                        (QREFELT $ 120))
                       . #2#)
                 (QREFELT $ 126))
                . #2#)
          (LETT |h|
                (|PFO;pmod|
                 (SPADCALL
                  (LETT |hh| (SPADCALL |nm| (+ |mn| 1) (QREFELT $ 139)) . #2#)
                  (QREFELT $ 116))
                 $)
                . #2#)
          (LETT |b|
                (|PFO;rmod|
                 (SPADCALL
                  (SPADCALL (SPADCALL |nm| |mn| (QREFELT $ 139))
                            (QREFELT $ 140))
                  (QREFELT $ 110))
                 $)
                . #2#)
          (LETT |s|
                (QCAR
                 (SPADCALL
                  (|PFO;rmod|
                   (SPADCALL (SPADCALL |hh| (QREFELT $ 142)) (QREFELT $ 110))
                   $)
                  |b| (QREFELT $ 148)))
                . #2#)
          (LETT |bd|
                (SPADCALL (|PFO;rmod| (SPADCALL |i| (QREFELT $ 125)) $)
                          (QREFELT $ 59))
                . #2#)
          (LETT |r| (SPADCALL |s| |b| (QREFELT $ 149)) . #2#)
          (LETT |bad|
                (SPADCALL
                 (LIST (SPADCALL (SPADCALL (QREFELT $ 151)) (QREFELT $ 152))
                       (QCDR |rc|) (SPADCALL |r| (QREFELT $ 20))
                       (SPADCALL |r| (QREFELT $ 22))
                       (* (QCAR |bd|) (QCDR |bd|))
                       (SPADCALL |h| (QREFELT $ 153)))
                 (QREFELT $ 66))
                . #2#)
          (LETT |pp| (|PFO;Q2UPUP| (QCAR |rc|) $) . #2#)
          (LETT |n|
                (|PFO;rat| |pp| |d|
                 (LETT |p| (SPADCALL |bad| (QREFELT $ 154)) . #2#) $)
                . #2#)
          (EXIT
           (COND ((EQL |n| 1) |n|)
                 (#3='T
                  (SEQ
                   (LETT |m|
                         (|PFO;rat| |pp| |d|
                          (SPADCALL (SPADCALL |p| |bad| (QREFELT $ 155))
                                    (QREFELT $ 154))
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
                         (QREFELT $ 162)))) 

(SDEFUN |PFO;evalup!2| ((|a| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2) . #1=(|PFO;evalup|))
          (LETT |lrhs| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!1| (VECTOR |la| |lrhs| $)) |a|
                             (QREFELT $ 160))))))) 

(SDEFUN |PFO;evalup!1| ((|b| NIL) ($$ NIL))
        (PROG ($ |lrhs| |la|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lrhs| (QREFELT $$ 1) NIL)
          (LETT |la| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|PFO;evalup!0| (VECTOR $ |lrhs| |la|)) |b|
                             (QREFELT $ 158))))))) 

(SDEFUN |PFO;evalup!0| ((|c| NIL) ($$ NIL))
        (PROG (|la| |lrhs| $)
          (LETT |la| (QREFELT $$ 2) NIL)
          (LETT |lrhs| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |c| |la| |lrhs| (QREFELT $ 156)))))) 

(SDEFUN |PFO;evala|
        ((|f| R) (|la| |List| (|Kernel| F)) (|lrhs| |List| F) ($ R))
        (SPADCALL (|PFO;evalup| (SPADCALL |f| (QREFELT $ 116)) |la| |lrhs| $)
                  (QREFELT $ 163))) 

(SDEFUN |PFO;simplifyCoeffs;FdLNni;32|
        ((|d| |FiniteDivisor| F UP UPUP R) (|la| |List| (|Kernel| F))
         ($ |NonNegativeInteger|))
        (SPROG
         ((|ndiv| (|nFD|)) (|va| (|Vector| |nR|)) (#1=#:G990 NIL)
          (#2=#:G992 NIL) (|i| NIL) (#3=#:G991 NIL) (|v| (|Vector| R))
          (|nd| (|nR|)) (|id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
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
            (IF (|has| R0 (|CharacteristicZero|))
                (IF (|has| F (|AlgebraicallyClosedField|))
                    (SIGNATURE |simplifyCoeffs|
                     ((|NonNegativeInteger|) (|FiniteDivisor| F UP UPUP |nR|)
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
          (|nf| (UPUP)) (|lrhs| (|List| F)) (#4=#:G989 NIL) (|pol| NIL)
          (#5=#:G988 NIL) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |poly| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (#6=#:G987 NIL) (|k| NIL) (#7=#:G986 NIL))
         (SEQ
          (LETT |rec|
                (SPADCALL
                 (PROGN
                  (LETT #7# NIL . #8=(|PFO;simplifyCoeffs;FdLNni;32|))
                  (SEQ (LETT |k| NIL . #8#) (LETT #6# |la| . #8#) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #7# (CONS (SPADCALL |k| (QREFELT $ 78)) #7#)
                               . #8#)))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #7#))))
                 (QREFELT $ 166))
                . #8#)
          (LETT |y| (SPADCALL (QVELT |rec| 2) (QREFELT $ 168)) . #8#)
          (LETT |lrhs|
                (PROGN
                 (LETT #5# NIL . #8#)
                 (SEQ (LETT |pol| NIL . #8#) (LETT #4# (QVELT |rec| 1) . #8#)
                      G190
                      (COND
                       ((OR (ATOM #4#)
                            (PROGN (LETT |pol| (CAR #4#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS (SPADCALL |pol| |y| (QREFELT $ 136)) #5#)
                              . #8#)))
                      (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #8#)
          (LETT |nf| (|PFO;evalup| (SPADCALL (QREFELT $ 169)) |la| |lrhs| $)
                . #8#)
          (LETT |nR|
                (|AlgebraicFunctionField| (QREFELT $ 7) (QREFELT $ 8)
                                          (QREFELT $ 9) |nf|)
                . #8#)
          (LETT |nFD|
                (|FiniteDivisor| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 9)
                                 |nR|)
                . #8#)
          (LETT |nFR|
                (|FractionalIdeal| (QREFELT $ 8) (|Fraction| (QREFELT $ 8))
                                   (QREFELT $ 9) |nR|)
                . #8#)
          (LETT |nPFO|
                (|PointsOfFiniteOrder| (QREFELT $ 6) (QREFELT $ 7)
                                       (QREFELT $ 8) (QREFELT $ 9) |nR|)
                . #8#)
          (LETT |id| (SPADCALL |d| (QREFELT $ 118)) . #8#)
          (LETT |nd|
                (SPADCALL
                 (|PFO;evalup|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |id| (QREFELT $ 125)) (QREFELT $ 84))
                    (QREFELT $ 170))
                   (QREFELT $ 116))
                  |la| |lrhs| $)
                 (|compiledLookupCheck| '|reduce|
                                        (LIST '$ (|devaluate| (ELT $ 9)))
                                        |nR|))
                . #8#)
          (LETT |v| (SPADCALL |id| (QREFELT $ 120)) . #8#)
          (LETT |va|
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI|
                         (- #9=(QVSIZE |v|)
                            #10=(SPADCALL |v| (QREFELT $ 126)))))
                       . #8#)
                 (SEQ (LETT |i| #10# . #8#) (LETT #2# #9# . #8#)
                      (LETT #1# 0 . #8#) G190 (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL
                                 (SPADCALL
                                  (|PFO;evalup|
                                   (SPADCALL (SPADCALL |v| |i| (QREFELT $ 139))
                                             (QREFELT $ 116))
                                   |la| |lrhs| $)
                                  (|compiledLookupCheck| '|reduce|
                                                         (LIST '$
                                                               (|devaluate|
                                                                (ELT $ 9)))
                                                         |nR|))
                                 |nd|
                                 (|compiledLookupCheck| '/ (LIST '$ '$ '$)
                                                        |nR|)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #8#))
                            . #8#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                . #8#)
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
                . #8#)
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

(SDEFUN |PFO;possibleOrder;FdNni;33|
        ((|d| |FiniteDivisor| F UP UPUP R) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G1002 NIL) (|la| (|List| (|Kernel| F))))
               (SEQ
                (EXIT
                 (COND
                  ((OR (ZEROP (SPADCALL (QREFELT $ 172)))
                       (EQL
                        (QVSIZE
                         (SPADCALL (SPADCALL |d| (QREFELT $ 118))
                                   (QREFELT $ 120)))
                        1))
                   1)
                  (#2='T
                   (COND
                    ((NULL
                      (LETT |la| (|PFO;alglist| |d| $)
                            . #3=(|PFO;possibleOrder;FdNni;33|)))
                     (|PFO;ratcurve| |d| (|PFO;selIntegers| $) $))
                    ((NULL (NULL (CDR |la|)))
                     (SEQ
                      (COND
                       ((|HasCategory| (QREFELT $ 6) '(|CharacteristicZero|))
                        (COND
                         ((|HasCategory| (QREFELT $ 7)
                                         '(|AlgebraicallyClosedField|))
                          (PROGN
                           (LETT #1# (SPADCALL |d| |la| (QREFELT $ 171)) . #3#)
                           (GO #4=#:G1001))))))
                      (EXIT
                       (|error|
                        "PFO::possibleOrder: more than 1 algebraic constant"))))
                    (#2#
                     (|PFO;algcurve| |d|
                      (|PFO;selectIntegers| (|SPADfirst| |la|) $)
                      (|SPADfirst| |la|) $))))))
                #4# (EXIT #1#)))) 

(SDEFUN |PFO;selIntegers|
        (($ |Record|
          (|:| |ncurve|
               (|SparseUnivariatePolynomial|
                (|Fraction|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|:| |disc| (|Integer|))))
        (SPROG
         ((|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|Fraction|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|f| (UPUP)))
         (SEQ (LETT |f| (SPADCALL (QREFELT $ 169)) . #1=(|PFO;selIntegers|))
              (LETT |n| (EXPT 10 6) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (ZEROP
                       (LETT |d|
                             (SPADCALL
                              (LETT |r|
                                    (SPADCALL (|PFO;pmod| |f| $)
                                              (QREFELT $ 173))
                                    . #1#)
                              (QREFELT $ 174))
                             . #1#)))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |n| (QREFELT $ 176)))) NIL (GO G190)
                   G191 (EXIT NIL))
              (EXIT (CONS |r| |d|))))) 

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
         ((|d| (|Integer|))
          (|r|
           (|SparseUnivariatePolynomial|
            (|SparseUnivariatePolynomial|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
          (|n| (|Integer|)) (|p| (|SparseUnivariatePolynomial| F)) (|g| (UPUP))
          (|f| (UPUP)))
         (SEQ
          (LETT |g|
                (|PFO;polyred|
                 (LETT |f| (SPADCALL (QREFELT $ 169))
                       . #1=(|PFO;selectIntegers|))
                 $)
                . #1#)
          (LETT |p| (SPADCALL |k| (QREFELT $ 177)) . #1#)
          (LETT |n| (EXPT 10 6) . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((ZEROP
                     (LETT |d|
                           (|PFO;doubleDisc|
                            (LETT |r| (|PFO;kpmod| |g| |k| $) . #1#) $)
                           . #1#))
                    'T)
                   ('T (|PFO;notIrr?| (|PFO;fmod| |p| $) $))))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |n| (QREFELT $ 176)))) NIL (GO G190) G191
               (EXIT NIL))
          (EXIT
           (VECTOR |r| |d|
                   (QCAR (SPADCALL (|PFO;fmod| |p| $) (QREFELT $ 180)))))))) 

(SDEFUN |PFO;toQ1|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|))) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;toQ1!0| (VECTOR $ |d|)) |p|
                         (QREFELT $ 82)))) 

(SDEFUN |PFO;toQ1!0| ((|p1| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|PFO;toQ1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|PFO;Q2F|
             (SPADCALL (SPADCALL |p1| |d| (QREFELT $ 56)) (QREFELT $ 181))
             $))))) 

(SDEFUN |PFO;toQ2|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (|d| |SparseUnivariatePolynomial| (|Fraction| (|Integer|))) ($ R))
        (SPROG NIL
               (SPADCALL
                (SPADCALL (CONS #'|PFO;toQ2!0| (VECTOR $ |d|)) |p|
                          (QREFELT $ 87))
                (QREFELT $ 163)))) 

(SDEFUN |PFO;toQ2!0| ((|p1| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|PFO;toQ2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|PFO;toQ1| |p1| |d| $) (QREFELT $ 84)))))) 

(SDEFUN |PFO;kpmod|
        ((|p| UPUP) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
        (SPROG NIL
               (SPADCALL (CONS #'|PFO;kpmod!0| (VECTOR |k| $)) |p|
                         (QREFELT $ 184)))) 

(SDEFUN |PFO;kpmod!0| ((|p1| NIL) ($$ NIL))
        (PROG ($ |k|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;kpmod|))
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PFO;krmod| (SPADCALL |p1| (QREFELT $ 110)) |k| $))))) 

(SDEFUN |PFO;order;FdU;39|
        ((|d| |FiniteDivisor| F UP UPUP R)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (COND
                ((OR
                  (ZEROP
                   (LETT |n|
                         (SPADCALL
                          (LETT |d| (SPADCALL |d| (QREFELT $ 67))
                                . #1=(|PFO;order;FdU;39|))
                          (QREFELT $ 68))
                         . #1#))
                  (NULL
                   (SPADCALL
                    (SPADCALL (SPADCALL |n| |d| (QREFELT $ 69)) (QREFELT $ 67))
                    (QREFELT $ 185))))
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
         ((#1=#:G1028 NIL) (|p| (|PositiveInteger|)) (#2=#:G1030 NIL)
          (|u|
           (|Union| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                    #3="failed"))
          (#4=#:G1026 NIL))
         (SEQ
          (LETT |p|
                (PROG1
                    (LETT #4#
                          (SPADCALL (SPADCALL (QREFELT $ 151)) (QREFELT $ 187))
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
                       (PROG1 (LETT #2# (SPADCALL |p| (QREFELT $ 187)) . #5#)
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
          (|mdg| (|SparseUnivariatePolynomial| |gf|)) (#1=#:G1050 NIL)
          (|ff| NIL) (|l| (|List| (|SparseUnivariatePolynomial| |gf|)))
          (#2=#:G1049 NIL) (|f| NIL) (#3=#:G1048 NIL)
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
             (QREFELT $ 188)))))) 

(SDEFUN |PFO;goodRed!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |gf|)
          (LETT $ (QREFELT $$ 1) . #1=(|PFO;goodRed|))
          (LETT |gf| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT $ 104))
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
                (SPADCALL (SPADCALL |res| |m| (QREFELT $ 56)) (QREFELT $ 59))
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

(DEFUN |PointsOfFiniteOrder| (&REST #1=#:G1058)
  (SPROG NIL
         (PROG (#2=#:G1059)
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
    (LETT $ (GETREFV 189) . #1#)
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
      (QSETREFV $ 91 (CONS (|dispatchFunction| |PFO;cmult;LSmp;16|) $)))
     ('T (QSETREFV $ 91 (CONS (|dispatchFunction| |PFO;cmult;LSmp;17|) $))))
    (COND
     ((|HasCategory| |#1| '(|CharacteristicZero|))
      (COND
       ((|HasCategory| |#2| '(|AlgebraicallyClosedField|))
        (QSETREFV $ 171
                  (CONS (|dispatchFunction| |PFO;simplifyCoeffs;FdLNni;32|)
                        $))))))
    $))) 

(MAKEPROP '|PointsOfFiniteOrder| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) 'ALGOP '|q|
              (|Union| 51 '"failed") (|FiniteDivisor| 7 8 9 10)
              |PFO;order;FdU;39| (|Boolean|) |PFO;torsion?;FdB;1| (|Integer|)
              (|Fraction| 18) (0 . |numer|) (5 . |coerce|) (10 . |denom|)
              (15 . /) (21 . |bringDown|) (|SparseUnivariatePolynomial| 19)
              (|Kernel| 7) (26 . |bringDown|) (|Mapping| 19 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 19) (32 . |map|)
              (|SparseUnivariatePolynomial| (|Fraction| 25))
              (|MultipleMap| 7 8 9 19 25 32) (38 . |map|) (|Mapping| 7 19)
              (|MultipleMap| 19 25 32 7 8 9) (44 . |map|) (|List| 7)
              (50 . |coefficients|) (|List| 77) (55 . |kernels|) (|List| 26)
              (60 . |setUnion|) (|Factored| 25) (|RationalFactorize| 25)
              (66 . |factor|) (|Record| (|:| |factor| 25) (|:| |exponent| 18))
              (|List| 47) (71 . |factors|) (76 . |One|) (|NonNegativeInteger|)
              (80 . >) (|List| 25) (|SparseUnivariatePolynomial| 25)
              (86 . |coefficients|) (91 . |rem|)
              (|Record| (|:| |den| 18) (|:| |gcdnum| 18))
              (|PointsOfFiniteOrderTools| 25 32) (97 . |badNum|) (|List| 57)
              (102 . |mix|) (|List| 54) (|SparseUnivariatePolynomial| 54)
              (107 . |coefficients|) (|List| $) (112 . |lcm|) (117 . |reduce|)
              |PFO;possibleOrder;FdNni;33| (122 . *) (|Union| 10 '"failed")
              (128 . |generator|)
              (|Record| (|:| |order| 51) (|:| |function| 10))
              (|Union| 72 '"failed") |PFO;torsionIfCan;FdU;12|
              (|UnivariatePolynomialCategoryFunctions2| 19 25 7 8)
              (133 . |map|) (|Kernel| $) (139 . |coerce|) (144 . |elt|)
              (|Mapping| 7 25)
              (|UnivariatePolynomialCategoryFunctions2| 25 54 7 8)
              (150 . |map|) (|Fraction| 8) (156 . |coerce|) (|Mapping| 83 54)
              (|UnivariatePolynomialCategoryFunctions2| 54 63 83 9)
              (161 . |map|) (|SparseMultivariatePolynomial| 6 26) (167 . |lcm|)
              (|List| 88) (172 . |cmult|) (177 . *) (183 . |One|)
              (187 . |discriminant|) (192 . |differentiate|) (197 . |gcd|)
              (|Union| $ '"failed") (203 . |exquo|) (209 . |discriminant|)
              (213 . |discriminant|) (218 . |zero?|) (|List| 19)
              (223 . |coefficients|) (228 . |retract|) (233 . |gcd|)
              (|SparseMultivariatePolynomial| 6 77) (238 . |denom|) (|List| 83)
              (243 . |coefficients|) (248 . |retract|) (253 . |coerce|)
              (258 . |coerce|) (263 . *) (|Union| 83 '"failed")
              (269 . |retractIfCan|) (274 . |lift|)
              (|FractionalIdeal| 8 83 9 10) (279 . |ideal|) (|Vector| 10)
              (284 . |numer|) (|BasicOperator|) (289 . |operator|) (|Symbol|)
              (294 . |has?|) (300 . |denom|) (305 . |minIndex|)
              (|Mapping| 16 26) (310 . |select!|) (|Mapping| 25 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 25 54)
              (316 . |map|)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 19 25)
              (322 . |map|) (|SparseUnivariatePolynomialFunctions2| 19 7)
              (328 . |map|) (334 . |elt|) (340 . |minimize|) (345 . |One|)
              (349 . |elt|) (355 . |retract|) (360 . |primitivePart|)
              (365 . |norm|)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (370 . |separate|) (376 . |resultant|) (382 . |Zero|)
              (386 . |Zero|) (390 . |separate|) (396 . |resultant|)
              (|PositiveInteger|) (402 . |rank|) (406 . |factorial|)
              (411 . |badNum|) (416 . |getGoodPrime|) (421 . *) (427 . |eval|)
              (|Mapping| 7 7) (434 . |map|) (|Mapping| 8 8) (440 . |map|)
              (|Mapping| 83 83) (446 . |map|) (452 . |reduce|)
              (|Record| (|:| |primelt| 7) (|:| |poly| (|List| 29))
                        (|:| |prim| 29))
              (|FunctionSpacePrimitiveElement| 6 7) (457 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (462 . |rootOf|)
              (467 . |definingPolynomial|) (471 . |coerce|)
              (476 . |simplifyCoeffs|) (482 . |genus|) (486 . |polyred|)
              (491 . |doubleDisc|) (|Void|) (496 . |newReduc|)
              (501 . |minPoly|) (|Record| (|:| |num| 25) (|:| |den| 18))
              (|UnivariatePolynomialCommonDenominator| 18 19 25)
              (506 . |splitDenominator|) (511 . |retract|) (|Mapping| 54 83)
              (|UnivariatePolynomialCategoryFunctions2| 83 9 54 63)
              (516 . |map|) (522 . |principal?|) (|IntegerPrimesPackage| 18)
              (527 . |nextPrime|) (532 . |coerce|))
           '#(|torsionIfCan| 537 |torsion?| 542 |simplifyCoeffs| 547
              |possibleOrder| 553 |order| 558 |cmult| 563)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 188
                                                 '(1 19 18 0 20 1 7 0 18 21 1
                                                   19 18 0 22 2 7 0 0 0 23 1 12
                                                   19 7 24 2 12 25 7 26 27 2 30
                                                   25 28 29 31 2 33 32 28 9 34
                                                   2 36 9 35 32 37 1 8 38 0 39
                                                   1 7 40 0 41 2 42 0 0 0 43 1
                                                   45 44 25 46 1 44 48 0 49 0 6
                                                   0 50 2 51 16 0 0 52 1 54 53
                                                   0 55 2 25 0 0 0 56 1 58 57
                                                   25 59 1 58 18 60 61 1 63 62
                                                   0 64 1 18 0 65 66 1 14 0 0
                                                   67 2 14 0 18 0 69 1 14 70 0
                                                   71 2 75 8 35 25 76 1 7 0 77
                                                   78 2 8 7 0 7 79 2 81 8 80 54
                                                   82 1 83 0 8 84 2 86 9 85 63
                                                   87 1 88 0 65 89 1 0 88 90 91
                                                   2 88 0 0 0 92 0 88 0 93 1 63
                                                   54 0 94 1 54 0 0 95 2 54 0 0
                                                   0 96 2 54 97 0 0 98 0 10 83
                                                   99 1 54 25 0 100 1 25 16 0
                                                   101 1 25 102 0 103 1 19 18 0
                                                   104 1 18 0 65 105 1 7 106 0
                                                   107 1 9 108 0 109 1 83 8 0
                                                   110 1 7 0 106 111 1 8 0 7
                                                   112 2 9 0 83 0 113 1 10 114
                                                   0 115 1 10 9 0 116 1 14 117
                                                   0 118 1 117 119 0 120 1 26
                                                   121 0 122 2 121 16 0 123 124
                                                   1 117 8 0 125 1 119 18 0 126
                                                   2 42 0 127 0 128 2 130 54
                                                   129 8 131 2 132 25 28 8 133
                                                   2 134 29 35 25 135 2 29 7 0
                                                   7 136 1 117 0 0 137 0 7 0
                                                   138 2 119 10 0 18 139 1 10
                                                   83 0 140 1 8 0 0 141 1 10 83
                                                   0 142 2 8 143 0 0 144 2 8 7
                                                   0 0 145 0 6 0 146 0 7 0 147
                                                   2 25 143 0 0 148 2 25 19 0 0
                                                   149 0 10 150 151 1 18 0 0
                                                   152 1 58 18 32 153 1 58 150
                                                   18 154 2 18 0 150 0 155 3 7
                                                   0 0 40 65 156 2 8 0 157 0
                                                   158 2 83 0 159 0 160 2 9 0
                                                   161 0 162 1 10 0 9 163 1 165
                                                   164 38 166 1 7 0 167 168 0
                                                   10 9 169 1 10 0 83 170 2 0
                                                   51 14 42 171 0 10 51 172 1
                                                   58 32 32 173 1 58 18 32 174
                                                   1 12 175 18 176 1 7 167 77
                                                   177 1 179 178 25 180 1 25 19
                                                   0 181 2 183 63 182 9 184 1
                                                   14 16 0 185 1 186 18 18 187
                                                   1 19 0 18 188 1 0 73 14 74 1
                                                   0 16 14 17 2 1 51 14 42 171
                                                   1 0 51 14 68 1 0 13 14 15 1
                                                   0 88 90 91)))))
           '|lookupComplete|)) 
