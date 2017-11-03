
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
        (SPROG ((#1=#:G915 NIL) (#2=#:G854 NIL) (|n| (|Integer|)))
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
        (SPROG ((#1=#:G933 NIL) (#2=#:G929 NIL) (|n| (|Integer|)))
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
        (SPROG ((#1=#:G951 NIL) (#2=#:G947 NIL) (|n| (|Integer|)))
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
        (SPROG ((#1=#:G958 NIL) (#2=#:G957 NIL))
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
          (|uu1| (|Stream| (|Integer|))) (|n| NIL) (#1=#:G1030 NIL)
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
                                       (SPADCALL (SPADCALL 'O (QREFELT $ 80))
                                                 (LIST
                                                  (SPADCALL (QREFELT $ 11)
                                                            (SPADCALL
                                                             (+ |n| |m|)
                                                             (QREFELT $ 10))
                                                            (QREFELT $ 70)))
                                                 (QREFELT $ 82))
                                       |l|)))))
                             . #2#)
                       (EXIT
                        (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 84)))
                              (#3#
                               (SPADCALL (ELT $ 85) (NREVERSE |l|)
                                         (QREFELT $ 88)))))))))))) 

(DECLAIM (NOTINLINE |PAdicRationalConstructor;|)) 

(DEFUN |PAdicRationalConstructor| (&REST #1=#:G1081)
  (SPROG NIL
         (PROG (#2=#:G1082)
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
   ((|pv$| NIL) (#1=#:G1080 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|PAdicRationalConstructor|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|PAdicRationalConstructor| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 130) . #2#)
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
              (193 . |explicitlyEmpty?|) (|Symbol|) (198 . |coerce|) (|List| $)
              (203 . |prefix|) (|NonNegativeInteger|) (209 . |coerce|)
              (214 . +) (|Mapping| 8 8 8) (|List| 8) (220 . |reduce|)
              |PADICRC;coerce;$Of;28| (|Union| 100 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| 110) (|Pattern| 9) (|List| 96)
              (|Equation| 7) (|List| 7) (|List| 79)
              (|Record| (|:| |mat| 101) (|:| |vec| (|Vector| 9))) (|Vector| $)
              (|Matrix| 9) (|List| 83) (|PatternMatchResult| 110 $)
              (|PatternMatchResult| 9 $) (|Factored| 106)
              (|SparseUnivariatePolynomial| $) (|Union| 108 '#1#) (|List| 106)
              (|DoubleFloat|) (|Float|) (|Union| 9 '#2="failed")
              (|Union| 20 '#2#) (|Union| 79 '#2#) (|Matrix| 7)
              (|Record| (|:| |mat| 114) (|:| |vec| (|Vector| 7)))
              (|Mapping| 7 7) (|Union| 7 '#2#) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 119 '#3="failed") (|Union| 81 '#3#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 81) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 226 |zero?| 232 |wholePart| 237 |unitNormal| 242
              |unitCanonical| 247 |unit?| 252 |subtractIfCan| 257
              |squareFreePolynomial| 263 |squareFreePart| 268 |squareFree| 273
              |solveLinearPolynomialEquation| 278 |smaller?| 284 |sizeLess?|
              290 |sign| 296 |sample| 301 |rightRecip| 305 |rightPower| 310
              |retractIfCan| 322 |retract| 342 |removeZeroes| 362 |rem| 373
              |reducedSystem| 379 |recip| 401 |quo| 406 |principalIdeal| 412
              |prime?| 417 |positive?| 422 |patternMatch| 427 |opposite?| 441
              |one?| 447 |numerator| 452 |numer| 457 |nextItem| 462 |negative?|
              467 |multiEuclidean| 472 |min| 478 |max| 484 |map| 490
              |leftRecip| 496 |leftPower| 501 |lcmCoef| 513 |lcm| 519 |latex|
              530 |inv| 535 |init| 540 |hashUpdate!| 544 |hash| 550
              |gcdPolynomial| 555 |gcd| 561 |fractionPart| 572 |floor| 577
              |factorSquareFreePolynomial| 582 |factorPolynomial| 587 |factor|
              592 |extendedEuclidean| 597 |exquo| 610 |expressIdealMember| 616
              |eval| 622 |euclideanSize| 662 |elt| 667 |divide| 673
              |differentiate| 679 |denominator| 729 |denom| 734 |convert| 739
              |continuedFraction| 764 |conditionP| 769 |commutator| 774
              |coerce| 780 |charthRoot| 810 |characteristic| 815 |ceiling| 819
              |associator| 824 |associates?| 831 |approximate| 837
              |antiCommutator| 843 |annihilate?| 849 |abs| 855 ^ 860 |Zero| 878
              |One| 882 D 886 >= 936 > 942 = 948 <= 954 < 960 / 966 - 978 + 989
              * 995)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 0 1 0 0 0 7 0 0 0 0 0 0 7 0 0 0 0 0 3 4
                                  15 16 17 0 0 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 0
                                  0 7 0 7 0 0 0 7 0 0 0 0 0 9 0 0 0 25 11 20 21
                                  0 0 6 13 0 0 0 0 0 0 0 0 0 2 5 6 6 8 10 10 12
                                  13 14 18 19))
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
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 7) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 7) (|DifferentialExtension| 7)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|OrderedRing|) (|LinearlyExplicitOver| 7) (|Algebra| 7)
                 (|Algebra| 20) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 79) (|DifferentialRing|)
                 (|LinearlyExplicitOver| 9) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| 7) (|Module| 20) (|Module| $$) (|SemiRng|)
                 (|BiModule| 7 7) (|BiModule| 20 20) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianGroup|)
                 (|RightModule| 7) (|LeftModule| 7) (|RightModule| 20)
                 (|LeftModule| 20) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|FullyPatternMatchable| 7)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|OrderedSet|) (|FullyEvalableOver| 7)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|PatternMatchable| 110) (|PatternMatchable| 9)
                 (|Patternable| 7) (|SetCategory|) (|RealConstant|)
                 (|Evalable| 7) (|Type|) (|RetractableTo| 7)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 8) (|RetractableTo| 79)
                 (|ConvertibleTo| 92) (|ConvertibleTo| 109)
                 (|ConvertibleTo| 110) (|PartialOrder|) (|RetractableTo| 20)
                 (|RetractableTo| 9) (|InnerEvalable| 79 7)
                 (|InnerEvalable| 7 7) (|Eltable| 7 $$) (|ConvertibleTo| 93)
                 (|ConvertibleTo| 94))
              (|makeByteWordVec2| 129
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
                                    2 25 27 0 0 77 1 25 27 0 78 1 79 8 0 80 2 8
                                    0 0 81 82 1 83 8 0 84 2 8 0 0 0 85 2 87 8
                                    86 0 88 2 0 27 0 0 1 1 0 27 0 1 1 22 7 0 1
                                    1 0 126 0 1 1 0 0 0 1 1 0 27 0 1 2 0 52 0 0
                                    1 1 1 105 106 1 1 0 0 0 1 1 0 118 0 1 2 1
                                    107 108 106 1 2 24 27 0 0 1 2 0 27 0 0 1 1
                                    7 9 0 1 0 0 0 1 1 0 52 0 1 2 0 0 0 83 1 2 0
                                    0 0 47 1 1 10 111 0 1 1 10 112 0 1 1 2 113
                                    0 1 1 0 117 0 1 1 10 9 0 1 1 10 20 0 1 1 2
                                    79 0 1 1 0 7 0 1 1 0 0 0 31 2 0 0 9 0 33 2
                                    0 0 0 0 1 2 17 99 91 100 1 1 17 101 91 1 1
                                    0 114 91 1 2 0 115 91 100 1 1 0 52 0 54 2 0
                                    0 0 0 1 1 0 124 81 1 1 0 27 0 1 1 7 27 0 1
                                    3 20 103 0 93 103 1 3 21 104 0 94 104 1 2 0
                                    27 0 0 1 1 0 27 0 1 1 0 0 0 1 1 0 7 0 1 1
                                    11 52 0 1 1 7 27 0 1 2 0 121 81 0 1 2 8 0 0
                                    0 1 2 8 0 0 0 1 2 0 0 116 0 1 1 0 52 0 1 2
                                    0 0 0 83 1 2 0 0 0 47 1 2 0 125 0 0 1 2 0 0
                                    0 0 1 1 0 0 81 1 1 0 127 0 1 1 0 0 0 50 0
                                    11 0 1 2 0 129 129 0 1 1 0 128 0 1 2 0 106
                                    106 106 1 2 0 0 0 0 1 1 0 0 81 1 1 22 0 0 1
                                    1 23 7 0 1 1 1 105 106 1 1 1 105 106 1 1 0
                                    118 0 1 3 0 120 0 0 0 1 2 0 122 0 0 1 2 0
                                    52 0 0 1 2 0 121 81 0 1 2 13 0 0 95 1 2 13
                                    0 0 96 1 3 13 0 0 97 97 1 3 13 0 0 7 7 1 3
                                    12 0 0 79 7 1 3 12 0 0 98 97 1 1 0 83 0 1 2
                                    14 0 0 7 1 2 0 123 0 0 1 2 16 0 0 83 1 1 16
                                    0 0 1 3 15 0 0 79 83 1 3 15 0 0 98 102 1 2
                                    15 0 0 98 1 2 15 0 0 79 1 2 0 0 0 116 1 3 0
                                    0 0 116 83 1 1 0 0 0 1 1 0 7 0 1 1 5 92 0 1
                                    1 18 93 0 1 1 19 94 0 1 1 6 109 0 1 1 6 110
                                    0 1 1 0 67 0 69 1 26 90 91 1 2 0 0 0 0 1 1
                                    2 0 79 1 1 0 0 7 18 1 0 0 20 24 1 0 0 0 1 1
                                    0 0 9 19 1 0 8 0 89 1 27 52 0 1 0 0 83 1 1
                                    23 7 0 1 3 0 0 0 0 0 1 2 0 27 0 0 1 2 0 20
                                    0 9 61 2 0 0 0 0 1 2 0 27 0 0 1 1 7 0 0 1 2
                                    0 0 0 9 51 2 0 0 0 83 1 2 0 0 0 47 1 0 0 0
                                    14 0 0 0 16 2 16 0 0 83 1 1 16 0 0 1 3 15 0
                                    0 79 83 1 3 15 0 0 98 102 1 2 15 0 0 79 1 2
                                    15 0 0 98 1 3 0 0 0 116 83 1 2 0 0 0 116 1
                                    2 8 27 0 0 1 2 8 27 0 0 1 2 0 27 0 0 36 2 8
                                    27 0 0 1 2 8 27 0 0 1 2 0 0 7 7 55 2 0 0 0
                                    0 23 1 0 0 0 40 2 0 0 0 0 42 2 0 0 0 0 38 2
                                    0 0 0 7 1 2 0 0 7 0 56 2 0 0 20 0 1 2 0 0 0
                                    20 1 2 0 0 83 0 1 2 0 0 9 0 43 2 0 0 0 0 45
                                    2 0 0 47 0 1)))))
           '|lookupComplete|)) 
