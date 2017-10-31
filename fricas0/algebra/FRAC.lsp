
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
          (#3=#:G1428 NIL) (#4=#:G1427 (S)) (#5=#:G1429 (S)) (#6=#:G1438 NIL)
          (|u| NIL) (|ppD| #2#) (|denpp| (S)) (#7=#:G1424 NIL) (#8=#:G1423 (S))
          (#9=#:G1425 (S)) (#10=#:G1437 NIL))
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
        (SPROG ((|ans| (|Union| S #1#)) (#2=#:G1464 NIL))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (PROG1
                                               (LETT #2#
                                                     (-
                                                      (SPADCALL (QREFELT $ 96))
                                                      1)
                                                     . #3=(|FRAC;charthRoot;$U;35|))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT $ 97))
                                 (QREFELT $ 47))
                       (QREFELT $ 94))
                      . #3#)
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT $ 50))))))))) 

(SDEFUN |FRAC;charthRoot;$U;36| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|ans| (|Union| S #1#)) (#2=#:G1485 NIL))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (PROG1
                                               (LETT #2#
                                                     (-
                                                      (SPADCALL (QREFELT $ 96))
                                                      1)
                                                     . #3=(|FRAC;charthRoot;$U;36|))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT $ 97))
                                 (QREFELT $ 47))
                       (QREFELT $ 94))
                      . #3#)
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT $ 50))))))))) 

(SDEFUN |FRAC;clear| ((|l| |List| $) ($ |List| S))
        (SPROG
         ((#1=#:G1495 NIL) (#2=#:G1502 NIL) (|x| NIL) (#3=#:G1501 NIL)
          (|d| (S)) (#4=#:G1492 NIL) (#5=#:G1491 (S)) (#6=#:G1493 (S))
          (#7=#:G1500 NIL))
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
         ((#2=#:G1521 NIL) (#3=#:G1523 NIL) (|i| NIL) (#4=#:G1522 NIL)
          (|ansDD| (|Vector| S)) (|ansD| (|Union| (|Vector| S) #1#))
          (|matD| (|Matrix| S)) (#5=#:G1520 NIL) (|l| NIL) (#6=#:G1519 NIL))
         (SEQ
          (LETT |matD|
                (SPADCALL
                 (PROGN
                  (LETT #6# NIL . #7=(|FRAC;conditionP;MU;38|))
                  (SEQ (LETT |l| NIL . #7#)
                       (LETT #5# (SPADCALL |mat| (QREFELT $ 100)) . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6# (CONS (|FRAC;clear| |l| $) #6#) . #7#)))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 (QREFELT $ 103))
                . #7#)
          (LETT |ansD| (SPADCALL |matD| (QREFELT $ 106)) . #7#)
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
                                                         (QREFELT $ 108))
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
          (|den1| ($)) (|lc| ($)) (#2=#:G1546 NIL) (|w| NIL) (#3=#:G1545 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G1525 NIL) (#5=#:G1524 (S)) (#6=#:G1526 (S)) (#7=#:G1544 NIL)
          (|u| NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 74)) (|spadConstant| $ 111))
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
                  (LETT |ff| (SPADCALL |ppD| (QREFELT $ 113)) . #9#)
                  (LETT |den1| (SPADCALL |denpp| (QREFELT $ 10)) . #9#)
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL . #9#)
                         (SEQ (LETT |w| NIL . #9#)
                              (LETT #2# (SPADCALL |ff| (QREFELT $ 118)) . #9#)
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
                                                                            119))
                                                                  (QREFELT $
                                                                           120))
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
                     (SPADCALL |ff| (QREFELT $ 121)) (QREFELT $ 92))
                    |lfact| (QREFELT $ 124))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;39!2| ((|x| NIL) ($$ NIL))
        (PROG ($ |den1|)
          (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;39|))
          (LETT |den1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 120)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;39!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |lc|)
          (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;39|))
          (LETT |lc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 120)))))) 

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
          (|den1| ($)) (|lc| ($)) (#2=#:G1571 NIL) (|w| NIL) (#3=#:G1570 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G1551 NIL) (#5=#:G1550 (S)) (#6=#:G1552 (S)) (#7=#:G1569 NIL)
          (|u| NIL) (|lcpp| ($)))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 74)) (|spadConstant| $ 111))
                ((EQL (SPADCALL |pp| (QREFELT $ 76)) 0)
                 (SPADCALL |pp| NIL (QREFELT $ 124)))
                (#8='T
                 (SEQ
                  (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 126))
                        . #9=(|FRAC;factorSquareFreePolynomial;SupF;40|))
                  (LETT |pp| (SPADCALL |pp| |lcpp| (QREFELT $ 127)) . #9#)
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
                  (LETT |ff| (SPADCALL |ppD| (QREFELT $ 128)) . #9#)
                  (LETT |den1|
                        (SPADCALL (SPADCALL |denpp| (QREFELT $ 10)) |lcpp|
                                  (QREFELT $ 120))
                        . #9#)
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL . #9#)
                         (SEQ (LETT |w| NIL . #9#)
                              (LETT #2# (SPADCALL |ff| (QREFELT $ 118)) . #9#)
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
                                                                            119))
                                                                  (QREFELT $
                                                                           120))
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
                     (SPADCALL |ff| (QREFELT $ 121)) (QREFELT $ 92))
                    |lfact| (QREFELT $ 124))))))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;40!2| ((|x| NIL) ($$ NIL))
        (PROG ($ |den1|)
          (LETT $ (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;40|))
          (LETT |den1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 120)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;40!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |lc|)
          (LETT $ (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;40|))
          (LETT |lc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 120)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;40!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;40|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 81)) (QREFELT $ 20)))))) 

(DECLAIM (NOTINLINE |Fraction;|)) 

(DEFUN |Fraction| (#1=#:G1596)
  (SPROG NIL
         (PROG (#2=#:G1597)
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
   ((|pv$| NIL) (#1=#:G1591 NIL) (#2=#:G1592 NIL) (#3=#:G1593 NIL)
    (#4=#:G1595 NIL) (#5=#:G1594 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|Fraction|))
    (LETT |dv$| (LIST '|Fraction| DV$1) . #6#)
    (LETT $ (GETREFV 162) . #6#)
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
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
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
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #4#)
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
         (|augmentPredVector| $ 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 8589934592))
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
     ((|testBitVector| |pv$| 31)
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
          (QSETREFV $ 109
                    (CONS (|dispatchFunction| |FRAC;conditionP;MU;38|) $)))))
       (QSETREFV $ 125
                 (CONS (|dispatchFunction| |FRAC;factorPolynomial;SupF;39|) $))
       (QSETREFV $ 129
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
              (341 . |charthRoot|) (346 . |characteristic|) (350 . ^)
              (|List| 78) (|Matrix| $$) (356 . |listOfLists|) (|List| 135)
              (|Matrix| 6) (361 . |matrix|) (|Union| 139 '#2="failed")
              (|Matrix| $) (366 . |conditionP|) (|Vector| 6) (371 . |elt|)
              (377 . |conditionP|) (|Factored| 73) (382 . |Zero|)
              (|Factored| 86) (386 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 114) (|:| |fctr| 82) (|:| |xpnt| 55))
              (|List| 115) (|Factored| 82) (391 . |factorList|) (396 . ^)
              (402 . /) (408 . |unit|)
              (|Record| (|:| |flg| 114) (|:| |fctr| 73) (|:| |xpnt| 55))
              (|List| 122) (413 . |makeFR|) (419 . |factorPolynomial|)
              (424 . |leadingCoefficient|) (429 . /)
              (435 . |factorSquareFreePolynomial|)
              (440 . |factorSquareFreePolynomial|) (|InputForm|)
              (|Pattern| 146) (|Pattern| 55) (|List| 134) (|Equation| 6)
              (|List| 6) (|Symbol|) (|List| 136)
              (|Record| (|:| |mat| 140) (|:| |vec| (|Vector| 55))) (|Vector| $)
              (|Matrix| 55) (|List| 75) (|PatternMatchResult| 146 $)
              (|PatternMatchResult| 55 $) (|Union| 145 '#2#) (|List| 86)
              (|Float|) (|DoubleFloat|) (|Union| 136 '#1#)
              (|Record| (|:| |mat| 102) (|:| |vec| 107)) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 151 '#3="failed") (|Union| 154 '#3#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 154) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|) (|OutputForm|))
           '#(~= 445 |zero?| 451 |wholePart| 456 |unitNormal| 461
              |unitCanonical| 466 |unit?| 471 |subtractIfCan| 476
              |squareFreePolynomial| 482 |squareFreePart| 487 |squareFree| 492
              |solveLinearPolynomialEquation| 497 |smaller?| 503 |sizeLess?|
              509 |sign| 515 |sample| 520 |retractIfCan| 524 |retract| 544
              |rem| 564 |reducedSystem| 570 |recip| 592 |quo| 597
              |principalIdeal| 603 |prime?| 608 |positive?| 613 |patternMatch|
              618 |opposite?| 632 |one?| 638 |numerator| 643 |numer| 648
              |nextItem| 653 |negative?| 658 |multiEuclidean| 663 |min| 669
              |max| 675 |map| 681 |lcmCoef| 687 |lcm| 693 |latex| 704 |inv| 709
              |init| 714 |hashUpdate!| 718 |hash| 724 |gcdPolynomial| 729 |gcd|
              735 |fractionPart| 746 |floor| 751 |factorSquareFreePolynomial|
              756 |factorPolynomial| 761 |factor| 766 |extendedEuclidean| 771
              |exquo| 784 |expressIdealMember| 790 |eval| 796 |euclideanSize|
              836 |elt| 841 |divide| 847 |differentiate| 853 |denominator| 903
              |denom| 908 |convert| 913 |conditionP| 938 |coerce| 943
              |charthRoot| 973 |characteristic| 978 |ceiling| 982 |associates?|
              987 |annihilate?| 993 |abs| 999 ^ 1004 |Zero| 1022 |One| 1026
              |OMwrite| 1030 D 1054 >= 1104 > 1110 = 1116 <= 1122 < 1128 / 1134
              - 1146 + 1157 * 1163)
           'NIL
           (CONS
            (|makeByteWordVec2| 32
                                '(0 0 0 1 0 0 0 6 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0
                                  3 4 13 14 24 0 0 0 0 6 0 0 0 0 0 0 0 6 0 6 0
                                  0 6 0 0 0 0 8 0 0 0 30 9 16 26 0 0 5 11 0 0 0
                                  0 0 0 0 0 0 2 28 5 5 7 32 32 10 11 12 15 25
                                  17 23))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL |FullyLinearlyExplicitOver&| |DifferentialExtension&|
                |Algebra&| |Algebra&| NIL |Algebra&| |OrderedRing&| NIL
                |Module&| |Module&| NIL |EntireRing&| |Module&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| NIL NIL |AbelianGroup&|
                NIL NIL NIL NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |OrderedSet&| |FullyEvalableOver&| |SemiGroup&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL |SetCategory&| NIL
                |Evalable&| NIL |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| NIL NIL NIL |PartialOrder&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL NIL |OpenMath&|)
             (CONS
              '#((|QuotientFieldCategory| 6) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 6) (|DifferentialExtension| 6)
                 (|Algebra| 6) (|Algebra| 61) (|LeftOreRing|) (|Algebra| $$)
                 (|OrderedRing|) (|LinearlyExplicitOver| 6) (|Module| 6)
                 (|Module| 61) (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 136) (|DifferentialRing|)
                 (|LinearlyExplicitOver| 55) (|BiModule| 6 6)
                 (|BiModule| 61 61) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedAbelianGroup|) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| 61) (|LeftModule| 61) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|OrderedAbelianSemiGroup|) (|FullyPatternMatchable| 6)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver| 6) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|) (|PatternMatchable| 146)
                 (|PatternMatchable| 55) (|Patternable| 6) (|SetCategory|)
                 (|RealConstant|) (|Evalable| 6) (|Type|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 161) (|RetractableTo| 136)
                 (|ConvertibleTo| 130) (|ConvertibleTo| 147)
                 (|ConvertibleTo| 146) (|PartialOrder|) (|RetractableTo| 61)
                 (|RetractableTo| 55) (|InnerEvalable| 136 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$) (|ConvertibleTo| 131)
                 (|ConvertibleTo| 132) (|Canonical|) (|OpenMath|))
              (|makeByteWordVec2| 161
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
                                    0 0 75 96 2 6 0 0 75 97 1 99 98 0 100 1 102
                                    0 101 103 1 6 104 105 106 2 107 6 0 55 108
                                    1 0 104 105 109 0 110 0 111 1 6 112 86 113
                                    1 117 116 0 118 2 0 0 0 55 119 2 0 0 0 0
                                    120 1 117 82 0 121 2 110 0 73 123 124 1 0
                                    112 86 125 1 73 2 0 126 2 73 0 0 2 127 1 6
                                    112 86 128 1 0 112 86 129 2 0 11 0 0 1 1 0
                                    11 0 13 1 21 6 0 26 1 0 45 0 1 1 0 0 0 1 1
                                    0 11 0 1 2 0 23 0 0 1 1 1 112 86 1 1 0 0 0
                                    1 1 0 150 0 1 2 1 144 145 86 1 2 29 11 0 0
                                    1 2 0 11 0 0 1 1 6 55 0 1 0 0 0 1 1 31 71 0
                                    1 1 31 64 0 66 1 2 148 0 1 1 0 21 0 22 1 31
                                    55 0 1 1 31 61 0 63 1 2 136 0 1 1 0 6 0 20
                                    2 0 0 0 0 1 2 18 138 105 139 1 1 18 140 105
                                    1 2 0 149 105 139 1 1 0 102 105 1 1 0 23 0
                                    48 2 0 0 0 0 1 1 0 157 154 1 1 0 11 0 1 1 6
                                    11 0 1 3 16 142 0 131 142 1 3 20 143 0 132
                                    143 1 2 0 11 0 0 1 1 0 11 0 19 1 0 0 0 1 1
                                    0 6 0 67 1 9 23 0 1 1 6 11 0 1 2 0 153 154
                                    0 1 2 7 0 0 0 1 2 7 0 0 0 1 2 0 0 59 0 1 2
                                    0 158 0 0 1 2 0 0 0 0 1 1 0 0 154 1 1 0 38
                                    0 1 1 0 0 0 1 0 9 0 1 2 0 16 16 0 18 1 0
                                    160 0 1 2 0 86 86 86 93 2 0 0 0 0 1 1 0 0
                                    154 1 1 21 0 0 1 1 22 6 0 33 1 1 112 86 129
                                    1 1 112 86 125 1 0 150 0 1 3 0 152 0 0 0 1
                                    2 0 155 0 0 1 2 0 23 0 0 1 2 0 153 154 0 1
                                    2 11 0 0 133 1 3 11 0 0 6 6 1 2 11 0 0 134
                                    1 3 11 0 0 135 135 1 3 10 0 0 136 6 1 3 10
                                    0 0 137 135 1 1 0 75 0 1 2 12 0 0 6 1 2 0
                                    156 0 0 1 2 14 0 0 75 1 1 14 0 0 1 3 13 0 0
                                    137 141 1 2 13 0 0 137 1 3 13 0 0 136 75 1
                                    2 13 0 0 136 1 2 0 0 0 59 60 3 0 0 0 59 75
                                    1 1 0 0 0 1 1 0 6 0 69 1 27 130 0 1 1 15
                                    131 0 1 1 19 132 0 1 1 5 146 0 1 1 5 147 0
                                    1 1 33 104 105 109 1 2 0 136 1 1 0 0 6 10 1
                                    0 0 61 1 1 0 0 55 1 1 0 0 0 1 1 0 161 0 1 1
                                    34 23 0 95 0 0 75 96 1 22 6 0 31 2 0 11 0 0
                                    1 2 0 11 0 0 1 1 6 0 0 1 2 0 0 0 55 119 2 0
                                    0 0 75 1 2 0 0 0 159 1 0 0 0 27 0 0 0 8 2
                                    23 38 0 11 1 1 23 38 0 1 3 23 35 36 0 11 44
                                    2 23 35 36 0 1 2 14 0 0 75 1 1 14 0 0 1 3
                                    13 0 0 137 141 1 2 13 0 0 137 1 3 13 0 0
                                    136 75 1 2 13 0 0 136 1 2 0 0 0 59 1 3 0 0
                                    0 59 75 1 2 7 11 0 0 1 2 7 11 0 0 1 2 0 11
                                    0 0 15 2 7 11 0 0 1 2 7 11 0 0 29 2 0 0 6 6
                                    50 2 0 0 0 0 120 1 0 0 0 30 2 0 0 0 0 53 2
                                    0 0 0 0 51 2 0 0 6 0 58 2 0 0 0 6 81 2 0 0
                                    61 0 1 2 0 0 0 61 1 2 0 0 55 0 57 2 0 0 0 0
                                    54 2 0 0 75 0 1 2 0 0 159 0 1)))))
           '|lookupComplete|)) 
