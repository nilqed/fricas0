
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
         ((#1=#:G484 NIL) (#2=#:G483 #3=(|NonNegativeInteger|)) (#4=#:G485 #3#)
          (#5=#:G487 NIL) (|q| NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND ((SPADCALL (QCDR |p|) (QREFELT $ 17)) 0) (#6='T 1)))
           (#6#
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |q| NIL)
                  (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 26))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL |q| (QREFELT $ 28)))
                     (COND (#1# (LETT #2# (+ #2# #4#)))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# 0)))))))) 

(SDEFUN |SMP;coerce;VarSet$;7| ((|mvar| |VarSet|) ($ $))
        (CONS 1
              (CONS |mvar| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 29))))) 

(SDEFUN |SMP;monomial1?| ((|p| $) ($ |Boolean|))
        (SPROG ((|sup| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) 'T)
                      ('T
                       (SEQ (LETT |sup| (QCDR (QCDR |p|)))
                            (COND
                             ((NULL (SPADCALL |sup| (QREFELT $ 31)))
                              (EXIT NIL)))
                            (EXIT
                             (|SMP;monomial1?| (SPADCALL |sup| (QREFELT $ 24))
                              $)))))))) 

(SDEFUN |SMP;monomial?;$B;9| ((|p| $) ($ |Boolean|))
        (COND ((SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 32)) NIL)
              ('T (|SMP;monomial1?| |p| $)))) 

(SDEFUN |SMP;moreThanOneVariable?| ((|p| $) ($ |Boolean|))
        (SPROG ((|q| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      (#1='T
                       (SEQ (LETT |q| (QCDR (QCDR |p|)))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (CONS #'|SMP;moreThanOneVariable?!0| $)
                                (SPADCALL |q| (QREFELT $ 26)) (QREFELT $ 36))
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

(SDEFUN |SMP;univariate;$Sup;12| ((|p| $) ($ |SparseUnivariatePolynomial| R))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT $ 37)) (QREFELT $ 39)))
         ((|SMP;moreThanOneVariable?| |p| $) (|error| "not univariate"))
         ('T (SPADCALL (ELT $ 37) (QCDR (QCDR |p|)) (QREFELT $ 45))))) 

(SDEFUN |SMP;multivariate;SupVarSet$;13|
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
               (SEQ (LETT |pt| (SPADCALL |p| |n| (QREFELT $ 29)))
                    (EXIT (CONS 1 (CONS |var| |pt|)))))) 

(SDEFUN |SMP;univariate;$VarSetSup;15|
        ((|p| $) (|mvar| |VarSet|) ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|ulc| (D)) (|ulc0| (|SparseUnivariatePolynomial| $)) (|pt| (D)))
         (SEQ
          (COND
           ((OR (QEQCAR |p| 0)
                (SPADCALL (QCAR (QCDR |p|)) |mvar| (QREFELT $ 53)))
            (SPADCALL |p| 0 (QREFELT $ 29)))
           ('T
            (SEQ (LETT |pt| (QCDR (QCDR |p|)))
                 (EXIT
                  (COND
                   ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54)) |pt|)
                   ('T
                    (SEQ
                     (LETT |ulc0|
                           (SPADCALL (SPADCALL |pt| (QREFELT $ 24)) |mvar|
                                     (QREFELT $ 56)))
                     (LETT |ulc|
                           (SPADCALL
                            (CONS #'|SMP;univariate;$VarSetSup;15!0|
                                  (VECTOR $ |pt| |p|))
                            |ulc0| (QREFELT $ 58)))
                     (EXIT
                      (SPADCALL |ulc|
                                (SPADCALL (|SMP;red| |p| $) |mvar|
                                          (QREFELT $ 56))
                                (QREFELT $ 59))))))))))))) 

(SDEFUN |SMP;univariate;$VarSetSup;15!0| ((|c| NIL) ($$ NIL))
        (PROG (|p| |pt| $)
          (LETT |p| (QREFELT $$ 2))
          (LETT |pt| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|SMP;mon_mul| |c| (QCAR (QCDR |p|)) (SPADCALL |pt| (QREFELT $ 40))
             $))))) 

(SDEFUN |SMP;unlikeUnivReconstruct|
        ((|u| |SparseUnivariatePolynomial| $) (|mvar| |VarSet|) ($ $))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND
                ((ZEROP (LETT |d| (SPADCALL |u| (QREFELT $ 61))))
                 (SPADCALL |u| 0 (QREFELT $ 62)))
                ('T
                 (SPADCALL
                  (SPADCALL (SPADCALL |u| (QREFELT $ 63)) |mvar| |d|
                            (QREFELT $ 64))
                  (|SMP;unlikeUnivReconstruct| (SPADCALL |u| (QREFELT $ 65))
                   |mvar| $)
                  (QREFELT $ 52)))))) 

(SDEFUN |SMP;multivariate;SupVarSet$;17|
        ((|u| |SparseUnivariatePolynomial| $) (|mvar| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G527 NIL) (|uu| (|SparseUnivariatePolynomial| $)) (|cc| ($)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (QREFELT $ 66)) (SPADCALL |u| 0 (QREFELT $ 62)))
            ('T
             (SEQ (LETT |uu| |u|)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |uu| (QREFELT $ 67))))
                         (GO G191)))
                       (SEQ (LETT |cc| (SPADCALL |uu| (QREFELT $ 63)))
                            (COND
                             ((OR (QEQCAR |cc| 0)
                                  (SPADCALL |mvar| (QCAR (QCDR |cc|))
                                            (QREFELT $ 68)))
                              (EXIT
                               (LETT |uu| (SPADCALL |uu| (QREFELT $ 65))))))
                            (EXIT
                             (PROGN
                              (LETT #1#
                                    (|SMP;unlikeUnivReconstruct| |u| |mvar| $))
                              (GO #2=#:G526))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 1 (CONS |mvar| |u|)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SMP;ground?;$B;18| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) 'T) ('T NIL))) 

(SDEFUN |SMP;monomial;$VarSetNni$;19|
        ((|p| $) (|mvar| |VarSet|) (|k1| |NonNegativeInteger|) ($ $))
        (SPROG ((|pt1| (D)) (|pt| (D)))
               (SEQ
                (COND ((OR (ZEROP |k1|) (SPADCALL |p| (QREFELT $ 18))) |p|)
                      ((OR (QEQCAR |p| 0)
                           (SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68)))
                       (CONS 1
                             (CONS |mvar| (SPADCALL |p| |k1| (QREFELT $ 29)))))
                      ('T
                       (SEQ (LETT |pt| (QCDR (QCDR |p|)))
                            (LETT |pt1|
                                  (COND
                                   ((SPADCALL |mvar| (QCAR (QCDR |p|))
                                              (QREFELT $ 53))
                                    (SPADCALL
                                     (CONS #'|SMP;monomial;$VarSetNni$;19!0|
                                           (VECTOR $ |k1| |mvar|))
                                     |pt| (QREFELT $ 58)))
                                   ('T (SPADCALL |pt| |k1| (QREFELT $ 70)))))
                            (EXIT (CONS 1 (CONS (QCAR (QCDR |p|)) |pt1|))))))))) 

(SDEFUN |SMP;monomial;$VarSetNni$;19!0| ((|c| NIL) ($$ NIL))
        (PROG (|mvar| |k1| $)
          (LETT |mvar| (QREFELT $$ 2))
          (LETT |k1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |mvar| |k1| (QREFELT $ 64)))))) 

(SDEFUN |SMP;monomial;RIe$;20|
        ((|c| R) (|e| |IndexedExponents| |VarSet|) ($ $))
        (SPROG ((|m1| (D)) (|p1| ($)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT $ 72)) (CONS 0 |c|))
                      ('T
                       (SEQ
                        (LETT |p1|
                              (SPADCALL |c| (SPADCALL |e| (QREFELT $ 73))
                                        (QREFELT $ 74)))
                        (LETT |m1|
                              (SPADCALL |p1| (SPADCALL |e| (QREFELT $ 75))
                                        (QREFELT $ 29)))
                        (EXIT
                         (CONS 1
                               (CONS (SPADCALL |e| (QREFELT $ 76)) |m1|))))))))) 

(SDEFUN |SMP;coefficient;$IeR;21|
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
                  (SEQ (LETT |ve| (SPADCALL |e| (QREFELT $ 76)))
                       (LETT |vp| (QCAR (QCDR |p|)))
                       (EXIT
                        (COND
                         ((SPADCALL |ve| |vp| (QREFELT $ 53))
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 77)) |e|
                           (QREFELT $ 78)))
                         ((SPADCALL |ve| |vp| (QREFELT $ 68))
                          (QCDR (|spadConstant| $ 12)))
                         (#1#
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|))
                                     (SPADCALL |e| (QREFELT $ 75))
                                     (QREFELT $ 77))
                           (SPADCALL |e| (QREFELT $ 73))
                           (QREFELT $ 78))))))))))) 

(SDEFUN |SMP;coerce;I$;22| ((|n| |Integer|) ($ $))
        (CONS 0 (SPADCALL |n| (QREFELT $ 80)))) 

(SDEFUN |SMP;characteristic;Nni;23| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 82))) 

(PUT '|SMP;coerce;R$;24| '|SPADreplace| '(XLAM (|c|) (CONS 0 |c|))) 

(SDEFUN |SMP;coerce;R$;24| ((|c| R) ($ $)) (CONS 0 |c|)) 

(SDEFUN |SMP;recip;$U;25| ((|p| $) ($ |Union| $ #1="failed"))
        (SPROG ((|uu| (|Union| R #1#)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (SEQ (LETT |uu| (SPADCALL (QCDR |p|) (QREFELT $ 86)))
                       (EXIT
                        (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                              (#2='T (CONS 0 (CONS 0 (QCDR |uu|))))))))
                 (#2# (CONS 1 "failed")))))) 

(SDEFUN |SMP;-;2$;26| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 88))))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 89))))))) 

(SDEFUN |SMP;*;I2$;27| ((|n| |Integer|) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT $ 91))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                       (LETT |up|
                             (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT $ 92)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;*;R2$;28| ((|c| R) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |c| (QCDR (|spadConstant| $ 12)) (QREFELT $ 20))
                  (|spadConstant| $ 12))
                 ((SPADCALL |c| (QREFELT $ 15) (QREFELT $ 20)) |p|)
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |c| (QCDR |p|) (QREFELT $ 94))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                       (LETT |up|
                             (SPADCALL (CONS 0 |c|) (QCDR (QCDR |p|))
                                       (QREFELT $ 95)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;+;3$;29| ((|p1| $) (|p2| $) ($ $))
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
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT $ 59)))
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

(SDEFUN |SMP;-;3$;30| ((|p1| $) (|p2| $) ($ $))
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
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT $ 100)))
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

(SDEFUN |SMP;=;2$B;31| ((|p1| $) (|p2| $) ($ |Boolean|))
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

(SDEFUN |SMP;*;3$;32| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 96)))
                 ((QEQCAR |p2| 0)
                  (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                       (QREFELT $ 103)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#1='T (CONS 1 (CONS |mvar| |up|)))))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 54))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT $ 104)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|)))))))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                         (QREFELT $ 103)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|)))))))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p2|)))
                         (LETT |up|
                               (SPADCALL |p1| (QCDR (QCDR |p2|))
                                         (QREFELT $ 95)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;pow_aux| ((|p| $) (|k| |NonNegativeInteger|) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)) (|kp| (|PositiveInteger|)))
               (SEQ
                (COND ((EQL |k| 0) (CONS 0 (QREFELT $ 15)))
                      (#1='T
                       (SEQ (LETT |kp| |k|)
                            (EXIT
                             (COND
                              ((QEQCAR |p| 0)
                               (CONS 0
                                     (SPADCALL (QCDR |p|) |kp|
                                               (QREFELT $ 107))))
                              ((NULL (|SMP;moreThanOneVariable?| |p| $))
                               (SPADCALL
                                (SPADCALL (|SMP;univariateKnown| |p| $) |kp|
                                          (QREFELT $ 108))
                                (QCAR (QCDR |p|)) (QREFELT $ 51)))
                              ('T
                               (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                                    (LETT |up|
                                          (SPADCALL (QCDR (QCDR |p|)) |kp|
                                                    (QREFELT $ 109)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |up| (QREFELT $ 23))
                                       (SPADCALL |up| (QREFELT $ 24)))
                                      (#1#
                                       (CONS 1 (CONS |mvar| |up|))))))))))))))) 

(SDEFUN |SMP;^;$Nni$;34| ((|p| $) (|k| |NonNegativeInteger|) ($ $))
        (|SMP;pow_aux| |p| |k| $)) 

(SDEFUN |SMP;^;$Pi$;35| ((|p| $) (|kp| |PositiveInteger|) ($ $))
        (|SMP;pow_aux| |p| |kp| $)) 

(SDEFUN |SMP;hashUpdate!;Hs$Hs;36| ((|s| |HashState|) (|p| $) ($ |HashState|))
        (SEQ
         (COND ((QEQCAR |p| 0) (SPADCALL |s| (QCDR |p|) (QREFELT $ 113)))
               ('T
                (SEQ
                 (LETT |s| (SPADCALL |s| (QCAR (QCDR |p|)) (QREFELT $ 114)))
                 (EXIT (SPADCALL |s| (QCDR (QCDR |p|)) (QREFELT $ 115)))))))) 

(SDEFUN |SMP;unitNormal;$R;37|
        ((|p| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G67|
           #1=(|Record| (|:| |unit| R) (|:| |canonical| R)
                        (|:| |associate| R)))
          (|#G66| #1#))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (SEQ
             (PROGN
              (LETT |#G66| (SPADCALL (QCDR |p|) (QREFELT $ 118)))
              (LETT |u| (QVELT |#G66| 0))
              (LETT |c| (QVELT |#G66| 1))
              (LETT |a| (QVELT |#G66| 2))
              |#G66|)
             (EXIT (VECTOR (CONS 0 |u|) (CONS 0 |c|) (CONS 0 |a|)))))
           ('T
            (SEQ
             (PROGN
              (LETT |#G67|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 37)) (QREFELT $ 118)))
              (LETT |u| (QVELT |#G67| 0))
              (LETT |c| (QVELT |#G67| 1))
              (LETT |a| (QVELT |#G67| 2))
              |#G67|)
             (EXIT
              (VECTOR (CONS 0 |u|) (SPADCALL |a| |p| (QREFELT $ 96))
                      (CONS 0 |a|))))))))) 

(SDEFUN |SMP;unitCanonical;2$;38| ((|p| $) ($ $))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G72|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R))))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 120))))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G72|
                         (SPADCALL (SPADCALL |p| (QREFELT $ 37))
                                   (QREFELT $ 118)))
                   (LETT |u| (QVELT |#G72| 0))
                   (LETT |c| (QVELT |#G72| 1))
                   (LETT |a| (QVELT |#G72| 2))
                   |#G72|)
                  (EXIT (SPADCALL |a| |p| (QREFELT $ 96))))))))) 

(SDEFUN |SMP;unit?;$B;39| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 122))) ('T NIL))) 

(SDEFUN |SMP;associates?;2$B;40| ((|p1| $) (|p2| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 124)))
           (#1='T NIL)))
         ((QEQCAR |p2| 1)
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 125)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |SMP;exquo;2$U;41| ((|p1| $) (|p2| $) ($ |Union| $ "failed"))
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
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 127)))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#1='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT $ 18))
                 (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 32)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #2="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT $ 53))
                       (EXIT (CONS 1 #2#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT $ 98))
                                  (QREFELT $ 128)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (EXIT
               (COND
                ((SPADCALL |p1| |p2| (QREFELT $ 32))
                 (CONS 0 (|spadConstant| $ 14)))
                (#1#
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                  (QREFELT $ 128)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                               (LETT |up| (QCDR |a|))
                               (EXIT
                                (COND
                                 ((SPADCALL |up| (QREFELT $ 66))
                                  (CONS 0 (SPADCALL |up| (QREFELT $ 63))))
                                 (#1#
                                  (CONS 0
                                        (CONS 1
                                              (CONS |mvar|
                                                    |up|))))))))))))))))))))) 

(SDEFUN |SMP;exquo;2$U;42| ((|p1| $) (|p2| $) ($ |Union| $ "failed"))
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
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 127)))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#1='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT $ 18))
                 (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 32)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #2="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT $ 53))
                       (EXIT (CONS 1 #2#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT $ 98))
                                  (QREFELT $ 128)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                              (QREFELT $ 128)))
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#1#
                      (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                           (LETT |up| (QCDR |a|))
                           (EXIT
                            (COND
                             ((SPADCALL |up| (QREFELT $ 66))
                              (CONS 0 (SPADCALL |up| (QREFELT $ 63))))
                             (#1#
                              (CONS 0 (CONS 1 (CONS |mvar| |up|))))))))))))))))) 

(SDEFUN |SMP;map;M2$;43| ((|fn| |Mapping| R R) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
                      (#1='T
                       (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                            (LETT |up|
                                  (SPADCALL
                                   (CONS #'|SMP;map;M2$;43!0| (VECTOR $ |fn|))
                                   (QCDR (QCDR |p|)) (QREFELT $ 58)))
                            (EXIT
                             (COND
                              ((SPADCALL |up| (QREFELT $ 23))
                               (SPADCALL |up| (QREFELT $ 24)))
                              (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;map;M2$;43!0| ((|x1| NIL) ($$ NIL))
        (PROG (|fn| $)
          (LETT |fn| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |fn| |x1| (QREFELT $ 131)))))) 

(SDEFUN |SMP;/;$R$;44| ((|p| $) (|r| R) ($ $))
        (SPADCALL (CONS 0 (SPADCALL |r| (QREFELT $ 132))) |p| (QREFELT $ 105))) 

(SDEFUN |SMP;content;$R;45| ((|p| $) ($ R))
        (SPROG ((|up| (D)) (|c| (R)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ (LETT |c| (QCDR (|spadConstant| $ 12)))
                            (LETT |up| (QCDR (QCDR |p|)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL
                                     (OR (SPADCALL |up| (QREFELT $ 134))
                                         (SPADCALL |c|
                                                   (QCDR (|spadConstant| $ 14))
                                                   (QREFELT $ 20)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |c|
                                        (SPADCALL |c|
                                                  (SPADCALL
                                                   (SPADCALL |up|
                                                             (QREFELT $ 24))
                                                   (QREFELT $ 135))
                                                  (QREFELT $ 136)))
                                  (EXIT
                                   (LETT |up| (SPADCALL |up| (QREFELT $ 22)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |c|))))))) 

(SDEFUN |SMP;content;$VarSet$;46| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56))
                         (QREFELT $ 137))))) 

(SDEFUN |SMP;gcd;3$;47| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 136))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 137))
                              (QREFELT $ 139)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 137))
                                   (QREFELT $ 139)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 137))
                              (QREFELT $ 139)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 137))
                              |p2| (QREFELT $ 139)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT $ 140)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;48|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G687 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 63))
                              (SPADCALL |b| (QREFELT $ 141)) (QREFELT $ 139))
                    (QREFELT $ 142)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 63))
                              (SPADCALL |a| (QREFELT $ 141)) (QREFELT $ 139))
                    (QREFELT $ 142)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT $ 141)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 143))
                                 (QREFELT $ 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 144))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 145)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| $)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| $)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT $ 141)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 143))
                                 (QREFELT $ 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 144))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 145)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| $)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| $)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 139))
                                 (MIN (SPADCALL |mona| (QREFELT $ 61))
                                      (SPADCALL |monb| (QREFELT $ 61)))
                                 (QREFELT $ 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT $ 61))
                        (SPADCALL |b| (QREFELT $ 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 145)) 1))
                      (SPADCALL |mong| |b| (QREFELT $ 146)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 145)) 1))
                    (SPADCALL |mong| |a| (QREFELT $ 146)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;content;$VarSet$;49| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56)) (QREFELT $ 26))
                (QREFELT $ 149))))) 

(SDEFUN |SMP;gcd;3$;50| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 150))) 

(SDEFUN |SMP;gcd;L$;51| ((|lp| |List| $) ($ $)) (SPADCALL |lp| (QREFELT $ 149))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;52|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPADCALL |a| |b| (QREFELT $ 153))) 

(SDEFUN |SMP;content;$VarSet$;53| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56))
                         (QREFELT $ 137))))) 

(SDEFUN |SMP;gcd;3$;54| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 136))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 137))
                              (QREFELT $ 139)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 137))
                                   (QREFELT $ 139)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 137))
                              (QREFELT $ 139)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 137))
                              |p2| (QREFELT $ 139)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT $ 140)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;55|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G719 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 63))
                              (SPADCALL |b| (QREFELT $ 141)) (QREFELT $ 139))
                    (QREFELT $ 142)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 63))
                              (SPADCALL |a| (QREFELT $ 141)) (QREFELT $ 139))
                    (QREFELT $ 142)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT $ 141)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 143))
                                 (QREFELT $ 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 144))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 145)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| $)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| $)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT $ 141)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 143))
                                 (QREFELT $ 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 144))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 145)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| $)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| $)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 139))
                                 (MIN (SPADCALL |mona| (QREFELT $ 61))
                                      (SPADCALL |monb| (QREFELT $ 61)))
                                 (QREFELT $ 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT $ 61))
                        (SPADCALL |b| (QREFELT $ 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 145)) 1))
                      (SPADCALL |mong| |b| (QREFELT $ 146)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 145)) 1))
                    (SPADCALL |mong| |a| (QREFELT $ 146)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;content;$VarSet$;56| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56))
                         (QREFELT $ 137))))) 

(SDEFUN |SMP;gcd;3$;57| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 136))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 137))
                              (QREFELT $ 139)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 137))
                                   (QREFELT $ 139)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 137))
                              (QREFELT $ 139)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 137))
                              |p2| (QREFELT $ 139)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT $ 140)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;58|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G747 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 63))
                              (SPADCALL |b| (QREFELT $ 141)) (QREFELT $ 139))
                    (QREFELT $ 142)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 63))
                              (SPADCALL |a| (QREFELT $ 141)) (QREFELT $ 139))
                    (QREFELT $ 142)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT $ 141)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 143))
                                 (QREFELT $ 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 144))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 145)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| $)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| $)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT $ 141)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 143))
                                 (QREFELT $ 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 144))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 145)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| $)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| $)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 139))
                                 (MIN (SPADCALL |mona| (QREFELT $ 61))
                                      (SPADCALL |monb| (QREFELT $ 61)))
                                 (QREFELT $ 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT $ 61))
                        (SPADCALL |b| (QREFELT $ 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 145)) 1))
                      (SPADCALL |mong| |b| (QREFELT $ 146)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 145)) 1))
                    (SPADCALL |mong| |a| (QREFELT $ 146)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;coerce;$Of;59| ((|p| $) ($ |OutputForm|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 155)))
              ('T
               (SPADCALL (QCDR (QCDR |p|))
                         (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 156))
                         (QREFELT $ 157))))) 

(SDEFUN |SMP;coefficients;$L;60| ((|p| $) ($ |List| R))
        (SPROG
         ((#1=#:G764 NIL) (#2=#:G763 #3=(|List| R)) (#4=#:G765 #3#)
          (#5=#:G767 NIL) (|p1| NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 160)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |p1| NIL)
                       (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 26)))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |p1| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (SPADCALL |p1| (QREFELT $ 161)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 162))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |SMP;retract;$R;61| ((|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T (|error| "cannot retract nonconstant polynomial")))) 

(SDEFUN |SMP;retractIfCan;$U;62| ((|p| $) ($ |Union| R "failed"))
        (COND ((QEQCAR |p| 0) (CONS 0 (QCDR |p|))) ('T (CONS 1 "failed")))) 

(SDEFUN |SMP;mymerge|
        ((|l| |List| |VarSet|) (|m| |List| |VarSet|) ($ |List| |VarSet|))
        (SEQ
         (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 54))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| (CDR |m|) (QREFELT $ 167)) (EXIT |l|)))
                 ((NULL (CDR |m|)) |l|)
                 (#1='T
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) (CDR |m|) $)
                             (QREFELT $ 167))
                   (EXIT |l|)))))
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 68))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| |m| (QREFELT $ 167)) (EXIT |l|)))
                 (#1#
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) |m| $)
                             (QREFELT $ 167))
                   (EXIT |l|)))))
               ((NULL (CDR |m|))
                (SEQ (SPADCALL |m| |l| (QREFELT $ 167)) (EXIT |m|)))
               (#1#
                (SEQ
                 (SPADCALL |m| (|SMP;mymerge| |l| (CDR |m|) $) (QREFELT $ 167))
                 (EXIT |m|)))))) 

(SDEFUN |SMP;variables;$L;64| ((|p| $) ($ |List| |VarSet|))
        (SPROG ((|q| (D)) (|lv| (|List| |VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      ('T
                       (SEQ (LETT |lv| NIL) (LETT |q| (QCDR (QCDR |p|)))
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (SPADCALL |q| (QREFELT $ 134))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |lv|
                                        (|SMP;mymerge| |lv|
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT $ 24))
                                          (QREFELT $ 168))
                                         $))
                                  (EXIT
                                   (LETT |q| (SPADCALL |q| (QREFELT $ 22)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (CONS (QCAR (QCDR |p|)) |lv|)))))))) 

(SDEFUN |SMP;mainVariable;$U;65| ((|p| $) ($ |Union| |VarSet| "failed"))
        (COND ((QEQCAR |p| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QCAR (QCDR |p|)))))) 

(SDEFUN |SMP;eval;$VarSet2$;66| ((|p| $) (|mvar| |VarSet|) (|pval| $) ($ $))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56)) |pval| (QREFELT $ 171))) 

(SDEFUN |SMP;eval;$VarSetR$;67| ((|p| $) (|mvar| |VarSet|) (|val| R) ($ $))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 56)) (CONS 0 |val|)
                  (QREFELT $ 171))) 

(SDEFUN |SMP;evalSortedVarlist|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lpval| |List| $) ($ $))
        (SPROG ((|pts| (D)) (|pval| ($)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((OR (QEQCAR |p| 0)
                      (OR (NULL |Lvar|) (SPADCALL |Lpval| (QREFELT $ 174))))
                  |p|)
                 ('T
                  (SEQ (LETT |mvar| (|SPADfirst| |Lvar|))
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68))
                          (|SMP;evalSortedVarlist| |p| (CDR |Lvar|)
                           (SPADCALL |Lpval| '|rest| (QREFELT $ 176)) $))
                         (#1='T
                          (SEQ
                           (LETT |pval|
                                 (SPADCALL |Lpval| '|first| (QREFELT $ 178)))
                           (LETT |pts|
                                 (SPADCALL
                                  (CONS #'|SMP;evalSortedVarlist!0|
                                        (VECTOR $ |Lpval| |Lvar|))
                                  (QCDR (QCDR |p|)) (QREFELT $ 58)))
                           (EXIT
                            (COND
                             ((SPADCALL |mvar| (QCAR (QCDR |p|))
                                        (QREFELT $ 54))
                              (COND
                               ((QEQCAR |pval| 0)
                                (SPADCALL |pts| (CONS 0 (QCDR |pval|))
                                          (QREFELT $ 171)))
                               (#1# (SPADCALL |pts| |pval| (QREFELT $ 171)))))
                             (#1#
                              (SPADCALL |pts| (QCAR (QCDR |p|))
                                        (QREFELT $ 69))))))))))))))) 

(SDEFUN |SMP;evalSortedVarlist!0| ((|x1| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| $)
          (LETT |Lvar| (QREFELT $$ 2))
          (LETT |Lpval| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|SMP;evalSortedVarlist| |x1| |Lvar| |Lpval| $))))) 

(SDEFUN |SMP;eval;$LL$;69|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lpval| |List| $) ($ $))
        (SPROG
         ((|nlpval| (|List| $)) (#1=#:G824 NIL) (|mvar| NIL) (#2=#:G823 NIL)
          (|nlvar| (|List| |VarSet|)))
         (SEQ
          (COND
           ((OR (NULL (CDR |Lvar|))
                (SPADCALL (ELT $ 68) |Lvar| (QREFELT $ 180)))
            (|SMP;evalSortedVarlist| |p| |Lvar| |Lpval| $))
           ('T
            (SEQ (LETT |nlvar| (SPADCALL (ELT $ 68) |Lvar| (QREFELT $ 181)))
                 (LETT |nlpval|
                       (COND
                        ((SPADCALL |Lvar| |nlvar| (QREFELT $ 182)) |Lpval|)
                        ('T
                         (LETT |nlpval|
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |mvar| NIL) (LETT #1# |nlvar|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |mvar| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |Lpval|
                                                        (SPADCALL |mvar| |Lvar|
                                                                  (QREFELT $
                                                                           183))
                                                        (QREFELT $ 184))
                                              #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))))))
                 (EXIT (|SMP;evalSortedVarlist| |p| |nlvar| |nlpval| $)))))))) 

(SDEFUN |SMP;eval;$LL$;70|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lval| |List| R) ($ $))
        (SPROG ((#1=#:G828 NIL) (|val| NIL) (#2=#:G827 NIL))
               (SEQ
                (SPADCALL |p| |Lvar|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |val| NIL) (LETT #1# |Lval|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |val| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #2# (CONS (CONS 0 |val|) #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 185))))) 

(SDEFUN |SMP;degree;$VarSetNni;71|
        ((|p| $) (|mvar| |VarSet|) ($ |NonNegativeInteger|))
        (COND ((QEQCAR |p| 0) 0)
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54))
               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40)))
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68)) 0)
              ('T
               (MAX
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)) |mvar|
                          (QREFELT $ 187))
                (SPADCALL (|SMP;red| |p| $) |mvar| (QREFELT $ 187)))))) 

(SDEFUN |SMP;degree;$LL;72|
        ((|p| $) (|Lvar| |List| |VarSet|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G838 NIL) (|mvar| NIL) (#2=#:G837 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |mvar| NIL) (LETT #1# |Lvar|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |mvar| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT $ 187))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;degree;$Ie;73| ((|p| $) ($ |IndexedExponents| |VarSet|))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 190))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                          (QREFELT $ 191))
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40))
                          (QCAR (QCDR |p|)) (QREFELT $ 192))
                (QREFELT $ 193))))) 

(SDEFUN |SMP;minimumDegree;$Ie;74| ((|p| $) ($ |IndexedExponents| |VarSet|))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 190))
                      ('T
                       (SEQ
                        (LETT |md|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 194)))
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) |md| (QREFELT $ 77))
                           (QREFELT $ 195))
                          (SPADCALL |md| (QCAR (QCDR |p|)) (QREFELT $ 192))
                          (QREFELT $ 193))))))))) 

(SDEFUN |SMP;minimumDegree;$VarSetNni;75|
        ((|p| $) (|mvar| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG ((|p1| ($)) (|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) 0)
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54))
                       (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 194)))
                      (#1='T
                       (SEQ
                        (LETT |md|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                               |mvar| (QREFELT $ 196)))
                        (LETT |p1| (|SMP;red| |p| $))
                        (EXIT
                         (COND ((SPADCALL |p1| (QREFELT $ 18)) |md|)
                               (#1#
                                (MIN |md|
                                     (SPADCALL |p1| |mvar|
                                               (QREFELT $ 196)))))))))))) 

(SDEFUN |SMP;minimumDegree;$LL;76|
        ((|p| $) (|Lvar| |List| |VarSet|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G857 NIL) (|mvar| NIL) (#2=#:G856 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |mvar| NIL) (LETT #1# |Lvar|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |mvar| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT $ 196))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;differentiate;$VarSet$;77| ((|p| $) (|mvar| |VarSet|) ($ $))
        (SPROG ((|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 54))
                       (SEQ
                        (LETT |up|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 198)))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 23))
                           (SPADCALL |up| (QREFELT $ 24)))
                          (#1='T (CONS 1 (CONS |mvar| |up|)))))))
                      (#1#
                       (SEQ
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;differentiate;$VarSet$;77!0|
                                     (VECTOR $ |mvar|))
                               (QCDR (QCDR |p|)) (QREFELT $ 58)))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 23))
                           (SPADCALL |up| (QREFELT $ 24)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |up|))))))))))) 

(SDEFUN |SMP;differentiate;$VarSet$;77!0| ((|x1| NIL) ($$ NIL))
        (PROG (|mvar| $)
          (LETT |mvar| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |mvar| (QREFELT $ 199)))))) 

(SDEFUN |SMP;leadingCoefficient;$R;78| ((|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                         (QREFELT $ 37))))) 

(SDEFUN |SMP;leadingMonomial;2$;79| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                          (QREFELT $ 200))
                (QCAR (QCDR |p|)) (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40))
                (QREFELT $ 64))))) 

(SDEFUN |SMP;reductum;2$;80| ((|p| $) ($ $))
        (SPROG ((|ptr| (D)) (|rlc| ($)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
                      (#1='T
                       (SEQ
                        (LETT |rlc|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                               (QREFELT $ 201)))
                        (LETT |ptr|
                              (SPADCALL
                               (SPADCALL |rlc|
                                         (SPADCALL (QCDR (QCDR |p|))
                                                   (QREFELT $ 40))
                                         (QREFELT $ 29))
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                               (QREFELT $ 59)))
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |ptr| (QREFELT $ 40)) 0)
                           (SPADCALL |ptr| (QREFELT $ 202)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |ptr|))))))))))) 

(SDEFUN |SMP;monomials1|
        ((|p| |VPoly|) (|vars| . #1=(|List| |VarSet|))
         (|degs| . #2=(|List| (|NonNegativeInteger|))) (|res| |List| $)
         ($ |List| $))
        (SPROG
         ((|degs1| #2#) (|vars1| #1#) (|mon| ($))
          (|mon1|
           #3=(|Record| (|:| |k| #4=(|NonNegativeInteger|)) (|:| |c| $)))
          (#5=#:G890 NIL) (|var| NIL) (#6=#:G891 NIL) (|deg| NIL) (|k1| #4#)
          (|p1| ($)) (#7=#:G889 NIL) (|t| NIL) (|v1| (|VarSet|))
          (|tl| (|List| #3#)))
         (SEQ (LETT |tl| (QCDR |p|)) (LETT |v1| (QCAR |p|))
              (SEQ (LETT |t| NIL) (LETT #7# |tl|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |t| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |p1| (QCDR |t|)) (LETT |k1| (QCAR |t|))
                        (EXIT
                         (COND
                          ((QEQCAR |p1| 0)
                           (SEQ
                            (LETT |mon|
                                  (COND
                                   ((> |k1| 0) (CONS 1 (CONS |v1| (LIST |t|))))
                                   ('T |p1|)))
                            (SEQ (LETT |deg| NIL) (LETT #6# |degs|)
                                 (LETT |var| NIL) (LETT #5# |vars|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |var| (CAR #5#)) NIL)
                                       (ATOM #6#)
                                       (PROGN (LETT |deg| (CAR #6#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |mon1| (CONS |deg| |mon|))
                                      (EXIT
                                       (LETT |mon|
                                             (CONS 1
                                                   (CONS |var|
                                                         (LIST |mon1|))))))
                                 (LETT #5#
                                       (PROG1 (CDR #5#) (LETT #6# (CDR #6#))))
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL |mon| |res| (QREFELT $ 203))))))
                          ('T
                           (SEQ
                            (LETT |vars1|
                                  (COND ((> |k1| 0) (CONS |v1| |vars|))
                                        ('T |vars|)))
                            (LETT |degs1|
                                  (COND ((> |k1| 0) (CONS |k1| |degs|))
                                        ('T |degs|)))
                            (EXIT
                             (LETT |res|
                                   (|SMP;monomials1| (QCDR |p1|) |vars1|
                                    |degs1| |res| $))))))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SMP;monomials;$L;82| ((|p| $) ($ |List| $))
        (COND ((SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 32)) NIL)
              ((QEQCAR |p| 0) (LIST |p|))
              ('T
               (SPADCALL (|SMP;monomials1| (QCDR |p|) NIL NIL NIL $)
                         (QREFELT $ 204))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomial;|)) 

(DEFUN |SparseMultivariatePolynomial| (&REST #1=#:G926)
  (SPROG NIL
         (PROG (#2=#:G927)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariatePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariatePolynomial|)))))))))) 

(DEFUN |SparseMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G925 NIL) (|pv$| NIL) (#2=#:G917 NIL) (#3=#:G918 NIL) (#4=#:G919 NIL)
    (#5=#:G920 NIL) (#6=#:G921 NIL) (#7=#:G922 NIL) (#8=#:G923 NIL)
    (#9=#:G924 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|SparseMultivariatePolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 235))
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
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #9#)
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
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #8# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #8# #9# #7#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #9# #7#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #8# #9# #7#)
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
                                         #8#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #9# #7#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))))
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
                                          #9#
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
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))))
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
                                          #9#
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
                                         #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))))
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
                                          #9#
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
                                         #4#)
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))))
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
                                          #9#
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
                                         #3#)
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 549755813888))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 1099511627776))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 2199023255552))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4398046511104))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #9#
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 17592186044416))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR #2# (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 562949953421312))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|SparseUnivariatePolynomial| $))
    (QSETREFV $ 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT $ 8))))
    (QSETREFV $ 10 (|Union| |#1| (QREFELT $ 9)))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV $ 14
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |SMP;One;$;2|) $ 14)))))
    (QSETREFV $ 15
              (COND
               ((|HasCategory| |#1| '(|SemiRing|))
                (QCDR (|spadConstant| $ 14)))
               ('T (QCDR (|spadConstant| $ 12)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV $ 21 (CONS (|dispatchFunction| |SMP;one?;$B;4|) $))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV $ 30 (CONS (|dispatchFunction| |SMP;coerce;VarSet$;7|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 81 (CONS (|dispatchFunction| |SMP;coerce;I$;22|) $))
       (QSETREFV $ 83
                 (CONS (|dispatchFunction| |SMP;characteristic;Nni;23|) $)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV $ 87 (CONS (|dispatchFunction| |SMP;recip;$U;25|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 90 (CONS (|dispatchFunction| |SMP;-;2$;26|) $))
       (QSETREFV $ 93 (CONS (|dispatchFunction| |SMP;*;I2$;27|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 101 (CONS (|dispatchFunction| |SMP;-;3$;30|) $))))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (QSETREFV $ 119 (CONS (|dispatchFunction| |SMP;unitNormal;$R;37|) $))
       (QSETREFV $ 121 (CONS (|dispatchFunction| |SMP;unitCanonical;2$;38|) $))
       (QSETREFV $ 123 (CONS (|dispatchFunction| |SMP;unit?;$B;39|) $))
       (QSETREFV $ 126 (CONS (|dispatchFunction| |SMP;associates?;2$B;40|) $))
       (COND
        ((|HasCategory| |#1| '(|Approximate|))
         (QSETREFV $ 129 (CONS (|dispatchFunction| |SMP;exquo;2$U;41|) $)))
        ('T
         (QSETREFV $ 129 (CONS (|dispatchFunction| |SMP;exquo;2$U;42|) $)))))))
    (COND
     ((|testBitVector| |pv$| 18)
      (QSETREFV $ 133 (CONS (|dispatchFunction| |SMP;/;$R$;44|) $))))
    (COND
     ((|testBitVector| |pv$| 14)
      (QSETREFV $ 135 (CONS (|dispatchFunction| |SMP;content;$R;45|) $))))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|testBitVector| |pv$| 3)
        (COND
         ((|HasCategory| |#1| '(|FloatingPointSystem|))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV $ 138
                       (CONS (|dispatchFunction| |SMP;content;$VarSet$;46|) $))
             (QSETREFV $ 139 (CONS (|dispatchFunction| |SMP;gcd;3$;47|) $))
             (COND
              ((|HasCategory| |#1| '(|FloatingPointSystem|))
               (QSETREFV $ 147
                         (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;48|)
                               $))))))))
         ('T
          (PROGN
           (QSETREFV $ 138
                     (CONS (|dispatchFunction| |SMP;content;$VarSet$;49|) $))
           (QSETREFV $ 139 (CONS (|dispatchFunction| |SMP;gcd;3$;50|) $))
           (QSETREFV $ 152 (CONS (|dispatchFunction| |SMP;gcd;L$;51|) $))
           (QSETREFV $ 147
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;52|)
                           $))))))
       ((|testBitVector| |pv$| 14)
        (PROGN
         (QSETREFV $ 138
                   (CONS (|dispatchFunction| |SMP;content;$VarSet$;53|) $))
         (QSETREFV $ 139 (CONS (|dispatchFunction| |SMP;gcd;3$;54|) $))
         (COND
          ((|HasCategory| |#1| '(|FloatingPointSystem|))
           (QSETREFV $ 147
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;55|)
                           $))))))))
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV $ 138 (CONS (|dispatchFunction| |SMP;content;$VarSet$;56|) $))
       (QSETREFV $ 139 (CONS (|dispatchFunction| |SMP;gcd;3$;57|) $))
       (COND
        ((|HasCategory| |#1| '(|FloatingPointSystem|))
         (QSETREFV $ 147
                   (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;58|)
                         $)))))))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV $ 199
                (CONS (|dispatchFunction| |SMP;differentiate;$VarSet$;77|)
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
              (63 . |monomial?|) |SMP;=;2$B;31| |SMP;monomial?;$B;9|
              |SMP;ground?;$B;18| (|Mapping| 16 $$) (68 . |any?|)
              |SMP;leadingCoefficient;$R;78| (|SparseUnivariatePolynomial| 6)
              (74 . |coerce|) (79 . |degree|) (84 . |monomial|) (90 . +)
              (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 8 6 38) (96 . |map|)
              |SMP;univariate;$Sup;12| (102 . |ground?|)
              (107 . |leadingCoefficient|) (112 . |degree|) (117 . |reductum|)
              |SMP;multivariate;SupVarSet$;13| |SMP;+;3$;29| (122 . <)
              (128 . =) (|SparseUnivariatePolynomial| $)
              |SMP;univariate;$VarSetSup;15| (|Mapping| $$ $$) (134 . |map|)
              (140 . +) (|SparseUnivariatePolynomial| $$) (146 . |degree|)
              (151 . |coefficient|) (157 . |leadingCoefficient|)
              |SMP;monomial;$VarSetNni$;19| (162 . |reductum|)
              (167 . |ground?|) (172 . |zero?|) (177 . >)
              |SMP;multivariate;SupVarSet$;17| (183 . |shiftLeft|)
              (|IndexedExponents| 7) (189 . |zero?|) (194 . |reductum|)
              |SMP;monomial;RIe$;20| (199 . |leadingCoefficient|)
              (204 . |leadingSupport|) (209 . |coefficient|)
              |SMP;coefficient;$IeR;21| (|Integer|) (215 . |coerce|)
              (220 . |coerce|) (225 . |characteristic|)
              (229 . |characteristic|) |SMP;coerce;R$;24| (|Union| $ '"failed")
              (233 . |recip|) (238 . |recip|) (243 . -) (248 . -) (253 . -)
              (258 . *) (264 . *) (270 . *) (276 . *) (282 . *) |SMP;*;R2$;28|
              (288 . +) (294 . |coerce|) (299 . -) (305 . -) (311 . -)
              (317 . =) (323 . *) (329 . *) |SMP;*;3$;32| (|PositiveInteger|)
              (335 . ^) (341 . ^) (347 . ^) |SMP;^;$Nni$;34| |SMP;^;$Pi$;35|
              (|HashState|) (353 . |hashUpdate!|) (359 . |hashUpdate!|)
              (365 . |hashUpdate!|) |SMP;hashUpdate!;Hs$Hs;36|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (371 . |unitNormal|) (376 . |unitNormal|) (381 . |unitCanonical|)
              (386 . |unitCanonical|) (391 . |unit?|) (396 . |unit?|)
              (401 . |associates?|) (407 . |associates?|) (413 . |associates?|)
              (419 . |exquo|) (425 . |exquo|) (431 . |exquo|) (|Mapping| 6 6)
              |SMP;map;M2$;43| (437 . |inv|) (442 . /) (448 . |zero?|)
              (453 . |content|) (458 . |gcd|) (464 . |content|)
              (469 . |content|) (475 . |gcd|) (481 . |gcd|) (487 . |content|)
              (492 . |coerce|) (497 . |minimumDegree|) (502 . ~=)
              (508 . |exquo|) (514 . *) (520 . |gcdPolynomial|)
              (|PolynomialGcdPackage| 71 7 6 $$) (526 . |gcd|) (531 . |gcd|)
              (|List| $) (537 . |gcd|) (542 . |gcd|) (|OutputForm|)
              (548 . |coerce|) (553 . |coerce|) (558 . |outputForm|)
              |SMP;coerce;$Of;59| (|List| 6) (564 . |list|)
              |SMP;coefficients;$L;60| (569 . |append|) |SMP;retract;$R;61|
              (|Union| 6 '"failed") |SMP;retractIfCan;$U;62| (|List| 7)
              (575 . |setrest!|) |SMP;variables;$L;64| (|Union| 7 '"failed")
              |SMP;mainVariable;$U;65| (581 . |elt|) |SMP;eval;$VarSet2$;66|
              |SMP;eval;$VarSetR$;67| (587 . |empty?|) '"rest" (592 . |elt|)
              '"first" (598 . |elt|) (|Mapping| 16 7 7) (604 . |sorted?|)
              (610 . |sort|) (616 . =) (622 . |position|) (628 . |elt|)
              |SMP;eval;$LL$;69| |SMP;eval;$LL$;70| |SMP;degree;$VarSetNni;71|
              (|List| 27) |SMP;degree;$LL;72| (634 . |Zero|)
              |SMP;degree;$Ie;73| (638 . |monomial|) (644 . +)
              (650 . |minimumDegree|) |SMP;minimumDegree;$Ie;74|
              |SMP;minimumDegree;$VarSetNni;75| |SMP;minimumDegree;$LL;76|
              (655 . |differentiate|) (660 . |differentiate|)
              |SMP;leadingMonomial;2$;79| |SMP;reductum;2$;80| (666 . |ground|)
              (671 . |cons|) (677 . |reverse!|) |SMP;monomials;$L;82|
              (|Union| 213 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 79) (|Matrix| 79)
              (|Record| (|:| |mat| 211) (|:| |vec| (|Vector| 79))) (|Vector| $)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 79 $)
              (|Fraction| 79)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Factored| $) (|Factored| 55) (|Union| 221 '#1#) (|List| 55)
              (|Union| 216 '#2="failed") (|Union| 79 '#2#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |mat| 226) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Equation| $) (|List| 227) (|Union| 151 '#3="failed")
              (|Record| (|:| |var| 7) (|:| |exponent| 27)) (|Union| 230 '#3#)
              (|Mapping| 71 71) (|String|) (|SingleInteger|))
           '#(~= 682 |zero?| 688 |variables| 693 |univariate| 698 |unitNormal|
              709 |unitCanonical| 714 |unit?| 719 |totalDegreeSorted| 724
              |totalDegree| 730 |subtractIfCan| 741 |squareFreePolynomial| 747
              |squareFreePart| 752 |squareFree| 757
              |solveLinearPolynomialEquation| 762 |smaller?| 768 |sample| 774
              |rightRecip| 778 |rightPower| 783 |retractIfCan| 795 |retract|
              815 |resultant| 835 |reductum| 842 |reducedSystem| 847 |recip|
              869 |primitivePart| 874 |primitiveMonomials| 885 |prime?| 890
              |pomopo!| 895 |patternMatch| 903 |opposite?| 917 |one?| 923
              |numberOfMonomials| 928 |multivariate| 933 |monomials| 945
              |monomial?| 950 |monomial| 955 |monicDivide| 975 |minimumDegree|
              982 |mapExponents| 999 |map| 1005 |mainVariable| 1011 |leftRecip|
              1016 |leftPower| 1021 |leadingMonomial| 1033 |leadingCoefficient|
              1038 |lcmCoef| 1043 |lcm| 1049 |latex| 1060 |isTimes| 1065
              |isPlus| 1070 |isExpt| 1075 |hashUpdate!| 1080 |hash| 1086
              |ground?| 1091 |ground| 1096 |gcdPolynomial| 1101 |gcd| 1107
              |fmecg| 1118 |factorSquareFreePolynomial| 1126 |factorPolynomial|
              1131 |factor| 1136 |exquo| 1141 |eval| 1153 |discriminant| 1207
              |differentiate| 1213 |degree| 1239 |convert| 1256 |content| 1271
              |conditionP| 1282 |commutator| 1287 |coerce| 1293 |coefficients|
              1323 |coefficient| 1328 |charthRoot| 1348 |characteristic| 1353
              |binomThmExpt| 1357 |associator| 1364 |associates?| 1371
              |antiCommutator| 1377 |annihilate?| 1383 ^ 1389 |Zero| 1401 |One|
              1405 D 1409 = 1435 / 1441 - 1447 + 1458 * 1464)
           'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 0 10 0 10 0 15 25 4 24 14 1 2 3 22 4 9 26
                                  16 4 27 12 27 0 1 22 26 0 0 1 4 0 0 0 0 1 1
                                  27 11 39 12 12 0 0 38 12 0 0 8 29 31 0 0 26
                                  12 0 0 0 0 0 0 4 5 6 7 26 13 33 35 17 12 12))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitOver&| NIL NIL |Algebra&| NIL NIL
                |Algebra&| NIL NIL |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&|
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |Magma&| |AbelianSemiGroup&| NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| NIL |Evalable&| NIL
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| |BasicType&|
                NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL
                NIL |InnerEvalable&| |RetractableTo&|)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|FullyLinearlyExplicitOver| 6)
                 (|CommutativeRing|) (|LeftOreRing|) (|Algebra| 216)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 79)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 7)
                 (|Ring|) (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 216)
                 (|Module| 6) (|Module| $$) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 216 216) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 216) (|RightModule| 216) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 79) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|CommutativeStar|) (|Evalable| $$)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 7 $$)
                 (|InnerEvalable| 7 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 154) (|unitsKnown|) (|RetractableTo| 216)
                 (|RetractableTo| 79) (|canonicalUnitNormal|) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|ConvertibleTo| 209) (|ConvertibleTo| 210)
                 (|ConvertibleTo| 208) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 7))
              (|makeByteWordVec2| 234
                                  '(0 6 0 11 0 6 0 13 0 0 0 14 1 6 16 0 17 0 8
                                    0 19 2 6 16 0 0 20 1 0 16 0 21 1 8 0 0 22 1
                                    8 16 0 23 1 8 2 0 24 1 8 25 0 26 2 8 0 2 27
                                    29 1 0 0 7 30 1 8 16 0 31 2 25 16 35 0 36 1
                                    38 0 6 39 1 8 27 0 40 2 38 0 6 27 41 2 38 0
                                    0 0 42 2 44 38 43 8 45 1 38 16 0 47 1 38 6
                                    0 48 1 38 27 0 49 1 38 0 0 50 2 7 16 0 0 53
                                    2 7 16 0 0 54 2 8 0 57 0 58 2 8 0 0 0 59 1
                                    60 27 0 61 2 60 2 0 27 62 1 60 2 0 63 1 60
                                    0 0 65 1 60 16 0 66 1 60 16 0 67 2 7 16 0 0
                                    68 2 8 0 0 27 70 1 71 16 0 72 1 71 0 0 73 1
                                    71 27 0 75 1 71 7 0 76 2 8 2 0 27 77 1 6 0
                                    79 80 1 0 0 79 81 0 6 27 82 0 0 27 83 1 6
                                    85 0 86 1 0 85 0 87 1 6 0 0 88 1 8 0 0 89 1
                                    0 0 0 90 2 6 0 79 0 91 2 8 0 79 0 92 2 0 0
                                    79 0 93 2 6 0 0 0 94 2 8 0 2 0 95 2 6 0 0 0
                                    97 1 8 0 2 98 2 6 0 0 0 99 2 8 0 0 0 100 2
                                    0 0 0 0 101 2 8 16 0 0 102 2 8 0 0 2 103 2
                                    8 0 0 0 104 2 6 0 0 106 107 2 38 0 0 27 108
                                    2 8 0 0 27 109 2 6 112 112 0 113 2 7 112
                                    112 0 114 2 8 112 112 0 115 1 6 117 0 118 1
                                    0 117 0 119 1 6 0 0 120 1 0 0 0 121 1 6 16
                                    0 122 1 0 16 0 123 2 6 16 0 0 124 2 8 16 0
                                    0 125 2 0 16 0 0 126 2 6 85 0 0 127 2 8 85
                                    0 0 128 2 0 85 0 0 129 1 6 0 0 132 2 0 0 0
                                    6 133 1 8 16 0 134 1 0 6 0 135 2 6 0 0 0
                                    136 1 8 2 0 137 2 0 0 0 7 138 2 0 0 0 0 139
                                    2 8 0 0 0 140 1 60 2 0 141 1 60 0 2 142 1
                                    60 27 0 143 2 60 16 0 0 144 2 60 85 0 0 145
                                    2 60 0 0 0 146 2 0 55 55 55 147 1 148 2 25
                                    149 2 148 2 2 2 150 1 0 0 151 152 2 148 60
                                    60 60 153 1 6 154 0 155 1 7 154 0 156 2 8
                                    154 0 154 157 1 159 0 6 160 2 159 0 0 0 162
                                    2 166 0 0 0 167 2 8 2 0 2 171 1 25 16 0 174
                                    2 25 0 0 175 176 2 25 2 0 177 178 2 166 16
                                    179 0 180 2 166 0 179 0 181 2 166 16 0 0
                                    182 2 166 79 7 0 183 2 25 2 0 79 184 0 71 0
                                    190 2 71 0 27 7 192 2 71 0 0 0 193 1 8 27 0
                                    194 1 8 0 0 198 2 0 0 0 7 199 1 8 2 0 202 2
                                    25 0 2 0 203 1 25 0 0 204 2 0 16 0 0 1 1 48
                                    16 0 18 1 0 166 0 168 1 0 38 0 46 2 0 55 0
                                    7 56 1 43 117 0 119 1 43 0 0 121 1 43 16 0
                                    123 2 0 27 0 166 1 2 0 27 0 166 1 1 0 27 0
                                    1 2 49 85 0 0 1 1 10 219 55 1 1 14 0 0 1 1
                                    14 218 0 1 2 10 220 221 55 1 2 8 16 0 0 1 0
                                    48 0 1 1 46 85 0 1 2 46 0 0 27 1 2 0 0 0
                                    106 1 1 5 222 0 1 1 6 223 0 1 1 12 169 0 1
                                    1 0 164 0 165 1 5 216 0 1 1 6 79 0 1 1 12 7
                                    0 1 1 0 6 0 163 3 21 0 0 0 7 1 1 0 0 0 201
                                    1 20 211 207 1 2 20 212 207 213 1 2 4 225
                                    207 213 1 1 4 226 207 1 1 46 85 0 87 2 14 0
                                    0 7 1 1 14 0 0 1 1 12 151 0 1 1 10 16 0 1 4
                                    0 0 0 6 71 0 1 3 28 214 0 209 214 1 3 30
                                    215 0 210 215 1 2 48 16 0 0 1 1 46 16 0 21
                                    1 0 27 0 28 2 0 0 38 7 51 2 0 0 55 7 69 1 0
                                    151 0 205 1 0 16 0 33 3 0 0 0 166 188 1 3 0
                                    0 0 7 27 64 2 0 0 6 71 74 3 4 224 0 0 7 1 2
                                    0 188 0 166 197 2 0 27 0 7 196 1 0 71 0 195
                                    2 0 0 232 0 1 2 0 0 130 0 131 1 0 169 0 170
                                    1 46 85 0 1 2 46 0 0 27 1 2 0 0 0 106 1 1 0
                                    0 0 200 1 0 6 0 37 2 14 217 0 0 1 2 14 0 0
                                    0 1 1 14 0 151 1 1 0 233 0 1 1 12 229 0 1 1
                                    0 229 0 1 1 12 231 0 1 2 0 112 112 0 116 1
                                    0 234 0 1 1 0 16 0 34 1 0 6 0 1 2 14 55 55
                                    55 147 1 14 0 151 152 2 14 0 0 0 139 4 4 0
                                    0 71 6 0 1 1 10 219 55 1 1 10 219 55 1 1 10
                                    218 0 1 2 43 85 0 0 129 2 13 85 0 6 1 3 12
                                    0 0 151 151 1 2 12 0 0 227 1 3 12 0 0 0 0 1
                                    2 12 0 0 228 1 3 0 0 0 166 151 185 3 0 0 0
                                    7 0 172 3 0 0 0 7 6 173 3 0 0 0 166 159 186
                                    2 21 0 0 7 1 2 4 0 0 166 1 2 4 0 0 7 199 3
                                    4 0 0 166 188 1 3 4 0 0 7 27 1 2 0 27 0 7
                                    187 2 0 188 0 166 189 1 0 71 0 191 1 17 208
                                    0 1 1 32 209 0 1 1 34 210 0 1 2 14 0 0 7
                                    138 1 14 6 0 135 1 41 206 207 1 2 47 0 0 0
                                    1 1 44 0 0 1 1 45 0 79 81 1 19 0 216 1 1 12
                                    0 7 30 1 0 0 6 84 1 0 154 0 158 1 0 159 0
                                    161 3 0 0 0 166 188 1 3 0 0 0 7 27 1 2 0 6
                                    0 71 78 1 42 85 0 1 0 47 27 83 3 40 0 0 0
                                    27 1 3 47 0 0 0 0 1 2 43 16 0 0 126 2 0 0 0
                                    0 1 2 47 16 0 0 1 2 46 0 0 27 110 2 0 0 0
                                    106 111 0 48 0 12 0 46 0 14 2 4 0 0 7 1 3 4
                                    0 0 7 27 1 2 4 0 0 166 1 3 4 0 0 166 188 1
                                    2 0 16 0 0 32 2 18 0 0 6 133 2 50 0 0 0 101
                                    1 50 0 0 90 2 0 0 0 0 52 2 50 0 79 0 93 2
                                    48 0 27 0 1 2 1 0 216 0 1 2 1 0 0 216 1 2 0
                                    0 0 6 1 2 0 0 6 0 96 2 0 0 0 0 105 2 0 0
                                    106 0 1)))))
           '|lookupComplete|)) 
