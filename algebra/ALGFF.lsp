
(SDEFUN |ALGFF;branchPointAtInfinity?;B;1| (($ |Boolean|))
        (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
             (EXIT (QREFELT $ 11)))) 

(SDEFUN |ALGFF;discriminant;F;2| (($ |Fraction| UP))
        (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
             (EXIT (QREFELT $ 14)))) 

(SDEFUN |ALGFF;integralBasis;V;3| (($ |Vector| $))
        (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
             (EXIT (|ALGFF;vect| (QREFELT $ 23) $)))) 

(SDEFUN |ALGFF;integralBasisAtInfinity;V;4| (($ |Vector| $))
        (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
             (EXIT (|ALGFF;vect| (QREFELT $ 26) $)))) 

(SDEFUN |ALGFF;integralMatrix;M;5| (($ |Matrix| (|Fraction| UP)))
        (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
             (EXIT (QREFELT $ 23)))) 

(SDEFUN |ALGFF;inverseIntegralMatrix;M;6| (($ |Matrix| (|Fraction| UP)))
        (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
             (EXIT (QREFELT $ 25)))) 

(SDEFUN |ALGFF;integralMatrixAtInfinity;M;7| (($ |Matrix| (|Fraction| UP)))
        (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
             (EXIT (QREFELT $ 26)))) 

(SDEFUN |ALGFF;branchPoint?;FB;8| ((|a| F) ($ |Boolean|))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 30)) (QREFELT $ 37)) |a|
                   (QREFELT $ 38))
         (QREFELT $ 39))) 

(SDEFUN |ALGFF;definingPolynomial;UPUP;9| (($ UPUP)) (QREFELT $ 9)) 

(SDEFUN |ALGFF;inverseIntegralMatrixAtInfinity;M;10|
        (($ |Matrix| (|Fraction| UP)))
        (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
             (EXIT (QREFELT $ 27)))) 

(SDEFUN |ALGFF;vect| ((|m| |Matrix| (|Fraction| UP)) ($ |Vector| $))
        (SPROG ((#1=#:G403 NIL) (#2=#:G405 NIL) (|i| NIL) (#3=#:G404 NIL))
               (SEQ
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI|
                         (- #4=(SPADCALL |m| (QREFELT $ 44))
                            #5=(PROGN |m| 1)))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (SPADCALL |m| |i| (QREFELT $ 46))
                                          (QREFELT $ 47)))))
                      (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |ALGFF;integralCoordinates;$R;12|
        ((|f| $) ($ |Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
        (SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT $ 48)) (SPADCALL (QREFELT $ 35))
                   (QREFELT $ 49))
         (QREFELT $ 52))) 

(SDEFUN |ALGFF;knownInfBasis;NniV;13| ((|d| |NonNegativeInteger|) ($ |Void|))
        (SPROG
         ((#1=#:G422 NIL) (|j| NIL) (#2=#:G421 NIL) (|i| NIL)
          (|invib| #3=(|Matrix| (|Fraction| UP))) (|ib| #3#) (#4=#:G418 NIL)
          (#5=#:G420 NIL) (#6=#:G419 NIL) (|alpha| (|Vector| (|Fraction| UP)))
          (#7=#:G417 NIL) (#8=#:G416 NIL))
         (SEQ
          (COND
           ((QREFELT $ 10)
            (SEQ
             (LETT |alpha|
                   (PROGN
                    (LETT #8# (GETREFV (|inc_SI| #9=(QREFELT $ 20))))
                    (SEQ (LETT |i| 0) (LETT #7# #9#) G190
                         (COND ((|greater_SI| |i| #7#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT #8# |i|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 54) (* |d| |i|)
                                              (QREFELT $ 55))
                                    (QREFELT $ 56)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    #8#))
             (LETT |ib|
                   (SPADCALL
                    (PROGN
                     (LETT #6#
                           (GETREFV
                            (|inc_SI|
                             (- #10=(QVSIZE |alpha|)
                                #11=(SPADCALL |alpha| (QREFELT $ 57))))))
                     (SEQ (LETT |i| #11#) (LETT #5# #10#) (LETT #4# 0) G190
                          (COND ((> |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #6# #4#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT $ 58)))))
                          (LETT #4#
                                (PROG1 (|inc_SI| #4#) (LETT |i| (+ |i| 1))))
                          (GO G190) G191 (EXIT NIL))
                     #6#)
                    (QREFELT $ 59)))
             (LETT |invib| (SPADCALL |alpha| (QREFELT $ 59)))
             (EXIT
              (SEQ (LETT |i| (PROGN |ib| 1))
                   (LETT #2# (SPADCALL |ib| (QREFELT $ 44))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN |ib| 1))
                          (LETT #1# (SPADCALL |ib| (QREFELT $ 60))) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 26) |i| |j|
                                     (QAREF2O |ib| |i| |j| 1 1) (QREFELT $ 61))
                           (EXIT
                            (SPADCALL (QREFELT $ 27) |i| |j|
                                      (SPADCALL |invib| |i| |j| (QREFELT $ 62))
                                      (QREFELT $ 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))))
          (EXIT (SPADCALL (QREFELT $ 64)))))) 

(SDEFUN |ALGFF;getInfBasis| (($ |Void|))
        (SPROG
         ((#1=#:G445 NIL) (|j| NIL) (#2=#:G444 NIL) (|i| NIL)
          (|invib2| #3=(|Matrix| (|Fraction| UP))) (|ib2| #3#) (#4=#:G443 NIL)
          (#5=#:G442 NIL)
          (|invib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|invalpha| (|Vector| (|Fraction| UP))) (#6=#:G439 NIL)
          (#7=#:G441 NIL) (#8=#:G440 NIL) (|alpha| (|Vector| (|Fraction| UP)))
          (#9=#:G438 NIL) (#10=#:G437 NIL)
          (|ninvmod| (|SparseUnivariatePolynomial| UP))
          (|r| (|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
          (|invmod| (UPUP)) (|x| (|Fraction| UP)))
         (SEQ
          (LETT |x|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 54) 1 (QREFELT $ 55))
                           (QREFELT $ 56))
                 (QREFELT $ 58)))
          (LETT |invmod|
                (SPADCALL (CONS #'|ALGFF;getInfBasis!0| (VECTOR $ |x|))
                          (QREFELT $ 9) (QREFELT $ 69)))
          (LETT |r| (SPADCALL |invmod| (QREFELT $ 72)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 16)) (QREFELT $ 17)
                       (QREFELT $ 73))
             (|error| "Should not happen"))
            ('T
             (SEQ
              (LETT |ninvmod| (SPADCALL (ELT $ 37) (QCDR |r|) (QREFELT $ 77)))
              (LETT |alpha|
                    (PROGN
                     (LETT #10# (GETREFV (|inc_SI| #11=(QREFELT $ 20))))
                     (SEQ (LETT |i| 0) (LETT #9# #11#) G190
                          (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #10# |i|
                                    (SPADCALL
                                     (SPADCALL (QCAR |r|) |i| (QREFELT $ 78))
                                     |x| (QREFELT $ 67)))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                     #10#))
              (LETT |invalpha|
                    (PROGN
                     (LETT #8#
                           (GETREFV
                            (|inc_SI|
                             (- #12=(QVSIZE |alpha|)
                                #13=(SPADCALL |alpha| (QREFELT $ 57))))))
                     (SEQ (LETT |i| #13#) (LETT #7# #12#) (LETT #6# 0) G190
                          (COND ((> |i| #7#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #8# #6#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT $ 58)))))
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
                                                                (ELT $ 7))))
                                                   (LIST '|:| '|basisDen|
                                                         (|devaluate|
                                                          (ELT $ 7)))
                                                   (LIST '|:| '|basisInv|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7))))))
                                            (|FunctionFieldIntegralBasis|
                                             (ELT $ 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT $ 7))
                                             (|SimpleAlgebraicExtension|
                                              (ELT $ 7)
                                              (|SparseUnivariatePolynomial|
                                               (ELT $ 7))
                                              |ninvmod|)))))
              (SEQ (LETT |i| (PROGN (QREFELT $ 23) 1))
                   (LETT #5# (SPADCALL (QREFELT $ 23) (QREFELT $ 44))) G190
                   (COND ((> |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT $ 23) 1))
                          (LETT #4# (SPADCALL (QREFELT $ 23) (QREFELT $ 60)))
                          G190 (COND ((> |j| #4#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 26) |i| |j|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QVELT |invib| 0) |i| |j|
                                                 (QREFELT $ 81))
                                       (QVELT |invib| 1) (QREFELT $ 82))
                                      |x| (QREFELT $ 67))
                                     (QREFELT $ 61))
                           (EXIT
                            (SPADCALL (QREFELT $ 27) |i| |j|
                                      (SPADCALL
                                       (SPADCALL (QVELT |invib| 2) |i| |j|
                                                 (QREFELT $ 81))
                                       |x| (QREFELT $ 83))
                                      (QREFELT $ 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |ib2|
                    (SPADCALL (QREFELT $ 26) (SPADCALL |alpha| (QREFELT $ 59))
                              (QREFELT $ 84)))
              (LETT |invib2|
                    (SPADCALL (SPADCALL |invalpha| (QREFELT $ 59))
                              (QREFELT $ 27) (QREFELT $ 84)))
              (SEQ (LETT |i| (PROGN |ib2| 1))
                   (LETT #2# (SPADCALL |ib2| (QREFELT $ 44))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT $ 23) 1))
                          (LETT #1# (SPADCALL (QREFELT $ 23) (QREFELT $ 60)))
                          G190 (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 26) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT $ 61))
                           (EXIT
                            (SPADCALL (QREFELT $ 27) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT $ 62))
                                      (QREFELT $ 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT $ 64)))))))))) 

(SDEFUN |ALGFF;getInfBasis!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 67)))))) 

(SDEFUN |ALGFF;startUp| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((|dsc| (|Fraction| UP)) (|dsc0| (|Fraction| UP)) (#1=#:G464 NIL)
          (|j| NIL) (#2=#:G463 NIL) (|i| NIL)
          (|invib2| (|Matrix| (|Fraction| UP))) (#3=#:G453 NIL)
          (|ib2| (|Matrix| (|Fraction| UP))) (#4=#:G462 NIL) (#5=#:G461 NIL)
          (|ib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|nmod| (|SparseUnivariatePolynomial| UP)))
         (SEQ (SETELT $ 10 |b|)
              (LETT |nmod| (SPADCALL (ELT $ 37) (QREFELT $ 9) (QREFELT $ 77)))
              (LETT |ib|
                    (SPADCALL
                     (|compiledLookupCheck| '|integralBasis|
                                            (LIST
                                             (LIST '|Record|
                                                   (LIST '|:| '|basis|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7))))
                                                   (LIST '|:| '|basisDen|
                                                         (|devaluate|
                                                          (ELT $ 7)))
                                                   (LIST '|:| '|basisInv|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7))))))
                                            (|FunctionFieldIntegralBasis|
                                             (ELT $ 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT $ 7))
                                             (|SimpleAlgebraicExtension|
                                              (ELT $ 7)
                                              (|SparseUnivariatePolynomial|
                                               (ELT $ 7))
                                              |nmod|)))))
              (SEQ (LETT |i| (PROGN (QREFELT $ 23) 1))
                   (LETT #5# (SPADCALL (QREFELT $ 23) (QREFELT $ 44))) G190
                   (COND ((> |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT $ 23) 1))
                          (LETT #4# (SPADCALL (QREFELT $ 23) (QREFELT $ 60)))
                          G190 (COND ((> |j| #4#) (GO G191)))
                          (SEQ
                           (QSETAREF2O (QREFELT $ 23) |i| |j|
                                       (SPADCALL
                                        (SPADCALL (QVELT |ib| 0) |i| |j|
                                                  (QREFELT $ 81))
                                        (QVELT |ib| 1) (QREFELT $ 82))
                                       1 1)
                           (EXIT
                            (SPADCALL (QREFELT $ 25) |i| |j|
                                      (SPADCALL
                                       (SPADCALL (QVELT |ib| 2) |i| |j|
                                                 (QREFELT $ 81))
                                       (QREFELT $ 56))
                                      (QREFELT $ 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL
                 (SPADCALL (QREFELT $ 26) (PROGN (QREFELT $ 26) 1)
                           (PROGN (QREFELT $ 26) 1) (QREFELT $ 62))
                 (QREFELT $ 85))
                (|ALGFF;getInfBasis| $)))
              (LETT |ib2|
                    (SPADCALL
                     (SPADCALL (|ALGFF;vect| (QREFELT $ 23) $) (QREFELT $ 86))
                     (QREFELT $ 87)))
              (LETT |invib2|
                    (PROG2 (LETT #3# (SPADCALL |ib2| (QREFELT $ 89)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|Matrix| (|Fraction| (QREFELT $ 7)))
                                      (|Union|
                                       (|Matrix| (|Fraction| (QREFELT $ 7)))
                                       "failed")
                                      #3#)))
              (SEQ (LETT |i| (PROGN |ib2| 1))
                   (LETT #2# (SPADCALL |ib2| (QREFELT $ 44))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN |ib2| 1))
                          (LETT #1# (SPADCALL |ib2| (QREFELT $ 60))) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 23) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT $ 61))
                           (EXIT
                            (SPADCALL (QREFELT $ 25) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT $ 62))
                                      (QREFELT $ 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |dsc|
                    (SPADCALL (QREFELT $ 9)
                              (SPADCALL (QREFELT $ 9) (QREFELT $ 90))
                              (QREFELT $ 91)))
              (LETT |dsc0|
                    (SPADCALL |dsc|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 26) (QREFELT $ 92)) 2
                               (QREFELT $ 78))
                              (QREFELT $ 93)))
              (EXIT
               (COND
                ((> (SPADCALL (SPADCALL |dsc0| (QREFELT $ 94)) (QREFELT $ 95))
                    (SPADCALL (SPADCALL |dsc0| (QREFELT $ 96)) (QREFELT $ 95)))
                 (|error| "Shouldn't happen"))
                ('T
                 (SEQ
                  (SETELT $ 11
                          (<
                           (SPADCALL (SPADCALL |dsc0| (QREFELT $ 94))
                                     (QREFELT $ 95))
                           (SPADCALL (SPADCALL |dsc0| (QREFELT $ 96))
                                     (QREFELT $ 95))))
                  (LETT |dsc|
                        (SPADCALL |dsc|
                                  (SPADCALL
                                   (SPADCALL (QREFELT $ 23) (QREFELT $ 92)) 2
                                   (QREFELT $ 78))
                                  (QREFELT $ 93)))
                  (SETELT $ 14
                          (SPADCALL
                           (SPADCALL (SPADCALL |dsc| (QREFELT $ 94))
                                     (QREFELT $ 97))
                           (SPADCALL |dsc| (QREFELT $ 96)) (QREFELT $ 82)))
                  (EXIT (SPADCALL (QREFELT $ 64)))))))))) 

(SDEFUN |ALGFF;integralDerivationMatrix;MR;16|
        ((|d| |Mapping| UP UP)
         ($ |Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
        (SPROG
         ((#1=#:G477 NIL) (#2=#:G479 NIL) (|i| NIL) (#3=#:G478 NIL)
          (|w| (|Vector| $)))
         (SEQ (LETT |w| (SPADCALL (QREFELT $ 32)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3#
                         (GETREFV
                          (|inc_SI|
                           (- #4=(SPADCALL |w| (QREFELT $ 100))
                              #5=(SPADCALL |w| (QREFELT $ 99))))))
                   (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                        (COND ((> |i| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #3# #1#
                                  (SPADCALL (SPADCALL |w| |i| (QREFELT $ 101))
                                            |d| (QREFELT $ 103)))))
                        (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                        (GO G190) G191 (EXIT NIL))
                   #3#)
                  (QREFELT $ 87))
                 (SPADCALL (QREFELT $ 35)) (QREFELT $ 84))
                (QREFELT $ 106)))))) 

(SDEFUN |ALGFF;integralRepresents;VUP$;17| ((|v| |Vector| UP) (|d| UP) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |v| |d| (QREFELT $ 109)) (QREFELT $ 48))
                   (SPADCALL (QREFELT $ 34)) (QREFELT $ 49))
         (QREFELT $ 47))) 

(SDEFUN |ALGFF;branchPoint?;UPB;18| ((|p| UP) ($ |Boolean|))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ (COND ((QREFELT $ 10) (|ALGFF;startUp| NIL $)))
                    (LETT |r| (SPADCALL |p| (QREFELT $ 112)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 40)))
                      ('T
                       (NULL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT $ 30)) (QREFELT $ 37))
                          |p| (QREFELT $ 113))
                         (QREFELT $ 114))))))))) 

(DECLAIM (NOTINLINE |AlgebraicFunctionField;|)) 

(DEFUN |AlgebraicFunctionField| (&REST #1=#:G532)
  (SPROG NIL
         (PROG (#2=#:G533)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicFunctionField|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicFunctionField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicFunctionField|)))))))))) 

(DEFUN |AlgebraicFunctionField;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G382 NIL) (|pv$| NIL) (#2=#:G530 NIL) (#3=#:G531 NIL) ($ NIL)
    (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|AlgebraicFunctionField| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 159))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| $ '(|CharacteristicNonZero|))
         (|HasCategory| (|Fraction| |#2|) '(|FiniteFieldCategory|))
         (|augmentPredVector| $ 32768))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 'T)
    (QSETREFV $ 11 'T)
    (QSETREFV $ 14 (|spadConstant| $ 13))
    (QSETREFV $ 17 (SPADCALL |#4| (QREFELT $ 16)))
    (QSETREFV $ 20
              (PROG1 (LETT #1# (- (QREFELT $ 17) 1))
                (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #1#)))
    (QSETREFV $ 23 (SPADCALL (QREFELT $ 17) (QREFELT $ 17) (QREFELT $ 22)))
    (QSETREFV $ 25 (SPADCALL (QREFELT $ 23) (QREFELT $ 24)))
    (QSETREFV $ 26 (SPADCALL (QREFELT $ 23) (QREFELT $ 24)))
    (QSETREFV $ 27 (SPADCALL (QREFELT $ 23) (QREFELT $ 24)))
    $))) 

(MAKEPROP '|AlgebraicFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SimpleAlgebraicExtension| 12 8 (NRTEVAL (QREFELT $ 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|brandNew?| '|infBr?| (|Fraction| 7) (0 . |Zero|) '|discPoly|
              (|NonNegativeInteger|) (4 . |degree|) '|n| (9 . |One|)
              (13 . |One|) '|n1| (|Matrix| 12) (17 . |zero|) '|ibasis|
              (23 . |copy|) '|invibasis| '|infbasis| '|invinfbasis| (|Boolean|)
              |ALGFF;branchPointAtInfinity?;B;1| |ALGFF;discriminant;F;2|
              (|Vector| $) |ALGFF;integralBasis;V;3|
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
              |ALGFF;integralCoordinates;$R;12| (76 . |One|) (80 . |monomial|)
              (86 . |coerce|) (91 . |minIndex|) (96 . |inv|)
              (101 . |diagonalMatrix|) (106 . |maxColIndex|) (111 . |setelt!|)
              (119 . |elt|) (|Void|) (126 . |void|)
              |ALGFF;knownInfBasis;NniV;13| (|Fraction| $) (130 . |elt|)
              (|Mapping| 12 12) (136 . |map|)
              (|Record| (|:| |coef| 12) (|:| |poly| 8))
              (|ChangeOfVariable| 6 7 8) (142 . |mkIntegral|) (147 . ~=)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 8 7 74)
              (153 . |map|) (159 . ^) (165 . |basis|) (|Matrix| 7)
              (169 . |elt|) (176 . /) (182 . |elt|) (188 . *) (194 . |zero?|)
              (199 . |normalizeAtInfinity|) (204 . |coordinates|)
              (|Union| $ '"failed") (209 . |inverse|) (214 . |differentiate|)
              (219 . |resultant|) (225 . |determinant|) (230 . *)
              (236 . |numer|) (241 . |degree|) (246 . |denom|)
              (251 . |primitivePart|) (|Vector| $$) (256 . |minIndex|)
              (261 . |maxIndex|) (266 . |elt|) (|Mapping| 7 7)
              (272 . |differentiate|) (|Record| (|:| |num| 80) (|:| |den| 7))
              (|MatrixCommonDenominator| 7 12) (278 . |splitDenominator|)
              |ALGFF;integralDerivationMatrix;MR;16| (|Vector| 7)
              (283 . |represents|) |ALGFF;integralRepresents;VUP$;17|
              (|Union| 6 '#1="failed") (289 . |retractIfCan|) (294 . |gcd|)
              (300 . |ground?|) |ALGFF;branchPoint?;UPB;18| (|List| 118)
              (|List| 15) (|Symbol|) (|Union| 31 '#2="failed") (|Matrix| $)
              (|Fraction| 43)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 124) (|:| |generator| $))
              (|Union| 124 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 129 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|Fraction| 8) (|PositiveInteger|) (|InputForm|)
              (|Union| 15 '"failed") (|OnePointCompletion| 134)
              (|Union| 139 '#2#) (|List| 125) (|Factored| 125)
              (|Record| (|:| |factor| 43) (|:| |exponent| 15)) (|List| 141)
              (|Table| 134 15)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Matrix| 43)
              (|Record| (|:| |mat| 145) (|:| |vec| (|Vector| 43)))
              (|Union| 121 '#1#) (|Union| 43 '#1#) (|List| (|Polynomial| 6))
              (|List| (|List| 6))
              (|Record| (|:| |num| $) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Union| 7 '"failed") (|Record| (|:| |mat| 21) (|:| |vec| 45))
              (|Union| 12 '#1#) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 305 |zero?| 311 |yCoordinates| 316 |unitNormal| 321
              |unitCanonical| 326 |unit?| 331 |traceMatrix| 336 |trace| 345
              |tableForDiscreteLogarithm| 350 |subtractIfCan| 355
              |squareFreePolynomial| 361 |squareFreePart| 366 |squareFree| 371
              |solveLinearPolynomialEquation| 376 |smaller?| 382 |sizeLess?|
              388 |size| 394 |singularAtInfinity?| 398 |singular?| 402 |sample|
              412 |rightRecip| 416 |rightPower| 421 |retractIfCan| 433
              |retract| 448 |represents| 463 |representationType| 480 |rem| 484
              |regularRepresentation| 490 |reducedSystem| 501
              |reduceBasisAtInfinity| 523 |reduce| 528 |recip| 538
              |rationalPoints| 543 |rationalPoint?| 547 |rank| 553 |random| 557
              |ramifiedAtInfinity?| 561 |ramified?| 565 |quo| 575
              |principalIdeal| 581 |primitivePart| 586 |primitiveElement| 591
              |primitive?| 595 |primeFrobenius| 600 |prime?| 611 |order| 616
              |opposite?| 626 |one?| 632 |numberOfComponents| 637
              |normalizeAtInfinity| 641 |norm| 646 |nonSingularModel| 651
              |nextItem| 656 |multiEuclidean| 661 |minimalPolynomial| 667
              |lookup| 672 |lift| 677 |leftRecip| 682 |leftPower| 687 |lcmCoef|
              699 |lcm| 705 |latex| 716 |knownInfBasis| 721
              |inverseIntegralMatrixAtInfinity| 726 |inverseIntegralMatrix| 730
              |inv| 734 |integralRepresents| 739 |integralMatrixAtInfinity| 745
              |integralMatrix| 749 |integralDerivationMatrix| 753
              |integralCoordinates| 758 |integralBasisAtInfinity| 763
              |integralBasis| 767 |integralAtInfinity?| 771 |integral?| 776
              |init| 793 |index| 797 |hyperelliptic| 802 |hashUpdate!| 806
              |hash| 812 |genus| 817 |generator| 821 |gcdPolynomial| 825 |gcd|
              831 |factorsOfCyclicGroupSize| 842 |factorSquareFreePolynomial|
              846 |factorPolynomial| 851 |factor| 856 |extendedEuclidean| 861
              |exquo| 874 |expressIdealMember| 880 |euclideanSize| 886
              |enumerate| 891 |elt| 895 |elliptic| 902 |divide| 906
              |discriminant| 912 |discreteLog| 921 |differentiate| 932
              |derivationCoordinates| 988 |definingPolynomial| 994
              |createPrimitiveElement| 998 |coordinates| 1002 |convert| 1024
              |conditionP| 1049 |complementaryBasis| 1054 |commutator| 1059
              |coerce| 1065 |charthRoot| 1090 |characteristicPolynomial| 1100
              |characteristic| 1105 |branchPointAtInfinity?| 1109
              |branchPoint?| 1113 |basis| 1123 |associator| 1127 |associates?|
              1134 |antiCommutator| 1140 |annihilate?| 1146 |algSplitSimple|
              1152 |absolutelyIrreducible?| 1158 ^ 1162 |Zero| 1180 |One| 1184
              D 1188 = 1238 / 1244 - 1250 + 1261 * 1267)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 2 2 4 4 2 4 4 4 0 4 0 0 0 3 3 3 0 0 0 1 3
                                  3 5 7 12 10 0 0 0 0 0 0 3 0 0 0 0 3 0 0 0 0 0
                                  3 3 0 0 0 0 0 0 0 0 6 0 0 6 2 0 0 0 0 0 0 0 0
                                  0 3 3 3 6 8 9))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| |FramedAlgebra&| NIL
                |FiniteRankAlgebra&| |FullyLinearlyExplicitOver&| NIL NIL
                |DivisionRing&| |DifferentialExtension&| |Algebra&| NIL
                |Algebra&| NIL |EntireRing&| |Algebra&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&|
                |Module&| NIL |Module&| NIL |FramedModule&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Finite&| |Magma&|
                |AbelianSemiGroup&| NIL NIL |FullyRetractableTo&| NIL
                |SetCategory&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8) (|IntegralDomain|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8)
                 (|FullyLinearlyExplicitOver| (|Fraction| 7))
                 (|CommutativeRing|) (|LeftOreRing|) (|DivisionRing|)
                 (|DifferentialExtension| (|Fraction| 7))
                 (|Algebra| (|Fraction| 7))
                 (|LinearlyExplicitOver| (|Fraction| 7)) (|Algebra| $$)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| 121)
                 (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 118) (|LinearlyExplicitOver| 43)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| $$)
                 (|Module| (|Fraction| 7)) (|SemiRng|) (|Module| 121)
                 (|BiModule| $$ $$) (|FramedModule| (|Fraction| 7))
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|NonAssociativeRing|) (|BiModule| 121 121) (|LeftModule| $$)
                 (|RightModule| (|Fraction| 7)) (|LeftModule| (|Fraction| 7))
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| 121)
                 (|RightModule| 121) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|CommutativeStar|)
                 (|SetCategory|) (|RetractableTo| (|Fraction| 7))
                 (|ConvertibleTo| 8) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 158) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|ConvertibleTo| 135) (|RetractableTo| 121)
                 (|RetractableTo| 43))
              (|makeByteWordVec2| 158
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
                                    28 0 0 1 1 0 28 0 1 1 0 50 0 1 1 3 122 0 1
                                    1 3 0 0 1 1 3 28 0 1 0 0 21 1 1 0 21 31 1 1
                                    0 12 0 1 1 2 143 43 1 2 0 88 0 0 1 1 2 140
                                    125 1 1 3 0 0 1 1 3 132 0 1 2 2 138 139 125
                                    1 2 6 28 0 0 1 2 3 28 0 0 1 0 6 15 1 0 0 28
                                    1 1 0 28 7 1 1 0 28 6 1 0 0 0 1 1 0 88 0 1
                                    2 0 0 0 15 1 2 0 0 0 134 1 1 8 147 0 1 1 9
                                    148 0 1 1 0 154 0 1 1 8 121 0 1 1 9 43 0 1
                                    1 0 12 0 1 2 0 0 108 7 109 1 0 0 45 47 2 0
                                    0 45 31 1 0 2 144 1 2 3 0 0 0 1 1 0 21 0 1
                                    2 0 21 0 31 1 1 10 145 120 1 2 10 146 120
                                    31 1 1 0 21 120 1 2 0 153 120 31 1 1 0 31
                                    31 1 1 3 88 133 1 1 0 0 8 1 1 0 88 0 1 0 15
                                    150 1 2 0 28 6 6 1 0 0 134 1 0 6 0 1 0 0 28
                                    1 1 0 28 7 1 1 0 28 6 1 2 3 0 0 0 1 1 3 126
                                    124 1 1 0 0 0 1 0 2 0 1 1 2 28 0 1 1 2 0 0
                                    1 2 2 0 0 15 1 1 3 28 0 1 1 2 137 0 1 1 2
                                    134 0 1 2 0 28 0 0 1 1 0 28 0 1 0 0 15 1 1
                                    0 31 31 86 1 0 12 0 1 1 14 149 118 1 1 2 88
                                    0 1 2 3 127 124 0 1 1 3 8 0 1 1 6 134 0 1 1
                                    0 8 0 1 1 0 88 0 1 2 0 0 0 15 1 2 0 0 0 134
                                    1 2 3 123 0 0 1 2 3 0 0 0 1 1 3 0 124 1 1 0
                                    155 0 1 1 0 63 15 65 0 0 21 42 0 0 21 35 1
                                    3 0 0 1 2 0 0 108 7 110 0 0 21 36 0 0 21 34
                                    1 0 104 102 107 1 0 50 0 53 0 0 31 33 0 0
                                    31 32 1 0 28 0 1 2 0 28 0 6 1 2 0 28 0 7 1
                                    1 0 28 0 1 0 2 0 1 1 6 0 134 1 0 0 152 1 2
                                    0 157 157 0 1 1 0 156 0 1 0 0 15 1 0 0 0 1
                                    2 3 125 125 125 1 1 3 0 124 1 2 3 0 0 0 1 0
                                    2 142 1 1 2 140 125 1 1 2 140 125 1 1 3 132
                                    0 1 3 3 130 0 0 0 1 2 3 131 0 0 1 2 3 88 0
                                    0 1 2 3 127 124 0 1 1 3 15 0 1 0 6 124 1 3
                                    0 6 0 6 6 1 0 0 152 1 2 3 128 0 0 1 0 0 12
                                    30 1 0 12 31 1 2 2 136 0 0 1 1 2 15 0 1 3
                                    11 0 0 118 15 1 3 11 0 0 116 117 1 2 11 0 0
                                    116 1 2 11 0 0 118 1 2 7 0 0 15 1 1 7 0 0 1
                                    2 3 0 0 68 1 3 3 0 0 68 15 1 2 0 0 0 102
                                    103 2 3 21 31 68 1 0 0 8 41 0 2 0 1 1 0 45
                                    0 48 1 0 21 31 87 2 0 45 0 31 1 2 0 21 31
                                    31 1 1 6 135 0 1 1 0 0 8 1 1 0 8 0 1 1 0 45
                                    0 1 1 0 0 45 1 1 16 119 120 1 1 0 31 31 1 2
                                    0 0 0 0 1 1 13 0 121 1 1 0 0 0 1 1 0 0 12 1
                                    1 0 0 43 1 1 0 158 0 1 1 5 88 0 1 1 2 0 0 1
                                    1 0 8 0 1 0 0 15 1 0 0 28 29 1 0 28 7 115 1
                                    0 28 6 40 0 0 31 79 3 0 0 0 0 0 1 2 3 28 0
                                    0 1 2 0 0 0 0 1 2 0 28 0 0 1 2 0 151 0 102
                                    1 0 0 28 1 2 3 0 0 43 1 2 0 0 0 15 1 2 0 0
                                    0 134 1 0 0 0 1 0 0 0 19 3 11 0 0 116 117 1
                                    2 11 0 0 116 1 3 11 0 0 118 15 1 2 11 0 0
                                    118 1 2 7 0 0 15 1 1 7 0 0 1 3 3 0 0 68 15
                                    1 2 3 0 0 68 1 2 0 28 0 0 1 2 3 0 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 3 0 121 0 1
                                    2 3 0 0 121 1 2 0 0 12 0 1 2 0 0 0 12 1 2 0
                                    0 15 0 1 2 0 0 43 0 1 2 0 0 0 0 1 2 0 0 134
                                    0 1)))))
           '|lookupComplete|)) 
