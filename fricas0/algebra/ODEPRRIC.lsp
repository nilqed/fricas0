
(SDEFUN |ODEPRRIC;lambda|
        ((|c| UP) (|l| L)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (SPROG NIL
               (|ODEPRRIC;innerlb| |l|
                (CONS #'|ODEPRRIC;lambda!0| (VECTOR $ |c|)) $))) 

(SDEFUN |ODEPRRIC;lambda!0| ((|z| NIL) ($$ NIL))
        (PROG (|c| $)
          (LETT |c| (QREFELT $$ 1) . #1=(|ODEPRRIC;lambda|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| |c| (QREFELT $ 15)))))) 

(SDEFUN |ODEPRRIC;infLambda|
        ((|l| L)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (|ODEPRRIC;innerlb| |l| (CONS #'|ODEPRRIC;infLambda!0| $) $)) 

(SDEFUN |ODEPRRIC;infLambda!0| ((|z| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z| (QREFELT $ 16)) (QREFELT $ 18))) 

(SDEFUN |ODEPRRIC;infmax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) ($ |List| (|Integer|)))
        (|ODEPRRIC;innermax| |rec| |l| (ELT $ 16) $)) 

(SDEFUN |ODEPRRIC;dmax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|c| UP) (|l| L) ($ |List| (|Integer|)))
        (SPROG NIL
               (|ODEPRRIC;innermax| |rec| |l|
                (CONS #'|ODEPRRIC;dmax!0| (VECTOR $ |c|)) $))) 

(SDEFUN |ODEPRRIC;dmax!0| ((|z| NIL) ($$ NIL))
        (PROG (|c| $)
          (LETT |c| (QREFELT $$ 1) . #1=(|ODEPRRIC;dmax|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z| |c| (QREFELT $ 15)) (QREFELT $ 18)))))) 

(SDEFUN |ODEPRRIC;tau0| ((|p| UP) (|q| UP) ($ UP))
        (SPROG ((#1=#:G722 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1#
                          (SPADCALL |q|
                                    (SPADCALL |p|
                                              (SPADCALL |q| |p| (QREFELT $ 15))
                                              (QREFELT $ 19))
                                    (QREFELT $ 21))
                          |ODEPRRIC;tau0|)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) "failed") #1#))
                |p| (QREFELT $ 22)))) 

(SDEFUN |ODEPRRIC;poly1|
        ((|c| UP) (|cp| UP) (|i| |Integer|)
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G728 NIL) (#2=#:G727 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G729 #3#) (#5=#:G734 NIL) (|j| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|ODEPRRIC;poly1|))
           (SEQ (LETT |j| 0 . #6#) (LETT #5# (- |i| 1) . #6#) G190
                (COND ((|greater_SI| |j| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 24) 1 (QREFELT $ 26))
                          (SPADCALL (SPADCALL |j| |cp| (QREFELT $ 27))
                                    (QREFELT $ 28))
                          (QREFELT $ 29))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 30)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 31))))))) 

(SDEFUN |ODEPRRIC;getIndices|
        ((|n| |NonNegativeInteger|)
         (|l| |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|))))
         ($ |List| (|Integer|)))
        (SPROG ((#1=#:G751 NIL) (|r| NIL) (#2=#:G750 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3=(|ODEPRRIC;getIndices|))
                   (SEQ (LETT |r| NIL . #3#) (LETT #1# |l| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL (QCDR |r|) |n|)
                            (LETT #2# (CONS (QCAR |r|) #2#) . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 34))
                 (QREFELT $ 35))))) 

(SDEFUN |ODEPRRIC;denomRicDE;LUP;8| ((|l| L) ($ UP))
        (SPROG
         ((#1=#:G753 NIL) (#2=#:G752 (UP)) (#3=#:G754 (UP)) (#4=#:G756 NIL)
          (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|ODEPRRIC;denomRicDE;LUP;8|))
           (SEQ (LETT |c| NIL . #5#)
                (LETT #4# (|ODEPRRIC;factoredDenomRicDE| |l| $) . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL |c| (|ODEPRRIC;bound| |c| |l| $)
                                   (QREFELT $ 19))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 36)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 24))))))) 

(SDEFUN |ODEPRRIC;polyRicDE;LML;9|
        ((|l| L) (|zeros| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
        (CONS (CONS (|spadConstant| $ 39) |l|)
              (|ODEPRRIC;polysol| |l| 0 NIL |zeros| $))) 

(SDEFUN |ODEPRRIC;refine|
        ((|l| |List| UP) (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |List| UP))
        (SPROG
         ((#1=#:G779 NIL) (|r| NIL) (#2=#:G778 NIL) (#3=#:G777 NIL) (|p| NIL)
          (#4=#:G776 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL . #5=(|ODEPRRIC;refine|))
            (SEQ (LETT |p| NIL . #5#) (LETT #3# |l| . #5#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL . #5#)
                           (SEQ (LETT |r| NIL . #5#)
                                (LETT #1#
                                      (SPADCALL (SPADCALL |p| |ezfactor|)
                                                (QREFELT $ 47))
                                      . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |r| (CAR #1#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #2# (CONS (QCAR |r|) #2#) . #5#)))
                                (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#)
                         . #5#)))
                 (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #4#))))
           (QREFELT $ 49))))) 

(SDEFUN |ODEPRRIC;padicsol|
        ((|c| UP) (|op| L) (|b| |NonNegativeInteger|) (|finite?| |Boolean|)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#1=#:G800 NIL) (|sol| NIL) (#2=#:G799 NIL)
          (|sols|
           (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#3=#:G785 NIL) (|neweq| (L)) (|rcn| (|Fraction| UP)) (#4=#:G798 NIL)
          (|r| NIL) (#5=#:G797 NIL) (|rec| NIL)
          (|lc|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|))
                      (|:| |eq| (|SparseUnivariatePolynomial| UP))))))
         (SEQ (LETT |ans| NIL . #6=(|ODEPRRIC;padicsol|))
              (COND (|finite?| (COND ((ZEROP |b|) (EXIT |ans|)))))
              (LETT |lc| (|ODEPRRIC;leadingDenomRicDE| |c| |op| $) . #6#)
              (COND
               (|finite?|
                (LETT |lc|
                      (SPADCALL (CONS #'|ODEPRRIC;padicsol!0| (VECTOR $ |b|))
                                |lc| (QREFELT $ 55))
                      . #6#)))
              (SEQ (LETT |rec| NIL . #6#) (LETT #5# |lc| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |r| NIL . #6#)
                          (LETT #4# (SPADCALL |c| (QCDR |rec|) |zeros|) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |r| (|spadConstant| $ 39)
                                        (QREFELT $ 56))
                              (SEQ
                               (LETT |rcn|
                                     (SPADCALL |r|
                                               (SPADCALL |c| (QCAR |rec|)
                                                         (QREFELT $ 19))
                                               (QREFELT $ 58))
                                     . #6#)
                               (LETT |neweq|
                                     (SPADCALL |op| |rcn| (QREFELT $ 59))
                                     . #6#)
                               (LETT |sols|
                                     (|ODEPRRIC;padicsol| |c| |neweq|
                                      (PROG1
                                          (LETT #3# (- (QCAR |rec|) 1) . #6#)
                                        (|check_subtype2| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                      'T |zeros| $)
                                     . #6#)
                               (EXIT
                                (LETT |ans|
                                      (COND
                                       ((NULL |sols|)
                                        (CONS (CONS |rcn| |neweq|) |ans|))
                                       ('T
                                        (SPADCALL
                                         (PROGN
                                          (LETT #2# NIL . #6#)
                                          (SEQ (LETT |sol| NIL . #6#)
                                               (LETT #1# |sols| . #6#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |sol| (CAR #1#)
                                                            . #6#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL |rcn|
                                                                   (QCAR |sol|)
                                                                   (QREFELT $
                                                                            60))
                                                         (QCDR |sol|))
                                                        #2#)
                                                       . #6#)))
                                               (LETT #1# (CDR #1#) . #6#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         |ans| (QREFELT $ 63))))
                                      . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;padicsol!0| ((|z| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1) . #1=(|ODEPRRIC;padicsol|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (QCAR |z|) |b| (QREFELT $ 51)))))) 

(SDEFUN |ODEPRRIC;leadingDenomRicDE|
        ((|c| UP) (|l| L)
         ($ |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|))
                    (|:| |eq| (|SparseUnivariatePolynomial| UP)))))
        (SPROG
         ((|done| (|List| (|NonNegativeInteger|)))
          (|ans|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|))
                      (|:| |eq| (|SparseUnivariatePolynomial| UP)))))
          (|ind| (|List| (|Integer|))) (#1=#:G812 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lb| (|ODEPRRIC;lambda| |c| |l| $)
                . #2=(|ODEPRRIC;leadingDenomRicDE|))
          (LETT |done| NIL . #2#) (LETT |ans| NIL . #2#)
          (SEQ (LETT |rec| NIL . #2#) (LETT #1# |lb| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((COND ((SPADCALL (QCDR |rec|) |done| (QREFELT $ 65)) NIL)
                         ('T
                          (NULL
                           (NULL
                            (LETT |ind| (|ODEPRRIC;dmax| |rec| |c| |l| $)
                                  . #2#)))))
                   (SEQ
                    (LETT |ans|
                          (CONS
                           (CONS (QCDR |rec|)
                                 (|ODEPRRIC;getPol| |rec| |c| |l| |ind| $))
                           |ans|)
                          . #2#)
                    (EXIT (LETT |done| (CONS (QCDR |rec|) |done|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (CONS #'|ODEPRRIC;leadingDenomRicDE!0| $) |ans|
                     (QREFELT $ 68)))))) 

(SDEFUN |ODEPRRIC;leadingDenomRicDE!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT $ 66))) 

(SDEFUN |ODEPRRIC;getPol|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|c| UP) (|l| L) (|ind| |List| (|Integer|))
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G815 NIL) (#2=#:G814 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G816 #3#) (#5=#:G819 NIL) (#6=#:G818 NIL) (#7=#:G822 NIL)
          (|i| NIL))
         (SEQ
          (COND ((EQL (QCDR |rec|) 1) (|ODEPRRIC;getPol1| |ind| |c| |l| $))
                (#8='T
                 (PROGN
                  (LETT #1# NIL . #9=(|ODEPRRIC;getPol|))
                  (SEQ (LETT |i| NIL . #9#) (LETT #7# |ind| . #9#) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL
                                 (|ODEPRRIC;tau0| |c|
                                  (SPADCALL |l|
                                            (PROG1 (LETT #6# |i| . #9#)
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            (QREFELT $ 69))
                                  $)
                                 (PROG1 (LETT #5# |i| . #9#)
                                   (|check_subtype2| (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #5#))
                                 (QREFELT $ 26))
                                . #9#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 70)) . #9#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #9#)
                             (LETT #1# 'T . #9#)))))))
                       (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#8# (|spadConstant| $ 71))))))))) 

(SDEFUN |ODEPRRIC;getPol1|
        ((|ind| |List| (|Integer|)) (|c| UP) (|l| L)
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G824 NIL) (#2=#:G823 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G825 #3#) (#5=#:G859 NIL) (#6=#:G862 NIL) (|i| NIL)
          (|cp| (UP)))
         (SEQ
          (LETT |cp| (SPADCALL (QREFELT $ 11) |c| (QREFELT $ 72))
                . #7=(|ODEPRRIC;getPol1|))
          (EXIT
           (PROGN
            (LETT #1# NIL . #7#)
            (SEQ (LETT |i| NIL . #7#) (LETT #6# |ind| . #7#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (SPADCALL
                           (|ODEPRRIC;tau0| |c|
                            (SPADCALL |l|
                                      (PROG1 (LETT #5# |i| . #7#)
                                        (|check_subtype2| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#))
                                      (QREFELT $ 69))
                            $)
                           (|ODEPRRIC;poly1| |c| |cp| |i| $) (QREFELT $ 73))
                          . #7#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 70)) . #7#))
                     ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                 (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 71)))))))) 

(SDEFUN |ODEPRRIC;constantCoefficientRicDE;LML;15|
        ((|op| L) (|ric| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |constant| F) (|:| |eq| L))))
        (SPROG
         ((#1=#:G874 NIL) (|a| NIL) (#2=#:G873 NIL)
          (|m| #3=(|NonNegativeInteger|)) (#4=#:G865 NIL) (#5=#:G864 #3#)
          (#6=#:G866 #3#) (#7=#:G872 NIL) (|p| NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL
                       . #8=(|ODEPRRIC;constantCoefficientRicDE;LML;15|))
                 (SEQ (LETT |p| NIL . #8#)
                      (LETT #7# (SPADCALL |op| (QREFELT $ 74)) . #8#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6# (SPADCALL |p| (QREFELT $ 16)) . #8#)
                         (COND (#4# (LETT #5# (MAX #5# #6#) . #8#))
                               ('T
                                (PROGN
                                 (LETT #5# #6# . #8#)
                                 (LETT #4# 'T . #8#)))))))
                      (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|max|))))
                . #8#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #8#)
            (SEQ (LETT |a| NIL . #8#)
                 (LETT #1#
                       (SPADCALL
                        (|ODEPRRIC;constantCoefficientOperator| |op| |m| $)
                        |ric|)
                       . #8#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (CONS |a|
                                (SPADCALL |op| (SPADCALL |a| (QREFELT $ 75))
                                          (QREFELT $ 76)))
                          #2#)
                         . #8#)))
                 (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ODEPRRIC;constantCoefficientOperator|
        ((|op| L) (|m| |NonNegativeInteger|) ($ UP))
        (SPROG ((|ans| (UP)) (|p| (UP)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 39)
                      . #1=(|ODEPRRIC;constantCoefficientOperator|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |op| (|spadConstant| $ 80) (QREFELT $ 81)))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((EQL
                         (SPADCALL
                          (LETT |p| (SPADCALL |op| (QREFELT $ 82)) . #1#)
                          (QREFELT $ 16))
                         |m|)
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 83))
                                                  (SPADCALL |op|
                                                            (QREFELT $ 84))
                                                  (QREFELT $ 85))
                                        (QREFELT $ 86))
                              . #1#)))
                      (EXIT (LETT |op| (SPADCALL |op| (QREFELT $ 87)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;getPoly|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) (|ind| |List| (|Integer|)) ($ UP))
        (SPROG
         ((#1=#:G882 NIL) (#2=#:G881 (UP)) (#3=#:G883 (UP)) (#4=#:G886 NIL)
          (#5=#:G885 NIL) (#6=#:G888 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|ODEPRRIC;getPoly|))
           (SEQ (LETT |i| NIL . #7#) (LETT #6# |ind| . #7#) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |l|
                                     (PROG1 (LETT #5# |i| . #7#)
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     (QREFELT $ 69))
                           (QREFELT $ 83))
                          (PROG1 (LETT #4# |i| . #7#)
                            (|check_subtype2| (>= #4# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #4#))
                          (QREFELT $ 85))
                         . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 86)) . #7#))
                    ('T (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 39))))))) 

(SDEFUN |ODEPRRIC;innermax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) (|nu| |Mapping| (|Integer|) UP) ($ |List| (|Integer|)))
        (SPROG
         ((|ans| (|List| (|Integer|))) (#1=#:G896 NIL) (|k| #2=(|Integer|))
          (|f| (UP)) (#3=#:G897 NIL) (|j| NIL) (|m| #2#) (#4=#:G891 NIL)
          (|d| (|Integer|)) (|i| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |l| (QREFELT $ 84)) . #5=(|ODEPRRIC;innermax|))
            (LETT |i| (|SPADfirst| (QCAR |rec|)) . #5#)
            (LETT |m|
                  (+ (* |i| (LETT |d| (QCDR |rec|) . #5#))
                     (SPADCALL
                      (SPADCALL |l|
                                (PROG1 (LETT #4# |i| . #5#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (QREFELT $ 69))
                      |nu|))
                  . #5#)
            (LETT |ans| NIL . #5#)
            (SEQ (LETT |j| 0 . #5#) (LETT #3# |n| . #5#) G190
                 (COND ((|greater_SI| |j| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (LETT |f| (SPADCALL |l| |j| (QREFELT $ 69)) . #5#)
                      (|spadConstant| $ 39) (QREFELT $ 56))
                     (SEQ
                      (LETT |k|
                            (+ (SPADCALL |j| |d| (QREFELT $ 88))
                               (SPADCALL |f| |nu|))
                            . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |k| |m| (QREFELT $ 89))
                         (PROGN (LETT #1# NIL . #5#) (GO #6=#:G895)))
                        ((EQL |k| |m|)
                         (LETT |ans| (CONS |j| |ans|) . #5#)))))))))
                 (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT |ans|)))
          #6# (EXIT #1#)))) 

(SDEFUN |ODEPRRIC;leadingCoefficientRicDE;LL;19|
        ((|l| L)
         ($ |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP))))
        (SPROG
         ((|done| (|List| (|NonNegativeInteger|)))
          (|ans|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP))))
          (|ind| (|List| (|Integer|))) (#1=#:G910 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lb| (|ODEPRRIC;infLambda| |l| $)
                . #2=(|ODEPRRIC;leadingCoefficientRicDE;LL;19|))
          (LETT |done| NIL . #2#) (LETT |ans| NIL . #2#)
          (SEQ (LETT |rec| NIL . #2#) (LETT #1# |lb| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((COND ((SPADCALL (QCDR |rec|) |done| (QREFELT $ 65)) NIL)
                         ('T
                          (NULL
                           (NULL
                            (LETT |ind| (|ODEPRRIC;infmax| |rec| |l| $)
                                  . #2#)))))
                   (SEQ
                    (LETT |ans|
                          (CONS
                           (CONS (QCDR |rec|)
                                 (|ODEPRRIC;getPoly| |rec| |l| |ind| $))
                           |ans|)
                          . #2#)
                    (EXIT (LETT |done| (CONS (QCDR |rec|) |done|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (CONS #'|ODEPRRIC;leadingCoefficientRicDE;LL;19!0| $)
                     |ans| (QREFELT $ 93)))))) 

(SDEFUN |ODEPRRIC;leadingCoefficientRicDE;LL;19!0|
        ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT $ 66))) 

(SDEFUN |ODEPRRIC;factoredDenomRicDE| ((|l| L) ($ |List| UP))
        (SPROG
         ((#1=#:G916 NIL) (|dd| NIL) (#2=#:G915 NIL)
          (|bd|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |bd|
                (SPADCALL
                 (SPADCALL (SPADCALL |l| (QREFELT $ 82))
                           (SPADCALL |l| (QREFELT $ 74)) (QREFELT $ 96))
                 (QREFELT $ 47))
                . #3=(|ODEPRRIC;factoredDenomRicDE|))
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |dd| NIL . #3#) (LETT #1# |bd| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #2# (CONS (QCAR |dd|) #2#) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ODEPRRIC;changeVar;LUPL;21| ((|l| L) (|a| UP) ($ L))
        (SPROG ((|dpan| (L)) (|op| (L)) (#1=#:G921 NIL) (|i| NIL) (|dpa| (L)))
               (SEQ
                (LETT |dpa|
                      (SPADCALL (QREFELT $ 11) (SPADCALL |a| (QREFELT $ 97))
                                (QREFELT $ 98))
                      . #2=(|ODEPRRIC;changeVar;LUPL;21|))
                (LETT |dpan| (|spadConstant| $ 99) . #2#)
                (LETT |op| (|spadConstant| $ 80) . #2#)
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (SPADCALL |l| (QREFELT $ 84)) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |op|
                            (SPADCALL |op|
                                      (SPADCALL
                                       (SPADCALL |l| |i| (QREFELT $ 69)) |dpan|
                                       (QREFELT $ 100))
                                      (QREFELT $ 98))
                            . #2#)
                      (EXIT
                       (LETT |dpan| (SPADCALL |dpa| |dpan| (QREFELT $ 101))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |op| (QREFELT $ 102)))))) 

(SDEFUN |ODEPRRIC;changeVar;LFL;22| ((|l| L) (|a| |Fraction| UP) ($ L))
        (SPROG
         ((|dpan| (LQ)) (|op| (LQ)) (#1=#:G927 NIL) (|i| NIL) (|dpa| (LQ)))
         (SEQ
          (LETT |dpa|
                (SPADCALL (QREFELT $ 13) (SPADCALL |a| (QREFELT $ 103))
                          (QREFELT $ 104))
                . #2=(|ODEPRRIC;changeVar;LFL;22|))
          (LETT |dpan| (|spadConstant| $ 105) . #2#)
          (LETT |op| (|spadConstant| $ 106) . #2#)
          (SEQ (LETT |i| 0 . #2#)
               (LETT #1# (SPADCALL |l| (QREFELT $ 84)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| |i| (QREFELT $ 69))
                                           (QREFELT $ 107))
                                 |dpan| (QREFELT $ 108))
                                (QREFELT $ 104))
                      . #2#)
                (EXIT
                 (LETT |dpan| (SPADCALL |dpa| |dpan| (QREFELT $ 109)) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (QCAR (SPADCALL |op| NIL (QREFELT $ 113))))))) 

(SDEFUN |ODEPRRIC;bound| ((|c| UP) (|l| L) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G930 NIL) (#2=#:G929 #3=(|NonNegativeInteger|)) (#4=#:G931 #3#)
          (#5=#:G934 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|))) (|:| |deg| #3#)))))
         (SEQ
          (COND
           ((NULL
             (LETT |lb| (|ODEPRRIC;lambda| |c| |l| $) . #6=(|ODEPRRIC;bound|)))
            1)
           (#7='T
            (PROGN
             (LETT #1# NIL . #6#)
             (SEQ (LETT |rec| NIL . #6#) (LETT #5# |lb| . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (QCDR |rec|) . #6#)
                     (COND (#1# (LETT #2# (MAX #2# #4#) . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#7# (|IdentityError| '|max|))))))))) 

(SDEFUN |ODEPRRIC;innerlb|
        ((|l| L) (|nu| |Mapping| (|Integer|) UP)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (SPROG
         ((|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|)))))
          (#1=#:G940 NIL) (|b| (|Integer|))
          (|u| (|Union| (|Integer|) "failed")) (|lj| (UP)) (#2=#:G948 NIL)
          (|j| NIL) (|li| (UP)) (#3=#:G947 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |lb| NIL . #4=(|ODEPRRIC;innerlb|))
              (LETT |n| (SPADCALL |l| (QREFELT $ 84)) . #4#)
              (SEQ (LETT |i| 0 . #4#) (LETT #3# |n| . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |li| (SPADCALL |l| |i| (QREFELT $ 69)) . #4#)
                        (|spadConstant| $ 39) (QREFELT $ 56))
                       (SEQ (LETT |j| (+ |i| 1) . #4#) (LETT #2# |n| . #4#)
                            G190 (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (LETT |lj| (SPADCALL |l| |j| (QREFELT $ 69))
                                       . #4#)
                                 (|spadConstant| $ 39) (QREFELT $ 56))
                                (SEQ
                                 (LETT |u|
                                       (SPADCALL
                                        (- (SPADCALL |li| |nu|)
                                           (SPADCALL |lj| |nu|))
                                        (- |i| |j|) (QREFELT $ 114))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |u| 0)
                                    (SEQ (LETT |b| (QCDR |u|) . #4#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |b| 0 (QREFELT $ 89))
                                            (LETT |lb|
                                                  (CONS
                                                   (CONS (LIST |i| |j|)
                                                         (PROG1
                                                             (LETT #1# |b|
                                                                   . #4#)
                                                           (|check_subtype2|
                                                            (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#)))
                                                   |lb|)
                                                  . #4#)))))))))))))
                            (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                            (EXIT NIL))))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |lb|)))) 

(SDEFUN |ODEPRRIC;singRicDE;LMML;25|
        ((|l| L)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (CONS (CONS (|spadConstant| $ 115) |l|)
              (|ODEPRRIC;fracsol| |l| |zeros|
               (|ODEPRRIC;refine| (|ODEPRRIC;factoredDenomRicDE| |l| $)
                |ezfactor| $)
               $))) 

(SDEFUN |ODEPRRIC;fracsol|
        ((|l| L)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         (|lc| |List| UP)
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#1=#:G974 NIL) (|sol| NIL) (#2=#:G973 NIL)
          (|sols|
           (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (|neweq| (L)) (#3=#:G972 NIL) (|rec| NIL))
         (SEQ (LETT |ans| NIL . #4=(|ODEPRRIC;fracsol|))
              (EXIT
               (COND ((NULL |lc|) |ans|)
                     ((NULL
                       (LETT |sols|
                             (|ODEPRRIC;padicsol| (|SPADfirst| |lc|) |l| 0 NIL
                              |zeros| $)
                             . #4#))
                      (|ODEPRRIC;fracsol| |l| |zeros| (CDR |lc|) $))
                     ('T
                      (SEQ
                       (SEQ (LETT |rec| NIL . #4#) (LETT #3# |sols| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |neweq|
                                   (SPADCALL |l| (QCAR |rec|) (QREFELT $ 59))
                                   . #4#)
                             (LETT |sols|
                                   (|ODEPRRIC;fracsol| |neweq| |zeros|
                                    (CDR |lc|) $)
                                   . #4#)
                             (EXIT
                              (LETT |ans|
                                    (COND ((NULL |sols|) (CONS |rec| |ans|))
                                          ('T
                                           (SPADCALL
                                            (PROGN
                                             (LETT #2# NIL . #4#)
                                             (SEQ (LETT |sol| NIL . #4#)
                                                  (LETT #1# |sols| . #4#) G190
                                                  (COND
                                                   ((OR (ATOM #1#)
                                                        (PROGN
                                                         (LETT |sol| (CAR #1#)
                                                               . #4#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #2#
                                                          (CONS
                                                           (CONS
                                                            (SPADCALL
                                                             (QCAR |rec|)
                                                             (QCAR |sol|)
                                                             (QREFELT $ 60))
                                                            (QCDR |sol|))
                                                           #2#)
                                                          . #4#)))
                                                  (LETT #1# (CDR #1#) . #4#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #2#))))
                                            |ans| (QREFELT $ 63))))
                                    . #4#)))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |ans|)))))))) 

(SDEFUN |ODEPRRIC;polysol|
        ((|l| L) (|b| |NonNegativeInteger|) (|finite?| |Boolean|)
         (|zeros| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
          (#1=#:G992 NIL) (|sol| NIL) (#2=#:G991 NIL)
          (|sols| (|List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
          (#3=#:G979 NIL) (|neweq| (L)) (|atn| (UP)) (#4=#:G990 NIL) (|a| NIL)
          (#5=#:G989 NIL) (|rec| NIL)
          (|lc|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP)))))
         (SEQ (LETT |ans| NIL . #6=(|ODEPRRIC;polysol|))
              (COND (|finite?| (COND ((ZEROP |b|) (EXIT |ans|)))))
              (LETT |lc| (SPADCALL |l| (QREFELT $ 94)) . #6#)
              (COND
               (|finite?|
                (LETT |lc|
                      (SPADCALL (CONS #'|ODEPRRIC;polysol!0| (VECTOR $ |b|))
                                |lc| (QREFELT $ 120))
                      . #6#)))
              (SEQ (LETT |rec| NIL . #6#) (LETT #5# |lc| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |a| NIL . #6#)
                          (LETT #4# (SPADCALL (QCDR |rec|) |zeros|) . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |a| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |a| (|spadConstant| $ 38)
                                        (QREFELT $ 121))
                              (SEQ
                               (LETT |atn|
                                     (SPADCALL |a| (QCAR |rec|) (QREFELT $ 85))
                                     . #6#)
                               (LETT |neweq|
                                     (SPADCALL |l| |atn| (QREFELT $ 76)) . #6#)
                               (LETT |sols|
                                     (|ODEPRRIC;polysol| |neweq|
                                      (PROG1
                                          (LETT #3# (- (QCAR |rec|) 1) . #6#)
                                        (|check_subtype2| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                      'T |zeros| $)
                                     . #6#)
                               (EXIT
                                (LETT |ans|
                                      (COND
                                       ((NULL |sols|)
                                        (CONS (CONS |atn| |neweq|) |ans|))
                                       ('T
                                        (SPADCALL
                                         (PROGN
                                          (LETT #2# NIL . #6#)
                                          (SEQ (LETT |sol| NIL . #6#)
                                               (LETT #1# |sols| . #6#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |sol| (CAR #1#)
                                                            . #6#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL |atn|
                                                                   (QCAR |sol|)
                                                                   (QREFELT $
                                                                            86))
                                                         (QCDR |sol|))
                                                        #2#)
                                                       . #6#)))
                                               (LETT #1# (CDR #1#) . #6#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         |ans| (QREFELT $ 122))))
                                      . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;polysol!0| ((|z| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1) . #1=(|ODEPRRIC;polysol|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (QCAR |z|) |b| (QREFELT $ 51)))))) 

(DECLAIM (NOTINLINE |PrimitiveRatRicDE;|)) 

(DEFUN |PrimitiveRatRicDE| (&REST #1=#:G993)
  (SPROG NIL
         (PROG (#2=#:G994)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PrimitiveRatRicDE|)
                                               '|domainEqualList|)
                    . #3=(|PrimitiveRatRicDE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PrimitiveRatRicDE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PrimitiveRatRicDE|)))))))))) 

(DEFUN |PrimitiveRatRicDE;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PrimitiveRatRicDE|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|PrimitiveRatRicDE| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 123) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|PrimitiveRatRicDE|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
    (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
    $))) 

(MAKEPROP '|PrimitiveRatRicDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . D) '|diff| (4 . D) '|diffq|
              (|NonNegativeInteger|) (8 . |order|) (14 . |degree|) (|Integer|)
              (19 . -) (24 . ^) (|Union| $ '"failed") (30 . |exquo|)
              (36 . |rem|) (42 . |One|) (46 . |One|)
              (|SparseUnivariatePolynomial| 7) (50 . |monomial|) (56 . *)
              (62 . |coerce|) (67 . -) (73 . *) (79 . |One|) (|List| $)
              (|List| 17) (83 . |concat|) (88 . |removeDuplicates!|) (93 . *)
              |ODEPRRIC;denomRicDE;LUP;8| (99 . |Zero|) (103 . |Zero|)
              (|Record| (|:| |poly| 7) (|:| |eq| 8)) (|List| 40)
              (|Mapping| (|List| 6) 7) |ODEPRRIC;polyRicDE;LML;9|
              (|Record| (|:| |factor| 7) (|:| |exponent| 17)) (|List| 44)
              (|Factored| 7) (107 . |factors|) (|List| 7) (112 . |concat|)
              (|Boolean|) (117 . <=) (|Record| (|:| |deg| 14) (|:| |eq| 25))
              (|Mapping| 50 52) (|List| 52) (123 . |select!|) (129 . ~=)
              (|Fraction| 7) (135 . /) |ODEPRRIC;changeVar;LFL;22| (141 . +)
              (|Record| (|:| |frac| 57) (|:| |eq| 8)) (|List| 61)
              (147 . |concat!|) (|List| 14) (153 . |member?|) (159 . >)
              (|Mapping| 50 52 52) (165 . |sort!|) (171 . |coefficient|)
              (177 . +) (183 . |Zero|) (187 . |elt|) (193 . *)
              (199 . |coefficients|) (204 . |coerce|)
              |ODEPRRIC;changeVar;LUPL;21|
              (|Record| (|:| |constant| 6) (|:| |eq| 8)) (|List| 77)
              |ODEPRRIC;constantCoefficientRicDE;LML;15| (209 . |Zero|)
              (213 . ~=) (219 . |leadingCoefficient|)
              (224 . |leadingCoefficient|) (229 . |degree|) (234 . |monomial|)
              (240 . +) (246 . |reductum|) (251 . *) (257 . >)
              (|Record| (|:| |deg| 14) (|:| |eq| 7)) (|Mapping| 50 90 90)
              (|List| 90) (263 . |sort!|)
              |ODEPRRIC;leadingCoefficientRicDE;LL;19|
              (|BalancedFactorisation| 6 7) (269 . |balancedFactorisation|)
              (275 . |coerce|) (280 . +) (286 . |One|) (290 . *) (296 . *)
              (302 . |primitivePart|) (307 . |coerce|) (312 . +) (318 . |One|)
              (322 . |Zero|) (326 . |coerce|) (331 . *) (337 . *)
              (|Record| (|:| |eq| 8) (|:| |rh| 111)) (|List| 57)
              (|PrimitiveRatDE| 6 7 8 9) (343 . |splitDenominator|)
              (349 . |exquo|) (355 . |Zero|) (|Mapping| 48 7 25)
              (|Mapping| 46 7) |ODEPRRIC;singRicDE;LMML;25| (|Mapping| 50 90)
              (359 . |select!|) (365 . ~=) (371 . |concat!|))
           '#(|singRicDE| 377 |polyRicDE| 384 |leadingCoefficientRicDE| 390
              |denomRicDE| 395 |constantCoefficientRicDE| 400 |changeVar| 406)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 122
                                                 '(0 8 0 10 0 9 0 12 2 7 14 0 0
                                                   15 1 7 14 0 16 1 17 0 0 18 2
                                                   7 0 0 14 19 2 7 20 0 0 21 2
                                                   7 0 0 0 22 0 6 0 23 0 7 0 24
                                                   2 25 0 7 14 26 2 7 0 14 0 27
                                                   1 25 0 7 28 2 25 0 0 0 29 2
                                                   25 0 0 0 30 0 25 0 31 1 33 0
                                                   32 34 1 33 0 0 35 2 7 0 0 0
                                                   36 0 6 0 38 0 7 0 39 1 46 45
                                                   0 47 1 48 0 32 49 2 14 50 0
                                                   0 51 2 54 0 53 0 55 2 7 50 0
                                                   0 56 2 57 0 7 7 58 2 57 0 0
                                                   0 60 2 62 0 0 0 63 2 64 50
                                                   14 0 65 2 14 50 0 0 66 2 54
                                                   0 67 0 68 2 8 7 0 14 69 2 25
                                                   0 0 0 70 0 25 0 71 2 8 7 0 7
                                                   72 2 25 0 7 0 73 1 8 48 0 74
                                                   1 7 0 6 75 0 8 0 80 2 8 50 0
                                                   0 81 1 8 7 0 82 1 7 6 0 83 1
                                                   8 14 0 84 2 7 0 6 14 85 2 7
                                                   0 0 0 86 1 8 0 0 87 2 17 0
                                                   14 0 88 2 17 50 0 0 89 2 92
                                                   0 91 0 93 2 95 46 7 48 96 1
                                                   8 0 7 97 2 8 0 0 0 98 0 8 0
                                                   99 2 8 0 7 0 100 2 8 0 0 0
                                                   101 1 8 0 0 102 1 9 0 57 103
                                                   2 9 0 0 0 104 0 9 0 105 0 9
                                                   0 106 1 57 0 7 107 2 9 0 57
                                                   0 108 2 9 0 0 0 109 2 112
                                                   110 9 111 113 2 17 20 0 0
                                                   114 0 57 0 115 2 92 0 119 0
                                                   120 2 6 50 0 0 121 2 41 0 0
                                                   0 122 3 0 62 8 116 117 118 2
                                                   0 41 8 42 43 1 0 92 8 94 1 0
                                                   7 8 37 2 0 78 8 42 79 2 0 8
                                                   8 57 59 2 0 8 8 7 76)))))
           '|lookupComplete|)) 
