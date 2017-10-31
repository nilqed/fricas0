
(SDEFUN |EMR;divide;2$R;1|
        ((|x| $) (|y| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((|r| (|Record| (|:| |quotient| R) (|:| |remainder| R))) (|yv| (R))
          (|invlcy| (R)) (|xm| (|Mod|)) (|t| (|Union| |Mod| "failed")))
         (SEQ
          (LETT |t| (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 10))
                . #1=(|EMR;divide;2$R;1|))
          (EXIT
           (COND ((QEQCAR |t| 1) (|error| "incompatible moduli"))
                 (#2='T
                  (SEQ (LETT |xm| (QCDR |t|) . #1#)
                       (LETT |yv| (QCAR |y|) . #1#)
                       (COND
                        ((SPADCALL (SPADCALL |yv| (QREFELT $ 13))
                                   (|spadConstant| $ 14) (QREFELT $ 16))
                         (LETT |invlcy| (|spadConstant| $ 17) . #1#))
                        (#2#
                         (SEQ
                          (LETT |invlcy|
                                (QCAR
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |yv| (QREFELT $ 13))
                                             (QREFELT $ 18))
                                   |xm| (QREFELT $ 19))
                                  (QREFELT $ 20)))
                                . #1#)
                          (EXIT
                           (LETT |yv|
                                 (SPADCALL
                                  (SPADCALL |invlcy| |yv| (QREFELT $ 21)) |xm|
                                  (QREFELT $ 9))
                                 . #1#)))))
                       (LETT |r| (SPADCALL (QCAR |x|) |yv| (QREFELT $ 23))
                             . #1#)
                       (EXIT
                        (CONS
                         (SPADCALL
                          (SPADCALL |invlcy| (QCAR |r|) (QREFELT $ 21)) |xm|
                          (QREFELT $ 19))
                         (SPADCALL (QCDR |r|) |xm| (QREFELT $ 19))))))))))) 

(SDEFUN |EMR;rem;3$;2| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G754 NIL) (|xv| (R)) (#2=#:G747 NIL) (|xvl| (R))
          (|d| (|Integer|)) (|dy| (|NonNegativeInteger|)) (|yv| (R))
          (|invlcy| (R)) (|xm| (|Mod|)) (|t| (|Union| |Mod| "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |t| (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 10))
                  . #3=(|EMR;rem;3$;2|))
            (EXIT
             (COND ((QEQCAR |t| 1) (|error| "incompatible moduli"))
                   ('T
                    (SEQ (LETT |xm| (QCDR |t|) . #3#)
                         (LETT |yv| (QCAR |y|) . #3#)
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |yv| (QREFELT $ 13))
                                      (|spadConstant| $ 14) (QREFELT $ 16)))
                           (SEQ
                            (LETT |invlcy|
                                  (QCAR
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |yv| (QREFELT $ 13))
                                               (QREFELT $ 18))
                                     |xm| (QREFELT $ 19))
                                    (QREFELT $ 20)))
                                  . #3#)
                            (EXIT
                             (LETT |yv|
                                   (SPADCALL
                                    (SPADCALL |invlcy| |yv| (QREFELT $ 21))
                                    |xm| (QREFELT $ 9))
                                   . #3#)))))
                         (LETT |dy| (SPADCALL |yv| (QREFELT $ 26)) . #3#)
                         (LETT |xv| (QCAR |x|) . #3#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (>=
                                  (LETT |d|
                                        (- (SPADCALL |xv| (QREFELT $ 26)) |dy|)
                                        . #3#)
                                  0))
                                (GO G191)))
                              (SEQ
                               (LETT |xvl|
                                     (SPADCALL (SPADCALL |xv| (QREFELT $ 27))
                                               |xm| (QREFELT $ 9))
                                     . #3#)
                               (EXIT
                                (COND
                                 ((SPADCALL |xvl| (|spadConstant| $ 30)
                                            (QREFELT $ 31))
                                  (LETT |xv| (SPADCALL |xv| (QREFELT $ 32))
                                        . #3#))
                                 ('T
                                  (SEQ
                                   (LETT |xv|
                                         (SPADCALL |xvl|
                                                   (SPADCALL |xv|
                                                             (QREFELT $ 32))
                                                   (QREFELT $ 33))
                                         . #3#)
                                   (LETT |xv|
                                         (SPADCALL |xv|
                                                   (PROG1 (LETT #2# |d| . #3#)
                                                     (|check_subtype2|
                                                      (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                                   (SPADCALL |xv|
                                                             (QREFELT $ 13))
                                                   |yv| (QREFELT $ 34))
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |xv| (|spadConstant| $ 30)
                                                (QREFELT $ 31))
                                      (PROGN
                                       (LETT #1# (CONS |xv| |xm|) . #3#)
                                       (GO #4=#:G753))))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (CONS (SPADCALL |xv| |xm| (QREFELT $ 9)) |xm|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |EMR;rem;3$;3| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|r| (|Record| (|:| |quotient| R) (|:| |remainder| R))) (|yv| (R))
          (|invlcy| (R)) (|xm| (|Mod|)) (|t| (|Union| |Mod| "failed")))
         (SEQ
          (LETT |t| (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 10))
                . #1=(|EMR;rem;3$;3|))
          (EXIT
           (COND ((QEQCAR |t| 1) (|error| "incompatible moduli"))
                 ('T
                  (SEQ (LETT |xm| (QCDR |t|) . #1#)
                       (LETT |yv| (QCAR |y|) . #1#)
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |yv| (QREFELT $ 13))
                                    (|spadConstant| $ 14) (QREFELT $ 16)))
                         (SEQ
                          (LETT |invlcy|
                                (QCAR
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |yv| (QREFELT $ 13))
                                             (QREFELT $ 18))
                                   |xm| (QREFELT $ 19))
                                  (QREFELT $ 20)))
                                . #1#)
                          (EXIT
                           (LETT |yv|
                                 (SPADCALL
                                  (SPADCALL |invlcy| |yv| (QREFELT $ 21)) |xm|
                                  (QREFELT $ 9))
                                 . #1#)))))
                       (LETT |r| (SPADCALL (QCAR |x|) |yv| (QREFELT $ 23))
                             . #1#)
                       (EXIT (SPADCALL (QCDR |r|) |xm| (QREFELT $ 19)))))))))) 

(SDEFUN |EMR;euclideanSize;$Nni;4| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL (QCAR |x|) (QREFELT $ 26))) 

(SDEFUN |EMR;unitCanonical;2$;5| ((|x| $) ($ $))
        (SPROG ((|invlcx| ($)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 37)) |x|)
                      ((EQL (SPADCALL (QCAR |x|) (QREFELT $ 26)) 0)
                       (|spadConstant| $ 38))
                      ((SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 13))
                                 (|spadConstant| $ 14) (QREFELT $ 16))
                       |x|)
                      ('T
                       (SEQ
                        (LETT |invlcx|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 13))
                                          (QREFELT $ 18))
                                (QCDR |x|) (QREFELT $ 19))
                               (QREFELT $ 20))
                              |EMR;unitCanonical;2$;5|)
                        (EXIT (SPADCALL |invlcx| |x| (QREFELT $ 39))))))))) 

(SDEFUN |EMR;unitNormal;$R;6|
        ((|x| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (SPROG ((|invlcx| ($)) (|lcx| ($)))
               (SEQ
                (COND
                 ((OR (SPADCALL |x| (QREFELT $ 37))
                      (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 13))
                                (|spadConstant| $ 14) (QREFELT $ 16)))
                  (VECTOR (|spadConstant| $ 38) |x| (|spadConstant| $ 38)))
                 ('T
                  (SEQ
                   (LETT |lcx|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 13))
                                    (QREFELT $ 18))
                          (QCDR |x|) (QREFELT $ 19))
                         . #1=(|EMR;unitNormal;$R;6|))
                   (LETT |invlcx| (SPADCALL |lcx| (QREFELT $ 20)) . #1#)
                   (EXIT
                    (COND
                     ((EQL (SPADCALL (QCAR |x|) (QREFELT $ 26)) 0)
                      (VECTOR |lcx| (|spadConstant| $ 38) |invlcx|))
                     ('T
                      (VECTOR |lcx| (SPADCALL |invlcx| |x| (QREFELT $ 39))
                              |invlcx|)))))))))) 

(SDEFUN |EMR;elt;$2R;7| ((|x| $) (|s| R) ($ R))
        (SPADCALL (SPADCALL (QCAR |x|) |s| (QREFELT $ 43)) (QCDR |x|)
                  (QREFELT $ 9))) 

(DECLAIM (NOTINLINE |EuclideanModularRing;|)) 

(DEFUN |EuclideanModularRing| (&REST #1=#:G800)
  (SPROG NIL
         (PROG (#2=#:G801)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|EuclideanModularRing|)
                                               '|domainEqualList|)
                    . #3=(|EuclideanModularRing|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |EuclideanModularRing;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|EuclideanModularRing|)))))))))) 

(DEFUN |EuclideanModularRing;| (|#1| |#2| |#3| |#4| |#5| |#6|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$6 NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|EuclideanModularRing|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT DV$6 (|devaluate| |#6|) . #1#)
    (LETT |dv$| (LIST '|EuclideanModularRing| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6)
          . #1#)
    (LETT $ (GETREFV 60) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|EuclideanModularRing|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (QSETREFV $ 11 |#6|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12 (|Record| (|:| |val| |#2|) (|:| |modulo| |#3|)))
    (COND
     ((|HasSignature| |#2|
                      (LIST '|fmecg|
                            (LIST (|devaluate| |#2|) (|devaluate| |#2|)
                                  '(|NonNegativeInteger|) (|devaluate| |#1|)
                                  (|devaluate| |#2|))))
      (QSETREFV $ 35 (CONS (|dispatchFunction| |EMR;rem;3$;2|) $)))
     ('T (QSETREFV $ 35 (CONS (|dispatchFunction| |EMR;rem;3$;3|) $))))
    $))) 

(MAKEPROP '|EuclideanModularRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ModularRing| 7 8 9 10 11) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|local| |#6|) '|Rep| (0 . |leadingCoefficient|) (5 . |One|)
              (|Boolean|) (9 . =) (15 . |One|) (19 . |coerce|) (24 . |reduce|)
              (30 . |inv|) (35 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (41 . |monicDivide|) |EMR;divide;2$R;1| (|NonNegativeInteger|)
              (47 . |degree|) (52 . |leadingMonomial|) (57 . |Zero|)
              (61 . |Zero|) (65 . |Zero|) (69 . =) (75 . |reductum|) (80 . +)
              (86 . |fmecg|) (94 . |rem|) |EMR;euclideanSize;$Nni;4|
              (100 . |zero?|) (105 . |One|) (109 . *) |EMR;unitCanonical;2$;5|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |EMR;unitNormal;$R;6| (115 . |elt|) |EMR;elt;$2R;7|
              (|Union| $ '"failed") (|Union| 47 '#1="failed") (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 49 '#1#)
              (|Record| (|:| |coef| 47) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Integer|) (|PositiveInteger|) (|HashState|) (|String|)
              (|OutputForm|) (|SingleInteger|))
           '#(|zero?| 121 |unitNormal| 126 |unitCanonical| 131 |rem| 136
              |reduce| 142 |inv| 148 |euclideanSize| 153 |elt| 158 |divide| 164
              |Zero| 170 |One| 174 * 178)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|EuclideanDomain&| NIL |GcdDomain&| NIL NIL |Algebra&| NIL
                |EntireRing&| |Module&| NIL |Ring&| NIL |Rng&| NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|EuclideanDomain|) (|PrincipalIdealDomain|) (|GcdDomain|)
                 (|IntegralDomain|) (|LeftOreRing|) (|Algebra| $$)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 58))
              (|makeByteWordVec2| 44
                                  '(1 7 6 0 13 0 6 0 14 2 6 15 0 0 16 0 7 0 17
                                    1 7 0 6 18 2 0 0 7 8 19 1 0 0 0 20 2 7 0 0
                                    0 21 2 7 22 0 0 23 1 7 25 0 26 1 7 0 0 27 0
                                    0 0 28 0 6 0 29 0 7 0 30 2 7 15 0 0 31 1 7
                                    0 0 32 2 7 0 0 0 33 4 7 0 0 25 6 0 34 2 0 0
                                    0 0 35 1 0 15 0 37 0 0 0 38 2 0 0 0 0 39 2
                                    7 0 0 0 43 1 0 15 0 37 1 0 41 0 42 1 0 0 0
                                    40 2 0 0 0 0 35 2 0 0 7 8 19 1 0 0 0 20 1 0
                                    25 0 36 2 0 7 0 7 44 2 0 22 0 0 24 0 0 0 28
                                    0 0 0 38 2 0 0 0 0 39)))))
           '|lookupIncomplete|)) 
