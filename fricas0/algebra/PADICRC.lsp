
(PUT '|PADICRC;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |PADICRC;getExpon| ((|x| $) ($ |Integer|)) (QCAR |x|)) 

(PUT '|PADICRC;getZp| '|SPADreplace| 'QCDR) 

(SDEFUN |PADICRC;getZp| ((|x| $) ($ PADIC)) (QCDR |x|)) 

(PUT '|PADICRC;makeQp| '|SPADreplace| 'CONS) 

(SDEFUN |PADICRC;makeQp| ((|r| |Integer|) (|int| PADIC) ($ $)) (CONS |r| |int|)) 

(SDEFUN |PADICRC;Zero;$;4| (($ $)) (|PADICRC;makeQp| 0 (|spadConstant| $ 13) $)) 

(SDEFUN |PADICRC;One;$;5| (($ $)) (|PADICRC;makeQp| 0 (|spadConstant| $ 15) $)) 

(SDEFUN |PADICRC;coerce;I$;6| ((|x| |Integer|) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 18))) 

(SDEFUN |PADICRC;coerce;F$;7| ((|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 21)) (QREFELT $ 19))
                  (SPADCALL (SPADCALL |r| (QREFELT $ 22)) (QREFELT $ 19))
                  (QREFELT $ 23))) 

(SDEFUN |PADICRC;coerce;PADIC$;8| ((|x| PADIC) ($ $))
        (|PADICRC;makeQp| 0 |x| $)) 

(SDEFUN |PADICRC;removeZeroes;2$;9| ((|x| $) ($ $))
        (SPROG ((|xx| (PADIC)))
               (COND
                ((SPADCALL
                  (SPADCALL
                   (LETT |xx| (|PADICRC;getZp| |x| $)
                         |PADICRC;removeZeroes;2$;9|)
                   (QREFELT $ 26))
                  (QREFELT $ 28))
                 (|spadConstant| $ 14))
                ((ZEROP (SPADCALL |xx| (QREFELT $ 29)))
                 (SPADCALL
                  (|PADICRC;makeQp| (+ (|PADICRC;getExpon| |x| $) 1)
                   (SPADCALL |xx| (QREFELT $ 30)) $)
                  (QREFELT $ 31)))
                ('T |x|)))) 

(SDEFUN |PADICRC;removeZeroes;I2$;10| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((|xx| (PADIC)))
               (COND ((SPADCALL |n| 0 (QREFELT $ 32)) |x|)
                     ((SPADCALL
                       (SPADCALL
                        (LETT |xx| (|PADICRC;getZp| |x| $)
                              |PADICRC;removeZeroes;I2$;10|)
                        (QREFELT $ 26))
                       (QREFELT $ 28))
                      (|spadConstant| $ 14))
                     ((ZEROP (SPADCALL |xx| (QREFELT $ 29)))
                      (SPADCALL (- |n| 1)
                                (|PADICRC;makeQp|
                                 (+ (|PADICRC;getExpon| |x| $) 1)
                                 (SPADCALL |xx| (QREFELT $ 30)) $)
                                (QREFELT $ 33)))
                     ('T |x|)))) 

(SDEFUN |PADICRC;=;2$B;11| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G894 NIL) (#2=#:G842 NIL) (|n| (|Integer|)))
               (SEQ
                (COND ((EQ |x| |y|) 'T)
                      (#3='T
                       (SEQ
                        (LETT |n|
                              (- (|PADICRC;getExpon| |x| $)
                                 (|PADICRC;getExpon| |y| $))
                              . #4=(|PADICRC;=;2$B;11|))
                        (EXIT
                         (COND
                          ((>= |n| 0)
                           (SPADCALL
                            (SPADCALL
                             (EXPT (QREFELT $ 6)
                                   (PROG1 (LETT #2# |n| . #4#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#)))
                             (|PADICRC;getZp| |x| $) (QREFELT $ 34))
                            (|PADICRC;getZp| |y| $) (QREFELT $ 35)))
                          (#3#
                           (SPADCALL
                            (SPADCALL
                             (EXPT (QREFELT $ 6)
                                   (PROG1 (LETT #1# (- |n|) . #4#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#)))
                             (|PADICRC;getZp| |y| $) (QREFELT $ 34))
                            (|PADICRC;getZp| |x| $) (QREFELT $ 35))))))))))) 

(SDEFUN |PADICRC;+;3$;12| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G908 NIL) (#2=#:G905 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (- (|PADICRC;getExpon| |x| $) (|PADICRC;getExpon| |y| $))
                      . #3=(|PADICRC;+;3$;12|))
                (EXIT
                 (COND
                  ((>= |n| 0)
                   (|PADICRC;makeQp| (|PADICRC;getExpon| |y| $)
                    (SPADCALL (|PADICRC;getZp| |y| $)
                              (SPADCALL
                               (EXPT (QREFELT $ 6)
                                     (PROG1 (LETT #2# |n| . #3#)
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#)))
                               (|PADICRC;getZp| |x| $) (QREFELT $ 34))
                              (QREFELT $ 37))
                    $))
                  ('T
                   (|PADICRC;makeQp| (|PADICRC;getExpon| |x| $)
                    (SPADCALL (|PADICRC;getZp| |x| $)
                              (SPADCALL
                               (EXPT (QREFELT $ 6)
                                     (PROG1 (LETT #1# (- |n|) . #3#)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#)))
                               (|PADICRC;getZp| |y| $) (QREFELT $ 34))
                              (QREFELT $ 37))
                    $))))))) 

(SDEFUN |PADICRC;-;2$;13| ((|x| $) ($ $))
        (|PADICRC;makeQp| (|PADICRC;getExpon| |x| $)
         (SPADCALL (|PADICRC;getZp| |x| $) (QREFELT $ 39)) $)) 

(SDEFUN |PADICRC;-;3$;14| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G922 NIL) (#2=#:G919 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (- (|PADICRC;getExpon| |x| $) (|PADICRC;getExpon| |y| $))
                      . #3=(|PADICRC;-;3$;14|))
                (EXIT
                 (COND
                  ((>= |n| 0)
                   (|PADICRC;makeQp| (|PADICRC;getExpon| |y| $)
                    (SPADCALL
                     (SPADCALL
                      (EXPT (QREFELT $ 6)
                            (PROG1 (LETT #2# |n| . #3#)
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#)))
                      (|PADICRC;getZp| |x| $) (QREFELT $ 34))
                     (|PADICRC;getZp| |y| $) (QREFELT $ 41))
                    $))
                  ('T
                   (|PADICRC;makeQp| (|PADICRC;getExpon| |x| $)
                    (SPADCALL (|PADICRC;getZp| |x| $)
                              (SPADCALL
                               (EXPT (QREFELT $ 6)
                                     (PROG1 (LETT #1# (- |n|) . #3#)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#)))
                               (|PADICRC;getZp| |y| $) (QREFELT $ 34))
                              (QREFELT $ 41))
                    $))))))) 

(SDEFUN |PADICRC;*;I2$;15| ((|n| |Integer|) (|x| $) ($ $))
        (|PADICRC;makeQp| (|PADICRC;getExpon| |x| $)
         (SPADCALL |n| (|PADICRC;getZp| |x| $) (QREFELT $ 34)) $)) 

(SDEFUN |PADICRC;*;3$;16| ((|x| $) (|y| $) ($ $))
        (|PADICRC;makeQp|
         (+ (|PADICRC;getExpon| |x| $) (|PADICRC;getExpon| |y| $))
         (SPADCALL (|PADICRC;getZp| |x| $) (|PADICRC;getZp| |y| $)
                   (QREFELT $ 44))
         $)) 

(SDEFUN |PADICRC;^;$I$;17| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((#1=#:G929 NIL) (#2=#:G928 NIL))
               (COND ((ZEROP |n|) (|spadConstant| $ 16))
                     ((SPADCALL |n| (QREFELT $ 46))
                      (SPADCALL |x|
                                (PROG1 (LETT #2# |n| . #3=(|PADICRC;^;$I$;17|))
                                  (|check_subtype2| (> #2# 0)
                                                    '(|PositiveInteger|)
                                                    '(|Integer|) #2#))
                                (QREFELT $ 49)))
                     ('T
                      (SPADCALL
                       (SPADCALL |x|
                                 (PROG1 (LETT #1# (- |n|) . #3#)
                                   (|check_subtype2| (> #1# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 49))
                       (QREFELT $ 50)))))) 

(SDEFUN |PADICRC;recip;$U;18| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|inv| (|Union| PADIC #1#)) (|xx| (PADIC)))
               (SEQ
                (LETT |x| (SPADCALL 1000 |x| (QREFELT $ 33))
                      . #2=(|PADICRC;recip;$U;18|))
                (EXIT
                 (COND
                  ((ZEROP
                    (SPADCALL (LETT |xx| (|PADICRC;getZp| |x| $) . #2#)
                              (QREFELT $ 29)))
                   (CONS 1 "failed"))
                  (#3='T
                   (SEQ (LETT |inv| (SPADCALL |xx| (QREFELT $ 53)) . #2#)
                        (EXIT
                         (COND ((QEQCAR |inv| 1) (CONS 1 "failed"))
                               (#3#
                                (CONS 0
                                      (|PADICRC;makeQp|
                                       (- (|PADICRC;getExpon| |x| $))
                                       (QCDR |inv|) $)))))))))))) 

(SDEFUN |PADICRC;inv;2$;19| ((|x| $) ($ $))
        (SPROG ((|inv| (|Union| $ "failed")))
               (SEQ
                (LETT |inv| (SPADCALL |x| (QREFELT $ 54)) |PADICRC;inv;2$;19|)
                (EXIT
                 (COND ((QEQCAR |inv| 1) (|error| "inv: no inverse"))
                       ('T (QCDR |inv|))))))) 

(SDEFUN |PADICRC;/;3$;20| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| (SPADCALL |y| (QREFELT $ 50)) (QREFELT $ 45))) 

(SDEFUN |PADICRC;/;2PADIC$;21| ((|x| PADIC) (|y| PADIC) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (SPADCALL |y| (QREFELT $ 18))
                  (QREFELT $ 23))) 

(SDEFUN |PADICRC;*;PADIC2$;22| ((|x| PADIC) (|y| $) ($ $))
        (|PADICRC;makeQp| (|PADICRC;getExpon| |y| $)
         (SPADCALL |x| (|PADICRC;getZp| |y| $) (QREFELT $ 44)) $)) 

(SDEFUN |PADICRC;approximate;$IF;23|
        ((|x| $) (|n| |Integer|) ($ |Fraction| (|Integer|)))
        (SPROG ((|k| (|Integer|)))
               (SEQ
                (LETT |k| (|PADICRC;getExpon| |x| $)
                      |PADICRC;approximate;$IF;23|)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 6) (QREFELT $ 57)) |k|
                            (QREFELT $ 58))
                  (SPADCALL (|PADICRC;getZp| |x| $) (- |n| |k|) (QREFELT $ 59))
                  (QREFELT $ 60)))))) 

(SDEFUN |PADICRC;cfStream| ((|x| $) ($ |Stream| (|Fraction| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|PADICRC;cfStream!0| (VECTOR $ |x|))
                          (QREFELT $ 66))))) 

(SDEFUN |PADICRC;cfStream!0| (($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|PADICRC;cfStream|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|invx| NIL) (|x0| NIL))
                   (SEQ (LETT |invx| (SPADCALL |x| (QREFELT $ 50)) NIL)
                        (LETT |x0|
                              (SPADCALL |invx| (|spadConstant| $ 62)
                                        (QREFELT $ 61))
                              NIL)
                        (EXIT
                         (SPADCALL |x0|
                                   (|PADICRC;cfStream|
                                    (SPADCALL |invx|
                                              (SPADCALL |x0| (QREFELT $ 24))
                                              (QREFELT $ 42))
                                    $)
                                   (QREFELT $ 64))))))))) 

(SDEFUN |PADICRC;continuedFraction;$Cf;25|
        ((|x| $) ($ |ContinuedFraction| (|Fraction| (|Integer|))))
        (SPROG ((|x0| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |x0| (SPADCALL |x| 1 (QREFELT $ 61))
                      |PADICRC;continuedFraction;$Cf;25|)
                (EXIT
                 (SPADCALL |x0|
                           (|PADICRC;cfStream|
                            (SPADCALL |x| (SPADCALL |x0| (QREFELT $ 24))
                                      (QREFELT $ 42))
                            $)
                           (QREFELT $ 68)))))) 

(SDEFUN |PADICRC;termOutput| ((|k| |Integer|) (|c| |Integer|) ($ |OutputForm|))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND ((EQL |k| 0) (SPADCALL |c| (QREFELT $ 10)))
                      (#1='T
                       (SEQ
                        (LETT |mon|
                              (COND ((EQL |k| 1) (QREFELT $ 11))
                                    (#1#
                                     (SPADCALL (QREFELT $ 11)
                                               (SPADCALL |k| (QREFELT $ 10))
                                               (QREFELT $ 70))))
                              |PADICRC;termOutput|)
                        (EXIT
                         (COND ((EQL |c| 1) |mon|)
                               ((EQL |c| -1) (SPADCALL |mon| (QREFELT $ 71)))
                               (#1#
                                (SPADCALL (SPADCALL |c| (QREFELT $ 10)) |mon|
                                          (QREFELT $ 72))))))))))) 

(PUT '|PADICRC;showAll?| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |PADICRC;showAll?| (($ |Boolean|)) |$streamsShowAll|) 

(SDEFUN |PADICRC;coerce;$Of;28| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|uu| (|Stream| (|Integer|)))
          (|uu1| (|Stream| (|Integer|))) (|n| NIL) (#1=#:G995 NIL)
          (|count| (|NonNegativeInteger|)) (|zp| (PADIC)) (|m| (|Integer|)))
         (SEQ
          (LETT |x| (SPADCALL |$streamCount| |x| (QREFELT $ 33))
                . #2=(|PADICRC;coerce;$Of;28|))
          (LETT |m| (|PADICRC;getExpon| |x| $) . #2#)
          (LETT |zp| (|PADICRC;getZp| |x| $) . #2#)
          (LETT |uu| (SPADCALL |zp| (QREFELT $ 26)) . #2#) (LETT |l| NIL . #2#)
          (EXIT
           (COND ((SPADCALL |uu| (QREFELT $ 28)) (SPADCALL 0 (QREFELT $ 10)))
                 (#3='T
                  (SEQ (LETT |count| |$streamCount| . #2#)
                       (SEQ (LETT |n| 0 . #2#) (LETT #1# |count| . #2#) G190
                            (COND
                             ((OR (|greater_SI| |n| #1#)
                                  (NULL (NULL (SPADCALL |uu| (QREFELT $ 28)))))
                              (GO G191)))
                            (SEQ
                             (COND
                              ((SPADCALL (SPADCALL |uu| (QREFELT $ 73)) 0
                                         (QREFELT $ 74))
                               (LETT |l|
                                     (CONS
                                      (|PADICRC;termOutput| (+ |n| |m|)
                                       (SPADCALL |uu| (QREFELT $ 73)) $)
                                      |l|)
                                     . #2#)))
                             (EXIT
                              (LETT |uu| (SPADCALL |uu| (QREFELT $ 75))
                                    . #2#)))
                            (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (COND
                        ((|PADICRC;showAll?| $)
                         (SEQ (LETT |uu1| |uu| . #2#)
                              (EXIT
                               (SEQ (LETT |n| (+ |count| 1) . #2#) G190
                                    (COND
                                     ((NULL
                                       (COND
                                        ((SPADCALL |uu| (QREFELT $ 76))
                                         (NULL
                                          (SPADCALL |uu1|
                                                    (SPADCALL |uu|
                                                              (QREFELT $ 75))
                                                    (QREFELT $ 77))))
                                        ('T NIL)))
                                      (GO G191)))
                                    (SEQ
                                     (COND
                                      ((SPADCALL (SPADCALL |uu| (QREFELT $ 73))
                                                 0 (QREFELT $ 74))
                                       (LETT |l|
                                             (CONS
                                              (|PADICRC;termOutput| (+ |n| |m|)
                                               (SPADCALL |uu| (QREFELT $ 73))
                                               $)
                                              |l|)
                                             . #2#)))
                                     (COND
                                      ((ODDP |n|)
                                       (LETT |uu1|
                                             (SPADCALL |uu1| (QREFELT $ 75))
                                             . #2#)))
                                     (EXIT
                                      (LETT |uu| (SPADCALL |uu| (QREFELT $ 75))
                                            . #2#)))
                                    (LETT |n| (+ |n| 1) . #2#) (GO G190) G191
                                    (EXIT NIL))))))
                       (LETT |l|
                             (COND ((SPADCALL |uu| (QREFELT $ 78)) |l|)
                                   (#3#
                                    (SEQ
                                     (COND
                                      ((SPADCALL |uu|
                                                 (SPADCALL |uu| (QREFELT $ 75))
                                                 (QREFELT $ 77))
                                       (COND
                                        ((EQL (SPADCALL |uu| (QREFELT $ 73)) 0)
                                         (EXIT |l|)))))
                                     (EXIT
                                      (CONS
                                       (SPADCALL "O"
                                                 (LIST
                                                  (SPADCALL (QREFELT $ 11)
                                                            (SPADCALL
                                                             (+ |n| |m|)
                                                             (QREFELT $ 10))
                                                            (QREFELT $ 70)))
                                                 (QREFELT $ 80))
                                       |l|)))))
                             . #2#)
                       (EXIT
                        (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 82)))
                              (#3#
                               (SPADCALL (ELT $ 83) (NREVERSE |l|)
                                         (QREFELT $ 86)))))))))))) 

(DECLAIM (NOTINLINE |PAdicRationalConstructor;|)) 

(DEFUN |PAdicRationalConstructor| (&REST #1=#:G1045)
  (SPROG NIL
         (PROG (#2=#:G1046)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PAdicRationalConstructor|)
                                               '|domainEqualList|)
                    . #3=(|PAdicRationalConstructor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PAdicRationalConstructor;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PAdicRationalConstructor|)))))))))) 

(DEFUN |PAdicRationalConstructor;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1044 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|PAdicRationalConstructor|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|PAdicRationalConstructor| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 129) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Symbol|)))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#2| '(|RealConstant|))
                                        (|HasCategory| |#2|
                                                       '(|OrderedIntegralDomain|))
                                        (|HasCategory| |#2| '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedIntegralDomain|))
                                         (|HasCategory| |#2| '(|OrderedSet|)))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2| '(|StepThrough|))
                                        (|HasCategory| |#2|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#2|)))
                                        (|HasCategory| |#2|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#2|)))
                                        (|HasCategory| |#2|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#2|)
                                                             (|devaluate|
                                                              |#2|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#2|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#2|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| |#2|
                                                       '(|IntegerNumberSystem|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|Comparable|))
                                              . #2#)
                                        (OR #1#
                                            (|HasCategory| |#2|
                                                           '(|OrderedIntegralDomain|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedSet|)))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|PAdicRationalConstructor|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| $ '(|CharacteristicNonZero|))
         (|augmentPredVector| $ 33554432))
    (AND
     (OR (|HasCategory| |#2| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 67108864))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 (SPADCALL |#1| (QREFELT $ 10)))
    (QSETREFV $ 12 (|Record| (|:| |expon| (|Integer|)) (|:| |pint| |#2|)))
    $))) 

(MAKEPROP '|PAdicRationalConstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|OutputForm|) (|Integer|) (0 . |coerce|) 'PEXPR '|Rep|
              (5 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |PADICRC;Zero;$;4|) $))
              (9 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |PADICRC;One;$;5|) $))
              (13 . |coerce|) |PADICRC;coerce;PADIC$;8| |PADICRC;coerce;I$;6|
              (|Fraction| 9) (18 . |numer|) (23 . |denom|) |PADICRC;/;3$;20|
              |PADICRC;coerce;F$;7| (|Stream| 9) (28 . |digits|) (|Boolean|)
              (33 . |empty?|) (38 . |moduloP|) (43 . |quotientByP|)
              |PADICRC;removeZeroes;2$;9| (48 . <=)
              |PADICRC;removeZeroes;I2$;10| (54 . *) (60 . =)
              |PADICRC;=;2$B;11| (66 . +) |PADICRC;+;3$;12| (72 . -)
              |PADICRC;-;2$;13| (77 . -) |PADICRC;-;3$;14| |PADICRC;*;I2$;15|
              (83 . *) |PADICRC;*;3$;16| (89 . |positive?|) (|PositiveInteger|)
              (|RepeatedSquaring| $$) (94 . |expt|) |PADICRC;inv;2$;19|
              |PADICRC;^;$I$;17| (|Union| $ '"failed") (100 . |recip|)
              |PADICRC;recip;$U;18| |PADICRC;/;2PADIC$;21|
              |PADICRC;*;PADIC2$;22| (105 . |coerce|) (110 . ^)
              (116 . |approximate|) (122 . *) |PADICRC;approximate;$IF;23|
              (128 . |One|) (|Stream| 20) (132 . |concat|) (|Mapping| $)
              (138 . |delay|) (|ContinuedFraction| 20)
              (143 . |reducedContinuedFraction|)
              |PADICRC;continuedFraction;$Cf;25| (149 . ^) (155 . -) (160 . *)
              (166 . |frst|) (171 . ~=) (177 . |rst|)
              (182 . |explicitEntries?|) (187 . |eq?|)
              (193 . |explicitlyEmpty?|) (|List| $) (198 . |prefix|)
              (|NonNegativeInteger|) (204 . |coerce|) (209 . +)
              (|Mapping| 8 8 8) (|List| 8) (215 . |reduce|)
              |PADICRC;coerce;$Of;28| (|Union| 99 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| 108) (|Pattern| 9) (|List| 94)
              (|Equation| 7) (|List| 7) (|Symbol|) (|List| 96)
              (|Record| (|:| |mat| 100) (|:| |vec| (|Vector| 9))) (|Vector| $)
              (|Matrix| 9) (|List| 81) (|PatternMatchResult| 108 $)
              (|PatternMatchResult| 9 $) (|Factored| 105)
              (|SparseUnivariatePolynomial| $) (|Union| 107 '#1#) (|List| 105)
              (|Float|) (|DoubleFloat|) (|Union| 9 '#2="failed")
              (|Union| 20 '#2#) (|Union| 96 '#2#)
              (|Record| (|:| |mat| 114) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|Mapping| 7 7) (|Union| 7 '#2#) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 118 '#3="failed") (|Union| 79 '#3#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 79) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 221 |zero?| 227 |wholePart| 232 |unitNormal| 237
              |unitCanonical| 242 |unit?| 247 |subtractIfCan| 252
              |squareFreePolynomial| 258 |squareFreePart| 263 |squareFree| 268
              |solveLinearPolynomialEquation| 273 |smaller?| 279 |sizeLess?|
              285 |sign| 291 |sample| 296 |retractIfCan| 300 |retract| 320
              |removeZeroes| 340 |rem| 351 |reducedSystem| 357 |recip| 379
              |quo| 384 |principalIdeal| 390 |prime?| 395 |positive?| 400
              |patternMatch| 405 |opposite?| 419 |one?| 425 |numerator| 430
              |numer| 435 |nextItem| 440 |negative?| 445 |multiEuclidean| 450
              |min| 456 |max| 462 |map| 468 |lcmCoef| 474 |lcm| 480 |latex| 491
              |inv| 496 |init| 501 |hashUpdate!| 505 |hash| 511 |gcdPolynomial|
              516 |gcd| 522 |fractionPart| 533 |floor| 538
              |factorSquareFreePolynomial| 543 |factorPolynomial| 548 |factor|
              553 |extendedEuclidean| 558 |exquo| 571 |expressIdealMember| 577
              |eval| 583 |euclideanSize| 623 |elt| 628 |divide| 634
              |differentiate| 640 |denominator| 690 |denom| 695 |convert| 700
              |continuedFraction| 725 |conditionP| 730 |coerce| 735
              |charthRoot| 765 |characteristic| 770 |ceiling| 774 |associates?|
              779 |approximate| 785 |annihilate?| 791 |abs| 797 ^ 802 |Zero|
              820 |One| 824 D 828 >= 878 > 884 = 890 <= 896 < 902 / 908 - 920 +
              931 * 937)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 0 1 0 0 0 7 0 0 0 0 0 0 0 0 7 0 0 0 0 0 0
                                  3 4 15 16 17 0 0 0 0 7 0 0 0 0 0 0 0 7 0 7 0
                                  0 7 0 0 0 0 9 0 0 0 25 11 20 21 0 0 6 13 0 0
                                  0 0 0 0 0 0 0 2 5 6 6 8 10 10 12 13 14 18
                                  19))
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
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 7) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 7) (|DifferentialExtension| 7)
                 (|Algebra| 7) (|Algebra| 20) (|LeftOreRing|) (|Algebra| $$)
                 (|OrderedRing|) (|LinearlyExplicitOver| 7) (|Module| 7)
                 (|Module| 20) (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 96) (|DifferentialRing|)
                 (|LinearlyExplicitOver| 9) (|BiModule| 7 7) (|BiModule| 20 20)
                 (|BiModule| $$ $$) (|Ring|) (|OrderedAbelianGroup|)
                 (|RightModule| 7) (|LeftModule| 7) (|RightModule| 20)
                 (|LeftModule| 20) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedAbelianSemiGroup|)
                 (|FullyPatternMatchable| 7) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|OrderedSet|) (|FullyEvalableOver| 7)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|StepThrough|) (|PatternMatchable| 108)
                 (|PatternMatchable| 9) (|Patternable| 7) (|SetCategory|)
                 (|RealConstant|) (|Evalable| 7) (|Type|) (|RetractableTo| 7)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 8) (|RetractableTo| 96)
                 (|ConvertibleTo| 90) (|ConvertibleTo| 109)
                 (|ConvertibleTo| 108) (|PartialOrder|) (|RetractableTo| 20)
                 (|RetractableTo| 9) (|InnerEvalable| 96 7)
                 (|InnerEvalable| 7 7) (|Eltable| 7 $$) (|ConvertibleTo| 91)
                 (|ConvertibleTo| 92))
              (|makeByteWordVec2| 128
                                  '(1 9 8 0 10 0 7 0 13 0 7 0 15 1 7 0 9 17 1
                                    20 9 0 21 1 20 9 0 22 1 7 25 0 26 1 25 27 0
                                    28 1 7 9 0 29 1 7 0 0 30 2 9 27 0 0 32 2 7
                                    0 9 0 34 2 7 27 0 0 35 2 7 0 0 0 37 1 7 0 0
                                    39 2 7 0 0 0 41 2 7 0 0 0 44 1 9 27 0 46 2
                                    48 2 2 47 49 1 7 52 0 53 1 20 0 9 57 2 20 0
                                    0 9 58 2 7 9 0 9 59 2 20 0 0 9 60 0 9 0 62
                                    2 63 0 20 0 64 1 63 0 65 66 2 67 0 20 63 68
                                    2 8 0 0 0 70 1 8 0 0 71 2 8 0 0 0 72 1 25 9
                                    0 73 2 9 27 0 0 74 1 25 0 0 75 1 25 27 0 76
                                    2 25 27 0 0 77 1 25 27 0 78 2 8 0 0 79 80 1
                                    81 8 0 82 2 8 0 0 0 83 2 85 8 84 0 86 2 0
                                    27 0 0 1 1 0 27 0 1 1 22 7 0 1 1 0 125 0 1
                                    1 0 0 0 1 1 0 27 0 1 2 0 52 0 0 1 1 1 104
                                    105 1 1 0 0 0 1 1 0 117 0 1 2 1 106 107 105
                                    1 2 24 27 0 0 1 2 0 27 0 0 1 1 7 9 0 1 0 0
                                    0 1 1 10 110 0 1 1 10 111 0 1 1 2 112 0 1 1
                                    0 116 0 1 1 10 9 0 1 1 10 20 0 1 1 2 96 0 1
                                    1 0 7 0 1 1 0 0 0 31 2 0 0 9 0 33 2 0 0 0 0
                                    1 2 17 98 89 99 1 1 17 100 89 1 2 0 113 89
                                    99 1 1 0 114 89 1 1 0 52 0 54 2 0 0 0 0 1 1
                                    0 123 79 1 1 0 27 0 1 1 7 27 0 1 3 20 102 0
                                    91 102 1 3 21 103 0 92 103 1 2 0 27 0 0 1 1
                                    0 27 0 1 1 0 0 0 1 1 0 7 0 1 1 11 52 0 1 1
                                    7 27 0 1 2 0 120 79 0 1 2 8 0 0 0 1 2 8 0 0
                                    0 1 2 0 0 115 0 1 2 0 124 0 0 1 2 0 0 0 0 1
                                    1 0 0 79 1 1 0 126 0 1 1 0 0 0 50 0 11 0 1
                                    2 0 128 128 0 1 1 0 127 0 1 2 0 105 105 105
                                    1 2 0 0 0 0 1 1 0 0 79 1 1 22 0 0 1 1 23 7
                                    0 1 1 1 104 105 1 1 1 104 105 1 1 0 117 0 1
                                    3 0 119 0 0 0 1 2 0 121 0 0 1 2 0 52 0 0 1
                                    2 0 120 79 0 1 2 13 0 0 93 1 3 13 0 0 7 7 1
                                    2 13 0 0 94 1 3 13 0 0 95 95 1 3 12 0 0 96
                                    7 1 3 12 0 0 97 95 1 1 0 81 0 1 2 14 0 0 7
                                    1 2 0 122 0 0 1 2 16 0 0 81 1 1 16 0 0 1 3
                                    15 0 0 97 101 1 2 15 0 0 97 1 3 15 0 0 96
                                    81 1 2 15 0 0 96 1 2 0 0 0 115 1 3 0 0 0
                                    115 81 1 1 0 0 0 1 1 0 7 0 1 1 5 90 0 1 1
                                    18 91 0 1 1 19 92 0 1 1 6 108 0 1 1 6 109 0
                                    1 1 0 67 0 69 1 26 88 89 1 1 2 0 96 1 1 0 0
                                    7 18 1 0 0 20 24 1 0 0 9 19 1 0 0 0 1 1 0 8
                                    0 87 1 27 52 0 1 0 0 81 1 1 23 7 0 1 2 0 27
                                    0 0 1 2 0 20 0 9 61 2 0 27 0 0 1 1 7 0 0 1
                                    2 0 0 0 9 51 2 0 0 0 81 1 2 0 0 0 47 1 0 0
                                    0 14 0 0 0 16 2 16 0 0 81 1 1 16 0 0 1 3 15
                                    0 0 97 101 1 2 15 0 0 97 1 3 15 0 0 96 81 1
                                    2 15 0 0 96 1 2 0 0 0 115 1 3 0 0 0 115 81
                                    1 2 8 27 0 0 1 2 8 27 0 0 1 2 0 27 0 0 36 2
                                    8 27 0 0 1 2 8 27 0 0 1 2 0 0 7 7 55 2 0 0
                                    0 0 23 1 0 0 0 40 2 0 0 0 0 42 2 0 0 0 0 38
                                    2 0 0 7 0 56 2 0 0 0 7 1 2 0 0 20 0 1 2 0 0
                                    0 20 1 2 0 0 9 0 43 2 0 0 0 0 45 2 0 0 81 0
                                    1 2 0 0 47 0 1)))))
           '|lookupComplete|)) 
