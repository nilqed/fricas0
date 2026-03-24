
(SDEFUN |ALGSC;listOfTerms;%L;1|
        ((|x| (%))
         (%
          (|List|
           (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R))))
          (|c| (R)) (#1=#:G35 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                        (EXIT
                         (COND
                          ((SPADCALL |c| (|spadConstant| % 13) (QREFELT % 15))
                           (LETT |res|
                                 (CONS (CONS (SPADCALL |i| (QREFELT % 18)) |c|)
                                       |res|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |ALGSC;numberOfMonomials;%Nni;2| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|c| (R)) (#1=#:G41 NIL) (|i| NIL))
         (SEQ (LETT |res| 0)
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                        (EXIT
                         (COND
                          ((SPADCALL |c| (|spadConstant| % 13) (QREFELT % 15))
                           (LETT |res| (+ |res| 1))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ALGSC;monomial?;%B;3| ((X (%)) (% (|Boolean|)))
        (EQL (SPADCALL |x| (QREFELT % 23)) 1)) 

(SDEFUN |ALGSC;leadingTerm;%R;4|
        ((|x| (%))
         (% (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R))))
        (SPROG ((#1=#:G49 NIL) (|c| (R)) (#2=#:G50 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                            (EXIT
                             (COND
                              ((SPADCALL |c| (|spadConstant| % 13)
                                         (QREFELT % 15))
                               (PROGN
                                (LETT #1#
                                      (CONS (SPADCALL |i| (QREFELT % 18)) |c|))
                                (GO #3=#:G48))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|error| "can not take leadingTerm of zero element"))))
                #3# (EXIT #1#)))) 

(SDEFUN |ALGSC;linearExtend;M%R;5|
        ((|f| (|Mapping| R (|OrderedVariableList| |ls|))) (|x| (%)) (% (R)))
        (SPROG ((|res| (R)) (|c| (R)) (#1=#:G57 NIL) (|i| NIL))
               (SEQ (LETT |res| (|spadConstant| % 13))
                    (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                              (EXIT
                               (COND
                                ((SPADCALL |c| (|spadConstant| % 13)
                                           (QREFELT % 15))
                                 (LETT |res|
                                       (SPADCALL |res|
                                                 (SPADCALL |c|
                                                           (SPADCALL
                                                            (SPADCALL |i|
                                                                      (QREFELT
                                                                       % 18))
                                                            |f|)
                                                           (QREFELT % 26))
                                                 (QREFELT % 27)))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |ALGSC;reductum;2%;6| ((|x| (%)) (% (%)))
        (SPROG
         ((|first| (|Boolean|)) (|c| (R)) (#1=#:G63 NIL) (|i| NIL)
          (|v| (|Vector| R)))
         (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
              (LETT |first| 'T)
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                        (EXIT
                         (COND
                          ((SPADCALL |c| (|spadConstant| % 13) (QREFELT % 15))
                           (COND (|first| (LETT |first| NIL))
                                 ('T
                                  (SPADCALL |v| |i|
                                            (SPADCALL |x| |i| (QREFELT % 12))
                                            (QREFELT % 31))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |v| (QREFELT % 32)))))) 

(SDEFUN |ALGSC;construct;L%;7|
        ((|l|
          (|List|
           (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R))))
         (% (%)))
        (SPROG
         ((|i| (|PositiveInteger|)) (#1=#:G70 NIL) (|el| NIL)
          (|v| (|Vector| R)))
         (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
              (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |i| (SPADCALL (QCAR |el|) (QREFELT % 34)))
                        (EXIT (SPADCALL |v| |i| (QCDR |el|) (QREFELT % 31))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |v| (QREFELT % 32)))))) 

(SDEFUN |ALGSC;coefficient;%OvlR;8|
        ((|x| (%)) (|v| (|OrderedVariableList| |ls|)) (% (R)))
        (SPADCALL |x| (SPADCALL |v| (QREFELT % 34)) (QREFELT % 12))) 

(SDEFUN |ALGSC;linearExtend;M%R;9|
        ((|f| (|Mapping| R (|OrderedVariableList| |ls|))) (|x| (%)) (% (R)))
        (SPROG ((|res| (R)) (|c| (R)) (#1=#:G77 NIL) (|i| NIL))
               (SEQ (LETT |res| (|spadConstant| % 13))
                    (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |c| (SPADCALL |x| |i| (QREFELT % 12)))
                              (EXIT
                               (COND
                                ((SPADCALL |c| (|spadConstant| % 13)
                                           (QREFELT % 15))
                                 (LETT |res|
                                       (SPADCALL |res|
                                                 (SPADCALL |c|
                                                           (SPADCALL
                                                            (SPADCALL |i|
                                                                      (QREFELT
                                                                       % 18))
                                                            |f|)
                                                           (QREFELT % 26))
                                                 (QREFELT % 27)))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |ALGSC;constructOrdered;L%;10|
        ((|l|
          (|List|
           (|Record| (|:| |k| (|OrderedVariableList| |ls|)) (|:| |c| R))))
         (% (%)))
        (SPADCALL |l| (QREFELT % 35))) 

(SDEFUN |ALGSC;monomial;ROvl%;11|
        ((|c| (R)) (|s| (|OrderedVariableList| |ls|)) (% (%)))
        (SPROG ((|v| (|Vector| R)))
               (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
                    (SPADCALL |v| (SPADCALL |s| (QREFELT % 34)) |c|
                              (QREFELT % 31))
                    (EXIT (SPADCALL |v| (QREFELT % 32)))))) 

(SDEFUN |ALGSC;recip;%U;12| ((|x| (%)) (% (|Union| % "failed")))
        (SPADCALL |x| (QREFELT % 41))) 

(SDEFUN |ALGSC;*;Sm2%;13| ((|m| (|SquareMatrix| |n| R)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |m| (QREFELT % 45)) |x| (QREFELT % 46))) 

(SDEFUN |ALGSC;coerce;V%;14| ((|v| (|Vector| R)) (% (%)))
        (SPADCALL |v| (QREFELT % 32))) 

(SDEFUN |ALGSC;structuralConstants;V;15| ((% (|Vector| (|Matrix| R))))
        (QREFELT % 9)) 

(SDEFUN |ALGSC;coordinates;%V;16| ((|x| (%)) (% (|Vector| R)))
        (SPADCALL (SPADCALL |x| (QREFELT % 52)) (QREFELT % 53))) 

(SDEFUN |ALGSC;coordinates;%VV;17|
        ((|x| (%)) (|b| (|Vector| %)) (% (|Vector| R)))
        (SPROG
         ((|res| (|Union| (|Vector| R) "failed")) (#1=#:G98 NIL) (|i| NIL)
          (|transitionMatrix| (|Matrix| R)) (|m| (|NonNegativeInteger|))
          (#2=#:G90 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #2# (SPADCALL |b| (QREFELT % 56)))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |transitionMatrix|
                (MAKE_MATRIX1 (QREFELT % 7) |m| (|spadConstant| % 13)))
          (SEQ (LETT |i| 1) (LETT #1# |m|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |transitionMatrix| |i|
                           (SPADCALL (SPADCALL |b| |i| (QREFELT % 57))
                                     (QREFELT % 54))
                           (QREFELT % 58))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |transitionMatrix| (SPADCALL |x| (QREFELT % 54))
                          (QREFELT % 61)))
          (EXIT
           (COND
            ((QEQCAR |res| 1) (|error| "coordinates: solveUniquely failed"))
            ('T (QCDR |res|))))))) 

(SDEFUN |ALGSC;basis;V;18| ((% (|Vector| %)))
        (SPROG
         ((#1=#:G101 NIL) (#2=#:G104 NIL) (#3=#:G106 NIL) (|i| NIL)
          (#4=#:G105 NIL))
         (SEQ
          (PROGN
           (LETT #4# (GETREFV #5=(QREFELT % 7)))
           (SEQ (LETT |i| 1) (LETT #3# #5#) (LETT #2# 0) G190
                (COND ((|greater_SI| |i| #3#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #4# #2#
                          (SPADCALL
                           (PROG1 (LETT #1# |i|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|NonNegativeInteger|) #1#))
                           (QREFELT % 64)))))
                (LETT #2# (PROG1 (|inc_SI| #2#) (LETT |i| (|inc_SI| |i|))))
                (GO G190) G191 (EXIT NIL))
           #4#)))) 

(SDEFUN |ALGSC;someBasis;V;19| ((% (|Vector| %))) (SPADCALL (QREFELT % 65))) 

(SDEFUN |ALGSC;rank;Pi;20| ((% (|PositiveInteger|))) (QREFELT % 7)) 

(SDEFUN |ALGSC;elt;%IR;21| ((|x| (%)) (|i| (|Integer|)) (% (R)))
        (SPADCALL |x| |i| (QREFELT % 68))) 

(SDEFUN |ALGSC;coerce;%Of;22| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G118 NIL) (|le| (|List| (|OutputForm|))) (|coef| (R))
          (#2=#:G119 NIL) (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 69))
            (SPADCALL (|spadConstant| % 13) (QREFELT % 71)))
           ('T
            (SEQ (LETT |le| NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |coef| (SPADCALL |x| |i| (QREFELT % 12)))
                             (EXIT
                              (COND
                               ((NULL (SPADCALL |coef| (QREFELT % 72)))
                                (PROGN
                                 (LETT #1#
                                       (COND
                                        ((SPADCALL |coef| (|spadConstant| % 73)
                                                   (QREFELT % 74))
                                         (LETT |le|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 8) |i|
                                                           (QREFELT % 77))
                                                 (QREFELT % 78))
                                                |le|)))
                                        ('T
                                         (LETT |le|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |coef|
                                                           (QREFELT % 71))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 8) |i|
                                                            (QREFELT % 77))
                                                  (QREFELT % 78))
                                                 (QREFELT % 79))
                                                |le|)))))
                                 (GO #3=#:G111)))))))
                       #3# (EXIT #1#))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (ELT % 80) |le| (QREFELT % 83))))))))) 

(SDEFUN |ALGSC;*;3%;23| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|h| (R)) (#1=#:G131 NIL) (|j| NIL) (#2=#:G130 NIL) (|i| NIL)
          (#3=#:G129 NIL) (|k| NIL) (|v| (|Vector| R)))
         (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 13)))
              (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |h| (|spadConstant| % 13))
                        (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |j| 1) (LETT #1# (QREFELT % 7)) G190
                                    (COND ((|greater_SI| |j| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |h|
                                            (SPADCALL |h|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |x| |i|
                                                                  (QREFELT %
                                                                           12))
                                                        (SPADCALL |y| |j|
                                                                  (QREFELT %
                                                                           12))
                                                        (QREFELT % 26))
                                                       (SPADCALL
                                                        (SPADCALL (QREFELT % 9)
                                                                  |k|
                                                                  (QREFELT %
                                                                           85))
                                                        |i| |j| (QREFELT % 86))
                                                       (QREFELT % 26))
                                                      (QREFELT % 27)))))
                                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (SPADCALL |v| |k| |h| (QREFELT % 31))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |v| (QREFELT % 32)))))) 

(SDEFUN |ALGSC;alternative?;B;24| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G169 NIL) (#2=#:G173 NIL) (|res| (R)) (#3=#:G187 NIL) (|l| NIL)
          (#4=#:G186 NIL) (|r| NIL) (#5=#:G170 NIL) (#6=#:G185 NIL)
          (#7=#:G184 NIL) (#8=#:G183 NIL) (|k| NIL) (#9=#:G171 NIL)
          (#10=#:G182 NIL) (#11=#:G181 NIL) (#12=#:G180 NIL) (#13=#:G179 NIL)
          (|j| NIL) (#14=#:G172 NIL) (#15=#:G178 NIL) (#16=#:G177 NIL)
          (#17=#:G176 NIL) (#18=#:G175 NIL) (#19=#:G174 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #19# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #19#) (GO G191)))
                 (SEQ
                  (SEQ (LETT |j| 1) (LETT #18# (- |i| 1)) G190
                       (COND ((|greater_SI| |j| #18#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k| |j|) (LETT #17# (QREFELT % 7)) G190
                              (COND ((> |k| #17#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |r| 1) (LETT #16# (QREFELT % 7))
                                     G190
                                     (COND ((|greater_SI| |r| #16#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 13))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #15# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #15#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |j| |k|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |k| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 27))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 85))
                                                                      |i| |l|
                                                                      (QREFELT
                                                                       % 86))
                                                                     (QREFELT %
                                                                              26))
                                                                    (QREFELT %
                                                                             88))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |i| |j|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |l| |k|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |i| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |l| |j|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27))
                                                          (QREFELT % 27)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 72)))
                                               (PROGN
                                                (LETT #14#
                                                      (PROGN
                                                       (LETT #2# NIL)
                                                       (GO #20=#:G168)))
                                                (GO #21=#:G138)))))))
                                      #21# (EXIT #14#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #13# (QREFELT % 7)) G190
                        (COND ((> |j| #13#) (GO G191)))
                        (SEQ
                         (SEQ (LETT |k| 1) (LETT #12# (- |j| 1)) G190
                              (COND ((|greater_SI| |k| #12#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |r| 1) (LETT #11# (QREFELT % 7))
                                     G190
                                     (COND ((|greater_SI| |r| #11#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 13))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #10# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #10#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |j| |i|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 27))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 85))
                                                                      |l| |k|
                                                                      (QREFELT
                                                                       % 86))
                                                                     (QREFELT %
                                                                              26))
                                                                    (QREFELT %
                                                                             27))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |i| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |i| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |j| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27))
                                                          (QREFELT % 88)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 72)))
                                               (PROGN
                                                (LETT #9#
                                                      (PROGN
                                                       (LETT #2# NIL)
                                                       (GO #20#)))
                                                (GO #22=#:G147)))))))
                                      #22# (EXIT #9#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (SEQ (LETT |k| |j|) (LETT #8# (QREFELT % 7)) G190
                               (COND ((> |k| #8#) (GO G191)))
                               (SEQ
                                (SEQ (LETT |r| 1) (LETT #7# (QREFELT % 7)) G190
                                     (COND ((|greater_SI| |r| #7#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 13))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #6# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #6#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |j| |i|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 27))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 85))
                                                                      |l| |k|
                                                                      (QREFELT
                                                                       % 86))
                                                                     (QREFELT %
                                                                              26))
                                                                    (QREFELT %
                                                                             27))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |i| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |i| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |j| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27))
                                                          (QREFELT % 88)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 72)))
                                               (PROGN
                                                (LETT #5#
                                                      (PROGN
                                                       (LETT #2# NIL)
                                                       (GO #20#)))
                                                (GO #23=#:G154)))))))
                                      #23# (EXIT #5#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |k| |j|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (QREFELT
                                                                        % 27))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |l|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              88))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |j|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |k|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |j|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (QREFELT % 27)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (PROGN
                                                        (LETT #2# NIL)
                                                        (GO #20#)))
                                                 (GO #24=#:G159)))))))
                                       #24# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #20# (EXIT #2#)))) 

(SDEFUN |ALGSC;associative?;B;25| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G201 NIL) (#2=#:G202 NIL) (|res| (R)) (#3=#:G207 NIL) (|l| NIL)
          (#4=#:G206 NIL) (|r| NIL) (#5=#:G205 NIL) (|k| NIL) (#6=#:G204 NIL)
          (|j| NIL) (#7=#:G203 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |i| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 88)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (PROGN
                                                        (LETT #2# NIL)
                                                        (GO #8=#:G200)))
                                                 (GO #9=#:G194)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;antiAssociative?;B;26| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G221 NIL) (#2=#:G222 NIL) (|res| (R)) (#3=#:G227 NIL) (|l| NIL)
          (#4=#:G226 NIL) (|r| NIL) (#5=#:G225 NIL) (|k| NIL) (#6=#:G224 NIL)
          (|j| NIL) (#7=#:G223 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |k|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |i| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (PROGN
                                                        (LETT #2# NIL)
                                                        (GO #8=#:G220)))
                                                 (GO #9=#:G214)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;commutative?;B;27| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G237 NIL) (#2=#:G238 NIL) (#3=#:G241 NIL) (|k| NIL)
          (#4=#:G240 NIL) (|j| NIL) (#5=#:G239 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (+ |i| 1)) (LETT #4# (QREFELT % 7)) G190
                        (COND ((> |j| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (QREFELT % 9) |k|
                                                (QREFELT % 85))
                                      |i| |j| (QREFELT % 86))
                                     (SPADCALL
                                      (SPADCALL (QREFELT % 9) |k|
                                                (QREFELT % 85))
                                      |j| |i| (QREFELT % 86))
                                     (QREFELT % 74)))
                                   (PROGN
                                    (LETT #1#
                                          (PROGN
                                           (LETT #2# NIL)
                                           (GO #6=#:G236)))
                                    (GO #7=#:G232))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #1#))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |ALGSC;antiCommutative?;B;28| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G251 NIL) (#2=#:G252 NIL) (#3=#:G255 NIL) (|k| NIL)
          (#4=#:G254 NIL) (|j| NIL) (#5=#:G253 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #4# (QREFELT % 7)) G190
                        (COND ((> |j| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (COND
                                      ((EQL |i| |j|)
                                       (SPADCALL
                                        (SPADCALL (QREFELT % 9) |k|
                                                  (QREFELT % 85))
                                        |i| |i| (QREFELT % 86)))
                                      ('T
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL (QREFELT % 9) |k|
                                                   (QREFELT % 85))
                                         |i| |j| (QREFELT % 86))
                                        (SPADCALL
                                         (SPADCALL (QREFELT % 9) |k|
                                                   (QREFELT % 85))
                                         |j| |i| (QREFELT % 86))
                                        (QREFELT % 27))))
                                     (QREFELT % 72)))
                                   (PROGN
                                    (LETT #1#
                                          (PROGN
                                           (LETT #2# NIL)
                                           (GO #6=#:G250)))
                                    (GO #7=#:G246))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #1#))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |ALGSC;leftAlternative?;B;29| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G269 NIL) (#2=#:G270 NIL) (|res| (R)) (#3=#:G275 NIL) (|l| NIL)
          (#4=#:G274 NIL) (|r| NIL) (#5=#:G273 NIL) (|k| NIL) (#6=#:G272 NIL)
          (|j| NIL) (#7=#:G271 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #6# (QREFELT % 7)) G190
                        (COND ((> |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |j| |i|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (QREFELT
                                                                        % 27))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |j| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |i| |l|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |j| |l|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (QREFELT % 88)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (PROGN
                                                        (LETT #2# NIL)
                                                        (GO #8=#:G268)))
                                                 (GO #9=#:G262)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;rightAlternative?;B;30| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G289 NIL) (#2=#:G290 NIL) (|res| (R)) (#3=#:G295 NIL) (|l| NIL)
          (#4=#:G294 NIL) (|r| NIL) (#5=#:G293 NIL) (|k| NIL) (#6=#:G292 NIL)
          (|j| NIL) (#7=#:G291 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| |j|) (LETT #5# (QREFELT % 7)) G190
                               (COND ((> |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |k| |j|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (QREFELT
                                                                        % 27))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 85))
                                                                       |i| |l|
                                                                       (QREFELT
                                                                        % 86))
                                                                      (QREFELT
                                                                       % 26))
                                                                     (QREFELT %
                                                                              88))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |j|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |k|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |j|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (QREFELT % 27)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (PROGN
                                                        (LETT #2# NIL)
                                                        (GO #8=#:G288)))
                                                 (GO #9=#:G282)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;flexible?;B;31| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G309 NIL) (#2=#:G310 NIL) (|res| (R)) (#3=#:G315 NIL) (|l| NIL)
          (#4=#:G314 NIL) (|r| NIL) (#5=#:G313 NIL) (|k| NIL) (#6=#:G312 NIL)
          (|j| NIL) (#7=#:G311 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| |i|) (LETT #5# (QREFELT % 7)) G190
                               (COND ((> |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |res|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |i|
                                                                         |j|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |l|
                                                                         |k|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (QREFELT
                                                                         % 26))
                                                                       (QREFELT
                                                                        % 27))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 85))
                                                               |j| |k|
                                                               (QREFELT % 86))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 85))
                                                               |i| |l|
                                                               (QREFELT % 86))
                                                              (QREFELT % 26))
                                                             (QREFELT % 88))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |k| |j|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |i|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 85))
                                                             |j| |i|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |k| |l|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 88)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (PROGN
                                                        (LETT #2# NIL)
                                                        (GO #8=#:G308)))
                                                 (GO #9=#:G302)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;lieAdmissible?;B;32| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G329 NIL) (#2=#:G330 NIL) (|res| (R)) (#3=#:G335 NIL) (|l| NIL)
          (#4=#:G334 NIL) (|r| NIL) (#5=#:G333 NIL) (|k| NIL) (#6=#:G332 NIL)
          (|j| NIL) (#7=#:G331 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |i|
                                                                         |j|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |j|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (QREFELT
                                                                         % 88))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |l|
                                                                         |k|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |k|
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (QREFELT
                                                                         % 88))
                                                                       (QREFELT
                                                                        % 26))
                                                                      (QREFELT
                                                                       % 27))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 85))
                                                               |j| |k|
                                                               (QREFELT % 86))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 85))
                                                               |k| |j|
                                                               (QREFELT % 86))
                                                              (QREFELT % 88))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 85))
                                                               |l| |i|
                                                               (QREFELT % 86))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 85))
                                                               |i| |l|
                                                               (QREFELT % 86))
                                                              (QREFELT % 88))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |k| |i|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 85))
                                                              |i| |k|
                                                              (QREFELT % 86))
                                                             (QREFELT % 88))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |l| |j|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |j| |l|
                                                              (QREFELT % 86))
                                                             (QREFELT % 88))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (PROGN
                                                        (LETT #2# NIL)
                                                        (GO #8=#:G328)))
                                                 (GO #9=#:G322)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;jordanAdmissible?;B;33| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G357 NIL) (#2=#:G358 NIL) (|res| (R)) (#3=#:G365 NIL) (|r| NIL)
          (#4=#:G364 NIL) (|l| NIL) (#5=#:G363 NIL) (|t| NIL) (#6=#:G362 NIL)
          (|w| NIL) (#7=#:G361 NIL) (|k| NIL) (#8=#:G360 NIL) (|j| NIL)
          (#9=#:G359 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL (SPADCALL 2 (|spadConstant| % 73) (QREFELT % 98))
                        (QREFELT % 99))
              1)
             NIL)
            ('T
             (SEQ
              (SEQ (LETT |i| 1) (LETT #9# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #8# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |j| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #7# (QREFELT % 7)) G190
                                 (COND ((|greater_SI| |k| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |w| 1) (LETT #6# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |w| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |t| 1)
                                               (LETT #5# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |t| #5#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SEQ
                                                  (LETT |res|
                                                        (|spadConstant| % 13))
                                                  (SEQ (LETT |l| 1)
                                                       (LETT #4# (QREFELT % 7))
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |l| #4#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (SEQ (LETT |r| 1)
                                                              (LETT #3#
                                                                    (QREFELT %
                                                                             7))
                                                              G190
                                                              (COND
                                                               ((|greater_SI|
                                                                 |r| #3#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |res|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |l|
                                                                                 (QREFELT
                                                                                  %
                                                                                  85))
                                                                                |i|
                                                                                |j|
                                                                                (QREFELT
                                                                                 %
                                                                                 86))
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |l|
                                                                                 (QREFELT
                                                                                  %
                                                                                  85))
                                                                                |j|
                                                                                |i|
                                                                                (QREFELT
                                                                                 %
                                                                                 86))
                                                                               (QREFELT
                                                                                %
                                                                                27))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |r|
                                                                                 (QREFELT
                                                                                  %
                                                                                  85))
                                                                                |w|
                                                                                |k|
                                                                                (QREFELT
                                                                                 %
                                                                                 86))
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |r|
                                                                                 (QREFELT
                                                                                  %
                                                                                  85))
                                                                                |k|
                                                                                |w|
                                                                                (QREFELT
                                                                                 %
                                                                                 86))
                                                                               (QREFELT
                                                                                %
                                                                                27))
                                                                              (QREFELT
                                                                               %
                                                                               26))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |t|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |l|
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |t|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |r|
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (QREFELT
                                                                               %
                                                                               27))
                                                                             (QREFELT
                                                                              %
                                                                              26))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |w|
                                                                               |k|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |k|
                                                                               |w|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (QREFELT
                                                                               %
                                                                               27))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |l|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |j|
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |l|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |r|
                                                                               |j|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (QREFELT
                                                                               %
                                                                               27))
                                                                             (QREFELT
                                                                              %
                                                                              26))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |i|
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |l|
                                                                              |i|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              27))
                                                                            (QREFELT
                                                                             %
                                                                             26))
                                                                           (QREFELT
                                                                            %
                                                                            88))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |w|
                                                                              |j|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |j|
                                                                              |w|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              27))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |k|
                                                                              |i|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |i|
                                                                              |k|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              27))
                                                                            (QREFELT
                                                                             %
                                                                             26))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |l|
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |r|
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (QREFELT
                                                                            %
                                                                            26))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |k|
                                                                             |i|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |k|
                                                                             |i|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |j|
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |r|
                                                                             |j|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (QREFELT
                                                                            %
                                                                            26))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |w|
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |l|
                                                                            |w|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            27))
                                                                          (QREFELT
                                                                           %
                                                                           26))
                                                                         (QREFELT
                                                                          %
                                                                          88))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |k|
                                                                            |j|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |j|
                                                                            |k|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            27))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |i|
                                                                            |w|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |w|
                                                                            |i|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            27))
                                                                          (QREFELT
                                                                           %
                                                                           26))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |l|
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |r|
                                                                           |l|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (QREFELT
                                                                          %
                                                                          26))
                                                                        (QREFELT
                                                                         % 27))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |i|
                                                                           |w|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |w|
                                                                           |i|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |j|
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |r|
                                                                           |j|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (QREFELT
                                                                          %
                                                                          26))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |k|
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |l|
                                                                          |k|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (QREFELT
                                                                          %
                                                                          27))
                                                                        (QREFELT
                                                                         % 26))
                                                                       (QREFELT
                                                                        %
                                                                        88)))))
                                                              (LETT |r|
                                                                    (|inc_SI|
                                                                     |r|))
                                                              (GO G190) G191
                                                              (EXIT NIL))))
                                                       (LETT |l|
                                                             (|inc_SI| |l|))
                                                       (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |res|
                                                                (QREFELT %
                                                                         72)))
                                                     (PROGN
                                                      (LETT #1#
                                                            (PROGN
                                                             (LETT #2# NIL)
                                                             (GO #10=#:G356)))
                                                      (GO #11=#:G348)))))))
                                                #11# (EXIT #1#))
                                               (LETT |t| (|inc_SI| |t|))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |w| (|inc_SI| |w|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #10# (EXIT #2#)))) 

(SDEFUN |ALGSC;jordanAlgebra?;B;34| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G388 NIL) (#2=#:G389 NIL) (|res| (R)) (#3=#:G396 NIL) (|s| NIL)
          (#4=#:G395 NIL) (|r| NIL) (#5=#:G394 NIL) (|t| NIL) (#6=#:G393 NIL)
          (|l| NIL) (#7=#:G392 NIL) (|k| NIL) (#8=#:G391 NIL) (|j| NIL)
          (#9=#:G390 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND
            ((OR
              (QEQCAR
               (SPADCALL (SPADCALL 2 (|spadConstant| % 73) (QREFELT % 98))
                         (QREFELT % 99))
               1)
              (NULL (SPADCALL (QREFELT % 92))))
             NIL)
            ('T
             (SEQ
              (SEQ (LETT |i| 1) (LETT #9# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #8# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |j| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #7# (QREFELT % 7)) G190
                                 (COND ((|greater_SI| |k| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |l| 1) (LETT #6# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |l| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |t| 1)
                                               (LETT #5# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |t| #5#)
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |res|
                                                      (|spadConstant| % 13))
                                                (EXIT
                                                 (SEQ (LETT |r| 1)
                                                      (LETT #4# (QREFELT % 7))
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |r| #4#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (SEQ (LETT |s| 1)
                                                             (LETT #3#
                                                                   (QREFELT %
                                                                            7))
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |s| #3#)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (SEQ
                                                                (LETT |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |res|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |i|
                                                                               |j|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |s|
                                                                                (QREFELT
                                                                                 %
                                                                                 85))
                                                                               |l|
                                                                               |k|
                                                                               (QREFELT
                                                                                %
                                                                                86))
                                                                              (QREFELT
                                                                               %
                                                                               26))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |r|
                                                                              |s|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              26))
                                                                            (QREFELT
                                                                             %
                                                                             27))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |l|
                                                                              |k|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |s|
                                                                               (QREFELT
                                                                                %
                                                                                85))
                                                                              |j|
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               86))
                                                                             (QREFELT
                                                                              %
                                                                              26))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |i|
                                                                             |s|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             26))
                                                                           (QREFELT
                                                                            %
                                                                            88))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |l|
                                                                             |j|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |s|
                                                                              (QREFELT
                                                                               %
                                                                               85))
                                                                             |k|
                                                                             |k|
                                                                             (QREFELT
                                                                              %
                                                                              86))
                                                                            (QREFELT
                                                                             %
                                                                             26))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |r|
                                                                            |s|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            26))
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |k|
                                                                            |i|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |s|
                                                                             (QREFELT
                                                                              %
                                                                              85))
                                                                            |j|
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             86))
                                                                           (QREFELT
                                                                            %
                                                                            26))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |l|
                                                                           |s|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           26))
                                                                         (QREFELT
                                                                          %
                                                                          88))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |k|
                                                                           |j|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |s|
                                                                            (QREFELT
                                                                             %
                                                                             85))
                                                                           |i|
                                                                           |k|
                                                                           (QREFELT
                                                                            %
                                                                            86))
                                                                          (QREFELT
                                                                           %
                                                                           26))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |r|
                                                                          |s|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (QREFELT
                                                                          %
                                                                          26))
                                                                        (QREFELT
                                                                         % 27))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |i|
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |s|
                                                                           (QREFELT
                                                                            %
                                                                            85))
                                                                          |j|
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           86))
                                                                         (QREFELT
                                                                          %
                                                                          26))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |t|
                                                                          (QREFELT
                                                                           %
                                                                           85))
                                                                         |k|
                                                                         |s|
                                                                         (QREFELT
                                                                          %
                                                                          86))
                                                                        (QREFELT
                                                                         % 26))
                                                                       (QREFELT
                                                                        % 88)))
                                                                (EXIT
                                                                 (COND
                                                                  ((NULL
                                                                    (SPADCALL
                                                                     |res|
                                                                     (QREFELT %
                                                                              72)))
                                                                   (PROGN
                                                                    (LETT #1#
                                                                          (PROGN
                                                                           (LETT
                                                                            #2#
                                                                            NIL)
                                                                           (GO
                                                                            #10=#:G387)))
                                                                    (GO
                                                                     #11=#:G376)))))))
                                                              #11# (EXIT #1#))
                                                             (LETT |s|
                                                                   (|inc_SI|
                                                                    |s|))
                                                             (GO G190) G191
                                                             (EXIT NIL))))
                                                      (LETT |r| (|inc_SI| |r|))
                                                      (GO G190) G191
                                                      (EXIT NIL))))
                                               (LETT |t| (|inc_SI| |t|))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |l| (|inc_SI| |l|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #10# (EXIT #2#)))) 

(SDEFUN |ALGSC;jacobiIdentity?;B;35| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G410 NIL) (#2=#:G411 NIL) (|res| (R)) (#3=#:G416 NIL) (|s| NIL)
          (#4=#:G415 NIL) (|r| NIL) (#5=#:G414 NIL) (|k| NIL) (#6=#:G413 NIL)
          (|j| NIL) (#7=#:G412 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 13))
                                             (SEQ (LETT |s| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |s| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |s|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          %
                                                                          85))
                                                                        |s| |k|
                                                                        (QREFELT
                                                                         % 86))
                                                                       (QREFELT
                                                                        % 26))
                                                                      (QREFELT
                                                                       % 27))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |s|
                                                               (QREFELT % 85))
                                                              |j| |k|
                                                              (QREFELT % 86))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 85))
                                                              |s| |i|
                                                              (QREFELT % 86))
                                                             (QREFELT % 26))
                                                            (QREFELT % 27))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |s|
                                                              (QREFELT % 85))
                                                             |k| |i|
                                                             (QREFELT % 86))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 85))
                                                             |s| |j|
                                                             (QREFELT % 86))
                                                            (QREFELT % 26))
                                                           (QREFELT % 27)))))
                                                  (LETT |s| (|inc_SI| |s|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 72)))
                                                (PROGN
                                                 (LETT #1#
                                                       (PROGN
                                                        (LETT #2# NIL)
                                                        (GO #8=#:G409)))
                                                 (GO #9=#:G403)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |AlgebraGivenByStructuralConstants;|)) 

(DEFUN |AlgebraGivenByStructuralConstants;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G422 NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$|
          (LIST '|AlgebraGivenByStructuralConstants| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 116))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|Finite|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|OrderedVariableList| |#3|)
                                               '(|Comparable|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          #1#)
                                         (|HasCategory| |#1| '(|Finite|)))))))
    (|haddProp| |$ConstructorCache| '|AlgebraGivenByStructuralConstants|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 (|DirectProduct| |#2| |#1|))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 63
                 (CONS (|dispatchFunction| |ALGSC;coordinates;%VV;17|) %)))))
    %))) 

(DEFUN |AlgebraGivenByStructuralConstants| (&REST #1=#:G423)
  (SPROG NIL
         (PROG (#2=#:G424)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL NIL))
                     (HGET |$ConstructorCache|
                           '|AlgebraGivenByStructuralConstants|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |AlgebraGivenByStructuralConstants;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|AlgebraGivenByStructuralConstants|)))))))))) 

(MAKEPROP '|AlgebraGivenByStructuralConstants| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 7)) 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Integer|) |ALGSC;elt;%IR;21| (0 . |Zero|) (|Boolean|)
              (4 . ~=) (|PositiveInteger|)
              (|OrderedVariableList| (NRTEVAL (QREFELT % 8))) (10 . |index|)
              (|Record| (|:| |k| 17) (|:| |c| 6)) (|List| 19)
              |ALGSC;listOfTerms;%L;1| (|NonNegativeInteger|)
              |ALGSC;numberOfMonomials;%Nni;2| |ALGSC;monomial?;%B;3|
              |ALGSC;leadingTerm;%R;4| (15 . *) (21 . +) (|Mapping| 6 17)
              |ALGSC;linearExtend;M%R;9| (|Vector| 6) (27 . |setelt!|)
              (34 . |directProduct|) |ALGSC;reductum;2%;6| (39 . |lookup|)
              |ALGSC;construct;L%;7| |ALGSC;coefficient;%OvlR;8|
              |ALGSC;constructOrdered;L%;10| |ALGSC;monomial;ROvl%;11|
              (|Union| % '"failed") (|FiniteRankNonAssociativeAlgebra&| $$ 6)
              (44 . |recip|) |ALGSC;recip;%U;12| (|Matrix| 6)
              (|SquareMatrix| (NRTEVAL (QREFELT % 7)) 6) (49 . |coerce|)
              (54 . |apply|) |ALGSC;*;Sm2%;13| |ALGSC;coerce;V%;14|
              (|Vector| 43) |ALGSC;structuralConstants;V;15| (|List| 6)
              (60 . |entries|) (65 . |vector|) |ALGSC;coordinates;%V;16|
              (|Vector| $$) (70 . |maxIndex|) (75 . |elt|) (81 . |setColumn!|)
              (|Union| 30 '"failed") (|LinearSystemMatrixPackage2| 6)
              (88 . |solveUniquely|) (|Vector| %) (94 . |coordinates|)
              (100 . |unitVector|) |ALGSC;basis;V;18| |ALGSC;someBasis;V;19|
              |ALGSC;rank;Pi;20| (105 . |elt|) (111 . |zero?|) (|OutputForm|)
              (116 . |coerce|) (121 . |zero?|) (126 . |One|) (130 . =)
              (|Symbol|) (|List| 75) (136 . |elt|) (142 . |coerce|) (147 . *)
              (153 . +) (|Mapping| 70 70 70) (|List| 70) (159 . |reduce|)
              |ALGSC;coerce;%Of;22| (165 . |elt|) (171 . |elt|) |ALGSC;*;3%;23|
              (178 . -) |ALGSC;alternative?;B;24| |ALGSC;associative?;B;25|
              |ALGSC;antiAssociative?;B;26| |ALGSC;commutative?;B;27|
              |ALGSC;antiCommutative?;B;28| |ALGSC;leftAlternative?;B;29|
              |ALGSC;rightAlternative?;B;30| |ALGSC;flexible?;B;31|
              |ALGSC;lieAdmissible?;B;32| (184 . *) (190 . |recip|)
              |ALGSC;jordanAdmissible?;B;33| |ALGSC;jordanAlgebra?;B;34|
              |ALGSC;jacobiIdentity?;B;35| (|String|) (|List| (|Polynomial| 6))
              (|SparseUnivariatePolynomial| 6) (|List| %) (|List| 17)
              (|Mapping| 6 6) (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|InputForm|) (|HashState|) (|SingleInteger|) (|List| 30)
              (|Record| (|:| |particular| %) (|:| |basis| 106))
              (|Union| 114 '"failed"))
           '#(~= 195 |zero?| 201 |unit| 206 |support| 210 |subtractIfCan| 215
              |structuralConstants| 221 |someBasis| 230 |smaller?| 234 |size|
              240 |sample| 244 |rightUnits| 248 |rightUnit| 252
              |rightTraceMatrix| 256 |rightTrace| 265
              |rightRegularRepresentation| 270 |rightRecip| 281
              |rightRankPolynomial| 286 |rightPower| 290 |rightNorm| 296
              |rightMinimalPolynomial| 301 |rightDiscriminant| 306
              |rightCharacteristicPolynomial| 315 |rightAlternative?| 320
              |represents| 324 |reductum| 335 |recip| 340 |rank| 345 |random|
              349 |powerAssociative?| 353 |plenaryPower| 357 |opposite?| 363
              |numberOfMonomials| 369 |noncommutativeJordanAlgebra?| 374
              |monomials| 378 |monomial?| 383 |monomial| 388 |map| 394 |lookup|
              400 |listOfTerms| 405 |linearExtend| 410 |lieAlgebra?| 416
              |lieAdmissible?| 420 |leftUnits| 424 |leftUnit| 428
              |leftTraceMatrix| 432 |leftTrace| 441 |leftRegularRepresentation|
              446 |leftRecip| 457 |leftRankPolynomial| 462 |leftPower| 466
              |leftNorm| 472 |leftMinimalPolynomial| 477 |leftDiscriminant| 482
              |leftCharacteristicPolynomial| 491 |leftAlternative?| 496
              |leadingTerm| 500 |leadingSupport| 505 |leadingMonomial| 510
              |leadingCoefficient| 515 |latex| 520 |jordanAlgebra?| 525
              |jordanAdmissible?| 529 |jacobiIdentity?| 533 |index| 537
              |hashUpdate!| 542 |hash| 548 |flexible?| 553 |enumerate| 557
              |elt| 561 |coordinates| 567 |convert| 589 |constructOrdered| 604
              |construct| 609 |conditionsForIdempotents| 614 |commutator| 623
              |commutative?| 629 |coerce| 633 |coefficients| 643 |coefficient|
              648 |basis| 654 |associatorDependence| 658 |associator| 662
              |associative?| 669 |apply| 673 |antiCommutator| 679
              |antiCommutative?| 685 |antiAssociative?| 689 |alternative?| 693
              ^ 697 |Zero| 703 = 707 - 713 + 724 * 730)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 7 0 0 2
                                  0 3 1 0 0))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |FreeModuleCategory&|
                |NonAssociativeAlgebra&| |Module&| NIL NIL |FramedModule&| NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL
                |Finite&| |AbelianMonoid&| |NonAssociativeSemiRng&| NIL
                |Magma&| |AbelianSemiGroup&| |Hashable&| |SetCategory&| NIL NIL
                NIL |BasicType&|)
             (CONS
              '#((|FramedNonAssociativeAlgebra| 6)
                 (|FiniteRankNonAssociativeAlgebra| 6)
                 (|FreeModuleCategory| 6 (|OrderedVariableList| 8))
                 (|NonAssociativeAlgebra| 6) (|Module| 6)
                 (|IndexedDirectProductCategory| 6 (|OrderedVariableList| 8))
                 (|BiModule| 6 6) (|FramedModule| 6)
                 (|IndexedProductCategory| 6 (|OrderedVariableList| 8))
                 (|LeftModule| 6) (|RightModule| 6)
                 (|AbelianProductCategory| 6)
                 (|LeftModule| (|SquareMatrix| 7 6)) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|Finite|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|Comparable|)
                 (|Magma|) (|AbelianSemiGroup|) (|Hashable|) (|SetCategory|)
                 (|ConvertibleTo| 110) (|unitsKnown|) (|CoercibleTo| 70)
                 (|BasicType|))
              (|makeByteWordVec2| 115
                                  '(0 6 0 13 2 6 14 0 0 15 1 17 0 16 18 2 6 0 0
                                    0 26 2 6 0 0 0 27 3 30 6 0 11 6 31 1 10 0
                                    30 32 1 17 16 0 34 1 40 39 0 41 1 44 43 0
                                    45 2 0 0 43 0 46 1 10 51 0 52 1 30 0 51 53
                                    1 55 11 0 56 2 55 2 0 11 57 3 43 0 0 11 30
                                    58 2 60 59 43 30 61 2 0 30 0 62 63 1 10 0
                                    16 64 2 10 6 0 11 68 1 10 14 0 69 1 6 70 0
                                    71 1 6 14 0 72 0 6 0 73 2 6 14 0 0 74 2 76
                                    75 0 11 77 1 75 70 0 78 2 70 0 0 0 79 2 70
                                    0 0 0 80 2 82 70 81 0 83 2 49 43 0 11 85 3
                                    43 6 0 11 11 86 2 6 0 0 0 88 2 6 0 16 0 98
                                    1 6 39 0 99 2 0 14 0 0 1 1 0 14 0 1 0 1 39
                                    1 1 0 107 0 1 2 0 39 0 0 1 1 0 49 62 1 0 0
                                    49 50 0 0 62 66 2 7 14 0 0 1 0 3 22 1 0 0 0
                                    1 0 1 115 1 0 1 39 1 1 0 43 62 1 0 0 43 1 1
                                    0 6 0 1 2 0 43 0 62 1 1 0 43 0 1 1 1 39 0 1
                                    0 4 109 1 2 0 0 0 16 1 1 0 6 0 1 1 1 105 0
                                    1 1 0 6 62 1 0 0 6 1 1 0 105 0 1 0 0 14 95
                                    2 0 0 30 62 1 1 0 0 30 1 1 6 0 0 33 1 1 39
                                    0 42 0 0 16 67 0 3 0 1 0 0 14 1 2 0 0 0 16
                                    1 2 0 14 0 0 1 1 0 22 0 23 0 0 14 1 1 0 106
                                    0 1 1 0 14 0 24 2 0 0 6 17 38 2 0 0 108 0 1
                                    1 3 16 0 1 1 0 20 0 21 2 5 6 28 0 29 0 0 14
                                    1 0 0 14 97 0 1 115 1 0 1 39 1 1 0 43 62 1
                                    0 0 43 1 1 0 6 0 1 2 0 43 0 62 1 1 0 43 0 1
                                    1 1 39 0 1 0 4 109 1 2 0 0 0 16 1 1 0 6 0 1
                                    1 1 105 0 1 1 0 6 62 1 0 0 6 1 1 0 105 0 1
                                    0 0 14 94 1 6 19 0 25 1 6 17 0 1 1 6 0 0 1
                                    1 6 6 0 1 1 0 103 0 1 0 0 14 101 0 0 14 100
                                    0 0 14 102 1 3 0 16 1 2 2 111 111 0 1 1 2
                                    112 0 1 0 0 14 96 0 3 106 1 2 0 6 0 11 12 2
                                    0 43 62 62 1 2 0 30 0 62 63 1 0 43 62 1 1 0
                                    30 0 54 1 0 0 30 1 1 0 30 0 1 1 3 110 0 1 1
                                    6 0 20 37 1 0 0 20 35 1 0 104 62 1 0 0 104
                                    1 2 0 0 0 0 1 0 0 14 92 1 0 70 0 84 1 0 0
                                    30 48 1 0 51 0 1 2 0 6 0 17 36 0 0 62 65 0
                                    1 113 1 3 0 0 0 0 0 1 0 0 14 90 2 0 0 43 0
                                    46 2 0 0 0 0 1 0 0 14 93 0 0 14 91 0 0 14
                                    89 2 0 0 0 16 1 0 0 0 1 2 0 14 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 16 0 1 2
                                    0 0 0 0 87 2 0 0 11 0 1 2 0 0 22 0 1 2 0 0
                                    6 0 1 2 0 0 0 6 1 2 0 0 44 0 47)))))
           '|lookupComplete|)) 
