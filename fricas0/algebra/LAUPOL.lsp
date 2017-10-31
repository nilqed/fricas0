
(SDEFUN |LAUPOL;Zero;$;1| (($ $)) (CONS (|spadConstant| $ 11) 0)) 

(SDEFUN |LAUPOL;One;$;2| (($ $)) (CONS (|spadConstant| $ 14) 0)) 

(SDEFUN |LAUPOL;=;2$B;3| ((|p| $) (|q| $) ($ |Boolean|))
        (COND
         ((EQL (QCDR |p|) (QCDR |q|))
          (SPADCALL (QCAR |p|) (QCAR |q|) (QREFELT $ 16)))
         ('T NIL))) 

(PUT '|LAUPOL;poly| '|SPADreplace| 'QCAR) 

(SDEFUN |LAUPOL;poly| ((|p| $) ($ UP)) (QCAR |p|)) 

(PUT '|LAUPOL;order;$I;5| '|SPADreplace| 'QCDR) 

(SDEFUN |LAUPOL;order;$I;5| ((|p| $) ($ |Integer|)) (QCDR |p|)) 

(PUT '|LAUPOL;gpol| '|SPADreplace| 'CONS) 

(SDEFUN |LAUPOL;gpol| ((|p| UP) (|n| |Integer|) ($ $)) (CONS |p| |n|)) 

(SDEFUN |LAUPOL;monomial;RI$;7| ((|r| R) (|n| |Integer|) ($ $))
        (|LAUPOL;check0| |n| (SPADCALL |r| (QREFELT $ 20)) $)) 

(SDEFUN |LAUPOL;coerce;UP$;8| ((|p| UP) ($ $)) (|LAUPOL;mkgpol| 0 |p| $)) 

(SDEFUN |LAUPOL;reductum;2$;9| ((|p| $) ($ $))
        (|LAUPOL;check0| (SPADCALL |p| (QREFELT $ 19))
         (SPADCALL (|LAUPOL;poly| |p| $) (QREFELT $ 23)) $)) 

(SDEFUN |LAUPOL;*;I2$;10| ((|n| |Integer|) (|p| $) ($ $))
        (|LAUPOL;check0| (SPADCALL |p| (QREFELT $ 19))
         (SPADCALL |n| (|LAUPOL;poly| |p| $) (QREFELT $ 25)) $)) 

(SDEFUN |LAUPOL;characteristic;Nni;11| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 28))) 

(SDEFUN |LAUPOL;coerce;I$;12| ((|n| |Integer|) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 30)) (QREFELT $ 31))) 

(SDEFUN |LAUPOL;degree;$I;13| ((|p| $) ($ |Integer|))
        (+ (SPADCALL (|LAUPOL;poly| |p| $) (QREFELT $ 33))
           (SPADCALL |p| (QREFELT $ 19)))) 

(SDEFUN |LAUPOL;monomial?;$B;14| ((|p| $) ($ |Boolean|))
        (SPADCALL (|LAUPOL;poly| |p| $) (QREFELT $ 35))) 

(SDEFUN |LAUPOL;coerce;R$;15| ((|r| R) ($ $))
        (|LAUPOL;gpol| (SPADCALL |r| (QREFELT $ 20)) 0 $)) 

(SDEFUN |LAUPOL;convert;$F;16| ((|p| $) ($ |Fraction| UP))
        (SPADCALL (|LAUPOL;poly| |p| $)
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 37))
                             (QREFELT $ 39))
                   (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 40))
                  (QREFELT $ 41))) 

(SDEFUN |LAUPOL;*;3$;17| ((|p| $) (|q| $) ($ $))
        (|LAUPOL;check0|
         (+ (SPADCALL |p| (QREFELT $ 19)) (SPADCALL |q| (QREFELT $ 19)))
         (SPADCALL (|LAUPOL;poly| |p| $) (|LAUPOL;poly| |q| $) (QREFELT $ 43))
         $)) 

(SDEFUN |LAUPOL;-;2$;18| ((|p| $) ($ $))
        (|LAUPOL;gpol| (SPADCALL (|LAUPOL;poly| |p| $) (QREFELT $ 45))
         (SPADCALL |p| (QREFELT $ 19)) $)) 

(SDEFUN |LAUPOL;check0| ((|n| |Integer|) (|p| UP) ($ $))
        (COND ((SPADCALL |p| (QREFELT $ 47)) (|spadConstant| $ 9))
              ('T (|LAUPOL;gpol| |p| |n| $)))) 

(SDEFUN |LAUPOL;trailingCoefficient;$R;20| ((|p| $) ($ R))
        (SPADCALL (|LAUPOL;poly| |p| $) 0 (QREFELT $ 48))) 

(SDEFUN |LAUPOL;leadingCoefficient;$R;21| ((|p| $) ($ R))
        (SPADCALL (|LAUPOL;poly| |p| $) (QREFELT $ 50))) 

(SDEFUN |LAUPOL;coerce;$Of;22| ((|p| $) ($ |OutputForm|))
        (SPROG ((|l| (|List| (|OutputForm|))) (|v| (|OutputForm|)))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 52)) (SPADCALL 0 (QREFELT $ 54)))
                 ('T
                  (SEQ (LETT |l| NIL . #1=(|LAUPOL;coerce;$Of;22|))
                       (LETT |v|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 37))
                              (QREFELT $ 55))
                             . #1#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |p| (|spadConstant| $ 9)
                                         (QREFELT $ 56)))
                              (GO G191)))
                            (SEQ
                             (LETT |l|
                                   (SPADCALL |l|
                                             (|LAUPOL;toutput|
                                              (SPADCALL |p| (QREFELT $ 51))
                                              (SPADCALL |p| (QREFELT $ 34)) |v|
                                              $)
                                             (QREFELT $ 58))
                                   . #1#)
                             (EXIT
                              (LETT |p| (SPADCALL |p| (QREFELT $ 24)) . #1#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (SPADCALL (ELT $ 59) |l| (QREFELT $ 61))))))))) 

(SDEFUN |LAUPOL;coefficient;$IR;23| ((|p| $) (|n| |Integer|) ($ R))
        (SPROG ((#1=#:G761 NIL) (|m| (|Integer|)))
               (SEQ
                (LETT |m| (- |n| (SPADCALL |p| (QREFELT $ 19)))
                      . #2=(|LAUPOL;coefficient;$IR;23|))
                (EXIT
                 (COND ((< |m| 0) (|spadConstant| $ 10))
                       ('T
                        (SPADCALL (|LAUPOL;poly| |p| $)
                                  (PROG1 (LETT #1# |m| . #2#)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 48)))))))) 

(SDEFUN |LAUPOL;differentiate;$M$;24|
        ((|p| $) (|derivation| |Mapping| UP UP) ($ $))
        (SPROG ((|t| (UP)))
               (SEQ
                (LETT |t| (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 37))
                      |LAUPOL;differentiate;$M$;24|)
                (EXIT
                 (|LAUPOL;mkgpol| (- (SPADCALL |p| (QREFELT $ 19)) 1)
                  (SPADCALL
                   (SPADCALL (SPADCALL (|LAUPOL;poly| |p| $) |derivation|) |t|
                             (QREFELT $ 43))
                   (SPADCALL
                    (SPADCALL (SPADCALL |p| (QREFELT $ 19))
                              (|LAUPOL;poly| |p| $) (QREFELT $ 25))
                    (SPADCALL |t| |derivation|) (QREFELT $ 43))
                   (QREFELT $ 64))
                  $))))) 

(SDEFUN |LAUPOL;monTerm|
        ((|r| R) (|n| |Integer|) (|v| |OutputForm|) ($ |OutputForm|))
        (COND ((ZEROP |n|) (SPADCALL |r| (QREFELT $ 67))) ((EQL |n| 1) |v|)
              ('T (SPADCALL |v| (SPADCALL |n| (QREFELT $ 54)) (QREFELT $ 68))))) 

(SDEFUN |LAUPOL;toutput|
        ((|r| R) (|n| |Integer|) (|v| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (LETT |mon| (|LAUPOL;monTerm| |r| |n| |v| $) |LAUPOL;toutput|)
                (COND
                 ((OR (ZEROP |n|)
                      (SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 69)))
                  (EXIT |mon|)))
                (EXIT
                 (COND
                  ((SPADCALL |r|
                             (SPADCALL (|spadConstant| $ 13) (QREFELT $ 70))
                             (QREFELT $ 69))
                   (SPADCALL |mon| (QREFELT $ 71)))
                  ('T
                   (SPADCALL (SPADCALL |r| (QREFELT $ 67)) |mon|
                             (QREFELT $ 72)))))))) 

(SDEFUN |LAUPOL;recip;$U;27| ((|p| $) ($ |Union| $ #1="failed"))
        (SPROG ((|q| (|Union| UP #1#)))
               (SEQ
                (LETT |q| (SPADCALL (|LAUPOL;poly| |p| $) (QREFELT $ 74))
                      |LAUPOL;recip;$U;27|)
                (EXIT
                 (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (|LAUPOL;gpol| (QCDR |q|)
                               (- (SPADCALL |p| (QREFELT $ 19))) $)))))))) 

(SDEFUN |LAUPOL;+;3$;28| ((|p| $) (|q| $) ($ $))
        (SPROG ((#1=#:G783 NIL) (#2=#:G782 NIL) (|d| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |q| (QREFELT $ 52)) |p|)
                      ((SPADCALL |p| (QREFELT $ 52)) |q|)
                      (#3='T
                       (SEQ
                        (LETT |d|
                              (- (SPADCALL |p| (QREFELT $ 19))
                                 (SPADCALL |q| (QREFELT $ 19)))
                              . #4=(|LAUPOL;+;3$;28|))
                        (EXIT
                         (COND
                          ((SPADCALL |d| 0 (QREFELT $ 76))
                           (|LAUPOL;gpol|
                            (SPADCALL
                             (SPADCALL (|LAUPOL;poly| |p| $)
                                       (SPADCALL (|spadConstant| $ 13)
                                                 (PROG1 (LETT #2# |d| . #4#)
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 (QREFELT $ 37))
                                       (QREFELT $ 43))
                             (|LAUPOL;poly| |q| $) (QREFELT $ 64))
                            (SPADCALL |q| (QREFELT $ 19)) $))
                          ((< |d| 0)
                           (|LAUPOL;gpol|
                            (SPADCALL (|LAUPOL;poly| |p| $)
                                      (SPADCALL (|LAUPOL;poly| |q| $)
                                                (SPADCALL (|spadConstant| $ 13)
                                                          (PROG1
                                                              (LETT #1# (- |d|)
                                                                    . #4#)
                                                            (|check_subtype2|
                                                             (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                                          (QREFELT $ 37))
                                                (QREFELT $ 43))
                                      (QREFELT $ 64))
                            (SPADCALL |p| (QREFELT $ 19)) $))
                          (#3#
                           (|LAUPOL;mkgpol| (SPADCALL |p| (QREFELT $ 19))
                            (SPADCALL (|LAUPOL;poly| |p| $)
                                      (|LAUPOL;poly| |q| $) (QREFELT $ 64))
                            $)))))))))) 

(SDEFUN |LAUPOL;mkgpol| ((|n| |Integer|) (|p| UP) ($ $))
        (SPROG ((#1=#:G789 NIL) (|d| (|NonNegativeInteger|)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 47)) (|spadConstant| $ 9))
                      ('T
                       (SEQ
                        (LETT |d|
                              (SPADCALL |p|
                                        (SPADCALL (|spadConstant| $ 13) 1
                                                  (QREFELT $ 37))
                                        (QREFELT $ 78))
                              . #2=(|LAUPOL;mkgpol|))
                        (EXIT
                         (|LAUPOL;gpol|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL |p|
                                              (SPADCALL (|spadConstant| $ 13)
                                                        |d| (QREFELT $ 37))
                                              (QREFELT $ 79))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                            (|Union| (QREFELT $ 7) "failed")
                                            #1#))
                          (+ |n| |d|) $)))))))) 

(SDEFUN |LAUPOL;exquo;2$U;30| ((|p| $) (|q| $) ($ |Union| $ #1="failed"))
        (SPROG ((|r| (|Union| UP #1#)))
               (SEQ
                (LETT |r|
                      (SPADCALL (|LAUPOL;poly| |p| $) (|LAUPOL;poly| |q| $)
                                (QREFELT $ 79))
                      |LAUPOL;exquo;2$U;30|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (|LAUPOL;check0|
                               (- (SPADCALL |p| (QREFELT $ 19))
                                  (SPADCALL |q| (QREFELT $ 19)))
                               (QCDR |r|) $)))))))) 

(SDEFUN |LAUPOL;retractIfCan;$U;31| ((|p| $) ($ |Union| UP "failed"))
        (SPROG ((#1=#:G806 NIL))
               (COND
                ((< (SPADCALL |p| (QREFELT $ 19)) 0)
                 (|error| "Not retractable"))
                ('T
                 (CONS 0
                       (SPADCALL (|LAUPOL;poly| |p| $)
                                 (SPADCALL (|spadConstant| $ 13)
                                           (PROG1
                                               (LETT #1#
                                                     (SPADCALL |p|
                                                               (QREFELT $ 19))
                                                     |LAUPOL;retractIfCan;$U;31|)
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT $ 37))
                                 (QREFELT $ 43))))))) 

(SDEFUN |LAUPOL;retractIfCan;$U;32| ((|p| $) ($ |Union| R "failed"))
        (COND
         ((SPADCALL (SPADCALL |p| (QREFELT $ 19)) 0 (QREFELT $ 83))
          (CONS 1 "failed"))
         ('T (SPADCALL (|LAUPOL;poly| |p| $) (QREFELT $ 85))))) 

(SDEFUN |LAUPOL;gcd;3$;33| ((|p| $) (|q| $) ($ $))
        (SPADCALL
         (SPADCALL (|LAUPOL;poly| |p| $) (|LAUPOL;poly| |q| $) (QREFELT $ 87))
         (QREFELT $ 22))) 

(SDEFUN |LAUPOL;separate;FR;34|
        ((|f| |Fraction| UP)
         ($ |Record| (|:| |polyPart| $) (|:| |fracPart| (|Fraction| UP))))
        (SPROG
         ((|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|bc| (|Record| (|:| |coef1| UP) (|:| |coef2| UP))) (#1=#:G826 NIL)
          (|q| (UP)) (#2=#:G822 NIL) (|tn| (UP)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (SPADCALL
                 (LETT |q| (SPADCALL |f| (QREFELT $ 89))
                       . #3=(|LAUPOL;separate;FR;34|))
                 (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 37))
                 (QREFELT $ 78))
                . #3#)
          (LETT |q|
                (PROG2
                    (LETT #2#
                          (SPADCALL |q|
                                    (LETT |tn|
                                          (SPADCALL (|spadConstant| $ 13) |n|
                                                    (QREFELT $ 37))
                                          . #3#)
                                    (QREFELT $ 79))
                          . #3#)
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) "failed") #2#))
                . #3#)
          (LETT |bc|
                (PROG2
                    (LETT #1#
                          (SPADCALL |tn| |q| (SPADCALL |f| (QREFELT $ 90))
                                    (QREFELT $ 93))
                          . #3#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT $ 7))
                                            (|:| |coef2| (QREFELT $ 7)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT $ 7))
                                             (|:| |coef2| (QREFELT $ 7)))
                                   "failed")
                                  #1#))
                . #3#)
          (LETT |qr| (SPADCALL (QCAR |bc|) |q| (QREFELT $ 95)) . #3#)
          (EXIT
           (CONS
            (|LAUPOL;mkgpol| (- |n|)
             (SPADCALL (QCDR |bc|) (SPADCALL |tn| (QCAR |qr|) (QREFELT $ 43))
                       (QREFELT $ 64))
             $)
            (SPADCALL (QCDR |qr|) |q| (QREFELT $ 96))))))) 

(SDEFUN |LAUPOL;divide;2$R;35|
        ((|p| $) (|q| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (#1=#:G837 NIL) (|c| (|Integer|)))
         (SEQ
          (LETT |c|
                (MIN (SPADCALL |p| (QREFELT $ 19))
                     (SPADCALL |q| (QREFELT $ 19)))
                . #2=(|LAUPOL;divide;2$R;35|))
          (LETT |qr|
                (SPADCALL
                 (SPADCALL (|LAUPOL;poly| |p| $)
                           (SPADCALL (|spadConstant| $ 13)
                                     (PROG1
                                         (LETT #1#
                                               (- (SPADCALL |p| (QREFELT $ 19))
                                                  |c|)
                                               . #2#)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 37))
                           (QREFELT $ 43))
                 (|LAUPOL;poly| |q| $) (QREFELT $ 95))
                . #2#)
          (EXIT
           (CONS
            (|LAUPOL;mkgpol| (- |c| (SPADCALL |q| (QREFELT $ 19))) (QCAR |qr|)
             $)
            (|LAUPOL;mkgpol| |c| (QCDR |qr|) $)))))) 

(SDEFUN |LAUPOL;euclideanSize;$Nni;36| ((|p| $) ($ |NonNegativeInteger|))
        (SPADCALL (|LAUPOL;poly| |p| $) (QREFELT $ 33))) 

(SDEFUN |LAUPOL;extendedEuclidean;3$U;37|
        ((|a| $) (|b| $) (|c| $)
         ($ |Union| (|Record| (|:| |coef1| $) (|:| |coef2| $)) #1="failed"))
        (SPROG
         ((|bc| (|Union| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)) #1#)))
         (SEQ
          (LETT |bc|
                (SPADCALL (|LAUPOL;poly| |a| $) (|LAUPOL;poly| |b| $)
                          (|LAUPOL;poly| |c| $) (QREFELT $ 93))
                |LAUPOL;extendedEuclidean;3$U;37|)
          (EXIT
           (COND ((QEQCAR |bc| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (CONS
                         (|LAUPOL;mkgpol|
                          (- (SPADCALL |c| (QREFELT $ 19))
                             (SPADCALL |a| (QREFELT $ 19)))
                          (QCAR (QCDR |bc|)) $)
                         (|LAUPOL;mkgpol|
                          (- (SPADCALL |c| (QREFELT $ 19))
                             (SPADCALL |b| (QREFELT $ 19)))
                          (QCDR (QCDR |bc|)) $))))))))) 

(DECLAIM (NOTINLINE |LaurentPolynomial;|)) 

(DEFUN |LaurentPolynomial| (&REST #1=#:G868)
  (SPROG NIL
         (PROG (#2=#:G869)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LaurentPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|LaurentPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LaurentPolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LaurentPolynomial|)))))))))) 

(DEFUN |LaurentPolynomial;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LaurentPolynomial|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LaurentPolynomial| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 119) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|LaurentPolynomial| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |polypart| |#2|)
                              (|:| |order0| (|Integer|))))
          (COND
           ((|testBitVector| |pv$| 5)
            (PROGN
             (QSETREFV $ 88 (CONS (|dispatchFunction| |LAUPOL;gcd;3$;33|) $))
             (QSETREFV $ 98
                       (CONS (|dispatchFunction| |LAUPOL;separate;FR;34|) $))
             (QSETREFV $ 99
                       (CONS (|dispatchFunction| |LAUPOL;divide;2$R;35|) $))
             (QSETREFV $ 100
                       (CONS
                        (|dispatchFunction| |LAUPOL;euclideanSize;$Nni;36|) $))
             (QSETREFV $ 101
                       (CONS
                        (|dispatchFunction| |LAUPOL;extendedEuclidean;3$U;37|)
                        $)))))
          $))) 

(MAKEPROP '|LaurentPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |LAUPOL;Zero;$;1|) $))
              (0 . |Zero|) (4 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |LAUPOL;One;$;2|) $))
              (8 . |One|) (12 . |One|) (|Boolean|) (16 . =) |LAUPOL;=;2$B;3|
              (|Integer|) |LAUPOL;order;$I;5| (22 . |coerce|)
              |LAUPOL;monomial;RI$;7| |LAUPOL;coerce;UP$;8| (27 . |reductum|)
              |LAUPOL;reductum;2$;9| (32 . *) |LAUPOL;*;I2$;10|
              (|NonNegativeInteger|) (38 . |characteristic|)
              |LAUPOL;characteristic;Nni;11| (42 . |coerce|)
              |LAUPOL;coerce;R$;15| |LAUPOL;coerce;I$;12| (47 . |degree|)
              |LAUPOL;degree;$I;13| (52 . |monomial?|) |LAUPOL;monomial?;$B;14|
              (57 . |monomial|) (|Fraction| 7) (63 . |coerce|) (68 . ^)
              (74 . *) |LAUPOL;convert;$F;16| (80 . *) |LAUPOL;*;3$;17|
              (86 . -) |LAUPOL;-;2$;18| (91 . |zero?|) (96 . |coefficient|)
              |LAUPOL;trailingCoefficient;$R;20| (102 . |leadingCoefficient|)
              |LAUPOL;leadingCoefficient;$R;21| (107 . |zero?|) (|OutputForm|)
              (112 . |coerce|) (117 . |coerce|) (122 . ~=) (|List| 53)
              (128 . |concat|) (134 . +) (|Mapping| 53 53 53) (140 . |reduce|)
              |LAUPOL;coerce;$Of;22| |LAUPOL;coefficient;$IR;23| (146 . +)
              (|Mapping| 7 7) |LAUPOL;differentiate;$M$;24| (152 . |coerce|)
              (157 . ^) (163 . =) (169 . -) (174 . -) (179 . *)
              (|Union| $ '"failed") (185 . |recip|) |LAUPOL;recip;$U;27|
              (190 . >) |LAUPOL;+;3$;28| (196 . |order|) (202 . |exquo|)
              |LAUPOL;exquo;2$U;30| (|Union| 7 '"failed")
              |LAUPOL;retractIfCan;$U;31| (208 . ~=) (|Union| 6 '#1="failed")
              (214 . |retractIfCan|) |LAUPOL;retractIfCan;$U;32| (219 . |gcd|)
              (225 . |gcd|) (231 . |denom|) (236 . |numer|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 91 '#2="failed") (241 . |extendedEuclidean|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (248 . |divide|) (254 . /)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 38))
              (260 . |separate|) (265 . |divide|) (271 . |euclideanSize|)
              (276 . |extendedEuclidean|) (|Union| 103 '#2#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef| 103) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Union| 109 '#1#) (|Fraction| 18) (|Union| 18 '#1#) (|List| 112)
              (|Symbol|) (|List| 27)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 283 |zero?| 289 |unitNormal| 294 |unitCanonical| 299 |unit?|
              304 |trailingCoefficient| 309 |subtractIfCan| 314 |sizeLess?| 320
              |separate| 326 |sample| 331 |retractIfCan| 335 |retract| 355
              |rem| 375 |reductum| 381 |recip| 386 |quo| 391 |principalIdeal|
              397 |order| 402 |opposite?| 407 |one?| 413 |multiEuclidean| 418
              |monomial?| 424 |monomial| 429 |leadingCoefficient| 435 |lcmCoef|
              440 |lcm| 446 |latex| 457 |hashUpdate!| 462 |hash| 468
              |gcdPolynomial| 473 |gcd| 479 |extendedEuclidean| 490 |exquo| 503
              |expressIdealMember| 509 |euclideanSize| 515 |divide| 520
              |differentiate| 526 |degree| 576 |convert| 581 |coerce| 586
              |coefficient| 616 |charthRoot| 622 |characteristic| 627
              |associates?| 631 |annihilate?| 637 ^ 643 |Zero| 655 |One| 659 D
              663 = 713 - 719 + 730 * 736)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(5 5 5 0 0 0 5 0 0 0 1 2 6 7 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 4))
            (CONS
             '#(|EuclideanDomain&| NIL |GcdDomain&| NIL
                |DifferentialExtension&| |Algebra&| NIL |EntireRing&| |Module&|
                NIL |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL |Rng&| |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |BasicType&| NIL
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|EuclideanDomain|) (|PrincipalIdealDomain|) (|GcdDomain|)
                 (|IntegralDomain|) (|DifferentialExtension| 7) (|Algebra| $$)
                 (|LeftOreRing|) (|EntireRing|) (|Module| $$)
                 (|CommutativeRing|) (|PartialDifferentialRing| 112)
                 (|DifferentialRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| $$) (|RightModule| $$) (|Rng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|RetractableTo| 7)
                 (|RetractableTo| 6) (|ConvertibleTo| (|Fraction| 7))
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 53) (|RetractableTo| 109)
                 (|RetractableTo| 18))
              (|makeByteWordVec2| 118
                                  '(0 6 0 10 0 7 0 11 0 6 0 13 0 7 0 14 2 7 15
                                    0 0 16 1 7 0 6 20 1 7 0 0 23 2 7 0 18 0 25
                                    0 6 27 28 1 6 0 18 30 1 7 27 0 33 1 7 15 0
                                    35 2 7 0 6 27 37 1 38 0 7 39 2 38 0 0 18 40
                                    2 38 0 7 0 41 2 7 0 0 0 43 1 7 0 0 45 1 7
                                    15 0 47 2 7 6 0 27 48 1 7 6 0 50 1 0 15 0
                                    52 1 18 53 0 54 1 7 53 0 55 2 0 15 0 0 56 2
                                    57 0 0 53 58 2 53 0 0 0 59 2 57 53 60 0 61
                                    2 7 0 0 0 64 1 6 53 0 67 2 53 0 0 0 68 2 6
                                    15 0 0 69 1 6 0 0 70 1 53 0 0 71 2 53 0 0 0
                                    72 1 7 73 0 74 2 18 15 0 0 76 2 7 27 0 0 78
                                    2 7 73 0 0 79 2 18 15 0 0 83 1 7 84 0 85 2
                                    7 0 0 0 87 2 0 0 0 0 88 1 38 7 0 89 1 38 7
                                    0 90 3 7 92 0 0 0 93 2 7 94 0 0 95 2 38 0 7
                                    7 96 1 0 97 38 98 2 0 94 0 0 99 1 0 27 0
                                    100 3 0 92 0 0 0 101 2 0 15 0 0 56 1 0 15 0
                                    52 1 0 114 0 1 1 0 0 0 1 1 0 15 0 1 1 0 6 0
                                    49 2 0 73 0 0 1 2 5 15 0 0 1 1 5 97 38 98 0
                                    0 0 1 1 3 108 0 1 1 4 110 0 1 1 0 81 0 82 1
                                    0 84 0 86 1 3 109 0 1 1 4 18 0 1 1 0 7 0 1
                                    1 0 6 0 1 2 5 0 0 0 1 1 0 0 0 24 1 0 73 0
                                    75 2 5 0 0 0 1 1 5 105 103 1 1 0 18 0 19 2
                                    0 15 0 0 1 1 0 15 0 1 2 5 102 103 0 1 1 0
                                    15 0 36 2 0 0 6 18 21 1 0 6 0 51 2 5 107 0
                                    0 1 1 5 0 103 1 2 5 0 0 0 1 1 0 116 0 1 2 0
                                    118 118 0 1 1 0 117 0 1 2 5 106 106 106 1 1
                                    5 0 103 1 2 5 0 0 0 88 2 5 104 0 0 1 3 5 92
                                    0 0 0 101 2 0 73 0 0 80 2 5 102 103 0 1 1 5
                                    27 0 100 2 5 94 0 0 99 1 2 0 0 1 2 2 0 0 27
                                    1 2 1 0 0 111 1 2 1 0 0 112 1 3 1 0 0 112
                                    27 1 3 1 0 0 111 113 1 3 0 0 0 65 27 1 2 0
                                    0 0 65 66 1 0 18 0 34 1 0 38 0 42 1 3 0 109
                                    1 1 0 0 7 22 1 0 0 6 31 1 0 0 0 1 1 0 0 18
                                    32 1 0 53 0 62 2 0 6 0 18 63 1 6 73 0 1 0 0
                                    27 29 2 0 15 0 0 1 2 0 15 0 0 1 2 0 0 0 27
                                    1 2 0 0 0 115 1 0 0 0 9 0 0 0 12 1 2 0 0 1
                                    2 2 0 0 27 1 2 1 0 0 112 1 3 1 0 0 112 27 1
                                    2 1 0 0 111 1 3 1 0 0 111 113 1 2 0 0 0 65
                                    1 3 0 0 0 65 27 1 2 0 15 0 0 17 1 0 0 0 46
                                    2 0 0 0 0 1 2 0 0 0 0 77 2 0 0 0 0 44 2 0 0
                                    18 0 26 2 0 0 27 0 1 2 0 0 115 0 1)))))
           '|lookupComplete|)) 
