
(SDEFUN |SMP;Zero;%;1| ((% (%))) (CONS 0 (|spadConstant| % 11))) 

(SDEFUN |SMP;One;%;2| ((% (%))) (CONS 0 (|spadConstant| % 13))) 

(SDEFUN |SMP;zero?;%B;3| ((|p| (%)) (% (|Boolean|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 17))) ('T NIL))) 

(SDEFUN |SMP;one?;%B;4| ((|p| (%)) (% (|Boolean|)))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (QCDR |p|) (QCDR (|spadConstant| % 14)) (QREFELT % 20)))
         ('T NIL))) 

(SDEFUN |SMP;red| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) (|spadConstant| % 12))
              ((SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))
                         (QREFELT % 23))
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))
                         (QREFELT % 24)))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))))))) 

(SDEFUN |SMP;numberOfMonomials;%Nni;6| ((|p| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G118 NIL) (#2=#:G117 #3=(|NonNegativeInteger|)) (#4=#:G119 #3#)
          (#5=#:G121 NIL) (|q| NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND ((SPADCALL (QCDR |p|) (QREFELT % 17)) 0) (#6='T 1)))
           (#6#
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |q| NIL)
                  (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 26))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL |q| (QREFELT % 28)))
                     (COND (#1# (LETT #2# (+ #2# #4#)))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# 0)))))))) 

(SDEFUN |SMP;coerce;VarSet%;7| ((|mvar| (|VarSet|)) (% (%)))
        (CONS 1
              (CONS |mvar| (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 29))))) 

(SDEFUN |SMP;monomial1?| ((|p| (%)) (% (|Boolean|)))
        (SPROG ((|sup| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) 'T)
                      ('T
                       (SEQ (LETT |sup| (QCDR (QCDR |p|)))
                            (COND
                             ((NULL (SPADCALL |sup| (QREFELT % 31)))
                              (EXIT NIL)))
                            (EXIT
                             (|SMP;monomial1?| (SPADCALL |sup| (QREFELT % 24))
                              %)))))))) 

(SDEFUN |SMP;monomial?;%B;9| ((|p| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |p| (|spadConstant| % 12) (QREFELT % 32)) NIL)
              ('T (|SMP;monomial1?| |p| %)))) 

(SDEFUN |SMP;moreThanOneVariable?| ((|p| (%)) (% (|Boolean|)))
        (SPROG ((|q| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      (#1='T
                       (SEQ (LETT |q| (QCDR (QCDR |p|)))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (CONS #'|SMP;moreThanOneVariable?!0| %)
                                (SPADCALL |q| (QREFELT % 26)) (QREFELT % 36))
                               'T)
                              (#1# NIL))))))))) 

(SDEFUN |SMP;moreThanOneVariable?!0| ((|x1| NIL) (% NIL))
        (NULL (SPADCALL |x1| (QREFELT % 34)))) 

(SDEFUN |SMP;univariateKnown| ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT % 37)) (QREFELT % 39)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p| (QREFELT % 37))
                     (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))
                     (QREFELT % 41))
           (|SMP;univariateKnown| (|SMP;red| |p| %) %) (QREFELT % 42))))) 

(SDEFUN |SMP;univariate;%Sup;12|
        ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT % 37)) (QREFELT % 39)))
         ((|SMP;moreThanOneVariable?| |p| %) (|error| "not univariate"))
         ('T (SPADCALL (ELT % 37) (QCDR (QCDR |p|)) (QREFELT % 45))))) 

(SDEFUN |SMP;multivariate;SupVarSet%;13|
        ((|u| (|SparseUnivariatePolynomial| R)) (|var| (|VarSet|)) (% (%)))
        (COND
         ((SPADCALL |u| (QREFELT % 47)) (CONS 0 (SPADCALL |u| (QREFELT % 48))))
         ('T
          (SPADCALL
           (CONS 1
                 (CONS |var|
                       (SPADCALL (CONS 0 (SPADCALL |u| (QREFELT % 48)))
                                 (SPADCALL |u| (QREFELT % 49))
                                 (QREFELT % 29))))
           (SPADCALL (SPADCALL |u| (QREFELT % 50)) |var| (QREFELT % 51))
           (QREFELT % 52))))) 

(SDEFUN |SMP;mon_mul|
        ((|p| (%)) (|var| (|VarSet|)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|pt| (D)))
               (SEQ (LETT |pt| (SPADCALL |p| |n| (QREFELT % 29)))
                    (EXIT (CONS 1 (CONS |var| |pt|)))))) 

(SDEFUN |SMP;univariate;%VarSetSup;15|
        ((|p| (%)) (|mvar| (|VarSet|)) (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|ulc| (D)) (|ulc0| (|SparseUnivariatePolynomial| %)) (|pt| (D)))
         (SEQ
          (COND
           ((OR (QEQCAR |p| 0)
                (SPADCALL (QCAR (QCDR |p|)) |mvar| (QREFELT % 53)))
            (SPADCALL |p| 0 (QREFELT % 29)))
           ('T
            (SEQ (LETT |pt| (QCDR (QCDR |p|)))
                 (EXIT
                  (COND
                   ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54)) |pt|)
                   ('T
                    (SEQ
                     (LETT |ulc0|
                           (SPADCALL (SPADCALL |pt| (QREFELT % 24)) |mvar|
                                     (QREFELT % 56)))
                     (LETT |ulc|
                           (SPADCALL
                            (CONS #'|SMP;univariate;%VarSetSup;15!0|
                                  (VECTOR % |pt| |p|))
                            |ulc0| (QREFELT % 58)))
                     (EXIT
                      (SPADCALL |ulc|
                                (SPADCALL (|SMP;red| |p| %) |mvar|
                                          (QREFELT % 56))
                                (QREFELT % 59))))))))))))) 

(SDEFUN |SMP;univariate;%VarSetSup;15!0| ((|c| NIL) ($$ NIL))
        (PROG (|p| |pt| %)
          (LETT |p| (QREFELT $$ 2))
          (LETT |pt| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|SMP;mon_mul| |c| (QCAR (QCDR |p|)) (SPADCALL |pt| (QREFELT % 40))
             %))))) 

(SDEFUN |SMP;unlikeUnivReconstruct|
        ((|u| (|SparseUnivariatePolynomial| %)) (|mvar| (|VarSet|)) (% (%)))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND
                ((ZEROP (LETT |d| (SPADCALL |u| (QREFELT % 61))))
                 (SPADCALL |u| 0 (QREFELT % 62)))
                ('T
                 (SPADCALL
                  (SPADCALL (SPADCALL |u| (QREFELT % 63)) |mvar| |d|
                            (QREFELT % 64))
                  (|SMP;unlikeUnivReconstruct| (SPADCALL |u| (QREFELT % 65))
                   |mvar| %)
                  (QREFELT % 52)))))) 

(SDEFUN |SMP;multivariate;SupVarSet%;17|
        ((|u| (|SparseUnivariatePolynomial| %)) (|mvar| (|VarSet|)) (% (%)))
        (SPROG
         ((#1=#:G162 NIL) (|uu| (|SparseUnivariatePolynomial| %)) (|cc| (%)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (QREFELT % 66)) (SPADCALL |u| 0 (QREFELT % 62)))
            ('T
             (SEQ (LETT |uu| |u|)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |uu| (QREFELT % 67))))
                         (GO G191)))
                       (SEQ (LETT |cc| (SPADCALL |uu| (QREFELT % 63)))
                            (COND
                             ((OR (QEQCAR |cc| 0)
                                  (SPADCALL |mvar| (QCAR (QCDR |cc|))
                                            (QREFELT % 68)))
                              (EXIT
                               (LETT |uu| (SPADCALL |uu| (QREFELT % 65))))))
                            (EXIT
                             (PROGN
                              (LETT #1#
                                    (|SMP;unlikeUnivReconstruct| |u| |mvar| %))
                              (GO #2=#:G161))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 1 (CONS |mvar| |u|)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SMP;construct;L%;18|
        ((|lt|
          (|List|
           (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R))))
         (% (%)))
        (SPROG ((|res| (%)) (#1=#:G170 NIL) (|t| NIL))
               (SEQ (LETT |res| (|spadConstant| % 12))
                    (SEQ (LETT |t| NIL) (LETT #1# |lt|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL (QCDR |t|) (QCAR |t|)
                                                     (QREFELT % 71))
                                           (QREFELT % 52)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SMP;constructOrdered;L%;19|
        ((|lt|
          (|List|
           (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R))))
         (% (%)))
        (SPADCALL |lt| (QREFELT % 74))) 

(SDEFUN |SMP;leadingSupport;%Ie;20|
        ((|p| (%)) (% (|IndexedExponents| |VarSet|)))
        (SPADCALL |p| (QREFELT % 76))) 

(SDEFUN |SMP;leadingTerm;%R;21|
        ((|p| (%))
         (% (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R))))
        (CONS (SPADCALL |p| (QREFELT % 76)) (SPADCALL |p| (QREFELT % 37)))) 

(SDEFUN |SMP;linearExtend;M%R;22|
        ((|f| (|Mapping| R (|IndexedExponents| |VarSet|))) (|p| (%)) (% (R)))
        (SPROG ((|res| (%)))
               (SEQ (LETT |res| (|spadConstant| % 12))
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |p| (QREFELT % 18))))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (SPADCALL
                                 (SPADCALL
                                  (CONS 0 (SPADCALL |p| (QREFELT % 37)))
                                  (CONS 0
                                        (SPADCALL (SPADCALL |p| (QREFELT % 76))
                                                  |f|))
                                  (QREFELT % 79))
                                 |res| (QREFELT % 52)))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 80)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (QCDR |res|))))) 

(SDEFUN |SMP;listOfTerms;%L;23|
        ((|p| (%))
         (%
          (|List|
           (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R)))))
         (SEQ (LETT |res| NIL)
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT % 18)))) (GO G191)))
                   (SEQ (LETT |res| (CONS (SPADCALL |p| (QREFELT % 78)) |res|))
                        (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 80)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |SMP;support;%L;24|
        ((|p| (%)) (% (|List| (|IndexedExponents| |VarSet|))))
        (SPROG ((|res| (|List| (|IndexedExponents| |VarSet|))))
               (SEQ (LETT |res| NIL)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |p| (QREFELT % 18))))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (CONS (SPADCALL |p| (QREFELT % 76)) |res|))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 80)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |res|))))) 

(SDEFUN |SMP;ground?;%B;25| ((|p| (%)) (% (|Boolean|)))
        (COND ((QEQCAR |p| 0) 'T) ('T NIL))) 

(SDEFUN |SMP;monomial;%VarSetNni%;26|
        ((|p| (%)) (|mvar| (|VarSet|)) (|k1| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|pt1| (D)) (|pt| (D)))
               (SEQ
                (COND ((OR (ZEROP |k1|) (SPADCALL |p| (QREFELT % 18))) |p|)
                      ((OR (QEQCAR |p| 0)
                           (SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 68)))
                       (CONS 1
                             (CONS |mvar| (SPADCALL |p| |k1| (QREFELT % 29)))))
                      ('T
                       (SEQ (LETT |pt| (QCDR (QCDR |p|)))
                            (LETT |pt1|
                                  (COND
                                   ((SPADCALL |mvar| (QCAR (QCDR |p|))
                                              (QREFELT % 53))
                                    (SPADCALL
                                     (CONS #'|SMP;monomial;%VarSetNni%;26!0|
                                           (VECTOR % |k1| |mvar|))
                                     |pt| (QREFELT % 58)))
                                   ('T (SPADCALL |pt| |k1| (QREFELT % 86)))))
                            (EXIT (CONS 1 (CONS (QCAR (QCDR |p|)) |pt1|))))))))) 

(SDEFUN |SMP;monomial;%VarSetNni%;26!0| ((|c| NIL) ($$ NIL))
        (PROG (|mvar| |k1| %)
          (LETT |mvar| (QREFELT $$ 2))
          (LETT |k1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |mvar| |k1| (QREFELT % 64)))))) 

(SDEFUN |SMP;monomial;RIe%;27|
        ((|c| (R)) (|e| (|IndexedExponents| |VarSet|)) (% (%)))
        (SPROG ((|m1| (D)) (|p1| (%)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT % 87)) (CONS 0 |c|))
                      ('T
                       (SEQ
                        (LETT |p1|
                              (SPADCALL |c| (SPADCALL |e| (QREFELT % 88))
                                        (QREFELT % 71)))
                        (LETT |m1|
                              (SPADCALL |p1| (SPADCALL |e| (QREFELT % 89))
                                        (QREFELT % 29)))
                        (EXIT
                         (CONS 1
                               (CONS (SPADCALL |e| (QREFELT % 90)) |m1|))))))))) 

(SDEFUN |SMP;coefficient;%IeR;28|
        ((|p| (%)) (|e| (|IndexedExponents| |VarSet|)) (% (R)))
        (SPROG ((|vp| (|VarSet|)) (|ve| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |e| (QREFELT % 87))
                  (COND ((QEQCAR |p| 0) (QCDR |p|))
                        (#1='T
                         (SPADCALL
                          (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT % 91)) |e|
                          (QREFELT % 92)))))
                 ((QEQCAR |p| 0) (QCDR (|spadConstant| % 12)))
                 (#1#
                  (SEQ (LETT |ve| (SPADCALL |e| (QREFELT % 90)))
                       (LETT |vp| (QCAR (QCDR |p|)))
                       (EXIT
                        (COND
                         ((SPADCALL |ve| |vp| (QREFELT % 53))
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT % 91)) |e|
                           (QREFELT % 92)))
                         ((SPADCALL |ve| |vp| (QREFELT % 68))
                          (QCDR (|spadConstant| % 12)))
                         (#1#
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|))
                                     (SPADCALL |e| (QREFELT % 89))
                                     (QREFELT % 91))
                           (SPADCALL |e| (QREFELT % 88))
                           (QREFELT % 92))))))))))) 

(SDEFUN |SMP;coerce;I%;29| ((|n| (|Integer|)) (% (%)))
        (CONS 0 (SPADCALL |n| (QREFELT % 94)))) 

(SDEFUN |SMP;characteristic;Nni;30| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 96))) 

(PUT '|SMP;coerce;R%;31| '|SPADreplace| '(XLAM (|c|) (CONS 0 |c|))) 

(SDEFUN |SMP;coerce;R%;31| ((|c| (R)) (% (%))) (CONS 0 |c|)) 

(SDEFUN |SMP;recip;%U;32| ((|p| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|uu| (|Union| R #1#)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (SEQ (LETT |uu| (SPADCALL (QCDR |p|) (QREFELT % 100)))
                       (EXIT
                        (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                              (#2='T (CONS 0 (CONS 0 (QCDR |uu|))))))))
                 (#2# (CONS 1 "failed")))))) 

(SDEFUN |SMP;-;2%;33| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT % 102))))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 103))))))) 

(SDEFUN |SMP;*;I2%;34| ((|n| (|Integer|)) (|p| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT % 105))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                       (LETT |up|
                             (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT % 106)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT % 23))
                          (SPADCALL |up| (QREFELT % 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;*;R2%;35| ((|c| (R)) (|p| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |c| (QCDR (|spadConstant| % 12)) (QREFELT % 20))
                  (|spadConstant| % 12))
                 ((SPADCALL |c| (QREFELT % 15) (QREFELT % 20)) |p|)
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |c| (QCDR |p|) (QREFELT % 108))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                       (LETT |up|
                             (SPADCALL (CONS 0 |c|) (QCDR (QCDR |p|))
                                       (QREFELT % 109)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT % 23))
                          (SPADCALL |up| (QREFELT % 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;+;3%;36| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT % 111))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT % 112))
                                         (QCDR (QCDR |p2|)) (QREFELT % 59)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT % 112))
                                         (QREFELT % 59)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 54))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT % 59)))
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT % 23))
                             (SPADCALL |up| (QREFELT % 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 53))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT % 112))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT % 59)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT % 112))
                                           (QREFELT % 59)))))))))))) 

(SDEFUN |SMP;-;3%;37| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT % 113))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT % 112))
                                         (QCDR (QCDR |p2|)) (QREFELT % 114)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT % 112))
                                         (QREFELT % 114)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 54))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT % 114)))
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT % 23))
                             (SPADCALL |up| (QREFELT % 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 53))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT % 112))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT % 114)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT % 112))
                                           (QREFELT % 114)))))))))))) 

(SDEFUN |SMP;=;2%B;38| ((|p1| (%)) (|p2| (%)) (% (|Boolean|)))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 20)))
           (#1='T NIL)))
         ((QEQCAR |p2| 0) NIL)
         (#1#
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT % 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT % 116)))
           (#1# NIL))))) 

(SDEFUN |SMP;*;3%;39| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT % 110)))
                 ((QEQCAR |p2| 0)
                  (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                       (QREFELT % 117)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT % 23))
                          (SPADCALL |up| (QREFELT % 24)))
                         (#1='T (CONS 1 (CONS |mvar| |up|)))))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 54))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 118)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|)))))))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                         (QREFELT % 117)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|)))))))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p2|)))
                         (LETT |up|
                               (SPADCALL |p1| (QCDR (QCDR |p2|))
                                         (QREFELT % 109)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;pow_aux| ((|p| (%)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)) (|kp| (|PositiveInteger|)))
               (SEQ
                (COND ((EQL |k| 0) (CONS 0 (QREFELT % 15)))
                      (#1='T
                       (SEQ (LETT |kp| |k|)
                            (EXIT
                             (COND
                              ((QEQCAR |p| 0)
                               (CONS 0
                                     (SPADCALL (QCDR |p|) |kp|
                                               (QREFELT % 119))))
                              ((NULL (|SMP;moreThanOneVariable?| |p| %))
                               (SPADCALL
                                (SPADCALL (|SMP;univariateKnown| |p| %) |kp|
                                          (QREFELT % 120))
                                (QCAR (QCDR |p|)) (QREFELT % 51)))
                              ('T
                               (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                                    (LETT |up|
                                          (SPADCALL (QCDR (QCDR |p|)) |kp|
                                                    (QREFELT % 121)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |up| (QREFELT % 23))
                                       (SPADCALL |up| (QREFELT % 24)))
                                      (#1#
                                       (CONS 1 (CONS |mvar| |up|))))))))))))))) 

(SDEFUN |SMP;^;%Nni%;41| ((|p| (%)) (|k| (|NonNegativeInteger|)) (% (%)))
        (|SMP;pow_aux| |p| |k| %)) 

(SDEFUN |SMP;^;%Pi%;42| ((|p| (%)) (|kp| (|PositiveInteger|)) (% (%)))
        (|SMP;pow_aux| |p| |kp| %)) 

(SDEFUN |SMP;hashUpdate!;Hs%Hs;43|
        ((|s| (|HashState|)) (|p| (%)) (% (|HashState|)))
        (SEQ
         (COND ((QEQCAR |p| 0) (SPADCALL |s| (QCDR |p|) (QREFELT % 126)))
               ('T
                (SEQ
                 (LETT |s| (SPADCALL |s| (QCAR (QCDR |p|)) (QREFELT % 127)))
                 (EXIT (SPADCALL |s| (QCDR (QCDR |p|)) (QREFELT % 128)))))))) 

(SDEFUN |SMP;triage| ((|p| (%)) (|q| (%)) (% #1=(|SingleInteger|)))
        (SPROG
         ((|qu| (D)) (|pu| (D)) (#2=#:G291 NIL) (|tr1| #1#) (|lcq| (%))
          (|lcp| (%)) (|dq| #3=(|NonNegativeInteger|)) (|dp| #3#)
          (|qv| (|VPoly|)) (|pv| (|VPoly|)))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR |p| 0)
             (COND
              ((QEQCAR |q| 0)
               (COND ((SPADCALL (QCDR |p|) (QCDR |q|) (QREFELT % 20)) 0)
                     ((SPADCALL (QCDR |p|) (QCDR |q|) (QREFELT % 130)) 1)
                     (#4='T -1)))
              ((SPADCALL (|spadConstant| % 11) (SPADCALL |q| (QREFELT % 37))
                         (QREFELT % 130))
               1)
              (#4# -1)))
            ((QEQCAR |q| 0)
             (COND
              ((SPADCALL (SPADCALL |p| (QREFELT % 37)) (|spadConstant| % 11)
                         (QREFELT % 130))
               1)
              (#4# -1)))
            (#4#
             (SEQ (LETT |pv| (QCDR |p|)) (LETT |qv| (QCDR |q|))
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR |pv|) (QCAR |qv|) (QREFELT % 53))
                     (COND
                      ((SPADCALL (|spadConstant| % 11)
                                 (SPADCALL |q| (QREFELT % 37)) (QREFELT % 130))
                       1)
                      (#4# -1)))
                    ((NULL (SPADCALL (QCAR |pv|) (QCAR |qv|) (QREFELT % 54)))
                     (COND
                      ((SPADCALL (SPADCALL |p| (QREFELT % 37))
                                 (|spadConstant| % 11) (QREFELT % 130))
                       1)
                      (#4# -1)))
                    ('T
                     (SEQ (LETT |pu| (QCDR |pv|)) (LETT |qu| (QCDR |qv|))
                          (EXIT
                           (SEQ G190 NIL
                                (SEQ (LETT |dp| (SPADCALL |pu| (QREFELT % 40)))
                                     (LETT |dq| (SPADCALL |qu| (QREFELT % 40)))
                                     (EXIT
                                      (COND
                                       ((< |dp| |dq|)
                                        (PROGN
                                         (LETT #2#
                                               (SEQ
                                                (LETT |lcq|
                                                      (SPADCALL |qu|
                                                                (QREFELT %
                                                                         24)))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (|spadConstant| % 11)
                                                    (SPADCALL |lcq|
                                                              (QREFELT % 37))
                                                    (QREFELT % 130))
                                                   1)
                                                  ('T -1)))))
                                         (GO #5=#:G290)))
                                       ((< |dq| |dp|)
                                        (PROGN
                                         (LETT #2#
                                               (SEQ
                                                (LETT |lcp|
                                                      (SPADCALL |pu|
                                                                (QREFELT %
                                                                         24)))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |lcp|
                                                              (QREFELT % 37))
                                                    (|spadConstant| % 11)
                                                    (QREFELT % 130))
                                                   1)
                                                  ('T -1)))))
                                         (GO #5#)))
                                       ('T
                                        (SEQ
                                         (LETT |lcp|
                                               (SPADCALL |pu| (QREFELT % 24)))
                                         (LETT |lcq|
                                               (SPADCALL |qu| (QREFELT % 24)))
                                         (LETT |tr1|
                                               (|SMP;triage| |lcp| |lcq| %))
                                         (COND
                                          ((|eql_SI| |tr1| 0)
                                           (COND
                                            ((EQL |dp| 0)
                                             (EXIT
                                              (PROGN
                                               (LETT #2# |tr1|)
                                               (GO #5#))))))
                                          ('T
                                           (EXIT
                                            (PROGN
                                             (LETT #2# |tr1|)
                                             (GO #5#)))))
                                         (LETT |pu|
                                               (SPADCALL |pu| (QREFELT % 22)))
                                         (EXIT
                                          (LETT |qu|
                                                (SPADCALL |qu|
                                                          (QREFELT %
                                                                   22)))))))))
                                NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |SMP;smaller?;2%B;45| ((|p| (%)) (|q| (%)) (% (|Boolean|)))
        (|eql_SI| (|SMP;triage| |p| |q| %) 1)) 

(SDEFUN |SMP;unitNormal;%R;46|
        ((|p| (%))
         (% (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G80|
           #1=(|Record| (|:| |unit| R) (|:| |canonical| R)
                        (|:| |associate| R)))
          (|#G79| #1#))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (SEQ
             (PROGN
              (LETT |#G79| (SPADCALL (QCDR |p|) (QREFELT % 133)))
              (LETT |u| (QVELT |#G79| 0))
              (LETT |c| (QVELT |#G79| 1))
              (LETT |a| (QVELT |#G79| 2))
              |#G79|)
             (EXIT (VECTOR (CONS 0 |u|) (CONS 0 |c|) (CONS 0 |a|)))))
           ('T
            (SEQ
             (PROGN
              (LETT |#G80|
                    (SPADCALL (SPADCALL |p| (QREFELT % 37)) (QREFELT % 133)))
              (LETT |u| (QVELT |#G80| 0))
              (LETT |c| (QVELT |#G80| 1))
              (LETT |a| (QVELT |#G80| 2))
              |#G80|)
             (EXIT
              (VECTOR (CONS 0 |u|) (SPADCALL |a| |p| (QREFELT % 110))
                      (CONS 0 |a|))))))))) 

(SDEFUN |SMP;unitCanonical;2%;47| ((|p| (%)) (% (%)))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G85|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R))))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT % 135))))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G85|
                         (SPADCALL (SPADCALL |p| (QREFELT % 37))
                                   (QREFELT % 133)))
                   (LETT |u| (QVELT |#G85| 0))
                   (LETT |c| (QVELT |#G85| 1))
                   (LETT |a| (QVELT |#G85| 2))
                   |#G85|)
                  (EXIT (SPADCALL |a| |p| (QREFELT % 110))))))))) 

(SDEFUN |SMP;unit?;%B;48| ((|p| (%)) (% (|Boolean|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 137))) ('T NIL))) 

(SDEFUN |SMP;associates?;2%B;49| ((|p1| (%)) (|p2| (%)) (% (|Boolean|)))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 139)))
           (#1='T NIL)))
         ((QEQCAR |p2| 1)
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT % 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT % 140)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |SMP;exquo;2%U;50| ((|p1| (%)) (|p2| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| %)) (|mvar| (|VarSet|))
          (|a| (|Union| D "failed")))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 142)))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#1='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT % 18))
                 (SPADCALL |p2| (|spadConstant| % 14) (QREFELT % 32)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #2="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT % 53))
                       (EXIT (CONS 1 #2#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT % 112))
                                  (QREFELT % 143)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (EXIT
               (COND
                ((SPADCALL |p1| |p2| (QREFELT % 32))
                 (CONS 0 (|spadConstant| % 14)))
                (#1#
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                  (QREFELT % 143)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                               (LETT |up| (QCDR |a|))
                               (EXIT
                                (COND
                                 ((SPADCALL |up| (QREFELT % 66))
                                  (CONS 0 (SPADCALL |up| (QREFELT % 63))))
                                 (#1#
                                  (CONS 0
                                        (CONS 1
                                              (CONS |mvar|
                                                    |up|))))))))))))))))))))) 

(SDEFUN |SMP;exquo;2%U;51| ((|p1| (%)) (|p2| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| %)) (|mvar| (|VarSet|))
          (|a| (|Union| D "failed")))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 142)))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#1='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT % 18))
                 (SPADCALL |p2| (|spadConstant| % 14) (QREFELT % 32)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #2="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT % 53))
                       (EXIT (CONS 1 #2#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT % 112))
                                  (QREFELT % 143)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                              (QREFELT % 143)))
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#1#
                      (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                           (LETT |up| (QCDR |a|))
                           (EXIT
                            (COND
                             ((SPADCALL |up| (QREFELT % 66))
                              (CONS 0 (SPADCALL |up| (QREFELT % 63))))
                             (#1#
                              (CONS 0 (CONS 1 (CONS |mvar| |up|))))))))))))))))) 

(SDEFUN |SMP;map;M2%;52| ((|fn| (|Mapping| R R)) (|p| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
                      (#1='T
                       (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                            (LETT |up|
                                  (SPADCALL
                                   (CONS #'|SMP;map;M2%;52!0| (VECTOR % |fn|))
                                   (QCDR (QCDR |p|)) (QREFELT % 58)))
                            (EXIT
                             (COND
                              ((SPADCALL |up| (QREFELT % 23))
                               (SPADCALL |up| (QREFELT % 24)))
                              (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;map;M2%;52!0| ((|x1| NIL) ($$ NIL))
        (PROG (|fn| %)
          (LETT |fn| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |fn| |x1| (QREFELT % 146)))))) 

(SDEFUN |SMP;/;%R%;53| ((|p| (%)) (|r| (R)) (% (%)))
        (SPADCALL (CONS 0 (SPADCALL |r| (QREFELT % 147))) |p| (QREFELT % 79))) 

(SDEFUN |SMP;content;%R;54| ((|p| (%)) (% (R)))
        (SPROG ((|up| (D)) (|c| (R)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ (LETT |c| (QCDR (|spadConstant| % 12)))
                            (LETT |up| (QCDR (QCDR |p|)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL
                                     (OR (SPADCALL |up| (QREFELT % 149))
                                         (SPADCALL |c|
                                                   (QCDR (|spadConstant| % 14))
                                                   (QREFELT % 20)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |c|
                                        (SPADCALL |c|
                                                  (SPADCALL
                                                   (SPADCALL |up|
                                                             (QREFELT % 24))
                                                   (QREFELT % 150))
                                                  (QREFELT % 151)))
                                  (EXIT
                                   (LETT |up| (SPADCALL |up| (QREFELT % 22)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |c|))))))) 

(SDEFUN |SMP;content;%VarSet%;55| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 152))))) 

(SDEFUN |SMP;gcd;3%;56| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 151))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 152))
                              (QREFELT % 154)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 152))
                                   (QREFELT % 154)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 152))
                              (QREFELT % 154)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 152))
                              |p2| (QREFELT % 154)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 155)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;57|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| %)) (#2=#:G382 NIL)
          (|monb| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|mona| (|SparseUnivariatePolynomial| %)) (|conta| (%)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 156)) (QREFELT % 154))
                    (QREFELT % 157)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 156)) (QREFELT % 154))
                    (QREFELT % 157)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 156)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 158))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 159))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 160)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 156)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 158))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 159))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 160)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 154))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 160)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 161)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 160)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 161)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;content;%VarSet%;58| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) (QREFELT % 26))
                (QREFELT % 164))))) 

(SDEFUN |SMP;gcd;3%;59| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 165))) 

(SDEFUN |SMP;gcd;L%;60| ((|lp| (|List| %)) (% (%)))
        (SPADCALL |lp| (QREFELT % 164))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;61|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPADCALL |a| |b| (QREFELT % 168))) 

(SDEFUN |SMP;content;%VarSet%;62| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 152))))) 

(SDEFUN |SMP;gcd;3%;63| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 151))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 152))
                              (QREFELT % 154)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 152))
                                   (QREFELT % 154)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 152))
                              (QREFELT % 154)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 152))
                              |p2| (QREFELT % 154)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 155)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;64|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| %)) (#2=#:G414 NIL)
          (|monb| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|mona| (|SparseUnivariatePolynomial| %)) (|conta| (%)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 156)) (QREFELT % 154))
                    (QREFELT % 157)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 156)) (QREFELT % 154))
                    (QREFELT % 157)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 156)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 158))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 159))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 160)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 156)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 158))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 159))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 160)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 154))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 160)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 161)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 160)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 161)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;content;%VarSet%;65| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 152))))) 

(SDEFUN |SMP;gcd;3%;66| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 151))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 152))
                              (QREFELT % 154)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 152))
                                   (QREFELT % 154)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 152))
                              (QREFELT % 154)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 152))
                              |p2| (QREFELT % 154)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 155)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;67|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| %)) (#2=#:G442 NIL)
          (|monb| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|mona| (|SparseUnivariatePolynomial| %)) (|conta| (%)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 156)) (QREFELT % 154))
                    (QREFELT % 157)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 156)) (QREFELT % 154))
                    (QREFELT % 157)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 156)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 158))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 159))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 160)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 156)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 158))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 159))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 160)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 154))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 160)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 161)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 160)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 161)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;coerce;%Of;68| ((|p| (%)) (% (|OutputForm|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 170)))
              ('T
               (SPADCALL (QCDR (QCDR |p|))
                         (SPADCALL (QCAR (QCDR |p|)) (QREFELT % 171))
                         (QREFELT % 172))))) 

(SDEFUN |SMP;coefficients;%L;69| ((|p| (%)) (% (|List| R)))
        (SPROG
         ((#1=#:G459 NIL) (#2=#:G458 #3=(|List| R)) (#4=#:G460 #3#)
          (#5=#:G462 NIL) (|p1| NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 175)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |p1| NIL)
                       (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 26)))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |p1| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (SPADCALL |p1| (QREFELT % 176)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 177))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |SMP;retract;%R;70| ((|p| (%)) (% (R)))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T (|error| "cannot retract nonconstant polynomial")))) 

(SDEFUN |SMP;retractIfCan;%U;71| ((|p| (%)) (% (|Union| R "failed")))
        (COND ((QEQCAR |p| 0) (CONS 0 (QCDR |p|))) ('T (CONS 1 "failed")))) 

(SDEFUN |SMP;mymerge|
        ((|l| (|List| |VarSet|)) (|m| (|List| |VarSet|)) (% (|List| |VarSet|)))
        (SEQ
         (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT % 54))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| (CDR |m|) (QREFELT % 182)) (EXIT |l|)))
                 ((NULL (CDR |m|)) |l|)
                 (#1='T
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) (CDR |m|) %)
                             (QREFELT % 182))
                   (EXIT |l|)))))
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT % 68))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| |m| (QREFELT % 182)) (EXIT |l|)))
                 (#1#
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) |m| %)
                             (QREFELT % 182))
                   (EXIT |l|)))))
               ((NULL (CDR |m|))
                (SEQ (SPADCALL |m| |l| (QREFELT % 182)) (EXIT |m|)))
               (#1#
                (SEQ
                 (SPADCALL |m| (|SMP;mymerge| |l| (CDR |m|) %) (QREFELT % 182))
                 (EXIT |m|)))))) 

(SDEFUN |SMP;variables;%L;73| ((|p| (%)) (% (|List| |VarSet|)))
        (SPROG ((|q| (D)) (|lv| (|List| |VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      ('T
                       (SEQ (LETT |lv| NIL) (LETT |q| (QCDR (QCDR |p|)))
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (SPADCALL |q| (QREFELT % 149))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |lv|
                                        (|SMP;mymerge| |lv|
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT % 24))
                                          (QREFELT % 183))
                                         %))
                                  (EXIT
                                   (LETT |q| (SPADCALL |q| (QREFELT % 22)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (CONS (QCAR (QCDR |p|)) |lv|)))))))) 

(SDEFUN |SMP;mainVariable;%U;74| ((|p| (%)) (% (|Union| |VarSet| "failed")))
        (COND ((QEQCAR |p| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QCAR (QCDR |p|)))))) 

(SDEFUN |SMP;eval;%VarSet2%;75|
        ((|p| (%)) (|mvar| (|VarSet|)) (|pval| (%)) (% (%)))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) |pval| (QREFELT % 186))) 

(SDEFUN |SMP;eval;%VarSetR%;76|
        ((|p| (%)) (|mvar| (|VarSet|)) (|val| (R)) (% (%)))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) (CONS 0 |val|)
                  (QREFELT % 186))) 

(SDEFUN |SMP;evalSortedVarlist|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lpval| (|List| %)) (% (%)))
        (SPROG ((|pts| (D)) (|pval| (%)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((OR (QEQCAR |p| 0)
                      (OR (NULL |Lvar|) (SPADCALL |Lpval| (QREFELT % 189))))
                  |p|)
                 ('T
                  (SEQ (LETT |mvar| (|SPADfirst| |Lvar|))
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 68))
                          (|SMP;evalSortedVarlist| |p| (CDR |Lvar|)
                           (SPADCALL |Lpval| '|rest| (QREFELT % 191)) %))
                         (#1='T
                          (SEQ
                           (LETT |pval|
                                 (SPADCALL |Lpval| '|first| (QREFELT % 193)))
                           (LETT |pts|
                                 (SPADCALL
                                  (CONS #'|SMP;evalSortedVarlist!0|
                                        (VECTOR % |Lpval| |Lvar|))
                                  (QCDR (QCDR |p|)) (QREFELT % 58)))
                           (EXIT
                            (COND
                             ((SPADCALL |mvar| (QCAR (QCDR |p|))
                                        (QREFELT % 54))
                              (COND
                               ((QEQCAR |pval| 0)
                                (SPADCALL |pts| (CONS 0 (QCDR |pval|))
                                          (QREFELT % 186)))
                               (#1# (SPADCALL |pts| |pval| (QREFELT % 186)))))
                             (#1#
                              (SPADCALL |pts| (QCAR (QCDR |p|))
                                        (QREFELT % 69))))))))))))))) 

(SDEFUN |SMP;evalSortedVarlist!0| ((|x1| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| %)
          (LETT |Lvar| (QREFELT $$ 2))
          (LETT |Lpval| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|SMP;evalSortedVarlist| |x1| |Lvar| |Lpval| %))))) 

(SDEFUN |SMP;eval;%LL%;78|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lpval| (|List| %)) (% (%)))
        (SPROG
         ((|nlpval| (|List| %)) (#1=#:G521 NIL) (|mvar| NIL) (#2=#:G520 NIL)
          (|nlvar| (|List| |VarSet|)))
         (SEQ
          (COND
           ((OR (NULL (CDR |Lvar|))
                (SPADCALL (ELT % 68) |Lvar| (QREFELT % 195)))
            (|SMP;evalSortedVarlist| |p| |Lvar| |Lpval| %))
           ('T
            (SEQ (LETT |nlvar| (SPADCALL (ELT % 68) |Lvar| (QREFELT % 196)))
                 (LETT |nlpval|
                       (COND
                        ((SPADCALL |Lvar| |nlvar| (QREFELT % 197)) |Lpval|)
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
                                                                  (QREFELT %
                                                                           198))
                                                        (QREFELT % 199))
                                              #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))))))
                 (EXIT (|SMP;evalSortedVarlist| |p| |nlvar| |nlpval| %)))))))) 

(SDEFUN |SMP;eval;%LL%;79|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lval| (|List| R)) (% (%)))
        (SPROG ((#1=#:G526 NIL) (|val| NIL) (#2=#:G525 NIL))
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
                          (QREFELT % 200))))) 

(SDEFUN |SMP;degree;%VarSetNni;80|
        ((|p| (%)) (|mvar| (|VarSet|)) (% (|NonNegativeInteger|)))
        (COND ((QEQCAR |p| 0) 0)
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40)))
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 68)) 0)
              ('T
               (MAX
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24)) |mvar|
                          (QREFELT % 202))
                (SPADCALL (|SMP;red| |p| %) |mvar| (QREFELT % 202)))))) 

(SDEFUN |SMP;degree;%LL;81|
        ((|p| (%)) (|Lvar| (|List| |VarSet|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G537 NIL) (|mvar| NIL) (#2=#:G536 NIL))
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
                              (CONS (SPADCALL |p| |mvar| (QREFELT % 202))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;degree;%Ie;82| ((|p| (%)) (% (|IndexedExponents| |VarSet|)))
        (COND ((QEQCAR |p| 0) (|spadConstant| % 205))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                          (QREFELT % 76))
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))
                          (QCAR (QCDR |p|)) (QREFELT % 206))
                (QREFELT % 207))))) 

(SDEFUN |SMP;minimumDegree;%Ie;83|
        ((|p| (%)) (% (|IndexedExponents| |VarSet|)))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 205))
                      ('T
                       (SEQ
                        (LETT |md|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 208)))
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) |md| (QREFELT % 91))
                           (QREFELT % 209))
                          (SPADCALL |md| (QCAR (QCDR |p|)) (QREFELT % 206))
                          (QREFELT % 207))))))))) 

(SDEFUN |SMP;minimumDegree;%VarSetNni;84|
        ((|p| (%)) (|mvar| (|VarSet|)) (% (|NonNegativeInteger|)))
        (SPROG ((|p1| (%)) (|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) 0)
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
                       (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 208)))
                      (#1='T
                       (SEQ
                        (LETT |md|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                               |mvar| (QREFELT % 210)))
                        (LETT |p1| (|SMP;red| |p| %))
                        (EXIT
                         (COND ((SPADCALL |p1| (QREFELT % 18)) |md|)
                               (#1#
                                (MIN |md|
                                     (SPADCALL |p1| |mvar|
                                               (QREFELT % 210)))))))))))) 

(SDEFUN |SMP;minimumDegree;%LL;85|
        ((|p| (%)) (|Lvar| (|List| |VarSet|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G557 NIL) (|mvar| NIL) (#2=#:G556 NIL))
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
                              (CONS (SPADCALL |p| |mvar| (QREFELT % 210))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;differentiate;%VarSet%;86| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (SPROG ((|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 12))
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
                       (SEQ
                        (LETT |up|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 212)))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT % 23))
                           (SPADCALL |up| (QREFELT % 24)))
                          (#1='T (CONS 1 (CONS |mvar| |up|)))))))
                      (#1#
                       (SEQ
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;differentiate;%VarSet%;86!0|
                                     (VECTOR % |mvar|))
                               (QCDR (QCDR |p|)) (QREFELT % 58)))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT % 23))
                           (SPADCALL |up| (QREFELT % 24)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |up|))))))))))) 

(SDEFUN |SMP;differentiate;%VarSet%;86!0| ((|x1| NIL) ($$ NIL))
        (PROG (|mvar| %)
          (LETT |mvar| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |mvar| (QREFELT % 213)))))) 

(SDEFUN |SMP;leadingCoefficient;%R;87| ((|p| (%)) (% (R)))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                         (QREFELT % 37))))) 

(SDEFUN |SMP;leadingMonomial;2%;88| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                          (QREFELT % 214))
                (QCAR (QCDR |p|)) (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))
                (QREFELT % 64))))) 

(SDEFUN |SMP;reductum;2%;89| ((|p| (%)) (% (%)))
        (SPROG ((|ptr| (D)) (|rlc| (%)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 12))
                      (#1='T
                       (SEQ
                        (LETT |rlc|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                               (QREFELT % 80)))
                        (LETT |ptr|
                              (SPADCALL
                               (SPADCALL |rlc|
                                         (SPADCALL (QCDR (QCDR |p|))
                                                   (QREFELT % 40))
                                         (QREFELT % 29))
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))
                               (QREFELT % 59)))
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |ptr| (QREFELT % 40)) 0)
                           (SPADCALL |ptr| (QREFELT % 215)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |ptr|))))))))))) 

(SDEFUN |SMP;monomials1|
        ((|p| (|VPoly|)) (|vars| #1=(|List| |VarSet|))
         (|degs| #2=(|List| (|NonNegativeInteger|))) (|res| (|List| %))
         (% (|List| %)))
        (SPROG
         ((|degs1| #2#) (|vars1| #1#) (|mon| (%))
          (|mon1|
           #3=(|Record| (|:| |k| #4=(|NonNegativeInteger|)) (|:| |c| %)))
          (#5=#:G594 NIL) (|var| NIL) (#6=#:G595 NIL) (|deg| NIL) (|k1| #4#)
          (|p1| (%)) (#7=#:G593 NIL) (|t| NIL) (|v1| (|VarSet|))
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
                                   (SPADCALL |mon| |res| (QREFELT % 216))))))
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
                                    |degs1| |res| %))))))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SMP;monomials;%L;91| ((|p| (%)) (% (|List| %)))
        (COND ((SPADCALL |p| (|spadConstant| % 12) (QREFELT % 32)) NIL)
              ((QEQCAR |p| 0) (LIST |p|))
              ('T
               (SPADCALL (|SMP;monomials1| (QCDR |p|) NIL NIL NIL %)
                         (QREFELT % 217))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomial;|)) 

(DEFUN |SparseMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G630 NIL) (|pv$| NIL) (#2=#:G621 NIL) (#3=#:G623 NIL) (#4=#:G622 NIL)
    (#5=#:G624 NIL) (#6=#:G625 NIL) (#7=#:G626 NIL) (#8=#:G627 NIL)
    (#9=#:G628 NIL) (#10=#:G629 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|SparseMultivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 248))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                                       '(|CommutativeRing|))
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
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| |#2|
                                                            '(|Hashable|)))
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
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
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10# #9#
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
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
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #10#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
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
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 17592186044416))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 35184372088832))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 70368744177664))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 140737488355328))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 281474976710656))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 36028797018963968))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|SparseUnivariatePolynomial| %))
    (QSETREFV % 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT % 8))))
    (QSETREFV % 10 (|Union| |#1| (QREFELT % 9)))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV % 14
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |SMP;One;%;2|) % 14)))))
    (QSETREFV % 15
              (COND
               ((|HasCategory| |#1| '(|SemiRing|))
                (QCDR (|spadConstant| % 14)))
               ('T (QCDR (|spadConstant| % 12)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV % 21 (CONS (|dispatchFunction| |SMP;one?;%B;4|) %))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV % 30 (CONS (|dispatchFunction| |SMP;coerce;VarSet%;7|) %))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 95 (CONS (|dispatchFunction| |SMP;coerce;I%;29|) %))
       (QSETREFV % 97
                 (CONS (|dispatchFunction| |SMP;characteristic;Nni;30|) %)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV % 101 (CONS (|dispatchFunction| |SMP;recip;%U;32|) %))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 104 (CONS (|dispatchFunction| |SMP;-;2%;33|) %))
       (QSETREFV % 107 (CONS (|dispatchFunction| |SMP;*;I2%;34|) %)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV % 115 (CONS (|dispatchFunction| |SMP;-;3%;37|) %))))
    (COND
     ((|HasCategory| |#1| '(|Hashable|))
      (COND
       ((|HasCategory| |#2| '(|Hashable|))
        (QSETREFV % 129
                  (CONS (|dispatchFunction| |SMP;hashUpdate!;Hs%Hs;43|) %))))))
    (COND
     ((|testBitVector| |pv$| 9)
      (PROGN
       (QSETREFV % 131 (CONS (|dispatchFunction| |SMP;smaller?;2%B;45|) %)))))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (QSETREFV % 134 (CONS (|dispatchFunction| |SMP;unitNormal;%R;46|) %))
       (QSETREFV % 136 (CONS (|dispatchFunction| |SMP;unitCanonical;2%;47|) %))
       (QSETREFV % 138 (CONS (|dispatchFunction| |SMP;unit?;%B;48|) %))
       (QSETREFV % 141 (CONS (|dispatchFunction| |SMP;associates?;2%B;49|) %))
       (COND
        ((|HasCategory| |#1| '(|Approximate|))
         (QSETREFV % 144 (CONS (|dispatchFunction| |SMP;exquo;2%U;50|) %)))
        ('T
         (QSETREFV % 144 (CONS (|dispatchFunction| |SMP;exquo;2%U;51|) %)))))))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV % 148 (CONS (|dispatchFunction| |SMP;/;%R%;53|) %))))
    (COND
     ((|testBitVector| |pv$| 14)
      (QSETREFV % 150 (CONS (|dispatchFunction| |SMP;content;%R;54|) %))))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|testBitVector| |pv$| 3)
        (COND
         ((|HasCategory| |#1| '(|FloatingPointSystem|))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV % 153
                       (CONS (|dispatchFunction| |SMP;content;%VarSet%;55|) %))
             (QSETREFV % 154 (CONS (|dispatchFunction| |SMP;gcd;3%;56|) %))
             (COND
              ((|HasCategory| |#1| '(|FloatingPointSystem|))
               (QSETREFV % 162
                         (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;57|)
                               %))))))))
         ('T
          (PROGN
           (QSETREFV % 153
                     (CONS (|dispatchFunction| |SMP;content;%VarSet%;58|) %))
           (QSETREFV % 154 (CONS (|dispatchFunction| |SMP;gcd;3%;59|) %))
           (QSETREFV % 167 (CONS (|dispatchFunction| |SMP;gcd;L%;60|) %))
           (QSETREFV % 162
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;61|)
                           %))))))
       ((|testBitVector| |pv$| 14)
        (PROGN
         (QSETREFV % 153
                   (CONS (|dispatchFunction| |SMP;content;%VarSet%;62|) %))
         (QSETREFV % 154 (CONS (|dispatchFunction| |SMP;gcd;3%;63|) %))
         (COND
          ((|HasCategory| |#1| '(|FloatingPointSystem|))
           (QSETREFV % 162
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;64|)
                           %))))))))
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV % 153 (CONS (|dispatchFunction| |SMP;content;%VarSet%;65|) %))
       (QSETREFV % 154 (CONS (|dispatchFunction| |SMP;gcd;3%;66|) %))
       (COND
        ((|HasCategory| |#1| '(|FloatingPointSystem|))
         (QSETREFV % 162
                   (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;67|)
                         %)))))))
    (COND
     ((|testBitVector| |pv$| 5)
      (QSETREFV % 213
                (CONS (|dispatchFunction| |SMP;differentiate;%VarSet%;86|)
                      %))))
    %))) 

(DEFUN |SparseMultivariatePolynomial| (&REST #1=#:G631)
  (SPROG NIL
         (PROG (#2=#:G632)
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

(MAKEPROP '|SparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'D '|VPoly|
              '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;Zero;%;1|) %))
              (4 . |One|) (8 . |One|) '|m_one| (|Boolean|) (12 . |zero?|)
              |SMP;zero?;%B;3| (17 . |One|) (21 . =) (27 . |one?|)
              (32 . |reductum|) (37 . |ground?|) (42 . |leadingCoefficient|)
              (|List| $$) (47 . |coefficients|) (|NonNegativeInteger|)
              |SMP;numberOfMonomials;%Nni;6| (52 . |monomial|) (58 . |coerce|)
              (63 . |monomial?|) |SMP;=;2%B;38| |SMP;monomial?;%B;9|
              |SMP;ground?;%B;25| (|Mapping| 16 $$) (68 . |any?|)
              |SMP;leadingCoefficient;%R;87| (|SparseUnivariatePolynomial| 6)
              (74 . |coerce|) (79 . |degree|) (84 . |monomial|) (90 . +)
              (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 8 6 38) (96 . |map|)
              |SMP;univariate;%Sup;12| (102 . |ground?|)
              (107 . |leadingCoefficient|) (112 . |degree|) (117 . |reductum|)
              |SMP;multivariate;SupVarSet%;13| |SMP;+;3%;36| (122 . <)
              (128 . =) (|SparseUnivariatePolynomial| %)
              |SMP;univariate;%VarSetSup;15| (|Mapping| $$ $$) (134 . |map|)
              (140 . +) (|SparseUnivariatePolynomial| $$) (146 . |degree|)
              (151 . |coefficient|) (157 . |leadingCoefficient|)
              |SMP;monomial;%VarSetNni%;26| (162 . |reductum|)
              (167 . |ground?|) (172 . |zero?|) (177 . >)
              |SMP;multivariate;SupVarSet%;17| (|IndexedExponents| 7)
              |SMP;monomial;RIe%;27| (|Record| (|:| |k| 70) (|:| |c| 6))
              (|List| 72) |SMP;construct;L%;18| |SMP;constructOrdered;L%;19|
              |SMP;degree;%Ie;82| |SMP;leadingSupport;%Ie;20|
              |SMP;leadingTerm;%R;21| |SMP;*;3%;39| |SMP;reductum;2%;89|
              (|Mapping| 6 70) |SMP;linearExtend;M%R;22|
              |SMP;listOfTerms;%L;23| (|List| 70) |SMP;support;%L;24|
              (183 . |shiftLeft|) (189 . |zero?|) (194 . |reductum|)
              (199 . |leadingCoefficient|) (204 . |leadingSupport|)
              (209 . |coefficient|) |SMP;coefficient;%IeR;28| (|Integer|)
              (215 . |coerce|) (220 . |coerce|) (225 . |characteristic|)
              (229 . |characteristic|) |SMP;coerce;R%;31| (|Union| % '"failed")
              (233 . |recip|) (238 . |recip|) (243 . -) (248 . -) (253 . -)
              (258 . *) (264 . *) (270 . *) (276 . *) (282 . *) |SMP;*;R2%;35|
              (288 . +) (294 . |coerce|) (299 . -) (305 . -) (311 . -)
              (317 . =) (323 . *) (329 . *) (335 . ^) (341 . ^) (347 . ^)
              |SMP;^;%Nni%;41| (|PositiveInteger|) |SMP;^;%Pi%;42|
              (|HashState|) (353 . |hashUpdate!|) (359 . |hashUpdate!|)
              (365 . |hashUpdate!|) (371 . |hashUpdate!|) (377 . |smaller?|)
              (383 . |smaller?|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (389 . |unitNormal|) (394 . |unitNormal|) (399 . |unitCanonical|)
              (404 . |unitCanonical|) (409 . |unit?|) (414 . |unit?|)
              (419 . |associates?|) (425 . |associates?|) (431 . |associates?|)
              (437 . |exquo|) (443 . |exquo|) (449 . |exquo|) (|Mapping| 6 6)
              |SMP;map;M2%;52| (455 . |inv|) (460 . /) (466 . |zero?|)
              (471 . |content|) (476 . |gcd|) (482 . |content|)
              (487 . |content|) (493 . |gcd|) (499 . |gcd|) (505 . |content|)
              (510 . |coerce|) (515 . |minimumDegree|) (520 . ~=)
              (526 . |exquo|) (532 . *) (538 . |gcdPolynomial|)
              (|PolynomialGcdPackage| 70 7 6 $$) (544 . |gcd|) (549 . |gcd|)
              (|List| %) (555 . |gcd|) (560 . |gcd|) (|OutputForm|)
              (566 . |coerce|) (571 . |coerce|) (576 . |outputForm|)
              |SMP;coerce;%Of;68| (|List| 6) (582 . |list|)
              |SMP;coefficients;%L;69| (587 . |append|) |SMP;retract;%R;70|
              (|Union| 6 '"failed") |SMP;retractIfCan;%U;71| (|List| 7)
              (593 . |setrest!|) |SMP;variables;%L;73| (|Union| 7 '"failed")
              |SMP;mainVariable;%U;74| (599 . |elt|) |SMP;eval;%VarSet2%;75|
              |SMP;eval;%VarSetR%;76| (605 . |empty?|) '"rest" (610 . |elt|)
              '"first" (616 . |elt|) (|Mapping| 16 7 7) (622 . |sorted?|)
              (628 . |sort|) (634 . =) (640 . |position|) (646 . |elt|)
              |SMP;eval;%LL%;78| |SMP;eval;%LL%;79| |SMP;degree;%VarSetNni;80|
              (|List| 27) |SMP;degree;%LL;81| (652 . |Zero|) (656 . |monomial|)
              (662 . +) (668 . |minimumDegree|) |SMP;minimumDegree;%Ie;83|
              |SMP;minimumDegree;%VarSetNni;84| |SMP;minimumDegree;%LL;85|
              (673 . |differentiate|) (678 . |differentiate|)
              |SMP;leadingMonomial;2%;88| (684 . |ground|) (689 . |cons|)
              (695 . |reverse!|) |SMP;monomials;%L;91| (|String|)
              (|Mapping| 70 70) (|Union| 166 '#1="failed")
              (|Union| 230 '#2="failed") (|Matrix| %) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 93) (|SingleInteger|)
              (|Matrix| 93)
              (|Record| (|:| |mat| 228) (|:| |vec| (|Vector| 93))) (|Vector| %)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 93 %)
              (|Fraction| 93) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 237 '#2#) (|List| 55) (|Factored| 55)
              (|Union| 233 '#3="failed") (|Union| 93 '#3#)
              (|Record| (|:| |mat| 242) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 7) (|:| |exponent| 27)) (|Union| 244 '#1#)
              (|List| 247) (|Equation| %))
           '#(~= 700 |zero?| 706 |variables| 711 |univariate| 716 |unitNormal|
              727 |unitCanonical| 732 |unit?| 737 |totalDegreeSorted| 742
              |totalDegree| 748 |support| 759 |subtractIfCan| 764
              |squareFreePolynomial| 770 |squareFreePart| 775 |squareFree| 780
              |solveLinearPolynomialEquation| 785 |smaller?| 791 |sample| 797
              |rightRecip| 801 |rightPower| 806 |retractIfCan| 818 |retract|
              838 |resultant| 858 |reductum| 865 |reducedSystem| 870 |recip|
              892 |primitivePart| 897 |primitiveMonomials| 908 |prime?| 913
              |pomopo!| 918 |plenaryPower| 926 |patternMatch| 932 |opposite?|
              946 |one?| 952 |numberOfMonomials| 957 |multivariate| 962
              |monomials| 974 |monomial?| 979 |monomial| 984 |monicDivide| 1004
              |minimumDegree| 1011 |mapExponents| 1028 |map| 1034
              |mainVariable| 1040 |listOfTerms| 1045 |linearExtend| 1050
              |leftRecip| 1056 |leftPower| 1061 |leadingTerm| 1073
              |leadingSupport| 1078 |leadingMonomial| 1083 |leadingCoefficient|
              1088 |lcmCoef| 1093 |lcm| 1099 |latex| 1110 |isTimes| 1115
              |isPlus| 1120 |isExpt| 1125 |hashUpdate!| 1130 |hash| 1136
              |ground?| 1141 |ground| 1146 |gcdPolynomial| 1151 |gcd| 1157
              |fmecg| 1168 |factorSquareFreePolynomial| 1176 |factorPolynomial|
              1181 |factor| 1186 |exquo| 1191 |eval| 1203 |discriminant| 1257
              |differentiate| 1263 |degree| 1289 |convert| 1306 |content| 1321
              |constructOrdered| 1332 |construct| 1337 |conditionP| 1342
              |commutator| 1347 |coerce| 1353 |coefficients| 1383 |coefficient|
              1388 |charthRoot| 1408 |characteristic| 1413 |binomThmExpt| 1417
              |associator| 1424 |associates?| 1431 |antiCommutator| 1437
              |annihilate?| 1443 ^ 1449 |Zero| 1461 |One| 1465 D 1469 = 1495 /
              1501 - 1507 + 1518 * 1524)
           'NIL
           (CONS
            (|makeByteWordVec2| 44
                                '(0 10 0 10 0 16 0 25 14 24 4 17 24 15 3 2 1 27
                                  27 24 12 15 1 0 24 4 5 1 0 0 38 4 4 1 0 0 0
                                  27 38 1 1 0 0 0 0 0 11 12 12 44 12 43 0 0 31
                                  29 9 0 0 0 12 12 19 26 7 6 0 0 12 12 18 35 33
                                  13 26 8 7 6 4 0 0 0 0 0 0))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                NIL NIL NIL |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |RetractableTo&| |Evalable&| |Hashable&| NIL |RetractableTo&|
                |RetractableTo&| |SetCategory&| |RetractableTo&| NIL
                |InnerEvalable&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL |InnerEvalable&| |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 7) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| 6) (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 233) (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRing|) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 233)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7)) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 233)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|SemiRng|) (|LinearlyExplicitOver| 93)
                 (|LinearlyExplicitOver| 6) (|NonAssociativeRing|)
                 (|BiModule| 233 233) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|NonAssociativeRng|) (|RightModule| 93) (|RightModule| 233)
                 (|LeftModule| 233) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|PatternMatchable| 93)
                 (|PatternMatchable| (|Float|)) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|RetractableTo| 7) (|Evalable| $$) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 93) (|RetractableTo| 233)
                 (|SetCategory|) (|RetractableTo| 6) (|CoercibleFrom| 7)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 224)
                 (|ConvertibleTo| 226) (|ConvertibleTo| 225) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|canonicalUnitNormal|) (|CoercibleFrom| 93)
                 (|CoercibleFrom| 233) (|unitsKnown|) (|CoercibleTo| 169)
                 (|BasicType|) (|CoercibleFrom| 6) (|InnerEvalable| 7 6)
                 (|InnerEvalable| 7 $$) (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 247
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
                                    68 2 8 0 0 27 86 1 70 16 0 87 1 70 0 0 88 1
                                    70 27 0 89 1 70 7 0 90 2 8 2 0 27 91 1 6 0
                                    93 94 1 0 0 93 95 0 6 27 96 0 0 27 97 1 6
                                    99 0 100 1 0 99 0 101 1 6 0 0 102 1 8 0 0
                                    103 1 0 0 0 104 2 6 0 93 0 105 2 8 0 93 0
                                    106 2 0 0 93 0 107 2 6 0 0 0 108 2 8 0 2 0
                                    109 2 6 0 0 0 111 1 8 0 2 112 2 6 0 0 0 113
                                    2 8 0 0 0 114 2 0 0 0 0 115 2 8 16 0 0 116
                                    2 8 0 0 2 117 2 8 0 0 0 118 2 6 0 0 27 119
                                    2 38 0 0 27 120 2 8 0 0 27 121 2 6 125 125
                                    0 126 2 7 125 125 0 127 2 8 125 125 0 128 2
                                    0 125 125 0 129 2 6 16 0 0 130 2 0 16 0 0
                                    131 1 6 132 0 133 1 0 132 0 134 1 6 0 0 135
                                    1 0 0 0 136 1 6 16 0 137 1 0 16 0 138 2 6
                                    16 0 0 139 2 8 16 0 0 140 2 0 16 0 0 141 2
                                    6 99 0 0 142 2 8 99 0 0 143 2 0 99 0 0 144
                                    1 6 0 0 147 2 0 0 0 6 148 1 8 16 0 149 1 0
                                    6 0 150 2 6 0 0 0 151 1 8 2 0 152 2 0 0 0 7
                                    153 2 0 0 0 0 154 2 8 0 0 0 155 1 60 2 0
                                    156 1 60 0 2 157 1 60 27 0 158 2 60 16 0 0
                                    159 2 60 99 0 0 160 2 60 0 0 0 161 2 0 55
                                    55 55 162 1 163 2 25 164 2 163 2 2 2 165 1
                                    0 0 166 167 2 163 60 60 60 168 1 6 169 0
                                    170 1 7 169 0 171 2 8 169 0 169 172 1 174 0
                                    6 175 2 174 0 0 0 177 2 181 0 0 0 182 2 8 2
                                    0 2 186 1 25 16 0 189 2 25 0 0 190 191 2 25
                                    2 0 192 193 2 181 16 194 0 195 2 181 0 194
                                    0 196 2 181 16 0 0 197 2 181 93 7 0 198 2
                                    25 2 0 93 199 0 70 0 205 2 70 0 27 7 206 2
                                    70 0 0 0 207 1 8 27 0 208 1 8 0 0 212 2 0 0
                                    0 7 213 1 8 2 0 215 2 25 0 2 0 216 1 25 0 0
                                    217 2 0 16 0 0 1 1 54 16 0 18 1 0 181 0 183
                                    1 0 38 0 46 2 0 55 0 7 56 1 48 132 0 134 1
                                    48 0 0 136 1 48 16 0 138 2 0 27 0 181 1 2 0
                                    27 0 181 1 1 0 27 0 1 1 0 84 0 85 2 55 99 0
                                    0 1 1 10 238 55 1 1 14 0 0 1 1 14 234 0 1 2
                                    10 236 237 55 1 2 9 16 0 0 131 0 54 0 1 1
                                    52 99 0 1 2 0 0 0 123 1 2 52 0 0 27 1 1 0
                                    179 0 180 1 6 239 0 1 1 7 240 0 1 1 12 184
                                    0 1 1 0 6 0 178 1 6 233 0 1 1 7 93 0 1 1 12
                                    7 0 1 3 5 0 0 0 7 1 1 20 0 0 80 1 37 228
                                    223 1 2 37 229 223 230 1 2 4 241 223 230 1
                                    1 4 242 223 1 1 52 99 0 101 1 14 0 0 1 2 14
                                    0 0 7 1 1 12 166 0 1 1 10 16 0 1 4 0 0 0 6
                                    70 0 1 2 49 0 0 123 1 3 28 231 0 225 231 1
                                    3 30 232 0 226 232 1 2 54 16 0 0 1 1 52 16
                                    0 21 1 0 27 0 28 2 0 0 38 7 51 2 0 0 55 7
                                    69 1 0 166 0 218 1 0 16 0 33 2 0 0 6 70 71
                                    3 0 0 0 181 203 1 3 0 0 0 7 27 64 3 4 243 0
                                    0 7 1 1 0 70 0 209 2 0 203 0 181 211 2 0 27
                                    0 7 210 2 0 0 220 0 1 2 0 0 145 0 146 1 0
                                    184 0 185 1 0 73 0 83 2 5 6 81 0 82 1 52 99
                                    0 1 2 0 0 0 123 1 2 52 0 0 27 1 1 20 72 0
                                    78 1 20 70 0 77 1 20 0 0 214 1 20 6 0 37 2
                                    14 235 0 0 1 1 14 0 166 1 2 14 0 0 0 1 1 0
                                    219 0 1 1 12 221 0 1 1 0 221 0 1 1 12 245 0
                                    1 2 19 125 125 0 129 1 19 227 0 1 1 0 16 0
                                    34 1 0 6 0 1 2 14 55 55 55 162 2 14 0 0 0
                                    154 1 14 0 166 167 4 4 0 0 70 6 0 1 1 10
                                    238 55 1 1 10 238 55 1 1 10 234 0 1 2 48 99
                                    0 0 144 2 13 99 0 6 1 3 0 0 0 7 6 188 3 0 0
                                    0 181 174 201 3 0 0 0 181 166 200 3 0 0 0 7
                                    0 187 2 12 0 0 246 1 3 12 0 0 0 0 1 2 12 0
                                    0 247 1 3 12 0 0 166 166 1 2 5 0 0 7 1 3 4
                                    0 0 7 27 1 3 4 0 0 181 203 1 2 4 0 0 181 1
                                    2 4 0 0 7 213 1 0 70 0 76 2 0 203 0 181 204
                                    2 0 27 0 7 202 1 18 224 0 1 1 32 225 0 1 1
                                    34 226 0 1 1 14 6 0 150 2 14 0 0 7 153 1 20
                                    0 73 75 1 0 0 73 74 1 46 222 223 1 2 53 0 0
                                    0 1 1 0 169 0 173 1 0 0 6 98 1 50 0 0 1 1
                                    51 0 93 95 1 22 0 233 1 1 12 0 7 30 1 0 174
                                    0 176 2 0 6 0 70 92 3 0 0 0 181 203 1 3 0 0
                                    0 7 27 1 1 47 99 0 1 0 53 27 97 3 45 0 0 0
                                    27 1 3 53 0 0 0 0 1 2 48 16 0 0 141 2 0 0 0
                                    0 1 2 53 16 0 0 1 2 0 0 0 123 124 2 52 0 0
                                    27 122 0 54 0 12 0 52 0 14 3 4 0 0 181 203
                                    1 3 4 0 0 7 27 1 2 4 0 0 7 1 2 4 0 0 181 1
                                    2 0 16 0 0 32 2 21 0 0 6 148 1 56 0 0 104 2
                                    56 0 0 0 115 2 0 0 0 0 52 2 0 0 123 0 1 2 0
                                    0 0 0 79 2 0 0 0 6 1 2 0 0 6 0 110 2 37 0 0
                                    93 1 2 56 0 93 0 107 2 54 0 27 0 1 2 1 0 0
                                    233 1 2 1 0 233 0 1)))))
           '|lookupComplete|)) 
