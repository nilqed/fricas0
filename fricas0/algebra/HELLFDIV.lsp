
(SDEFUN |HELLFDIV;Zero;$;1| (($ $))
        (SPADCALL (|spadConstant| $ 29) (QREFELT $ 30))) 

(SDEFUN |HELLFDIV;divisor;R$;2| ((|g| R) ($ $))
        (VECTOR (|spadConstant| $ 32) (|spadConstant| $ 33) |g| 'T)) 

(PUT '|HELLFDIV;makeDivisor| '|SPADreplace|
     '(XLAM (|a| |b| |g|) (VECTOR |a| |b| |g| NIL))) 

(SDEFUN |HELLFDIV;makeDivisor| ((|a| UP) (|b| UP) (|g| R) ($ $))
        (VECTOR |a| |b| |g| NIL)) 

(SDEFUN |HELLFDIV;princ?| ((|d| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QVELT |d| 0) (|spadConstant| $ 32) (QREFELT $ 35))
          (SPADCALL (QVELT |d| 1) (QREFELT $ 36)))
         ('T NIL))) 

(SDEFUN |HELLFDIV;ideal;$Fi;5|
        ((|d| $) ($ |FractionalIdeal| UP (|Fraction| UP) UPUP R))
        (SPADCALL (SPADCALL (VECTOR (QVELT |d| 2)) (QREFELT $ 39))
                  (|HELLFDIV;mkIdeal| (QVELT |d| 0) (QVELT |d| 1) $)
                  (QREFELT $ 40))) 

(SDEFUN |HELLFDIV;decompose;$R;6|
        ((|d| $)
         ($ |Record| (|:| |id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|:| |principalPart| R)))
        (CONS
         (SPADCALL
          (|HELLFDIV;makeDivisor| (QVELT |d| 0) (QVELT |d| 1)
           (|spadConstant| $ 29) $)
          (QREFELT $ 41))
         (QVELT |d| 2))) 

(SDEFUN |HELLFDIV;mkIdeal|
        ((|a| UP) (|b| UP) ($ |FractionalIdeal| UP (|Fraction| UP) UPUP R))
        (SPADCALL
         (VECTOR (SPADCALL (SPADCALL |a| (QREFELT $ 45)) (QREFELT $ 46))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 47) 1 (QREFELT $ 48))
                            (SPADCALL (SPADCALL |b| (QREFELT $ 45))
                                      (QREFELT $ 49))
                            (QREFELT $ 50))
                  (QREFELT $ 51)))
         (QREFELT $ 39))) 

(SDEFUN |HELLFDIV;+;3$;8| ((|d1| $) (|d2| $) ($ $))
        (SPROG
         ((|dd| ($)) (|b| (UP)) (#1=#:G708 NIL) (|a| (UP)) (|h| #2=(|List| UP))
          (|d| (UP)) (|rec| (|Record| (|:| |coef| #2#) (|:| |generator| UP)))
          (|b2| (UP)) (|b1| (UP)) (|a2| (UP)) (|a1| (UP)))
         (SEQ (LETT |a1| (QVELT |d1| 0) . #3=(|HELLFDIV;+;3$;8|))
              (LETT |a2| (QVELT |d2| 0) . #3#) (LETT |b1| (QVELT |d1| 1) . #3#)
              (LETT |b2| (QVELT |d2| 1) . #3#)
              (LETT |rec|
                    (SPADCALL
                     (LIST |a1| |a2| (SPADCALL |b1| |b2| (QREFELT $ 52)))
                     (QREFELT $ 55))
                    . #3#)
              (LETT |d| (QCDR |rec|) . #3#) (LETT |h| (QCAR |rec|) . #3#)
              (LETT |a|
                    (PROG2
                        (LETT #1#
                              (SPADCALL (SPADCALL |a1| |a2| (QREFELT $ 57))
                                        (SPADCALL |d| 2 (QREFELT $ 59))
                                        (QREFELT $ 60))
                              . #3#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #4="failed") #1#))
                    . #3#)
              (LETT |b|
                    (SPADCALL (SPADCALL (|SPADfirst| |h|) |a1| (QREFELT $ 57))
                              |b2| (QREFELT $ 57))
                    . #3#)
              (LETT |b|
                    (SPADCALL |b|
                              (SPADCALL
                               (SPADCALL (SPADCALL |h| (QREFELT $ 62)) |a2|
                                         (QREFELT $ 57))
                               |b1| (QREFELT $ 57))
                              (QREFELT $ 52))
                    . #3#)
              (LETT |b|
                    (SPADCALL |b|
                              (SPADCALL (SPADCALL |h| (QREFELT $ 63))
                                        (SPADCALL
                                         (SPADCALL |b1| |b2| (QREFELT $ 57))
                                         (QREFELT $ 15) (QREFELT $ 52))
                                        (QREFELT $ 57))
                              (QREFELT $ 52))
                    . #3#)
              (LETT |b|
                    (SPADCALL
                     (PROG2 (LETT #1# (SPADCALL |b| |d| (QREFELT $ 60)) . #3#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                       (|Union| (QREFELT $ 7) #4#) #1#))
                     |a| (QREFELT $ 64))
                    . #3#)
              (LETT |dd|
                    (|HELLFDIV;makeDivisor| |a| |b|
                     (SPADCALL
                      (SPADCALL (SPADCALL |d| (QREFELT $ 45)) (QVELT |d1| 2)
                                (QREFELT $ 65))
                      (QVELT |d2| 2) (QREFELT $ 66))
                     $)
                    . #3#)
              (COND
               ((QVELT |d1| 3)
                (COND ((QVELT |d2| 3) (EXIT (SPADCALL |dd| (QREFELT $ 67)))))))
              (EXIT |dd|)))) 

(SDEFUN |HELLFDIV;*;I2$;9| ((|n| |Integer|) (|d| $) ($ $))
        (COND ((ZEROP |n|) (|spadConstant| $ 31))
              ((< |n| 0)
               (SPADCALL (- |n|) (SPADCALL |d| (QREFELT $ 70)) (QREFELT $ 71)))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QVELT |d| 2) |n| (QREFELT $ 72))
                          (QREFELT $ 30))
                (SPADCALL
                 (SPADCALL (|HELLFDIV;mkIdeal| (QVELT |d| 0) (QVELT |d| 1) $)
                           |n| (QREFELT $ 73))
                 (QREFELT $ 74))
                (QREFELT $ 68))))) 

(SDEFUN |HELLFDIV;divisor;Fi$;10|
        ((|i| |FractionalIdeal| UP (|Fraction| UP) UPUP R) ($ $))
        (SPROG
         ((|w| (|Union| UP "failed")) (|u| (|Union| UP "failed")) (|h| (R))
          (|a| (R)) (|n| (|NonNegativeInteger|)) (|v| (|Vector| R)))
         (SEQ
          (LETT |n|
                (QVSIZE
                 (LETT |v|
                       (SPADCALL (SPADCALL |i| (QREFELT $ 75)) (QREFELT $ 76))
                       . #1=(|HELLFDIV;divisor;Fi$;10|)))
                . #1#)
          (EXIT
           (COND
            ((EQL |n| 1)
             (SPADCALL
              (SPADCALL |v| (SPADCALL |v| (QREFELT $ 77)) (QREFELT $ 78))
              (QREFELT $ 30)))
            ((SPADCALL |n| 2 (QREFELT $ 79))
             (|error|
              #2="divisor: incomplete implementation for hyperelliptic curves"))
            (#3='T
             (SEQ
              (LETT |a|
                    (SPADCALL |v| (SPADCALL |v| (QREFELT $ 77)) (QREFELT $ 78))
                    . #1#)
              (LETT |h| (SPADCALL |v| (QVSIZE |v|) (QREFELT $ 78)) . #1#)
              (LETT |u| (|HELLFDIV;polyIfCan| |a| $) . #1#)
              (EXIT
               (COND
                ((QEQCAR |u| 0)
                 (SEQ
                  (LETT |w| (|HELLFDIV;redpolyIfCan| |h| (QCDR |u|) $) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |w| 0)
                     (|HELLFDIV;makeDivisor| (QCDR |u|) (QCDR |w|)
                      (|spadConstant| $ 29) $))
                    (#3# (|error| #2#))))))
                (#3#
                 (SEQ (LETT |u| (|HELLFDIV;polyIfCan| |h| $) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 0)
                         (SEQ
                          (LETT |w| (|HELLFDIV;redpolyIfCan| |a| (QCDR |u|) $)
                                . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |w| 0)
                             (|HELLFDIV;makeDivisor| (QCDR |u|) (QCDR |w|)
                              (|spadConstant| $ 29) $))
                            (#3# (|error| #2#))))))
                        (#3# (|error| #2#))))))))))))))) 

(SDEFUN |HELLFDIV;polyIfCan| ((|a| R) ($ |Union| UP "failed"))
        (SPROG
         ((|v| (|Union| UP "failed")) (|u| (|Union| (|Fraction| UP) "failed")))
         (SEQ
          (LETT |u| (SPADCALL |a| (QREFELT $ 81)) . #1=(|HELLFDIV;polyIfCan|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 (#2='T
                  (SEQ (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 82)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                              (#2# (CONS 0 (QCDR |v|)))))))))))) 

(SDEFUN |HELLFDIV;redpolyIfCan| ((|h| R) (|a| UP) ($ |Union| UP "failed"))
        (SPROG
         ((#1=#:G708 NIL)
          (|rec|
           (|Record| (|:| |coef1| UP) (|:| |coef2| UP) (|:| |generator| UP)))
          (|q| (|Fraction| UP)) (|p| (UPUP)))
         (SEQ
          (COND
           ((SPADCALL
             (SPADCALL
              (LETT |p| (SPADCALL |h| (QREFELT $ 83))
                    . #2=(|HELLFDIV;redpolyIfCan|))
              (QREFELT $ 84))
             1 (QREFELT $ 85))
            (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |q|
                   (SPADCALL
                    (SPADCALL (SPADCALL |p| 0 (QREFELT $ 86))
                              (SPADCALL |p| 1 (QREFELT $ 86)) (QREFELT $ 87))
                    (QREFELT $ 88))
                   . #2#)
             (LETT |rec|
                   (SPADCALL (SPADCALL |q| (QREFELT $ 89)) |a| (QREFELT $ 91))
                   . #2#)
             (COND
              ((NULL (SPADCALL (QVELT |rec| 2) (QREFELT $ 92)))
               (EXIT (CONS 1 "failed"))))
             (EXIT
              (CONS 0
                    (SPADCALL
                     (PROG2
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (SPADCALL |q| (QREFELT $ 93))
                                          (QVELT |rec| 0) (QREFELT $ 57))
                                (QVELT |rec| 2) (QREFELT $ 60))
                               . #2#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                       (|Union| (QREFELT $ 7) "failed") #1#))
                     |a| (QREFELT $ 64)))))))))) 

(SDEFUN |HELLFDIV;coerce;$Of;13| ((|d| $) ($ |OutputForm|))
        (SPROG ((|z| (|Boolean|)) (|g| (|OutputForm|)) (|r| (|OutputForm|)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (LIST (SPADCALL (QVELT |d| 0) (QREFELT $ 94))
                             (SPADCALL (QVELT |d| 1) (QREFELT $ 94)))
                       (QREFELT $ 95))
                      . #1=(|HELLFDIV;coerce;$Of;13|))
                (LETT |g|
                      (SPADCALL (QREFELT $ 26)
                                (LIST (SPADCALL (QVELT |d| 2) (QREFELT $ 96)))
                                (QREFELT $ 97))
                      . #1#)
                (LETT |z|
                      (SPADCALL (QVELT |d| 2) (|spadConstant| $ 29)
                                (QREFELT $ 98))
                      . #1#)
                (EXIT
                 (COND
                  ((|HELLFDIV;princ?| |d| $)
                   (COND (|z| (QREFELT $ 28)) (#2='T |g|)))
                  (|z| |r|) (#2# (SPADCALL |r| |g| (QREFELT $ 99)))))))) 

(SDEFUN |HELLFDIV;reduce;2$;14| ((|d| $) ($ $))
        (SPROG
         ((|g| (R)) (|b0| (UP)) (|a0| (UP)) (#1=#:G708 NIL) (|b| (UP))
          (|a| (UP)))
         (SEQ
          (COND ((QVELT |d| 3) |d|)
                ((SPADCALL
                  (SPADCALL
                   (LETT |a| (QVELT |d| 0) . #2=(|HELLFDIV;reduce;2$;14|))
                   (QREFELT $ 17))
                  (QREFELT $ 22) (QREFELT $ 101))
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT $ 92))
                    (COND
                     ((NULL
                       (SPADCALL |a| (|spadConstant| $ 32) (QREFELT $ 35)))
                      (EXIT
                       (SPADCALL
                        (|HELLFDIV;makeDivisor| (|spadConstant| $ 32)
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (QVELT |d| 1) |a| (QREFELT $ 60))
                                   . #2#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                           (|Union| (QREFELT $ 7) #3="failed")
                                           #1#))
                         (SPADCALL (QVELT |d| 2)
                                   (SPADCALL (SPADCALL |a| (QREFELT $ 45))
                                             (QREFELT $ 46))
                                   (QREFELT $ 102))
                         $)
                        (QREFELT $ 67)))))))
                  (QSETVELT |d| 3 'T) (EXIT |d|)))
                ('T
                 (SEQ (LETT |b| (QVELT |d| 1) . #2#)
                      (LETT |a0|
                            (PROG2
                                (LETT #1#
                                      (SPADCALL
                                       (SPADCALL (QREFELT $ 15)
                                                 (SPADCALL |b| 2
                                                           (QREFELT $ 59))
                                                 (QREFELT $ 103))
                                       |a| (QREFELT $ 60))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                              (|Union| (QREFELT $ 7) #3#) #1#))
                            . #2#)
                      (LETT |b0|
                            (SPADCALL (SPADCALL |b| (QREFELT $ 104)) |a0|
                                      (QREFELT $ 64))
                            . #2#)
                      (LETT |g|
                            (SPADCALL
                             (SPADCALL (QVELT |d| 2)
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| (QREFELT $ 45))
                                          (QREFELT $ 49))
                                         (SPADCALL (|spadConstant| $ 47) 1
                                                   (QREFELT $ 48))
                                         (QREFELT $ 50))
                                        (QREFELT $ 51))
                                       (QREFELT $ 66))
                             (SPADCALL (SPADCALL |a0| (QREFELT $ 45))
                                       (QREFELT $ 46))
                             (QREFELT $ 102))
                            . #2#)
                      (EXIT
                       (SPADCALL (|HELLFDIV;makeDivisor| |a0| |b0| |g| $)
                                 (QREFELT $ 67))))))))) 

(SDEFUN |HELLFDIV;generator;$U;15| ((|d| $) ($ |Union| R "failed"))
        (SEQ
         (LETT |d| (SPADCALL |d| (QREFELT $ 67)) |HELLFDIV;generator;$U;15|)
         (EXIT
          (COND ((|HELLFDIV;princ?| |d| $) (CONS 0 (QVELT |d| 2)))
                ('T (CONS 1 "failed")))))) 

(SDEFUN |HELLFDIV;-;2$;16| ((|d| $) ($ $))
        (SPROG ((|di| ($)) (|a| (UP)))
               (SEQ (LETT |a| (QVELT |d| 0) . #1=(|HELLFDIV;-;2$;16|))
                    (LETT |di|
                          (|HELLFDIV;makeDivisor| |a|
                           (SPADCALL (QVELT |d| 1) (QREFELT $ 104))
                           (SPADCALL
                            (SPADCALL (SPADCALL |a| (QREFELT $ 45))
                                      (QVELT |d| 2) (QREFELT $ 65))
                            (QREFELT $ 107))
                           $)
                          . #1#)
                    (QSETVELT |di| 3 (QVELT |d| 3)) (EXIT |di|)))) 

(SDEFUN |HELLFDIV;=;2$B;17| ((|d1| $) (|d2| $) ($ |Boolean|))
        (SEQ
         (LETT |d1| (SPADCALL |d1| (QREFELT $ 67)) . #1=(|HELLFDIV;=;2$B;17|))
         (LETT |d2| (SPADCALL |d2| (QREFELT $ 67)) . #1#)
         (EXIT
          (COND
           ((SPADCALL (QVELT |d1| 0) (QVELT |d2| 0) (QREFELT $ 35))
            (COND
             ((SPADCALL (QVELT |d1| 1) (QVELT |d2| 1) (QREFELT $ 35))
              (SPADCALL (QVELT |d1| 2) (QVELT |d2| 2) (QREFELT $ 98)))
             (#2='T NIL)))
           (#2# NIL))))) 

(SDEFUN |HELLFDIV;divisor;2F$;18| ((|a| F) (|b| F) ($ $))
        (SPROG ((|d| (UP)) (|x| (UP)))
               (SEQ
                (LETT |x| (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 109))
                      . #1=(|HELLFDIV;divisor;2F$;18|))
                (COND
                 ((NULL
                   (SPADCALL
                    (SPADCALL
                     (LETT |d|
                           (SPADCALL |x| (SPADCALL |a| (QREFELT $ 110))
                                     (QREFELT $ 103))
                           . #1#)
                     (SPADCALL (SPADCALL (QREFELT $ 111)) (QREFELT $ 112))
                     (QREFELT $ 113))
                    (QREFELT $ 92)))
                  (EXIT (|error| "divisor: point is singular"))))
                (EXIT
                 (|HELLFDIV;makeDivisor| |d| (SPADCALL |b| (QREFELT $ 110))
                  (|spadConstant| $ 29) $))))) 

(SDEFUN |HELLFDIV;intReduce| ((|h| R) (|b| UP) ($ R))
        (SPROG
         ((#1=#:G813 NIL) (#2=#:G815 NIL) (|i| NIL) (#3=#:G814 NIL)
          (|v| (|Vector| UP)))
         (SEQ
          (LETT |v| (QCAR (SPADCALL |h| (QREFELT $ 116)))
                . #4=(|HELLFDIV;intReduce|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #3#
                   (GETREFV
                    (|inc_SI|
                     (- #5=(QVSIZE |v|) #6=(SPADCALL |v| (QREFELT $ 118)))))
                   . #4#)
             (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                  G190 (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (QAREF1O |v| |i| 1) |b|
                                      (QREFELT $ 64)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            (|spadConstant| $ 32) (QREFELT $ 119)))))) 

(SDEFUN |HELLFDIV;divisor;R3UPF$;20|
        ((|h| R) (|a| UP) (|dp| UP) (|g| UP) (|r| F) ($ $))
        (SPROG
         ((|bb| (UP)) (#1=#:G708 NIL)
          (|rec|
           (|Record| (|:| |coef1| UP) (|:| |coef2| UP) (|:| |generator| UP)))
          (|b| (|Fraction| UP)) (|hh| (UPUP)))
         (SEQ
          (LETT |h|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL |r| |dp| (QREFELT $ 120))
                                     (QREFELT $ 45))
                           (QREFELT $ 46))
                          (QREFELT $ 121))
                . #2=(|HELLFDIV;divisor;R3UPF$;20|))
          (LETT |a|
                (SPADCALL |a|
                          (SPADCALL (SPADCALL |h| (QREFELT $ 122))
                                    (QREFELT $ 112))
                          (QREFELT $ 113))
                . #2#)
          (LETT |h| (|HELLFDIV;intReduce| |h| |a| $) . #2#)
          (COND
           ((NULL (SPADCALL (SPADCALL |g| |a| (QREFELT $ 113)) (QREFELT $ 92)))
            (LETT |h|
                  (|HELLFDIV;intReduce|
                   (SPADCALL |h| (SPADCALL (QREFELT $ 123)) (QREFELT $ 124))
                   |a| $)
                  . #2#)))
          (LETT |hh| (SPADCALL |h| (QREFELT $ 83)) . #2#)
          (LETT |b|
                (SPADCALL
                 (SPADCALL (SPADCALL |hh| 0 (QREFELT $ 86))
                           (SPADCALL |hh| 1 (QREFELT $ 86)) (QREFELT $ 87))
                 (QREFELT $ 88))
                . #2#)
          (LETT |rec|
                (SPADCALL (SPADCALL |b| (QREFELT $ 89)) |a| (QREFELT $ 91))
                . #2#)
          (COND
           ((NULL (SPADCALL (QVELT |rec| 2) (QREFELT $ 92)))
            (EXIT
             (|error|
              "divisor: incomplete implementation for hyperelliptic curves"))))
          (LETT |bb|
                (SPADCALL
                 (PROG2
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |b| (QREFELT $ 93))
                                      (QVELT |rec| 0) (QREFELT $ 57))
                            (QVELT |rec| 2) (QREFELT $ 60))
                           . #2#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                   (|Union| (QREFELT $ 7) "failed") #1#))
                 |a| (QREFELT $ 64))
                . #2#)
          (EXIT
           (SPADCALL (|HELLFDIV;makeDivisor| |a| |bb| (|spadConstant| $ 29) $)
                     (QREFELT $ 67)))))) 

(DECLAIM (NOTINLINE |HyperellipticFiniteDivisor;|)) 

(DEFUN |HyperellipticFiniteDivisor| (&REST #1=#:G822)
  (SPROG NIL
         (PROG (#2=#:G823)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|HyperellipticFiniteDivisor|)
                                               '|domainEqualList|)
                    . #3=(|HyperellipticFiniteDivisor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |HyperellipticFiniteDivisor;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|HyperellipticFiniteDivisor|)))))))))) 

(DEFUN |HyperellipticFiniteDivisor;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G719 NIL) (#2=#:G708 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL)
    (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|HyperellipticFiniteDivisor|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT DV$3 (|devaluate| |#3|) . #3#)
    (LETT DV$4 (|devaluate| |#4|) . #3#)
    (LETT |dv$| (LIST '|HyperellipticFiniteDivisor| DV$1 DV$2 DV$3 DV$4) . #3#)
    (LETT $ (GETREFV 129) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #3#))
    (|haddProp| |$ConstructorCache| '|HyperellipticFiniteDivisor|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
    (QSETREFV $ 13 (QREFELT $ 12))
    (COND
     ((QEQCAR (QREFELT $ 12) 1)
      (|error| "HyperellipticFiniteDivisor: curve must be hyperelliptic")))
    (QSETREFV $ 14
              (|Record| (|:| |center| |#2|) (|:| |polyPart| |#2|)
                        (|:| |principalPart| |#4|)
                        (|:| |reduced?| (|Boolean|))))
    (QSETREFV $ 15
              (PROG2 (LETT #2# (QREFELT $ 13) . #3#)
                  (QCDR #2#)
                (|check_union2| (QEQCAR #2# 0) |#2| (|Union| |#2| #4="failed")
                                #2#)))
    (QSETREFV $ 22
              (PROG2
                  (LETT #1#
                        (SPADCALL
                         (- (SPADCALL (QREFELT $ 15) (QREFELT $ 17)) 1) 2
                         (QREFELT $ 21))
                        . #3#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                (|Union| (|Integer|) #4#) #1#)))
    (QSETREFV $ 26 (SPADCALL '|div| (QREFELT $ 25)))
    (QSETREFV $ 28 (SPADCALL 0 (QREFELT $ 27)))
    $))) 

(MAKEPROP '|HyperellipticFiniteDivisor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Union| 7 '"failed")
              (0 . |hyperelliptic|) '|#G1| '|uhyper| '|Rep| '|hyper|
              (|NonNegativeInteger|) (4 . |degree|) (9 . |One|)
              (|Union| $ '"failed") (|Integer|) (13 . |exquo|) '|gen|
              (|OutputForm|) (|Symbol|) (19 . |coerce|) '|dvd| (24 . |coerce|)
              '|zer| (29 . |One|) |HELLFDIV;divisor;R$;2|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |HELLFDIV;Zero;$;1|) $))
              (33 . |One|) (37 . |Zero|) (|Boolean|) (41 . =) (47 . |zero?|)
              (|Vector| 9) (|FractionalIdeal| 7 44 8 9) (52 . |ideal|) (57 . *)
              |HELLFDIV;ideal;$Fi;5|
              (|Record| (|:| |id| 38) (|:| |principalPart| 9))
              |HELLFDIV;decompose;$R;6| (|Fraction| 7) (63 . |coerce|)
              (68 . |coerce|) (73 . |One|) (77 . |monomial|) (83 . |coerce|)
              (88 . -) (94 . |reduce|) (99 . +)
              (|Record| (|:| |coef| 54) (|:| |generator| $)) (|List| $)
              (105 . |principalIdeal|) (110 . |generator|) (114 . *)
              (|PositiveInteger|) (120 . ^) (126 . |exquo|) (|List| 7)
              (132 . |second|) (137 . |third|) (142 . |rem|) (148 . *)
              (154 . *) |HELLFDIV;reduce;2$;14| |HELLFDIV;+;3$;8|
              (160 . |Zero|) |HELLFDIV;-;2$;16| |HELLFDIV;*;I2$;9| (164 . ^)
              (170 . ^) |HELLFDIV;divisor;Fi$;10| (176 . |minimize|)
              (181 . |basis|) (186 . |minIndex|) (191 . |elt|) (197 . ~=)
              (|Union| 44 '"failed") (203 . |retractIfCan|)
              (208 . |retractIfCan|) (213 . |lift|) (218 . |degree|) (223 . ~=)
              (229 . |coefficient|) (235 . /) (241 . -) (246 . |denom|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (251 . |extendedEuclidean|) (257 . |ground?|) (262 . |numer|)
              (267 . |coerce|) (272 . |bracket|) (277 . |coerce|)
              (282 . |prefix|) (288 . =) (294 . +) |HELLFDIV;coerce;$Of;13|
              (300 . <=) (306 . /) (312 . -) (318 . -) (|Union| 9 '"failed")
              |HELLFDIV;generator;$U;15| (323 . |inv|) |HELLFDIV;=;2$B;17|
              (328 . |monomial|) (334 . |coerce|) (339 . |discriminant|)
              (343 . |retract|) (348 . |gcd|) |HELLFDIV;divisor;2F$;18|
              (|Record| (|:| |num| 117) (|:| |den| 7))
              (354 . |integralCoordinates|) (|Vector| 7) (359 . |minIndex|)
              (364 . |integralRepresents|) (370 . *) (376 . -) (382 . |norm|)
              (387 . |rank|) (391 . ^) |HELLFDIV;divisor;R3UPF$;20|
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 397 |zero?| 403 |subtractIfCan| 408 |sample| 414 |reduce| 418
              |principal?| 423 |opposite?| 428 |latex| 434 |ideal| 439
              |hashUpdate!| 444 |hash| 450 |generator| 455 |divisor| 460
              |decompose| 492 |coerce| 497 |Zero| 502 = 506 - 512 + 523 * 529)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|FiniteDivisorCategory&| |AbelianGroup&| NIL
                     |AbelianMonoid&| |AbelianSemiGroup&| |SetCategory&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|FiniteDivisorCategory| 6 7 8 9) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                      (|CoercibleTo| 23))
                   (|makeByteWordVec2| 128
                                       '(0 9 10 11 1 7 16 0 17 0 6 0 18 2 20 19
                                         0 0 21 1 24 23 0 25 1 20 23 0 27 0 9 0
                                         29 0 7 0 32 0 7 0 33 2 7 34 0 0 35 1 7
                                         34 0 36 1 38 0 37 39 2 38 0 0 0 40 1
                                         44 0 7 45 1 9 0 44 46 0 44 0 47 2 8 0
                                         44 16 48 1 8 0 44 49 2 8 0 0 0 50 1 9
                                         0 8 51 2 7 0 0 0 52 1 7 53 54 55 0 9 0
                                         56 2 7 0 0 0 57 2 7 0 0 58 59 2 7 19 0
                                         0 60 1 61 7 0 62 1 61 7 0 63 2 7 0 0 0
                                         64 2 9 0 44 0 65 2 9 0 0 0 66 0 6 0 69
                                         2 9 0 0 20 72 2 38 0 0 20 73 1 38 0 0
                                         75 1 38 37 0 76 1 37 20 0 77 2 37 9 0
                                         20 78 2 16 34 0 0 79 1 9 80 0 81 1 44
                                         10 0 82 1 9 8 0 83 1 8 16 0 84 2 20 34
                                         0 0 85 2 8 44 0 16 86 2 44 0 0 0 87 1
                                         44 0 0 88 1 44 7 0 89 2 7 90 0 0 91 1
                                         7 34 0 92 1 44 7 0 93 1 7 23 0 94 1 23
                                         0 54 95 1 9 23 0 96 2 23 0 0 54 97 2 9
                                         34 0 0 98 2 23 0 0 0 99 2 20 34 0 0
                                         101 2 9 0 0 0 102 2 7 0 0 0 103 1 7 0
                                         0 104 1 9 0 0 107 2 7 0 6 16 109 1 7 0
                                         6 110 0 9 44 111 1 44 7 0 112 2 7 0 0
                                         0 113 1 9 115 0 116 1 117 20 0 118 2 9
                                         0 117 7 119 2 7 0 6 0 120 2 9 0 0 0
                                         121 1 9 44 0 122 0 9 58 123 2 9 0 0 58
                                         124 2 0 34 0 0 1 1 0 34 0 1 2 0 19 0 0
                                         1 0 0 0 1 1 0 0 0 67 1 0 34 0 1 2 0 34
                                         0 0 1 1 0 127 0 1 1 0 38 0 41 2 0 126
                                         126 0 1 1 0 128 0 1 1 0 105 0 106 5 0
                                         0 9 7 7 7 6 125 3 0 0 6 6 20 1 2 0 0 6
                                         6 114 1 0 0 38 74 1 0 0 9 30 1 0 42 0
                                         43 1 0 23 0 100 0 0 0 31 2 0 34 0 0
                                         108 1 0 0 0 70 2 0 0 0 0 1 2 0 0 0 0
                                         68 2 0 0 20 0 71 2 0 0 16 0 1 2 0 0 58
                                         0 1)))))
           '|lookupComplete|)) 
