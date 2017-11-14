
(SDEFUN |INTTOOLS;union;3L;1|
        ((|l1| |List| (|Kernel| F)) (|l2| |List| (|Kernel| F))
         ($ |List| (|Kernel| F)))
        (SPADCALL |l1| |l2| (QREFELT $ 10))) 

(SDEFUN |INTTOOLS;varselect;LSL;2|
        ((|l| |List| (|Kernel| F)) (|x| |Symbol|) ($ |List| (|Kernel| F)))
        (SPROG ((#1=#:G722 NIL) (|k| NIL) (#2=#:G721 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|INTTOOLS;varselect;LSL;2|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |x|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 13))
                                              (QREFELT $ 15))
                                    (QREFELT $ 18))
                          (LETT #2# (CONS |k| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |INTTOOLS;ksec;KLSK;3|
        ((|k| |Kernel| F) (|l| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |Kernel| F))
        (SPADCALL
         (SPADCALL (SPADCALL |k| |l| (QREFELT $ 21))
                   (SPADCALL (SPADCALL |k| (QREFELT $ 23)) |x| (QREFELT $ 24))
                   (QREFELT $ 10))
         (QREFELT $ 25))) 

(SDEFUN |INTTOOLS;vark;LSL;4|
        ((|l| |List| F) (|x| |Symbol|) ($ |List| (|Kernel| F)))
        (SPROG ((#1=#:G730 NIL) (|f| NIL) (#2=#:G729 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL (ELT $ 10)
                           (PROGN
                            (LETT #2# NIL . #3=(|INTTOOLS;vark;LSL;4|))
                            (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |f| (QREFELT $ 28))
                                               #2#)
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           NIL (QREFELT $ 31))
                 |x| (QREFELT $ 19))))) 

(SDEFUN |INTTOOLS;kmax;LK;5| ((|l| |List| (|Kernel| F)) ($ |Kernel| F))
        (SPROG ((|ans| (|Kernel| F)) (#1=#:G735 NIL) (|k| NIL))
               (SEQ (LETT |ans| (|SPADfirst| |l|) . #2=(|INTTOOLS;kmax;LK;5|))
                    (SEQ (LETT |k| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|INTTOOLS;better?| |k| |ans| $)
                             (LETT |ans| |k| . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |INTTOOLS;better?| ((|x| |Kernel| F) (|y| |Kernel| F) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |y| (QREFELT $ 33)) (SPADCALL |x| (QREFELT $ 33))
                    (QREFELT $ 34))
          (< (SPADCALL |y| (QREFELT $ 33)) (SPADCALL |x| (QREFELT $ 33))))
         ((SPADCALL (SPADCALL |y| (QREFELT $ 36)) (QREFELT $ 8) (QREFELT $ 37))
          'T)
         ((SPADCALL |y| '|exp| (QREFELT $ 38))
          (COND ((SPADCALL |x| '|exp| (QREFELT $ 38)) NIL)
                (#1='T
                 (NULL
                  (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 8)
                            (QREFELT $ 37))))))
         (#1# NIL))) 

(SDEFUN |INTTOOLS;removeConstantTerm;FSF;7| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((|ans| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#1=#:G756 NIL) (|term| NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
                    "failed"))
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|den| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (COND
           ((NULL
             (SPADCALL
              (SPADCALL
               (LETT |den| (SPADCALL |f| (QREFELT $ 40))
                     . #2=(|INTTOOLS;removeConstantTerm;FSF;7|))
               (QREFELT $ 41))
              |x| (QREFELT $ 42)))
            |f|)
           ('T
            (SEQ
             (LETT |u|
                   (SPADCALL (LETT |num| (SPADCALL |f| (QREFELT $ 43)) . #2#)
                             (QREFELT $ 46))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (COND
                 ((SPADCALL (SPADCALL |num| (QREFELT $ 41)) |x| (QREFELT $ 42))
                  (|spadConstant| $ 47))
                 (#3='T |f|)))
               (#3#
                (SEQ (LETT |ans| (|spadConstant| $ 48) . #2#)
                     (SEQ (LETT |term| NIL . #2#) (LETT #1# (QCDR |u|) . #2#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |term| (CAR #1#) . #2#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |term| (QREFELT $ 41)) |x|
                                         (QREFELT $ 42)))
                              (LETT |ans|
                                    (SPADCALL |ans| |term| (QREFELT $ 49))
                                    . #2#)))))
                          (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                     (EXIT (SPADCALL |ans| |den| (QREFELT $ 50))))))))))))) 

(SDEFUN |INTTOOLS;logsimp| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((|g| (|Integer|))
          (|r2| #1=(|Record| (|:| |coef| (|Integer|)) (|:| |logand| F)))
          (|r1| #1#))
         (SEQ
          (LETT |r1| (|INTTOOLS;psimp| (SPADCALL |f| (QREFELT $ 43)) |x| $)
                . #2=(|INTTOOLS;logsimp|))
          (LETT |r2| (|INTTOOLS;psimp| (SPADCALL |f| (QREFELT $ 40)) |x| $)
                . #2#)
          (LETT |g| (GCD (QCAR |r1|) (QCAR |r2|)) . #2#)
          (EXIT
           (SPADCALL |g|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (QCDR |r1|) (QUOTIENT2 (QCAR |r1|) |g|)
                                 (QREFELT $ 53))
                       (SPADCALL (QCDR |r2|) (QUOTIENT2 (QCAR |r2|) |g|)
                                 (QREFELT $ 53))
                       (QREFELT $ 54))
                      (QREFELT $ 55))
                     (QREFELT $ 56)))))) 

(SDEFUN |INTTOOLS;cont|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|l| |List| (|Kernel| F))
         ($ |SparseMultivariatePolynomial| R (|Kernel| F)))
        (SPROG
         ((|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F)))))
         (SEQ
          (COND ((NULL |l|) |p|)
                ('T
                 (SEQ
                  (LETT |q| (SPADCALL |p| (|SPADfirst| |l|) (QREFELT $ 58))
                        |INTTOOLS;cont|)
                  (EXIT
                   (|INTTOOLS;cont|
                    (SPADCALL
                     (QVELT
                      (SPADCALL (SPADCALL |q| (QREFELT $ 60)) (QREFELT $ 62))
                      0)
                     (SPADCALL |q| (QREFELT $ 63)) (QREFELT $ 64))
                    (CDR |l|) $)))))))) 

(SDEFUN |INTTOOLS;linearLog?|
        ((|k| |Kernel| F) (|f| F) (|x| |Symbol|) ($ |Boolean|))
        (SPROG
         ((|p0| (|SparseUnivariatePolynomial| F))
          (|pol| (|SparseUnivariatePolynomial| F))
          (|u| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 38))
            (SEQ
             (LETT |u|
                   (SPADCALL (SPADCALL |f| |k| (QREFELT $ 66)) (QREFELT $ 69))
                   . #1=(|INTTOOLS;linearLog?|))
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (COND
                 ((EQL (SPADCALL (LETT |pol| (QCDR |u|) . #1#) (QREFELT $ 71))
                       1)
                  (COND
                   ((SPADCALL |x|
                              (SPADCALL (SPADCALL |pol| (QREFELT $ 73))
                                        (QREFELT $ 15))
                              (QREFELT $ 18))
                    NIL)
                   (#2='T
                    (SEQ (LETT |p0| (SPADCALL |pol| (QREFELT $ 74)) . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |p0| (|spadConstant| $ 76)
                                      (QREFELT $ 77))
                            'T)
                           (#2#
                            (NULL
                             (SPADCALL |k|
                                       (SPADCALL (SPADCALL |p0| (QREFELT $ 73))
                                                 (QREFELT $ 78))
                                       (QREFELT $ 79))))))))))
                 (#2# NIL)))
               (#2# NIL)))))
           (#2# NIL))))) 

(SDEFUN |INTTOOLS;mkPrim;FSF;11| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((#1=#:G786 NIL) (|k| NIL) (#2=#:G785 NIL)
          (|lg| (|List| (|Kernel| F))) (#3=#:G784 NIL) (#4=#:G783 NIL))
         (SEQ
          (LETT |lg|
                (PROGN
                 (LETT #4# NIL . #5=(|INTTOOLS;mkPrim;FSF;11|))
                 (SEQ (LETT |k| NIL . #5#)
                      (LETT #3# (SPADCALL |f| (QREFELT $ 28)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|INTTOOLS;linearLog?| |k| |f| |x| $)
                          (LETT #4# (CONS |k| #4#) . #5#)))))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (SPADCALL |f| |lg|
                     (PROGN
                      (LETT #2# NIL . #5#)
                      (SEQ (LETT |k| NIL . #5#) (LETT #1# |lg| . #5#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|INTTOOLS;logsimp|
                                     (|SPADfirst|
                                      (SPADCALL |k| (QREFELT $ 23)))
                                     |x| $)
                                    #2#)
                                   . #5#)))
                           (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 81)))))) 

(SDEFUN |INTTOOLS;psimp|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|x| |Symbol|)
         ($ |Record| (|:| |coef| (|Integer|)) (|:| |logand| F)))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (#1=#:G789 NIL))
         (SEQ
          (LETT |u|
                (SPADCALL
                 (LETT |p|
                       (PROG2
                           (LETT #1#
                                 (SPADCALL |p|
                                           (|INTTOOLS;cont| |p|
                                            (SPADCALL
                                             (SPADCALL |p| (QREFELT $ 83)) |x|
                                             (QREFELT $ 19))
                                            $)
                                           (QREFELT $ 85))
                                 . #2=(|INTTOOLS;psimp|))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0)
                                         (|SparseMultivariatePolynomial|
                                          (QREFELT $ 6)
                                          (|Kernel| (QREFELT $ 7)))
                                         (|Union|
                                          (|SparseMultivariatePolynomial|
                                           (QREFELT $ 6)
                                           (|Kernel| (QREFELT $ 7)))
                                          "failed")
                                         #1#))
                       . #2#)
                 (QREFELT $ 88))
                . #2#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 (SPADCALL |p| (QREFELT $ 41))))
                 ('T
                  (CONS (QCDR (QCDR |u|))
                        (SPADCALL (QCAR (QCDR |u|)) (QREFELT $ 13))))))))) 

(SDEFUN |INTTOOLS;intPatternMatch;FSMMIr;13|
        ((|f| F) (|x| |Symbol|)
         (|int| |Mapping| #1=(|IntegrationResult| F) F (|Symbol|))
         (|pmint| |Mapping|
          #2=(|Union| (|Record| (|:| |special| F) (|:| |integrand| F))
                      "failed")
          F (|Symbol|))
         ($ |IntegrationResult| F))
        (SPROG
         ((|nl| (|List| (|Record| (|:| |integrand| F) (|:| |intvar| F))))
          (|lg|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|ans| (F)) (|ir0| (|IntegrationResult| F))
          (|rc| (|Record| (|:| |special| F) (|:| |integrand| F))) (|u| #2#)
          (#3=#:G822 NIL) (|rec| NIL)
          (|l| (|List| (|Record| (|:| |integrand| F) (|:| |intvar| F))))
          (|ir| #1#))
         (SEQ
          (LETT |ir| (SPADCALL |f| |x| |int|)
                . #4=(|INTTOOLS;intPatternMatch;FSMMIr;13|))
          (EXIT
           (COND ((NULL (LETT |l| (SPADCALL |ir| (QREFELT $ 94)) . #4#)) |ir|)
                 ('T
                  (SEQ (LETT |ans| (SPADCALL |ir| (QREFELT $ 95)) . #4#)
                       (LETT |nl| NIL . #4#)
                       (LETT |lg| (SPADCALL |ir| (QREFELT $ 98)) . #4#)
                       (SEQ (LETT |rec| NIL . #4#) (LETT #3# |l| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |u|
                                   (SPADCALL (QCAR |rec|)
                                             (SPADCALL (QCDR |rec|)
                                                       (QREFELT $ 99))
                                             |pmint|)
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |u| 0)
                                (SEQ (LETT |rc| (QCDR |u|) . #4#)
                                     (LETT |ans|
                                           (SPADCALL |ans| (QCAR |rc|)
                                                     (QREFELT $ 100))
                                           . #4#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCDR |rc|)
                                                  (|spadConstant| $ 47)
                                                  (QREFELT $ 101))
                                        (SEQ
                                         (LETT |ir0|
                                               (SPADCALL (QCDR |rc|) |x| |int|
                                                         |pmint|
                                                         (QREFELT $ 106))
                                               . #4#)
                                         (LETT |ans|
                                               (SPADCALL |ans|
                                                         (SPADCALL |ir0|
                                                                   (QREFELT $
                                                                            95))
                                                         (QREFELT $ 100))
                                               . #4#)
                                         (LETT |lg|
                                               (SPADCALL
                                                (SPADCALL |ir0| (QREFELT $ 98))
                                                |lg| (QREFELT $ 107))
                                               . #4#)
                                         (EXIT
                                          (LETT |nl|
                                                (SPADCALL
                                                 (SPADCALL |ir0|
                                                           (QREFELT $ 94))
                                                 |nl| (QREFELT $ 108))
                                                . #4#))))))))
                               ('T (LETT |nl| (CONS |rec| |nl|) . #4#)))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL |ans| |lg| |nl| (QREFELT $ 109)))))))))) 

(DECLAIM (NOTINLINE |IntegrationTools;|)) 

(DEFUN |IntegrationTools| (&REST #1=#:G823)
  (SPROG NIL
         (PROG (#2=#:G824)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IntegrationTools|)
                                               '|domainEqualList|)
                    . #3=(|IntegrationTools|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IntegrationTools;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IntegrationTools|)))))))))) 

(DEFUN |IntegrationTools;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegrationTools|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|IntegrationTools| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 110) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Symbol|)))
                                               (|HasCategory| |#2|
                                                              '(|ElementaryFunctionCategory|))
                                               (|HasCategory| |#2|
                                                              '(|LiouvillianFunctionCategory|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|))
                                               (|HasCategory| |#2|
                                                              '(|ElementaryFunctionCategory|)))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|IntegrationTools| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 51
                      (CONS
                       (|dispatchFunction| |INTTOOLS;removeConstantTerm;FSF;7|)
                       $))))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (COND
             ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
              (PROGN
               (QSETREFV $ 82
                         (CONS (|dispatchFunction| |INTTOOLS;mkPrim;FSF;11|)
                               $))
               (COND
                ((|HasCategory| |#1|
                                '(|ConvertibleTo| (|Pattern| (|Integer|))))
                 (COND
                  ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
                   (PROGN
                    (QSETREFV $ 90
                              (COND
                               ((|HasCategory| |#2|
                                               '(|LiouvillianFunctionCategory|))
                                (|HasCategory| |#2|
                                               '(|RetractableTo| (|Symbol|))))
                               ('T NIL)))
                    (COND
                     ((QREFELT $ 90)
                      (QSETREFV $ 106
                                (CONS
                                 (|dispatchFunction|
                                  |INTTOOLS;intPatternMatch;FSMMIr;13|)
                                 $))))))))))))))
          $))) 

(MAKEPROP '|IntegrationTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|List| 20) (0 . |setUnion|) |INTTOOLS;union;3L;1| (|Kernel| $)
              (6 . |coerce|) (|List| 17) (11 . |variables|) (|Boolean|)
              (|Symbol|) (16 . |member?|) |INTTOOLS;varselect;LSL;2|
              (|Kernel| 7) (22 . |remove|) (|List| 7) (28 . |argument|)
              |INTTOOLS;vark;LSL;4| |INTTOOLS;kmax;LK;5| |INTTOOLS;ksec;KLSK;3|
              (|List| 12) (33 . |kernels|) (|Mapping| 9 9 9) (|List| 9)
              (38 . |reduce|) (|NonNegativeInteger|) (45 . |height|) (50 . ~=)
              (|BasicOperator|) (56 . |operator|) (61 . |has?|) (67 . |is?|)
              (|SparseMultivariatePolynomial| 6 12) (73 . |denom|)
              (78 . |coerce|) (83 . |freeOf?|) (89 . |numer|)
              (|Union| 80 '#1="failed") (|SparseMultivariatePolynomial| 6 20)
              (94 . |isPlus|) (99 . |Zero|) (103 . |Zero|) (107 . +) (113 . /)
              (119 . |removeConstantTerm|) (|Integer|) (125 . ^) (131 . /)
              (137 . |log|) (142 . *) (|SparseUnivariatePolynomial| $)
              (148 . |univariate|) (|SparseUnivariatePolynomial| 45)
              (154 . |leadingCoefficient|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (159 . |unitNormal|) (164 . |content|) (169 . *) (|Fraction| 57)
              (175 . |univariate|) (|Union| 70 '"failed") (|Fraction| 70)
              (181 . |retractIfCan|) (|SparseUnivariatePolynomial| 7)
              (186 . |degree|) (191 . |One|) (195 . |leadingCoefficient|)
              (200 . |reductum|) (205 . |Zero|) (209 . |Zero|) (213 . =)
              (219 . |tower|) (224 . |member?|) (|List| $) (230 . |eval|)
              (237 . |mkPrim|) (243 . |variables|) (|Union| $ '"failed")
              (248 . |exquo|) (|Record| (|:| |var| 20) (|:| |exponent| 32))
              (|Union| 86 '#1#) (254 . |isExpt|) (259 . |One|) '#:G706
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 91)
              (|IntegrationResult| 7) (263 . |notelem|) (268 . |ratpart|)
              (|Record| (|:| |scalar| (|Fraction| 52)) (|:| |coeff| 70)
                        (|:| |logand| 70))
              (|List| 96) (273 . |logpart|) (278 . |retract|) (283 . +)
              (289 . ~=) (|Mapping| 93 7 17)
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 103 '"failed") (|Mapping| 104 7 17)
              (295 . |intPatternMatch|) (303 . |concat|) (309 . |concat|)
              (315 . |mkAnswer|))
           '#(|varselect| 322 |vark| 328 |union| 334 |removeConstantTerm| 340
              |mkPrim| 346 |ksec| 352 |kmax| 359 |intPatternMatch| 364)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 109
                                                 '(2 9 0 0 0 10 1 7 0 12 13 1 7
                                                   14 0 15 2 14 16 17 0 18 2 9
                                                   0 20 0 21 1 20 22 0 23 1 7
                                                   27 0 28 3 30 9 29 0 9 31 1
                                                   20 32 0 33 2 32 16 0 0 34 1
                                                   20 35 0 36 2 35 16 0 17 37 2
                                                   20 16 0 17 38 1 7 39 0 40 1
                                                   7 0 39 41 2 7 16 0 17 42 1 7
                                                   39 0 43 1 45 44 0 46 0 7 0
                                                   47 0 45 0 48 2 45 0 0 0 49 2
                                                   7 0 39 39 50 2 0 7 7 17 51 2
                                                   7 0 0 52 53 2 7 0 0 0 54 1 7
                                                   0 0 55 2 7 0 52 0 56 2 45 57
                                                   0 20 58 1 59 45 0 60 1 45 61
                                                   0 62 1 59 45 0 63 2 45 0 0 0
                                                   64 2 7 65 0 12 66 1 68 67 0
                                                   69 1 70 32 0 71 0 7 0 72 1
                                                   70 7 0 73 1 70 0 0 74 0 6 0
                                                   75 0 70 0 76 2 70 16 0 0 77
                                                   1 7 27 0 78 2 9 16 20 0 79 3
                                                   7 0 0 27 80 81 2 0 7 7 17 82
                                                   1 45 9 0 83 2 45 84 0 0 85 1
                                                   45 87 0 88 0 6 0 89 1 93 92
                                                   0 94 1 93 7 0 95 1 93 97 0
                                                   98 1 7 17 0 99 2 7 0 0 0 100
                                                   2 7 16 0 0 101 4 0 93 7 17
                                                   102 105 106 2 97 0 0 0 107 2
                                                   92 0 0 0 108 3 93 0 7 97 92
                                                   109 2 0 9 9 17 19 2 0 9 22
                                                   17 24 2 0 9 9 9 11 2 3 7 7
                                                   17 51 2 2 7 7 17 82 3 0 20
                                                   20 9 17 26 1 0 20 9 25 4 1
                                                   93 7 17 102 105 106)))))
           '|lookupComplete|)) 
