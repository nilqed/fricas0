
(SDEFUN |SMP;Zero;$;1| (($ $)) (CONS 0 (|spadConstant| $ 11))) 

(SDEFUN |SMP;One;$;2| (($ $)) (CONS 0 (|spadConstant| $ 13))) 

(SDEFUN |SMP;zero?;$B;3| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 17))) ('T NIL))) 

(SDEFUN |SMP;one?;$B;4| ((|p| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (QCDR |p|) (QCDR (|spadConstant| $ 14)) (QREFELT $ 20)))
         ('T NIL))) 

(SDEFUN |SMP;red| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
              ((SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                         (QREFELT $ 23))
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                         (QREFELT $ 24)))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))))))) 

(SDEFUN |SMP;numberOfMonomials;$Nni;6| ((|p| $) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G803 NIL) (#2=#:G802 #3=(|NonNegativeInteger|)) (#4=#:G804 #3#)
          (#5=#:G806 NIL) (|q| NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND ((SPADCALL (QCDR |p|) (QREFELT $ 17)) 0) (#6='T 1)))
           (#6#
            (PROGN
             (LETT #1# NIL . #7=(|SMP;numberOfMonomials;$Nni;6|))
             (SEQ (LETT |q| NIL . #7#)
                  (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 26)) . #7#)
                  G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL |q| (QREFELT $ 28)) . #7#)
                     (COND (#1# (LETT #2# (+ #2# #4#) . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# 0)))))))) 

(SDEFUN |SMP;coerce;VarSet$;7| ((|mvar| |VarSet|) ($ $))
        (CONS 1
              (CONS |mvar| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 29))))) 

(SDEFUN |SMP;monomial?;$B;8| ((|p| $) ($ |Boolean|))
        (SPROG ((|sup| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) 'T)
                      (#1='T
                       (SEQ (LETT |sup| (QCDR (QCDR |p|)) |SMP;monomial?;$B;8|)
                            (EXIT
                             (COND
                              ((SPADCALL 1 (SPADCALL |sup| (QREFELT $ 31))
                                         (QREFELT $ 32))
                               NIL)
                              (#1#
                               (SPADCALL (SPADCALL |sup| (QREFELT $ 24))
                                         (QREFELT $ 33))))))))))) 

(SDEFUN |SMP;moreThanOneVariable?| ((|p| $) ($ |Boolean|))
        (SPROG ((|q| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      (#1='T
                       (SEQ
                        (LETT |q| (QCDR (QCDR |p|)) |SMP;moreThanOneVariable?|)
                        (EXIT
                         (COND
                          ((SPADCALL (CONS #'|SMP;moreThanOneVariable?!0| $)
                                     (SPADCALL |q| (QREFELT $ 26))
                                     (QREFELT $ 36))
                           'T)
                          (#1# NIL))))))))) 

(SDEFUN |SMP;moreThanOneVariable?!0| ((|x1| NIL) ($ NIL))
        (NULL (SPADCALL |x1| (QREFELT $ 34)))) 

(SDEFUN |SMP;univariateKnown| ((|p| $) ($ |SparseUnivariatePolynomial| R))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT $ 37)) (QREFELT $ 39)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p| (QREFELT $ 37))
                     (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40))
                     (QREFELT $ 41))
           (|SMP;univariateKnown| (|SMP;red| |p| $) $) (QREFELT $ 42))))) 

(SDEFUN |SMP;univariate;$Sup;11| ((|p| $) ($ |SparseUnivariatePolynomial| R))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT $ 37)) (QREFELT $ 39)))
         ((|SMP;moreThanOneVariable?| |p| $) (|error| "not univariate"))
         ('T (SPADCALL (ELT $ 37) (QCDR (QCDR |p|)) (QREFELT $ 45))))) 

(SDEFUN |SMP;multivariate;SupVarSet$;12|
        ((|u| |SparseUnivariatePolynomial| R) (|var| |VarSet|) ($ $))
        (COND
         ((SPADCALL |u| (QREFELT $ 47)) (CONS 0 (SPADCALL |u| (QREFELT $ 48))))
         ('T
          (SPADCALL
           (CONS 1
                 (CONS |var|
                       (SPADCALL (CONS 0 (SPADCALL |u| (QREFELT $ 48)))
                                 (SPADCALL |u| (QREFELT $ 49))
                                 (QREFELT $ 29))))
           (SPADCALL (SPADCALL |u| (QREFELT $ 50)) |var| (QREFELT $ 51))
           (QREFELT $ 52))))) 

(SDEFUN |SMP;mon_mul|
        ((|p| $) (|var| |VarSet|) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|pt| (D)))
               (SEQ (LETT |pt| (SPADCALL |p| |n| (QREFELT $ 29)) |SMP;mon_mul|)
                    (EXIT (CONS 1 (CONS |var| |pt|)))))) 

(SDEFUN |SMP;univariate;$VarSetSup;14|
        ((|p| $) (|mvar| |VarSet|) ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|ulc| (D)) (|ulc0| (|SparseUnivariatePolynomial| $)) (|pt| (D)))
         (SEQ
          (COND
           ((OR (QEQCAR |p| 0)
                (SPADCALL (QCAR (QCDR |p|)) |mvar| (QREFELT $ 53)))
            (SPADCALL |p| 0 (QREFELT $ 29)))
           ('T
            (SEQ
             (LETT |pt| (QCDR (QCDR |p|))
                   . #1=(|SMP;univariate;$VarSetSup;14|))
             (EXIT
              (COND ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54)) |pt|)
                    ('T
                     (SEQ
                      (LETT |ulc0|
                            (SPADCALL (SPADCALL |pt| (QREFELT $ 24)) |mvar|
                                      (QREFELT $ 56))
                            . #1#)
                      (LETT |ulc|
                            (SPADCALL
                             (CONS #'|SMP;univariate;$VarSetSup;14!0|
                                   (VECTOR $ |pt| |p|))
                             |ulc0| (QREFELT $ 58))
                            . #1#)
                      (EXIT
                       (SPADCALL |ulc|
                                 (SPADCALL (|SMP;red| |p| $) |mvar|
                                           (QREFELT $ 56))
                                 (QREFELT $ 59))))))))))))) 

(SDEFUN |SMP;univariate;$VarSetSup;14!0| ((|c| NIL) ($$ NIL))
        (PROG (|p| |pt| $)
          (LETT |p| (QREFELT $$ 2) . #1=(|SMP;univariate;$VarSetSup;14|))
          (LETT |pt| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|SMP;mon_mul| |c| (QCAR (QCDR |p|)) (SPADCALL |pt| (QREFELT $ 40))
             $))))) 

(SDEFUN |SMP;unlikeUnivReconstruct|
        ((|u| |SparseUnivariatePolynomial| $) (|mvar| |VarSet|) ($ $))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND
                ((ZEROP
                  (LETT |d| (SPADCALL |u| (QREFELT $ 61))
                        |SMP;unlikeUnivReconstruct|))
                 (SPADCALL |u| 0 (QREFELT $ 62)))
                ('T
                 (SPADCALL
                  (SPADCALL (SPADCALL |u| (QREFELT $ 63)) |mvar| |d|
                            (QREFELT $ 64))
                  (|SMP;unlikeUnivReconstruct| (SPADCALL |u| (QREFELT $ 65))
                   |mvar| $)
                  (QREFELT $ 52)))))) 

(SDEFUN |SMP;multivariate;SupVarSet$;16|
        ((|u| |SparseUnivariatePolynomial| $) (|mvar| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G852 NIL) (|uu| (|SparseUnivariatePolynomial| $)) (|cc| ($)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (QREFELT $ 66)) (SPADCALL |u| 0 (QREFELT $ 62)))
            ('T
             (SEQ (LETT |uu| |u| . #2=(|SMP;multivariate;SupVarSet$;16|))
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |uu| (QREFELT $ 67))))
                         (GO G191)))
                       (SEQ (LETT |cc| (SPADCALL |uu| (QREFELT $ 63)) . #2#)
                            (COND
                             ((OR (QEQCAR |cc| 0)
                                  (SPADCALL |mvar| (QCAR (QCDR |cc|))
                                            (QREFELT $ 68)))
                              (EXIT
                               (LETT |uu| (SPADCALL |uu| (QREFELT $ 65))
                                     . #2#))))
                            (EXIT
                             (PROGN
                              (LETT #1#
                                    (|SMP;unlikeUnivReconstruct| |u| |mvar| $)
                                    . #2#)
                              (GO #3=#:G851))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 1 (CONS |mvar| |u|)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SMP;ground?;$B;17| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) 'T) ('T NIL))) 

(SDEFUN |SMP;monomial;$VarSetNni$;18|
        ((|p| $) (|mvar| |VarSet|) (|k1| |NonNegativeInteger|) ($ $))
        (SPROG ((|pt1| (D)) (|pt| (D)))
               (SEQ
                (COND ((OR (ZEROP |k1|) (SPADCALL |p| (QREFELT $ 18))) |p|)
                      ((OR (QEQCAR |p| 0)
                           (SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68)))
                       (CONS 1
                             (CONS |mvar| (SPADCALL |p| |k1| (QREFELT $ 29)))))
                      ('T
                       (SEQ
                        (LETT |pt| (QCDR (QCDR |p|))
                              . #1=(|SMP;monomial;$VarSetNni$;18|))
                        (LETT |pt1|
                              (COND
                               ((SPADCALL |mvar| (QCAR (QCDR |p|))
                                          (QREFELT $ 53))
                                (SPADCALL
                                 (CONS #'|SMP;monomial;$VarSetNni$;18!0|
                                       (VECTOR $ |k1| |mvar|))
                                 |pt| (QREFELT $ 58)))
                               ('T (SPADCALL |pt| |k1| (QREFELT $ 70))))
                              . #1#)
                        (EXIT (CONS 1 (CONS (QCAR (QCDR |p|)) |pt1|))))))))) 

(SDEFUN |SMP;monomial;$VarSetNni$;18!0| ((|c| NIL) ($$ NIL))
        (PROG (|mvar| |k1| $)
          (LETT |mvar| (QREFELT $$ 2) . #1=(|SMP;monomial;$VarSetNni$;18|))
          (LETT |k1| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |mvar| |k1| (QREFELT $ 64)))))) 

(SDEFUN |SMP;monomial;RIe$;19|
        ((|c| R) (|e| |IndexedExponents| |VarSet|) ($ $))
        (SPROG ((|m1| (D)) (|p1| ($)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT $ 72)) (CONS 0 |c|))
                      ('T
                       (SEQ
                        (LETT |p1|
                              (SPADCALL |c| (SPADCALL |e| (QREFELT $ 73))
                                        (QREFELT $ 74))
                              . #1=(|SMP;monomial;RIe$;19|))
                        (LETT |m1|
                              (SPADCALL |p1| (SPADCALL |e| (QREFELT $ 75))
                                        (QREFELT $ 29))
                              . #1#)
                        (EXIT
                         (CONS 1
                               (CONS (SPADCALL |e| (QREFELT $ 76)) |m1|))))))))) 

(SDEFUN |SMP;coefficient;$IeR;20|
        ((|p| $) (|e| |IndexedExponents| |VarSet|) ($ R))
        (SPROG ((|vp| (|VarSet|)) (|ve| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |e| (QREFELT $ 72))
                  (COND ((QEQCAR |p| 0) (QCDR |p|))
                        (#1='T
                         (SPADCALL
                          (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 77)) |e|
                          (QREFELT $ 78)))))
                 ((QEQCAR |p| 0) (QCDR (|spadConstant| $ 12)))
                 (#1#
                  (SEQ
                   (LETT |ve| (SPADCALL |e| (QREFELT $ 76))
                         . #2=(|SMP;coefficient;$IeR;20|))
                   (LETT |vp| (QCAR (QCDR |p|)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |ve| |vp| (QREFELT $ 53))
                      (SPADCALL (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 77))
                                |e| (QREFELT $ 78)))
                     ((SPADCALL |ve| |vp| (QREFELT $ 68))
                      (QCDR (|spadConstant| $ 12)))
                     (#1#
                      (SPADCALL
                       (SPADCALL (QCDR (QCDR |p|))
                                 (SPADCALL |e| (QREFELT $ 75)) (QREFELT $ 77))
                       (SPADCALL |e| (QREFELT $ 73)) (QREFELT $ 78))))))))))) 

(SDEFUN |SMP;coerce;I$;21| ((|n| |Integer|) ($ $))
        (CONS 0 (SPADCALL |n| (QREFELT $ 80)))) 

(SDEFUN |SMP;characteristic;Nni;22| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 82))) 

(PUT '|SMP;coerce;R$;23| '|SPADreplace| '(XLAM (|c|) (CONS 0 |c|))) 

(SDEFUN |SMP;coerce;R$;23| ((|c| R) ($ $)) (CONS 0 |c|)) 

(SDEFUN |SMP;recip;$U;24| ((|p| $) ($ |Union| $ #1="failed"))
        (SPROG ((|uu| (|Union| R #1#)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (SEQ
                   (LETT |uu| (SPADCALL (QCDR |p|) (QREFELT $ 86))
                         |SMP;recip;$U;24|)
                   (EXIT
                    (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                          (#2='T (CONS 0 (CONS 0 (QCDR |uu|))))))))
                 (#2# (CONS 1 "failed")))))) 

(SDEFUN |SMP;-;2$;25| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 88))))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 89))))))) 

(SDEFUN |SMP;*;I2$;26| ((|n| |Integer|) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT $ 91))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;*;I2$;26|))
                       (LETT |up|
                             (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT $ 92))
                             . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;*;R2$;27| ((|c| R) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |c| (QCDR (|spadConstant| $ 12)) (QREFELT $ 20))
                  (|spadConstant| $ 12))
                 ((SPADCALL |c| (QREFELT $ 15) (QREFELT $ 20)) |p|)
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |c| (QCDR |p|) (QREFELT $ 94))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;*;R2$;27|))
                       (LETT |up|
                             (SPADCALL (CONS 0 |c|) (QCDR (QCDR |p|))
                                       (QREFELT $ 95))
                             . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;+;3$;28| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT $ 97))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT $ 98))
                                         (QCDR (QCDR |p2|)) (QREFELT $ 59)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT $ 98))
                                         (QREFELT $ 59)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 54))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;+;3$;28|))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT $ 59))
                                . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT $ 23))
                             (SPADCALL |up| (QREFELT $ 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 53))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT $ 98))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT $ 59)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT $ 98))
                                           (QREFELT $ 59)))))))))))) 

(SDEFUN |SMP;-;3$;29| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT $ 99))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT $ 98))
                                         (QCDR (QCDR |p2|)) (QREFELT $ 100)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT $ 98))
                                         (QREFELT $ 100)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 54))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;-;3$;29|))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT $ 100))
                                . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT $ 23))
                             (SPADCALL |up| (QREFELT $ 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 53))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT $ 98))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT $ 100)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT $ 98))
                                           (QREFELT $ 100)))))))))))) 

(SDEFUN |SMP;=;2$B;30| ((|p1| $) (|p2| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 20)))
           (#1='T NIL)))
         ((QEQCAR |p2| 0) NIL)
         (#1#
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 102)))
           (#1# NIL))))) 

(SDEFUN |SMP;*;3$;31| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 96)))
                 ((QEQCAR |p2| 0)
                  (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1=(|SMP;*;3$;31|))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p1|)) |p2| (QREFELT $ 104))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#2='T (CONS 1 (CONS |mvar| |up|)))))))
                 (#2#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 54))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT $ 105))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#2# (CONS 1 (CONS |mvar| |up|)))))))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                         (QREFELT $ 104))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#2# (CONS 1 (CONS |mvar| |up|)))))))
                   (#2#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p2|)) . #1#)
                         (LETT |up|
                               (SPADCALL |p1| (QCDR (QCDR |p2|))
                                         (QREFELT $ 95))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#2# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;^;$Nni$;32| ((|p| $) (|k| |NonNegativeInteger|) ($ $))
        (COND ((EQL |k| 0) (CONS 0 (QREFELT $ 15)))
              ('T (SPADCALL |p| |k| (QREFELT $ 108))))) 

(SDEFUN |SMP;^;$Pi$;33| ((|p| $) (|kp| |PositiveInteger|) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL (QCDR |p|) |kp| (QREFELT $ 110))))
                 ((NULL (|SMP;moreThanOneVariable?| |p| $))
                  (SPADCALL
                   (SPADCALL (|SMP;univariateKnown| |p| $) |kp|
                             (QREFELT $ 111))
                   (QCAR (QCDR |p|)) (QREFELT $ 51)))
                 ('T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #1=(|SMP;^;$Pi$;33|))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p|)) |kp| (QREFELT $ 112))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         ('T (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;hashUpdate!;Hs$Hs;34| ((|s| |HashState|) (|p| $) ($ |HashState|))
        (SEQ
         (COND ((QEQCAR |p| 0) (SPADCALL |s| (QCDR |p|) (QREFELT $ 114)))
               ('T
                (SEQ
                 (LETT |s| (SPADCALL |s| (QCAR (QCDR |p|)) (QREFELT $ 115))
                       |SMP;hashUpdate!;Hs$Hs;34|)
                 (EXIT (SPADCALL |s| (QCDR (QCDR |p|)) (QREFELT $ 116)))))))) 

(SDEFUN |SMP;unitNormal;$R;35|
        ((|p| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G64|
           #1=(|Record| (|:| |unit| R) (|:| |canonical| R)
                        (|:| |associate| R)))
          (|#G63| #1#))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (SEQ
             (PROGN
              (LETT |#G63| (SPADCALL (QCDR |p|) (QREFELT $ 119))
                    . #2=(|SMP;unitNormal;$R;35|))
              (LETT |u| (QVELT |#G63| 0) . #2#)
              (LETT |c| (QVELT |#G63| 1) . #2#)
              (LETT |a| (QVELT |#G63| 2) . #2#)
              |#G63|)
             (EXIT (VECTOR (CONS 0 |u|) (CONS 0 |c|) (CONS 0 |a|)))))
           ('T
            (SEQ
             (PROGN
              (LETT |#G64|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 37)) (QREFELT $ 119))
                    . #2#)
              (LETT |u| (QVELT |#G64| 0) . #2#)
              (LETT |c| (QVELT |#G64| 1) . #2#)
              (LETT |a| (QVELT |#G64| 2) . #2#)
              |#G64|)
             (EXIT
              (VECTOR (CONS 0 |u|) (SPADCALL |a| |p| (QREFELT $ 96))
                      (CONS 0 |a|))))))))) 

(SDEFUN |SMP;unitCanonical;2$;36| ((|p| $) ($ $))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G69|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R))))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 121))))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G69|
                         (SPADCALL (SPADCALL |p| (QREFELT $ 37))
                                   (QREFELT $ 119))
                         . #1=(|SMP;unitCanonical;2$;36|))
                   (LETT |u| (QVELT |#G69| 0) . #1#)
                   (LETT |c| (QVELT |#G69| 1) . #1#)
                   (LETT |a| (QVELT |#G69| 2) . #1#)
                   |#G69|)
                  (EXIT (SPADCALL |a| |p| (QREFELT $ 96))))))))) 

(SDEFUN |SMP;unit?;$B;37| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 123))) ('T NIL))) 

(SDEFUN |SMP;associates?;2$B;38| ((|p1| $) (|p2| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 125)))
           (#1='T NIL)))
         ((QEQCAR |p2| 1)
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 126)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |SMP;exquo;2$U;39| ((|p1| $) (|p2| $) ($ |Union| $ "failed"))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| $)) (|mvar| (|VarSet|))
          (|a| (|Union| D "failed")))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 128))
                      . #1=(|SMP;exquo;2$U;39|))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#2='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT $ 18))
                 (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 103)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #3="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT $ 53))
                       (EXIT (CONS 1 #3#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT $ 98))
                                  (QREFELT $ 129))
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#2#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (EXIT
               (COND
                ((SPADCALL |p1| |p2| (QREFELT $ 103))
                 (CONS 0 (|spadConstant| $ 14)))
                (#2#
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                  (QREFELT $ 129))
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#2#
                          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                               (LETT |up| (QCDR |a|) . #1#)
                               (EXIT
                                (COND
                                 ((SPADCALL |up| (QREFELT $ 66))
                                  (CONS 0 (SPADCALL |up| (QREFELT $ 63))))
                                 (#2#
                                  (CONS 0
                                        (CONS 1
                                              (CONS |mvar|
                                                    |up|))))))))))))))))))))) 

(SDEFUN |SMP;exquo;2$U;40| ((|p1| $) (|p2| $) ($ |Union| $ "failed"))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| $)) (|mvar| (|VarSet|))
          (|a| (|Union| D "failed")))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 128))
                      . #1=(|SMP;exquo;2$U;40|))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#2='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT $ 18))
                 (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 103)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #3="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT $ 53))
                       (EXIT (CONS 1 #3#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT $ 98))
                                  (QREFELT $ 129))
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#2#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                              (QREFELT $ 129))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                           (LETT |up| (QCDR |a|) . #1#)
                           (EXIT
                            (COND
                             ((SPADCALL |up| (QREFELT $ 66))
                              (CONS 0 (SPADCALL |up| (QREFELT $ 63))))
                             (#2#
                              (CONS 0 (CONS 1 (CONS |mvar| |up|))))))))))))))))) 

(SDEFUN |SMP;map;M2$;41| ((|fn| |Mapping| R R) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
                      (#1='T
                       (SEQ
                        (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;map;M2$;41|))
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;map;M2$;41!0| (VECTOR $ |fn|))
                               (QCDR (QCDR |p|)) (QREFELT $ 58))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 23))
                           (SPADCALL |up| (QREFELT $ 24)))
                          (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;map;M2$;41!0| ((|x1| NIL) ($$ NIL))
        (PROG (|fn| $)
          (LETT |fn| (QREFELT $$ 1) . #1=(|SMP;map;M2$;41|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |fn| |x1| (QREFELT $ 132)))))) 

(SDEFUN |SMP;/;$R$;42| ((|p| $) (|r| R) ($ $))
        (SPADCALL (CONS 0 (SPADCALL |r| (QREFELT $ 133))) |p| (QREFELT $ 106))) 

(SDEFUN |SMP;content;$R;43| ((|p| $) ($ R))
        (SPROG ((|up| (D)) (|c| (R)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ
                        (LETT |c| (QCDR (|spadConstant| $ 12))
                              . #1=(|SMP;content;$R;43|))
                        (LETT |up| (QCDR (QCDR |p|)) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (NULL
                                 (OR (SPADCALL |up| (QREFELT $ 135))
                                     (SPADCALL |c| (QCDR (|spadConstant| $ 14))
                                               (QREFELT $ 20)))))
                               (GO G191)))
                             (SEQ
                              (LETT |c|
                                    (SPADCALL |c|
                                              (SPADCALL
                                               (SPADCALL |up| (QREFELT $ 24))
                                               (QREFELT $ 136))
                                              (QREFELT $ 137))
                                    . #1#)
                              (EXIT
                               (LETT |up| (SPADCALL |up| (QREFELT $ 22))
                                     . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |c|))))))) 

(SDEFUN |SMP;content;$VarSet$;44| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56))
                         (QREFELT $ 138))))) 

(SDEFUN |SMP;gcd;3$;45| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 137))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 138))
                                   (QREFELT $ 140)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 138))
                              |p2| (QREFELT $ 140)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;45|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 141))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 23))
                        (SPADCALL |up| (QREFELT $ 24)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;46|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G1013 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 63))
                              (SPADCALL |b| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 63))
                              (SPADCALL |a| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 142))
                   . #4=(|SMP;gcdPolynomial;3Sup;46|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 144))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 145))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $)
                                        #5="failed")
                                       #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 142)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 144))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 145))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $) #5#)
                                       #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 140))
                             (MIN (SPADCALL |mona| (QREFELT $ 61))
                                  (SPADCALL |monb| (QREFELT $ 61)))
                             (QREFELT $ 29))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 61))
                    (SPADCALL |b| (QREFELT $ 61)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 146)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 147)))
                 (#6='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 146)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 147)))
               (#6# |mong|))))))))) 

(SDEFUN |SMP;content;$VarSet$;47| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56)) (QREFELT $ 26))
                (QREFELT $ 150))))) 

(SDEFUN |SMP;gcd;3$;48| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 151))) 

(SDEFUN |SMP;gcd;L$;49| ((|lp| |List| $) ($ $)) (SPADCALL |lp| (QREFELT $ 150))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;50|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPADCALL |a| |b| (QREFELT $ 154))) 

(SDEFUN |SMP;content;$VarSet$;51| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56))
                         (QREFELT $ 138))))) 

(SDEFUN |SMP;gcd;3$;52| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 137))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 138))
                                   (QREFELT $ 140)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 138))
                              |p2| (QREFELT $ 140)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;52|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 141))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 23))
                        (SPADCALL |up| (QREFELT $ 24)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;53|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G1045 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 63))
                              (SPADCALL |b| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 63))
                              (SPADCALL |a| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 142))
                   . #4=(|SMP;gcdPolynomial;3Sup;53|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 144))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 145))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $)
                                        #5="failed")
                                       #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 142)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 144))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 145))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $) #5#)
                                       #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 140))
                             (MIN (SPADCALL |mona| (QREFELT $ 61))
                                  (SPADCALL |monb| (QREFELT $ 61)))
                             (QREFELT $ 29))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 61))
                    (SPADCALL |b| (QREFELT $ 61)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 146)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 147)))
                 (#6='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 146)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 147)))
               (#6# |mong|))))))))) 

(SDEFUN |SMP;content;$VarSet$;54| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56))
                         (QREFELT $ 138))))) 

(SDEFUN |SMP;gcd;3$;55| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 137))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 138))
                                   (QREFELT $ 140)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 138))
                              |p2| (QREFELT $ 140)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;55|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 141))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 23))
                        (SPADCALL |up| (QREFELT $ 24)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;56|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G1073 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 63))
                              (SPADCALL |b| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 63))
                              (SPADCALL |a| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 142))
                   . #4=(|SMP;gcdPolynomial;3Sup;56|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 144))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 145))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $)
                                        #5="failed")
                                       #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 142)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 144))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 145))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $) #5#)
                                       #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 140))
                             (MIN (SPADCALL |mona| (QREFELT $ 61))
                                  (SPADCALL |monb| (QREFELT $ 61)))
                             (QREFELT $ 29))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 61))
                    (SPADCALL |b| (QREFELT $ 61)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 146)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 147)))
                 (#6='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 146)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 147)))
               (#6# |mong|))))))))) 

(SDEFUN |SMP;coerce;$Of;57| ((|p| $) ($ |OutputForm|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 156)))
              ('T
               (SPADCALL (QCDR (QCDR |p|))
                         (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 157))
                         (QREFELT $ 158))))) 

(SDEFUN |SMP;coefficients;$L;58| ((|p| $) ($ |List| R))
        (SPROG
         ((#1=#:G1090 NIL) (#2=#:G1089 #3=(|List| R)) (#4=#:G1091 #3#)
          (#5=#:G1093 NIL) (|p1| NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 161)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|SMP;coefficients;$L;58|))
                  (SEQ (LETT |p1| NIL . #7#)
                       (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 26))
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |p1| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (SPADCALL |p1| (QREFELT $ 162)) . #7#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 163))
                                  . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |SMP;retract;$R;59| ((|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T (|error| "cannot retract nonconstant polynomial")))) 

(SDEFUN |SMP;retractIfCan;$U;60| ((|p| $) ($ |Union| R "failed"))
        (COND ((QEQCAR |p| 0) (CONS 0 (QCDR |p|))) ('T (CONS 1 "failed")))) 

(SDEFUN |SMP;mymerge|
        ((|l| |List| |VarSet|) (|m| |List| |VarSet|) ($ |List| |VarSet|))
        (SEQ
         (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 54))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| (CDR |m|) (QREFELT $ 168)) (EXIT |l|)))
                 ((NULL (CDR |m|)) |l|)
                 (#1='T
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) (CDR |m|) $)
                             (QREFELT $ 168))
                   (EXIT |l|)))))
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 68))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| |m| (QREFELT $ 168)) (EXIT |l|)))
                 (#1#
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) |m| $)
                             (QREFELT $ 168))
                   (EXIT |l|)))))
               ((NULL (CDR |m|))
                (SEQ (SPADCALL |m| |l| (QREFELT $ 168)) (EXIT |m|)))
               (#1#
                (SEQ
                 (SPADCALL |m| (|SMP;mymerge| |l| (CDR |m|) $) (QREFELT $ 168))
                 (EXIT |m|)))))) 

(SDEFUN |SMP;variables;$L;62| ((|p| $) ($ |List| |VarSet|))
        (SPROG ((|q| (D)) (|lv| (|List| |VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      ('T
                       (SEQ (LETT |lv| NIL . #1=(|SMP;variables;$L;62|))
                            (LETT |q| (QCDR (QCDR |p|)) . #1#)
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (SPADCALL |q| (QREFELT $ 135))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |lv|
                                        (|SMP;mymerge| |lv|
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT $ 24))
                                          (QREFELT $ 169))
                                         $)
                                        . #1#)
                                  (EXIT
                                   (LETT |q| (SPADCALL |q| (QREFELT $ 22))
                                         . #1#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (CONS (QCAR (QCDR |p|)) |lv|)))))))) 

(SDEFUN |SMP;mainVariable;$U;63| ((|p| $) ($ |Union| |VarSet| "failed"))
        (COND ((QEQCAR |p| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QCAR (QCDR |p|)))))) 

(SDEFUN |SMP;eval;$VarSet2$;64| ((|p| $) (|mvar| |VarSet|) (|pval| $) ($ $))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56)) |pval| (QREFELT $ 172))) 

(SDEFUN |SMP;eval;$VarSetR$;65| ((|p| $) (|mvar| |VarSet|) (|val| R) ($ $))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56)) (CONS 0 |val|)
                  (QREFELT $ 172))) 

(SDEFUN |SMP;evalSortedVarlist|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lpval| |List| $) ($ $))
        (SPROG ((|pts| (D)) (|pval| ($)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((OR (QEQCAR |p| 0)
                      (OR (NULL |Lvar|) (SPADCALL |Lpval| (QREFELT $ 175))))
                  |p|)
                 ('T
                  (SEQ
                   (LETT |mvar| (|SPADfirst| |Lvar|)
                         . #1=(|SMP;evalSortedVarlist|))
                   (EXIT
                    (COND
                     ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68))
                      (|SMP;evalSortedVarlist| |p| (CDR |Lvar|)
                       (SPADCALL |Lpval| '|rest| (QREFELT $ 177)) $))
                     (#2='T
                      (SEQ
                       (LETT |pval| (SPADCALL |Lpval| '|first| (QREFELT $ 179))
                             . #1#)
                       (LETT |pts|
                             (SPADCALL
                              (CONS #'|SMP;evalSortedVarlist!0|
                                    (VECTOR $ |Lpval| |Lvar|))
                              (QCDR (QCDR |p|)) (QREFELT $ 58))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54))
                          (COND
                           ((QEQCAR |pval| 0)
                            (SPADCALL |pts| (CONS 0 (QCDR |pval|))
                                      (QREFELT $ 172)))
                           (#2# (SPADCALL |pts| |pval| (QREFELT $ 172)))))
                         (#2#
                          (SPADCALL |pts| (QCAR (QCDR |p|))
                                    (QREFELT $ 69))))))))))))))) 

(SDEFUN |SMP;evalSortedVarlist!0| ((|x1| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| $)
          (LETT |Lvar| (QREFELT $$ 2) . #1=(|SMP;evalSortedVarlist|))
          (LETT |Lpval| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMP;evalSortedVarlist| |x1| |Lvar| |Lpval| $))))) 

(SDEFUN |SMP;eval;$LL$;67|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lpval| |List| $) ($ $))
        (SPROG
         ((|nlpval| (|List| $)) (#1=#:G1160 NIL) (|mvar| NIL) (#2=#:G1159 NIL)
          (|nlvar| (|List| |VarSet|)))
         (SEQ
          (COND
           ((OR (NULL (CDR |Lvar|))
                (SPADCALL (ELT $ 68) |Lvar| (QREFELT $ 181)))
            (|SMP;evalSortedVarlist| |p| |Lvar| |Lpval| $))
           ('T
            (SEQ
             (LETT |nlvar| (SPADCALL (ELT $ 68) |Lvar| (QREFELT $ 182))
                   . #3=(|SMP;eval;$LL$;67|))
             (LETT |nlpval|
                   (COND ((SPADCALL |Lvar| |nlvar| (QREFELT $ 183)) |Lpval|)
                         ('T
                          (LETT |nlpval|
                                (PROGN
                                 (LETT #2# NIL . #3#)
                                 (SEQ (LETT |mvar| NIL . #3#)
                                      (LETT #1# |nlvar| . #3#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |mvar| (CAR #1#) . #3#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |Lpval|
                                                         (SPADCALL |mvar|
                                                                   |Lvar|
                                                                   (QREFELT $
                                                                            184))
                                                         (QREFELT $ 185))
                                               #2#)
                                              . #3#)))
                                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                . #3#)))
                   . #3#)
             (EXIT (|SMP;evalSortedVarlist| |p| |nlvar| |nlpval| $)))))))) 

(SDEFUN |SMP;eval;$LL$;68|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lval| |List| R) ($ $))
        (SPROG ((#1=#:G1164 NIL) (|val| NIL) (#2=#:G1163 NIL))
               (SEQ
                (SPADCALL |p| |Lvar|
                          (PROGN
                           (LETT #2# NIL . #3=(|SMP;eval;$LL$;68|))
                           (SEQ (LETT |val| NIL . #3#) (LETT #1# |Lval| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |val| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (CONS 0 |val|) #2#) . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 186))))) 

(SDEFUN |SMP;degree;$VarSetNni;69|
        ((|p| $) (|mvar| |VarSet|) ($ |NonNegativeInteger|))
        (COND ((QEQCAR |p| 0) 0)
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54))
               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40)))
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68)) 0)
              ('T
               (MAX
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)) |mvar|
                          (QREFELT $ 188))
                (SPADCALL (|SMP;red| |p| $) |mvar| (QREFELT $ 188)))))) 

(SDEFUN |SMP;degree;$LL;70|
        ((|p| $) (|Lvar| |List| |VarSet|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G1174 NIL) (|mvar| NIL) (#2=#:G1173 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SMP;degree;$LL;70|))
                 (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |Lvar| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT $ 188)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;degree;$Ie;71| ((|p| $) ($ |IndexedExponents| |VarSet|))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 191))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                          (QREFELT $ 192))
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40))
                          (QCAR (QCDR |p|)) (QREFELT $ 193))
                (QREFELT $ 194))))) 

(SDEFUN |SMP;minimumDegree;$Ie;72| ((|p| $) ($ |IndexedExponents| |VarSet|))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 191))
                      ('T
                       (SEQ
                        (LETT |md| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 195))
                              |SMP;minimumDegree;$Ie;72|)
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) |md| (QREFELT $ 77))
                           (QREFELT $ 196))
                          (SPADCALL |md| (QCAR (QCDR |p|)) (QREFELT $ 193))
                          (QREFELT $ 194))))))))) 

(SDEFUN |SMP;minimumDegree;$VarSetNni;73|
        ((|p| $) (|mvar| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG ((|p1| ($)) (|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) 0)
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54))
                       (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 195)))
                      (#1='T
                       (SEQ
                        (LETT |md|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                               |mvar| (QREFELT $ 197))
                              . #2=(|SMP;minimumDegree;$VarSetNni;73|))
                        (LETT |p1| (|SMP;red| |p| $) . #2#)
                        (EXIT
                         (COND ((SPADCALL |p1| (QREFELT $ 18)) |md|)
                               (#1#
                                (MIN |md|
                                     (SPADCALL |p1| |mvar|
                                               (QREFELT $ 197)))))))))))) 

(SDEFUN |SMP;minimumDegree;$LL;74|
        ((|p| $) (|Lvar| |List| |VarSet|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G1193 NIL) (|mvar| NIL) (#2=#:G1192 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SMP;minimumDegree;$LL;74|))
                 (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |Lvar| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT $ 197)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;differentiate;$VarSet$;75| ((|p| $) (|mvar| |VarSet|) ($ $))
        (SPROG ((|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54))
                       (SEQ
                        (LETT |up| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 199))
                              . #1=(|SMP;differentiate;$VarSet$;75|))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 23))
                           (SPADCALL |up| (QREFELT $ 24)))
                          (#2='T (CONS 1 (CONS |mvar| |up|)))))))
                      (#2#
                       (SEQ
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;differentiate;$VarSet$;75!0|
                                     (VECTOR $ |mvar|))
                               (QCDR (QCDR |p|)) (QREFELT $ 58))
                              . #1#)
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 23))
                           (SPADCALL |up| (QREFELT $ 24)))
                          (#2# (CONS 1 (CONS (QCAR (QCDR |p|)) |up|))))))))))) 

(SDEFUN |SMP;differentiate;$VarSet$;75!0| ((|x1| NIL) ($$ NIL))
        (PROG (|mvar| $)
          (LETT |mvar| (QREFELT $$ 1) . #1=(|SMP;differentiate;$VarSet$;75|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |mvar| (QREFELT $ 200)))))) 

(SDEFUN |SMP;leadingCoefficient;$R;76| ((|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                         (QREFELT $ 37))))) 

(SDEFUN |SMP;leadingMonomial;2$;77| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                          (QREFELT $ 201))
                (QCAR (QCDR |p|)) (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40))
                (QREFELT $ 64))))) 

(SDEFUN |SMP;reductum;2$;78| ((|p| $) ($ $))
        (SPROG ((|ptr| (D)) (|rlc| ($)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
                      (#1='T
                       (SEQ
                        (LETT |rlc|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                               (QREFELT $ 202))
                              . #2=(|SMP;reductum;2$;78|))
                        (LETT |ptr|
                              (SPADCALL
                               (SPADCALL |rlc|
                                         (SPADCALL (QCDR (QCDR |p|))
                                                   (QREFELT $ 40))
                                         (QREFELT $ 29))
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                               (QREFELT $ 59))
                              . #2#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |ptr| (QREFELT $ 40)) 0)
                           (SPADCALL |ptr| (QREFELT $ 203)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |ptr|))))))))))) 

(SDEFUN |SMP;monomials1|
        ((|p| |VPoly|) (|vars| . #1=(|List| |VarSet|))
         (|degs| . #2=(|List| (|NonNegativeInteger|))) (|res| |List| $)
         ($ |List| $))
        (SPROG
         ((|degs1| #2#) (|vars1| #1#) (|mon| ($))
          (|mon1|
           #3=(|Record| (|:| |k| #4=(|NonNegativeInteger|)) (|:| |c| $)))
          (#5=#:G1226 NIL) (|var| NIL) (#6=#:G1227 NIL) (|deg| NIL) (|k1| #4#)
          (|p1| ($)) (#7=#:G1225 NIL) (|t| NIL) (|v1| (|VarSet|))
          (|tl| (|List| #3#)))
         (SEQ (LETT |tl| (QCDR |p|) . #8=(|SMP;monomials1|))
              (LETT |v1| (QCAR |p|) . #8#)
              (SEQ (LETT |t| NIL . #8#) (LETT #7# |tl| . #8#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |t| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ (LETT |p1| (QCDR |t|) . #8#)
                        (LETT |k1| (QCAR |t|) . #8#)
                        (EXIT
                         (COND
                          ((QEQCAR |p1| 0)
                           (SEQ
                            (LETT |mon|
                                  (COND
                                   ((SPADCALL |k1| 0 (QREFELT $ 204))
                                    (CONS 1 (CONS |v1| (LIST |t|))))
                                   ('T |p1|))
                                  . #8#)
                            (SEQ (LETT |deg| NIL . #8#) (LETT #6# |degs| . #8#)
                                 (LETT |var| NIL . #8#) (LETT #5# |vars| . #8#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |var| (CAR #5#) . #8#) NIL)
                                       (ATOM #6#)
                                       (PROGN
                                        (LETT |deg| (CAR #6#) . #8#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ (LETT |mon1| (CONS |deg| |mon|) . #8#)
                                      (EXIT
                                       (LETT |mon|
                                             (CONS 1
                                                   (CONS |var| (LIST |mon1|)))
                                             . #8#)))
                                 (LETT #5#
                                       (PROG1 (CDR #5#)
                                         (LETT #6# (CDR #6#) . #8#))
                                       . #8#)
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (LETT |res| (SPADCALL |mon| |res| (QREFELT $ 205))
                                   . #8#))))
                          ('T
                           (SEQ
                            (LETT |vars1|
                                  (COND
                                   ((SPADCALL |k1| 0 (QREFELT $ 204))
                                    (CONS |v1| |vars|))
                                   ('T |vars|))
                                  . #8#)
                            (LETT |degs1|
                                  (COND
                                   ((SPADCALL |k1| 0 (QREFELT $ 204))
                                    (CONS |k1| |degs|))
                                   ('T |degs|))
                                  . #8#)
                            (EXIT
                             (LETT |res|
                                   (|SMP;monomials1| (QCDR |p1|) |vars1|
                                    |degs1| |res| $)
                                   . #8#)))))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SMP;monomials;$L;80| ((|p| $) ($ |List| $))
        (COND ((SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 103)) NIL)
              ((QEQCAR |p| 0) (LIST |p|))
              ('T
               (SPADCALL (|SMP;monomials1| (QCDR |p|) NIL NIL NIL $)
                         (QREFELT $ 206))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomial;|)) 

(DEFUN |SparseMultivariatePolynomial| (&REST #1=#:G1277)
  (SPROG NIL
         (PROG (#2=#:G1278)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SparseMultivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariatePolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariatePolynomial|)))))))))) 

(DEFUN |SparseMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G1276 NIL) (|pv$| NIL) (#2=#:G1266 NIL) (#3=#:G1267 NIL)
    (#4=#:G1268 NIL) (#5=#:G1269 NIL) (#6=#:G1270 NIL) (#7=#:G1271 NIL)
    (#8=#:G1272 NIL) (#9=#:G1273 NIL) (#10=#:G1274 NIL) (#11=#:G1275 NIL)
    ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #12=(|SparseMultivariatePolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #12#)
    (LETT |dv$| (LIST '|SparseMultivariatePolynomial| DV$1 DV$2) . #12#)
    (LETT $ (GETREFV 237) . #12#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #11#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #12#)
                                        (OR #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #12#)
                                        (OR #10# #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #12#)
                                        (OR #10# #11# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #11# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #11# #9#) (OR #11# #9#)
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #9#
                                            (|HasCategory| |#1| '(|Ring|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #9#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #11#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #11#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|)))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #11#
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|)))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #11#
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         #5#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #4# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #4# #2# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))))
                    . #12#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 17592186044416))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #12#)
     (|augmentPredVector| $ 35184372088832))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR #11#
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR #4# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR #3# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR #2# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 18014398509481984))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|SparseUnivariatePolynomial| $))
    (QSETREFV $ 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT $ 8))))
    (QSETREFV $ 10 (|Union| |#1| (QREFELT $ 9)))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 14
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |SMP;One;$;2|) $ 14)))))
    (QSETREFV $ 15
              (COND
               ((|HasCategory| |#1| '(|SemiRing|))
                (QCDR (|spadConstant| $ 14)))
               ('T (QCDR (|spadConstant| $ 12)))))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 21 (CONS (|dispatchFunction| |SMP;one?;$B;4|) $))))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 30 (CONS (|dispatchFunction| |SMP;coerce;VarSet$;7|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 81 (CONS (|dispatchFunction| |SMP;coerce;I$;21|) $))
       (QSETREFV $ 83
                 (CONS (|dispatchFunction| |SMP;characteristic;Nni;22|) $)))))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 87 (CONS (|dispatchFunction| |SMP;recip;$U;24|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 90 (CONS (|dispatchFunction| |SMP;-;2$;25|) $))
       (QSETREFV $ 93 (CONS (|dispatchFunction| |SMP;*;I2$;26|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 101 (CONS (|dispatchFunction| |SMP;-;3$;29|) $))))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (QSETREFV $ 120 (CONS (|dispatchFunction| |SMP;unitNormal;$R;35|) $))
       (QSETREFV $ 122 (CONS (|dispatchFunction| |SMP;unitCanonical;2$;36|) $))
       (QSETREFV $ 124 (CONS (|dispatchFunction| |SMP;unit?;$B;37|) $))
       (QSETREFV $ 127 (CONS (|dispatchFunction| |SMP;associates?;2$B;38|) $))
       (COND
        ((|HasCategory| |#1| '(|Approximate|))
         (QSETREFV $ 130 (CONS (|dispatchFunction| |SMP;exquo;2$U;39|) $)))
        ('T
         (QSETREFV $ 130 (CONS (|dispatchFunction| |SMP;exquo;2$U;40|) $)))))))
    (COND
     ((|testBitVector| |pv$| 17)
      (QSETREFV $ 134 (CONS (|dispatchFunction| |SMP;/;$R$;42|) $))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV $ 136 (CONS (|dispatchFunction| |SMP;content;$R;43|) $))))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|testBitVector| |pv$| 3)
        (COND
         ((|HasCategory| |#1| '(|FloatingPointSystem|))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 139
                       (CONS (|dispatchFunction| |SMP;content;$VarSet$;44|) $))
             (QSETREFV $ 140 (CONS (|dispatchFunction| |SMP;gcd;3$;45|) $))
             (COND
              ((|HasCategory| |#1| '(|FloatingPointSystem|))
               (QSETREFV $ 148
                         (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;46|)
                               $))))))))
         ('T
          (PROGN
           (QSETREFV $ 139
                     (CONS (|dispatchFunction| |SMP;content;$VarSet$;47|) $))
           (QSETREFV $ 140 (CONS (|dispatchFunction| |SMP;gcd;3$;48|) $))
           (QSETREFV $ 153 (CONS (|dispatchFunction| |SMP;gcd;L$;49|) $))
           (QSETREFV $ 148
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;50|)
                           $))))))
       ((|testBitVector| |pv$| 13)
        (PROGN
         (QSETREFV $ 139
                   (CONS (|dispatchFunction| |SMP;content;$VarSet$;51|) $))
         (QSETREFV $ 140 (CONS (|dispatchFunction| |SMP;gcd;3$;52|) $))
         (COND
          ((|HasCategory| |#1| '(|FloatingPointSystem|))
           (QSETREFV $ 148
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;53|)
                           $))))))))
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV $ 139 (CONS (|dispatchFunction| |SMP;content;$VarSet$;54|) $))
       (QSETREFV $ 140 (CONS (|dispatchFunction| |SMP;gcd;3$;55|) $))
       (COND
        ((|HasCategory| |#1| '(|FloatingPointSystem|))
         (QSETREFV $ 148
                   (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;56|)
                         $)))))))
    (COND
     ((|testBitVector| |pv$| 20)
      (QSETREFV $ 200
                (CONS (|dispatchFunction| |SMP;differentiate;$VarSet$;75|)
                      $))))
    $))) 

(MAKEPROP '|SparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'D '|VPoly|
              '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;Zero;$;1|) $))
              (4 . |One|) (8 . |One|) '|m_one| (|Boolean|) (12 . |zero?|)
              |SMP;zero?;$B;3| (17 . |One|) (21 . =) (27 . |one?|)
              (32 . |reductum|) (37 . |ground?|) (42 . |leadingCoefficient|)
              (|List| $$) (47 . |coefficients|) (|NonNegativeInteger|)
              |SMP;numberOfMonomials;$Nni;6| (52 . |monomial|) (58 . |coerce|)
              (63 . |numberOfMonomials|) (68 . ~=) |SMP;monomial?;$B;8|
              |SMP;ground?;$B;17| (|Mapping| 16 $$) (74 . |any?|)
              |SMP;leadingCoefficient;$R;76| (|SparseUnivariatePolynomial| 6)
              (80 . |coerce|) (85 . |degree|) (90 . |monomial|) (96 . +)
              (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 8 6 38)
              (102 . |map|) |SMP;univariate;$Sup;11| (108 . |ground?|)
              (113 . |leadingCoefficient|) (118 . |degree|) (123 . |reductum|)
              |SMP;multivariate;SupVarSet$;12| |SMP;+;3$;28| (128 . <)
              (134 . =) (|SparseUnivariatePolynomial| $)
              |SMP;univariate;$VarSetSup;14| (|Mapping| $$ $$) (140 . |map|)
              (146 . +) (|SparseUnivariatePolynomial| $$) (152 . |degree|)
              (157 . |coefficient|) (163 . |leadingCoefficient|)
              |SMP;monomial;$VarSetNni$;18| (168 . |reductum|)
              (173 . |ground?|) (178 . |zero?|) (183 . >)
              |SMP;multivariate;SupVarSet$;16| (189 . |shiftLeft|)
              (|IndexedExponents| 7) (195 . |zero?|) (200 . |reductum|)
              |SMP;monomial;RIe$;19| (205 . |leadingCoefficient|)
              (210 . |leadingSupport|) (215 . |coefficient|)
              |SMP;coefficient;$IeR;20| (|Integer|) (221 . |coerce|)
              (226 . |coerce|) (231 . |characteristic|)
              (235 . |characteristic|) |SMP;coerce;R$;23| (|Union| $ '"failed")
              (239 . |recip|) (244 . |recip|) (249 . -) (254 . -) (259 . -)
              (264 . *) (270 . *) (276 . *) (282 . *) (288 . *) |SMP;*;R2$;27|
              (294 . +) (300 . |coerce|) (305 . -) (311 . -) (317 . -)
              (323 . =) |SMP;=;2$B;30| (329 . *) (335 . *) |SMP;*;3$;31|
              (|PositiveInteger|) |SMP;^;$Pi$;33| |SMP;^;$Nni$;32| (341 . ^)
              (347 . ^) (353 . ^) (|HashState|) (359 . |hashUpdate!|)
              (365 . |hashUpdate!|) (371 . |hashUpdate!|)
              |SMP;hashUpdate!;Hs$Hs;34|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (377 . |unitNormal|) (382 . |unitNormal|) (387 . |unitCanonical|)
              (392 . |unitCanonical|) (397 . |unit?|) (402 . |unit?|)
              (407 . |associates?|) (413 . |associates?|) (419 . |associates?|)
              (425 . |exquo|) (431 . |exquo|) (437 . |exquo|) (|Mapping| 6 6)
              |SMP;map;M2$;41| (443 . |inv|) (448 . /) (454 . |zero?|)
              (459 . |content|) (464 . |gcd|) (470 . |content|)
              (475 . |content|) (481 . |gcd|) (487 . |gcd|) (493 . |content|)
              (498 . |coerce|) (503 . |minimumDegree|) (508 . ~=)
              (514 . |exquo|) (520 . *) (526 . |gcdPolynomial|)
              (|PolynomialGcdPackage| 71 7 6 $$) (532 . |gcd|) (537 . |gcd|)
              (|List| $) (543 . |gcd|) (548 . |gcd|) (|OutputForm|)
              (554 . |coerce|) (559 . |coerce|) (564 . |outputForm|)
              |SMP;coerce;$Of;57| (|List| 6) (570 . |list|)
              |SMP;coefficients;$L;58| (575 . |append|) |SMP;retract;$R;59|
              (|Union| 6 '"failed") |SMP;retractIfCan;$U;60| (|List| 7)
              (581 . |setrest!|) |SMP;variables;$L;62| (|Union| 7 '"failed")
              |SMP;mainVariable;$U;63| (587 . |elt|) |SMP;eval;$VarSet2$;64|
              |SMP;eval;$VarSetR$;65| (593 . |empty?|) '"rest" (598 . |elt|)
              '"first" (604 . |elt|) (|Mapping| 16 7 7) (610 . |sorted?|)
              (616 . |sort|) (622 . =) (628 . |position|) (634 . |elt|)
              |SMP;eval;$LL$;67| |SMP;eval;$LL$;68| |SMP;degree;$VarSetNni;69|
              (|List| 27) |SMP;degree;$LL;70| (640 . |Zero|)
              |SMP;degree;$Ie;71| (644 . |monomial|) (650 . +)
              (656 . |minimumDegree|) |SMP;minimumDegree;$Ie;72|
              |SMP;minimumDegree;$VarSetNni;73| |SMP;minimumDegree;$LL;74|
              (661 . |differentiate|) (666 . |differentiate|)
              |SMP;leadingMonomial;2$;77| |SMP;reductum;2$;78| (672 . |ground|)
              (677 . >) (683 . |cons|) (689 . |reverse!|) |SMP;monomials;$L;80|
              (|Union| 215 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 79) (|Matrix| 79)
              (|Record| (|:| |mat| 213) (|:| |vec| (|Vector| 79))) (|Vector| $)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 79 $)
              (|Fraction| 79)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Factored| $) (|Factored| 55) (|Union| 223 '#1#) (|List| 55)
              (|Union| 218 '#2="failed") (|Union| 79 '#2#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |mat| 228) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Equation| $) (|List| 229)
              (|Record| (|:| |var| 7) (|:| |exponent| 27))
              (|Union| 231 '#3="failed") (|Union| 152 '#3#) (|Mapping| 71 71)
              (|String|) (|SingleInteger|))
           '#(~= 694 |zero?| 700 |variables| 705 |univariate| 710 |unitNormal|
              721 |unitCanonical| 726 |unit?| 731 |totalDegreeSorted| 736
              |totalDegree| 742 |subtractIfCan| 753 |squareFreePolynomial| 759
              |squareFreePart| 764 |squareFree| 769
              |solveLinearPolynomialEquation| 774 |smaller?| 780 |sample| 786
              |retractIfCan| 790 |retract| 810 |resultant| 830 |reductum| 837
              |reducedSystem| 842 |recip| 864 |primitivePart| 869
              |primitiveMonomials| 880 |prime?| 885 |pomopo!| 890
              |patternMatch| 898 |opposite?| 912 |one?| 918 |numberOfMonomials|
              923 |multivariate| 928 |monomials| 940 |monomial?| 945 |monomial|
              950 |monicDivide| 970 |minimumDegree| 977 |mapExponents| 994
              |map| 1000 |mainVariable| 1006 |leadingMonomial| 1011
              |leadingCoefficient| 1016 |lcmCoef| 1021 |lcm| 1027 |latex| 1038
              |isTimes| 1043 |isPlus| 1048 |isExpt| 1053 |hashUpdate!| 1058
              |hash| 1064 |ground?| 1069 |ground| 1074 |gcdPolynomial| 1079
              |gcd| 1085 |fmecg| 1096 |factorSquareFreePolynomial| 1104
              |factorPolynomial| 1109 |factor| 1114 |exquo| 1119 |eval| 1131
              |discriminant| 1185 |differentiate| 1191 |degree| 1217 |convert|
              1234 |content| 1249 |conditionP| 1260 |coerce| 1265
              |coefficients| 1295 |coefficient| 1300 |charthRoot| 1320
              |characteristic| 1325 |binomThmExpt| 1329 |associates?| 1336
              |annihilate?| 1342 ^ 1348 |Zero| 1360 |One| 1364 D 1368 = 1394 /
              1400 - 1406 + 1417 * 1423)
           'NIL
           (CONS
            (|makeByteWordVec2| 44
                                '(0 0 10 0 10 0 14 25 1 21 4 27 13 1 2 3 21 4 9
                                  24 27 15 4 0 1 29 30 0 0 1 1 22 28 30 40 11
                                  42 0 11 44 0 0 8 32 34 0 0 11 0 0 0 0 0 0 4 5
                                  6 7 26 12 36 38 16 11 11))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |Algebra&| |Algebra&| |FullyLinearlyExplicitOver&|
                |Algebra&| NIL |Module&| NIL NIL |Module&| NIL NIL NIL
                |Module&| |EntireRing&| |PartialDifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                NIL NIL NIL |FullyRetractableTo&| |SetCategory&| |Evalable&|
                NIL |InnerEvalable&| |InnerEvalable&| |RetractableTo&|
                |BasicType&| NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL
                NIL NIL NIL NIL |InnerEvalable&| |RetractableTo&|)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|Algebra| 218) (|Algebra| 6)
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|Module| 218) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 79) (|CommutativeRing|) (|Module| $$)
                 (|EntireRing|) (|PartialDifferentialRing| 7) (|BiModule| 6 6)
                 (|BiModule| 218 218) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 218)
                 (|RightModule| 218) (|RightModule| $$) (|LeftModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 79) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|Evalable| $$)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 7 $$)
                 (|InnerEvalable| 7 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 155) (|unitsKnown|) (|RetractableTo| 218)
                 (|RetractableTo| 79) (|canonicalUnitNormal|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|ConvertibleTo| 211)
                 (|ConvertibleTo| 212) (|ConvertibleTo| 210)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 7))
              (|makeByteWordVec2| 236
                                  '(0 6 0 11 0 6 0 13 0 0 0 14 1 6 16 0 17 0 8
                                    0 19 2 6 16 0 0 20 1 0 16 0 21 1 8 0 0 22 1
                                    8 16 0 23 1 8 2 0 24 1 8 25 0 26 2 8 0 2 27
                                    29 1 0 0 7 30 1 8 27 0 31 2 27 16 0 0 32 2
                                    25 16 35 0 36 1 38 0 6 39 1 8 27 0 40 2 38
                                    0 6 27 41 2 38 0 0 0 42 2 44 38 43 8 45 1
                                    38 16 0 47 1 38 6 0 48 1 38 27 0 49 1 38 0
                                    0 50 2 7 16 0 0 53 2 7 16 0 0 54 2 8 0 57 0
                                    58 2 8 0 0 0 59 1 60 27 0 61 2 60 2 0 27 62
                                    1 60 2 0 63 1 60 0 0 65 1 60 16 0 66 1 60
                                    16 0 67 2 7 16 0 0 68 2 8 0 0 27 70 1 71 16
                                    0 72 1 71 0 0 73 1 71 27 0 75 1 71 7 0 76 2
                                    8 2 0 27 77 1 6 0 79 80 1 0 0 79 81 0 6 27
                                    82 0 0 27 83 1 6 85 0 86 1 0 85 0 87 1 6 0
                                    0 88 1 8 0 0 89 1 0 0 0 90 2 6 0 79 0 91 2
                                    8 0 79 0 92 2 0 0 79 0 93 2 6 0 0 0 94 2 8
                                    0 2 0 95 2 6 0 0 0 97 1 8 0 2 98 2 6 0 0 0
                                    99 2 8 0 0 0 100 2 0 0 0 0 101 2 8 16 0 0
                                    102 2 8 0 0 2 104 2 8 0 0 0 105 2 6 0 0 107
                                    110 2 38 0 0 27 111 2 8 0 0 27 112 2 6 113
                                    113 0 114 2 7 113 113 0 115 2 8 113 113 0
                                    116 1 6 118 0 119 1 0 118 0 120 1 6 0 0 121
                                    1 0 0 0 122 1 6 16 0 123 1 0 16 0 124 2 6
                                    16 0 0 125 2 8 16 0 0 126 2 0 16 0 0 127 2
                                    6 85 0 0 128 2 8 85 0 0 129 2 0 85 0 0 130
                                    1 6 0 0 133 2 0 0 0 6 134 1 8 16 0 135 1 0
                                    6 0 136 2 6 0 0 0 137 1 8 2 0 138 2 0 0 0 7
                                    139 2 0 0 0 0 140 2 8 0 0 0 141 1 60 2 0
                                    142 1 60 0 2 143 1 60 27 0 144 2 60 16 0 0
                                    145 2 60 85 0 0 146 2 60 0 0 0 147 2 0 55
                                    55 55 148 1 149 2 25 150 2 149 2 2 2 151 1
                                    0 0 152 153 2 149 60 60 60 154 1 6 155 0
                                    156 1 7 155 0 157 2 8 155 0 155 158 1 160 0
                                    6 161 2 160 0 0 0 163 2 167 0 0 0 168 2 8 2
                                    0 2 172 1 25 16 0 175 2 25 0 0 176 177 2 25
                                    2 0 178 179 2 167 16 180 0 181 2 167 0 180
                                    0 182 2 167 16 0 0 183 2 167 79 7 0 184 2
                                    25 2 0 79 185 0 71 0 191 2 71 0 27 7 193 2
                                    71 0 0 0 194 1 8 27 0 195 1 8 0 0 199 2 0 0
                                    0 7 200 1 8 2 0 203 2 27 16 0 0 204 2 25 0
                                    2 0 205 1 25 0 0 206 2 0 16 0 0 1 1 55 16 0
                                    18 1 0 167 0 169 2 0 55 0 7 56 1 0 38 0 46
                                    1 48 118 0 120 1 48 0 0 122 1 48 16 0 124 2
                                    0 27 0 167 1 2 0 27 0 167 1 1 0 27 0 1 2 54
                                    85 0 0 1 1 10 221 55 1 1 13 0 0 1 1 13 220
                                    0 1 2 10 222 223 55 1 2 8 16 0 0 1 0 55 0 1
                                    1 5 224 0 1 1 6 225 0 1 1 11 170 0 1 1 0
                                    165 0 166 1 5 218 0 1 1 6 79 0 1 1 11 7 0 1
                                    1 0 6 0 164 3 20 0 0 0 7 1 1 0 0 0 202 1 19
                                    213 209 1 2 19 214 209 215 1 2 4 227 209
                                    215 1 1 4 228 209 1 1 51 85 0 87 2 13 0 0 7
                                    1 1 13 0 0 1 1 11 152 0 1 1 10 16 0 1 4 0 0
                                    0 6 71 0 1 3 31 216 0 211 216 1 3 33 217 0
                                    212 217 1 2 55 16 0 0 1 1 51 16 0 21 1 0 27
                                    0 28 2 0 0 55 7 69 2 0 0 38 7 51 1 0 152 0
                                    207 1 0 16 0 33 3 0 0 0 167 189 1 3 0 0 0 7
                                    27 64 2 0 0 6 71 74 3 4 226 0 0 7 1 2 0 27
                                    0 7 197 2 0 189 0 167 198 1 0 71 0 196 2 0
                                    0 234 0 1 2 0 0 131 0 132 1 0 170 0 171 1 0
                                    0 0 201 1 0 6 0 37 2 13 219 0 0 1 2 13 0 0
                                    0 1 1 13 0 152 1 1 0 235 0 1 1 11 233 0 1 1
                                    0 233 0 1 1 11 232 0 1 2 0 113 113 0 117 1
                                    0 236 0 1 1 0 16 0 34 1 0 6 0 1 2 13 55 55
                                    55 148 2 13 0 0 0 140 1 13 0 152 153 4 4 0
                                    0 71 6 0 1 1 10 221 55 1 1 10 221 55 1 1 10
                                    220 0 1 2 48 85 0 0 130 2 12 85 0 6 1 3 11
                                    0 0 152 152 1 2 11 0 0 229 1 3 11 0 0 0 0 1
                                    2 11 0 0 230 1 3 0 0 0 7 0 173 3 0 0 0 167
                                    152 186 3 0 0 0 7 6 174 3 0 0 0 167 160 187
                                    2 20 0 0 7 1 2 4 0 0 167 1 2 4 0 0 7 200 3
                                    4 0 0 167 189 1 3 4 0 0 7 27 1 2 0 189 0
                                    167 190 2 0 27 0 7 188 1 0 71 0 192 1 16
                                    210 0 1 1 35 211 0 1 1 37 212 0 1 2 13 0 0
                                    7 139 1 13 6 0 136 1 46 208 209 1 1 50 0 79
                                    81 1 49 0 0 1 1 18 0 218 1 1 11 0 7 30 1 0
                                    0 6 84 1 0 155 0 159 1 0 160 0 162 3 0 0 0
                                    167 189 1 3 0 0 0 7 27 1 2 0 6 0 71 78 1 47
                                    85 0 1 0 52 27 83 3 45 0 0 0 27 1 2 48 16 0
                                    0 127 2 52 16 0 0 1 2 51 0 0 27 109 2 0 0 0
                                    107 108 0 55 0 12 0 51 0 14 2 4 0 0 167 1 2
                                    4 0 0 7 1 3 4 0 0 167 189 1 3 4 0 0 7 27 1
                                    2 0 16 0 0 103 2 17 0 0 6 134 1 53 0 0 90 2
                                    53 0 0 0 101 2 0 0 0 0 52 2 53 0 79 0 93 2
                                    55 0 27 0 1 2 1 0 218 0 1 2 1 0 0 218 1 2 0
                                    0 6 0 96 2 0 0 0 0 106 2 0 0 0 6 1 2 0 0
                                    107 0 1)))))
           '|lookupComplete|)) 
