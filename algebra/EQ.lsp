
(SDEFUN |EQ;factorAndSplit;$L;1| ((|eq| $) ($ |List| $))
        (SPROG ((#1=#:G711 NIL) (|rcf| NIL) (#2=#:G710 NIL) (|eq0| ($)))
               (SEQ
                (COND
                 ((|HasSignature| (QREFELT $ 6)
                                  (LIST '|factor|
                                        (LIST
                                         (LIST '|Factored|
                                               (|devaluate| (QREFELT $ 6)))
                                         (|devaluate| (QREFELT $ 6)))))
                  (SEQ
                   (LETT |eq0| (SPADCALL |eq| (QREFELT $ 8))
                         . #3=(|EQ;factorAndSplit;$L;1|))
                   (EXIT
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |rcf| NIL . #3#)
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |eq0| (QREFELT $ 9))
                                           (QREFELT $ 11))
                                 (QREFELT $ 15))
                                . #3#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |rcf| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (QCAR |rcf|) (|spadConstant| $ 16)
                                             (QREFELT $ 17))
                                   #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))
                 ('T (LIST |eq|)))))) 

(PUT '|EQ;=;2S$;2| '|SPADreplace| 'CONS) 

(SDEFUN |EQ;=;2S$;2| ((|l| S) (|r| S) ($ $)) (CONS |l| |r|)) 

(PUT '|EQ;equation;2S$;3| '|SPADreplace| 'CONS) 

(SDEFUN |EQ;equation;2S$;3| ((|l| S) (|r| S) ($ $)) (CONS |l| |r|)) 

(PUT '|EQ;lhs;$S;4| '|SPADreplace| 'QCAR) 

(SDEFUN |EQ;lhs;$S;4| ((|eqn| $) ($ S)) (QCAR |eqn|)) 

(PUT '|EQ;rhs;$S;5| '|SPADreplace| 'QCDR) 

(SDEFUN |EQ;rhs;$S;5| ((|eqn| $) ($ S)) (QCDR |eqn|)) 

(SDEFUN |EQ;swap;2$;6| ((|eqn| $) ($ $))
        (CONS (SPADCALL |eqn| (QREFELT $ 21)) (SPADCALL |eqn| (QREFELT $ 9)))) 

(SDEFUN |EQ;map;M2$;7| ((|fn| |Mapping| S S) (|eqn| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |eqn|) |fn|) (SPADCALL (QCDR |eqn|) |fn|)
                  (QREFELT $ 17))) 

(SDEFUN |EQ;eval;$SS$;8| ((|eqn| $) (|s| |Symbol|) (|x| S) ($ $))
        (SPADCALL (SPADCALL (QCAR |eqn|) |s| |x| (QREFELT $ 26))
                  (SPADCALL (QCDR |eqn|) |s| |x| (QREFELT $ 26))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;eval;$LL$;9|
        ((|eqn| $) (|ls| |List| (|Symbol|)) (|lx| |List| S) ($ $))
        (SPADCALL (SPADCALL (QCAR |eqn|) |ls| |lx| (QREFELT $ 30))
                  (SPADCALL (QCDR |eqn|) |ls| |lx| (QREFELT $ 30))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;eval;3$;10| ((|eqn1| $) (|eqn2| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |eqn1|) |eqn2| (QREFELT $ 33))
                  (SPADCALL (QCDR |eqn1|) |eqn2| (QREFELT $ 33))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;eval;$L$;11| ((|eqn1| $) (|leqn2| |List| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |eqn1|) |leqn2| (QREFELT $ 36))
                  (SPADCALL (QCDR |eqn1|) |leqn2| (QREFELT $ 36))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;=;2$B;12| ((|eq1| $) (|eq2| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT $ 39))
          (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT $ 39)))
         ('T NIL))) 

(SDEFUN |EQ;coerce;$Of;13| ((|eqn| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL (QCAR |eqn|) (QREFELT $ 42))
                  (SPADCALL (QCDR |eqn|) (QREFELT $ 42)) (QREFELT $ 43))) 

(SDEFUN |EQ;coerce;$B;14| ((|eqn| $) ($ |Boolean|))
        (SPADCALL (QCAR |eqn|) (QCDR |eqn|) (QREFELT $ 39))) 

(SDEFUN |EQ;+;3$;15| ((|eq1| $) (|eq2| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT $ 46))
                  (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT $ 46))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;+;S2$;16| ((|s| S) (|eq2| $) ($ $))
        (SPADCALL (CONS |s| |s|) |eq2| (QREFELT $ 47))) 

(SDEFUN |EQ;+;$S$;17| ((|eq1| $) (|s| S) ($ $))
        (SPADCALL |eq1| (CONS |s| |s|) (QREFELT $ 47))) 

(SDEFUN |EQ;-;2$;18| ((|eq| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 50))
                  (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 50))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;-;S2$;19| ((|s| S) (|eq2| $) ($ $))
        (SPADCALL (CONS |s| |s|) |eq2| (QREFELT $ 52))) 

(SDEFUN |EQ;-;$S$;20| ((|eq1| $) (|s| S) ($ $))
        (SPADCALL |eq1| (CONS |s| |s|) (QREFELT $ 52))) 

(SDEFUN |EQ;leftZero;2$;21| ((|eq| $) ($ $))
        (SPADCALL (|spadConstant| $ 16)
                  (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                            (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 56))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;rightZero;2$;22| ((|eq| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (SPADCALL |eq| (QREFELT $ 21))
                   (QREFELT $ 56))
         (|spadConstant| $ 16) (QREFELT $ 20))) 

(SDEFUN |EQ;Zero;$;23| (($ $))
        (SPADCALL (|spadConstant| $ 16) (|spadConstant| $ 16) (QREFELT $ 17))) 

(SDEFUN |EQ;-;3$;24| ((|eq1| $) (|eq2| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT $ 56))
                  (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT $ 56))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;*;3$;25| ((|eq1| $) (|eq2| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT $ 58))
                  (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT $ 58))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;*;S2$;26| ((|l| S) (|eqn| $) ($ $))
        (SPADCALL (SPADCALL |l| (QCAR |eqn|) (QREFELT $ 58))
                  (SPADCALL |l| (QCDR |eqn|) (QREFELT $ 58)) (QREFELT $ 20))) 

(SDEFUN |EQ;*;S2$;27| ((|l| S) (|eqn| $) ($ $))
        (SPADCALL (SPADCALL |l| (QCAR |eqn|) (QREFELT $ 58))
                  (SPADCALL |l| (QCDR |eqn|) (QREFELT $ 58)) (QREFELT $ 20))) 

(SDEFUN |EQ;*;$S$;28| ((|eqn| $) (|l| S) ($ $))
        (SPADCALL (SPADCALL (QCAR |eqn|) |l| (QREFELT $ 58))
                  (SPADCALL (QCDR |eqn|) |l| (QREFELT $ 58)) (QREFELT $ 20))) 

(SDEFUN |EQ;One;$;29| (($ $))
        (SPADCALL (|spadConstant| $ 62) (|spadConstant| $ 62) (QREFELT $ 17))) 

(SDEFUN |EQ;recip;$U;30| ((|eq| $) ($ |Union| $ #1="failed"))
        (SPROG ((|rh| #2=(|Union| S #1#)) (|lh| #2#))
               (SEQ
                (LETT |lh|
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 65))
                      . #3=(|EQ;recip;$U;30|))
                (EXIT
                 (COND ((QEQCAR |lh| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ
                         (LETT |rh|
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                                         (QREFELT $ 65))
                               . #3#)
                         (EXIT
                          (COND ((QEQCAR |rh| 1) (CONS 1 "failed"))
                                (#4#
                                 (CONS 0
                                       (CONS (QCDR |lh|) (QCDR |rh|))))))))))))) 

(SDEFUN |EQ;leftOne;$U;31| ((|eq| $) ($ |Union| $ "failed"))
        (SPROG ((|re| (|Union| S "failed")))
               (SEQ
                (LETT |re|
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 65))
                      |EQ;leftOne;$U;31|)
                (EXIT
                 (COND ((QEQCAR |re| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (|spadConstant| $ 62)
                                        (SPADCALL
                                         (SPADCALL |eq| (QREFELT $ 21))
                                         (QCDR |re|) (QREFELT $ 58))
                                        (QREFELT $ 20))))))))) 

(SDEFUN |EQ;rightOne;$U;32| ((|eq| $) ($ |Union| $ "failed"))
        (SPROG ((|re| (|Union| S "failed")))
               (SEQ
                (LETT |re|
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 65))
                      |EQ;rightOne;$U;32|)
                (EXIT
                 (COND ((QEQCAR |re| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 9))
                                         (QCDR |re|) (QREFELT $ 58))
                               (|spadConstant| $ 62) (QREFELT $ 20))))))))) 

(SDEFUN |EQ;inv;2$;33| ((|eq| $) ($ $))
        (CONS (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 69))
              (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 69)))) 

(SDEFUN |EQ;leftOne;$U;34| ((|eq| $) ($ |Union| $ "failed"))
        (CONS 0
              (SPADCALL (|spadConstant| $ 62)
                        (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                                  (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                                            (QREFELT $ 69))
                                  (QREFELT $ 58))
                        (QREFELT $ 20)))) 

(SDEFUN |EQ;rightOne;$U;35| ((|eq| $) ($ |Union| $ "failed"))
        (CONS 0
              (SPADCALL
               (SPADCALL (SPADCALL |eq| (QREFELT $ 9))
                         (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                                   (QREFELT $ 69))
                         (QREFELT $ 58))
               (|spadConstant| $ 62) (QREFELT $ 20)))) 

(SDEFUN |EQ;characteristic;Nni;36| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 72))) 

(SDEFUN |EQ;*;I2$;37| ((|i| |Integer|) (|eq| $) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 75)) |eq| (QREFELT $ 60))) 

(SDEFUN |EQ;factorAndSplit;$L;38| ((|eq| $) ($ |List| $))
        (SPROG
         ((#1=#:G800 NIL) (|rcf| NIL) (#2=#:G799 NIL)
          (|p| (|Polynomial| (|Integer|))) (|eq0| ($)) (#3=#:G798 NIL)
          (#4=#:G797 NIL))
         (SEQ
          (COND
           ((|HasSignature| (QREFELT $ 6)
                            (LIST '|factor|
                                  (LIST
                                   (LIST '|Factored|
                                         (|devaluate| (QREFELT $ 6)))
                                   (|devaluate| (QREFELT $ 6)))))
            (SEQ
             (LETT |eq0| (SPADCALL |eq| (QREFELT $ 8))
                   . #5=(|EQ;factorAndSplit;$L;38|))
             (EXIT
              (PROGN
               (LETT #4# NIL . #5#)
               (SEQ (LETT |rcf| NIL . #5#)
                    (LETT #3#
                          (SPADCALL
                           (SPADCALL (SPADCALL |eq0| (QREFELT $ 9))
                                     (QREFELT $ 11))
                           (QREFELT $ 15))
                          . #5#)
                    G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |rcf| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #4#
                            (CONS
                             (SPADCALL (QCAR |rcf|) (|spadConstant| $ 16)
                                       (QREFELT $ 17))
                             #4#)
                            . #5#)))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#)))))))
           ((EQUAL (QREFELT $ 6) (|Polynomial| (|Integer|)))
            (SEQ (LETT |eq0| (SPADCALL |eq| (QREFELT $ 8)) . #5#)
                 (LETT |p| (SPADCALL |eq0| (QREFELT $ 9)) . #5#)
                 (EXIT
                  (PROGN
                   (LETT #2# NIL . #5#)
                   (SEQ (LETT |rcf| NIL . #5#)
                        (LETT #1#
                              (SPADCALL (SPADCALL |p| (QREFELT $ 80))
                                        (QREFELT $ 83))
                              . #5#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |rcf| (CAR #1#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL (QCAR |rcf|) (|spadConstant| $ 16)
                                           (QREFELT $ 17))
                                 #2#)
                                . #5#)))
                        (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))
           ('T (LIST |eq|)))))) 

(SDEFUN |EQ;differentiate;$S$;39| ((|eq| $) (|sym| |Symbol|) ($ $))
        (CONS (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) |sym| (QREFELT $ 84))
              (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) |sym| (QREFELT $ 84)))) 

(SDEFUN |EQ;dimension;Cn;40| (($ |CardinalNumber|)) (SPADCALL 2 (QREFELT $ 87))) 

(SDEFUN |EQ;/;3$;41| ((|eq1| $) (|eq2| $) ($ $))
        (SPADCALL (SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT $ 89))
                  (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT $ 89))
                  (QREFELT $ 20))) 

(SDEFUN |EQ;inv;2$;42| ((|eq| $) ($ $))
        (CONS (SPADCALL (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 69))
              (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 69)))) 

(SDEFUN |EQ;subst;3$;43| ((|eq1| $) (|eq2| $) ($ $))
        (SPROG ((|eq3| (|Equation| S)))
               (SEQ (LETT |eq3| |eq2| |EQ;subst;3$;43|)
                    (EXIT
                     (CONS
                      (SPADCALL (SPADCALL |eq1| (QREFELT $ 9)) |eq3|
                                (QREFELT $ 92))
                      (SPADCALL (SPADCALL |eq1| (QREFELT $ 21)) |eq3|
                                (QREFELT $ 92))))))) 

(DECLAIM (NOTINLINE |Equation;|)) 

(DEFUN |Equation| (#1=#:G814)
  (SPROG NIL
         (PROG (#2=#:G815)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Equation|)
                                               '|domainEqualList|)
                    . #3=(|Equation|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Equation;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Equation|)))))))))) 

(DEFUN |Equation;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G810 NIL) (#2=#:G811 NIL) (#3=#:G812 NIL) (#4=#:G813 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Equation|))
    (LETT |dv$| (LIST '|Equation| DV$1) . #5#)
    (LETT $ (GETREFV 99) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#1| '(|Field|))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|)))
                                             (|HasCategory| |#1|
                                                            '(|SetCategory|))
                                             (LETT #4#
                                                   (|HasCategory| |#1|
                                                                  '(|Ring|))
                                                   . #5#)
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              #4#)
                                             (|HasCategory| |#1|
                                                            '(|AbelianGroup|))
                                             (|HasCategory| |#1|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #4#)
                                             (|HasCategory| |#1| '(|Monoid|))
                                             (LETT #3#
                                                   (|HasCategory| |#1|
                                                                  '(|Group|))
                                                   . #5#)
                                             (OR #3# #4#)
                                             (OR #3#
                                                 (|HasCategory| |#1|
                                                                '(|Monoid|)))
                                             (|HasCategory| |#1|
                                                            (LIST
                                                             '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1|
                                                              '(|CommutativeRing|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               #4#)
                                              (|HasCategory| |#1| '(|Monoid|)))
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1|
                                                              '(|CommutativeRing|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               #4#))
                                             (OR
                                              (|HasCategory| |#1| '(|Field|))
                                              #3#)
                                             (LETT #2#
                                                   (|HasCategory| |#1|
                                                                  '(|SemiGroup|))
                                                   . #5#)
                                             (OR #3#
                                                 (|HasCategory| |#1|
                                                                '(|Monoid|))
                                                 #2#)
                                             (AND
                                              (|HasCategory| |#1|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#1|)))
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                             (LETT #1#
                                                   (|HasCategory| |#1|
                                                                  '(|AbelianSemiGroup|))
                                                   . #5#)
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              #4#)
                                             (OR
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              #3#
                                              (|HasCategory| |#1| '(|Monoid|))
                                              #4# #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#1|
                                                            '(|IntegralDomain|))
                                             (|HasCategory| |#1|
                                                            '(|ExpressionSpace|))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|Equation| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Record| (|:| |lhs| |#1|) (|:| |rhs| |#1|)))
    (COND
     ((|testBitVector| |pv$| 23)
      (QSETREFV $ 19 (CONS (|dispatchFunction| |EQ;factorAndSplit;$L;1|) $))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV $ 27 (CONS (|dispatchFunction| |EQ;eval;$SS$;8|) $))
       (QSETREFV $ 31 (CONS (|dispatchFunction| |EQ;eval;$LL$;9|) $)))))
    (COND
     ((|HasCategory| |#1| (LIST '|Evalable| (|devaluate| |#1|)))
      (PROGN
       (QSETREFV $ 34 (CONS (|dispatchFunction| |EQ;eval;3$;10|) $))
       (QSETREFV $ 37 (CONS (|dispatchFunction| |EQ;eval;$L$;11|) $)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 40 (CONS (|dispatchFunction| |EQ;=;2$B;12|) $))
       (QSETREFV $ 44 (CONS (|dispatchFunction| |EQ;coerce;$Of;13|) $))
       (QSETREFV $ 45 (CONS (|dispatchFunction| |EQ;coerce;$B;14|) $)))))
    (COND
     ((|testBitVector| |pv$| 20)
      (PROGN
       (QSETREFV $ 47 (CONS (|dispatchFunction| |EQ;+;3$;15|) $))
       (QSETREFV $ 48 (CONS (|dispatchFunction| |EQ;+;S2$;16|) $))
       (QSETREFV $ 49 (CONS (|dispatchFunction| |EQ;+;$S$;17|) $)))))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV $ 51 (CONS (|dispatchFunction| |EQ;-;2$;18|) $))
       (QSETREFV $ 53 (CONS (|dispatchFunction| |EQ;-;S2$;19|) $))
       (QSETREFV $ 54 (CONS (|dispatchFunction| |EQ;-;$S$;20|) $))
       (QSETREFV $ 57 (CONS (|dispatchFunction| |EQ;leftZero;2$;21|) $))
       (QSETREFV $ 8 (CONS (|dispatchFunction| |EQ;rightZero;2$;22|) $))
       (QSETREFV $ 55
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EQ;Zero;$;23|) $ 55)))
       (QSETREFV $ 52 (CONS (|dispatchFunction| |EQ;-;3$;24|) $)))))
    (COND
     ((|testBitVector| |pv$| 17)
      (PROGN
       (QSETREFV $ 59 (CONS (|dispatchFunction| |EQ;*;3$;25|) $))
       (QSETREFV $ 60 (CONS (|dispatchFunction| |EQ;*;S2$;26|) $))
       (QSETREFV $ 60 (CONS (|dispatchFunction| |EQ;*;S2$;27|) $))
       (QSETREFV $ 61 (CONS (|dispatchFunction| |EQ;*;$S$;28|) $)))))
    (COND
     ((|testBitVector| |pv$| 9)
      (PROGN
       (QSETREFV $ 63
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EQ;One;$;29|) $ 63)))
       (QSETREFV $ 66 (CONS (|dispatchFunction| |EQ;recip;$U;30|) $))
       (QSETREFV $ 67 (CONS (|dispatchFunction| |EQ;leftOne;$U;31|) $))
       (QSETREFV $ 68 (CONS (|dispatchFunction| |EQ;rightOne;$U;32|) $)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (PROGN
       (QSETREFV $ 70 (CONS (|dispatchFunction| |EQ;inv;2$;33|) $))
       (QSETREFV $ 67 (CONS (|dispatchFunction| |EQ;leftOne;$U;34|) $))
       (QSETREFV $ 68 (CONS (|dispatchFunction| |EQ;rightOne;$U;35|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 73 (CONS (|dispatchFunction| |EQ;characteristic;Nni;36|) $))
       (QSETREFV $ 76 (CONS (|dispatchFunction| |EQ;*;I2$;37|) $)))))
    (COND
     ((|testBitVector| |pv$| 23)
      (QSETREFV $ 19 (CONS (|dispatchFunction| |EQ;factorAndSplit;$L;38|) $))))
    (COND
     ((|testBitVector| |pv$| 7)
      (QSETREFV $ 85 (CONS (|dispatchFunction| |EQ;differentiate;$S$;39|) $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 88 (CONS (|dispatchFunction| |EQ;dimension;Cn;40|) $))
       (QSETREFV $ 90 (CONS (|dispatchFunction| |EQ;/;3$;41|) $))
       (QSETREFV $ 70 (CONS (|dispatchFunction| |EQ;inv;2$;42|) $)))))
    (COND
     ((|testBitVector| |pv$| 24)
      (QSETREFV $ 93 (CONS (|dispatchFunction| |EQ;subst;3$;43|) $))))
    $))) 

(MAKEPROP '|Equation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (0 . |rightZero|)
              |EQ;lhs;$S;4| (|Factored| $) (5 . |factor|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 74)) (|List| 12)
              (|Factored| 6) (10 . |factors|) (15 . |Zero|) |EQ;equation;2S$;3|
              (|List| $) (19 . |factorAndSplit|) |EQ;=;2S$;2| |EQ;rhs;$S;5|
              |EQ;swap;2$;6| (|Mapping| 6 6) |EQ;map;M2$;7| (|Symbol|)
              (24 . |eval|) (31 . |eval|) (|List| 25) (|List| 6) (38 . |eval|)
              (45 . |eval|) (|Equation| 6) (52 . |eval|) (58 . |eval|)
              (|List| 32) (64 . |eval|) (70 . |eval|) (|Boolean|) (76 . =)
              (82 . =) (|OutputForm|) (88 . |coerce|) (93 . =) (99 . |coerce|)
              (104 . |coerce|) (109 . +) (115 . +) (121 . +) (127 . +)
              (133 . -) (138 . -) (143 . -) (149 . -) (155 . -) (161 . |Zero|)
              (165 . -) (171 . |leftZero|) (176 . *) (182 . *) (188 . *)
              (194 . *) (200 . |One|) (204 . |One|) (|Union| $ '"failed")
              (208 . |recip|) (213 . |recip|) (218 . |leftOne|)
              (223 . |rightOne|) (228 . |inv|) (233 . |inv|)
              (|NonNegativeInteger|) (238 . |characteristic|)
              (242 . |characteristic|) (|Integer|) (246 . |coerce|) (251 . *)
              (|Factored| 78) (|Polynomial| 74)
              (|MultivariateFactorize| 25 (|IndexedExponents| 25) 74 78)
              (257 . |factor|) (|Record| (|:| |factor| 78) (|:| |exponent| 74))
              (|List| 81) (262 . |factors|) (267 . |differentiate|)
              (273 . |differentiate|) (|CardinalNumber|) (279 . |coerce|)
              (284 . |dimension|) (288 . /) (294 . /) (|Equation| $)
              (300 . |subst|) (306 . |subst|) (|PositiveInteger|) (|List| 71)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 312 |zero?| 318 |swap| 323 |subtractIfCan| 328 |subst| 334
              |sample| 340 |rightZero| 344 |rightRecip| 349 |rightPower| 354
              |rightOne| 366 |rhs| 371 |recip| 376 |opposite?| 381 |one?| 387
              |map| 392 |lhs| 398 |leftZero| 403 |leftRecip| 408 |leftPower|
              413 |leftOne| 425 |latex| 430 |inv| 435 |hashUpdate!| 440 |hash|
              446 |factorAndSplit| 451 |eval| 456 |equation| 482 |dimension|
              488 |differentiate| 492 |conjugate| 518 |commutator| 524 |coerce|
              530 |characteristic| 545 |associator| 549 |antiCommutator| 556
              |annihilate?| 562 ^ 568 |Zero| 586 |One| 590 D 594 = 620 / 632 -
              644 + 667 * 685)
           'NIL
           (CONS
            (|makeByteWordVec2| 22
                                '(7 8 1 8 4 2 4 5 4 4 5 4 4 4 8 6 10 6 4 12 6 9
                                  8 18 21 18 22 0 3 11 22 3 13))
            (CONS
             '#(|PartialDifferentialRing&| NIL |VectorSpace&| |Rng&| NIL
                |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| |Group&| NIL NIL NIL
                |AbelianMonoid&| |MagmaWithUnit&| |NonAssociativeSemiRng&| NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| NIL NIL NIL
                |BasicType&| NIL |InnerEvalable&|)
             (CONS
              '#((|PartialDifferentialRing| 25) (|Ring|) (|VectorSpace| 6)
                 (|Rng|) (|SemiRing|) (|Module| 6) (|SemiRng|) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|LeftModule| $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|AbelianGroup|) (|Group|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Magma|) (|SetCategory|) (|Type|) (|CoercibleTo| 41)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 38)
                 (|InnerEvalable| 25 6))
              (|makeByteWordVec2| 98
                                  '(1 0 0 0 8 1 6 10 0 11 1 14 13 0 15 0 6 0 16
                                    1 0 18 0 19 3 6 0 0 25 6 26 3 0 0 0 25 6 27
                                    3 6 0 0 28 29 30 3 0 0 0 28 29 31 2 6 0 0
                                    32 33 2 0 0 0 0 34 2 6 0 0 35 36 2 0 0 0 18
                                    37 2 6 38 0 0 39 2 0 38 0 0 40 1 6 41 0 42
                                    2 41 0 0 0 43 1 0 41 0 44 1 0 38 0 45 2 6 0
                                    0 0 46 2 0 0 0 0 47 2 0 0 6 0 48 2 0 0 0 6
                                    49 1 6 0 0 50 1 0 0 0 51 2 0 0 0 0 52 2 0 0
                                    6 0 53 2 0 0 0 6 54 0 0 0 55 2 6 0 0 0 56 1
                                    0 0 0 57 2 6 0 0 0 58 2 0 0 0 0 59 2 0 0 6
                                    0 60 2 0 0 0 6 61 0 6 0 62 0 0 0 63 1 6 64
                                    0 65 1 0 64 0 66 1 0 64 0 67 1 0 64 0 68 1
                                    6 0 0 69 1 0 0 0 70 0 6 71 72 0 0 71 73 1 6
                                    0 74 75 2 0 0 74 0 76 1 79 77 78 80 1 77 82
                                    0 83 2 6 0 0 25 84 2 0 0 0 25 85 1 86 0 71
                                    87 0 0 86 88 2 6 0 0 0 89 2 0 0 0 0 90 2 6
                                    0 0 91 92 2 0 0 0 0 93 2 3 38 0 0 1 1 15 38
                                    0 1 1 0 0 0 22 2 6 64 0 0 1 2 24 0 0 0 93 0
                                    14 0 1 1 6 0 0 8 1 9 64 0 1 2 9 0 0 71 1 2
                                    17 0 0 94 1 1 9 64 0 68 1 0 6 0 21 1 9 64 0
                                    66 2 15 38 0 0 1 1 9 38 0 1 2 0 0 23 0 24 1
                                    0 6 0 9 1 6 0 0 57 1 9 64 0 1 2 9 0 0 71 1
                                    2 17 0 0 94 1 1 9 64 0 67 1 3 96 0 1 1 16 0
                                    0 70 2 3 98 98 0 1 1 3 97 0 1 1 23 18 0 19
                                    2 19 0 0 18 37 2 19 0 0 0 34 3 13 0 0 28 29
                                    31 3 13 0 0 25 6 27 2 0 0 6 6 17 0 1 86 88
                                    3 7 0 0 28 95 1 2 7 0 0 28 1 3 7 0 0 25 71
                                    1 2 7 0 0 25 85 2 10 0 0 0 1 2 11 0 0 0 1 1
                                    4 0 74 1 1 3 38 0 45 1 3 41 0 44 0 4 71 73
                                    3 4 0 0 0 0 1 2 4 0 0 0 1 2 4 38 0 0 1 2 10
                                    0 0 74 1 2 9 0 0 71 1 2 17 0 0 94 1 0 15 0
                                    55 0 9 0 63 3 7 0 0 25 71 1 3 7 0 0 28 95 1
                                    2 7 0 0 25 1 2 7 0 0 28 1 2 3 38 0 0 40 2 0
                                    0 6 6 20 2 16 0 0 0 90 2 1 0 0 6 1 2 6 0 6
                                    0 53 2 6 0 0 6 54 2 6 0 0 0 52 1 6 0 0 51 2
                                    20 0 0 6 49 2 20 0 6 0 48 2 20 0 0 0 47 2
                                    15 0 71 0 1 2 6 0 74 0 76 2 20 0 94 0 1 2
                                    17 0 0 6 61 2 17 0 6 0 60 2 17 0 0 0
                                    59)))))
           '|lookupComplete|)) 
