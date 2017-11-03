
(SDEFUN |FRAC;coerce;S$;1| ((|d| S) ($ $)) (CONS |d| (|spadConstant| $ 9))) 

(SDEFUN |FRAC;zero?;$B;2| ((|x| $) ($ |Boolean|))
        (SPADCALL (QCAR |x|) (QREFELT $ 12))) 

(SDEFUN |FRAC;=;2$B;3| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 14))
          (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 14)))
         ('T NIL))) 

(SDEFUN |FRAC;hashUpdate!;Hs$Hs;4| ((|s| . #1=(|HashState|)) (|x| $) ($ . #1#))
        (SEQ
         (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT $ 17))
               |FRAC;hashUpdate!;Hs$Hs;4|)
         (EXIT (SPADCALL |s| (QCDR |x|) (QREFELT $ 17))))) 

(SDEFUN |FRAC;one?;$B;5| ((|x| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (|spadConstant| $ 9) (QREFELT $ 14))
          (SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)))
         ('T NIL))) 

(SDEFUN |FRAC;retract;$S;6| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
         ('T (|error| "Denominator not equal to 1")))) 

(SDEFUN |FRAC;retractIfCan;$U;7| ((|x| $) ($ |Union| S "failed"))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14))
          (CONS 0 (QCAR |x|)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |FRAC;retract;$S;8| ((|x| $) ($ S))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ
                (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 24))
                      |FRAC;retract;$S;8|)
                (EXIT
                 (COND ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                       ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;$U;9| ((|x| $) ($ |Union| S "failed"))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 24))) 

(SDEFUN |FRAC;retract;$S;10| ((|x| $) ($ S))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ
                (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 24))
                      |FRAC;retract;$S;10|)
                (EXIT
                 (COND ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                       ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;$U;11| ((|x| $) ($ |Union| S "failed"))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 24))) 

(SDEFUN |FRAC;wholePart;$S;12| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
         ('T (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 25))))) 

(SDEFUN |FRAC;floor;$S;13| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 29))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 30)) (QREFELT $ 31))
                    (QREFELT $ 32)))
         ('T (SPADCALL |x| (QREFELT $ 26))))) 

(SDEFUN |FRAC;ceiling;$S;14| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| $ 27) (QREFELT $ 29))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 30)) (QREFELT $ 33))
                    (QREFELT $ 32)))
         ('T
          (SPADCALL (|spadConstant| $ 9) (SPADCALL |x| (QREFELT $ 26))
                    (QREFELT $ 34))))) 

(SDEFUN |FRAC;writeOMFrac| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 37))
             (SPADCALL |dev| "nums1" "rational" (QREFELT $ 39))
             (SPADCALL |dev| (QCAR |x|) NIL (QREFELT $ 40))
             (SPADCALL |dev| (QCDR |x|) NIL (QREFELT $ 40))
             (EXIT (SPADCALL |dev| (QREFELT $ 41))))) 

(SDEFUN |FRAC;OMwrite;Omd$BV;16|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 42))))
             (|FRAC;writeOMFrac| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 43))))))) 

(SDEFUN |FRAC;normalize| ((|x| $) ($ $))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| S) (|:| |canonical| S) (|:| |associate| S))))
         (SEQ
          (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (|spadConstant| $ 27))
                ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) |x|)
                (#1='T
                 (SEQ
                  (LETT |uca| (SPADCALL (QCDR |x|) (QREFELT $ 46))
                        |FRAC;normalize|)
                  (EXIT
                   (COND
                    ((SPADCALL (PROGN (RPLACD |x| (QVELT |uca| 1)) (QCDR |x|))
                               (QREFELT $ 12))
                     (|error| "division by zero"))
                    (#1#
                     (SEQ
                      (PROGN
                       (RPLACA |x|
                               (SPADCALL (QCAR |x|) (QVELT |uca| 2)
                                         (QREFELT $ 47)))
                       (QCAR |x|))
                      (EXIT |x|))))))))))) 

(SDEFUN |FRAC;recip;$U;18| ((|x| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (CONS 1 "failed"))
              ('T (CONS 0 (|FRAC;normalize| (CONS (QCDR |x|) (QCAR |x|)) $))))) 

(SDEFUN |FRAC;cancelGcd| ((|x| $) ($ S))
        (SPROG ((|xd| #1=(|Union| S "failed")) (|xn| #1#) (|d| (S)))
               (SEQ
                (COND
                 ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14))
                  (QCDR |x|))
                 (#2='T
                  (SEQ
                   (LETT |d| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 49))
                         . #3=(|FRAC;cancelGcd|))
                   (LETT |xn| (SPADCALL (QCAR |x|) |d| (QREFELT $ 24)) . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |xn| 1)
                      (|error| "gcd not gcd in QF cancelGcd (numerator)"))
                     (#2#
                      (SEQ
                       (LETT |xd| (SPADCALL (QCDR |x|) |d| (QREFELT $ 24))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |xd| 1)
                          (|error|
                           "gcd not gcd in QF cancelGcd (denominator)"))
                         (#2#
                          (SEQ (PROGN (RPLACA |x| (QCDR |xn|)) (QCAR |x|))
                               (PROGN (RPLACD |x| (QCDR |xd|)) (QCDR |x|))
                               (EXIT |d|))))))))))))))) 

(SDEFUN |FRAC;/;2S$;20| ((|nn| S) (|dd| S) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL |dd| (QREFELT $ 12)) (|error| "division by zero"))
                 ('T
                  (SEQ
                   (|FRAC;cancelGcd|
                    (LETT |z| (CONS |nn| |dd|) |FRAC;/;2S$;20|) $)
                   (EXIT (|FRAC;normalize| |z| $)))))))) 

(SDEFUN |FRAC;+;3$;21| ((|x| $) (|y| $) ($ $))
        (SPROG ((|g| ($)) (|d| (S)) (|z| ($)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 13)) |x|)
                      ((SPADCALL |x| (QREFELT $ 13)) |y|)
                      ('T
                       (SEQ
                        (LETT |z| (CONS (QCDR |x|) (QCDR |y|))
                              . #1=(|FRAC;+;3$;21|))
                        (LETT |d| (|FRAC;cancelGcd| |z| $) . #1#)
                        (LETT |g|
                              (CONS
                               (SPADCALL
                                (SPADCALL (QCDR |z|) (QCAR |x|) (QREFELT $ 47))
                                (SPADCALL (QCAR |z|) (QCAR |y|) (QREFELT $ 47))
                                (QREFELT $ 34))
                               |d|)
                              . #1#)
                        (|FRAC;cancelGcd| |g| $)
                        (PROGN
                         (RPLACD |g|
                                 (SPADCALL
                                  (SPADCALL (QCDR |g|) (QCAR |z|)
                                            (QREFELT $ 47))
                                  (QCDR |z|) (QREFELT $ 47)))
                         (QCDR |g|))
                        (EXIT (|FRAC;normalize| |g| $)))))))) 

(SDEFUN |FRAC;-;3$;22| ((|x| $) (|y| $) ($ $))
        (SPROG ((|g| ($)) (|d| (S)) (|z| ($)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 13)) |x|)
                      ('T
                       (SEQ
                        (LETT |z| (CONS (QCDR |x|) (QCDR |y|))
                              . #1=(|FRAC;-;3$;22|))
                        (LETT |d| (|FRAC;cancelGcd| |z| $) . #1#)
                        (LETT |g|
                              (CONS
                               (SPADCALL
                                (SPADCALL (QCDR |z|) (QCAR |x|) (QREFELT $ 47))
                                (SPADCALL (QCAR |z|) (QCAR |y|) (QREFELT $ 47))
                                (QREFELT $ 52))
                               |d|)
                              . #1#)
                        (|FRAC;cancelGcd| |g| $)
                        (PROGN
                         (RPLACD |g|
                                 (SPADCALL
                                  (SPADCALL (QCDR |g|) (QCAR |z|)
                                            (QREFELT $ 47))
                                  (QCDR |z|) (QREFELT $ 47)))
                         (QCDR |g|))
                        (EXIT (|FRAC;normalize| |g| $)))))))) 

(SDEFUN |FRAC;*;3$;23| ((|x| $) (|y| $) ($ $))
        (SPROG ((|#G36| ($)) (|#G35| ($)))
               (SEQ
                (COND
                 ((OR (SPADCALL |x| (QREFELT $ 13))
                      (SPADCALL |y| (QREFELT $ 13)))
                  (|spadConstant| $ 27))
                 ('T
                  (COND
                   ((SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 15)) |y|)
                   ((SPADCALL |y| (|spadConstant| $ 8) (QREFELT $ 15)) |x|)
                   ('T
                    (SEQ
                     (PROGN
                      (LETT |#G35| (CONS (QCAR |x|) (QCDR |y|))
                            . #1=(|FRAC;*;3$;23|))
                      (LETT |#G36| (CONS (QCAR |y|) (QCDR |x|)) . #1#)
                      (LETT |x| |#G35| . #1#)
                      (LETT |y| |#G36| . #1#))
                     (|FRAC;cancelGcd| |x| $) (|FRAC;cancelGcd| |y| $)
                     (EXIT
                      (|FRAC;normalize|
                       (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 47))
                             (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 47)))
                       $)))))))))) 

(SDEFUN |FRAC;*;I2$;24| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ
                (LETT |y| (CONS (SPADCALL |n| (QREFELT $ 56)) (QCDR |x|))
                      |FRAC;*;I2$;24|)
                (|FRAC;cancelGcd| |y| $)
                (EXIT
                 (|FRAC;normalize|
                  (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 47))
                        (QCDR |y|))
                  $))))) 

(SDEFUN |FRAC;*;S2$;25| ((|nn| S) (|x| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ (LETT |y| (CONS |nn| (QCDR |x|)) |FRAC;*;S2$;25|)
                    (|FRAC;cancelGcd| |y| $)
                    (EXIT
                     (|FRAC;normalize|
                      (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 47))
                            (QCDR |y|))
                      $))))) 

(SDEFUN |FRAC;differentiate;$M$;26| ((|x| $) (|deriv| |Mapping| S S) ($ $))
        (SPROG ((|d| (S)) (|#G44| (S)) (|#G43| (S)) (|y| ($)))
               (SEQ
                (LETT |y| (CONS (SPADCALL (QCDR |x|) |deriv|) (QCDR |x|))
                      . #1=(|FRAC;differentiate;$M$;26|))
                (LETT |d| (|FRAC;cancelGcd| |y| $) . #1#)
                (PROGN
                 (RPLACA |y|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCAR |x|) |deriv|) (QCDR |y|)
                                    (QREFELT $ 47))
                          (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 47))
                          (QREFELT $ 52)))
                 (QCAR |y|))
                (PROGN
                 (LETT |#G43| (QCDR |y|) . #1#)
                 (LETT |#G44| |d| . #1#)
                 (LETT |d| |#G43| . #1#)
                 (PROGN (RPLACD |y| |#G44|) (QCDR |y|)))
                (|FRAC;cancelGcd| |y| $)
                (PROGN
                 (RPLACD |y|
                         (SPADCALL (SPADCALL (QCDR |y|) |d| (QREFELT $ 47)) |d|
                                   (QREFELT $ 47)))
                 (QCDR |y|))
                (EXIT (|FRAC;normalize| |y| $))))) 

(SDEFUN |FRAC;/;2S$;27| ((|nn| S) (|dd| S) ($ $))
        (COND ((SPADCALL |dd| (QREFELT $ 12)) (|error| "division by zero"))
              ('T (CONS |nn| |dd|)))) 

(SDEFUN |FRAC;recip;$U;28| ((|x| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (CONS 1 "failed"))
              ('T (CONS 0 (CONS (QCDR |x|) (QCAR |x|)))))) 

(SDEFUN |FRAC;retract;$F;29| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 62))) 

(SDEFUN |FRAC;retractIfCan;$U;30|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|u| (|Union| S "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 22))
                      |FRAC;retractIfCan;$U;30|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |u|) (QREFELT $ 65)))))))) 

(SDEFUN |FRAC;retract;$F;31| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 67)) (QREFELT $ 68))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 69)) (QREFELT $ 68))
                  (QREFELT $ 70))) 

(SDEFUN |FRAC;retractIfCan;$U;32|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Integer|) "failed")) (|n| #1#))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 67)) (QREFELT $ 72))
                      . #2=(|FRAC;retractIfCan;$U;32|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (SPADCALL (SPADCALL |x| (QREFELT $ 69))
                                         (QREFELT $ 72))
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 70))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;33|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) (|qq| . #1#) ($ . #1#))
        (SPROG
         ((|lc| (S)) (|g| (|SparseUnivariatePolynomial| S))
          (|qqD| #2=(|SparseUnivariatePolynomial| S)) (|denqq| (S))
          (#3=#:G1423 NIL) (#4=#:G1422 (S)) (#5=#:G1424 (S)) (#6=#:G1433 NIL)
          (|u| NIL) (|ppD| #2#) (|denpp| (S)) (#7=#:G1419 NIL) (#8=#:G1418 (S))
          (#9=#:G1420 (S)) (#10=#:G1432 NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 74)) |qq|)
                ((SPADCALL |qq| (QREFELT $ 74)) |pp|)
                ((OR (ZEROP (SPADCALL |pp| (QREFELT $ 76)))
                     (ZEROP (SPADCALL |qq| (QREFELT $ 76))))
                 (|spadConstant| $ 77))
                ('T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #7# NIL . #11=(|FRAC;gcdPolynomial;3Sup;33|))
                         (SEQ (LETT |u| NIL . #11#)
                              (LETT #10# (SPADCALL |pp| (QREFELT $ 79)) . #11#)
                              G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |u| (CAR #10#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #9# (SPADCALL |u| (QREFELT $ 69))
                                       . #11#)
                                 (COND
                                  (#7#
                                   (LETT #8# (SPADCALL #8# #9# (QREFELT $ 80))
                                         . #11#))
                                  ('T
                                   (PROGN
                                    (LETT #8# #9# . #11#)
                                    (LETT #7# 'T . #11#)))))))
                              (LETT #10# (CDR #10#) . #11#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#7# #8#) (#12='T (|spadConstant| $ 9))))
                        . #11#)
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;gcdPolynomial;3Sup;33!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 85))
                        . #11#)
                  (LETT |denqq|
                        (PROGN
                         (LETT #3# NIL . #11#)
                         (SEQ (LETT |u| NIL . #11#)
                              (LETT #6# (SPADCALL |qq| (QREFELT $ 79)) . #11#)
                              G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |u| (CAR #6#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# (SPADCALL |u| (QREFELT $ 69))
                                       . #11#)
                                 (COND
                                  (#3#
                                   (LETT #4# (SPADCALL #4# #5# (QREFELT $ 80))
                                         . #11#))
                                  ('T
                                   (PROGN
                                    (LETT #4# #5# . #11#)
                                    (LETT #3# 'T . #11#)))))))
                              (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#3# #4#) (#12# (|spadConstant| $ 9))))
                        . #11#)
                  (LETT |qqD|
                        (SPADCALL
                         (CONS #'|FRAC;gcdPolynomial;3Sup;33!1|
                               (VECTOR $ |denqq|))
                         |qq| (QREFELT $ 85))
                        . #11#)
                  (LETT |g| (SPADCALL |ppD| |qqD| (QREFELT $ 87)) . #11#)
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |g| (QREFELT $ 88)))
                     (|spadConstant| $ 77))
                    (#12#
                     (SEQ (LETT |lc| (SPADCALL |g| (QREFELT $ 89)) . #11#)
                          (EXIT
                           (COND
                            ((SPADCALL |lc| (|spadConstant| $ 9)
                                       (QREFELT $ 14))
                             (SPADCALL (ELT $ 10) |g| (QREFELT $ 92)))
                            (#12#
                             (SPADCALL
                              (CONS #'|FRAC;gcdPolynomial;3Sup;33!2|
                                    (VECTOR $ |lc|))
                              |g| (QREFELT $ 92))))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;33!2| ((|x| NIL) ($$ NIL))
        (PROG (|lc| $)
          (LETT |lc| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |lc| (QREFELT $ 50)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;33!1| ((|x| NIL) ($$ NIL))
        (PROG (|denqq| $)
          (LETT |denqq| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denqq| (QREFELT $ 81)) (QREFELT $ 20)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;33!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 81)) (QREFELT $ 20)))))) 

(SDEFUN |FRAC;charthRoot;$U;34| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|d| #2=(|Union| S #1#)) (|n| #2#))
               (SEQ
                (LETT |n| (SPADCALL (QCAR |x|) (QREFELT $ 94))
                      . #3=(|FRAC;charthRoot;$U;34|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ
                         (LETT |d| (SPADCALL (QCDR |x|) (QREFELT $ 94)) . #3#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#4#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 50))))))))))))) 

(SDEFUN |FRAC;charthRoot;$U;35| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|ans| (|Union| S #1#)))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (SPADCALL (SPADCALL (QREFELT $ 96))
                                                     1 (QREFELT $ 97))
                                           (QREFELT $ 98))
                                 (QREFELT $ 47))
                       (QREFELT $ 94))
                      |FRAC;charthRoot;$U;35|)
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT $ 50))))))))) 

(SDEFUN |FRAC;charthRoot;$U;36| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|ans| (|Union| S #1#)))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (SPADCALL (SPADCALL (QREFELT $ 96))
                                                     1 (QREFELT $ 97))
                                           (QREFELT $ 98))
                                 (QREFELT $ 47))
                       (QREFELT $ 94))
                      |FRAC;charthRoot;$U;36|)
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT $ 50))))))))) 

(SDEFUN |FRAC;clear| ((|l| |List| $) ($ |List| S))
        (SPROG
         ((#1=#:G1466 NIL) (#2=#:G1473 NIL) (|x| NIL) (#3=#:G1472 NIL)
          (|d| (S)) (#4=#:G1463 NIL) (#5=#:G1462 (S)) (#6=#:G1464 (S))
          (#7=#:G1471 NIL))
         (SEQ
          (LETT |d|
                (PROGN
                 (LETT #4# NIL . #8=(|FRAC;clear|))
                 (SEQ (LETT |x| NIL . #8#) (LETT #7# |l| . #8#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6# (QCDR |x|) . #8#)
                         (COND
                          (#4#
                           (LETT #5# (SPADCALL #5# #6# (QREFELT $ 80)) . #8#))
                          ('T
                           (PROGN
                            (LETT #5# #6# . #8#)
                            (LETT #4# 'T . #8#)))))))
                      (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|spadConstant| $ 9))))
                . #8#)
          (EXIT
           (PROGN
            (LETT #3# NIL . #8#)
            (SEQ (LETT |x| NIL . #8#) (LETT #2# |l| . #8#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (SPADCALL (QCAR |x|)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |d| (QCDR |x|)
                                                        (QREFELT $ 24))
                                              . #8#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (QREFELT $ 6)
                                                      (|Union| (QREFELT $ 6)
                                                               "failed")
                                                      #1#))
                                    (QREFELT $ 47))
                          #3#)
                         . #8#)))
                 (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |FRAC;conditionP;MU;38|
        ((|mat| |Matrix| $) ($ |Union| (|Vector| $) #1="failed"))
        (SPROG
         ((#2=#:G1492 NIL) (#3=#:G1494 NIL) (|i| NIL) (#4=#:G1493 NIL)
          (|ansDD| (|Vector| S)) (|ansD| (|Union| (|Vector| S) #1#))
          (|matD| (|Matrix| S)) (#5=#:G1491 NIL) (|l| NIL) (#6=#:G1490 NIL))
         (SEQ
          (LETT |matD|
                (SPADCALL
                 (PROGN
                  (LETT #6# NIL . #7=(|FRAC;conditionP;MU;38|))
                  (SEQ (LETT |l| NIL . #7#)
                       (LETT #5# (SPADCALL |mat| (QREFELT $ 101)) . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6# (CONS (|FRAC;clear| |l| $) #6#) . #7#)))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 (QREFELT $ 104))
                . #7#)
          (LETT |ansD| (SPADCALL |matD| (QREFELT $ 107)) . #7#)
          (EXIT
           (COND ((QEQCAR |ansD| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ansDD| (QCDR |ansD|) . #7#)
                       (EXIT
                        (CONS 0
                              (PROGN
                               (LETT #4# (GETREFV #8=(QVSIZE |ansDD|)) . #7#)
                               (SEQ (LETT |i| 1 . #7#) (LETT #3# #8# . #7#)
                                    (LETT #2# 0 . #7#) G190
                                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SETELT #4# #2#
                                              (SPADCALL
                                               (SPADCALL |ansDD| |i|
                                                         (QREFELT $ 109))
                                               (QREFELT $ 10)))))
                                    (LETT #2#
                                          (PROG1 (|inc_SI| #2#)
                                            (LETT |i| (|inc_SI| |i|) . #7#))
                                          . #7#)
                                    (GO G190) G191 (EXIT NIL))
                               #4#)))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;39|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPROG
         ((|lfact|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|SparseUnivariatePolynomial| $))
                      (|:| |xpnt| (|Integer|)))))
          (|den1| ($)) (|lc| ($)) (#2=#:G1517 NIL) (|w| NIL) (#3=#:G1516 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G1496 NIL) (#5=#:G1495 (S)) (#6=#:G1497 (S)) (#7=#:G1515 NIL)
          (|u| NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 74)) (|spadConstant| $ 112))
                (#8='T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #4# NIL . #9=(|FRAC;factorPolynomial;SupF;39|))
                         (SEQ (LETT |u| NIL . #9#)
                              (LETT #7# (SPADCALL |pp| (QREFELT $ 79)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# (SPADCALL |u| (QREFELT $ 69)) . #9#)
                                 (COND
                                  (#4#
                                   (LETT #5# (SPADCALL #5# #6# (QREFELT $ 80))
                                         . #9#))
                                  ('T
                                   (PROGN
                                    (LETT #5# #6# . #9#)
                                    (LETT #4# 'T . #9#)))))))
                              (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#4# #5#) (#8# (|spadConstant| $ 9))))
                        . #9#)
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;factorPolynomial;SupF;39!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 85))
                        . #9#)
                  (LETT |ff| (SPADCALL |ppD| (QREFELT $ 114)) . #9#)
                  (LETT |den1| (SPADCALL |denpp| (QREFELT $ 10)) . #9#)
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL . #9#)
                         (SEQ (LETT |w| NIL . #9#)
                              (LETT #2# (SPADCALL |ff| (QREFELT $ 119)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |w| (CAR #2#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (VECTOR (QVELT |w| 0)
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL (QVELT |w| 1)
                                                            (QREFELT $ 89))
                                                  (|spadConstant| $ 9)
                                                  (QREFELT $ 14))
                                                 (SPADCALL (ELT $ 10)
                                                           (QVELT |w| 1)
                                                           (QREFELT $ 92)))
                                                ('T
                                                 (SEQ
                                                  (LETT |lc|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |w| 1)
                                                          (QREFELT $ 89))
                                                         (QREFELT $ 10))
                                                        . #9#)
                                                  (LETT |den1|
                                                        (SPADCALL |den1|
                                                                  (SPADCALL
                                                                   |lc|
                                                                   (QVELT |w|
                                                                          2)
                                                                   (QREFELT $
                                                                            120))
                                                                  (QREFELT $
                                                                           121))
                                                        . #9#)
                                                  (EXIT
                                                   (SPADCALL
                                                    (CONS
                                                     #'|FRAC;factorPolynomial;SupF;39!1|
                                                     (VECTOR |lc| $))
                                                    (QVELT |w| 1)
                                                    (QREFELT $ 92))))))
                                               (QVELT |w| 2))
                                       #3#)
                                      . #9#)))
                              (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #9#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|FRAC;factorPolynomial;SupF;39!2|
                           (VECTOR |den1| $))
                     (SPADCALL |ff| (QREFELT $ 122)) (QREFELT $ 92))
                    |lfact| (QREFELT $ 125))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;39!2| ((|x| NIL) ($$ NIL))
        (PROG ($ |den1|)
          (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;39|))
          (LETT |den1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 121)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;39!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |lc|)
          (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;39|))
          (LETT |lc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 121)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;39!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;39|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 81)) (QREFELT $ 20)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;40|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPROG
         ((|lfact|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|SparseUnivariatePolynomial| $))
                      (|:| |xpnt| (|Integer|)))))
          (|den1| ($)) (|lc| ($)) (#2=#:G1542 NIL) (|w| NIL) (#3=#:G1541 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G1522 NIL) (#5=#:G1521 (S)) (#6=#:G1523 (S)) (#7=#:G1540 NIL)
          (|u| NIL) (|lcpp| ($)))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 74)) (|spadConstant| $ 112))
                ((EQL (SPADCALL |pp| (QREFELT $ 76)) 0)
                 (SPADCALL |pp| NIL (QREFELT $ 125)))
                (#8='T
                 (SEQ
                  (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 127))
                        . #9=(|FRAC;factorSquareFreePolynomial;SupF;40|))
                  (LETT |pp| (SPADCALL |pp| |lcpp| (QREFELT $ 128)) . #9#)
                  (LETT |denpp|
                        (PROGN
                         (LETT #4# NIL . #9#)
                         (SEQ (LETT |u| NIL . #9#)
                              (LETT #7# (SPADCALL |pp| (QREFELT $ 79)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# (SPADCALL |u| (QREFELT $ 69)) . #9#)
                                 (COND
                                  (#4#
                                   (LETT #5# (SPADCALL #5# #6# (QREFELT $ 80))
                                         . #9#))
                                  ('T
                                   (PROGN
                                    (LETT #5# #6# . #9#)
                                    (LETT #4# 'T . #9#)))))))
                              (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#4# #5#) (#8# (|spadConstant| $ 9))))
                        . #9#)
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;factorSquareFreePolynomial;SupF;40!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 85))
                        . #9#)
                  (LETT |ff| (SPADCALL |ppD| (QREFELT $ 129)) . #9#)
                  (LETT |den1|
                        (SPADCALL (SPADCALL |denpp| (QREFELT $ 10)) |lcpp|
                                  (QREFELT $ 121))
                        . #9#)
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL . #9#)
                         (SEQ (LETT |w| NIL . #9#)
                              (LETT #2# (SPADCALL |ff| (QREFELT $ 119)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |w| (CAR #2#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (VECTOR (QVELT |w| 0)
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL (QVELT |w| 1)
                                                            (QREFELT $ 89))
                                                  (|spadConstant| $ 9)
                                                  (QREFELT $ 14))
                                                 (SPADCALL (ELT $ 10)
                                                           (QVELT |w| 1)
                                                           (QREFELT $ 92)))
                                                ('T
                                                 (SEQ
                                                  (LETT |lc|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |w| 1)
                                                          (QREFELT $ 89))
                                                         (QREFELT $ 10))
                                                        . #9#)
                                                  (LETT |den1|
                                                        (SPADCALL |den1|
                                                                  (SPADCALL
                                                                   |lc|
                                                                   (QVELT |w|
                                                                          2)
                                                                   (QREFELT $
                                                                            120))
                                                                  (QREFELT $
                                                                           121))
                                                        . #9#)
                                                  (EXIT
                                                   (SPADCALL
                                                    (CONS
                                                     #'|FRAC;factorSquareFreePolynomial;SupF;40!1|
                                                     (VECTOR |lc| $))
                                                    (QVELT |w| 1)
                                                    (QREFELT $ 92))))))
                                               (QVELT |w| 2))
                                       #3#)
                                      . #9#)))
                              (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #9#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|FRAC;factorSquareFreePolynomial;SupF;40!2|
                           (VECTOR |den1| $))
                     (SPADCALL |ff| (QREFELT $ 122)) (QREFELT $ 92))
                    |lfact| (QREFELT $ 125))))))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;40!2| ((|x| NIL) ($$ NIL))
        (PROG ($ |den1|)
          (LETT $ (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;40|))
          (LETT |den1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 121)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;40!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |lc|)
          (LETT $ (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;40|))
          (LETT |lc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 121)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;40!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;40|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 81)) (QREFELT $ 20)))))) 

(DECLAIM (NOTINLINE |Fraction;|)) 

(DEFUN |Fraction| (#1=#:G1567)
  (SPROG NIL
         (PROG (#2=#:G1568)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Fraction|)
                                               '|domainEqualList|)
                    . #3=(|Fraction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Fraction;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Fraction|)))))))))) 

(DEFUN |Fraction;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1562 NIL) (#2=#:G1563 NIL) (#3=#:G1564 NIL)
    (#4=#:G1566 NIL) (#5=#:G1565 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|Fraction|))
    (LETT |dv$| (LIST '|Fraction| DV$1) . #6#)
    (LETT $ (GETREFV 163) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                                             '(|IntegerNumberSystem|))
                                              . #6#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|IntegerNumberSystem|))
                                               (|HasCategory| |#1|
                                                              '(|OpenMath|)))
                                              . #6#)
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
                                                               (|InputForm|)))
                                              . #6#)
                                        (OR #3# #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|))
                                              . #6#)
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|OrderedIntegralDomain|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              . #6#)
                                        (OR #1# #4#)))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|Fraction| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| $ '(|CharacteristicNonZero|))
         (|augmentPredVector| $ 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 4294967296))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Record| (|:| |num| |#1|) (|:| |den| |#1|)))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (COND
       ((|HasCategory| |#1| '(|canonicalUnitNormal|))
        (PROGN
         (QSETREFV $ 15 (CONS (|dispatchFunction| |FRAC;=;2$B;3|) $))
         (QSETREFV $ 18
                   (CONS (|dispatchFunction| |FRAC;hashUpdate!;Hs$Hs;4|) $))
         (QSETREFV $ 19 (CONS (|dispatchFunction| |FRAC;one?;$B;5|) $))
         (QSETREFV $ 20 (CONS (|dispatchFunction| |FRAC;retract;$S;6|) $))
         (QSETREFV $ 22
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;7|) $))))
       ('T
        (PROGN
         (QSETREFV $ 20 (CONS (|dispatchFunction| |FRAC;retract;$S;8|) $))
         (QSETREFV $ 22
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;9|) $))))))
     ('T
      (PROGN
       (QSETREFV $ 20 (CONS (|dispatchFunction| |FRAC;retract;$S;10|) $))
       (QSETREFV $ 22
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;11|) $)))))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV $ 26 (CONS (|dispatchFunction| |FRAC;wholePart;$S;12|) $))))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (QSETREFV $ 33 (CONS (|dispatchFunction| |FRAC;floor;$S;13|) $))
       (QSETREFV $ 31 (CONS (|dispatchFunction| |FRAC;ceiling;$S;14|) $))
       (COND
        ((|HasCategory| |#1| '(|OpenMath|))
         (PROGN
          (QSETREFV $ 44
                    (CONS (|dispatchFunction| |FRAC;OMwrite;Omd$BV;16|)
                          $))))))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (PROGN
       (QSETREFV $ 48 (CONS (|dispatchFunction| |FRAC;recip;$U;18|) $))
       (QSETREFV $ 50 (CONS (|dispatchFunction| |FRAC;/;2S$;20|) $))
       (QSETREFV $ 51 (CONS (|dispatchFunction| |FRAC;+;3$;21|) $))
       (QSETREFV $ 53 (CONS (|dispatchFunction| |FRAC;-;3$;22|) $))
       (QSETREFV $ 54 (CONS (|dispatchFunction| |FRAC;*;3$;23|) $))
       (QSETREFV $ 57 (CONS (|dispatchFunction| |FRAC;*;I2$;24|) $))
       (QSETREFV $ 58 (CONS (|dispatchFunction| |FRAC;*;S2$;25|) $))
       (QSETREFV $ 60
                 (CONS (|dispatchFunction| |FRAC;differentiate;$M$;26|) $))))
     ('T
      (PROGN
       (QSETREFV $ 50 (CONS (|dispatchFunction| |FRAC;/;2S$;27|) $))
       (QSETREFV $ 48 (CONS (|dispatchFunction| |FRAC;recip;$U;28|) $)))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
      (PROGN
       (QSETREFV $ 63 (CONS (|dispatchFunction| |FRAC;retract;$F;29|) $))
       (QSETREFV $ 66
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;30|) $))))
     ((|testBitVector| |pv$| 30)
      (PROGN
       (QSETREFV $ 63 (CONS (|dispatchFunction| |FRAC;retract;$F;31|) $))
       (QSETREFV $ 66
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;32|) $)))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (QSETREFV $ 93
                (CONS (|dispatchFunction| |FRAC;gcdPolynomial;3Sup;33|) $))))
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
              (QSETREFV $ 95
                        (CONS (|dispatchFunction| |FRAC;charthRoot;$U;34|) $)))
             ('T
              (QSETREFV $ 95
                        (CONS (|dispatchFunction| |FRAC;charthRoot;$U;35|)
                              $)))))
           ('T
            (QSETREFV $ 95
                      (CONS (|dispatchFunction| |FRAC;charthRoot;$U;36|) $))))
          NIL
          NIL
          (QSETREFV $ 110
                    (CONS (|dispatchFunction| |FRAC;conditionP;MU;38|) $)))))
       (QSETREFV $ 126
                 (CONS (|dispatchFunction| |FRAC;factorPolynomial;SupF;39|) $))
       (QSETREFV $ 130
                 (CONS
                  (|dispatchFunction|
                   |FRAC;factorSquareFreePolynomial;SupF;40|)
                  $)))))
    $))) 

(MAKEPROP '|Fraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|LocalAlgebra| 6 6) (|local| |#1|) '|Rep|
              (0 . |One|) (4 . |One|) |FRAC;coerce;S$;1| (|Boolean|)
              (8 . |zero?|) |FRAC;zero?;$B;2| (13 . =) (19 . =) (|HashState|)
              (25 . |hashUpdate!|) (31 . |hashUpdate!|) (37 . |one?|)
              (42 . |retract|) (|Union| 6 '"failed") (47 . |retractIfCan|)
              (|Union| $ '"failed") (52 . |exquo|) (58 . |quo|)
              (64 . |wholePart|) (69 . |Zero|) (73 . |Zero|) (77 . <) (83 . -)
              (88 . |ceiling|) (93 . -) (98 . |floor|) (103 . +) (|Void|)
              (|OpenMathDevice|) (109 . |OMputApp|) (|String|)
              (114 . |OMputSymbol|) (121 . |OMwrite|) (128 . |OMputEndApp|)
              (133 . |OMputObject|) (138 . |OMputEndObject|) (143 . |OMwrite|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (150 . |unitNormal|) (155 . *) (161 . |recip|) (166 . |gcd|)
              (172 . /) (178 . +) (184 . -) (190 . -) (196 . *) (|Integer|)
              (202 . |coerce|) (207 . *) (213 . *) (|Mapping| 6 6)
              (219 . |differentiate|) (|Fraction| 55) (225 . |retract|)
              (230 . |retract|) (|Union| 61 '#1="failed")
              (235 . |retractIfCan|) (240 . |retractIfCan|) (245 . |numer|)
              (250 . |retract|) (255 . |denom|) (260 . /) (|Union| 55 '#1#)
              (266 . |retractIfCan|) (|SparseUnivariatePolynomial| $$)
              (271 . |zero?|) (|NonNegativeInteger|) (276 . |degree|)
              (281 . |One|) (|List| $$) (285 . |coefficients|) (290 . |lcm|)
              (296 . *) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 73 6 82)
              (302 . |map|) (|SparseUnivariatePolynomial| $)
              (308 . |gcdPolynomial|) (314 . |degree|)
              (319 . |leadingCoefficient|) (|Mapping| $$ 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 82 $$ 73)
              (324 . |map|) (330 . |gcdPolynomial|) (336 . |charthRoot|)
              (341 . |charthRoot|) (346 . |characteristic|) (350 . -) (356 . ^)
              (|List| 78) (|Matrix| $$) (362 . |listOfLists|) (|List| 136)
              (|Matrix| 6) (367 . |matrix|) (|Union| 140 '#2="failed")
              (|Matrix| $) (372 . |conditionP|) (|Vector| 6) (377 . |elt|)
              (383 . |conditionP|) (|Factored| 73) (388 . |Zero|)
              (|Factored| 86) (392 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 115) (|:| |fctr| 82) (|:| |xpnt| 55))
              (|List| 116) (|Factored| 82) (397 . |factorList|) (402 . ^)
              (408 . /) (414 . |unit|)
              (|Record| (|:| |flg| 115) (|:| |fctr| 73) (|:| |xpnt| 55))
              (|List| 123) (419 . |makeFR|) (425 . |factorPolynomial|)
              (430 . |leadingCoefficient|) (435 . /)
              (441 . |factorSquareFreePolynomial|)
              (446 . |factorSquareFreePolynomial|) (|InputForm|)
              (|Pattern| 148) (|Pattern| 55) (|List| 135) (|Equation| 6)
              (|List| 6) (|Symbol|) (|List| 137)
              (|Record| (|:| |mat| 141) (|:| |vec| (|Vector| 55))) (|Vector| $)
              (|Matrix| 55) (|List| 75) (|PatternMatchResult| 148 $)
              (|PatternMatchResult| 55 $) (|Union| 146 '#2#) (|List| 86)
              (|DoubleFloat|) (|Float|) (|Union| 137 '#1#)
              (|Record| (|:| |mat| 103) (|:| |vec| 108)) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 152 '#3="failed") (|Union| 155 '#3#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 155) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|) (|OutputForm|))
           '#(~= 451 |zero?| 457 |wholePart| 462 |unitNormal| 467
              |unitCanonical| 472 |unit?| 477 |subtractIfCan| 482
              |squareFreePolynomial| 488 |squareFreePart| 493 |squareFree| 498
              |solveLinearPolynomialEquation| 503 |smaller?| 509 |sizeLess?|
              515 |sign| 521 |sample| 526 |rightRecip| 530 |rightPower| 535
              |retractIfCan| 547 |retract| 567 |rem| 587 |reducedSystem| 593
              |recip| 615 |quo| 620 |principalIdeal| 626 |prime?| 631
              |positive?| 636 |patternMatch| 641 |opposite?| 655 |one?| 661
              |numerator| 666 |numer| 671 |nextItem| 676 |negative?| 681
              |multiEuclidean| 686 |min| 692 |max| 698 |map| 704 |leftRecip|
              710 |leftPower| 715 |lcmCoef| 727 |lcm| 733 |latex| 744 |inv| 749
              |init| 754 |hashUpdate!| 758 |hash| 764 |gcdPolynomial| 769 |gcd|
              775 |fractionPart| 786 |floor| 791 |factorSquareFreePolynomial|
              796 |factorPolynomial| 801 |factor| 806 |extendedEuclidean| 811
              |exquo| 824 |expressIdealMember| 830 |eval| 836 |euclideanSize|
              876 |elt| 881 |divide| 887 |differentiate| 893 |denominator| 943
              |denom| 948 |convert| 953 |conditionP| 978 |commutator| 983
              |coerce| 989 |charthRoot| 1019 |characteristic| 1024 |ceiling|
              1028 |associator| 1033 |associates?| 1040 |antiCommutator| 1046
              |annihilate?| 1052 |abs| 1058 ^ 1063 |Zero| 1081 |One| 1085
              |OMwrite| 1089 D 1113 >= 1163 > 1169 = 1175 <= 1181 < 1187 / 1193
              - 1205 + 1216 * 1222)
           'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(0 0 0 1 0 0 0 6 0 0 0 0 0 0 6 0 0 0 0 0 3 4
                                  13 14 15 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0
                                  0 6 0 6 0 0 0 6 0 0 0 0 0 8 0 0 0 29 9 17 25
                                  0 0 5 11 0 0 0 0 0 0 0 0 0 2 27 5 5 7 31 31
                                  10 11 12 16 24 18 23))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |FullyLinearlyExplicitOver&| |DifferentialExtension&|
                |DivisionRing&| NIL NIL |OrderedRing&| NIL |Algebra&|
                |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL |Rng&|
                NIL |Module&| |Module&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |OrderedSet&| |FullyEvalableOver&| |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL |SetCategory&| NIL
                |Evalable&| NIL |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| NIL NIL NIL |PartialOrder&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL NIL |OpenMath&|)
             (CONS
              '#((|QuotientFieldCategory| 6) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 6) (|DifferentialExtension| 6)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|OrderedRing|) (|LinearlyExplicitOver| 6) (|Algebra| 6)
                 (|Algebra| 61) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 137) (|DifferentialRing|)
                 (|LinearlyExplicitOver| 55) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| 6) (|Module| 61) (|Module| $$) (|SemiRng|)
                 (|BiModule| 6 6) (|BiModule| 61 61) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianGroup|)
                 (|RightModule| 6) (|LeftModule| 6) (|RightModule| 61)
                 (|LeftModule| 61) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|FullyPatternMatchable| 6)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|OrderedSet|) (|FullyEvalableOver| 6)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|PatternMatchable| 148) (|PatternMatchable| 55)
                 (|Patternable| 6) (|SetCategory|) (|RealConstant|)
                 (|Evalable| 6) (|Type|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 162) (|RetractableTo| 137)
                 (|ConvertibleTo| 131) (|ConvertibleTo| 147)
                 (|ConvertibleTo| 148) (|PartialOrder|) (|RetractableTo| 61)
                 (|RetractableTo| 55) (|InnerEvalable| 137 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$) (|ConvertibleTo| 132)
                 (|ConvertibleTo| 133) (|Canonical|) (|OpenMath|))
              (|makeByteWordVec2| 162
                                  '(0 0 0 8 0 6 0 9 1 6 11 0 12 2 6 11 0 0 14 2
                                    0 11 0 0 15 2 6 16 16 0 17 2 0 16 16 0 18 1
                                    0 11 0 19 1 0 6 0 20 1 0 21 0 22 2 6 23 0 0
                                    24 2 6 0 0 0 25 1 0 6 0 26 0 0 0 27 0 6 0
                                    28 2 0 11 0 0 29 1 0 0 0 30 1 0 6 0 31 1 6
                                    0 0 32 1 0 6 0 33 2 6 0 0 0 34 1 36 35 0 37
                                    3 36 35 0 38 38 39 3 6 35 36 0 11 40 1 36
                                    35 0 41 1 36 35 0 42 1 36 35 0 43 3 0 35 36
                                    0 11 44 1 6 45 0 46 2 6 0 0 0 47 1 0 23 0
                                    48 2 6 0 0 0 49 2 0 0 6 6 50 2 0 0 0 0 51 2
                                    6 0 0 0 52 2 0 0 0 0 53 2 0 0 0 0 54 1 6 0
                                    55 56 2 0 0 55 0 57 2 0 0 6 0 58 2 0 0 0 59
                                    60 1 6 61 0 62 1 0 61 0 63 1 6 64 0 65 1 0
                                    64 0 66 1 0 6 0 67 1 6 55 0 68 1 0 6 0 69 2
                                    61 0 55 55 70 1 6 71 0 72 1 73 11 0 74 1 73
                                    75 0 76 0 73 0 77 1 73 78 0 79 2 6 0 0 0 80
                                    2 0 0 0 6 81 2 84 82 83 73 85 2 6 86 86 86
                                    87 1 82 75 0 88 1 82 6 0 89 2 91 73 90 82
                                    92 2 0 86 86 86 93 1 6 23 0 94 1 0 23 0 95
                                    0 0 75 96 2 75 0 0 0 97 2 6 0 0 75 98 1 100
                                    99 0 101 1 103 0 102 104 1 6 105 106 107 2
                                    108 6 0 55 109 1 0 105 106 110 0 111 0 112
                                    1 6 113 86 114 1 118 117 0 119 2 0 0 0 55
                                    120 2 0 0 0 0 121 1 118 82 0 122 2 111 0 73
                                    124 125 1 0 113 86 126 1 73 2 0 127 2 73 0
                                    0 2 128 1 6 113 86 129 1 0 113 86 130 2 0
                                    11 0 0 1 1 0 11 0 13 1 21 6 0 26 1 0 45 0 1
                                    1 0 0 0 1 1 0 11 0 1 2 0 23 0 0 1 1 1 113
                                    86 1 1 0 0 0 1 1 0 151 0 1 2 1 145 146 86 1
                                    2 28 11 0 0 1 2 0 11 0 0 1 1 6 55 0 1 0 0 0
                                    1 1 0 23 0 1 2 0 0 0 75 1 2 0 0 0 160 1 1
                                    30 71 0 1 1 30 64 0 66 1 2 149 0 1 1 0 21 0
                                    22 1 30 55 0 1 1 30 61 0 63 1 2 137 0 1 1 0
                                    6 0 20 2 0 0 0 0 1 2 15 139 106 140 1 1 15
                                    141 106 1 1 0 103 106 1 2 0 150 106 140 1 1
                                    0 23 0 48 2 0 0 0 0 1 1 0 158 155 1 1 0 11
                                    0 1 1 6 11 0 1 3 17 143 0 132 143 1 3 20
                                    144 0 133 144 1 2 0 11 0 0 1 1 0 11 0 19 1
                                    0 0 0 1 1 0 6 0 67 1 9 23 0 1 1 6 11 0 1 2
                                    0 154 155 0 1 2 7 0 0 0 1 2 7 0 0 0 1 2 0 0
                                    59 0 1 1 0 23 0 1 2 0 0 0 75 1 2 0 0 0 160
                                    1 2 0 159 0 0 1 2 0 0 0 0 1 1 0 0 155 1 1 0
                                    38 0 1 1 0 0 0 1 0 9 0 1 2 0 16 16 0 18 1 0
                                    161 0 1 2 0 86 86 86 93 2 0 0 0 0 1 1 0 0
                                    155 1 1 21 0 0 1 1 22 6 0 33 1 1 113 86 130
                                    1 1 113 86 126 1 0 151 0 1 3 0 153 0 0 0 1
                                    2 0 156 0 0 1 2 0 23 0 0 1 2 0 154 155 0 1
                                    2 11 0 0 134 1 2 11 0 0 135 1 3 11 0 0 136
                                    136 1 3 11 0 0 6 6 1 3 10 0 0 137 6 1 3 10
                                    0 0 138 136 1 1 0 75 0 1 2 12 0 0 6 1 2 0
                                    157 0 0 1 2 14 0 0 75 1 1 14 0 0 1 3 13 0 0
                                    137 75 1 3 13 0 0 138 142 1 2 13 0 0 138 1
                                    2 13 0 0 137 1 2 0 0 0 59 60 3 0 0 0 59 75
                                    1 1 0 0 0 1 1 0 6 0 69 1 26 131 0 1 1 16
                                    132 0 1 1 19 133 0 1 1 5 147 0 1 1 5 148 0
                                    1 1 32 105 106 110 2 0 0 0 0 1 1 2 0 137 1
                                    1 0 0 6 10 1 0 0 61 1 1 0 0 0 1 1 0 0 55 1
                                    1 0 162 0 1 1 33 23 0 95 0 0 75 96 1 22 6 0
                                    31 3 0 0 0 0 0 1 2 0 11 0 0 1 2 0 0 0 0 1 2
                                    0 11 0 0 1 1 6 0 0 1 2 0 0 0 55 120 2 0 0 0
                                    75 1 2 0 0 0 160 1 0 0 0 27 0 0 0 8 2 23 38
                                    0 11 1 1 23 38 0 1 3 23 35 36 0 11 44 2 23
                                    35 36 0 1 2 14 0 0 75 1 1 14 0 0 1 3 13 0 0
                                    137 75 1 3 13 0 0 138 142 1 2 13 0 0 137 1
                                    2 13 0 0 138 1 3 0 0 0 59 75 1 2 0 0 0 59 1
                                    2 7 11 0 0 1 2 7 11 0 0 1 2 0 11 0 0 15 2 7
                                    11 0 0 1 2 7 11 0 0 29 2 0 0 6 6 50 2 0 0 0
                                    0 121 1 0 0 0 30 2 0 0 0 0 53 2 0 0 0 0 51
                                    2 0 0 0 6 81 2 0 0 6 0 58 2 0 0 61 0 1 2 0
                                    0 0 61 1 2 0 0 75 0 1 2 0 0 55 0 57 2 0 0 0
                                    0 54 2 0 0 160 0 1)))))
           '|lookupComplete|)) 
