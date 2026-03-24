
(SDEFUN |FRAC;coerce;S%;1| ((|d| (S)) (% (%))) (CONS |d| (|spadConstant| % 9))) 

(SDEFUN |FRAC;zero?;%B;2| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (QCAR |x|) (QREFELT % 12))) 

(SDEFUN |FRAC;factorFraction;%F;3| ((|p| (%)) (% (|Fraction| (|Factored| S))))
        (SPADCALL (SPADCALL (QCAR |p|) (QREFELT % 15))
                  (SPADCALL (QCDR |p|) (QREFELT % 15)) (QREFELT % 18))) 

(SDEFUN |FRAC;=;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 20))
          (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 20)))
         ('T NIL))) 

(SDEFUN |FRAC;hashUpdate!;Hs%Hs;5| ((|s| #1=(|HashState|)) (|x| (%)) (% #1#))
        (SEQ (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT % 23)))
             (EXIT (SPADCALL |s| (QCDR |x|) (QREFELT % 23))))) 

(SDEFUN |FRAC;one?;%B;6| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QCAR |x|) (|spadConstant| % 9) (QREFELT % 20))
          (SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)))
         ('T NIL))) 

(SDEFUN |FRAC;retract;%S;7| ((|x| (%)) (% (S)))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) (QCAR |x|))
         ('T (|error| "Denominator not equal to 1")))) 

(SDEFUN |FRAC;retractIfCan;%U;8| ((|x| (%)) (% (|Union| S "failed")))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20))
          (CONS 0 (QCAR |x|)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |FRAC;retract;%S;9| ((|x| (%)) (% (S)))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 30)))
                    (EXIT
                     (COND
                      ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                      ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;%U;10| ((|x| (%)) (% (|Union| S "failed")))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 30))) 

(SDEFUN |FRAC;retract;%S;11| ((|x| (%)) (% (S)))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 30)))
                    (EXIT
                     (COND
                      ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                      ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;%U;12| ((|x| (%)) (% (|Union| S "failed")))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 30))) 

(SDEFUN |FRAC;wholePart;%S;13| ((|x| (%)) (% (S)))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) (QCAR |x|))
         ('T (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 31))))) 

(SDEFUN |FRAC;floor;%S;14| ((|x| (%)) (% (S)))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| % 33) (QREFELT % 35))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 36)) (QREFELT % 37))
                    (QREFELT % 38)))
         ('T (SPADCALL |x| (QREFELT % 32))))) 

(SDEFUN |FRAC;ceiling;%S;15| ((|x| (%)) (% (S)))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| % 33) (QREFELT % 35))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 36)) (QREFELT % 39))
                    (QREFELT % 38)))
         ('T
          (SPADCALL (|spadConstant| % 9) (SPADCALL |x| (QREFELT % 32))
                    (QREFELT % 40))))) 

(SDEFUN |FRAC;writeOMFrac| ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (SEQ (SPADCALL |dev| (QREFELT % 43))
             (SPADCALL |dev| "nums1" "rational" (QREFELT % 45))
             (SPADCALL |dev| (QCAR |x|) NIL (QREFELT % 46))
             (SPADCALL |dev| (QCDR |x|) NIL (QREFELT % 46))
             (EXIT (SPADCALL |dev| (QREFELT % 47))))) 

(SDEFUN |FRAC;OMwrite;Omd%BV;17|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 48))))
             (|FRAC;writeOMFrac| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 49))))))) 

(SDEFUN |FRAC;normalize| ((|x| (%)) (% (%)))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| S) (|:| |canonical| S) (|:| |associate| S))))
         (SEQ
          (COND ((SPADCALL (QCAR |x|) (QREFELT % 12)) (|spadConstant| % 33))
                ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) |x|)
                (#1='T
                 (SEQ (LETT |uca| (SPADCALL (QCDR |x|) (QREFELT % 52)))
                      (EXIT
                       (COND
                        ((SPADCALL
                          (PROGN (RPLACD |x| (QVELT |uca| 1)) (QCDR |x|))
                          (QREFELT % 12))
                         (|error| "division by zero"))
                        (#1#
                         (SEQ
                          (PROGN
                           (RPLACA |x|
                                   (SPADCALL (QCAR |x|) (QVELT |uca| 2)
                                             (QREFELT % 53)))
                           (QCAR |x|))
                          (EXIT |x|))))))))))) 

(SDEFUN |FRAC;recip;%U;19| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((SPADCALL (QCAR |x|) (QREFELT % 12)) (CONS 1 "failed"))
              ('T (CONS 0 (|FRAC;normalize| (CONS (QCDR |x|) (QCAR |x|)) %))))) 

(SDEFUN |FRAC;cancelGcd| ((|x| (%)) (% (S)))
        (SPROG ((|xd| #1=(|Union| S "failed")) (|xn| #1#) (|d| (S)))
               (SEQ
                (COND
                 ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20))
                  (QCDR |x|))
                 (#2='T
                  (SEQ
                   (LETT |d| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 55)))
                   (EXIT
                    (COND ((SPADCALL |d| (QREFELT % 56)) |d|)
                          (#2#
                           (SEQ
                            (LETT |xn|
                                  (SPADCALL (QCAR |x|) |d| (QREFELT % 30)))
                            (EXIT
                             (COND
                              ((QEQCAR |xn| 1)
                               (|error|
                                "gcd not gcd in QF cancelGcd (numerator)"))
                              (#2#
                               (SEQ
                                (LETT |xd|
                                      (SPADCALL (QCDR |x|) |d| (QREFELT % 30)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |xd| 1)
                                   (|error|
                                    "gcd not gcd in QF cancelGcd (denominator)"))
                                  (#2#
                                   (SEQ
                                    (PROGN (RPLACA |x| (QCDR |xn|)) (QCAR |x|))
                                    (PROGN (RPLACD |x| (QCDR |xd|)) (QCDR |x|))
                                    (EXIT |d|))))))))))))))))))) 

(SDEFUN |FRAC;/;2S%;21| ((|nn| (S)) (|dd| (S)) (% (%)))
        (SPROG ((|z| (%)))
               (SEQ
                (COND
                 ((SPADCALL |dd| (QREFELT % 12)) (|error| "division by zero"))
                 ('T
                  (SEQ (|FRAC;cancelGcd| (LETT |z| (CONS |nn| |dd|)) %)
                       (EXIT (|FRAC;normalize| |z| %)))))))) 

(SDEFUN |FRAC;+;3%;22| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|g| (%)) (|d| (S)) (|z| (%)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT % 13)) |x|)
                      ((SPADCALL |x| (QREFELT % 13)) |y|)
                      ('T
                       (SEQ (LETT |z| (CONS (QCDR |x|) (QCDR |y|)))
                            (LETT |d| (|FRAC;cancelGcd| |z| %))
                            (LETT |g|
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (QCDR |z|) (QCAR |x|)
                                              (QREFELT % 53))
                                    (SPADCALL (QCAR |z|) (QCAR |y|)
                                              (QREFELT % 53))
                                    (QREFELT % 40))
                                   |d|))
                            (|FRAC;cancelGcd| |g| %)
                            (PROGN
                             (RPLACD |g|
                                     (SPADCALL
                                      (SPADCALL (QCDR |g|) (QCAR |z|)
                                                (QREFELT % 53))
                                      (QCDR |z|) (QREFELT % 53)))
                             (QCDR |g|))
                            (EXIT (|FRAC;normalize| |g| %)))))))) 

(SDEFUN |FRAC;-;3%;23| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|g| (%)) (|d| (S)) (|z| (%)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT % 13)) |x|)
                      ('T
                       (SEQ (LETT |z| (CONS (QCDR |x|) (QCDR |y|)))
                            (LETT |d| (|FRAC;cancelGcd| |z| %))
                            (LETT |g|
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (QCDR |z|) (QCAR |x|)
                                              (QREFELT % 53))
                                    (SPADCALL (QCAR |z|) (QCAR |y|)
                                              (QREFELT % 53))
                                    (QREFELT % 59))
                                   |d|))
                            (|FRAC;cancelGcd| |g| %)
                            (PROGN
                             (RPLACD |g|
                                     (SPADCALL
                                      (SPADCALL (QCDR |g|) (QCAR |z|)
                                                (QREFELT % 53))
                                      (QCDR |z|) (QREFELT % 53)))
                             (QCDR |g|))
                            (EXIT (|FRAC;normalize| |g| %)))))))) 

(SDEFUN |FRAC;*;3%;24| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|#G37| (%)) (|#G36| (%)))
               (SEQ
                (COND
                 ((OR (SPADCALL |x| (QREFELT % 13))
                      (SPADCALL |y| (QREFELT % 13)))
                  (|spadConstant| % 33))
                 ('T
                  (COND
                   ((SPADCALL |x| (|spadConstant| % 8) (QREFELT % 21)) |y|)
                   ((SPADCALL |y| (|spadConstant| % 8) (QREFELT % 21)) |x|)
                   ('T
                    (SEQ
                     (PROGN
                      (LETT |#G36| (CONS (QCAR |x|) (QCDR |y|)))
                      (LETT |#G37| (CONS (QCAR |y|) (QCDR |x|)))
                      (LETT |x| |#G36|)
                      (LETT |y| |#G37|))
                     (|FRAC;cancelGcd| |x| %) (|FRAC;cancelGcd| |y| %)
                     (EXIT
                      (|FRAC;normalize|
                       (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 53))
                             (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 53)))
                       %)))))))))) 

(SDEFUN |FRAC;*;I2%;25| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPROG ((|y| (%)))
               (SEQ (LETT |y| (CONS (SPADCALL |n| (QREFELT % 63)) (QCDR |x|)))
                    (|FRAC;cancelGcd| |y| %)
                    (EXIT
                     (|FRAC;normalize|
                      (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 53))
                            (QCDR |y|))
                      %))))) 

(SDEFUN |FRAC;*;S2%;26| ((|nn| (S)) (|x| (%)) (% (%)))
        (SPROG ((|y| (%)))
               (SEQ (LETT |y| (CONS |nn| (QCDR |x|))) (|FRAC;cancelGcd| |y| %)
                    (EXIT
                     (|FRAC;normalize|
                      (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 53))
                            (QCDR |y|))
                      %))))) 

(SDEFUN |FRAC;differentiate;%M%;27|
        ((|x| (%)) (|deriv| (|Mapping| S S)) (% (%)))
        (SPROG ((|d| (S)) (|#G45| (S)) (|#G44| (S)) (|y| (%)))
               (SEQ (LETT |y| (CONS (SPADCALL (QCDR |x|) |deriv|) (QCDR |x|)))
                    (LETT |d| (|FRAC;cancelGcd| |y| %))
                    (PROGN
                     (RPLACA |y|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |x|) |deriv|)
                                        (QCDR |y|) (QREFELT % 53))
                              (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 53))
                              (QREFELT % 59)))
                     (QCAR |y|))
                    (PROGN
                     (LETT |#G44| (QCDR |y|))
                     (LETT |#G45| |d|)
                     (LETT |d| |#G44|)
                     (PROGN (RPLACD |y| |#G45|) (QCDR |y|)))
                    (|FRAC;cancelGcd| |y| %)
                    (PROGN
                     (RPLACD |y|
                             (SPADCALL (SPADCALL (QCDR |y|) |d| (QREFELT % 53))
                                       |d| (QREFELT % 53)))
                     (QCDR |y|))
                    (EXIT (|FRAC;normalize| |y| %))))) 

(SDEFUN |FRAC;/;2S%;28| ((|nn| (S)) (|dd| (S)) (% (%)))
        (COND ((SPADCALL |dd| (QREFELT % 12)) (|error| "division by zero"))
              ('T (CONS |nn| |dd|)))) 

(SDEFUN |FRAC;recip;%U;29| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((SPADCALL (QCAR |x|) (QREFELT % 12)) (CONS 1 "failed"))
              ('T (CONS 0 (CONS (QCDR |x|) (QCAR |x|)))))) 

(SDEFUN |FRAC;retract;%F;30| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 69))) 

(SDEFUN |FRAC;retractIfCan;%U;31|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPROG ((|u| (|Union| S "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 28)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |u|) (QREFELT % 72)))))))) 

(SDEFUN |FRAC;retract;%F;32| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 74)) (QREFELT % 75))
                  (SPADCALL (SPADCALL |x| (QREFELT % 76)) (QREFELT % 75))
                  (QREFELT % 77))) 

(SDEFUN |FRAC;retractIfCan;%U;33|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPROG ((|d| #1=(|Union| (|Integer|) "failed")) (|n| #1#))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |x| (QREFELT % 74)) (QREFELT % 79)))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#2='T
                        (SEQ
                         (LETT |d|
                               (SPADCALL (SPADCALL |x| (QREFELT % 76))
                                         (QREFELT % 79)))
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#2#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT % 77))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (|qq| #1#) (% #1#))
        (SPROG
         ((|lc| (S)) (|g| (|SparseUnivariatePolynomial| S))
          (|qqD| #2=(|SparseUnivariatePolynomial| S)) (|denqq| (S))
          (#3=#:G686 NIL) (#4=#:G685 (S)) (#5=#:G687 (S)) (#6=#:G696 NIL)
          (|u| NIL) (|ppD| #2#) (|denpp| (S)) (#7=#:G682 NIL) (#8=#:G681 (S))
          (#9=#:G683 (S)) (#10=#:G695 NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT % 81)) |qq|)
                ((SPADCALL |qq| (QREFELT % 81)) |pp|)
                ((OR (ZEROP (SPADCALL |pp| (QREFELT % 83)))
                     (ZEROP (SPADCALL |qq| (QREFELT % 83))))
                 (|spadConstant| % 84))
                ('T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #7# NIL)
                         (SEQ (LETT |u| NIL)
                              (LETT #10# (SPADCALL |pp| (QREFELT % 86))) G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |u| (CAR #10#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #9# (SPADCALL |u| (QREFELT % 76)))
                                 (COND
                                  (#7#
                                   (LETT #8#
                                         (SPADCALL #8# #9# (QREFELT % 87))))
                                  ('T (PROGN (LETT #8# #9#) (LETT #7# 'T)))))))
                              (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
                         (COND (#7# #8#) (#11='T (|spadConstant| % 9)))))
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;gcdPolynomial;3Sup;34!0|
                               (VECTOR % |denpp|))
                         |pp| (QREFELT % 92)))
                  (LETT |denqq|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |u| NIL)
                              (LETT #6# (SPADCALL |qq| (QREFELT % 86))) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |u| (CAR #6#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# (SPADCALL |u| (QREFELT % 76)))
                                 (COND
                                  (#3#
                                   (LETT #4#
                                         (SPADCALL #4# #5# (QREFELT % 87))))
                                  ('T (PROGN (LETT #4# #5#) (LETT #3# 'T)))))))
                              (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                         (COND (#3# #4#) (#11# (|spadConstant| % 9)))))
                  (LETT |qqD|
                        (SPADCALL
                         (CONS #'|FRAC;gcdPolynomial;3Sup;34!1|
                               (VECTOR % |denqq|))
                         |qq| (QREFELT % 92)))
                  (LETT |g| (SPADCALL |ppD| |qqD| (QREFELT % 94)))
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |g| (QREFELT % 95)))
                     (|spadConstant| % 84))
                    (#11#
                     (SEQ (LETT |lc| (SPADCALL |g| (QREFELT % 96)))
                          (EXIT
                           (COND
                            ((SPADCALL |lc| (|spadConstant| % 9)
                                       (QREFELT % 20))
                             (SPADCALL (ELT % 10) |g| (QREFELT % 99)))
                            (#11#
                             (SPADCALL
                              (CONS #'|FRAC;gcdPolynomial;3Sup;34!2|
                                    (VECTOR % |lc|))
                              |g| (QREFELT % 99))))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!2| ((|x| NIL) ($$ NIL))
        (PROG (|lc| %)
          (LETT |lc| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |lc| (QREFELT % 57)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!1| ((|x| NIL) ($$ NIL))
        (PROG (|denqq| %)
          (LETT |denqq| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denqq| (QREFELT % 88)) (QREFELT % 26)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| %)
          (LETT |denpp| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT % 88)) (QREFELT % 26)))))) 

(SDEFUN |FRAC;charthRoot;%U;35| ((|x| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|d| #2=(|Union| S #1#)) (|n| #2#))
               (SEQ (LETT |n| (SPADCALL (QCAR |x|) (QREFELT % 101)))
                    (EXIT
                     (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                           (#3='T
                            (SEQ
                             (LETT |d| (SPADCALL (QCDR |x|) (QREFELT % 101)))
                             (EXIT
                              (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                    (#3#
                                     (CONS 0
                                           (SPADCALL (QCDR |n|) (QCDR |d|)
                                                     (QREFELT % 57))))))))))))) 

(SDEFUN |FRAC;charthRoot;%U;36| ((|x| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|ans| (|Union| S #1#)) (#2=#:G722 NIL))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (PROG1
                                               (LETT #2#
                                                     (-
                                                      (SPADCALL
                                                       (QREFELT % 103))
                                                      1))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT % 104))
                                 (QREFELT % 53))
                       (QREFELT % 101)))
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT % 57))))))))) 

(SDEFUN |FRAC;charthRoot;%U;37| ((|x| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|ans| (|Union| S #1#)) (#2=#:G743 NIL))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (PROG1
                                               (LETT #2#
                                                     (-
                                                      (SPADCALL
                                                       (QREFELT % 103))
                                                      1))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT % 104))
                                 (QREFELT % 53))
                       (QREFELT % 101)))
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT % 57))))))))) 

(SDEFUN |FRAC;clear| ((|l| (|List| %)) (% (|List| S)))
        (SPROG
         ((#1=#:G754 NIL) (#2=#:G761 NIL) (|x| NIL) (#3=#:G760 NIL) (|d| (S))
          (#4=#:G750 NIL) (#5=#:G749 (S)) (#6=#:G751 (S)) (#7=#:G759 NIL))
         (SEQ
          (LETT |d|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |x| NIL) (LETT #7# |l|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6# (QCDR |x|))
                         (COND
                          (#4# (LETT #5# (SPADCALL #5# #6# (QREFELT % 87))))
                          ('T (PROGN (LETT #5# #6#) (LETT #4# 'T)))))))
                      (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|spadConstant| % 9)))))
          (EXIT
           (PROGN
            (LETT #3# NIL)
            (SEQ (LETT |x| NIL) (LETT #2# |l|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (SPADCALL (QCAR |x|)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |d| (QCDR |x|)
                                                        (QREFELT % 30)))
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (QREFELT % 6)
                                                      (|Union| (QREFELT % 6)
                                                               "failed")
                                                      #1#))
                                    (QREFELT % 53))
                          #3#))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |FRAC;conditionP;MU;39|
        ((|mat| (|Matrix| %)) (% (|Union| (|Vector| %) #1="failed")))
        (SPROG
         ((#2=#:G781 NIL) (#3=#:G783 NIL) (|i| NIL) (#4=#:G782 NIL)
          (|ansDD| (|Vector| S)) (|ansD| (|Union| (|Vector| S) #1#))
          (|matD| (|Matrix| S)) (#5=#:G780 NIL) (|l| NIL) (#6=#:G779 NIL))
         (SEQ
          (LETT |matD|
                (SPADCALL
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT |l| NIL)
                       (LETT #5# (SPADCALL |mat| (QREFELT % 107))) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #6# (CONS (|FRAC;clear| |l| %) #6#))))
                       (LETT #5# (CDR #5#)) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 (QREFELT % 110)))
          (LETT |ansD| (SPADCALL |matD| (QREFELT % 113)))
          (EXIT
           (COND ((QEQCAR |ansD| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ansDD| (QCDR |ansD|))
                       (EXIT
                        (CONS 0
                              (PROGN
                               (LETT #4# (GETREFV #7=(QVSIZE |ansDD|)))
                               (SEQ (LETT |i| 1) (LETT #3# #7#) (LETT #2# 0)
                                    G190
                                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SETELT #4# #2#
                                              (SPADCALL
                                               (SPADCALL |ansDD| |i|
                                                         (QREFELT % 115))
                                               (QREFELT % 10)))))
                                    (LETT #2#
                                          (PROG1 (|inc_SI| #2#)
                                            (LETT |i| (|inc_SI| |i|))))
                                    (GO G190) G191 (EXIT NIL))
                               #4#)))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPROG
         ((|lfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| %))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|den1| (%)) (|lc| (%)) (#2=#:G807 NIL) (|w| NIL) (#3=#:G806 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G785 NIL) (#5=#:G784 (S)) (#6=#:G786 (S)) (#7=#:G805 NIL)
          (|u| NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT % 81)) (|spadConstant| % 118))
                (#8='T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |u| NIL)
                              (LETT #7# (SPADCALL |pp| (QREFELT % 86))) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# (SPADCALL |u| (QREFELT % 76)))
                                 (COND
                                  (#4#
                                   (LETT #5#
                                         (SPADCALL #5# #6# (QREFELT % 87))))
                                  ('T (PROGN (LETT #5# #6#) (LETT #4# 'T)))))))
                              (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                         (COND (#4# #5#) (#8# (|spadConstant| % 9)))))
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;factorPolynomial;SupF;40!0|
                               (VECTOR % |denpp|))
                         |pp| (QREFELT % 92)))
                  (LETT |ff| (SPADCALL |ppD| (QREFELT % 120)))
                  (LETT |den1| (SPADCALL |denpp| (QREFELT % 10)))
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |w| NIL)
                              (LETT #2# (SPADCALL |ff| (QREFELT % 125))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |w| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (VECTOR (QVELT |w| 0)
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL (QVELT |w| 1)
                                                            (QREFELT % 96))
                                                  (|spadConstant| % 9)
                                                  (QREFELT % 20))
                                                 (SPADCALL (ELT % 10)
                                                           (QVELT |w| 1)
                                                           (QREFELT % 99)))
                                                ('T
                                                 (SEQ
                                                  (LETT |lc|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |w| 1)
                                                          (QREFELT % 96))
                                                         (QREFELT % 10)))
                                                  (LETT |den1|
                                                        (SPADCALL |den1|
                                                                  (SPADCALL
                                                                   |lc|
                                                                   (QVELT |w|
                                                                          2)
                                                                   (QREFELT %
                                                                            126))
                                                                  (QREFELT %
                                                                           127)))
                                                  (EXIT
                                                   (SPADCALL
                                                    (CONS
                                                     #'|FRAC;factorPolynomial;SupF;40!1|
                                                     (VECTOR |lc| %))
                                                    (QVELT |w| 1)
                                                    (QREFELT % 99))))))
                                               (QVELT |w| 2))
                                       #3#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|FRAC;factorPolynomial;SupF;40!2|
                           (VECTOR |den1| %))
                     (SPADCALL |ff| (QREFELT % 128)) (QREFELT % 99))
                    |lfact| (QREFELT % 131))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!2| ((|x| NIL) ($$ NIL))
        (PROG (% |den1|)
          (LETT % (QREFELT $$ 1))
          (LETT |den1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 10)) |den1| (QREFELT % 127)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!1| ((|x| NIL) ($$ NIL))
        (PROG (% |lc|)
          (LETT % (QREFELT $$ 1))
          (LETT |lc| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 10)) |lc| (QREFELT % 127)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| %)
          (LETT |denpp| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT % 88)) (QREFELT % 26)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPROG
         ((|lfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| %))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|den1| (%)) (|lc| (%)) (#2=#:G832 NIL) (|w| NIL) (#3=#:G831 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G811 NIL) (#5=#:G810 (S)) (#6=#:G812 (S)) (#7=#:G830 NIL)
          (|u| NIL) (|lcpp| (%)))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT % 81)) (|spadConstant| % 118))
                ((EQL (SPADCALL |pp| (QREFELT % 83)) 0)
                 (SPADCALL |pp| NIL (QREFELT % 131)))
                (#8='T
                 (SEQ (LETT |lcpp| (SPADCALL |pp| (QREFELT % 133)))
                      (LETT |pp| (SPADCALL |pp| |lcpp| (QREFELT % 134)))
                      (LETT |denpp|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |u| NIL)
                                  (LETT #7# (SPADCALL |pp| (QREFELT % 86)))
                                  G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |u| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #6# (SPADCALL |u| (QREFELT % 76)))
                                     (COND
                                      (#4#
                                       (LETT #5#
                                             (SPADCALL #5# #6#
                                                       (QREFELT % 87))))
                                      ('T
                                       (PROGN
                                        (LETT #5# #6#)
                                        (LETT #4# 'T)))))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#4# #5#) (#8# (|spadConstant| % 9)))))
                      (LETT |ppD|
                            (SPADCALL
                             (CONS
                              #'|FRAC;factorSquareFreePolynomial;SupF;41!0|
                              (VECTOR % |denpp|))
                             |pp| (QREFELT % 92)))
                      (LETT |ff| (SPADCALL |ppD| (QREFELT % 135)))
                      (LETT |den1|
                            (SPADCALL (SPADCALL |denpp| (QREFELT % 10)) |lcpp|
                                      (QREFELT % 127)))
                      (LETT |lfact|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |w| NIL)
                                  (LETT #2# (SPADCALL |ff| (QREFELT % 125)))
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |w| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (VECTOR (QVELT |w| 0)
                                                   (COND
                                                    ((SPADCALL
                                                      (SPADCALL (QVELT |w| 1)
                                                                (QREFELT % 96))
                                                      (|spadConstant| % 9)
                                                      (QREFELT % 20))
                                                     (SPADCALL (ELT % 10)
                                                               (QVELT |w| 1)
                                                               (QREFELT % 99)))
                                                    ('T
                                                     (SEQ
                                                      (LETT |lc|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QVELT |w| 1)
                                                              (QREFELT % 96))
                                                             (QREFELT % 10)))
                                                      (LETT |den1|
                                                            (SPADCALL |den1|
                                                                      (SPADCALL
                                                                       |lc|
                                                                       (QVELT
                                                                        |w| 2)
                                                                       (QREFELT
                                                                        % 126))
                                                                      (QREFELT
                                                                       % 127)))
                                                      (EXIT
                                                       (SPADCALL
                                                        (CONS
                                                         #'|FRAC;factorSquareFreePolynomial;SupF;41!1|
                                                         (VECTOR |lc| %))
                                                        (QVELT |w| 1)
                                                        (QREFELT % 99))))))
                                                   (QVELT |w| 2))
                                           #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (CONS #'|FRAC;factorSquareFreePolynomial;SupF;41!2|
                               (VECTOR |den1| %))
                         (SPADCALL |ff| (QREFELT % 128)) (QREFELT % 99))
                        |lfact| (QREFELT % 131))))))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!2| ((|x| NIL) ($$ NIL))
        (PROG (% |den1|)
          (LETT % (QREFELT $$ 1))
          (LETT |den1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 10)) |den1| (QREFELT % 127)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!1| ((|x| NIL) ($$ NIL))
        (PROG (% |lc|)
          (LETT % (QREFELT $$ 1))
          (LETT |lc| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 10)) |lc| (QREFELT % 127)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| %)
          (LETT |denpp| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT % 88)) (QREFELT % 26)))))) 

(DECLAIM (NOTINLINE |Fraction;|)) 

(DEFUN |Fraction;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G852 NIL) (#2=#:G853 NIL) (#3=#:G854 NIL) (#4=#:G856 NIL)
    (#5=#:G855 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Fraction| DV$1))
    (LETT % (GETREFV 168))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|RealConstant|))
                                        (|HasCategory| |#1|
                                                       '(|OrderedIntegralDomain|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|OrderedIntegralDomain|))
                                         (|HasCategory| |#1| '(|OrderedSet|)))
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#1|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (AND
                                         (|HasCategory| |#1| '(|Canonical|))
                                         (|HasCategory| |#1| '(|GcdDomain|))
                                         (|HasCategory| |#1|
                                                        '(|canonicalUnitNormal|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|EuclideanDomain|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|)))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|IntegerNumberSystem|))
                                               (|HasCategory| |#1|
                                                              '(|OpenMath|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|))))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|))))
                                        (OR #3# #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|OrderedIntegralDomain|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|))))
                                        (OR #1# #4#)
                                        (|HasCategory| |#1|
                                                       '(|UniqueFactorizationDomain|))))))
    (|haddProp| |$ConstructorCache| '|Fraction| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 17179869184))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Record| (|:| |num| |#1|) (|:| |den| |#1|)))
    (COND
     ((|testBitVector| |pv$| 33)
      (QSETREFV % 19
                (CONS (|dispatchFunction| |FRAC;factorFraction;%F;3|) %))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (COND
       ((|HasCategory| |#1| '(|canonicalUnitNormal|))
        (PROGN
         (QSETREFV % 21 (CONS (|dispatchFunction| |FRAC;=;2%B;4|) %))
         (COND
          ((|testBitVector| |pv$| 18)
           (QSETREFV % 24
                     (CONS (|dispatchFunction| |FRAC;hashUpdate!;Hs%Hs;5|)
                           %))))
         (QSETREFV % 25 (CONS (|dispatchFunction| |FRAC;one?;%B;6|) %))
         (QSETREFV % 26 (CONS (|dispatchFunction| |FRAC;retract;%S;7|) %))
         (QSETREFV % 28
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;8|) %))))
       ('T
        (PROGN
         (QSETREFV % 26 (CONS (|dispatchFunction| |FRAC;retract;%S;9|) %))
         (QSETREFV % 28
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;10|) %))))))
     ('T
      (PROGN
       (QSETREFV % 26 (CONS (|dispatchFunction| |FRAC;retract;%S;11|) %))
       (QSETREFV % 28
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;12|) %)))))
    (COND
     ((|testBitVector| |pv$| 22)
      (QSETREFV % 32 (CONS (|dispatchFunction| |FRAC;wholePart;%S;13|) %))))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (QSETREFV % 39 (CONS (|dispatchFunction| |FRAC;floor;%S;14|) %))
       (QSETREFV % 37 (CONS (|dispatchFunction| |FRAC;ceiling;%S;15|) %))
       (COND
        ((|HasCategory| |#1| '(|OpenMath|))
         (PROGN
          (QSETREFV % 50
                    (CONS (|dispatchFunction| |FRAC;OMwrite;Omd%BV;17|)
                          %))))))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (PROGN
       (QSETREFV % 54 (CONS (|dispatchFunction| |FRAC;recip;%U;19|) %))
       (QSETREFV % 57 (CONS (|dispatchFunction| |FRAC;/;2S%;21|) %))
       (QSETREFV % 58 (CONS (|dispatchFunction| |FRAC;+;3%;22|) %))
       (QSETREFV % 60 (CONS (|dispatchFunction| |FRAC;-;3%;23|) %))
       (QSETREFV % 61 (CONS (|dispatchFunction| |FRAC;*;3%;24|) %))
       (QSETREFV % 64 (CONS (|dispatchFunction| |FRAC;*;I2%;25|) %))
       (QSETREFV % 65 (CONS (|dispatchFunction| |FRAC;*;S2%;26|) %))
       (QSETREFV % 67
                 (CONS (|dispatchFunction| |FRAC;differentiate;%M%;27|) %))))
     ('T
      (PROGN
       (QSETREFV % 57 (CONS (|dispatchFunction| |FRAC;/;2S%;28|) %))
       (QSETREFV % 54 (CONS (|dispatchFunction| |FRAC;recip;%U;29|) %)))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
      (PROGN
       (QSETREFV % 70 (CONS (|dispatchFunction| |FRAC;retract;%F;30|) %))
       (QSETREFV % 73
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;31|) %))))
     ((|testBitVector| |pv$| 31)
      (PROGN
       (QSETREFV % 70 (CONS (|dispatchFunction| |FRAC;retract;%F;32|) %))
       (QSETREFV % 73
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;33|) %)))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (QSETREFV % 100
                (CONS (|dispatchFunction| |FRAC;gcdPolynomial;3Sup;34|) %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 3)
         (PROGN
          (COND
           ((|HasCategory| |#1| '(|canonicalUnitNormal|))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (QSETREFV % 102
                        (CONS (|dispatchFunction| |FRAC;charthRoot;%U;35|) %)))
             ('T
              (QSETREFV % 102
                        (CONS (|dispatchFunction| |FRAC;charthRoot;%U;36|)
                              %)))))
           ('T
            (QSETREFV % 102
                      (CONS (|dispatchFunction| |FRAC;charthRoot;%U;37|) %))))
          NIL
          NIL
          (QSETREFV % 116
                    (CONS (|dispatchFunction| |FRAC;conditionP;MU;39|) %)))))
       (QSETREFV % 132
                 (CONS (|dispatchFunction| |FRAC;factorPolynomial;SupF;40|) %))
       (QSETREFV % 136
                 (CONS
                  (|dispatchFunction|
                   |FRAC;factorSquareFreePolynomial;SupF;41|)
                  %)))))
    %))) 

(DEFUN |Fraction| (#1=#:G857)
  (SPROG NIL
         (PROG (#2=#:G858)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Fraction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Fraction;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Fraction|)))))))))) 

(MAKEPROP '|Fraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|LocalAlgebra| 6 6) (|local| |#1|) '|Rep|
              (0 . |One|) (4 . |One|) |FRAC;coerce;S%;1| (|Boolean|)
              (8 . |zero?|) |FRAC;zero?;%B;2| (|Factored| %) (13 . |factor|)
              (|Factored| 6) (|Fraction| 16) (18 . /) (24 . |factorFraction|)
              (29 . =) (35 . =) (|HashState|) (41 . |hashUpdate!|)
              (47 . |hashUpdate!|) (53 . |one?|) (58 . |retract|)
              (|Union| 6 '"failed") (63 . |retractIfCan|) (|Union| % '"failed")
              (68 . |exquo|) (74 . |quo|) (80 . |wholePart|) (85 . |Zero|)
              (89 . |Zero|) (93 . <) (99 . -) (104 . |ceiling|) (109 . -)
              (114 . |floor|) (119 . +) (|Void|) (|OpenMathDevice|)
              (125 . |OMputApp|) (|String|) (130 . |OMputSymbol|)
              (137 . |OMwrite|) (144 . |OMputEndApp|) (149 . |OMputObject|)
              (154 . |OMputEndObject|) (159 . |OMwrite|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (166 . |unitNormal|) (171 . *) (177 . |recip|) (182 . |gcd|)
              (188 . |one?|) (193 . /) (199 . +) (205 . -) (211 . -) (217 . *)
              (|Integer|) (223 . |coerce|) (228 . *) (234 . *) (|Mapping| 6 6)
              (240 . |differentiate|) (|Fraction| 62) (246 . |retract|)
              (251 . |retract|) (|Union| 68 '#1="failed")
              (256 . |retractIfCan|) (261 . |retractIfCan|) (266 . |numer|)
              (271 . |retract|) (276 . |denom|) (281 . /) (|Union| 62 '#1#)
              (287 . |retractIfCan|) (|SparseUnivariatePolynomial| $$)
              (292 . |zero?|) (|NonNegativeInteger|) (297 . |degree|)
              (302 . |One|) (|List| $$) (306 . |coefficients|) (311 . |lcm|)
              (317 . *) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 80 6 89)
              (323 . |map|) (|SparseUnivariatePolynomial| %)
              (329 . |gcdPolynomial|) (335 . |degree|)
              (340 . |leadingCoefficient|) (|Mapping| $$ 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 89 $$ 80)
              (345 . |map|) (351 . |gcdPolynomial|) (357 . |charthRoot|)
              (362 . |charthRoot|) (367 . |characteristic|) (371 . ^)
              (|List| 85) (|Matrix| $$) (377 . |listOfLists|) (|List| 152)
              (|Matrix| 6) (382 . |matrix|) (|Union| 148 '#2="failed")
              (|Matrix| %) (387 . |conditionP|) (|Vector| 6) (392 . |elt|)
              (398 . |conditionP|) (|Factored| 80) (403 . |Zero|)
              (|Factored| 93) (407 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 121) (|:| |factor| 89) (|:| |exponent| 82))
              (|List| 122) (|Factored| 89) (412 . |factorList|) (417 . ^)
              (423 . /) (429 . |unit|)
              (|Record| (|:| |flag| 121) (|:| |factor| 80) (|:| |exponent| 82))
              (|List| 129) (434 . |makeFR|) (440 . |factorPolynomial|)
              (445 . |leadingCoefficient|) (450 . /)
              (456 . |factorSquareFreePolynomial|)
              (461 . |factorSquareFreePolynomial|) (|OutputForm|)
              (|PositiveInteger|)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|Union| 140 '"failed")
              (|Record| (|:| |coef| 140) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 144 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |mat| 109) (|:| |vec| 114)) (|Vector| %)
              (|InputForm|) (|Pattern| 165) (|Pattern| 62) (|List| 6)
              (|Equation| 6) (|List| 153) (|SingleInteger|) (|List| 157)
              (|Symbol|) (|Matrix| 62)
              (|Record| (|:| |mat| 158) (|:| |vec| (|Vector| 62))) (|List| 82)
              (|PatternMatchResult| 165 %) (|PatternMatchResult| 62 %)
              (|Union| 164 '#2#) (|List| 93) (|Float|) (|DoubleFloat|)
              (|Union| 157 '#1#))
           '#(~= 466 |zero?| 472 |wholePart| 477 |unitNormal| 482
              |unitCanonical| 487 |unit?| 492 |subtractIfCan| 497
              |squareFreePolynomial| 503 |squareFreePart| 508 |squareFree| 513
              |solveLinearPolynomialEquation| 518 |smaller?| 524 |sizeLess?|
              530 |sign| 536 |sample| 541 |rightRecip| 545 |rightPower| 550
              |retractIfCan| 562 |retract| 582 |rem| 602 |reducedSystem| 608
              |recip| 630 |quo| 635 |principalIdeal| 641 |prime?| 646
              |positive?| 651 |plenaryPower| 656 |patternMatch| 662 |opposite?|
              676 |one?| 682 |numerator| 687 |numer| 692 |nextItem| 697
              |negative?| 702 |multiEuclidean| 707 |min| 713 |max| 719 |map|
              725 |leftRecip| 731 |leftPower| 736 |lcmCoef| 748 |lcm| 754
              |latex| 765 |inv| 770 |init| 775 |hashUpdate!| 779 |hash| 785
              |gcdPolynomial| 790 |gcd| 796 |fractionPart| 807 |floor| 812
              |factorSquareFreePolynomial| 817 |factorPolynomial| 822
              |factorFraction| 827 |factor| 832 |extendedEuclidean| 837 |exquo|
              850 |expressIdealMember| 856 |eval| 862 |euclideanSize| 902 |elt|
              907 |divide| 913 |differentiate| 919 |denominator| 969 |denom|
              974 |convert| 979 |conditionP| 1004 |commutator| 1009 |coerce|
              1015 |charthRoot| 1045 |characteristic| 1050 |ceiling| 1054
              |associator| 1059 |associates?| 1066 |antiCommutator| 1072
              |annihilate?| 1078 |abs| 1084 ^ 1089 |Zero| 1107 |One| 1111
              |OMwrite| 1115 D 1139 >= 1189 > 1195 = 1201 <= 1207 < 1213 / 1219
              - 1231 + 1242 * 1248)
           'NIL
           (CONS
            (|makeByteWordVec2| 32
                                '(0 0 1 0 0 0 6 0 0 6 0 0 0 0 14 13 4 3 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 15 6 0 0 0 0 0 15 6 0 0
                                  0 0 0 0 0 6 0 6 0 0 0 8 0 0 0 0 0 26 17 9 30
                                  0 0 0 18 11 32 32 5 2 0 0 0 0 24 19 25 16 12
                                  11 10 32 32 7 5 5 28 2 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DivisionRing&| |DifferentialExtension&|
                |DifferentialRing&| |PartialDifferentialRing&| NIL NIL
                |Algebra&| |EntireRing&| |Algebra&| |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Module&| |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL NIL NIL NIL |AbelianSemiGroup&| |Magma&|
                |FullyEvalableOver&| |Hashable&| |Evalable&| |RetractableTo&|
                |RetractableTo&| NIL |RetractableTo&| |SetCategory&| NIL
                |RetractableTo&| NIL |OpenMath&| NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL |PartialOrder&| NIL
                NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 6) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|CommutativeRing|)
                 (|DivisionRing|) (|DifferentialExtension| 6)
                 (|DifferentialRing|) (|PartialDifferentialRing| 157)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 68) (|Algebra| 6)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 68) (|NonAssociativeAlgebra| 6)
                 (|SemiRng|) (|Module| $$) (|Module| 68) (|Module| 6)
                 (|FullyLinearlyExplicitOver| 6) (|LinearlyExplicitOver| 62)
                 (|OrderedAbelianGroup|) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 68 68) (|BiModule| 6 6)
                 (|LinearlyExplicitOver| 6) (|RightModule| 62)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 68)
                 (|RightModule| 68) (|LeftModule| 6) (|RightModule| 6)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|OrderedSet|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|FullyPatternMatchable| 6)
                 (|PatternMatchable| 62) (|PatternMatchable| 165)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyEvalableOver| 6) (|Hashable|) (|Evalable| 6)
                 (|RetractableTo| 62) (|RetractableTo| 68) (|RealConstant|)
                 (|RetractableTo| 157) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 6) (|Patternable| 6) (|OpenMath|)
                 (|Canonical|) (|ConvertibleTo| 151) (|ConvertibleTo| 150)
                 (|Eltable| 6 $$) (|InnerEvalable| 6 6) (|InnerEvalable| 157 6)
                 (|CoercibleFrom| 62) (|CoercibleFrom| 68) (|PartialOrder|)
                 (|ConvertibleTo| 165) (|ConvertibleTo| 166)
                 (|ConvertibleTo| 149) (|CoercibleFrom| 157)
                 (|CoercibleTo| 137) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| 6) (|Type|))
              (|makeByteWordVec2| 167
                                  '(0 0 0 8 0 6 0 9 1 6 11 0 12 1 6 14 0 15 2
                                    17 0 16 16 18 1 0 17 0 19 2 6 11 0 0 20 2 0
                                    11 0 0 21 2 6 22 22 0 23 2 0 22 22 0 24 1 0
                                    11 0 25 1 0 6 0 26 1 0 27 0 28 2 6 29 0 0
                                    30 2 6 0 0 0 31 1 0 6 0 32 0 0 0 33 0 6 0
                                    34 2 0 11 0 0 35 1 0 0 0 36 1 0 6 0 37 1 6
                                    0 0 38 1 0 6 0 39 2 6 0 0 0 40 1 42 41 0 43
                                    3 42 41 0 44 44 45 3 6 41 42 0 11 46 1 42
                                    41 0 47 1 42 41 0 48 1 42 41 0 49 3 0 41 42
                                    0 11 50 1 6 51 0 52 2 6 0 0 0 53 1 0 29 0
                                    54 2 6 0 0 0 55 1 6 11 0 56 2 0 0 6 6 57 2
                                    0 0 0 0 58 2 6 0 0 0 59 2 0 0 0 0 60 2 0 0
                                    0 0 61 1 6 0 62 63 2 0 0 62 0 64 2 0 0 6 0
                                    65 2 0 0 0 66 67 1 6 68 0 69 1 0 68 0 70 1
                                    6 71 0 72 1 0 71 0 73 1 0 6 0 74 1 6 62 0
                                    75 1 0 6 0 76 2 68 0 62 62 77 1 6 78 0 79 1
                                    80 11 0 81 1 80 82 0 83 0 80 0 84 1 80 85 0
                                    86 2 6 0 0 0 87 2 0 0 0 6 88 2 91 89 90 80
                                    92 2 6 93 93 93 94 1 89 82 0 95 1 89 6 0 96
                                    2 98 80 97 89 99 2 0 93 93 93 100 1 6 29 0
                                    101 1 0 29 0 102 0 0 82 103 2 6 0 0 82 104
                                    1 106 105 0 107 1 109 0 108 110 1 6 111 112
                                    113 2 114 6 0 62 115 1 0 111 112 116 0 117
                                    0 118 1 6 119 93 120 1 124 123 0 125 2 0 0
                                    0 82 126 2 0 0 0 0 127 1 124 89 0 128 2 117
                                    0 80 130 131 1 0 119 93 132 1 80 2 0 133 2
                                    80 0 0 2 134 1 6 119 93 135 1 0 119 93 136
                                    2 0 11 0 0 1 1 0 11 0 13 1 22 6 0 32 1 0 51
                                    0 1 1 0 0 0 1 1 0 11 0 1 2 0 29 0 0 1 1 1
                                    119 93 1 1 0 0 0 1 1 0 14 0 1 2 1 163 164
                                    93 1 2 29 11 0 0 1 2 0 11 0 0 1 1 6 62 0 1
                                    0 0 0 1 1 0 29 0 1 2 0 0 0 138 1 2 0 0 0 82
                                    1 1 0 27 0 28 1 31 71 0 73 1 31 78 0 1 1 2
                                    167 0 1 1 0 6 0 26 1 31 68 0 70 1 31 62 0 1
                                    1 2 157 0 1 2 0 0 0 0 1 2 0 147 112 148 1 1
                                    0 109 112 1 1 15 158 112 1 2 15 159 112 148
                                    1 1 0 29 0 54 2 0 0 0 0 1 1 0 142 140 1 1 0
                                    11 0 1 1 6 11 0 1 2 0 0 0 138 1 3 17 161 0
                                    150 161 1 3 21 162 0 151 162 1 2 0 11 0 0 1
                                    1 0 11 0 25 1 0 0 0 1 1 0 6 0 74 1 9 29 0 1
                                    1 6 11 0 1 2 0 141 140 0 1 2 7 0 0 0 1 2 7
                                    0 0 0 1 2 0 0 66 0 1 1 0 29 0 1 2 0 0 0 138
                                    1 2 0 0 0 82 1 2 0 139 0 0 1 1 0 0 140 1 2
                                    0 0 0 0 1 1 0 44 0 1 1 0 0 0 1 0 9 0 1 2 18
                                    22 22 0 24 1 18 155 0 1 2 0 93 93 93 100 1
                                    0 0 140 1 2 0 0 0 0 1 1 22 0 0 1 1 23 6 0
                                    39 1 1 119 93 136 1 1 119 93 132 1 33 17 0
                                    19 1 0 14 0 1 3 0 145 0 0 0 1 2 0 146 0 0 1
                                    2 0 29 0 0 1 2 0 141 140 0 1 3 11 0 0 152
                                    152 1 2 11 0 0 153 1 3 11 0 0 6 6 1 2 11 0
                                    0 154 1 3 10 0 0 156 152 1 3 10 0 0 157 6 1
                                    1 0 82 0 1 2 12 0 0 6 1 2 0 143 0 0 1 3 0 0
                                    0 66 82 1 2 0 0 0 66 67 1 14 0 0 1 2 14 0 0
                                    82 1 2 13 0 0 156 1 2 13 0 0 157 1 3 13 0 0
                                    156 160 1 3 13 0 0 157 82 1 1 0 0 0 1 1 0 6
                                    0 76 1 27 149 0 1 1 16 150 0 1 1 20 151 0 1
                                    1 5 165 0 1 1 5 166 0 1 1 34 111 112 116 2
                                    0 0 0 0 1 1 0 137 0 1 1 0 0 62 1 1 0 0 0 1
                                    1 0 0 68 1 1 0 0 6 10 1 2 0 157 1 1 35 29 0
                                    102 0 0 82 103 1 23 6 0 37 3 0 0 0 0 0 1 2
                                    0 11 0 0 1 2 0 0 0 0 1 2 0 11 0 0 1 1 6 0 0
                                    1 2 0 0 0 138 1 2 0 0 0 82 126 2 0 0 0 62 1
                                    0 0 0 33 0 0 0 8 3 24 41 42 0 11 50 2 24 44
                                    0 11 1 2 24 41 42 0 1 1 24 44 0 1 3 0 0 0
                                    66 82 1 2 0 0 0 66 1 1 14 0 0 1 2 14 0 0 82
                                    1 2 13 0 0 157 1 3 13 0 0 157 82 1 2 13 0 0
                                    156 1 3 13 0 0 156 160 1 2 7 11 0 0 1 2 7
                                    11 0 0 1 2 0 11 0 0 21 2 7 11 0 0 1 2 7 11
                                    0 0 35 2 0 0 0 0 127 2 0 0 6 6 57 2 0 0 0 0
                                    60 1 0 0 0 36 2 0 0 0 0 58 2 0 0 138 0 1 2
                                    0 0 0 0 61 2 0 0 62 0 64 2 0 0 82 0 1 2 0 0
                                    0 68 1 2 0 0 68 0 1 2 0 0 0 6 88 2 0 0 6 0
                                    65 2 15 0 0 62 1)))))
           '|lookupComplete|)) 
