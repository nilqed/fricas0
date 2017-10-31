
(SDEFUN |EFGUSER;apply_taylor1|
        ((|ft| |Mapping| (|Stream| |Coef|) (|Stream| |Coef|)) (|x| PS)
         ($ |Union| PS "failed"))
        (SPROG
         ((|fxu| (|Union| (|Stream| |Coef|) "failed")) (|s1| (|Stream| |Coef|))
          (|c0| (|Coef|)))
         (SEQ
          (LETT |x| (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 12))
                . #1=(|EFGUSER;apply_taylor1|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT $ 13)) (|spadConstant| $ 11)
                       (QREFELT $ 15))
             (CONS 1 "failed"))
            (#2='T
             (SEQ
              (LETT |c0| (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 16))
                    . #1#)
              (LETT |s1|
                    (SPADCALL (SPADCALL |c0| 0 (QREFELT $ 20))
                              (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20))
                              (QREFELT $ 23))
                    . #1#)
              (LETT |fxu| (|trappedSpadEval| (SPADCALL |s1| |ft|)) . #1#)
              (EXIT
               (COND ((QEQCAR |fxu| 1) (CONS 1 "failed"))
                     (#2#
                      (CONS 0
                            (SPADCALL (QCDR |fxu|)
                                      (SPADCALL |x|
                                                (SPADCALL |c0|
                                                          (|spadConstant| $ 11)
                                                          (QREFELT $ 24))
                                                (QREFELT $ 25))
                                      (QREFELT $ 26))))))))))))) 

(SDEFUN |EFGUSER;nthRootIfCan;PSNniU;2|
        ((|x| PS) (|n| |NonNegativeInteger|) ($ |Union| PS "failed"))
        (SPROG
         ((|res1| (|Union| PS "failed")) (|x1| (PS)) (|c0| (|Coef|))
          (|ord| (|Expon|)) (|i| NIL))
         (SEQ
          (COND ((EQL |n| 0) (CONS 0 (|spadConstant| $ 22)))
                ((EQL |n| 1) (CONS 0 |x|))
                (#1='T
                 (SEQ
                  (LETT |x| (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 12))
                        . #2=(|EFGUSER;nthRootIfCan;PSNniU;2|))
                  (LETT |ord| (SPADCALL |x| (QREFELT $ 13)) . #2#)
                  (COND
                   ((SPADCALL |ord| (|spadConstant| $ 11) (QREFELT $ 27))
                    (SEQ (LETT |i| 0 . #2#) G190
                         (COND
                          ((OR (|greater_SI| |i| 50)
                               (NULL
                                (SPADCALL (SPADCALL |x| |ord| (QREFELT $ 16))
                                          (|spadConstant| $ 10)
                                          (QREFELT $ 28))))
                           (GO G191)))
                         (SEQ
                          (LETT |x|
                                (SPADCALL |x|
                                          (SPADCALL |ord|
                                                    (SPADCALL 10
                                                              (|spadConstant| $
                                                                              29)
                                                              (QREFELT $ 31))
                                                    (QREFELT $ 32))
                                          (QREFELT $ 12))
                                . #2#)
                          (EXIT
                           (LETT |ord| (SPADCALL |x| (QREFELT $ 13)) . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |c0| (SPADCALL |x| |ord| (QREFELT $ 16)) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |c0| (|spadConstant| $ 10) (QREFELT $ 28))
                     (CONS 1 "failed"))
                    (#1#
                     (SEQ
                      (LETT |x1|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 21)
                                       (SPADCALL -1 |ord| (QREFELT $ 37))
                                       (QREFELT $ 24))
                             |x| (QREFELT $ 38))
                            . #2#)
                      (LETT |res1|
                            (|EFGUSER;apply_taylor1|
                             (CONS #'|EFGUSER;nthRootIfCan;PSNniU;2!0|
                                   (VECTOR |n| $))
                             |x1| $)
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                             (#1#
                              (CONS 0
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 21)
                                               (SPADCALL
                                                (SPADCALL 1 |n| (QREFELT $ 40))
                                                |ord| (QREFELT $ 42))
                                               (QREFELT $ 24))
                                     (QCDR |res1|) (QREFELT $ 38)))))))))))))))) 

(SDEFUN |EFGUSER;nthRootIfCan;PSNniU;2!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |n|)
          (LETT $ (QREFELT $$ 1) . #1=(|EFGUSER;nthRootIfCan;PSNniU;2|))
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL (|spadConstant| $ 39) |n| (QREFELT $ 40)) |s|
                      (QREFELT $ 41)))))) 

(SDEFUN |EFGUSER;expIfCan;PSU;3| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG ((|c1| (|Coef|)) (|expx| (|Stream| |Coef|)))
               (SEQ
                (LETT |x| (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 12))
                      . #1=(|EFGUSER;expIfCan;PSU;3|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 13))
                             (|spadConstant| $ 11) (QREFELT $ 15))
                   (CONS 1 "failed"))
                  (#2='T
                   (SEQ
                    (LETT |expx|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20))
                           (QREFELT $ 47))
                          . #1#)
                    (LETT |c1|
                          (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 16))
                          . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |c1| (|spadConstant| $ 10) (QREFELT $ 28))
                       (CONS 0 (SPADCALL |expx| |x| (QREFELT $ 26))))
                      ((QREFELT $ 9)
                       (CONS 0
                             (SPADCALL (SPADCALL |c1| (QREFELT $ 48))
                                       (SPADCALL |expx|
                                                 (SPADCALL |x|
                                                           (SPADCALL |c1|
                                                                     (|spadConstant|
                                                                      $ 11)
                                                                     (QREFELT $
                                                                              24))
                                                           (QREFELT $ 25))
                                                 (QREFELT $ 26))
                                       (QREFELT $ 49))))
                      (#2# (CONS 1 "failed"))))))))))) 

(SDEFUN |EFGUSER;logIfCan;PSU;4| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 51) |x| $)) 

(SDEFUN |EFGUSER;sincos|
        ((|x| PS)
         ($ |Union| (|Record| (|:| |sin| PS) (|:| |cos| PS)) "failed"))
        (SPROG
         ((|cc1| (|Coef|)) (|sc1| (|Coef|)) (|cx1| (PS)) (|sx1| (PS))
          (|x1| (PS)) (|c1| (|Coef|))
          (|scst|
           (|Record| (|:| |sin| (|Stream| |Coef|))
                     (|:| |cos| (|Stream| |Coef|)))))
         (SEQ
          (LETT |x| (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 12))
                . #1=(|EFGUSER;sincos|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT $ 13)) (|spadConstant| $ 11)
                       (QREFELT $ 15))
             (CONS 1 "failed"))
            (#2='T
             (SEQ
              (LETT |scst|
                    (SPADCALL (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20))
                              (QREFELT $ 54))
                    . #1#)
              (LETT |c1| (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 16))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL |c1| (|spadConstant| $ 10) (QREFELT $ 28))
                 (CONS 0
                       (CONS (SPADCALL (QCAR |scst|) |x| (QREFELT $ 26))
                             (SPADCALL (QCDR |scst|) |x| (QREFELT $ 26)))))
                ((QREFELT $ 9)
                 (SEQ
                  (LETT |x1|
                        (SPADCALL |x|
                                  (SPADCALL |c1| (|spadConstant| $ 11)
                                            (QREFELT $ 24))
                                  (QREFELT $ 25))
                        . #1#)
                  (LETT |sx1| (SPADCALL (QCAR |scst|) |x1| (QREFELT $ 26))
                        . #1#)
                  (LETT |cx1| (SPADCALL (QCDR |scst|) |x1| (QREFELT $ 26))
                        . #1#)
                  (LETT |sc1| (SPADCALL |c1| (QREFELT $ 55)) . #1#)
                  (LETT |cc1| (SPADCALL |c1| (QREFELT $ 56)) . #1#)
                  (EXIT
                   (CONS 0
                         (CONS
                          (SPADCALL (SPADCALL |sc1| |cx1| (QREFELT $ 49))
                                    (SPADCALL |cc1| |sx1| (QREFELT $ 49))
                                    (QREFELT $ 57))
                          (SPADCALL (SPADCALL |cc1| |cx1| (QREFELT $ 49))
                                    (SPADCALL |sc1| |sx1| (QREFELT $ 49))
                                    (QREFELT $ 25)))))))
                (#2# (CONS 1 "failed"))))))))))) 

(SDEFUN |EFGUSER;sinIfCan;PSU;6| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc| (|Union| (|Record| (|:| |sin| PS) (|:| |cos| PS)) "failed")))
         (SEQ (LETT |usc| (|EFGUSER;sincos| |x| $) |EFGUSER;sinIfCan;PSU;6|)
              (EXIT
               (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                     ('T (CONS 0 (QCAR (QCDR |usc|))))))))) 

(SDEFUN |EFGUSER;cosIfCan;PSU;7| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc| (|Union| (|Record| (|:| |sin| PS) (|:| |cos| PS)) "failed")))
         (SEQ (LETT |usc| (|EFGUSER;sincos| |x| $) |EFGUSER;cosIfCan;PSU;7|)
              (EXIT
               (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                     ('T (CONS 0 (QCDR (QCDR |usc|))))))))) 

(SDEFUN |EFGUSER;tanIfCan;PSU;8| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc| (|Union| (|Record| (|:| |sin| PS) (|:| |cos| PS)) "failed")))
         (SEQ (LETT |usc| (|EFGUSER;sincos| |x| $) |EFGUSER;tanIfCan;PSU;8|)
              (EXIT
               (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                     ('T
                      (SPADCALL (QCAR (QCDR |usc|)) (QCDR (QCDR |usc|))
                                (QREFELT $ 60)))))))) 

(SDEFUN |EFGUSER;cotIfCan;PSU;9| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc| (|Union| (|Record| (|:| |sin| PS) (|:| |cos| PS)) "failed")))
         (SEQ (LETT |usc| (|EFGUSER;sincos| |x| $) |EFGUSER;cotIfCan;PSU;9|)
              (EXIT
               (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                     ('T
                      (SPADCALL (QCDR (QCDR |usc|)) (QCAR (QCDR |usc|))
                                (QREFELT $ 60)))))))) 

(SDEFUN |EFGUSER;secIfCan;PSU;10| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc| (|Union| (|Record| (|:| |sin| PS) (|:| |cos| PS)) "failed")))
         (SEQ (LETT |usc| (|EFGUSER;sincos| |x| $) |EFGUSER;secIfCan;PSU;10|)
              (EXIT
               (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                     ('T
                      (SPADCALL (|spadConstant| $ 22) (QCDR (QCDR |usc|))
                                (QREFELT $ 60)))))))) 

(SDEFUN |EFGUSER;cscIfCan;PSU;11| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc| (|Union| (|Record| (|:| |sin| PS) (|:| |cos| PS)) "failed")))
         (SEQ (LETT |usc| (|EFGUSER;sincos| |x| $) |EFGUSER;cscIfCan;PSU;11|)
              (EXIT
               (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                     ('T
                      (SPADCALL (|spadConstant| $ 22) (QCAR (QCDR |usc|))
                                (QREFELT $ 60)))))))) 

(SDEFUN |EFGUSER;asinIfCan;PSU;12| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 65) |x| $)) 

(SDEFUN |EFGUSER;acosIfCan;PSU;13| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 67) |x| $)) 

(SDEFUN |EFGUSER;atanIfCan;PSU;14| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 69) |x| $)) 

(SDEFUN |EFGUSER;acotIfCan;PSU;15| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 71) |x| $)) 

(SDEFUN |EFGUSER;asecIfCan;PSU;16| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 73) |x| $)) 

(SDEFUN |EFGUSER;acscIfCan;PSU;17| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 75) |x| $)) 

(SDEFUN |EFGUSER;sinhcosh|
        ((|x| PS)
         ($ |Union| (|Record| (|:| |sinh| PS) (|:| |cosh| PS)) "failed"))
        (SPROG
         ((|cc1| (|Coef|)) (|sc1| (|Coef|)) (|cx1| (PS)) (|sx1| (PS))
          (|x1| (PS)) (|c1| (|Coef|))
          (|scst|
           (|Record| (|:| |sinh| (|Stream| |Coef|))
                     (|:| |cosh| (|Stream| |Coef|)))))
         (SEQ
          (LETT |x| (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 12))
                . #1=(|EFGUSER;sinhcosh|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT $ 13)) (|spadConstant| $ 11)
                       (QREFELT $ 15))
             (CONS 1 "failed"))
            (#2='T
             (SEQ
              (LETT |scst|
                    (SPADCALL (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20))
                              (QREFELT $ 78))
                    . #1#)
              (LETT |c1| (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 16))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL |c1| (|spadConstant| $ 10) (QREFELT $ 28))
                 (CONS 0
                       (CONS (SPADCALL (QCAR |scst|) |x| (QREFELT $ 26))
                             (SPADCALL (QCDR |scst|) |x| (QREFELT $ 26)))))
                ((QREFELT $ 9)
                 (SEQ
                  (LETT |x1|
                        (SPADCALL |x|
                                  (SPADCALL |c1| (|spadConstant| $ 11)
                                            (QREFELT $ 24))
                                  (QREFELT $ 25))
                        . #1#)
                  (LETT |sx1| (SPADCALL (QCAR |scst|) |x1| (QREFELT $ 26))
                        . #1#)
                  (LETT |cx1| (SPADCALL (QCDR |scst|) |x1| (QREFELT $ 26))
                        . #1#)
                  (LETT |sc1| (SPADCALL |c1| (QREFELT $ 79)) . #1#)
                  (LETT |cc1| (SPADCALL |c1| (QREFELT $ 80)) . #1#)
                  (EXIT
                   (CONS 0
                         (CONS
                          (SPADCALL (SPADCALL |sc1| |cx1| (QREFELT $ 49))
                                    (SPADCALL |cc1| |sx1| (QREFELT $ 49))
                                    (QREFELT $ 57))
                          (SPADCALL (SPADCALL |cc1| |cx1| (QREFELT $ 49))
                                    (SPADCALL |sc1| |sx1| (QREFELT $ 49))
                                    (QREFELT $ 57)))))))
                (#2# (CONS 1 "failed"))))))))))) 

(SDEFUN |EFGUSER;sinhIfCan;PSU;19| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc|
           (|Union| (|Record| (|:| |sinh| PS) (|:| |cosh| PS)) "failed")))
         (SEQ
          (LETT |usc| (|EFGUSER;sinhcosh| |x| $) |EFGUSER;sinhIfCan;PSU;19|)
          (EXIT
           (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCAR (QCDR |usc|))))))))) 

(SDEFUN |EFGUSER;coshIfCan;PSU;20| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc|
           (|Union| (|Record| (|:| |sinh| PS) (|:| |cosh| PS)) "failed")))
         (SEQ
          (LETT |usc| (|EFGUSER;sinhcosh| |x| $) |EFGUSER;coshIfCan;PSU;20|)
          (EXIT
           (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCDR (QCDR |usc|))))))))) 

(SDEFUN |EFGUSER;tanhIfCan;PSU;21| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc|
           (|Union| (|Record| (|:| |sinh| PS) (|:| |cosh| PS)) "failed")))
         (SEQ
          (LETT |usc| (|EFGUSER;sinhcosh| |x| $) |EFGUSER;tanhIfCan;PSU;21|)
          (EXIT
           (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                 ('T
                  (SPADCALL (QCAR (QCDR |usc|)) (QCDR (QCDR |usc|))
                            (QREFELT $ 60)))))))) 

(SDEFUN |EFGUSER;cothIfCan;PSU;22| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc|
           (|Union| (|Record| (|:| |sinh| PS) (|:| |cosh| PS)) "failed")))
         (SEQ
          (LETT |usc| (|EFGUSER;sinhcosh| |x| $) |EFGUSER;cothIfCan;PSU;22|)
          (EXIT
           (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                 ('T
                  (SPADCALL (QCDR (QCDR |usc|)) (QCAR (QCDR |usc|))
                            (QREFELT $ 60)))))))) 

(SDEFUN |EFGUSER;sechIfCan;PSU;23| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc|
           (|Union| (|Record| (|:| |sinh| PS) (|:| |cosh| PS)) "failed")))
         (SEQ
          (LETT |usc| (|EFGUSER;sinhcosh| |x| $) |EFGUSER;sechIfCan;PSU;23|)
          (EXIT
           (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                 ('T
                  (SPADCALL (|spadConstant| $ 22) (QCDR (QCDR |usc|))
                            (QREFELT $ 60)))))))) 

(SDEFUN |EFGUSER;cschIfCan;PSU;24| ((|x| PS) ($ |Union| PS "failed"))
        (SPROG
         ((|usc|
           (|Union| (|Record| (|:| |sinh| PS) (|:| |cosh| PS)) "failed")))
         (SEQ
          (LETT |usc| (|EFGUSER;sinhcosh| |x| $) |EFGUSER;cschIfCan;PSU;24|)
          (EXIT
           (COND ((QEQCAR |usc| 1) (CONS 1 "failed"))
                 ('T
                  (SPADCALL (|spadConstant| $ 22) (QCAR (QCDR |usc|))
                            (QREFELT $ 60)))))))) 

(SDEFUN |EFGUSER;asinhIfCan;PSU;25| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 87) |x| $)) 

(SDEFUN |EFGUSER;acoshIfCan;PSU;26| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 89) |x| $)) 

(SDEFUN |EFGUSER;atanhIfCan;PSU;27| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 91) |x| $)) 

(SDEFUN |EFGUSER;acothIfCan;PSU;28| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 93) |x| $)) 

(SDEFUN |EFGUSER;asechIfCan;PSU;29| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 95) |x| $)) 

(SDEFUN |EFGUSER;acschIfCan;PSU;30| ((|x| PS) ($ |Union| PS "failed"))
        (|EFGUSER;apply_taylor1| (ELT $ 97) |x| $)) 

(SDEFUN |EFGUSER;do_quo;2PSU;31| ((|x| PS) (|y| PS) ($ |Union| PS "failed"))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |EFGUSER;do_quo;2PSU;32| ((|x| PS) (|y| PS) ($ |Union| PS "failed"))
        (SPROG ((|yinv| (|Union| PS "failed")))
               (SEQ
                (LETT |yinv| (SPADCALL |y| (QREFELT $ 101))
                      |EFGUSER;do_quo;2PSU;32|)
                (EXIT
                 (COND ((QEQCAR |yinv| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL |x| (QCDR |yinv|) (QREFELT $ 38))))))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionsGeneralizedUnivariatePowerSeries;|)) 

(DEFUN |ElementaryFunctionsGeneralizedUnivariatePowerSeries| (&REST #1=#:G792)
  (SPROG NIL
         (PROG (#2=#:G793)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionsGeneralizedUnivariatePowerSeries|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryFunctionsGeneralizedUnivariatePowerSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |ElementaryFunctionsGeneralizedUnivariatePowerSeries;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionsGeneralizedUnivariatePowerSeries|)))))))))) 

(DEFUN |ElementaryFunctionsGeneralizedUnivariatePowerSeries;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ElementaryFunctionsGeneralizedUnivariatePowerSeries|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$|
                (LIST '|ElementaryFunctionsGeneralizedUnivariatePowerSeries|
                      DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 102) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|ElementaryFunctionsGeneralizedUnivariatePowerSeries|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9
                    (COND
                     ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
                      (|HasCategory| |#1| '(|CommutativeRing|)))
                     ('T NIL)))
          (COND
           ((|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
            (QSETREFV $ 45
                      (CONS
                       (|dispatchFunction| |EFGUSER;nthRootIfCan;PSNniU;2|)
                       $))))
          (COND
           ((|HasCategory| |#1| '(|IntegralDomain|))
            (QSETREFV $ 60
                      (CONS (|dispatchFunction| |EFGUSER;do_quo;2PSU;31|) $)))
           ('T
            (QSETREFV $ 60
                      (CONS (|dispatchFunction| |EFGUSER;do_quo;2PSU;32|) $))))
          $))) 

(MAKEPROP '|ElementaryFunctionsGeneralizedUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'TRANSFCN (0 . |Zero|) (4 . |Zero|)
              (8 . |removeZeros|) (14 . |degree|) (|Boolean|) (19 . <)
              (25 . |coefficient|) (|Stream| 6) (|Integer|)
              (|StreamTaylorSeriesOperations| 6) (31 . |monom|) (37 . |One|)
              (41 . |One|) (45 . +) (51 . |monomial|) (57 . -)
              (63 . |apply_taylor|) (69 . >=) (75 . =) (81 . |One|)
              (|PositiveInteger|) (85 . *) (91 . +) (97 . -) (|Fraction| 18)
              (102 . |One|) (106 . -) (111 . *) (117 . *) (123 . |One|)
              (127 . /) (133 . |powern|) (139 . *) (|Union| 8 '"failed")
              (|NonNegativeInteger|) (145 . |nthRootIfCan|)
              (|StreamTranscendentalFunctions| 6) (151 . |exp|) (156 . |exp|)
              (161 . *) |EFGUSER;expIfCan;PSU;3| (167 . |log|)
              |EFGUSER;logIfCan;PSU;4| (|Record| (|:| |sin| 17) (|:| |cos| 17))
              (172 . |sincos|) (177 . |sin|) (182 . |cos|) (187 . +)
              |EFGUSER;sinIfCan;PSU;6| |EFGUSER;cosIfCan;PSU;7|
              (193 . |do_quo|) |EFGUSER;tanIfCan;PSU;8|
              |EFGUSER;cotIfCan;PSU;9| |EFGUSER;secIfCan;PSU;10|
              |EFGUSER;cscIfCan;PSU;11| (199 . |asin|)
              |EFGUSER;asinIfCan;PSU;12| (204 . |acos|)
              |EFGUSER;acosIfCan;PSU;13| (209 . |atan|)
              |EFGUSER;atanIfCan;PSU;14| (214 . |acot|)
              |EFGUSER;acotIfCan;PSU;15| (219 . |asec|)
              |EFGUSER;asecIfCan;PSU;16| (224 . |acsc|)
              |EFGUSER;acscIfCan;PSU;17|
              (|Record| (|:| |sinh| 17) (|:| |cosh| 17)) (229 . |sinhcosh|)
              (234 . |sinh|) (239 . |cosh|) |EFGUSER;sinhIfCan;PSU;19|
              |EFGUSER;coshIfCan;PSU;20| |EFGUSER;tanhIfCan;PSU;21|
              |EFGUSER;cothIfCan;PSU;22| |EFGUSER;sechIfCan;PSU;23|
              |EFGUSER;cschIfCan;PSU;24| (244 . |asinh|)
              |EFGUSER;asinhIfCan;PSU;25| (249 . |acosh|)
              |EFGUSER;acoshIfCan;PSU;26| (254 . |atanh|)
              |EFGUSER;atanhIfCan;PSU;27| (259 . |acoth|)
              |EFGUSER;acothIfCan;PSU;28| (264 . |asech|)
              |EFGUSER;asechIfCan;PSU;29| (269 . |acsch|)
              |EFGUSER;acschIfCan;PSU;30| (|Union| $ '"failed") (274 . |exquo|)
              (280 . |recip|))
           '#(|tanhIfCan| 285 |tanIfCan| 290 |sinhIfCan| 295 |sinIfCan| 300
              |sechIfCan| 305 |secIfCan| 310 |nthRootIfCan| 315 |logIfCan| 321
              |expIfCan| 326 |do_quo| 331 |cschIfCan| 337 |cscIfCan| 342
              |cothIfCan| 347 |cotIfCan| 352 |coshIfCan| 357 |cosIfCan| 362
              |atanhIfCan| 367 |atanIfCan| 372 |asinhIfCan| 377 |asinIfCan| 382
              |asechIfCan| 387 |asecIfCan| 392 |acschIfCan| 397 |acscIfCan| 402
              |acothIfCan| 407 |acotIfCan| 412 |acoshIfCan| 417 |acosIfCan|
              422)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|PartialTranscendentalFunctions| 8))
                             (|makeByteWordVec2| 101
                                                 '(0 6 0 10 0 7 0 11 2 8 0 0 7
                                                   12 1 8 7 0 13 2 7 14 0 0 15
                                                   2 8 6 0 7 16 2 19 17 6 18 20
                                                   0 6 0 21 0 8 0 22 2 19 17 17
                                                   17 23 2 8 0 6 7 24 2 8 0 0 0
                                                   25 2 8 0 17 0 26 2 7 14 0 0
                                                   27 2 6 14 0 0 28 0 7 0 29 2
                                                   7 0 30 0 31 2 7 0 0 0 32 1 6
                                                   0 0 33 0 34 0 35 1 34 0 0 36
                                                   2 7 0 18 0 37 2 8 0 0 0 38 0
                                                   30 0 39 2 34 0 18 18 40 2 19
                                                   17 34 17 41 2 7 0 34 0 42 2
                                                   0 43 8 44 45 1 46 17 17 47 1
                                                   6 0 0 48 2 8 0 6 0 49 1 46
                                                   17 17 51 1 46 53 17 54 1 6 0
                                                   0 55 1 6 0 0 56 2 8 0 0 0 57
                                                   2 0 43 8 8 60 1 46 17 17 65
                                                   1 46 17 17 67 1 46 17 17 69
                                                   1 46 17 17 71 1 46 17 17 73
                                                   1 46 17 17 75 1 46 77 17 78
                                                   1 6 0 0 79 1 6 0 0 80 1 46
                                                   17 17 87 1 46 17 17 89 1 46
                                                   17 17 91 1 46 17 17 93 1 46
                                                   17 17 95 1 46 17 17 97 2 8
                                                   99 0 0 100 1 8 99 0 101 1 0
                                                   43 8 83 1 0 43 8 61 1 0 43 8
                                                   81 1 0 43 8 58 1 0 43 8 85 1
                                                   0 43 8 63 2 0 43 8 44 45 1 0
                                                   43 8 52 1 0 43 8 50 2 0 43 8
                                                   8 60 1 0 43 8 86 1 0 43 8 64
                                                   1 0 43 8 84 1 0 43 8 62 1 0
                                                   43 8 82 1 0 43 8 59 1 0 43 8
                                                   92 1 0 43 8 70 1 0 43 8 88 1
                                                   0 43 8 66 1 0 43 8 96 1 0 43
                                                   8 74 1 0 43 8 98 1 0 43 8 76
                                                   1 0 43 8 94 1 0 43 8 72 1 0
                                                   43 8 90 1 0 43 8 68)))))
           '|lookupComplete|)) 
