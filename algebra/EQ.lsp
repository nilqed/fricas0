
(SDEFUN |EQ;factorAndSplit;%L;1| ((|eq| (%)) (% (|List| %)))
        (SPROG ((#1=#:G9 NIL) (|rcf| NIL) (#2=#:G8 NIL) (|eq0| (%)))
               (SEQ
                (COND
                 ((|HasSignature| (QREFELT % 6)
                                  (LIST '|factor|
                                        (LIST
                                         (LIST '|Factored|
                                               (|devaluate| (QREFELT % 6)))
                                         (|devaluate| (QREFELT % 6)))))
                  (SEQ (LETT |eq0| (SPADCALL |eq| (QREFELT % 8)))
                       (EXIT
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |rcf| NIL)
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |eq0| (QREFELT % 9))
                                               (QREFELT % 11))
                                     (QREFELT % 16)))
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |rcf| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL (QVELT |rcf| 1)
                                                 (|spadConstant| % 17)
                                                 (QREFELT % 18))
                                       #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))))
                 ('T (LIST |eq|)))))) 

(PUT '|EQ;=;2S%;2| '|SPADreplace| 'CONS) 

(SDEFUN |EQ;=;2S%;2| ((|l| (S)) (|r| (S)) (% (%))) (CONS |l| |r|)) 

(PUT '|EQ;equation;2S%;3| '|SPADreplace| 'CONS) 

(SDEFUN |EQ;equation;2S%;3| ((|l| (S)) (|r| (S)) (% (%))) (CONS |l| |r|)) 

(PUT '|EQ;lhs;%S;4| '|SPADreplace| 'QCAR) 

(SDEFUN |EQ;lhs;%S;4| ((|eqn| (%)) (% (S))) (QCAR |eqn|)) 

(PUT '|EQ;rhs;%S;5| '|SPADreplace| 'QCDR) 

(SDEFUN |EQ;rhs;%S;5| ((|eqn| (%)) (% (S))) (QCDR |eqn|)) 

(SDEFUN |EQ;swap;2%;6| ((|eqn| (%)) (% (%)))
        (CONS (SPADCALL |eqn| (QREFELT % 22)) (SPADCALL |eqn| (QREFELT % 9)))) 

(SDEFUN |EQ;map;M2%;7| ((|fn| (|Mapping| S S)) (|eqn| (%)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eqn|) |fn|) (SPADCALL (QCDR |eqn|) |fn|)
                  (QREFELT % 18))) 

(SDEFUN |EQ;eval;%SS%;8| ((|eqn| (%)) (|s| (|Symbol|)) (|x| (S)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eqn|) |s| |x| (QREFELT % 27))
                  (SPADCALL (QCDR |eqn|) |s| |x| (QREFELT % 27))
                  (QREFELT % 21))) 

(SDEFUN |EQ;eval;%LL%;9|
        ((|eqn| (%)) (|ls| (|List| (|Symbol|))) (|lx| (|List| S)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eqn|) |ls| |lx| (QREFELT % 31))
                  (SPADCALL (QCDR |eqn|) |ls| |lx| (QREFELT % 31))
                  (QREFELT % 21))) 

(SDEFUN |EQ;eval;3%;10| ((|eqn1| (%)) (|eqn2| (%)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eqn1|) |eqn2| (QREFELT % 34))
                  (SPADCALL (QCDR |eqn1|) |eqn2| (QREFELT % 34))
                  (QREFELT % 21))) 

(SDEFUN |EQ;eval;%L%;11| ((|eqn1| (%)) (|leqn2| (|List| %)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eqn1|) |leqn2| (QREFELT % 37))
                  (SPADCALL (QCDR |eqn1|) |leqn2| (QREFELT % 37))
                  (QREFELT % 21))) 

(SDEFUN |EQ;=;2%B;12| ((|eq1| (%)) (|eq2| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT % 40))
          (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT % 40)))
         ('T NIL))) 

(SDEFUN |EQ;coerce;%Of;13| ((|eqn| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL (QCAR |eqn|) (QREFELT % 43))
                  (SPADCALL (QCDR |eqn|) (QREFELT % 43)) (QREFELT % 44))) 

(SDEFUN |EQ;coerce;%B;14| ((|eqn| (%)) (% (|Boolean|)))
        (SPADCALL (QCAR |eqn|) (QCDR |eqn|) (QREFELT % 40))) 

(SDEFUN |EQ;+;3%;15| ((|eq1| (%)) (|eq2| (%)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT % 47))
                  (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT % 47))
                  (QREFELT % 21))) 

(SDEFUN |EQ;+;S2%;16| ((|s| (S)) (|eq2| (%)) (% (%)))
        (SPADCALL (CONS |s| |s|) |eq2| (QREFELT % 48))) 

(SDEFUN |EQ;+;%S%;17| ((|eq1| (%)) (|s| (S)) (% (%)))
        (SPADCALL |eq1| (CONS |s| |s|) (QREFELT % 48))) 

(SDEFUN |EQ;-;2%;18| ((|eq| (%)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |eq| (QREFELT % 9)) (QREFELT % 51))
                  (SPADCALL (SPADCALL |eq| (QREFELT % 22)) (QREFELT % 51))
                  (QREFELT % 21))) 

(SDEFUN |EQ;-;S2%;19| ((|s| (S)) (|eq2| (%)) (% (%)))
        (SPADCALL (CONS |s| |s|) |eq2| (QREFELT % 53))) 

(SDEFUN |EQ;-;%S%;20| ((|eq1| (%)) (|s| (S)) (% (%)))
        (SPADCALL |eq1| (CONS |s| |s|) (QREFELT % 53))) 

(SDEFUN |EQ;leftZero;2%;21| ((|eq| (%)) (% (%)))
        (SPADCALL (|spadConstant| % 17)
                  (SPADCALL (SPADCALL |eq| (QREFELT % 22))
                            (SPADCALL |eq| (QREFELT % 9)) (QREFELT % 57))
                  (QREFELT % 21))) 

(SDEFUN |EQ;rightZero;2%;22| ((|eq| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT % 9)) (SPADCALL |eq| (QREFELT % 22))
                   (QREFELT % 57))
         (|spadConstant| % 17) (QREFELT % 21))) 

(SDEFUN |EQ;Zero;%;23| ((% (%)))
        (SPADCALL (|spadConstant| % 17) (|spadConstant| % 17) (QREFELT % 18))) 

(SDEFUN |EQ;-;3%;24| ((|eq1| (%)) (|eq2| (%)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT % 57))
                  (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT % 57))
                  (QREFELT % 21))) 

(SDEFUN |EQ;*;3%;25| ((|eq1| (%)) (|eq2| (%)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT % 59))
                  (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT % 59))
                  (QREFELT % 21))) 

(SDEFUN |EQ;*;S2%;26| ((|l| (S)) (|eqn| (%)) (% (%)))
        (SPADCALL (SPADCALL |l| (QCAR |eqn|) (QREFELT % 59))
                  (SPADCALL |l| (QCDR |eqn|) (QREFELT % 59)) (QREFELT % 21))) 

(SDEFUN |EQ;*;S2%;27| ((|l| (S)) (|eqn| (%)) (% (%)))
        (SPADCALL (SPADCALL |l| (QCAR |eqn|) (QREFELT % 59))
                  (SPADCALL |l| (QCDR |eqn|) (QREFELT % 59)) (QREFELT % 21))) 

(SDEFUN |EQ;*;%S%;28| ((|eqn| (%)) (|l| (S)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eqn|) |l| (QREFELT % 59))
                  (SPADCALL (QCDR |eqn|) |l| (QREFELT % 59)) (QREFELT % 21))) 

(SDEFUN |EQ;One;%;29| ((% (%)))
        (SPADCALL (|spadConstant| % 63) (|spadConstant| % 63) (QREFELT % 18))) 

(SDEFUN |EQ;recip;%U;30| ((|eq| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|rh| #2=(|Union| S #1#)) (|lh| #2#))
               (SEQ
                (LETT |lh|
                      (SPADCALL (SPADCALL |eq| (QREFELT % 9)) (QREFELT % 66)))
                (EXIT
                 (COND ((QEQCAR |lh| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |rh|
                               (SPADCALL (SPADCALL |eq| (QREFELT % 22))
                                         (QREFELT % 66)))
                         (EXIT
                          (COND ((QEQCAR |rh| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (CONS (QCDR |lh|) (QCDR |rh|))))))))))))) 

(SDEFUN |EQ;leftOne;%U;31| ((|eq| (%)) (% (|Union| % "failed")))
        (SPROG ((|re| (|Union| S "failed")))
               (SEQ
                (LETT |re|
                      (SPADCALL (SPADCALL |eq| (QREFELT % 9)) (QREFELT % 66)))
                (EXIT
                 (COND ((QEQCAR |re| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (|spadConstant| % 63)
                                        (SPADCALL
                                         (SPADCALL |eq| (QREFELT % 22))
                                         (QCDR |re|) (QREFELT % 59))
                                        (QREFELT % 21))))))))) 

(SDEFUN |EQ;rightOne;%U;32| ((|eq| (%)) (% (|Union| % "failed")))
        (SPROG ((|re| (|Union| S "failed")))
               (SEQ
                (LETT |re|
                      (SPADCALL (SPADCALL |eq| (QREFELT % 22)) (QREFELT % 66)))
                (EXIT
                 (COND ((QEQCAR |re| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL
                               (SPADCALL (SPADCALL |eq| (QREFELT % 9))
                                         (QCDR |re|) (QREFELT % 59))
                               (|spadConstant| % 63) (QREFELT % 21))))))))) 

(SDEFUN |EQ;inv;2%;33| ((|eq| (%)) (% (%)))
        (CONS (SPADCALL (SPADCALL |eq| (QREFELT % 9)) (QREFELT % 70))
              (SPADCALL (SPADCALL |eq| (QREFELT % 22)) (QREFELT % 70)))) 

(SDEFUN |EQ;leftOne;%U;34| ((|eq| (%)) (% (|Union| % "failed")))
        (CONS 0
              (SPADCALL (|spadConstant| % 63)
                        (SPADCALL (SPADCALL |eq| (QREFELT % 22))
                                  (SPADCALL (SPADCALL |eq| (QREFELT % 22))
                                            (QREFELT % 70))
                                  (QREFELT % 59))
                        (QREFELT % 21)))) 

(SDEFUN |EQ;rightOne;%U;35| ((|eq| (%)) (% (|Union| % "failed")))
        (CONS 0
              (SPADCALL
               (SPADCALL (SPADCALL |eq| (QREFELT % 9))
                         (SPADCALL (SPADCALL |eq| (QREFELT % 22))
                                   (QREFELT % 70))
                         (QREFELT % 59))
               (|spadConstant| % 63) (QREFELT % 21)))) 

(SDEFUN |EQ;characteristic;Nni;36| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 73))) 

(SDEFUN |EQ;*;I2%;37| ((|i| (|Integer|)) (|eq| (%)) (% (%)))
        (SPADCALL (SPADCALL |i| (QREFELT % 76)) |eq| (QREFELT % 61))) 

(SDEFUN |EQ;factorAndSplit;%L;38| ((|eq| (%)) (% (|List| %)))
        (SPROG
         ((#1=#:G93 NIL) (|rcf| NIL) (#2=#:G92 NIL)
          (|p| (|Polynomial| (|Integer|))) (|eq0| (%)) (#3=#:G91 NIL)
          (#4=#:G90 NIL))
         (SEQ
          (COND
           ((|HasSignature| (QREFELT % 6)
                            (LIST '|factor|
                                  (LIST
                                   (LIST '|Factored|
                                         (|devaluate| (QREFELT % 6)))
                                   (|devaluate| (QREFELT % 6)))))
            (SEQ (LETT |eq0| (SPADCALL |eq| (QREFELT % 8)))
                 (EXIT
                  (PROGN
                   (LETT #4# NIL)
                   (SEQ (LETT |rcf| NIL)
                        (LETT #3#
                              (SPADCALL
                               (SPADCALL (SPADCALL |eq0| (QREFELT % 9))
                                         (QREFELT % 11))
                               (QREFELT % 16)))
                        G190
                        (COND
                         ((OR (ATOM #3#) (PROGN (LETT |rcf| (CAR #3#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #4#
                                (CONS
                                 (SPADCALL (QVELT |rcf| 1)
                                           (|spadConstant| % 17)
                                           (QREFELT % 18))
                                 #4#))))
                        (LETT #3# (CDR #3#)) (GO G190) G191
                        (EXIT (NREVERSE #4#)))))))
           ((EQUAL (QREFELT % 6) (|Polynomial| (|Integer|)))
            (SEQ (LETT |eq0| (SPADCALL |eq| (QREFELT % 8)))
                 (LETT |p| (SPADCALL |eq0| (QREFELT % 9)))
                 (EXIT
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |rcf| NIL)
                        (LETT #1#
                              (SPADCALL (SPADCALL |p| (QREFELT % 81))
                                        (QREFELT % 84)))
                        G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |rcf| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL (QVELT |rcf| 1)
                                           (|spadConstant| % 17)
                                           (QREFELT % 18))
                                 #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))
           ('T (LIST |eq|)))))) 

(SDEFUN |EQ;differentiate;%S%;39| ((|eq| (%)) (|sym| (|Symbol|)) (% (%)))
        (CONS (SPADCALL (SPADCALL |eq| (QREFELT % 9)) |sym| (QREFELT % 85))
              (SPADCALL (SPADCALL |eq| (QREFELT % 22)) |sym| (QREFELT % 85)))) 

(SDEFUN |EQ;/;3%;40| ((|eq1| (%)) (|eq2| (%)) (% (%)))
        (SPADCALL (SPADCALL (QCAR |eq1|) (QCAR |eq2|) (QREFELT % 87))
                  (SPADCALL (QCDR |eq1|) (QCDR |eq2|) (QREFELT % 87))
                  (QREFELT % 21))) 

(SDEFUN |EQ;inv;2%;41| ((|eq| (%)) (% (%)))
        (CONS (SPADCALL (SPADCALL |eq| (QREFELT % 9)) (QREFELT % 70))
              (SPADCALL (SPADCALL |eq| (QREFELT % 22)) (QREFELT % 70)))) 

(SDEFUN |EQ;subst;3%;42| ((|eq1| (%)) (|eq2| (%)) (% (%)))
        (SPROG ((|eq3| (|Equation| S)))
               (SEQ (LETT |eq3| |eq2|)
                    (EXIT
                     (CONS
                      (SPADCALL (SPADCALL |eq1| (QREFELT % 9)) |eq3|
                                (QREFELT % 90))
                      (SPADCALL (SPADCALL |eq1| (QREFELT % 22)) |eq3|
                                (QREFELT % 90))))))) 

(SDEFUN |EQ;convert;%If;43| ((|eq| (%)) (% (|InputForm|)))
        (SPROG ((|l_form| (|List| #1=(|InputForm|))) (|rf| #1#) (|lf| #1#))
               (SEQ
                (LETT |lf|
                      (SPADCALL (SPADCALL |eq| (QREFELT % 9)) (QREFELT % 93)))
                (LETT |rf|
                      (SPADCALL (SPADCALL |eq| (QREFELT % 22)) (QREFELT % 93)))
                (LETT |l_form|
                      (LIST (SPADCALL '|equation| (QREFELT % 94)) |lf| |rf|))
                (EXIT (SPADCALL |l_form| (QREFELT % 95)))))) 

(DECLAIM (NOTINLINE |Equation;|)) 

(DEFUN |Equation;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G102 NIL) (#2=#:G103 NIL) (#3=#:G104 NIL) (#4=#:G105 NIL)
    (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Equation| DV$1))
    (LETT % (GETREFV 100))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1| '(|SetCategory|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #4#)
                                        (|HasCategory| |#1| '(|Monoid|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1| '(|Group|)))
                                        (OR #3# #4#)
                                        (OR #3#
                                            (|HasCategory| |#1| '(|Monoid|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #4#)
                                         (|HasCategory| |#1| '(|Monoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #4#))
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SemiGroup|)))
                                        (OR #3#
                                            (|HasCategory| |#1| '(|Monoid|))
                                            #2#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         (|HasCategory| |#1| '(|SetCategory|)))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #3# (|HasCategory| |#1| '(|Monoid|))
                                         #4# #2#
                                         (|HasCategory| |#1| '(|SetCategory|)))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|ExpressionSpace|))))))
    (|haddProp| |$ConstructorCache| '|Equation| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Record| (|:| |lhs| |#1|) (|:| |rhs| |#1|)))
    (COND
     ((|testBitVector| |pv$| 23)
      (QSETREFV % 20 (CONS (|dispatchFunction| |EQ;factorAndSplit;%L;1|) %))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV % 28 (CONS (|dispatchFunction| |EQ;eval;%SS%;8|) %))
       (QSETREFV % 32 (CONS (|dispatchFunction| |EQ;eval;%LL%;9|) %)))))
    (COND
     ((|HasCategory| |#1| (LIST '|Evalable| (|devaluate| |#1|)))
      (PROGN
       (QSETREFV % 35 (CONS (|dispatchFunction| |EQ;eval;3%;10|) %))
       (QSETREFV % 38 (CONS (|dispatchFunction| |EQ;eval;%L%;11|) %)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV % 41 (CONS (|dispatchFunction| |EQ;=;2%B;12|) %))
       (QSETREFV % 45 (CONS (|dispatchFunction| |EQ;coerce;%Of;13|) %))
       (QSETREFV % 46 (CONS (|dispatchFunction| |EQ;coerce;%B;14|) %)))))
    (COND
     ((|testBitVector| |pv$| 20)
      (PROGN
       (QSETREFV % 48 (CONS (|dispatchFunction| |EQ;+;3%;15|) %))
       (QSETREFV % 49 (CONS (|dispatchFunction| |EQ;+;S2%;16|) %))
       (QSETREFV % 50 (CONS (|dispatchFunction| |EQ;+;%S%;17|) %)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 52 (CONS (|dispatchFunction| |EQ;-;2%;18|) %))
       (QSETREFV % 54 (CONS (|dispatchFunction| |EQ;-;S2%;19|) %))
       (QSETREFV % 55 (CONS (|dispatchFunction| |EQ;-;%S%;20|) %))
       (QSETREFV % 58 (CONS (|dispatchFunction| |EQ;leftZero;2%;21|) %))
       (QSETREFV % 8 (CONS (|dispatchFunction| |EQ;rightZero;2%;22|) %))
       (QSETREFV % 56
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EQ;Zero;%;23|) % 56)))
       (QSETREFV % 53 (CONS (|dispatchFunction| |EQ;-;3%;24|) %)))))
    (COND
     ((|testBitVector| |pv$| 17)
      (PROGN
       (QSETREFV % 60 (CONS (|dispatchFunction| |EQ;*;3%;25|) %))
       (QSETREFV % 61 (CONS (|dispatchFunction| |EQ;*;S2%;26|) %))
       (QSETREFV % 61 (CONS (|dispatchFunction| |EQ;*;S2%;27|) %))
       (QSETREFV % 62 (CONS (|dispatchFunction| |EQ;*;%S%;28|) %)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV % 64
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EQ;One;%;29|) % 64)))
       (QSETREFV % 67 (CONS (|dispatchFunction| |EQ;recip;%U;30|) %))
       (QSETREFV % 68 (CONS (|dispatchFunction| |EQ;leftOne;%U;31|) %))
       (QSETREFV % 69 (CONS (|dispatchFunction| |EQ;rightOne;%U;32|) %)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (PROGN
       (QSETREFV % 71 (CONS (|dispatchFunction| |EQ;inv;2%;33|) %))
       (QSETREFV % 68 (CONS (|dispatchFunction| |EQ;leftOne;%U;34|) %))
       (QSETREFV % 69 (CONS (|dispatchFunction| |EQ;rightOne;%U;35|) %)))))
    (COND
     ((|testBitVector| |pv$| 5)
      (PROGN
       (QSETREFV % 74 (CONS (|dispatchFunction| |EQ;characteristic;Nni;36|) %))
       (QSETREFV % 77 (CONS (|dispatchFunction| |EQ;*;I2%;37|) %)))))
    (COND
     ((|testBitVector| |pv$| 23)
      (QSETREFV % 20 (CONS (|dispatchFunction| |EQ;factorAndSplit;%L;38|) %))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 86 (CONS (|dispatchFunction| |EQ;differentiate;%S%;39|) %))))
    (COND
     ((|HasCategory| |#1| '(|Field|))
      (PROGN
       (QSETREFV % 88 (CONS (|dispatchFunction| |EQ;/;3%;40|) %))
       (QSETREFV % 71 (CONS (|dispatchFunction| |EQ;inv;2%;41|) %)))))
    (COND
     ((|testBitVector| |pv$| 24)
      (QSETREFV % 91 (CONS (|dispatchFunction| |EQ;subst;3%;42|) %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV % 96 (CONS (|dispatchFunction| |EQ;convert;%If;43|) %))))
    %))) 

(DEFUN |Equation| (#1=#:G106)
  (SPROG NIL
         (PROG (#2=#:G107)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Equation|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Equation;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Equation|)))))))))) 

(MAKEPROP '|Equation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (0 . |rightZero|)
              |EQ;lhs;%S;4| (|Factored| %) (5 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 12) (|:| |factor| 6) (|:| |exponent| 72))
              (|List| 13) (|Factored| 6) (10 . |factorList|) (15 . |Zero|)
              |EQ;equation;2S%;3| (|List| %) (19 . |factorAndSplit|)
              |EQ;=;2S%;2| |EQ;rhs;%S;5| |EQ;swap;2%;6| (|Mapping| 6 6)
              |EQ;map;M2%;7| (|Symbol|) (24 . |eval|) (31 . |eval|) (|List| 26)
              (|List| 6) (38 . |eval|) (45 . |eval|) (|Equation| 6)
              (52 . |eval|) (58 . |eval|) (|List| 33) (64 . |eval|)
              (70 . |eval|) (|Boolean|) (76 . =) (82 . =) (|OutputForm|)
              (88 . |coerce|) (93 . =) (99 . |coerce|) (104 . |coerce|)
              (109 . +) (115 . +) (121 . +) (127 . +) (133 . -) (138 . -)
              (143 . -) (149 . -) (155 . -) (161 . |Zero|) (165 . -)
              (171 . |leftZero|) (176 . *) (182 . *) (188 . *) (194 . *)
              (200 . |One|) (204 . |One|) (|Union| % '"failed") (208 . |recip|)
              (213 . |recip|) (218 . |leftOne|) (223 . |rightOne|)
              (228 . |inv|) (233 . |inv|) (|NonNegativeInteger|)
              (238 . |characteristic|) (242 . |characteristic|) (|Integer|)
              (246 . |coerce|) (251 . *) (|Factored| 79) (|Polynomial| 75)
              (|MultivariateFactorize| 26 (|IndexedExponents| 26) 75 79)
              (257 . |factor|)
              (|Record| (|:| |flag| 12) (|:| |factor| 79) (|:| |exponent| 72))
              (|List| 82) (262 . |factorList|) (267 . |differentiate|)
              (273 . |differentiate|) (279 . /) (285 . /) (|Equation| %)
              (291 . |subst|) (297 . |subst|) (|InputForm|) (303 . |convert|)
              (308 . |convert|) (313 . |convert|) (318 . |convert|)
              (|PositiveInteger|) (|List| 72) (|String|))
           '#(~= 323 |zero?| 329 |swap| 334 |subtractIfCan| 339 |subst| 345
              |sample| 351 |rightZero| 355 |rightRecip| 360 |rightPower| 365
              |rightOne| 377 |rhs| 382 |recip| 387 |opposite?| 392 |one?| 398
              |map| 403 |lhs| 409 |leftZero| 414 |leftRecip| 419 |leftPower|
              424 |leftOne| 436 |latex| 441 |inv| 446 |factorAndSplit| 451
              |eval| 456 |equation| 482 |differentiate| 488 |convert| 514
              |conjugate| 519 |commutator| 525 |coerce| 531 |characteristic|
              546 |associator| 550 |antiCommutator| 557 |annihilate?| 563 ^ 569
              |Zero| 587 |One| 591 D 595 = 621 / 633 - 639 + 662 * 680)
           'NIL
           (CONS
            (|makeByteWordVec2| 22
                                '(2 6 5 6 8 5 9 5 5 5 9 6 5 5 10 4 12 5 4 18 4
                                  6 7 18 21 22 13 3 10 22 11 3 1 0))
            (CONS
             '#(|PartialDifferentialRing&| NIL NIL |Rng&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                |Group&| |AbelianGroup&| NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| |Magma&|
                |AbelianSemiGroup&| |SetCategory&| |InnerEvalable&| NIL NIL
                |BasicType&| NIL NIL NIL NIL)
             (CONS
              '#((|PartialDifferentialRing| 26) (|Ring|) (|SemiRing|) (|Rng|)
                 (|Module| 6) (|SemiRng|) (|BiModule| 6 6)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|RightModule| 6)
                 (|LeftModule| 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|Group|) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|InnerEvalable| 26 6) (|CoercibleTo| 39)
                 (|TwoSidedRecip|) (|BasicType|) (|unitsKnown|)
                 (|CoercibleTo| 42) (|ConvertibleTo| 92) (|Type|))
              (|makeByteWordVec2| 99
                                  '(1 0 0 0 8 1 6 10 0 11 1 15 14 0 16 0 6 0 17
                                    1 0 19 0 20 3 6 0 0 26 6 27 3 0 0 0 26 6 28
                                    3 6 0 0 29 30 31 3 0 0 0 29 30 32 2 6 0 0
                                    33 34 2 0 0 0 0 35 2 6 0 0 36 37 2 0 0 0 19
                                    38 2 6 39 0 0 40 2 0 39 0 0 41 1 6 42 0 43
                                    2 42 0 0 0 44 1 0 42 0 45 1 0 39 0 46 2 6 0
                                    0 0 47 2 0 0 0 0 48 2 0 0 6 0 49 2 0 0 0 6
                                    50 1 6 0 0 51 1 0 0 0 52 2 0 0 0 0 53 2 0 0
                                    6 0 54 2 0 0 0 6 55 0 0 0 56 2 6 0 0 0 57 1
                                    0 0 0 58 2 6 0 0 0 59 2 0 0 0 0 60 2 0 0 6
                                    0 61 2 0 0 0 6 62 0 6 0 63 0 0 0 64 1 6 65
                                    0 66 1 0 65 0 67 1 0 65 0 68 1 0 65 0 69 1
                                    6 0 0 70 1 0 0 0 71 0 6 72 73 0 0 72 74 1 6
                                    0 75 76 2 0 0 75 0 77 1 80 78 79 81 1 78 83
                                    0 84 2 6 0 0 26 85 2 0 0 0 26 86 2 6 0 0 0
                                    87 2 0 0 0 0 88 2 6 0 0 89 90 2 0 0 0 0 91
                                    1 6 92 0 93 1 92 0 26 94 1 92 0 19 95 1 0
                                    92 0 96 2 3 39 0 0 1 1 15 39 0 1 1 0 0 0 23
                                    2 4 65 0 0 1 2 24 0 0 0 91 0 14 0 1 1 4 0 0
                                    8 1 7 65 0 1 2 7 0 0 72 1 2 17 0 0 97 1 1 7
                                    65 0 69 1 0 6 0 22 1 7 65 0 67 2 15 39 0 0
                                    1 1 7 39 0 1 2 0 0 24 0 25 1 0 6 0 9 1 4 0
                                    0 58 1 7 65 0 1 2 7 0 0 72 1 2 17 0 0 97 1
                                    1 7 65 0 68 1 3 99 0 1 1 16 0 0 71 1 23 19
                                    0 20 2 19 0 0 19 38 2 19 0 0 0 35 3 13 0 0
                                    26 6 28 3 13 0 0 29 30 32 2 0 0 6 6 18 2 2
                                    0 0 29 1 2 2 0 0 26 86 3 2 0 0 29 98 1 3 2
                                    0 0 26 72 1 1 1 92 0 96 2 10 0 0 0 1 2 11 0
                                    0 0 1 1 5 0 75 1 1 3 42 0 45 1 3 39 0 46 0
                                    5 72 74 3 5 0 0 0 0 1 2 5 0 0 0 1 2 5 39 0
                                    0 1 2 10 0 0 75 1 2 7 0 0 72 1 2 17 0 0 97
                                    1 0 15 0 56 0 7 0 64 2 2 0 0 29 1 2 2 0 0
                                    26 1 3 2 0 0 29 98 1 3 2 0 0 26 72 1 2 0 0
                                    6 6 21 2 3 39 0 0 41 2 16 0 0 0 88 1 4 0 0
                                    52 2 4 0 0 0 53 2 4 0 0 6 55 2 4 0 6 0 54 2
                                    20 0 0 0 48 2 20 0 0 6 50 2 20 0 6 0 49 2
                                    15 0 72 0 1 2 4 0 75 0 77 2 20 0 97 0 1 2
                                    17 0 0 0 60 2 17 0 0 6 62 2 17 0 6 0
                                    61)))))
           '|lookupComplete|)) 
