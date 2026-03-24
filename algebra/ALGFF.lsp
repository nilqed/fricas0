
(SDEFUN |ALGFF;branchPointAtInfinity?;B;1| ((% (|Boolean|)))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 11)))) 

(SDEFUN |ALGFF;discriminant;F;2| ((% (|Fraction| UP)))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 14)))) 

(SDEFUN |ALGFF;integralBasis;V;3| ((% (|Vector| %)))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (|ALGFF;vect| (QREFELT % 23) %)))) 

(SDEFUN |ALGFF;integralBasisAtInfinity;V;4| ((% (|Vector| %)))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (|ALGFF;vect| (QREFELT % 26) %)))) 

(SDEFUN |ALGFF;integralMatrix;M;5| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 23)))) 

(SDEFUN |ALGFF;inverseIntegralMatrix;M;6| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 25)))) 

(SDEFUN |ALGFF;integralMatrixAtInfinity;M;7| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 26)))) 

(SDEFUN |ALGFF;branchPoint?;FB;8| ((|a| (F)) (% (|Boolean|)))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL (QREFELT % 30)) (QREFELT % 37)) |a|
                   (QREFELT % 38))
         (QREFELT % 39))) 

(SDEFUN |ALGFF;definingPolynomial;UPUP;9| ((% (UPUP))) (QREFELT % 9)) 

(SDEFUN |ALGFF;inverseIntegralMatrixAtInfinity;M;10|
        ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 27)))) 

(SDEFUN |ALGFF;vect| ((|m| (|Matrix| (|Fraction| UP))) (% (|Vector| %)))
        (SPROG ((#1=#:G26 NIL) (#2=#:G28 NIL) (|i| NIL) (#3=#:G27 NIL))
               (SEQ
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI|
                         (- #4=(SPADCALL |m| (QREFELT % 44))
                            #5=(PROGN |m| 1)))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (SPADCALL |m| |i| (QREFELT % 46))
                                          (QREFELT % 47)))))
                      (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |ALGFF;integralCoordinates;%R;12|
        ((|f| (%)) (% (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))))
        (SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT % 48)) (SPADCALL (QREFELT % 35))
                   (QREFELT % 49))
         (QREFELT % 52))) 

(SDEFUN |ALGFF;knownInfBasis;NniV;13|
        ((|d| (|NonNegativeInteger|)) (% (|Void|)))
        (SPROG
         ((#1=#:G49 NIL) (|j| NIL) (#2=#:G48 NIL) (|i| NIL)
          (|invib| #3=(|Matrix| (|Fraction| UP))) (|ib| #3#) (#4=#:G45 NIL)
          (#5=#:G47 NIL) (#6=#:G46 NIL) (|alpha| (|Vector| (|Fraction| UP)))
          (#7=#:G44 NIL) (#8=#:G43 NIL))
         (SEQ
          (COND
           ((QREFELT % 10)
            (SEQ
             (LETT |alpha|
                   (PROGN
                    (LETT #8# (GETREFV (|inc_SI| #9=(QREFELT % 20))))
                    (SEQ (LETT |i| 0) (LETT #7# #9#) G190
                         (COND ((|greater_SI| |i| #7#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT #8# |i|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 54) (* |d| |i|)
                                              (QREFELT % 55))
                                    (QREFELT % 56)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    #8#))
             (LETT |ib|
                   (SPADCALL
                    (PROGN
                     (LETT #6#
                           (GETREFV
                            (|inc_SI|
                             (- #10=(QVSIZE |alpha|)
                                #11=(SPADCALL |alpha| (QREFELT % 57))))))
                     (SEQ (LETT |i| #11#) (LETT #5# #10#) (LETT #4# 0) G190
                          (COND ((> |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #6# #4#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT % 58)))))
                          (LETT #4#
                                (PROG1 (|inc_SI| #4#) (LETT |i| (+ |i| 1))))
                          (GO G190) G191 (EXIT NIL))
                     #6#)
                    (QREFELT % 59)))
             (LETT |invib| (SPADCALL |alpha| (QREFELT % 59)))
             (EXIT
              (SEQ (LETT |i| (PROGN |ib| 1))
                   (LETT #2# (SPADCALL |ib| (QREFELT % 44))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN |ib| 1))
                          (LETT #1# (SPADCALL |ib| (QREFELT % 60))) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT % 26) |i| |j|
                                     (QAREF2O |ib| |i| |j| 1 1) (QREFELT % 61))
                           (EXIT
                            (SPADCALL (QREFELT % 27) |i| |j|
                                      (SPADCALL |invib| |i| |j| (QREFELT % 62))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))))
          (EXIT (SPADCALL (QREFELT % 64)))))) 

(SDEFUN |ALGFF;getInfBasis| ((% (|Void|)))
        (SPROG
         ((#1=#:G78 NIL) (|j| NIL) (#2=#:G77 NIL) (|i| NIL)
          (|invib2| #3=(|Matrix| (|Fraction| UP))) (|ib2| #3#) (#4=#:G76 NIL)
          (#5=#:G75 NIL)
          (|invib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|invalpha| (|Vector| (|Fraction| UP))) (#6=#:G72 NIL) (#7=#:G74 NIL)
          (#8=#:G73 NIL) (|alpha| (|Vector| (|Fraction| UP))) (#9=#:G71 NIL)
          (#10=#:G70 NIL) (|ninvmod| (|SparseUnivariatePolynomial| UP))
          (|r| (|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
          (|invmod| (UPUP)) (|x| (|Fraction| UP)))
         (SEQ
          (LETT |x|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| % 54) 1 (QREFELT % 55))
                           (QREFELT % 56))
                 (QREFELT % 58)))
          (LETT |invmod|
                (SPADCALL (CONS #'|ALGFF;getInfBasis!0| (VECTOR % |x|))
                          (QREFELT % 9) (QREFELT % 69)))
          (LETT |r| (SPADCALL |invmod| (QREFELT % 72)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 16)) (QREFELT % 17)
                       (QREFELT % 73))
             (|error| "Should not happen"))
            ('T
             (SEQ
              (LETT |ninvmod| (SPADCALL (ELT % 37) (QCDR |r|) (QREFELT % 77)))
              (LETT |alpha|
                    (PROGN
                     (LETT #10# (GETREFV (|inc_SI| #11=(QREFELT % 20))))
                     (SEQ (LETT |i| 0) (LETT #9# #11#) G190
                          (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #10# |i|
                                    (SPADCALL
                                     (SPADCALL (QCAR |r|) |i| (QREFELT % 78))
                                     |x| (QREFELT % 67)))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                     #10#))
              (LETT |invalpha|
                    (PROGN
                     (LETT #8#
                           (GETREFV
                            (|inc_SI|
                             (- #12=(QVSIZE |alpha|)
                                #13=(SPADCALL |alpha| (QREFELT % 57))))))
                     (SEQ (LETT |i| #13#) (LETT #7# #12#) (LETT #6# 0) G190
                          (COND ((> |i| #7#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #8# #6#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT % 58)))))
                          (LETT #6#
                                (PROG1 (|inc_SI| #6#) (LETT |i| (+ |i| 1))))
                          (GO G190) G191 (EXIT NIL))
                     #8#))
              (LETT |invib|
                    (SPADCALL
                     (|compiledLookupCheck| '|integralBasis|
                                            (LIST
                                             (LIST '|Record|
                                                   (LIST '|:| '|basis|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT % 7))))
                                                   (LIST '|:| '|basisDen|
                                                         (|devaluate|
                                                          (ELT % 7)))
                                                   (LIST '|:| '|basisInv|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT % 7))))))
                                            (|FunctionFieldIntegralBasis|
                                             (ELT % 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT % 7))
                                             (|SimpleAlgebraicExtension|
                                              (ELT % 7)
                                              (|SparseUnivariatePolynomial|
                                               (ELT % 7))
                                              |ninvmod|)))))
              (SEQ (LETT |i| (PROGN (QREFELT % 23) 1))
                   (LETT #5# (SPADCALL (QREFELT % 23) (QREFELT % 44))) G190
                   (COND ((> |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT % 23) 1))
                          (LETT #4# (SPADCALL (QREFELT % 23) (QREFELT % 60)))
                          G190 (COND ((> |j| #4#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT % 26) |i| |j|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QVELT |invib| 0) |i| |j|
                                                 (QREFELT % 81))
                                       (QVELT |invib| 1) (QREFELT % 82))
                                      |x| (QREFELT % 67))
                                     (QREFELT % 61))
                           (EXIT
                            (SPADCALL (QREFELT % 27) |i| |j|
                                      (SPADCALL
                                       (SPADCALL (QVELT |invib| 2) |i| |j|
                                                 (QREFELT % 81))
                                       |x| (QREFELT % 83))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |ib2|
                    (SPADCALL (QREFELT % 26) (SPADCALL |alpha| (QREFELT % 59))
                              (QREFELT % 84)))
              (LETT |invib2|
                    (SPADCALL (SPADCALL |invalpha| (QREFELT % 59))
                              (QREFELT % 27) (QREFELT % 84)))
              (SEQ (LETT |i| (PROGN |ib2| 1))
                   (LETT #2# (SPADCALL |ib2| (QREFELT % 44))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT % 23) 1))
                          (LETT #1# (SPADCALL (QREFELT % 23) (QREFELT % 60)))
                          G190 (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT % 26) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT % 61))
                           (EXIT
                            (SPADCALL (QREFELT % 27) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT % 62))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT % 64)))))))))) 

(SDEFUN |ALGFF;getInfBasis!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |x| (QREFELT % 67)))))) 

(SDEFUN |ALGFF;startUp| ((|b| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|dsc| (|Fraction| UP)) (|dsc0| (|Fraction| UP)) (#1=#:G101 NIL)
          (|j| NIL) (#2=#:G100 NIL) (|i| NIL)
          (|invib2| (|Matrix| (|Fraction| UP))) (#3=#:G88 NIL)
          (|ib2| (|Matrix| (|Fraction| UP))) (#4=#:G99 NIL) (#5=#:G98 NIL)
          (|ib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|nmod| (|SparseUnivariatePolynomial| UP)))
         (SEQ (SETELT % 10 |b|)
              (LETT |nmod| (SPADCALL (ELT % 37) (QREFELT % 9) (QREFELT % 77)))
              (LETT |ib|
                    (SPADCALL
                     (|compiledLookupCheck| '|integralBasis|
                                            (LIST
                                             (LIST '|Record|
                                                   (LIST '|:| '|basis|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT % 7))))
                                                   (LIST '|:| '|basisDen|
                                                         (|devaluate|
                                                          (ELT % 7)))
                                                   (LIST '|:| '|basisInv|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT % 7))))))
                                            (|FunctionFieldIntegralBasis|
                                             (ELT % 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT % 7))
                                             (|SimpleAlgebraicExtension|
                                              (ELT % 7)
                                              (|SparseUnivariatePolynomial|
                                               (ELT % 7))
                                              |nmod|)))))
              (SEQ (LETT |i| (PROGN (QREFELT % 23) 1))
                   (LETT #5# (SPADCALL (QREFELT % 23) (QREFELT % 44))) G190
                   (COND ((> |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT % 23) 1))
                          (LETT #4# (SPADCALL (QREFELT % 23) (QREFELT % 60)))
                          G190 (COND ((> |j| #4#) (GO G191)))
                          (SEQ
                           (QSETAREF2O (QREFELT % 23) |i| |j|
                                       (SPADCALL
                                        (SPADCALL (QVELT |ib| 0) |i| |j|
                                                  (QREFELT % 81))
                                        (QVELT |ib| 1) (QREFELT % 82))
                                       1 1)
                           (EXIT
                            (SPADCALL (QREFELT % 25) |i| |j|
                                      (SPADCALL
                                       (SPADCALL (QVELT |ib| 2) |i| |j|
                                                 (QREFELT % 81))
                                       (QREFELT % 56))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL
                 (SPADCALL (QREFELT % 26) (PROGN (QREFELT % 26) 1)
                           (PROGN (QREFELT % 26) 1) (QREFELT % 62))
                 (QREFELT % 85))
                (|ALGFF;getInfBasis| %)))
              (LETT |ib2|
                    (SPADCALL
                     (SPADCALL (|ALGFF;vect| (QREFELT % 23) %) (QREFELT % 86))
                     (QREFELT % 87)))
              (LETT |invib2|
                    (PROG2 (LETT #3# (SPADCALL |ib2| (QREFELT % 89)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|Matrix| (|Fraction| (QREFELT % 7)))
                                      (|Union|
                                       (|Matrix| (|Fraction| (QREFELT % 7)))
                                       "failed")
                                      #3#)))
              (SEQ (LETT |i| (PROGN |ib2| 1))
                   (LETT #2# (SPADCALL |ib2| (QREFELT % 44))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN |ib2| 1))
                          (LETT #1# (SPADCALL |ib2| (QREFELT % 60))) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT % 23) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT % 61))
                           (EXIT
                            (SPADCALL (QREFELT % 25) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT % 62))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |dsc|
                    (SPADCALL (QREFELT % 9)
                              (SPADCALL (QREFELT % 9) (QREFELT % 90))
                              (QREFELT % 91)))
              (LETT |dsc0|
                    (SPADCALL |dsc|
                              (SPADCALL
                               (SPADCALL (QREFELT % 26) (QREFELT % 92)) 2
                               (QREFELT % 78))
                              (QREFELT % 93)))
              (EXIT
               (COND
                ((> (SPADCALL (SPADCALL |dsc0| (QREFELT % 94)) (QREFELT % 95))
                    (SPADCALL (SPADCALL |dsc0| (QREFELT % 96)) (QREFELT % 95)))
                 (|error| "Shouldn't happen"))
                ('T
                 (SEQ
                  (SETELT % 11
                          (<
                           (SPADCALL (SPADCALL |dsc0| (QREFELT % 94))
                                     (QREFELT % 95))
                           (SPADCALL (SPADCALL |dsc0| (QREFELT % 96))
                                     (QREFELT % 95))))
                  (LETT |dsc|
                        (SPADCALL |dsc|
                                  (SPADCALL
                                   (SPADCALL (QREFELT % 23) (QREFELT % 92)) 2
                                   (QREFELT % 78))
                                  (QREFELT % 93)))
                  (SETELT % 14
                          (SPADCALL
                           (SPADCALL (SPADCALL |dsc| (QREFELT % 94))
                                     (QREFELT % 97))
                           (SPADCALL |dsc| (QREFELT % 96)) (QREFELT % 82)))
                  (EXIT (SPADCALL (QREFELT % 64)))))))))) 

(SDEFUN |ALGFF;integralDerivationMatrix;MR;16|
        ((|d| (|Mapping| UP UP))
         (% (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP))))
        (SPROG
         ((#1=#:G117 NIL) (#2=#:G119 NIL) (|i| NIL) (#3=#:G118 NIL)
          (|w| (|Vector| %)))
         (SEQ (LETT |w| (SPADCALL (QREFELT % 32)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3#
                         (GETREFV
                          (|inc_SI|
                           (- #4=(SPADCALL |w| (QREFELT % 100))
                              #5=(SPADCALL |w| (QREFELT % 99))))))
                   (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                        (COND ((> |i| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #3# #1#
                                  (SPADCALL (SPADCALL |w| |i| (QREFELT % 101))
                                            |d| (QREFELT % 103)))))
                        (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                        (GO G190) G191 (EXIT NIL))
                   #3#)
                  (QREFELT % 87))
                 (SPADCALL (QREFELT % 35)) (QREFELT % 84))
                (QREFELT % 106)))))) 

(SDEFUN |ALGFF;integralRepresents;VUP%;17|
        ((|v| (|Vector| UP)) (|d| (UP)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |v| |d| (QREFELT % 109)) (QREFELT % 48))
                   (SPADCALL (QREFELT % 34)) (QREFELT % 49))
         (QREFELT % 47))) 

(SDEFUN |ALGFF;branchPoint?;UPB;18| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
                    (LETT |r| (SPADCALL |p| (QREFELT % 112)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 40)))
                      ('T
                       (NULL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT % 30)) (QREFELT % 37))
                          |p| (QREFELT % 113))
                         (QREFELT % 114))))))))) 

(DECLAIM (NOTINLINE |AlgebraicFunctionField;|)) 

(DEFUN |AlgebraicFunctionField;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G4 NIL) (|pv$| NIL) (#2=#:G170 NIL) (#3=#:G171 NIL) (% NIL)
    (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|AlgebraicFunctionField| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 160))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #3#
                                              (|HasCategory| (|Fraction| |#2|)
                                                             '(|Field|)))
                                        (OR #3#
                                            (|HasCategory| (|Fraction| |#2|)
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Finite|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Hashable|))
                                        (OR
                                         (AND
                                          (|HasCategory| (|Fraction| |#2|)
                                                         '(|DifferentialRing|))
                                          #3#)
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|Field|))))
                                        (OR #2#
                                            (AND
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|FiniteFieldCategory|))))
                                        (OR
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#)
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|Finite|))))))
    (|haddProp| |$ConstructorCache| '|AlgebraicFunctionField|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND (|HasCategory| % '(|CharacteristicNonZero|))
         (|HasCategory| (|Fraction| |#2|) '(|FiniteFieldCategory|))
         (|augmentPredVector| % 65536))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 'T)
    (QSETREFV % 11 'T)
    (QSETREFV % 14 (|spadConstant| % 13))
    (QSETREFV % 17 (SPADCALL |#4| (QREFELT % 16)))
    (QSETREFV % 20
              (PROG1 (LETT #1# (- (QREFELT % 17) 1))
                (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #1#)))
    (QSETREFV % 23 (SPADCALL (QREFELT % 17) (QREFELT % 17) (QREFELT % 22)))
    (QSETREFV % 25 (SPADCALL (QREFELT % 23) (QREFELT % 24)))
    (QSETREFV % 26 (SPADCALL (QREFELT % 23) (QREFELT % 24)))
    (QSETREFV % 27 (SPADCALL (QREFELT % 23) (QREFELT % 24)))
    %))) 

(DEFUN |AlgebraicFunctionField| (&REST #1=#:G172)
  (SPROG NIL
         (PROG (#2=#:G173)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T T NIL))
                     (HGET |$ConstructorCache| '|AlgebraicFunctionField|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicFunctionField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicFunctionField|)))))))))) 

(MAKEPROP '|AlgebraicFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SimpleAlgebraicExtension| 12 8 (NRTEVAL (QREFELT % 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|brandNew?| '|infBr?| (|Fraction| 7) (0 . |Zero|) '|discPoly|
              (|NonNegativeInteger|) (4 . |degree|) '|n| (9 . |One|)
              (13 . |One|) '|n1| (|Matrix| 12) (17 . |zero|) '|ibasis|
              (23 . |copy|) '|invibasis| '|infbasis| '|invinfbasis| (|Boolean|)
              |ALGFF;branchPointAtInfinity?;B;1| |ALGFF;discriminant;F;2|
              (|Vector| %) |ALGFF;integralBasis;V;3|
              |ALGFF;integralBasisAtInfinity;V;4| |ALGFF;integralMatrix;M;5|
              |ALGFF;inverseIntegralMatrix;M;6|
              |ALGFF;integralMatrixAtInfinity;M;7| (28 . |retract|)
              (33 . |elt|) (39 . |zero?|) |ALGFF;branchPoint?;FB;8|
              |ALGFF;definingPolynomial;UPUP;9|
              |ALGFF;inverseIntegralMatrixAtInfinity;M;10| (|Integer|)
              (44 . |maxRowIndex|) (|Vector| 12) (49 . |row|)
              (55 . |represents|) (60 . |coordinates|) (65 . *)
              (|Record| (|:| |num| 108) (|:| |den| 7))
              (|InnerCommonDenominator| 7 12 108 45) (71 . |splitDenominator|)
              |ALGFF;integralCoordinates;%R;12| (76 . |One|) (80 . |monomial|)
              (86 . |coerce|) (91 . |minIndex|) (96 . |inv|)
              (101 . |diagonalMatrix|) (106 . |maxColIndex|) (111 . |setelt!|)
              (119 . |elt|) (|Void|) (126 . |void|)
              |ALGFF;knownInfBasis;NniV;13| (|Fraction| %) (130 . |elt|)
              (|Mapping| 12 12) (136 . |map|)
              (|Record| (|:| |coef| 12) (|:| |poly| 8))
              (|ChangeOfVariable| 6 7 8) (142 . |mkIntegral|) (147 . ~=)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 8 7 74)
              (153 . |map|) (159 . ^) (165 . |basis|) (|Matrix| 7)
              (169 . |elt|) (176 . /) (182 . |elt|) (188 . *) (194 . |zero?|)
              (199 . |normalizeAtInfinity|) (204 . |coordinates|)
              (|Union| % '"failed") (209 . |inverse|) (214 . |differentiate|)
              (219 . |resultant|) (225 . |determinant|) (230 . *)
              (236 . |numer|) (241 . |degree|) (246 . |denom|)
              (251 . |primitivePart|) (|Vector| $$) (256 . |minIndex|)
              (261 . |maxIndex|) (266 . |elt|) (|Mapping| 7 7)
              (272 . |differentiate|) (|Record| (|:| |num| 80) (|:| |den| 7))
              (|MatrixCommonDenominator| 7 12) (278 . |splitDenominator|)
              |ALGFF;integralDerivationMatrix;MR;16| (|Vector| 7)
              (283 . |represents|) |ALGFF;integralRepresents;VUP%;17|
              (|Union| 6 '#1="failed") (289 . |retractIfCan|) (294 . |gcd|)
              (300 . |ground?|) |ALGFF;branchPoint?;UPB;18| (|String|)
              (|OutputForm|) (|PositiveInteger|) (|Union| 12 '#1#) (|Matrix| %)
              (|Record| (|:| |mat| 21) (|:| |vec| 45)) (|List| 7)
              (|Union| 7 '"failed")
              (|Record| (|:| |num| %) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Union| 31 '#2="failed") (|List| 127) (|Symbol|) (|List| 15)
              (|Fraction| 43) (|List| (|Polynomial| 6)) (|List| (|List| 6))
              (|Fraction| 8) (|Factored| %) (|Union| 135 '#3="failed")
              (|List| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 136 '#3#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 135) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|InputForm|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |factor| 43) (|:| |exponent| 15)) (|List| 146)
              (|Table| 118 15) (|Factored| 141) (|Union| 151 '#2#) (|List| 141)
              (|Union| 15 '"failed") (|OnePointCompletion| 118)
              (|SingleInteger|) (|HashState|) (|Matrix| 43)
              (|Record| (|:| |mat| 156) (|:| |vec| (|Vector| 43)))
              (|Union| 129 '#1#) (|Union| 43 '#1#))
           '#(~= 305 |zero?| 311 |yCoordinates| 316 |unitNormal| 321
              |unitCanonical| 326 |unit?| 331 |traceMatrix| 336 |trace| 345
              |tableForDiscreteLogarithm| 350 |subtractIfCan| 355
              |squareFreePolynomial| 361 |squareFreePart| 366 |squareFree| 371
              |special_order| 376 |solveLinearPolynomialEquation| 382
              |smaller?| 388 |sizeLess?| 394 |size| 400 |singularAtInfinity?|
              404 |singular?| 408 |sample| 418 |rightRecip| 422 |rightPower|
              427 |retractIfCan| 439 |retract| 454 |represents| 469
              |representationType| 486 |rem| 490 |regularRepresentation| 496
              |reducedSystem| 507 |reduceBasisAtInfinity| 529 |reduce| 534
              |recip| 544 |rationalPoints| 549 |rationalPoint?| 553 |rank| 559
              |random| 563 |ramifiedAtInfinity?| 567 |ramified?| 571 |quo| 581
              |principalIdeal| 587 |primitivePart| 592 |primitiveElement| 597
              |primitive?| 601 |primeFrobenius| 606 |prime?| 617 |plenaryPower|
              622 |order| 628 |opposite?| 638 |one?| 644 |numberOfComponents|
              649 |normalizeAtInfinity| 653 |norm| 658 |nonSingularModel| 663
              |nextItem| 668 |multiEuclidean| 673 |minimalPolynomial| 679
              |lookup| 684 |lift| 689 |leftRecip| 694 |leftPower| 699 |lcmCoef|
              711 |lcm| 717 |latex| 728 |knownInfBasis| 733
              |inverseIntegralMatrixAtInfinity| 738 |inverseIntegralMatrix| 742
              |inv| 746 |integralRepresents| 751 |integralMatrixAtInfinity| 757
              |integralMatrix| 761 |integralDerivationMatrix| 765
              |integralCoordinates| 770 |integralBasisAtInfinity| 775
              |integralBasis| 779 |integralAtInfinity?| 783 |integral?| 788
              |init| 805 |index| 809 |hyperelliptic| 814 |hashUpdate!| 818
              |hash| 824 |genus| 829 |generator| 833 |gcdPolynomial| 837 |gcd|
              843 |factorsOfCyclicGroupSize| 854 |factorSquareFreePolynomial|
              858 |factorPolynomial| 863 |factor| 868 |extendedEuclidean| 873
              |exquo| 886 |expressIdealMember| 892 |euclideanSize| 898
              |enumerate| 903 |elt| 907 |elliptic| 914 |divide| 918
              |discriminant| 924 |discreteLog| 933 |differentiate| 944
              |derivationCoordinates| 1000 |definingPolynomial| 1006
              |createPrimitiveElement| 1010 |coordinates| 1014 |convert| 1036
              |conditionP| 1061 |complementaryBasis| 1066 |commutator| 1071
              |coerce| 1077 |charthRoot| 1102 |characteristicPolynomial| 1112
              |characteristic| 1117 |branchPointAtInfinity?| 1121
              |branchPoint?| 1125 |basis| 1135 |associator| 1139 |associates?|
              1146 |antiCommutator| 1152 |annihilate?| 1158 |algSplitSimple|
              1164 |absolutelyIrreducible?| 1170 ^ 1174 |Zero| 1192 |One| 1196
              D 1200 = 1250 / 1256 - 1262 + 1273 * 1279)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 2 2 4 2 4 4 4 4 4 0 3 3 3 0 0 13 8 5 3 3
                                  1 0 0 0 3 0 0 0 0 3 0 0 0 0 11 3 0 0 0 0 0 11
                                  3 3 0 0 0 0 0 0 0 0 0 6 0 0 0 0 2 6 0 0 0 10
                                  9 7 0 0 0 10 9 6 3 3 3 0 0 0 0 0 0))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |FramedAlgebra&| |DifferentialExtension&| |DivisionRing&| NIL
                NIL |FiniteRankAlgebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Algebra&| |EntireRing&| NIL |Algebra&|
                |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |Rng&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                NIL NIL |NonAssociativeRing&| NIL |FramedModule&| NIL NIL NIL
                NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&|
                NIL NIL NIL |Finite&| |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL NIL NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |RetractableTo&|
                |Hashable&| |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL
                NIL NIL NIL |BasicType&| NIL NIL NIL NIL)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8)
                 (|DifferentialExtension| (|Fraction| 7)) (|DivisionRing|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8)
                 (|PartialDifferentialRing| 127) (|DifferentialRing|)
                 (|CharacteristicNonZero|) (|Algebra| 129) (|EntireRing|)
                 (|CharacteristicZero|) (|Algebra| $$)
                 (|Algebra| (|Fraction| 7)) (|Ring|)
                 (|NonAssociativeAlgebra| 129) (|SemiRing|)
                 (|NonAssociativeAlgebra| (|Fraction| 7)) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|Module| 129) (|SemiRng|)
                 (|Module| (|Fraction| 7)) (|Module| $$)
                 (|FullyLinearlyExplicitOver| (|Fraction| 7))
                 (|LinearlyExplicitOver| 43) (|BiModule| 129 129)
                 (|NonAssociativeRing|)
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|FramedModule| (|Fraction| 7)) (|BiModule| $$ $$)
                 (|LinearlyExplicitOver| (|Fraction| 7)) (|RightModule| 43)
                 (|RightModule| 129) (|LeftModule| 129) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| (|Fraction| 7))
                 (|LeftModule| $$) (|RightModule| (|Fraction| 7))
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|Finite|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|StepThrough|) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|RetractableTo| 43)
                 (|RetractableTo| 129) (|Hashable|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| (|Fraction| 7))
                 (|CoercibleFrom| 43) (|CoercibleFrom| 129)
                 (|ConvertibleTo| 144) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CoercibleTo| 117)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 8) (|CoercibleFrom| (|Fraction| 7)))
              (|makeByteWordVec2| 159
                                  '(0 12 0 13 1 8 15 0 16 0 8 0 18 0 0 0 19 2
                                    21 0 15 15 22 1 21 0 0 24 1 12 7 0 37 2 7 6
                                    0 6 38 1 6 28 0 39 1 21 43 0 44 2 21 45 0
                                    43 46 1 0 0 45 47 1 0 45 0 48 2 21 45 45 0
                                    49 1 51 50 45 52 0 6 0 54 2 7 0 6 15 55 1
                                    12 0 7 56 1 45 43 0 57 1 12 0 0 58 1 21 0
                                    45 59 1 21 43 0 60 4 21 12 0 43 43 12 61 3
                                    21 12 0 43 43 62 0 63 0 64 2 7 66 66 66 67
                                    2 8 0 68 0 69 1 71 70 8 72 2 15 28 0 0 73 2
                                    76 74 75 8 77 2 12 0 0 43 78 0 0 31 79 3 80
                                    7 0 43 43 81 2 12 0 7 7 82 2 7 66 0 66 83 2
                                    21 0 0 0 84 1 12 28 0 85 1 0 31 31 86 1 0
                                    21 31 87 1 21 88 0 89 1 8 0 0 90 2 8 12 0 0
                                    91 1 21 12 0 92 2 12 0 0 0 93 1 12 7 0 94 1
                                    7 15 0 95 1 12 7 0 96 1 7 0 0 97 1 98 43 0
                                    99 1 98 43 0 100 2 98 2 0 43 101 2 0 0 0
                                    102 103 1 105 104 21 106 2 0 0 108 7 109 1
                                    7 111 0 112 2 7 0 0 0 113 1 7 28 0 114 2 0
                                    28 0 0 1 1 0 28 0 1 1 0 50 0 1 1 3 143 0 1
                                    1 3 0 0 1 1 3 28 0 1 1 0 21 31 1 0 0 21 1 1
                                    0 12 0 1 1 2 148 43 1 2 0 88 0 0 1 1 2 149
                                    141 1 1 3 0 0 1 1 3 133 0 1 2 0 43 0 122 1
                                    2 2 150 151 141 1 2 6 28 0 0 1 2 3 28 0 0 1
                                    0 6 15 1 0 0 28 1 1 0 28 7 1 1 0 28 6 1 0 0
                                    0 1 1 0 88 0 1 2 0 0 0 118 1 2 0 0 0 15 1 1
                                    0 119 0 1 1 9 158 0 1 1 10 159 0 1 1 0 12 0
                                    1 1 9 129 0 1 1 10 43 0 1 2 0 0 45 31 1 1 0
                                    0 45 47 2 0 0 108 7 109 0 2 145 1 2 3 0 0 0
                                    1 2 0 21 0 31 1 1 0 21 0 1 1 0 21 120 1 2 0
                                    121 120 31 1 1 11 156 120 1 2 11 157 120 31
                                    1 1 0 31 31 1 1 0 0 8 1 1 3 88 132 1 1 0 88
                                    0 1 0 16 131 1 2 0 28 6 6 1 0 0 118 1 0 6 0
                                    1 0 0 28 1 1 0 28 7 1 1 0 28 6 1 2 3 0 0 0
                                    1 1 3 140 135 1 1 0 0 0 1 0 2 0 1 1 2 28 0
                                    1 1 2 0 0 1 2 2 0 0 15 1 1 3 28 0 1 2 0 0 0
                                    118 1 1 2 118 0 1 1 2 153 0 1 2 0 28 0 0 1
                                    1 0 28 0 1 0 0 15 1 1 0 31 31 86 1 0 12 0 1
                                    1 15 130 127 1 1 2 88 0 1 2 3 134 135 0 1 1
                                    3 8 0 1 1 6 118 0 1 1 0 8 0 1 1 0 88 0 1 2
                                    0 0 0 118 1 2 0 0 0 15 1 2 3 142 0 0 1 2 3
                                    0 0 0 1 1 3 0 135 1 1 0 116 0 1 1 0 63 15
                                    65 0 0 21 42 0 0 21 35 1 3 0 0 1 2 0 0 108
                                    7 110 0 0 21 36 0 0 21 34 1 0 104 102 107 1
                                    0 50 0 53 0 0 31 33 0 0 31 32 1 0 28 0 1 1
                                    0 28 0 1 2 0 28 0 7 1 2 0 28 0 6 1 0 2 0 1
                                    1 6 0 118 1 0 0 123 1 2 7 155 155 0 1 1 7
                                    154 0 1 0 0 15 1 0 0 0 1 2 3 141 141 141 1
                                    1 3 0 135 1 2 3 0 0 0 1 0 2 147 1 1 2 149
                                    141 1 1 2 149 141 1 1 3 133 0 1 3 3 137 0 0
                                    0 1 2 3 138 0 0 1 2 3 88 0 0 1 2 3 134 135
                                    0 1 1 3 15 0 1 0 6 135 1 3 0 6 0 6 6 1 0 0
                                    123 1 2 3 139 0 0 1 1 0 12 31 1 0 0 12 30 1
                                    2 15 0 1 2 2 152 0 0 1 2 0 0 0 102 103 2 12
                                    0 0 126 1 2 12 0 0 127 1 3 12 0 0 127 15 1
                                    3 12 0 0 126 128 1 1 8 0 0 1 2 8 0 0 15 1 3
                                    3 0 0 68 15 1 2 3 0 0 68 1 2 3 21 31 68 1 0
                                    0 8 41 0 2 0 1 2 0 45 0 31 1 2 0 21 31 31 1
                                    1 0 45 0 48 1 0 21 31 87 1 0 0 45 1 1 0 45
                                    0 1 1 0 8 0 1 1 0 0 8 1 1 6 144 0 1 1 17
                                    125 120 1 1 0 31 31 1 2 0 0 0 0 1 1 0 117 0
                                    1 1 0 0 43 1 1 0 0 12 1 1 0 0 0 1 1 14 0
                                    129 1 1 5 88 0 1 1 2 0 0 1 1 0 8 0 1 0 0 15
                                    1 0 0 28 29 1 0 28 7 115 1 0 28 6 40 0 0 31
                                    79 3 0 0 0 0 0 1 2 3 28 0 0 1 2 0 0 0 0 1 2
                                    0 28 0 0 1 2 0 124 0 102 1 0 0 28 1 2 0 0 0
                                    118 1 2 0 0 0 15 1 2 3 0 0 43 1 0 0 0 1 0 0
                                    0 19 2 12 0 0 127 1 2 12 0 0 126 1 3 12 0 0
                                    126 128 1 3 12 0 0 127 15 1 1 8 0 0 1 2 8 0
                                    0 15 1 3 3 0 0 68 15 1 2 3 0 0 68 1 2 0 28
                                    0 0 1 2 3 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 118 0 1 2 0 0 0 0 1 2 0 0 43
                                    0 1 2 0 0 15 0 1 2 0 0 0 12 1 2 0 0 12 0 1
                                    2 3 0 0 129 1 2 3 0 129 0 1 2 11 0 0 43
                                    1)))))
           '|lookupComplete|)) 
