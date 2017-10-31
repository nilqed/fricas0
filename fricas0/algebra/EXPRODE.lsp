
(SDEFUN |EXPRODE;localInteger| ((|n| F) ($ F))
        (COND ((QREFELT $ 14) |n|)
              ('T (SPADCALL (QREFELT $ 13) |n| (QREFELT $ 15))))) 

(SDEFUN |EXPRODE;diffRhs| ((|f| F) (|g| F) ($ F))
        (|EXPRODE;diffRhsK| (SPADCALL |f| (QREFELT $ 17)) |g| $)) 

(SDEFUN |EXPRODE;k2exquo| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G708 NIL) (|f| NIL) (#2=#:G707 NIL) (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |op| (SPADCALL |k| (QREFELT $ 19)) . #3=(|EXPRODE;k2exquo|))
             '|%diff| (QREFELT $ 21))
            (|error| "Improper differential equation"))
           ('T
            (SPADCALL |op|
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |f| NIL . #3#)
                            (LETT #1# (SPADCALL |k| (QREFELT $ 23)) . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2# (CONS (|EXPRODE;div2exquo| |f| $) #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 25))))))) 

(SDEFUN |EXPRODE;smp2exquo|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL (CONS (|function| |EXPRODE;k2exquo|) $) (ELT $ 26) |p|
                  (QREFELT $ 31))) 

(SDEFUN |EXPRODE;div2exquo| ((|f| F) ($ F))
        (SPROG ((|d| (|SparseMultivariatePolynomial| R (|Kernel| F))))
               (SEQ
                (LETT |d| (SPADCALL |f| (QREFELT $ 33)) |EXPRODE;div2exquo|)
                (EXIT
                 (COND
                  ((SPADCALL |d| (|spadConstant| $ 36) (QREFELT $ 37)) |f|)
                  ('T
                   (SPADCALL (QREFELT $ 12)
                             (|EXPRODE;smp2exquo| (SPADCALL |f| (QREFELT $ 38))
                              $)
                             (|EXPRODE;smp2exquo| |d| $) (QREFELT $ 39)))))))) 

(SDEFUN |EXPRODE;diffRhsK| ((|k| |Kernel| F) (|g| F) ($ F))
        (SPROG ((|h| (|Fraction| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (LETT |h| (SPADCALL |g| |k| (QREFELT $ 41)) |EXPRODE;diffRhsK|)
                (COND
                 ((SPADCALL
                   (SPADCALL (SPADCALL |h| (QREFELT $ 44)) (QREFELT $ 46)) 1
                   (QREFELT $ 47))
                  (COND
                   ((SPADCALL (SPADCALL |h| (QREFELT $ 48)) (QREFELT $ 49))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |h| (QREFELT $ 44)) 0
                                 (QREFELT $ 51))
                       (SPADCALL (SPADCALL |h| (QREFELT $ 44)) 1
                                 (QREFELT $ 51))
                       (QREFELT $ 52))
                      (QREFELT $ 53)))))))
                (EXIT (|error| "Improper differential equation"))))) 

(SDEFUN |EXPRODE;checkCompat|
        ((|y| |BasicOperator|) (|eqx| |Equation| F) (|eqy| |Equation| F) ($ F))
        (COND
         ((SPADCALL (SPADCALL |eqy| (QREFELT $ 55))
                    (SPADCALL |y| (SPADCALL |eqx| (QREFELT $ 56))
                              (QREFELT $ 15))
                    (QREFELT $ 57))
          (SPADCALL |eqy| (QREFELT $ 56)))
         ('T (|error| "Improper initial value")))) 

(SDEFUN |EXPRODE;findCompat| ((|yx| F) (|l| |List| (|Equation| F)) ($ F))
        (SPROG ((#1=#:G732 NIL) (#2=#:G733 NIL) (#3=#:G734 NIL) (|eq| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |eq| NIL . #4=(|EXPRODE;findCompat|))
                         (LETT #3# |l| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |eq| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |yx| (SPADCALL |eq| (QREFELT $ 55))
                                       (QREFELT $ 57))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (SPADCALL |eq| (QREFELT $ 56))
                                           . #4#)
                                     (GO #5=#:G731))
                                    . #4#)
                              (GO #6=#:G729))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (|error| "Improper initial value"))))
                #5# (EXIT #2#)))) 

(SDEFUN |EXPRODE;findEq|
        ((|k| |Kernel| F) (|x| |Symbol|) (|sys| |List| F) ($ F))
        (SPROG ((#1=#:G743 NIL) (#2=#:G744 NIL) (#3=#:G745 NIL) (|eq| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |k|
                        (SPADCALL
                         (SPADCALL (SPADCALL |k| (QREFELT $ 58)) |x|
                                   (QREFELT $ 59))
                         (QREFELT $ 17))
                        . #4=(|EXPRODE;findEq|))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |eq| NIL . #4#) (LETT #3# |sys| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |eq| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| (SPADCALL |eq| (QREFELT $ 61))
                                       (QREFELT $ 63))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# |eq| . #4#)
                                     (GO #5=#:G742))
                                    . #4#)
                              (GO #6=#:G740))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (|error| "Improper differential equation"))))
                #5# (EXIT #2#)))) 

(SDEFUN |EXPRODE;checkOrder1|
        ((|diffeq| F) (|y| |BasicOperator|) (|yx| |Kernel| F) (|x| |Symbol|)
         (|sy| F) ($ F))
        (|EXPRODE;div2exquo|
         (SPADCALL
          (|EXPRODE;diffRhs|
           (SPADCALL (SPADCALL |yx| (QREFELT $ 58)) |x| (QREFELT $ 59))
           |diffeq| $)
          (LIST |yx|) (LIST |sy|) (QREFELT $ 64))
         $)) 

(SDEFUN |EXPRODE;checkOrderN|
        ((|diffeq| F) (|y| |BasicOperator|) (|yx| |Kernel| F) (|x| |Symbol|)
         (|sy| F) (|n| |NonNegativeInteger|) ($ F))
        (SPROG
         ((|lv| (|List| F)) (|m| (F)) (|l| (|List| (|Kernel| F))) (|f| (F))
          (#1=#:G753 NIL) (|i| NIL))
         (SEQ
          (COND ((ZEROP |n|) (|error| "No initial value(s) given"))
                ('T
                 (SEQ
                  (LETT |m|
                        (SPADCALL
                         (SPADCALL
                          (LETT |l|
                                (LIST
                                 (SPADCALL
                                  (LETT |f| (SPADCALL |yx| (QREFELT $ 58))
                                        . #2=(|EXPRODE;checkOrderN|))
                                  (QREFELT $ 17)))
                                . #2#)
                          (QREFELT $ 66))
                         (QREFELT $ 67))
                        . #2#)
                  (LETT |lv|
                        (LIST
                         (SPADCALL (QREFELT $ 11) |sy|
                                   (|EXPRODE;localInteger| |m| $)
                                   (QREFELT $ 39)))
                        . #2#)
                  (SEQ (LETT |i| 2 . #2#) (LETT #1# |n| . #2#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (LETT |l|
                              (CONS
                               (SPADCALL
                                (LETT |f| (SPADCALL |f| |x| (QREFELT $ 59))
                                      . #2#)
                                (QREFELT $ 17))
                               |l|)
                              . #2#)
                        (EXIT
                         (LETT |lv|
                               (CONS
                                (SPADCALL (QREFELT $ 11) |sy|
                                          (|EXPRODE;localInteger|
                                           (LETT |m|
                                                 (SPADCALL |m|
                                                           (|spadConstant| $
                                                                           35)
                                                           (QREFELT $ 68))
                                                 . #2#)
                                           $)
                                          (QREFELT $ 39))
                                |lv|)
                               . #2#)))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (|EXPRODE;div2exquo|
                    (SPADCALL
                     (|EXPRODE;diffRhs| (SPADCALL |f| |x| (QREFELT $ 59))
                      |diffeq| $)
                     |l| |lv| (QREFELT $ 64))
                    $)))))))) 

(SDEFUN |EXPRODE;checkSystem|
        ((|diffeq| F) (|yx| |List| (|Kernel| F)) (|lv| |List| F) ($ F))
        (SPROG ((#1=#:G758 NIL) (#2=#:G759 NIL) (#3=#:G760 NIL) (|k| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |k| NIL . #4=(|EXPRODE;checkSystem|))
                         (LETT #3# (SPADCALL |diffeq| (QREFELT $ 61)) . #4#)
                         G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| '|%diff| (QREFELT $ 69))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2#
                                           (|EXPRODE;div2exquo|
                                            (SPADCALL
                                             (|EXPRODE;diffRhsK| |k| |diffeq|
                                              $)
                                             |yx| |lv| (QREFELT $ 64))
                                            $)
                                           . #4#)
                                     (GO #5=#:G757))
                                    . #4#)
                              (GO #6=#:G755))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (|spadConstant| $ 70))))
                #5# (EXIT #2#)))) 

(SDEFUN |EXPRODE;seriesSolve;LLELA;13|
        ((|l| |List| (|Equation| F)) (|y| |List| (|BasicOperator|))
         (|eqx| |Equation| F) (|eqy| |List| (|Equation| F)) ($ |Any|))
        (SPROG ((#1=#:G764 NIL) (|deq| NIL) (#2=#:G763 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|EXPRODE;seriesSolve;LLELA;13|))
                  (SEQ (LETT |deq| NIL . #3#) (LETT #1# |l| . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |deq| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |deq| (QREFELT $ 55))
                                          (SPADCALL |deq| (QREFELT $ 56))
                                          (QREFELT $ 71))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |y| |eqx| |eqy| (QREFELT $ 75))))) 

(SDEFUN |EXPRODE;seriesSolve;LLELA;14|
        ((|l| |List| (|Equation| F)) (|y| |List| (|BasicOperator|))
         (|eqx| |Equation| F) (|y0| |List| F) ($ |Any|))
        (SPROG ((#1=#:G769 NIL) (|deq| NIL) (#2=#:G768 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|EXPRODE;seriesSolve;LLELA;14|))
                  (SEQ (LETT |deq| NIL . #3#) (LETT #1# |l| . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |deq| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |deq| (QREFELT $ 55))
                                          (SPADCALL |deq| (QREFELT $ 56))
                                          (QREFELT $ 71))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |y| |eqx| |y0| (QREFELT $ 77))))) 

(SDEFUN |EXPRODE;seriesSolve;LLELA;15|
        ((|l| |List| F) (|ly| |List| (|BasicOperator|)) (|eqx| |Equation| F)
         (|eqy| |List| (|Equation| F)) ($ |Any|))
        (SPROG ((#1=#:G773 NIL) (|y| NIL) (#2=#:G772 NIL))
               (SEQ
                (SPADCALL |l| |ly| |eqx|
                          (PROGN
                           (LETT #2# NIL . #3=(|EXPRODE;seriesSolve;LLELA;15|))
                           (SEQ (LETT |y| NIL . #3#) (LETT #1# |ly| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |y| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (|EXPRODE;findCompat|
                                          (SPADCALL |y|
                                                    (SPADCALL |eqx|
                                                              (QREFELT $ 56))
                                                    (QREFELT $ 15))
                                          |eqy| $)
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 77))))) 

(SDEFUN |EXPRODE;seriesSolve;EBo2EA;16|
        ((|diffeq| |Equation| F) (|y| |BasicOperator|) (|eqx| |Equation| F)
         (|eqy| |Equation| F) ($ |Any|))
        (SPADCALL
         (SPADCALL (SPADCALL |diffeq| (QREFELT $ 55))
                   (SPADCALL |diffeq| (QREFELT $ 56)) (QREFELT $ 71))
         |y| |eqx| |eqy| (QREFELT $ 79))) 

(SDEFUN |EXPRODE;seriesSolve;EBoEFA;17|
        ((|diffeq| |Equation| F) (|y| |BasicOperator|) (|eqx| |Equation| F)
         (|y0| F) ($ |Any|))
        (SPADCALL
         (SPADCALL (SPADCALL |diffeq| (QREFELT $ 55))
                   (SPADCALL |diffeq| (QREFELT $ 56)) (QREFELT $ 71))
         |y| |eqx| |y0| (QREFELT $ 81))) 

(SDEFUN |EXPRODE;seriesSolve;EBoELA;18|
        ((|diffeq| |Equation| F) (|y| |BasicOperator|) (|eqx| |Equation| F)
         (|y0| |List| F) ($ |Any|))
        (SPADCALL
         (SPADCALL (SPADCALL |diffeq| (QREFELT $ 55))
                   (SPADCALL |diffeq| (QREFELT $ 56)) (QREFELT $ 71))
         |y| |eqx| |y0| (QREFELT $ 83))) 

(SDEFUN |EXPRODE;seriesSolve;FBo2EA;19|
        ((|diffeq| F) (|y| |BasicOperator|) (|eqx| |Equation| F)
         (|eqy| |Equation| F) ($ |Any|))
        (SPADCALL |diffeq| |y| |eqx| (|EXPRODE;checkCompat| |y| |eqx| |eqy| $)
                  (QREFELT $ 81))) 

(SDEFUN |EXPRODE;seriesSolve;FBoEFA;20|
        ((|diffeq| F) (|y| |BasicOperator|) (|eqx| |Equation| F) (|y0| F)
         ($ |Any|))
        (SPROG
         ((|center| (F)) (|f| (F)) (|yx| (|Kernel| F)) (|sy| (|Symbol|))
          (|x| (|Symbol|)) (#1=#:G779 NIL))
         (SEQ
          (LETT |x|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |eqx| (QREFELT $ 55))
                                     (QREFELT $ 17))
                           (QREFELT $ 86))
                          . #2=(|EXPRODE;seriesSolve;FBoEFA;20|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #1#))
                . #2#)
          (LETT |sy| (SPADCALL |y| (QREFELT $ 87)) . #2#)
          (LETT |yx|
                (SPADCALL
                 (SPADCALL |y| (SPADCALL |eqx| (QREFELT $ 55)) (QREFELT $ 15))
                 (QREFELT $ 17))
                . #2#)
          (LETT |f|
                (|EXPRODE;checkOrder1| |diffeq| |y| |yx| |x|
                 (SPADCALL |sy| (QREFELT $ 88)) $)
                . #2#)
          (LETT |center| (SPADCALL |eqx| (QREFELT $ 56)) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL |f| |sy|
                       (|compiledLookupCheck| '|compiledFunction|
                                              (LIST
                                               (LIST '|Mapping|
                                                     (LIST
                                                      '|UnivariateTaylorSeries|
                                                      (|devaluate| (ELT $ 7))
                                                      |x| |center|)
                                                     (LIST
                                                      '|UnivariateTaylorSeries|
                                                      (|devaluate| (ELT $ 7))
                                                      |x| |center|))
                                               (|devaluate| (ELT $ 7))
                                               (LIST '|Symbol|))
                                              (|MakeUnaryCompiledFunction|
                                               (ELT $ 7)
                                               (|UnivariateTaylorSeries|
                                                (ELT $ 7) |x| |center|)
                                               (|UnivariateTaylorSeries|
                                                (ELT $ 7) |x| |center|))))
             |y0|
             (|compiledLookupCheck| '|ode1|
                                    (LIST
                                     (LIST '|UnivariateTaylorSeries|
                                           (|devaluate| (ELT $ 7)) |x|
                                           |center|)
                                     (LIST '|Mapping|
                                           (LIST '|UnivariateTaylorSeries|
                                                 (|devaluate| (ELT $ 7)) |x|
                                                 |center|)
                                           (LIST '|UnivariateTaylorSeries|
                                                 (|devaluate| (ELT $ 7)) |x|
                                                 |center|))
                                     (|devaluate| (ELT $ 7)))
                                    (|UnivariateTaylorSeriesODESolver|
                                     (ELT $ 7)
                                     (|UnivariateTaylorSeries| (ELT $ 7) |x|
                                                               |center|))))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|)
                                         (LIST '|UnivariateTaylorSeries|
                                               (|devaluate| (ELT $ 7)) |x|
                                               |center|))
                                   (|AnyFunctions1|
                                    (|UnivariateTaylorSeries| (ELT $ 7) |x|
                                                              |center|)))))))) 

(SDEFUN |EXPRODE;seriesSolve;FBoELA;21|
        ((|diffeq| F) (|y| |BasicOperator|) (|eqx| |Equation| F)
         (|y0| |List| F) ($ |Any|))
        (SPROG
         ((|center| (F)) (|f| (F)) (|yx| (|Kernel| F)) (|sy| (|Symbol|))
          (|x| (|Symbol|)) (#1=#:G785 NIL))
         (SEQ
          (LETT |x|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |eqx| (QREFELT $ 55))
                                     (QREFELT $ 17))
                           (QREFELT $ 86))
                          . #2=(|EXPRODE;seriesSolve;FBoELA;21|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #1#))
                . #2#)
          (LETT |sy| (SPADCALL (QREFELT $ 89)) . #2#)
          (LETT |yx|
                (SPADCALL
                 (SPADCALL |y| (SPADCALL |eqx| (QREFELT $ 55)) (QREFELT $ 15))
                 (QREFELT $ 17))
                . #2#)
          (LETT |f|
                (|EXPRODE;checkOrderN| |diffeq| |y| |yx| |x|
                 (SPADCALL |sy| (QREFELT $ 88)) (LENGTH |y0|) $)
                . #2#)
          (LETT |center| (SPADCALL |eqx| (QREFELT $ 56)) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL |f| |sy|
                       (|compiledLookupCheck| '|compiledFunction|
                                              (LIST
                                               (LIST '|Mapping|
                                                     (LIST
                                                      '|UnivariateTaylorSeries|
                                                      (|devaluate| (ELT $ 7))
                                                      |x| |center|)
                                                     (LIST '|List|
                                                           (LIST
                                                            '|UnivariateTaylorSeries|
                                                            (|devaluate|
                                                             (ELT $ 7))
                                                            |x| |center|)))
                                               (|devaluate| (ELT $ 7))
                                               (LIST '|Symbol|))
                                              (|MakeUnaryCompiledFunction|
                                               (ELT $ 7)
                                               (|List|
                                                (|UnivariateTaylorSeries|
                                                 (ELT $ 7) |x| |center|))
                                               (|UnivariateTaylorSeries|
                                                (ELT $ 7) |x| |center|))))
             |y0|
             (|compiledLookupCheck| '|ode|
                                    (LIST
                                     (LIST '|UnivariateTaylorSeries|
                                           (|devaluate| (ELT $ 7)) |x|
                                           |center|)
                                     (LIST '|Mapping|
                                           (LIST '|UnivariateTaylorSeries|
                                                 (|devaluate| (ELT $ 7)) |x|
                                                 |center|)
                                           (LIST '|List|
                                                 (LIST
                                                  '|UnivariateTaylorSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |center|)))
                                     (LIST '|List| (|devaluate| (ELT $ 7))))
                                    (|UnivariateTaylorSeriesODESolver|
                                     (ELT $ 7)
                                     (|UnivariateTaylorSeries| (ELT $ 7) |x|
                                                               |center|))))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|)
                                         (LIST '|UnivariateTaylorSeries|
                                               (|devaluate| (ELT $ 7)) |x|
                                               |center|))
                                   (|AnyFunctions1|
                                    (|UnivariateTaylorSeries| (ELT $ 7) |x|
                                                              |center|)))))))) 

(SDEFUN |EXPRODE;seriesSolve;LLELA;22|
        ((|sys| |List| F) (|ly| |List| (|BasicOperator|)) (|eqx| |Equation| F)
         (|l0| |List| F) ($ |Any|))
        (SPROG
         ((#1=#:G817 NIL) (|f| NIL) (#2=#:G816 NIL) (|center| (F))
          (|l| (|List| F)) (#3=#:G815 NIL) (|eq| NIL) (#4=#:G814 NIL)
          (#5=#:G813 NIL) (|k| NIL) (#6=#:G812 NIL) (|lelt| (|List| F))
          (|m| (F)) (#7=#:G811 NIL) (#8=#:G810 NIL)
          (|yx| (|List| (|Kernel| F))) (#9=#:G809 NIL) (|y| NIL)
          (#10=#:G808 NIL) (|fsy| (F)) (|sy| (|Symbol|)) (|x| (|Symbol|))
          (#11=#:G797 NIL) (|kx| (|Kernel| F)))
         (SEQ
          (LETT |x|
                (PROG2
                    (LETT #11#
                          (SPADCALL
                           (LETT |kx|
                                 (SPADCALL (SPADCALL |eqx| (QREFELT $ 55))
                                           (QREFELT $ 17))
                                 . #12=(|EXPRODE;seriesSolve;LLELA;22|))
                           (QREFELT $ 86))
                          . #12#)
                    (QCDR #11#)
                  (|check_union2| (QEQCAR #11# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #11#))
                . #12#)
          (LETT |fsy|
                (SPADCALL (LETT |sy| (SPADCALL (QREFELT $ 89)) . #12#)
                          (QREFELT $ 88))
                . #12#)
          (LETT |m|
                (SPADCALL (- (SPADCALL |l0| (QREFELT $ 90)) 1) (QREFELT $ 67))
                . #12#)
          (LETT |yx|
                (CONS |kx|
                      (PROGN
                       (LETT #10# NIL . #12#)
                       (SEQ (LETT |y| NIL . #12#) (LETT #9# |ly| . #12#) G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |y| (CAR #9#) . #12#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #10#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |y|
                                                (SPADCALL |eqx| (QREFELT $ 55))
                                                (QREFELT $ 15))
                                      (QREFELT $ 17))
                                     #10#)
                                    . #12#)))
                            (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                            (EXIT (NREVERSE #10#)))))
                . #12#)
          (LETT |lelt|
                (PROGN
                 (LETT #8# NIL . #12#)
                 (SEQ (LETT |k| NIL . #12#) (LETT #7# |yx| . #12#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS
                               (SPADCALL (QREFELT $ 11) |fsy|
                                         (|EXPRODE;localInteger|
                                          (LETT |m|
                                                (SPADCALL |m|
                                                          (|spadConstant| $ 35)
                                                          (QREFELT $ 68))
                                                . #12#)
                                          $)
                                         (QREFELT $ 39))
                               #8#)
                              . #12#)))
                      (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #12#)
          (LETT |sys|
                (PROGN
                 (LETT #6# NIL . #12#)
                 (SEQ (LETT |k| NIL . #12#) (LETT #5# (CDR |yx|) . #12#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (|EXPRODE;findEq| |k| |x| |sys| $) #6#)
                              . #12#)))
                      (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #12#)
          (LETT |l|
                (PROGN
                 (LETT #4# NIL . #12#)
                 (SEQ (LETT |eq| NIL . #12#) (LETT #3# |sys| . #12#) G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |eq| (CAR #3#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (|EXPRODE;checkSystem| |eq| |yx| |lelt| $)
                                    #4#)
                              . #12#)))
                      (LETT #3# (CDR #3#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #12#)
          (LETT |center| (SPADCALL |eqx| (QREFELT $ 56)) . #12#)
          (EXIT
           (SPADCALL
            (SPADCALL |l0|
                      (PROGN
                       (LETT #2# NIL . #12#)
                       (SEQ (LETT |f| NIL . #12#) (LETT #1# |l| . #12#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |f| (CAR #1#) . #12#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL |f| |sy|
                                               (|compiledLookupCheck|
                                                '|compiledFunction|
                                                (LIST
                                                 (LIST '|Mapping|
                                                       (LIST
                                                        '|UnivariateTaylorSeries|
                                                        (|devaluate| (ELT $ 7))
                                                        |x| |center|)
                                                       (LIST '|List|
                                                             (LIST
                                                              '|UnivariateTaylorSeries|
                                                              (|devaluate|
                                                               (ELT $ 7))
                                                              |x| |center|)))
                                                 (|devaluate| (ELT $ 7))
                                                 (LIST '|Symbol|))
                                                (|MakeUnaryCompiledFunction|
                                                 (ELT $ 7)
                                                 (|List|
                                                  (|UnivariateTaylorSeries|
                                                   (ELT $ 7) |x| |center|))
                                                 (|UnivariateTaylorSeries|
                                                  (ELT $ 7) |x| |center|))))
                                     #2#)
                                    . #12#)))
                            (LETT #1# (CDR #1#) . #12#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (|compiledLookupCheck| '|mpsode|
                                             (LIST
                                              (LIST '|List|
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| (ELT $ 7))
                                                     |x| |center|))
                                              (LIST '|List|
                                                    (|devaluate| (ELT $ 7)))
                                              (LIST '|List|
                                                    (LIST '|Mapping|
                                                          (LIST
                                                           '|UnivariateTaylorSeries|
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           |x| |center|)
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|UnivariateTaylorSeries|
                                                                 (|devaluate|
                                                                  (ELT $ 7))
                                                                 |x|
                                                                 |center|)))))
                                             (|UnivariateTaylorSeriesODESolver|
                                              (ELT $ 7)
                                              (|UnivariateTaylorSeries|
                                               (ELT $ 7) |x| |center|))))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|)
                                         (LIST '|List|
                                               (LIST '|UnivariateTaylorSeries|
                                                     (|devaluate| (ELT $ 7))
                                                     |x| |center|)))
                                   (|AnyFunctions1|
                                    (|List|
                                     (|UnivariateTaylorSeries| (ELT $ 7) |x|
                                                               |center|))))))))) 

(DECLAIM (NOTINLINE |ExpressionSpaceODESolver;|)) 

(DEFUN |ExpressionSpaceODESolver| (&REST #1=#:G818)
  (SPROG NIL
         (PROG (#2=#:G819)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionSpaceODESolver|)
                                               '|domainEqualList|)
                    . #3=(|ExpressionSpaceODESolver|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ExpressionSpaceODESolver;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExpressionSpaceODESolver|)))))))))) 

(DEFUN |ExpressionSpaceODESolver;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionSpaceODESolver|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ExpressionSpaceODESolver| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 91) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionSpaceODESolver|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL '|elt| (QREFELT $ 10)))
          (QSETREFV $ 12 (SPADCALL '|exquo| (QREFELT $ 10)))
          (QSETREFV $ 13 (SPADCALL '|integer| (QREFELT $ 10)))
          (QSETREFV $ 14 (|HasCategory| |#1| '(|IntegerNumberSystem|)))
          $))) 

(MAKEPROP '|ExpressionSpaceODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (|BasicOperator|) (0 . |operator|) '|opelt| '|opex| '|opint|
              '|Rint?| (5 . |elt|) (|Kernel| $) (11 . |retract|) (|Kernel| 7)
              (16 . |operator|) (|Boolean|) (21 . |is?|) (|List| 7)
              (27 . |argument|) (|List| $) (32 . |kernel|) (38 . |coerce|)
              (|Mapping| 7 18) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 18)
              (|PolynomialCategoryLifting| (|IndexedExponents| 18) 18 6 29 7)
              (43 . |map|) (|SparseMultivariatePolynomial| 6 16) (50 . |denom|)
              (55 . |One|) (59 . |One|) (63 . |One|) (67 . =) (73 . |numer|)
              (78 . |elt|) (|Fraction| (|SparseUnivariatePolynomial| $))
              (85 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (|Fraction| 42) (91 . |numer|) (|NonNegativeInteger|)
              (96 . |degree|) (101 . <=) (107 . |denom|) (112 . |ground?|)
              (117 . |Zero|) (121 . |coefficient|) (127 . /) (133 . -)
              (|Equation| 7) (138 . |lhs|) (143 . |rhs|) (148 . =)
              (154 . |coerce|) (159 . |differentiate|) (|List| 16)
              (165 . |kernels|) (|List| 18) (170 . |member?|) (176 . |subst|)
              (|Integer|) (183 . |minIndex|) (188 . |coerce|) (193 . +)
              (199 . |is?|) (205 . |Zero|) (209 . -) (|Any|) (|List| 9)
              (|List| 54) |EXPRODE;seriesSolve;LLELA;15|
              |EXPRODE;seriesSolve;LLELA;13| |EXPRODE;seriesSolve;LLELA;22|
              |EXPRODE;seriesSolve;LLELA;14| |EXPRODE;seriesSolve;FBo2EA;19|
              |EXPRODE;seriesSolve;EBo2EA;16| |EXPRODE;seriesSolve;FBoEFA;20|
              |EXPRODE;seriesSolve;EBoEFA;17| |EXPRODE;seriesSolve;FBoELA;21|
              |EXPRODE;seriesSolve;EBoELA;18| (|Union| 8 '"failed")
              (215 . |symbolIfCan|) (220 . |name|) (225 . |coerce|)
              (230 . |new|) (234 . |minIndex|))
           '#(|seriesSolve| 239) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 90
                                                 '(1 9 0 8 10 2 7 0 9 0 15 1 7
                                                   16 0 17 1 18 9 0 19 2 9 20 0
                                                   8 21 1 18 22 0 23 2 7 0 9 24
                                                   25 1 7 0 6 26 3 30 7 27 28
                                                   29 31 1 7 32 0 33 0 6 0 34 0
                                                   7 0 35 0 29 0 36 2 29 20 0 0
                                                   37 1 7 32 0 38 3 7 0 9 0 0
                                                   39 2 7 40 0 16 41 1 43 42 0
                                                   44 1 42 45 0 46 2 45 20 0 0
                                                   47 1 43 42 0 48 1 42 20 0 49
                                                   0 6 0 50 2 42 7 0 45 51 2 7
                                                   0 0 0 52 1 7 0 0 53 1 54 7 0
                                                   55 1 54 7 0 56 2 7 20 0 0 57
                                                   1 7 0 16 58 2 7 0 0 8 59 1 7
                                                   60 0 61 2 62 20 18 0 63 3 7
                                                   0 0 60 24 64 1 62 65 0 66 1
                                                   7 0 65 67 2 7 0 0 0 68 2 18
                                                   20 0 8 69 0 7 0 70 2 7 0 0 0
                                                   71 1 18 85 0 86 1 9 8 0 87 1
                                                   7 0 8 88 0 8 0 89 1 22 65 0
                                                   90 4 0 72 54 9 54 22 84 4 0
                                                   72 54 9 54 54 80 4 0 72 74
                                                   73 54 74 76 4 0 72 22 73 54
                                                   22 77 4 0 72 74 73 54 22 78
                                                   4 0 72 54 9 54 7 82 4 0 72
                                                   22 73 54 74 75 4 0 72 7 9 54
                                                   7 81 4 0 72 7 9 54 22 83 4 0
                                                   72 7 9 54 54 79)))))
           '|lookupComplete|)) 
