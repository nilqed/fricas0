
(SDEFUN |ODERTRIC;UP2SUP|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Polynomial| F)))
        (SPADCALL (ELT $ 12) |p| (QREFELT $ 16))) 

(SDEFUN |ODERTRIC;logDerOnly|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         ($ |List| (|Fraction| UP)))
        (SPROG ((#1=#:G734 NIL) (|s| NIL) (#2=#:G733 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|ODERTRIC;logDerOnly|))
                 (SEQ (LETT |s| NIL . #3#)
                      (LETT #1#
                            (QCDR
                             (SPADCALL |l| (|spadConstant| $ 20)
                                       (QREFELT $ 25)))
                            . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |s| (QREFELT $ 26)) |s|
                                         (QREFELT $ 27))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoML;3|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP) ($ |List| (|Fraction| UP)))
        (SPADCALL |l| |zeros| (ELT $ 29) (QREFELT $ 34))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoML;4|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP) ($ |List| (|Fraction| UP)))
        (SPADCALL |l| |zeros| (ELT $ 29) (QREFELT $ 36))) 

(SDEFUN |ODERTRIC;singRicDE;LodoML;5|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |List|
          (|Record| (|:| |frac| (|Fraction| UP))
                    (|:| |eq|
                         (|LinearOrdinaryDifferentialOperator2| UP
                                                                (|Fraction|
                                                                 UP))))))
        (SPADCALL |l| (CONS (|function| |ODERTRIC;solveModulo|) $) |ezfactor|
                  (QREFELT $ 42))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoMML;6|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP) ($ |List| (|Fraction| UP)))
        (SPADCALL (QCAR (SPADCALL |l| NIL (QREFELT $ 46))) |zeros| |ezfactor|
                  (QREFELT $ 36))) 

(SDEFUN |ODERTRIC;mapeval|
        ((|p| |SparseUnivariatePolynomial| (|Polynomial| F))
         (|ls| |List| (|Symbol|)) (|lv| |List| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|ODERTRIC;mapeval!0| (VECTOR $ |lv| |ls|)) |p|
                         (QREFELT $ 53)))) 

(SDEFUN |ODERTRIC;mapeval!0| ((|z| NIL) ($$ NIL))
        (PROG (|ls| |lv| $)
          (LETT |ls| (QREFELT $$ 2) . #1=(|ODERTRIC;mapeval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z| |ls| |lv| (QREFELT $ 49))
                      (QREFELT $ 50)))))) 

(SDEFUN |ODERTRIC;FifCan|
        ((|f| |Fraction| (|Polynomial| F)) ($ |Union| F #1="failed"))
        (SPROG ((#2=#:G763 NIL) (|d| #3=(|Union| F "failed")) (|n| #3#))
               (SEQ
                (COND
                 ((QEQCAR
                   (LETT |n|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 55))
                                   (QREFELT $ 57))
                         . #4=(|ODERTRIC;FifCan|))
                   0)
                  (COND
                   ((QEQCAR
                     (LETT |d|
                           (SPADCALL (SPADCALL |f| (QREFELT $ 58))
                                     (QREFELT $ 57))
                           . #4#)
                     0)
                    (EXIT
                     (CONS 0
                           (SPADCALL
                            (PROG2 (LETT #2# |n| . #4#)
                                (QCDR #2#)
                              (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                              (|Union| (QREFELT $ 6) #1#) #2#))
                            (PROG2 (LETT #2# |d| . #4#)
                                (QCDR #2#)
                              (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                              (|Union| (QREFELT $ 6) #1#) #2#))
                            (QREFELT $ 59))))))))
                (EXIT (CONS 1 "failed"))))) 

(SDEFUN |ODERTRIC;genericPolynomial|
        ((|s| |Symbol|) (|n| |Integer|)
         ($ |Record|
          (|:| |poly| (|SparseUnivariatePolynomial| (|Polynomial| F)))
          (|:| |vars| (|List| (|Symbol|)))))
        (SPROG
         ((|l| (|List| (|Symbol|)))
          (|ans| (|SparseUnivariatePolynomial| (|Polynomial| F)))
          (|sy| (|Symbol|)) (#1=#:G775 NIL) (|i| NIL))
         (SEQ
          (LETT |ans| (|spadConstant| $ 60)
                . #2=(|ODERTRIC;genericPolynomial|))
          (LETT |l| NIL . #2#)
          (SEQ (LETT |i| 0 . #2#) (LETT #1# |n| . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL
                                  (LETT |sy| (SPADCALL |s| (QREFELT $ 61))
                                        . #2#)
                                  (QREFELT $ 62))
                                 |i| (QREFELT $ 64))
                                (QREFELT $ 65))
                      . #2#)
                (EXIT (LETT |l| (CONS |sy| |l|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |ans| (NREVERSE |l|)))))) 

(SDEFUN |ODERTRIC;ratsln|
        ((|l| |List| (|Equation| (|Fraction| (|Polynomial| F))))
         ($ |Union|
          (|Record| (|:| |var| (|List| (|Symbol|))) (|:| |val| (|List| F)))
          "failed"))
        (SPROG
         ((|ls| (|List| (|Symbol|))) (|lv| (|List| F)) (#1=#:G792 NIL)
          (#2=#:G793 NIL) (|v| (|Union| (|Symbol|) "failed"))
          (|u| (|Union| F "failed")) (#3=#:G794 NIL) (|eq| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ls| NIL . #4=(|ODERTRIC;ratsln|)) (LETT |lv| NIL . #4#)
                (SEQ (LETT |eq| NIL . #4#) (LETT #3# |l| . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |eq| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (SEQ
                         (LETT |u|
                               (|ODERTRIC;FifCan|
                                (SPADCALL |eq| (QREFELT $ 67)) $)
                               . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |u| 1)
                            (PROGN
                             (LETT #1#
                                   (PROGN
                                    (LETT #2# (CONS 1 #5="failed") . #4#)
                                    (GO #6=#:G791))
                                   . #4#)
                             (GO #7=#:G788)))
                           ('T
                            (SEQ
                             (LETT |v|
                                   (SPADCALL (SPADCALL |eq| (QREFELT $ 68))
                                             (QREFELT $ 70))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |v| 1)
                                (PROGN
                                 (LETT #1#
                                       (PROGN
                                        (LETT #2# (CONS 1 #5#) . #4#)
                                        (GO #6#))
                                       . #4#)
                                 (GO #7#))))))))))
                        (LETT |lv| (CONS (QCDR |u|) |lv|) . #4#)
                        (EXIT (LETT |ls| (CONS (QCDR |v|) |ls|) . #4#))))
                      #7# (EXIT #1#))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (CONS |ls| |lv|)))))
          #6# (EXIT #2#)))) 

(SDEFUN |ODERTRIC;ratsol|
        ((|l| |List| (|List| (|Equation| (|Fraction| (|Polynomial| F)))))
         ($ |List|
          (|Record| (|:| |var| (|List| (|Symbol|))) (|:| |val| (|List| F)))))
        (SPROG
         ((|ans|
           (|List|
            (|Record| (|:| |var| (|List| (|Symbol|))) (|:| |val| (|List| F)))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|List| (|Symbol|))) (|:| |val| (|List| F)))
            "failed"))
          (#1=#:G803 NIL) (|sol| NIL))
         (SEQ (LETT |ans| NIL . #2=(|ODERTRIC;ratsol|))
              (SEQ (LETT |sol| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |u| (|ODERTRIC;ratsln| |sol| $) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (LETT |ans| (CONS (QCDR |u|) |ans|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODERTRIC;polyRicDE;LodoML;12|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         ($ |List|
          #1=(|Record| (|:| |poly| UP)
                       (|:| |eq|
                            (|LinearOrdinaryDifferentialOperator2| UP
                                                                   (|Fraction|
                                                                    UP))))))
        (SPROG
         ((|ans| (|List| #1#)) (|p| (UP)) (#2=#:G828 NIL) (|a| NIL)
          (#3=#:G827 NIL) (|rec| NIL)
          (|lc|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP)))))
         (SEQ
          (LETT |ans| (LIST (CONS (|spadConstant| $ 18) |l|))
                . #4=(|ODERTRIC;polyRicDE;LodoML;12|))
          (EXIT
           (COND ((NULL (LETT |lc| (SPADCALL |l| (QREFELT $ 73)) . #4#)) |ans|)
                 ('T
                  (SEQ
                   (SEQ (LETT |rec| NIL . #4#) (LETT #3# (REVERSE |lc|) . #4#)
                        G190
                        (COND
                         ((OR (ATOM #3#)
                              (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |a| NIL . #4#)
                               (LETT #2# (SPADCALL (QCDR |rec|) |zeros|) . #4#)
                               G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |a| (CAR #2#) . #4#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL |a| (|spadConstant| $ 17)
                                             (QREFELT $ 75))
                                   (COND
                                    ((SPADCALL
                                      (LETT |p|
                                            (|ODERTRIC;newtonSolution| |l| |a|
                                             (QCAR |rec|) |zeros| $)
                                            . #4#)
                                      (|spadConstant| $ 18) (QREFELT $ 76))
                                     (LETT |ans|
                                           (CONS
                                            (CONS |p|
                                                  (SPADCALL |l| |p|
                                                            (QREFELT $ 77)))
                                            |ans|)
                                           . #4#)))))))
                               (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                   (EXIT |ans|)))))))) 

(SDEFUN |ODERTRIC;reverseUP|
        ((|p| UP) ($ |UnivariateTaylorSeries| F |dummy| (|Zero|)))
        (SPROG
         ((|ans| (|UnivariateTaylorSeries| F |dummy| (|Zero|))) (#1=#:G829 NIL)
          (|n| (|Integer|)))
         (SEQ (LETT |ans| (|spadConstant| $ 82) . #2=(|ODERTRIC;reverseUP|))
              (LETT |n| (SPADCALL |p| (QREFELT $ 83)) . #2#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |p| (|spadConstant| $ 18) (QREFELT $ 76)))
                     (GO G191)))
                   (SEQ
                    (LETT |ans|
                          (SPADCALL |ans|
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 84))
                                              (PROG1
                                                  (LETT #1#
                                                        (- |n|
                                                           (SPADCALL |p|
                                                                     (QREFELT $
                                                                              83)))
                                                        . #2#)
                                                (|check_subtype2| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #1#))
                                              (QREFELT $ 85))
                                    (QREFELT $ 86))
                          . #2#)
                    (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 87)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODERTRIC;reverseUTS|
        ((|s| |UnivariateTaylorSeries| F |dummy| (|Zero|))
         (|n| |NonNegativeInteger|) ($ UP))
        (SPROG
         ((#1=#:G835 NIL) (#2=#:G834 (UP)) (#3=#:G836 (UP)) (#4=#:G837 NIL)
          (#5=#:G839 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|ODERTRIC;reverseUTS|))
           (SEQ (LETT |i| 0 . #6#) (LETT #5# |n| . #6#) G190
                (COND ((|greater_SI| |i| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL |s| |i| (QREFELT $ 88))
                                   (PROG1 (LETT #4# (- |n| |i|) . #6#)
                                     (|check_subtype2| (>= #4# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #4#))
                                   (QREFELT $ 89))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 90)) . #6#))
                    ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 18))))))) 

(SDEFUN |ODERTRIC;newtonSolution|
        ((|l| . #1=(|LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP)))
         (|a| F) (|n| |NonNegativeInteger|) (|zeros| |Mapping| (|List| F) UP)
         ($ UP))
        (SPROG
         ((|sols| (|List| UP)) (#2=#:G863 NIL) (|sol| NIL) (#3=#:G862 NIL)
          (|neq| (|LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP)))
          (|atn| (UP))
          (|u|
           (|Union| (|UnivariateTaylorSeries| F |dummy| (|Zero|)) "failed"))
          (|aeq|
           (|SparseUnivariatePolynomial|
            (|UnivariateTaylorSeries| F |dummy| (|Zero|))))
          (|s| (|UnivariateTaylorSeries| F |dummy| (|Zero|))) (#4=#:G850 NIL)
          (|d| (|NonNegativeInteger|)) (|c| (UP)) (|m| (|Integer|)) (|op| #1#)
          (|mu| (|NonNegativeInteger|)))
         (SEQ (LETT |m| 0 . #5=(|ODERTRIC;newtonSolution|))
              (LETT |aeq| (|spadConstant| $ 92) . #5#) (LETT |op| |l| . #5#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |op| (|spadConstant| $ 93) (QREFELT $ 94)))
                     (GO G191)))
                   (SEQ
                    (LETT |mu|
                          (+ (* (SPADCALL |op| (QREFELT $ 95)) |n|)
                             (SPADCALL (SPADCALL |op| (QREFELT $ 96))
                                       (QREFELT $ 83)))
                          . #5#)
                    (LETT |op| (SPADCALL |op| (QREFELT $ 97)) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL |mu| |m| (QREFELT $ 99))
                       (LETT |m| |mu| . #5#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |l| (|spadConstant| $ 93) (QREFELT $ 94)))
                     (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |l| (QREFELT $ 96)) . #5#)
                        (LETT |d| (SPADCALL |l| (QREFELT $ 95)) . #5#)
                        (LETT |s|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 100)
                                         (PROG1
                                             (LETT #4#
                                                   (- (- |m| (* |d| |n|))
                                                      (SPADCALL |c|
                                                                (QREFELT $
                                                                         83)))
                                                   . #5#)
                                           (|check_subtype2| (>= #4# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #4#))
                                         (QREFELT $ 85))
                               (|ODERTRIC;reverseUP| |c| $) (QREFELT $ 102))
                              . #5#)
                        (LETT |aeq|
                              (SPADCALL |aeq|
                                        (SPADCALL |s| |d| (QREFELT $ 103))
                                        (QREFELT $ 104))
                              . #5#)
                        (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 97)) . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |u| (|ODERTRIC;newtonSolve| |aeq| |a| |n| $) . #5#)
              (EXIT
               (COND ((QEQCAR |u| 0) (|ODERTRIC;reverseUTS| (QCDR |u|) |n| $))
                     (#6='T
                      (SEQ (LETT |atn| (SPADCALL |a| |n| (QREFELT $ 89)) . #5#)
                           (LETT |neq| (SPADCALL |l| |atn| (QREFELT $ 77))
                                 . #5#)
                           (LETT |sols|
                                 (PROGN
                                  (LETT #3# NIL . #5#)
                                  (SEQ (LETT |sol| NIL . #5#)
                                       (LETT #2#
                                             (SPADCALL |neq| |zeros|
                                                       (QREFELT $ 80))
                                             . #5#)
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |sol| (CAR #2#) . #5#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((<
                                            (SPADCALL (QCAR |sol|)
                                                      (QREFELT $ 83))
                                            |n|)
                                           (LETT #3# (CONS (QCAR |sol|) #3#)
                                                 . #5#)))))
                                       (LETT #2# (CDR #2#) . #5#) (GO G190)
                                       G191 (EXIT (NREVERSE #3#))))
                                 . #5#)
                           (EXIT
                            (COND ((NULL |sols|) |atn|)
                                  (#6#
                                   (SPADCALL |atn| (|SPADfirst| |sols|)
                                             (QREFELT $ 90)))))))))))) 

(SDEFUN |ODERTRIC;newtonSolve|
        ((|eq| |SparseUnivariatePolynomial|
          (|UnivariateTaylorSeries| F |dummy| (|Zero|)))
         (|a| F) (|n| |NonNegativeInteger|)
         ($ |Union| (|UnivariateTaylorSeries| F |dummy| (|Zero|)) "failed"))
        (SPROG
         ((|sol| (|UnivariateTaylorSeries| F |dummy| (|Zero|))) (#1=#:G871 NIL)
          (|xquo|
           (|Union| (|UnivariateTaylorSeries| F |dummy| (|Zero|)) "failed"))
          (#2=#:G872 NIL) (|i| NIL)
          (|deq|
           (|SparseUnivariatePolynomial|
            (|UnivariateTaylorSeries| F |dummy| (|Zero|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |deq| (SPADCALL |eq| (QREFELT $ 105))
                  . #3=(|ODERTRIC;newtonSolve|))
            (LETT |sol| (SPADCALL |a| (QREFELT $ 106)) . #3#)
            (SEQ (LETT |i| 1 . #3#) (LETT #2# |n| . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |xquo|
                        (SPADCALL (SPADCALL |eq| |sol| (QREFELT $ 107))
                                  (SPADCALL |deq| |sol| (QREFELT $ 107))
                                  (QREFELT $ 109))
                        . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |xquo| 1)
                     (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #4=#:G870)))
                    ('T
                     (LETT |sol|
                           (SPADCALL
                            (SPADCALL |sol| (QCDR |xquo|) (QREFELT $ 110)) |i|
                            (QREFELT $ 111))
                           . #3#)))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |sol|))))
          #4# (EXIT #1#)))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoMML;17|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP)
         (|ezfactor| |Mapping| (|Factored| UP) UP) ($ |List| (|Fraction| UP)))
        (SPROG
         ((#1=#:G882 NIL) (#2=#:G883 NIL) (|ans| (|List| (|Fraction| UP)))
          (#3=#:G886 NIL) (|f| NIL) (#4=#:G885 NIL) (#5=#:G884 NIL) (|rec| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |l| (QREFELT $ 95))
                  . #6=(|ODERTRIC;ricDsolve;LodoMML;17|))
            (LETT |ans| NIL . #6#)
            (SEQ (LETT |rec| NIL . #6#)
                 (LETT #5# (SPADCALL |l| |ezfactor| (QREFELT $ 43)) . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |ans|
                          (SPADCALL
                           (SPADCALL |ans|
                                     (PROGN
                                      (LETT #4# NIL . #6#)
                                      (SEQ (LETT |f| NIL . #6#)
                                           (LETT #3#
                                                 (|ODERTRIC;nonSingSolve| |n|
                                                  (QCDR |rec|) |zeros| $)
                                                 . #6#)
                                           G190
                                           (COND
                                            ((OR (ATOM #3#)
                                                 (PROGN
                                                  (LETT |f| (CAR #3#) . #6#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #4#
                                                   (CONS
                                                    (SPADCALL (QCAR |rec|) |f|
                                                              (QREFELT $ 112))
                                                    #4#)
                                                   . #6#)))
                                           (LETT #3# (CDR #3#) . #6#) (GO G190)
                                           G191 (EXIT (NREVERSE #4#))))
                                     (QREFELT $ 113))
                           (QREFELT $ 114))
                          . #6#)
                    (EXIT
                     (COND
                      ((EQL (LENGTH |ans|) |n|)
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# |ans| . #6#) (GO #7=#:G881))
                              . #6#)
                        (GO #8=#:G878)))))))
                  #8# (EXIT #1#))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT |ans|)))
          #7# (EXIT #2#)))) 

(SDEFUN |ODERTRIC;nonSingSolve|
        ((|n| |NonNegativeInteger|)
         (|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP) ($ |List| (|Fraction| UP)))
        (SPROG
         ((#1=#:G897 NIL) (#2=#:G898 NIL) (|ans| (|List| (|Fraction| UP)))
          (#3=#:G899 NIL) (|rec| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| NIL . #4=(|ODERTRIC;nonSingSolve|))
                (SEQ (LETT |rec| NIL . #4#)
                     (LETT #3# (SPADCALL |l| |zeros| (QREFELT $ 80)) . #4#)
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL |ans|
                                         (|ODERTRIC;nopoly| |n| (QCAR |rec|)
                                          (QCDR |rec|) |zeros| $)
                                         (QREFELT $ 113))
                               (QREFELT $ 114))
                              . #4#)
                        (EXIT
                         (COND
                          ((EQL (LENGTH |ans|) |n|)
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# |ans| . #4#) (GO #5=#:G896))
                                  . #4#)
                            (GO #6=#:G893)))))))
                      #6# (EXIT #1#))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
          #5# (EXIT #2#)))) 

(SDEFUN |ODERTRIC;constantRic|
        ((|p| UP) (|zeros| |Mapping| (|List| F) UP) ($ |List| F))
        (COND ((ZEROP (SPADCALL |p| (QREFELT $ 83))) NIL)
              ('T (SPADCALL (SPADCALL |p| (QREFELT $ 115)) |zeros|)))) 

(SDEFUN |ODERTRIC;nopoly|
        ((|n| |NonNegativeInteger|) (|p| UP)
         (|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|zeros| |Mapping| (|List| F) UP) ($ |List| (|Fraction| UP)))
        (SPROG
         ((#1=#:G910 NIL) (#2=#:G911 NIL) (|ans| (|List| (|Fraction| UP)))
          (#3=#:G914 NIL) (|f| NIL) (#4=#:G913 NIL) (#5=#:G912 NIL)
          (|rec| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| NIL . #6=(|ODERTRIC;nopoly|))
                (SEQ (LETT |rec| NIL . #6#)
                     (LETT #5#
                           (SPADCALL |l|
                                     (CONS #'|ODERTRIC;nopoly!0|
                                           (VECTOR $ |zeros|))
                                     (QREFELT $ 118))
                           . #6#)
                     G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL |ans|
                                         (PROGN
                                          (LETT #4# NIL . #6#)
                                          (SEQ (LETT |f| NIL . #6#)
                                               (LETT #3#
                                                     (|ODERTRIC;logDerOnly|
                                                      (QCDR |rec|) $)
                                                     . #6#)
                                               G190
                                               (COND
                                                ((OR (ATOM #3#)
                                                     (PROGN
                                                      (LETT |f| (CAR #3#)
                                                            . #6#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #4#
                                                       (CONS
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QCAR |rec|)
                                                            (QREFELT $ 119))
                                                           |p| (QREFELT $ 90))
                                                          (QREFELT $ 120))
                                                         |f| (QREFELT $ 112))
                                                        #4#)
                                                       . #6#)))
                                               (LETT #3# (CDR #3#) . #6#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #4#))))
                                         (QREFELT $ 113))
                               (QREFELT $ 114))
                              . #6#)
                        (EXIT
                         (COND
                          ((EQL (LENGTH |ans|) |n|)
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# |ans| . #6#) (GO #7=#:G909))
                                  . #6#)
                            (GO #8=#:G906)))))))
                      #8# (EXIT #1#))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
          #7# (EXIT #2#)))) 

(SDEFUN |ODERTRIC;nopoly!0| ((|z| NIL) ($$ NIL))
        (PROG (|zeros| $)
          (LETT |zeros| (QREFELT $$ 1) . #1=(|ODERTRIC;nopoly|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ODERTRIC;constantRic| |z| |zeros| $))))) 

(SDEFUN |ODERTRIC;solveModulo|
        ((|c| UP) (|h| |SparseUnivariatePolynomial| UP) ($ |List| UP))
        (SPROG
         ((#1=#:G925 NIL) (|s| NIL) (#2=#:G924 NIL)
          (|sol|
           (|List|
            (|Record| (|:| |var| (|List| (|Symbol|))) (|:| |val| (|List| F)))))
          (|unk| (|SparseUnivariatePolynomial| (|Polynomial| F)))
          (|rec|
           (|Record|
            (|:| |poly| (|SparseUnivariatePolynomial| (|Polynomial| F)))
            (|:| |vars| (|List| (|Symbol|))))))
         (SEQ
          (LETT |rec|
                (|ODERTRIC;genericPolynomial| (QREFELT $ 10)
                 (- (SPADCALL |c| (QREFELT $ 83)) 1) $)
                . #3=(|ODERTRIC;solveModulo|))
          (LETT |unk| (|spadConstant| $ 60) . #3#)
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |h| (QREFELT $ 122)))) (GO G191)))
               (SEQ
                (LETT |unk|
                      (SPADCALL |unk|
                                (SPADCALL
                                 (|ODERTRIC;UP2SUP|
                                  (SPADCALL |h| (QREFELT $ 123)) $)
                                 (SPADCALL (QCAR |rec|)
                                           (SPADCALL |h| (QREFELT $ 124))
                                           (QREFELT $ 125))
                                 (QREFELT $ 126))
                                (QREFELT $ 65))
                      . #3#)
                (EXIT (LETT |h| (SPADCALL |h| (QREFELT $ 127)) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |sol|
                (|ODERTRIC;ratsol|
                 (SPADCALL
                  (SPADCALL
                   (QCDR
                    (SPADCALL |unk| (|ODERTRIC;UP2SUP| |c| $) (QREFELT $ 129)))
                   (QREFELT $ 131))
                  (QCDR |rec|) (QREFELT $ 134))
                 $)
                . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |s| NIL . #3#) (LETT #1# |sol| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (|ODERTRIC;mapeval| (QCAR |rec|) (QCAR |s|)
                           (QCDR |s|) $)
                          #2#)
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoL;22|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         ($ |List| (|Fraction| UP)))
        (SPADCALL |l| (ELT $ 29) (QREFELT $ 135))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoL;23|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         ($ |List| (|Fraction| UP)))
        (SPADCALL |l| (ELT $ 29) (QREFELT $ 137))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoML;24|
        ((|l| |LinearOrdinaryDifferentialOperator2| UP (|Fraction| UP))
         (|ezfactor| |Mapping| (|Factored| UP) UP) ($ |List| (|Fraction| UP)))
        (SPROG NIL
               (SPADCALL |l|
                         (CONS #'|ODERTRIC;ricDsolve;LodoML;24!0|
                               (VECTOR $ |ezfactor|))
                         |ezfactor| (QREFELT $ 36)))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoML;24!0| ((|z| NIL) ($$ NIL))
        (PROG (|ezfactor| $)
          (LETT |ezfactor| (QREFELT $$ 1)
                . #1=(|ODERTRIC;ricDsolve;LodoML;24|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ODERTRIC;zro| |z| |ezfactor| $))))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoML;25|
        ((|l| |LinearOrdinaryDifferentialOperator1| (|Fraction| UP))
         (|ezfactor| |Mapping| (|Factored| UP) UP) ($ |List| (|Fraction| UP)))
        (SPROG NIL
               (SPADCALL |l|
                         (CONS #'|ODERTRIC;ricDsolve;LodoML;25!0|
                               (VECTOR $ |ezfactor|))
                         |ezfactor| (QREFELT $ 34)))) 

(SDEFUN |ODERTRIC;ricDsolve;LodoML;25!0| ((|z| NIL) ($$ NIL))
        (PROG (|ezfactor| $)
          (LETT |ezfactor| (QREFELT $$ 1)
                . #1=(|ODERTRIC;ricDsolve;LodoML;25|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ODERTRIC;zro| |z| |ezfactor| $))))) 

(SDEFUN |ODERTRIC;zro|
        ((|p| UP) (|ezfactor| |Mapping| (|Factored| UP) UP) ($ |List| F))
        (SPROG ((#1=#:G950 NIL) (|r| NIL) (#2=#:G949 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|ODERTRIC;zro|))
                  (SEQ (LETT |r| NIL . #3#)
                       (LETT #1#
                             (SPADCALL (SPADCALL |p| |ezfactor|)
                                       (QREFELT $ 142))
                             . #3#)
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|ODERTRIC;zro1| (QCAR |r|) $) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 144))))) 

(SDEFUN |ODERTRIC;zro1| ((|p| UP) ($ |List| F))
        (LIST
         (SPADCALL (SPADCALL (LIST #'|ODERTRIC;zro1!0|) |p| (QREFELT $ 148))
                   (QREFELT $ 150)))) 

(SDEFUN |ODERTRIC;zro1!0| ((|z| NIL) ($$ NIL)) |z|) 

(DECLAIM (NOTINLINE |RationalRicDE;|)) 

(DEFUN |RationalRicDE| (&REST #1=#:G954)
  (SPROG NIL
         (PROG (#2=#:G955)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RationalRicDE|)
                                               '|domainEqualList|)
                    . #3=(|RationalRicDE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RationalRicDE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RationalRicDE|)))))))))) 

(DEFUN |RationalRicDE;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalRicDE|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|RationalRicDE| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 151) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|AlgebraicallyClosedField|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|RationalRicDE| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 136
                       (CONS (|dispatchFunction| |ODERTRIC;ricDsolve;LodoL;22|)
                             $))
             (QSETREFV $ 138
                       (CONS (|dispatchFunction| |ODERTRIC;ricDsolve;LodoL;23|)
                             $))
             (QSETREFV $ 135
                       (CONS
                        (|dispatchFunction| |ODERTRIC;ricDsolve;LodoML;24|) $))
             (QSETREFV $ 137
                       (CONS
                        (|dispatchFunction| |ODERTRIC;ricDsolve;LodoML;25|)
                        $)))))
          $))) 

(MAKEPROP '|RationalRicDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|dummy| (|Polynomial| 6) (4 . |coerce|)
              (|SparseUnivariatePolynomial| 11) (|Mapping| 11 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 11 13) (9 . |map|)
              (15 . |Zero|) (19 . |Zero|) (|Fraction| 7) (23 . |Zero|)
              (|Union| 19 '"failed")
              (|Record| (|:| |particular| 21) (|:| |basis| 30))
              (|LinearOrdinaryDifferentialOperator2| 7 19) (|RationalLODE| 6 7)
              (27 . |ratDsolve|) (33 . |differentiate|) (38 . /) (|Factored| $)
              (44 . |squareFree|) (|List| 19)
              (|LinearOrdinaryDifferentialOperator1| 19) (|Mapping| 48 7)
              (|Mapping| 141 7) |ODERTRIC;ricDsolve;LodoMML;6|
              |ODERTRIC;ricDsolve;LodoML;3| |ODERTRIC;ricDsolve;LodoMML;17|
              |ODERTRIC;ricDsolve;LodoML;4|
              (|Record| (|:| |frac| 19) (|:| |eq| 23)) (|List| 38)
              (|Mapping| (|List| 7) 7 121) (|PrimitiveRatRicDE| 6 7 23 31)
              (49 . |singRicDE|) |ODERTRIC;singRicDE;LodoML;5|
              (|Record| (|:| |eq| 23) (|:| |rh| 30))
              (|PrimitiveRatDE| 6 7 23 31) (56 . |splitDenominator|) (|List| 8)
              (|List| 6) (62 . |eval|) (69 . |ground|) (|Mapping| 6 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 13 6 7) (74 . |map|)
              (|Fraction| 11) (80 . |numer|) (|Union| 6 '"failed")
              (85 . |retractIfCan|) (90 . |denom|) (95 . /) (101 . |Zero|)
              (105 . |new|) (110 . |coerce|) (|NonNegativeInteger|)
              (115 . |monomial|) (121 . +) (|Equation| 54) (127 . |rhs|)
              (132 . |lhs|) (|Union| 8 '"failed") (137 . |retractIfCan|)
              (|Record| (|:| |deg| 63) (|:| |eq| 7)) (|List| 71)
              (142 . |leadingCoefficientRicDE|) (|Boolean|) (147 . ~=)
              (153 . ~=) (159 . |changeVar|)
              (|Record| (|:| |poly| 7) (|:| |eq| 23)) (|List| 78)
              |ODERTRIC;polyRicDE;LodoML;12|
              (|UnivariateTaylorSeries| 6 (NRTEVAL (QREFELT $ 10))
                                        (NRTEVAL (|spadConstant| $ 17)))
              (165 . |Zero|) (169 . |degree|) (174 . |leadingCoefficient|)
              (179 . |monomial|) (185 . +) (191 . |reductum|)
              (196 . |coefficient|) (202 . |monomial|) (208 . +)
              (|SparseUnivariatePolynomial| 81) (214 . |Zero|) (218 . |Zero|)
              (222 . ~=) (228 . |degree|) (233 . |leadingCoefficient|)
              (238 . |reductum|) (|Integer|) (243 . >) (249 . |One|)
              (253 . |One|) (257 . *) (263 . |monomial|) (269 . +)
              (275 . |differentiate|) (280 . |coerce|) (285 . |elt|)
              (|Union| $ '"failed") (291 . |exquo|) (297 . -)
              (303 . |truncate|) (309 . +) (315 . |concat!|)
              (321 . |removeDuplicates!|) (326 . |squareFreePart|)
              (|Record| (|:| |constant| 6) (|:| |eq| 23)) (|List| 116)
              (331 . |constantCoefficientRicDE|) (337 . |coerce|)
              (342 . |coerce|) (|SparseUnivariatePolynomial| 7) (347 . |zero?|)
              (352 . |leadingCoefficient|) (357 . |degree|) (362 . ^) (368 . *)
              (374 . |reductum|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (379 . |monicDivide|) (|List| 11) (385 . |coefficients|)
              (|List| (|List| 66)) (|NonLinearSolvePackage| 6) (390 . |solve|)
              (396 . |ricDsolve|) (402 . |ricDsolve|) (407 . |ricDsolve|)
              (413 . |ricDsolve|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 98)) (|List| 139)
              (|Factored| 7) (418 . |factors|) (|List| $) (423 . |concat|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 6 145)
              (428 . |map|) (|SparseUnivariatePolynomial| $) (434 . |zeroOf|))
           '#(|singRicDE| 439 |ricDsolve| 445 |polyRicDE| 493) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 150
                                                 '(0 8 0 9 1 11 0 6 12 2 15 13
                                                   14 7 16 0 6 0 17 0 7 0 18 0
                                                   19 0 20 2 24 22 23 19 25 1
                                                   19 0 0 26 2 19 0 0 0 27 1 7
                                                   28 0 29 3 41 39 23 40 33 42
                                                   2 45 44 31 30 46 3 11 0 0 47
                                                   48 49 1 11 6 0 50 2 52 7 51
                                                   13 53 1 54 11 0 55 1 11 56 0
                                                   57 1 54 11 0 58 2 6 0 0 0 59
                                                   0 13 0 60 1 8 0 0 61 1 11 0
                                                   8 62 2 13 0 11 63 64 2 13 0
                                                   0 0 65 1 66 54 0 67 1 66 54
                                                   0 68 1 54 69 0 70 1 41 72 23
                                                   73 2 6 74 0 0 75 2 7 74 0 0
                                                   76 2 41 23 23 7 77 0 81 0 82
                                                   1 7 63 0 83 1 7 6 0 84 2 81
                                                   0 6 63 85 2 81 0 0 0 86 1 7
                                                   0 0 87 2 81 6 0 63 88 2 7 0
                                                   6 63 89 2 7 0 0 0 90 0 91 0
                                                   92 0 23 0 93 2 23 74 0 0 94
                                                   1 23 63 0 95 1 23 7 0 96 1
                                                   23 0 0 97 2 98 74 0 0 99 0 6
                                                   0 100 0 7 0 101 2 81 0 0 0
                                                   102 2 91 0 81 63 103 2 91 0
                                                   0 0 104 1 91 0 0 105 1 81 0
                                                   6 106 2 91 81 0 81 107 2 81
                                                   108 0 0 109 2 81 0 0 0 110 2
                                                   81 0 0 63 111 2 19 0 0 0 112
                                                   2 30 0 0 0 113 1 30 0 0 114
                                                   1 7 0 0 115 2 41 117 23 32
                                                   118 1 7 0 6 119 1 19 0 7 120
                                                   1 121 74 0 122 1 121 7 0 123
                                                   1 121 63 0 124 2 13 0 0 63
                                                   125 2 13 0 0 0 126 1 121 0 0
                                                   127 2 13 128 0 0 129 1 13
                                                   130 0 131 2 133 132 130 47
                                                   134 2 0 30 23 33 135 1 0 30
                                                   23 136 2 0 30 31 33 137 1 0
                                                   30 31 138 1 141 140 0 142 1
                                                   48 0 143 144 2 147 145 146 7
                                                   148 1 6 0 149 150 2 0 39 23
                                                   33 43 1 1 30 31 138 2 1 30
                                                   31 33 137 2 1 30 23 33 135 1
                                                   1 30 23 136 3 0 30 31 32 33
                                                   34 2 0 30 31 32 35 2 0 30 23
                                                   32 37 3 0 30 23 32 33 36 2 0
                                                   79 23 32 80)))))
           '|lookupComplete|)) 
