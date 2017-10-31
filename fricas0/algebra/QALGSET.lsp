
(SDEFUN |QALGSET;factorset| ((|y| |Dpoly|) ($ |List| |Dpoly|))
        (SPROG ((#1=#:G728 NIL) (|j| NIL) (#2=#:G727 NIL))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 12)) NIL)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|QALGSET;factorset|))
                        (SEQ (LETT |j| NIL . #3#)
                             (LETT #1#
                                   (SPADCALL (SPADCALL |y| (QREFELT $ 15))
                                             (QREFELT $ 18))
                                   . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |j| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #2# (CONS (QCAR |j|) #2#) . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |QALGSET;simplify;2$;2| ((|x| $) ($ $))
        (SPROG
         ((#1=#:G746 NIL) (#2=#:G745 (|Dpoly|)) (#3=#:G747 (|Dpoly|))
          (#4=#:G758 NIL) (#5=#:G691 NIL) (|zro| (|List| |Dpoly|))
          (#6=#:G738 NIL) (#7=#:G737 (|Dpoly|)) (#8=#:G739 (|Dpoly|))
          (#9=#:G757 NIL) (#10=#:G690 NIL) (#11=#:G756 NIL) (|s| NIL)
          (#12=#:G755 NIL) (|mset| (|List| (|List| |Dpoly|))) (#13=#:G754 NIL)
          (#14=#:G753 NIL) (#15=#:G752 NIL) (|p| NIL) (#16=#:G751 NIL)
          (|nzro| (|List| |Dpoly|)) (|pnzero| (|Dpoly|)))
         (SEQ
          (COND
           ((QEQCAR (QVELT |x| 0) 1)
            (LETT |x|
                  (SPADCALL
                   (LETT |zro| (SPADCALL (QVELT |x| 1) (QREFELT $ 21))
                         . #17=(|QALGSET;simplify;2$;2|))
                   (SPADCALL (QVELT |x| 2) |zro| (QREFELT $ 23))
                   (QREFELT $ 24))
                  . #17#)))
          (LETT |pnzero| (QVELT |x| 2) . #17#)
          (EXIT
           (COND
            ((SPADCALL |pnzero| (|spadConstant| $ 27) (QREFELT $ 28))
             (SPADCALL (QREFELT $ 29)))
            (#18='T
             (SEQ (LETT |nzro| (|QALGSET;factorset| |pnzero| $) . #17#)
                  (LETT |mset|
                        (|QALGSET;minset|
                         (PROGN
                          (LETT #16# NIL . #17#)
                          (SEQ (LETT |p| NIL . #17#)
                               (LETT #15# (QVELT |x| 1) . #17#) G190
                               (COND
                                ((OR (ATOM #15#)
                                     (PROGN (LETT |p| (CAR #15#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #16#
                                       (CONS (|QALGSET;factorset| |p| $) #16#)
                                       . #17#)))
                               (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                               (EXIT (NREVERSE #16#))))
                         $)
                        . #17#)
                  (LETT |mset|
                        (PROGN
                         (LETT #14# NIL . #17#)
                         (SEQ (LETT |s| NIL . #17#) (LETT #13# |mset| . #17#)
                              G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |s| (CAR #13#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #14#
                                      (CONS
                                       (SPADCALL |s| |nzro| (QREFELT $ 30))
                                       #14#)
                                      . #17#)))
                              (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #14#))))
                        . #17#)
                  (LETT |zro|
                        (SPADCALL
                         (PROGN
                          (LETT #12# NIL . #17#)
                          (SEQ (LETT |s| NIL . #17#) (LETT #11# |mset| . #17#)
                               G190
                               (COND
                                ((OR (ATOM #11#)
                                     (PROGN (LETT |s| (CAR #11#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #12#
                                       (CONS
                                        (PROGN
                                         (LETT #6# NIL . #17#)
                                         (SEQ (LETT #10# NIL . #17#)
                                              (LETT #9# |s| . #17#) G190
                                              (COND
                                               ((OR (ATOM #9#)
                                                    (PROGN
                                                     (LETT #10# (CAR #9#)
                                                           . #17#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #8# #10# . #17#)
                                                 (COND
                                                  (#6#
                                                   (LETT #7#
                                                         (SPADCALL #7# #8#
                                                                   (QREFELT $
                                                                            31))
                                                         . #17#))
                                                  ('T
                                                   (PROGN
                                                    (LETT #7# #8# . #17#)
                                                    (LETT #6# 'T . #17#)))))))
                                              (LETT #9# (CDR #9#) . #17#)
                                              (GO G190) G191 (EXIT NIL))
                                         (COND (#6# #7#)
                                               ('T (|spadConstant| $ 32))))
                                        #12#)
                                       . #17#)))
                               (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                               (EXIT (NREVERSE #12#))))
                         (QREFELT $ 21))
                        . #17#)
                  (EXIT
                   (COND
                    ((SPADCALL (|spadConstant| $ 32) |zro| (QREFELT $ 33))
                     (SPADCALL (QREFELT $ 29)))
                    (#18#
                     (VECTOR (QVELT |x| 0) |zro|
                             (SPADCALL
                              (SPADCALL
                               (PROGN
                                (LETT #1# NIL . #17#)
                                (SEQ (LETT #5# NIL . #17#)
                                     (LETT #4# |nzro| . #17#) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN
                                            (LETT #5# (CAR #4#) . #17#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #3# #5# . #17#)
                                        (COND
                                         (#1#
                                          (LETT #2#
                                                (SPADCALL #2# #3#
                                                          (QREFELT $ 31))
                                                . #17#))
                                         ('T
                                          (PROGN
                                           (LETT #2# #3# . #17#)
                                           (LETT #1# 'T . #17#)))))))
                                     (LETT #4# (CDR #4#) . #17#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#1# #2#) (#18# (|spadConstant| $ 32))))
                               |zro| (QREFELT $ 23))
                              (QREFELT $ 34))))))))))))) 

(SDEFUN |QALGSET;npoly|
        ((|f| |Dpoly|)
         ($ |PolynomialRing| R (|Product| (|NonNegativeInteger|) |Expon|)))
        (COND ((SPADCALL |f| (QREFELT $ 36)) (|spadConstant| $ 38))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 39))
                          (SPADCALL 0 (SPADCALL |f| (QREFELT $ 40))
                                    (QREFELT $ 43))
                          (QREFELT $ 44))
                (|QALGSET;npoly| (SPADCALL |f| (QREFELT $ 45)) $)
                (QREFELT $ 46))))) 

(SDEFUN |QALGSET;oldpoly|
        ((|q| |PolynomialRing| R (|Product| (|NonNegativeInteger|) |Expon|))
         ($ . #1=(|Union| |Dpoly| "failed")))
        (SPROG
         ((|g| #1#) (|n| (|NonNegativeInteger|))
          (|dq| (|Product| (|NonNegativeInteger|) |Expon|)))
         (SEQ
          (COND
           ((SPADCALL |q| (|spadConstant| $ 38) (QREFELT $ 47))
            (CONS 0 (|spadConstant| $ 27)))
           (#2='T
            (SEQ
             (LETT |dq| (SPADCALL |q| (QREFELT $ 48)) . #3=(|QALGSET;oldpoly|))
             (LETT |n| (SPADCALL |dq| (QREFELT $ 49)) . #3#)
             (EXIT
              (COND ((SPADCALL |n| 0 (QREFELT $ 50)) (CONS 1 "failed"))
                    (#2#
                     (SEQ
                      (LETT |g|
                            (|QALGSET;oldpoly| (SPADCALL |q| (QREFELT $ 51)) $)
                            . #3#)
                      (EXIT
                       (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                             (#2#
                              (CONS 0
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |q| (QREFELT $ 52))
                                               (SPADCALL |dq| (QREFELT $ 53))
                                               (QREFELT $ 54))
                                     (QCDR |g|) (QREFELT $ 55)))))))))))))))) 

(SDEFUN |QALGSET;coerce;$Of;5| ((|x| $) ($ |OutputForm|))
        (SPROG ((#1=#:G780 NIL) (|f| NIL) (#2=#:G779 NIL))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |x| 0) (CONS 0 'T) (QREFELT $ 57)) "Empty")
                 ('T
                  (SPADCALL
                   (LIST
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #3=(|QALGSET;coerce;$Of;5|))
                      (SEQ (LETT |f| NIL . #3#) (LETT #1# (QVELT |x| 1) . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 59))
                                              " = 0" (QREFELT $ 60))
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 62))
                    (SPADCALL (SPADCALL (QVELT |x| 2) (QREFELT $ 59)) " != 0"
                              (QREFELT $ 60)))
                   (QREFELT $ 64))))))) 

(SDEFUN |QALGSET;empty?;$B;6| ((|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G782 NIL))
               (SEQ
                (COND
                 ((QEQCAR (QVELT |x| 0) 1)
                  (LETT |x| (SPADCALL |x| (QREFELT $ 66))
                        . #2=(|QALGSET;empty?;$B;6|))))
                (EXIT
                 (PROG2 (LETT #1# (QVELT |x| 0) . #2#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|Boolean|)
                                   (|Union| (|Boolean|) "failed") #1#)))))) 

(SDEFUN |QALGSET;empty;$;7| (($ $))
        (VECTOR (CONS 0 'T) (LIST (|spadConstant| $ 32)) (|spadConstant| $ 27))) 

(PUT '|QALGSET;status;$U;8| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 0))) 

(SDEFUN |QALGSET;status;$U;8| ((|x| $) ($ |Union| (|Boolean|) "failed"))
        (QVELT |x| 0)) 

(SDEFUN |QALGSET;setStatus;$U$;9|
        ((|x| $) (|t| |Union| (|Boolean|) "failed") ($ $))
        (VECTOR |t| (QVELT |x| 1) (QVELT |x| 2))) 

(PUT '|QALGSET;definingEquations;$L;10| '|SPADreplace|
     '(XLAM (|x|) (QVELT |x| 1))) 

(SDEFUN |QALGSET;definingEquations;$L;10| ((|x| $) ($ |List| |Dpoly|))
        (QVELT |x| 1)) 

(PUT '|QALGSET;definingInequation;$Dpoly;11| '|SPADreplace|
     '(XLAM (|x|) (QVELT |x| 2))) 

(SDEFUN |QALGSET;definingInequation;$Dpoly;11| ((|x| $) ($ |Dpoly|))
        (QVELT |x| 2)) 

(SDEFUN |QALGSET;quasiAlgebraicSet;LDpoly$;12|
        ((|z0| |List| |Dpoly|) (|n0| |Dpoly|) ($ $))
        (VECTOR (CONS 1 "failed") |z0| |n0|)) 

(SDEFUN |QALGSET;idealSimplify;2$;13| ((|x| $) ($ $))
        (SPROG
         ((|ngb|
           (|List|
            (|PolynomialRing| R (|Product| (|NonNegativeInteger|) |Expon|))))
          (|gb| (|List| |Dpoly|)) (|f| (|Union| |Dpoly| "failed"))
          (#1=#:G824 NIL) (|g| NIL) (#2=#:G823 NIL)
          (|tp|
           (|PolynomialRing| R (|Product| (|NonNegativeInteger|) |Expon|)))
          (|n0| (|Dpoly|)) (|z0| (|List| |Dpoly|)))
         (SEQ
          (COND ((QEQCAR (QVELT |x| 0) 0) |x|)
                (#3='T
                 (SEQ
                  (LETT |z0| (QVELT |x| 1)
                        . #4=(|QALGSET;idealSimplify;2$;13|))
                  (LETT |n0| (QVELT |x| 2) . #4#)
                  (EXIT
                   (COND ((NULL |z0|) (VECTOR (CONS 0 NIL) |z0| |n0|))
                         ((SPADCALL (|spadConstant| $ 32) |z0| (QREFELT $ 33))
                          (SPADCALL (QREFELT $ 29)))
                         (#3#
                          (SEQ
                           (LETT |tp|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 72)
                                             (SPADCALL 1 (|spadConstant| $ 26)
                                                       (QREFELT $ 43))
                                             (QREFELT $ 44))
                                   (|QALGSET;npoly| |n0| $) (QREFELT $ 73))
                                  (|spadConstant| $ 74) (QREFELT $ 75))
                                 . #4#)
                           (LETT |ngb|
                                 (SPADCALL
                                  (CONS |tp|
                                        (PROGN
                                         (LETT #2# NIL . #4#)
                                         (SEQ (LETT |g| NIL . #4#)
                                              (LETT #1# |z0| . #4#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |g| (CAR #1#) . #4#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (|QALGSET;npoly| |g| $)
                                                       #2#)
                                                      . #4#)))
                                              (LETT #1# (CDR #1#) . #4#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#)))))
                                  (QREFELT $ 78))
                                 . #4#)
                           (EXIT
                            (COND
                             ((SPADCALL (|spadConstant| $ 74) |ngb|
                                        (QREFELT $ 79))
                              (SPADCALL (QREFELT $ 29)))
                             (#3#
                              (SEQ (LETT |gb| NIL . #4#)
                                   (SEQ G190
                                        (COND
                                         ((NULL (NULL (NULL |ngb|)))
                                          (GO G191)))
                                        (SEQ
                                         (SEQ
                                          (LETT |f|
                                                (|QALGSET;oldpoly|
                                                 (|SPADfirst| |ngb|) $)
                                                . #4#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |f| 0)
                                             (LETT |gb| (CONS (QCDR |f|) |gb|)
                                                   . #4#)))))
                                         (EXIT (LETT |ngb| (CDR |ngb|) . #4#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (VECTOR (CONS 0 NIL) |gb|
                                            (SPADCALL
                                             (SPADCALL |n0| |gb|
                                                       (QREFELT $ 23))
                                             (QREFELT $ 34)))))))))))))))))) 

(SDEFUN |QALGSET;minset|
        ((|lset| |List| (|List| |Dpoly|)) ($ |List| (|List| |Dpoly|)))
        (SPROG ((#1=#:G830 NIL) (|s| NIL) (#2=#:G829 NIL))
               (SEQ
                (COND ((NULL |lset|) |lset|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|QALGSET;minset|))
                        (SEQ (LETT |s| NIL . #3#) (LETT #1# |lset| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (|QALGSET;overset?| |s| |lset| $))
                                 (LETT #2# (CONS |s| #2#) . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |QALGSET;overset?|
        ((|p| |List| |Dpoly|) (|qlist| |List| (|List| |Dpoly|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G832 NIL) (#2=#:G831 #3=(|Boolean|)) (#4=#:G833 #3#)
          (#5=#:G836 NIL) (|q| NIL))
         (SEQ
          (COND ((NULL |qlist|) NIL)
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|QALGSET;overset?|))
                  (SEQ (LETT |q| NIL . #7#) (LETT #5# |qlist| . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL (SPADCALL |q| (QREFELT $ 81))
                                          (SPADCALL |p| (QREFELT $ 81))
                                          (QREFELT $ 82))
                                . #7#)
                          (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#)) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(DECLAIM (NOTINLINE |QuasiAlgebraicSet;|)) 

(DEFUN |QuasiAlgebraicSet| (&REST #1=#:G838)
  (SPROG NIL
         (PROG (#2=#:G839)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|QuasiAlgebraicSet|)
                                               '|domainEqualList|)
                    . #3=(|QuasiAlgebraicSet|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |QuasiAlgebraicSet;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|QuasiAlgebraicSet|)))))))))) 

(DEFUN |QuasiAlgebraicSet;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|QuasiAlgebraicSet|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|QuasiAlgebraicSet| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 86) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|)))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|QuasiAlgebraicSet|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10
              (|Record| (|:| |status| (|Union| (|Boolean|) "failed"))
                        (|:| |zero| (|List| |#4|)) (|:| |nzero| |#4|)))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|HasCategory| |#1| '(|CharacteristicZero|))
        (PROGN
         (QSETREFV $ 35
                   (CONS (|dispatchFunction| |QALGSET;simplify;2$;2|) $)))))))
    $))) 

(MAKEPROP '|QuasiAlgebraicSet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (|Boolean|) (0 . |ground?|)
              (|Factored| 9) (|MultivariateFactorize| 7 8 6 9) (5 . |factor|)
              (|Record| (|:| |factor| 9) (|:| |exponent| (|Integer|)))
              (|List| 16) (10 . |factors|) (|List| 9)
              (|GroebnerPackage| 6 8 7 9) (15 . |groebner|)
              (|GroebnerInternalPackage| 6 8 7 9) (20 . |redPol|)
              |QALGSET;quasiAlgebraicSet;LDpoly$;12| (26 . |Zero|)
              (30 . |Zero|) (34 . |Zero|) (38 . =) |QALGSET;empty;$;7|
              (44 . |setDifference|) (50 . *) (56 . |One|) (60 . |member?|)
              (66 . |primitivePart|) (71 . |simplify|) (76 . |zero?|)
              (|PolynomialRing| 6 42) (81 . |Zero|) (85 . |leadingCoefficient|)
              (90 . |degree|) (|NonNegativeInteger|) (|Product| 41 8)
              (95 . |construct|) (101 . |monomial|) (107 . |reductum|)
              (112 . +) (118 . =) (124 . |degree|) (129 . |first|) (134 . ~=)
              (140 . |reductum|) (145 . |leadingCoefficient|) (150 . |second|)
              (155 . |monomial|) (161 . +) (|Union| 11 '"failed") (167 . =)
              (|OutputForm|) (173 . |coerce|) (178 . |hconcat|) (|List| 58)
              (184 . |coerce|) (|List| $) (189 . |bracket|)
              |QALGSET;coerce;$Of;5| |QALGSET;idealSimplify;2$;13|
              |QALGSET;empty?;$B;6| |QALGSET;status;$U;8|
              |QALGSET;setStatus;$U$;9| |QALGSET;definingEquations;$L;10|
              |QALGSET;definingInequation;$Dpoly;11| (194 . |One|) (198 . *)
              (204 . |One|) (208 . -) (|List| 37) (|GroebnerPackage| 6 42 7 37)
              (214 . |groebner|) (219 . |member?|) (|Set| 9) (225 . |brace|)
              (230 . <) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 236 |status| 242 |simplify| 247 |setStatus| 252
              |quasiAlgebraicSet| 258 |latex| 264 |idealSimplify| 269
              |hashUpdate!| 274 |hash| 280 |empty?| 285 |empty| 290
              |definingInequation| 294 |definingEquations| 299 |coerce| 304 =
              309)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 58))
                        (|makeByteWordVec2| 85
                                            '(1 9 11 0 12 1 14 13 9 15 1 13 17
                                              0 18 1 20 19 19 21 2 22 9 9 19 23
                                              0 6 0 25 0 8 0 26 0 9 0 27 2 9 11
                                              0 0 28 2 19 0 0 0 30 2 9 0 0 0 31
                                              0 9 0 32 2 19 11 9 0 33 1 9 0 0
                                              34 1 0 0 0 35 1 9 11 0 36 0 37 0
                                              38 1 9 6 0 39 1 9 8 0 40 2 42 0
                                              41 8 43 2 37 0 6 42 44 1 9 0 0 45
                                              2 37 0 0 0 46 2 37 11 0 0 47 1 37
                                              42 0 48 1 42 41 0 49 2 41 11 0 0
                                              50 1 37 0 0 51 1 37 6 0 52 1 42 8
                                              0 53 2 9 0 6 8 54 2 9 0 0 0 55 2
                                              56 11 0 0 57 1 9 58 0 59 2 58 0 0
                                              0 60 1 61 58 0 62 1 58 0 63 64 0
                                              6 0 72 2 37 0 0 0 73 0 37 0 74 2
                                              37 0 0 0 75 1 77 76 76 78 2 76 11
                                              37 0 79 1 80 0 19 81 2 80 11 0 0
                                              82 2 0 11 0 0 1 1 0 56 0 68 1 1 0
                                              0 35 2 0 0 0 56 69 2 0 0 19 9 24
                                              1 0 84 0 1 1 0 0 0 66 2 0 83 83 0
                                              1 1 0 85 0 1 1 0 11 0 67 0 0 0 29
                                              1 0 9 0 71 1 0 19 0 70 1 0 58 0
                                              65 2 0 11 0 0 1)))))
           '|lookupComplete|)) 
