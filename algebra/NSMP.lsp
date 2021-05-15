
(SDEFUN |NSMP;PSimp| ((|up| D) (|mv| |VarSet|) ($ $))
        (COND
         ((EQL (SPADCALL |up| (QREFELT $ 12)) 0)
          (SPADCALL |up| (QREFELT $ 14)))
         ('T (CONS 1 (CONS |mv| |up|))))) 

(PUT '|NSMP;coerce;$Smp;2| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSMP;coerce;$Smp;2|
        ((|p| $) ($ |SparseMultivariatePolynomial| R |VarSet|)) |p|) 

(PUT '|NSMP;coerce;Smp$;3| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSMP;coerce;Smp$;3|
        ((|p| |SparseMultivariatePolynomial| R |VarSet|) ($ $)) |p|) 

(PUT '|NSMP;retractIfCan;$U;4| '|SPADreplace| '(XLAM (|p|) (CONS 0 |p|))) 

(SDEFUN |NSMP;retractIfCan;$U;4|
        ((|p| $)
         ($ |Union| (|SparseMultivariatePolynomial| R |VarSet|) "failed"))
        (CONS 0 |p|)) 

(SDEFUN |NSMP;mvar;$VarSet;5| ((|p| $) ($ |VarSet|))
        (COND
         ((QEQCAR |p| 0)
          (|error| "Error in mvar from NSMP : #1 has no variables."))
         ('T (QCAR (QCDR |p|))))) 

(SDEFUN |NSMP;mdeg;$Nni;6| ((|p| $) ($ |NonNegativeInteger|))
        (COND ((QEQCAR |p| 0) 0)
              ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 12))))) 

(SDEFUN |NSMP;init;2$;7| ((|p| $) ($ $))
        (COND
         ((QEQCAR |p| 0)
          (|error| "Error in init from NSMP : #1 has no variables."))
         ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14))))) 

(SDEFUN |NSMP;head;2$;8| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))))))) 

(SDEFUN |NSMP;tail;2$;9| ((|p| $) ($ $))
        (SPROG ((|red| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 13))
                      (#1='T
                       (SEQ
                        (LETT |red|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)))
                        (EXIT
                         (COND
                          ((SPADCALL |red| (QREFELT $ 26))
                           (SPADCALL |red| (QREFELT $ 27)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |red|))))))))))) 

(SDEFUN |NSMP;iteratedInitials;$L;10| ((|p| $) ($ |List| $))
        (SEQ
         (COND ((QEQCAR |p| 0) NIL)
               ('T
                (SEQ (LETT |p| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14)))
                     (EXIT
                      (SPADCALL |p| (SPADCALL |p| (QREFELT $ 30))
                                (QREFELT $ 32)))))))) 

(SDEFUN |NSMP;localDeepestInitial| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (|NSMP;localDeepestInitial|
                (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14)) $)))) 

(SDEFUN |NSMP;deepestInitial;2$;12| ((|p| $) ($ $))
        (COND
         ((QEQCAR |p| 0)
          (|error| "Error in deepestInitial from NSMP : #1 has no variables."))
         ('T
          (|NSMP;localDeepestInitial|
           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14)) $)))) 

(SDEFUN |NSMP;mainMonomial;2$;13| ((|p| $) ($ $))
        (COND
         ((SPADCALL |p| (QREFELT $ 34))
          (|error| "Error in mainMonomial from NSMP : the argument is zero"))
         ((QEQCAR |p| 0) (|spadConstant| $ 35))
         ('T
          (SPADCALL (|spadConstant| $ 35) (QCAR (QCDR |p|))
                    (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 12))
                    (QREFELT $ 36))))) 

(SDEFUN |NSMP;leastMonomial;2$;14| ((|p| $) ($ $))
        (COND
         ((SPADCALL |p| (QREFELT $ 34))
          (|error| "Error in leastMonomial from NSMP : the argument is zero"))
         ((QEQCAR |p| 0) (|spadConstant| $ 35))
         ('T
          (SPADCALL (|spadConstant| $ 35) (QCAR (QCDR |p|))
                    (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 38))
                    (QREFELT $ 36))))) 

(SDEFUN |NSMP;mainCoefficients;$L;15| ((|p| $) ($ |List| $))
        (COND
         ((SPADCALL |p| (QREFELT $ 34))
          (|error|
           "Error in mainCoefficients from NSMP : the argument is zero"))
         ((QEQCAR |p| 0) (LIST |p|))
         ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40))))) 

(SDEFUN |NSMP;leadingCoefficient;$VarSet$;16| ((|p| $) (|x| |VarSet|) ($ $))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND ((QEQCAR |p| 0) |p|)
                     ((SPADCALL (QCAR (QCDR |p|)) |x| (QREFELT $ 42))
                      (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14)))
                     ((ZEROP (LETT |d| (SPADCALL |p| |x| (QREFELT $ 43)))) |p|)
                     ('T (SPADCALL |p| |x| |d| (QREFELT $ 44)))))) 

(SDEFUN |NSMP;localMonicModulo| ((|a| $) (|b| $) ($ $))
        (SPROG ((|mM| ($)) (|m| (D)))
               (SEQ
                (COND
                 ((OR (QEQCAR |a| 0)
                      (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                                (QREFELT $ 46)))
                  |a|)
                 ('T
                  (SEQ
                   (COND
                    ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                               (QREFELT $ 47))
                     (LETT |m|
                           (SPADCALL
                            (CONS #'|NSMP;localMonicModulo!0| (VECTOR $ |b|))
                            (QCDR (QCDR |a|)) (QREFELT $ 51))))
                    (#1='T
                     (LETT |m|
                           (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                     (QREFELT $ 52)))))
                   (COND
                    ((SPADCALL |m| (QREFELT $ 26))
                     (LETT |mM| (SPADCALL |m| (QREFELT $ 27))))
                    (#1# (LETT |mM| (CONS 1 (CONS (QCAR (QCDR |a|)) |m|)))))
                   (EXIT |mM|))))))) 

(SDEFUN |NSMP;localMonicModulo!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|NSMP;localMonicModulo| |a1| |b| $))))) 

(SDEFUN |NSMP;monicModulo;3$;18| ((|a| $) (|b| $) ($ $))
        (SPROG ((|mM| ($)) (|rec| (|Union| R "failed")) (|r| (R)) (|ib| ($)))
               (SEQ
                (COND
                 ((QEQCAR |b| 0)
                  (|error| "Error in monicModulo from NSMP : #2 is constant"))
                 (#1='T
                  (SEQ (LETT |ib| (SPADCALL |b| (QREFELT $ 21)))
                       (COND
                        ((NULL (SPADCALL |ib| (QREFELT $ 53)))
                         (EXIT
                          (|error|
                           "Error in monicModulo from NSMP : #2 is not monic"))))
                       (COND
                        ((SPADCALL |ib| (|spadConstant| $ 35) (QREFELT $ 55))
                         (LETT |mM| (|NSMP;localMonicModulo| |a| |b| $)))
                        (#1#
                         (SEQ (LETT |r| (SPADCALL |ib| (QREFELT $ 56)))
                              (LETT |rec| (SPADCALL |r| (QREFELT $ 58)))
                              (EXIT
                               (COND
                                ((QEQCAR |rec| 1)
                                 (|error|
                                  "Error in monicModulo from NSMP : #2 is not monic"))
                                ((QEQCAR |a| 0) |a|)
                                (#1#
                                 (SEQ
                                  (LETT |a|
                                        (SPADCALL (QCDR |rec|) |a|
                                                  (QREFELT $ 59)))
                                  (LETT |b|
                                        (SPADCALL (QCDR |rec|) |b|
                                                  (QREFELT $ 59)))
                                  (EXIT
                                   (LETT |mM|
                                         (SPADCALL |ib|
                                                   (|NSMP;localMonicModulo| |a|
                                                    |b| $)
                                                   (QREFELT $ 60)))))))))))
                       (EXIT |mM|))))))) 

(SDEFUN |NSMP;prem;3$;19| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G516 NIL) (|test| (|Integer|)) (|delta| (|Integer|))
          (|term| ($)) (#2=#:G509 NIL) (#3=#:G520 NIL) (|r| (D))
          (#4=#:G496 NIL) (|lcb| ($)) (|db| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND ((QEQCAR |b| 0) (|error| "in prem$NSMP: ground? #2"))
                 (#5='T
                  (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12)))
                       (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)))
                       (LETT |test|
                             (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                                |db|))
                       (LETT |delta| (MAX (+ |test| 1) 0))
                       (COND
                        ((OR (QEQCAR |a| 0)
                             (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                                       (QREFELT $ 46)))
                         (EXIT
                          (SPADCALL
                           (SPADCALL |lcb|
                                     (PROG1 (LETT #4# |delta|)
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                     (QREFELT $ 62))
                           |a| (QREFELT $ 60)))))
                       (EXIT
                        (COND
                         ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                                    (QREFELT $ 42))
                          (SEQ
                           (LETT |r|
                                 (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                           (QREFELT $ 63)))
                           (EXIT
                            (COND
                             ((SPADCALL |r| (QREFELT $ 26))
                              (PROGN
                               (LETT #3# (SPADCALL |r| (QREFELT $ 27)))
                               (GO #6=#:G519)))
                             (#5# (CONS 1 (CONS (QCAR (QCDR |a|)) |r|)))))))
                         (#5#
                          (SEQ
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND ((SPADCALL |a| (QREFELT $ 34)) NIL)
                                         ('T (NULL (MINUSP |test|)))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |term|
                                       (SPADCALL
                                        (SPADCALL |a| (QCAR (QCDR |b|))
                                                  (QREFELT $ 45))
                                        (QCAR (QCDR |b|))
                                        (PROG1 (LETT #2# |test|)
                                          (|check_subtype2| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                        (QREFELT $ 36)))
                                 (LETT |a|
                                       (SPADCALL
                                        (SPADCALL |lcb| |a| (QREFELT $ 60))
                                        (SPADCALL |term| |b| (QREFELT $ 60))
                                        (QREFELT $ 64)))
                                 (LETT |delta| (- |delta| 1))
                                 (EXIT
                                  (LETT |test|
                                        (-
                                         (SPADCALL |a| (QCAR (QCDR |b|))
                                                   (QREFELT $ 43))
                                         |db|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL
                             (SPADCALL |lcb|
                                       (PROG1 (LETT #1# |delta|)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                       (QREFELT $ 62))
                             |a| (QREFELT $ 60)))))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |NSMP;pquo;3$;20| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|c| ($))
          (|cPS|
           (|Record| (|:| |coef| $) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| $) (|:| |remainder| $))))
         (SEQ (LETT |cPS| (SPADCALL |a| |b| (QREFELT $ 67)))
              (LETT |c|
                    (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 62)))
              (EXIT (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 60)))))) 

(SDEFUN |NSMP;pseudoDivide;2$R;21|
        ((|a| $) (|b| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((|c| ($))
          (|cPS|
           (|Record| (|:| |coef| $) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| $) (|:| |remainder| $))))
         (SEQ (LETT |cPS| (SPADCALL |a| |b| (QREFELT $ 67)))
              (LETT |c|
                    (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 62)))
              (EXIT
               (CONS (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 60))
                     (SPADCALL |c| (QVELT |cPS| 3) (QREFELT $ 60))))))) 

(SDEFUN |NSMP;lazyPrem;3$;22| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|test| (|Integer|)) (|term| ($)) (#1=#:G535 NIL) (|lcb| ($))
          (|db| (|NonNegativeInteger|)))
         (SEQ
          (COND ((QEQCAR |b| 0) (|error| "in lazyPrem$NSMP: ground? #2"))
                ((OR (QEQCAR |a| 0)
                     (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                               (QREFELT $ 46)))
                 |a|)
                ('T
                 (COND
                  ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                             (QREFELT $ 42))
                   (|NSMP;PSimp|
                    (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                              (QREFELT $ 71))
                    (QCAR (QCDR |a|)) $))
                  ('T
                   (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12)))
                        (LETT |lcb|
                              (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)))
                        (LETT |test|
                              (-
                               (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                               |db|))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((SPADCALL |a| (QREFELT $ 34)) NIL)
                                      ('T (NULL (MINUSP |test|)))))
                               (GO G191)))
                             (SEQ
                              (LETT |term|
                                    (SPADCALL
                                     (SPADCALL |a| (QCAR (QCDR |b|))
                                               (QREFELT $ 45))
                                     (QCAR (QCDR |b|))
                                     (PROG1 (LETT #1# |test|)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 36)))
                              (LETT |a|
                                    (SPADCALL
                                     (SPADCALL |lcb| |a| (QREFELT $ 60))
                                     (SPADCALL |term| |b| (QREFELT $ 60))
                                     (QREFELT $ 64)))
                              (EXIT
                               (LETT |test|
                                     (-
                                      (SPADCALL |a| (QCAR (QCDR |b|))
                                                (QREFELT $ 43))
                                      |db|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |a|))))))))) 

(SDEFUN |NSMP;lazyPquo;3$;23| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|test| (|Integer|)) (|q| ($)) (|term| ($)) (#1=#:G547 NIL)
          (|lcb| ($)) (|db| (|NonNegativeInteger|)))
         (SEQ
          (COND ((QEQCAR |b| 0) (|error| "in lazyPquo$NSMP: #2 is constant"))
                ((OR (QEQCAR |a| 0)
                     (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                               (QREFELT $ 46)))
                 (|spadConstant| $ 13))
                ('T
                 (COND
                  ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                             (QREFELT $ 42))
                   (|NSMP;PSimp|
                    (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                              (QREFELT $ 73))
                    (QCAR (QCDR |a|)) $))
                  ('T
                   (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12)))
                        (LETT |lcb|
                              (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)))
                        (LETT |test|
                              (-
                               (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                               |db|))
                        (LETT |q| (|spadConstant| $ 13))
                        (LETT |test|
                              (-
                               (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                               |db|))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((SPADCALL |a| (QREFELT $ 34)) NIL)
                                      ('T (NULL (MINUSP |test|)))))
                               (GO G191)))
                             (SEQ
                              (LETT |term|
                                    (SPADCALL
                                     (SPADCALL |a| (QCAR (QCDR |b|))
                                               (QREFELT $ 45))
                                     (QCAR (QCDR |b|))
                                     (PROG1 (LETT #1# |test|)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 36)))
                              (LETT |a|
                                    (SPADCALL
                                     (SPADCALL |lcb| |a| (QREFELT $ 60))
                                     (SPADCALL |term| |b| (QREFELT $ 60))
                                     (QREFELT $ 64)))
                              (LETT |q|
                                    (SPADCALL
                                     (SPADCALL |lcb| |q| (QREFELT $ 60)) |term|
                                     (QREFELT $ 74)))
                              (EXIT
                               (LETT |test|
                                     (-
                                      (SPADCALL |a| (QCAR (QCDR |b|))
                                                (QREFELT $ 43))
                                      |db|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |q|))))))))) 

(SDEFUN |NSMP;lazyPseudoDivide;2$R;24|
        ((|a| $) (|b| $)
         ($ |Record| (|:| |coef| $) (|:| |gap| (|NonNegativeInteger|))
          (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((#1=#:G566 NIL) (|test| (|Integer|)) (|delta| (|Integer|)) (|q| ($))
          (|term| ($)) (#2=#:G562 NIL) (|lcb| ($))
          (|db| (|NonNegativeInteger|))
          (|cgqr|
           (|Record| (|:| |coef| $) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| D) (|:| |remainder| D))))
         (SEQ
          (COND
           ((QEQCAR |b| 0)
            (|error| "in lazyPseudoDivide$NSMP: #2 is constant"))
           ((OR (QEQCAR |a| 0)
                (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 46)))
            (VECTOR (|spadConstant| $ 35) 0 (|spadConstant| $ 13) |a|))
           ('T
            (COND
             ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 42))
              (SEQ
               (LETT |cgqr|
                     (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                               (QREFELT $ 77)))
               (EXIT
                (VECTOR (QVELT |cgqr| 0) (QVELT |cgqr| 1)
                        (|NSMP;PSimp| (QVELT |cgqr| 2) (QCAR (QCDR |a|)) $)
                        (|NSMP;PSimp| (QVELT |cgqr| 3) (QCAR (QCDR |a|)) $)))))
             ('T
              (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12)))
                   (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)))
                   (LETT |test|
                         (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                            |db|))
                   (LETT |q| (|spadConstant| $ 13))
                   (LETT |delta| (MAX (+ |test| 1) 0))
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((SPADCALL |a| (QREFELT $ 34)) NIL)
                                 ('T (NULL (MINUSP |test|)))))
                          (GO G191)))
                        (SEQ
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 45))
                                (QCAR (QCDR |b|))
                                (PROG1 (LETT #2# |test|)
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#))
                                (QREFELT $ 36)))
                         (LETT |a|
                               (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 60))
                                         (SPADCALL |term| |b| (QREFELT $ 60))
                                         (QREFELT $ 64)))
                         (LETT |q|
                               (SPADCALL (SPADCALL |lcb| |q| (QREFELT $ 60))
                                         |term| (QREFELT $ 74)))
                         (LETT |delta| (- |delta| 1))
                         (EXIT
                          (LETT |test|
                                (-
                                 (SPADCALL |a| (QCAR (QCDR |b|))
                                           (QREFELT $ 43))
                                 |db|))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (VECTOR |lcb|
                            (PROG1 (LETT #1# |delta|)
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            |q| |a|)))))))))) 

(SDEFUN |NSMP;lazyResidueClass;2$R;25|
        ((|a| $) (|b| $)
         ($ |Record| (|:| |polnum| $) (|:| |polden| $)
          (|:| |power| (|NonNegativeInteger|))))
        (SPROG
         ((|test| (|Integer|)) (|pow| (|NonNegativeInteger|)) (|term| ($))
          (#1=#:G579 NIL) (|db| (|NonNegativeInteger|))
          (|lrc|
           (|Record| (|:| |polnum| D) (|:| |polden| $)
                     (|:| |power| (|NonNegativeInteger|))))
          (|lcb| ($)))
         (SEQ
          (COND
           ((QEQCAR |b| 0)
            (|error| "in lazyResidueClass$NSMP: #2 is constant"))
           (#2='T
            (SEQ (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)))
                 (COND
                  ((OR (QEQCAR |a| 0)
                       (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                                 (QREFELT $ 46)))
                   (EXIT (VECTOR |a| |lcb| 0))))
                 (EXIT
                  (COND
                   ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                              (QREFELT $ 42))
                    (SEQ
                     (LETT |lrc|
                           (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                     (QREFELT $ 80)))
                     (EXIT
                      (VECTOR
                       (|NSMP;PSimp| (QVELT |lrc| 0) (QCAR (QCDR |a|)) $)
                       (QVELT |lrc| 1) (QVELT |lrc| 2)))))
                   (#2#
                    (SEQ
                     (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12)))
                     (LETT |test|
                           (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                              |db|))
                     (LETT |pow| 0)
                     (SEQ G190
                          (COND
                           ((NULL
                             (COND ((SPADCALL |a| (QREFELT $ 34)) NIL)
                                   ('T (NULL (MINUSP |test|)))))
                            (GO G191)))
                          (SEQ
                           (LETT |term|
                                 (SPADCALL
                                  (SPADCALL |a| (QCAR (QCDR |b|))
                                            (QREFELT $ 45))
                                  (QCAR (QCDR |b|))
                                  (PROG1 (LETT #1# |test|)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 36)))
                           (LETT |a|
                                 (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 60))
                                           (SPADCALL |term| |b| (QREFELT $ 60))
                                           (QREFELT $ 64)))
                           (LETT |pow| (+ |pow| 1))
                           (EXIT
                            (LETT |test|
                                  (-
                                   (SPADCALL |a| (QCAR (QCDR |b|))
                                             (QREFELT $ 43))
                                   |db|))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (VECTOR |a| |lcb| |pow|)))))))))))) 

(SDEFUN |NSMP;exactQuo| ((|x| $) (|y| $) ($ $))
        (SPROG ((|ex| (|Union| $ "failed")))
               (SEQ (LETT |ex| (SPADCALL |x| |y| (QREFELT $ 84)))
                    (EXIT
                     (COND ((QEQCAR |ex| 0) (QCDR |ex|))
                           ('T (|error| "in exactQuotient$NSMP: bad args"))))))) 

(SDEFUN |NSMP;LazardQuotient;2$Nni$;27|
        ((|x| $) (|y| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| |y| |n| (QREFELT $ 85))) 

(SDEFUN |NSMP;LazardQuotient2;3$Nni$;28|
        ((|p| $) (|a| $) (|b| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|c| ($)) (#1=#:G595 NIL))
               (SEQ
                (COND ((ZEROP |n|) (|error| "in LazardQuotient2$NSMP: bad #4"))
                      ((EQL |n| 1) |p|)
                      ('T
                       (SEQ
                        (LETT |c|
                              (SPADCALL |a| |b|
                                        (PROG1 (LETT #1# (- |n| 1))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 86)))
                        (EXIT
                         (|NSMP;exactQuo| (SPADCALL |c| |p| (QREFELT $ 60)) |b|
                          $)))))))) 

(SDEFUN |NSMP;next_subResultant2;5$;29| ((|p| $) (|q| $) (|z| $) (|s| $) ($ $))
        (|NSMP;PSimp|
         (SPADCALL (QCDR (QCDR |p|)) (QCDR (QCDR |q|)) (QCDR (QCDR |z|)) |s|
                   (QREFELT $ 88))
         (QCAR (QCDR |p|)) $)) 

(SDEFUN |NSMP;subResultantGcd;3$;30| ((|a| $) (|b| $) ($ $))
        (COND
         ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
          (|error| "subResultantGcd$NSMP: one arg is constant"))
         ('T
          (COND
           ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 90))
            (|error| "subResultantGcd$NSMP: mvar(#1) ~= mvar(#2)"))
           ('T
            (|NSMP;PSimp|
             (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 91))
             (QCAR (QCDR |a|)) $)))))) 

(SDEFUN |NSMP;halfExtendedSubResultantGcd1;2$R;31|
        ((|a| $) (|b| $) ($ |Record| (|:| |gcd| $) (|:| |coef1| $)))
        (SPROG ((|hesrg| (|Record| (|:| |gcd| D) (|:| |coef1| D))))
               (SEQ
                (COND
                 ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
                  (|error|
                   "halfExtendedSubResultantGcd1$NSMP: one arg is constant"))
                 ('T
                  (COND
                   ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                              (QREFELT $ 90))
                    (|error|
                     "halfExtendedSubResultantGcd1$NSMP: mvar(#1) ~= mvar(#2)"))
                   ('T
                    (SEQ
                     (LETT |hesrg|
                           (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                     (QREFELT $ 94)))
                     (EXIT
                      (CONS (|NSMP;PSimp| (QCAR |hesrg|) (QCAR (QCDR |a|)) $)
                            (|NSMP;PSimp| (QCDR |hesrg|) (QCAR (QCDR |a|))
                             $))))))))))) 

(SDEFUN |NSMP;halfExtendedSubResultantGcd2;2$R;32|
        ((|a| $) (|b| $) ($ |Record| (|:| |gcd| $) (|:| |coef2| $)))
        (SPROG ((|hesrg| (|Record| (|:| |gcd| D) (|:| |coef2| D))))
               (SEQ
                (COND
                 ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
                  (|error|
                   "halfExtendedSubResultantGcd2$NSMP: one arg is constant"))
                 ('T
                  (COND
                   ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                              (QREFELT $ 90))
                    (|error|
                     "halfExtendedSubResultantGcd2$NSMP: mvar(#1) ~= mvar(#2)"))
                   ('T
                    (SEQ
                     (LETT |hesrg|
                           (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                     (QREFELT $ 97)))
                     (EXIT
                      (CONS (|NSMP;PSimp| (QCAR |hesrg|) (QCAR (QCDR |a|)) $)
                            (|NSMP;PSimp| (QCDR |hesrg|) (QCAR (QCDR |a|))
                             $))))))))))) 

(SDEFUN |NSMP;extendedSubResultantGcd;2$R;33|
        ((|a| $) (|b| $)
         ($ |Record| (|:| |gcd| $) (|:| |coef1| $) (|:| |coef2| $)))
        (SPROG
         ((|esrg| (|Record| (|:| |gcd| D) (|:| |coef1| D) (|:| |coef2| D))))
         (SEQ
          (COND
           ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
            (|error| "extendedSubResultantGcd$NSMP: one arg is constant"))
           ('T
            (COND
             ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 90))
              (|error| "extendedSubResultantGcd$NSMP: mvar(#1) ~= mvar(#2)"))
             ('T
              (SEQ
               (LETT |esrg|
                     (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                               (QREFELT $ 100)))
               (EXIT
                (VECTOR (|NSMP;PSimp| (QVELT |esrg| 0) (QCAR (QCDR |a|)) $)
                        (|NSMP;PSimp| (QVELT |esrg| 1) (QCAR (QCDR |a|)) $)
                        (|NSMP;PSimp| (QVELT |esrg| 2) (QCAR (QCDR |a|))
                         $))))))))))) 

(SDEFUN |NSMP;resultant;3$;34| ((|a| $) (|b| $) ($ $))
        (COND
         ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
          (|error| "resultant$NSMP: one arg is constant"))
         ('T
          (COND
           ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 90))
            (|error| "resultant$NSMP: mvar(#1) ~= mvar(#2)"))
           ('T
            (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 102))))))) 

(SDEFUN |NSMP;subResultantChain;2$L;35| ((|a| $) (|b| $) ($ |List| $))
        (SPROG ((#1=#:G641 NIL) (|up| NIL) (#2=#:G640 NIL))
               (SEQ
                (COND
                 ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
                  (|error| "subResultantChain$NSMP: one arg is constant"))
                 ('T
                  (COND
                   ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                              (QREFELT $ 90))
                    (|error| "subResultantChain$NSMP: mvar(#1) ~= mvar(#2)"))
                   ('T
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |up| NIL)
                          (LETT #1#
                                (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                          (QREFELT $ 104)))
                          G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |up| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (|NSMP;PSimp| |up| (QCAR (QCDR |a|)) $)
                                        #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |NSMP;lastSubResultant;3$;36| ((|a| $) (|b| $) ($ $))
        (COND
         ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
          (|error| "lastSubResultant$NSMP: one arg is constant"))
         ('T
          (COND
           ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 90))
            (|error| "lastSubResultant$NSMP: mvar(#1) ~= mvar(#2)"))
           ('T
            (|NSMP;PSimp|
             (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 106))
             (QCAR (QCDR |a|)) $)))))) 

(SDEFUN |NSMP;exactQuotient;$R$;37| ((|a| $) (|b| R) ($ $))
        (SPROG NIL
               (COND
                ((SPADCALL |b| (QCDR (|spadConstant| $ 35)) (QREFELT $ 108))
                 |a|)
                ((QEQCAR |a| 0)
                 (CONS 0 (SPADCALL (QCDR |a|) |b| (QREFELT $ 109))))
                ('T
                 (CONS 1
                       (CONS (QCAR (QCDR |a|))
                             (SPADCALL
                              (CONS #'|NSMP;exactQuotient;$R$;37!0|
                                    (VECTOR $ |b|))
                              (QCDR (QCDR |a|)) (QREFELT $ 51)))))))) 

(SDEFUN |NSMP;exactQuotient;$R$;37!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT $ 110)))))) 

(SDEFUN |NSMP;exactQuotient!;$R$;38| ((|a| $) (|b| R) ($ $))
        (SPROG NIL
               (SEQ
                (COND
                 ((SPADCALL |b| (QCDR (|spadConstant| $ 35)) (QREFELT $ 108))
                  |a|)
                 ((QEQCAR |a| 0)
                  (CONS 0 (SPADCALL (QCDR |a|) |b| (QREFELT $ 109))))
                 ('T
                  (SEQ
                   (PROGN
                    (RPLACD #1=(QCDR |a|)
                            (SPADCALL
                             (CONS #'|NSMP;exactQuotient!;$R$;38!0|
                                   (VECTOR $ |b|))
                             (QCDR (QCDR |a|)) (QREFELT $ 51)))
                    (QCDR #1#))
                   (EXIT |a|))))))) 

(SDEFUN |NSMP;exactQuotient!;$R$;38!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT $ 111)))))) 

(SDEFUN |NSMP;exactQuotient;$R$;39| ((|a| $) (|b| R) ($ $))
        (SPROG ((#1=#:G657 NIL))
               (COND
                ((SPADCALL |b| (QCDR (|spadConstant| $ 35)) (QREFELT $ 108))
                 |a|)
                ((QEQCAR |a| 0)
                 (CONS 0
                       (PROG2
                           (LETT #1# (SPADCALL (QCDR |a|) |b| (QREFELT $ 112)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                         (|Union| (QREFELT $ 6) "failed")
                                         #1#))))
                ('T
                 (CONS 1
                       (CONS (QCAR (QCDR |a|))
                             (SPADCALL
                              (CONS #'|NSMP;exactQuotient;$R$;39!0|
                                    (VECTOR $ |b|))
                              (QCDR (QCDR |a|)) (QREFELT $ 51)))))))) 

(SDEFUN |NSMP;exactQuotient;$R$;39!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT $ 110)))))) 

(SDEFUN |NSMP;exactQuotient!;$R$;40| ((|a| $) (|b| R) ($ $))
        (SPROG ((#1=#:G666 NIL))
               (SEQ
                (COND
                 ((SPADCALL |b| (QCDR (|spadConstant| $ 35)) (QREFELT $ 108))
                  |a|)
                 ((QEQCAR |a| 0)
                  (CONS 0
                        (PROG2
                            (LETT #1#
                                  (SPADCALL (QCDR |a|) |b| (QREFELT $ 112)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #1#))))
                 ('T
                  (SEQ
                   (PROGN
                    (RPLACD #2=(QCDR |a|)
                            (SPADCALL
                             (CONS #'|NSMP;exactQuotient!;$R$;40!0|
                                   (VECTOR $ |b|))
                             (QCDR (QCDR |a|)) (QREFELT $ 51)))
                    (QCDR #2#))
                   (EXIT |a|))))))) 

(SDEFUN |NSMP;exactQuotient!;$R$;40!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT $ 111)))))) 

(SDEFUN |NSMP;localGcd| ((|r| R) (|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (SPADCALL |r| (QCDR |p|) (QREFELT $ 113)))
              ('T
               (SPADCALL |r| (SPADCALL |p| (QREFELT $ 114)) (QREFELT $ 113))))) 

(SDEFUN |NSMP;gcd;R$R;42| ((|r| R) (|p| $) ($ R))
        (COND
         ((OR (SPADCALL |r| (QCDR (|spadConstant| $ 35)) (QREFELT $ 108))
              (SPADCALL |p| (QREFELT $ 34)))
          |r|)
         ('T (|NSMP;localGcd| |r| |p| $)))) 

(SDEFUN |NSMP;content;$R;43| ((|p| $) ($ R))
        (SPROG ((|up| (D)) (|r| (R)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ (LETT |up| (QCDR (QCDR |p|)))
                            (LETT |r| (|spadConstant| $ 78))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL
                                     (OR (SPADCALL |up| (QREFELT $ 116))
                                         (SPADCALL |r|
                                                   (QCDR (|spadConstant| $ 35))
                                                   (QREFELT $ 108)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |r|
                                        (|NSMP;localGcd| |r|
                                         (SPADCALL |up| (QREFELT $ 14)) $))
                                  (EXIT
                                   (LETT |up| (SPADCALL |up| (QREFELT $ 24)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |r|))))))) 

(SDEFUN |NSMP;primitivePart!;2$;44| ((|p| $) ($ $))
        (SPROG ((|cp| (R)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 34)) |p|)
                      ((QEQCAR |p| 0) (|spadConstant| $ 35))
                      ('T
                       (SEQ (LETT |cp| (SPADCALL |p| (QREFELT $ 114)))
                            (PROGN
                             (RPLACD #1=(QCDR |p|)
                                     (SPADCALL
                                      (SPADCALL
                                       (CONS #'|NSMP;primitivePart!;2$;44!0|
                                             (VECTOR $ |cp|))
                                       (QCDR (QCDR |p|)) (QREFELT $ 51))
                                      (QREFELT $ 117)))
                             (QCDR #1#))
                            (EXIT |p|))))))) 

(SDEFUN |NSMP;primitivePart!;2$;44!0| ((|a1| NIL) ($$ NIL))
        (PROG (|cp| $)
          (LETT |cp| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |cp| (QREFELT $ 111)))))) 

(DECLAIM (NOTINLINE |NewSparseMultivariatePolynomial;|)) 

(DEFUN |NewSparseMultivariatePolynomial| (&REST #1=#:G728)
  (SPROG NIL
         (PROG (#2=#:G729)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NewSparseMultivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |NewSparseMultivariatePolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NewSparseMultivariatePolynomial|)))))))))) 

(DEFUN |NewSparseMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G727 NIL) (|pv$| NIL) (#2=#:G718 NIL) (#3=#:G719 NIL) (#4=#:G720 NIL)
    (#5=#:G721 NIL) (#6=#:G722 NIL) (#7=#:G723 NIL) (#8=#:G724 NIL)
    (#9=#:G725 NIL) (#10=#:G726 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|NewSparseMultivariatePolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 166))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (LETT #9#
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|Symbol|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #9#)
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #8# #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #8# #10# #7#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #7#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #8# #10# #7#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #8#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10# #7#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         #4#)
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         #3#)
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #9#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Integer|)))
                                         #9#)))))
    (|haddProp| |$ConstructorCache| '|NewSparseMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 8796093022208))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 17592186044416))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #10#
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR #2# (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 9007199254740992))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|NewSparseUnivariatePolynomial| $))
    (QSETREFV $ 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT $ 8))))
    (QSETREFV $ 10 (|Union| |#1| (QREFELT $ 9)))
    (COND
     ((|testBitVector| |pv$| 25)
      (PROGN
       (QSETREFV $ 83 (|PseudoRemainderSequence| $ (QREFELT $ 8)))
       (QSETREFV $ 86
                 (CONS (|dispatchFunction| |NSMP;LazardQuotient;2$Nni$;27|) $))
       (QSETREFV $ 87
                 (CONS (|dispatchFunction| |NSMP;LazardQuotient2;3$Nni$;28|)
                       $))
       (QSETREFV $ 89
                 (CONS (|dispatchFunction| |NSMP;next_subResultant2;5$;29|) $))
       (QSETREFV $ 92
                 (CONS (|dispatchFunction| |NSMP;subResultantGcd;3$;30|) $))
       (QSETREFV $ 95
                 (CONS
                  (|dispatchFunction|
                   |NSMP;halfExtendedSubResultantGcd1;2$R;31|)
                  $))
       (QSETREFV $ 98
                 (CONS
                  (|dispatchFunction|
                   |NSMP;halfExtendedSubResultantGcd2;2$R;32|)
                  $))
       (QSETREFV $ 101
                 (CONS
                  (|dispatchFunction| |NSMP;extendedSubResultantGcd;2$R;33|)
                  $))
       (QSETREFV $ 103 (CONS (|dispatchFunction| |NSMP;resultant;3$;34|) $))
       (QSETREFV $ 105
                 (CONS (|dispatchFunction| |NSMP;subResultantChain;2$L;35|) $))
       (QSETREFV $ 107
                 (CONS (|dispatchFunction| |NSMP;lastSubResultant;3$;36|) $))
       (COND
        ((|HasCategory| |#1| '(|EuclideanDomain|))
         (PROGN
          (QSETREFV $ 110
                    (CONS (|dispatchFunction| |NSMP;exactQuotient;$R$;37|) $))
          (QSETREFV $ 111
                    (CONS (|dispatchFunction| |NSMP;exactQuotient!;$R$;38|)
                          $))))
        ('T
         (PROGN
          (QSETREFV $ 110
                    (CONS (|dispatchFunction| |NSMP;exactQuotient;$R$;39|) $))
          (QSETREFV $ 111
                    (CONS (|dispatchFunction| |NSMP;exactQuotient!;$R$;40|)
                          $))))))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV $ 115 (CONS (|dispatchFunction| |NSMP;gcd;R$R;42|) $))
       (QSETREFV $ 114 (CONS (|dispatchFunction| |NSMP;content;$R;43|) $))
       (QSETREFV $ 118
                 (CONS (|dispatchFunction| |NSMP;primitivePart!;2$;44|) $)))))
    $))) 

(MAKEPROP '|NewSparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) 'D '|VPoly| '|Rep|
              (|NonNegativeInteger|) (0 . |degree|) (5 . |Zero|)
              (9 . |leadingCoefficient|) |NSMP;coerce;$Smp;2|
              |NSMP;coerce;Smp$;3| (|Union| 5 '"failed")
              |NSMP;retractIfCan;$U;4| |NSMP;mvar;$VarSet;5| |NSMP;mdeg;$Nni;6|
              |NSMP;init;2$;7| (14 . |leadingMonomial|) |NSMP;head;2$;8|
              (19 . |reductum|) (|Boolean|) (24 . |ground?|) (29 . |ground|)
              |NSMP;tail;2$;9| (|List| $) |NSMP;iteratedInitials;$L;10|
              (|List| $$) (34 . |cons|) |NSMP;deepestInitial;2$;12|
              (40 . |zero?|) (45 . |One|) (49 . |monomial|)
              |NSMP;mainMonomial;2$;13| (56 . |minimumDegree|)
              |NSMP;leastMonomial;2$;14| (61 . |coefficients|)
              |NSMP;mainCoefficients;$L;15| (66 . =) (72 . |degree|)
              (78 . |coefficient|) |NSMP;leadingCoefficient;$VarSet$;16|
              (85 . <) (91 . >) (|NewSparseUnivariatePolynomial| $$)
              (|Mapping| $$ $$)
              (|NewSparseUnivariatePolynomialFunctions2| $$ $$) (97 . |map|)
              (103 . |monicModulo|) (109 . |ground?|) (114 . |One|) (118 . =)
              (124 . |ground|) (|Union| $ '"failed") (129 . |recip|) (134 . *)
              (140 . *) |NSMP;monicModulo;3$;18| (146 . ^)
              (152 . |pseudoRemainder|) (158 . -) |NSMP;prem;3$;19|
              (|Record| (|:| |coef| $) (|:| |gap| 11) (|:| |quotient| $)
                        (|:| |remainder| $))
              |NSMP;lazyPseudoDivide;2$R;24| |NSMP;pquo;3$;20|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |NSMP;pseudoDivide;2$R;21| (164 . |lazyPseudoRemainder|)
              |NSMP;lazyPrem;3$;22| (170 . |lazyPseudoQuotient|) (176 . +)
              |NSMP;lazyPquo;3$;23|
              (|Record| (|:| |coef| $$) (|:| |gap| 11) (|:| |quotient| $)
                        (|:| |remainder| $))
              (182 . |lazyPseudoDivide|) (188 . |Zero|)
              (|Record| (|:| |polnum| $) (|:| |polden| $$) (|:| |power| 11))
              (192 . |lazyResidueClass|)
              (|Record| (|:| |polnum| $) (|:| |polden| $) (|:| |power| 11))
              |NSMP;lazyResidueClass;2$R;25| '|packD| (198 . |exquo|)
              (204 . |LazardQuotient|) (211 . |LazardQuotient|)
              (218 . |LazardQuotient2|) (226 . |next_sousResultant2|)
              (234 . |next_subResultant2|) (242 . ~=) (248 . |subResultantGcd|)
              (254 . |subResultantGcd|)
              (|Record| (|:| |gcd| $) (|:| |coef1| $))
              (260 . |halfExtendedSubResultantGcd1|)
              (266 . |halfExtendedSubResultantGcd1|)
              (|Record| (|:| |gcd| $) (|:| |coef2| $))
              (272 . |halfExtendedSubResultantGcd2|)
              (278 . |halfExtendedSubResultantGcd2|)
              (|Record| (|:| |gcd| $) (|:| |coef1| $) (|:| |coef2| $))
              (284 . |extendedSubResultantGcd|)
              (290 . |extendedSubResultantGcd|) (296 . |resultant|)
              (302 . |resultant|) (308 . |subResultantsChain|)
              (314 . |subResultantChain|) (320 . |lastSubResultant|)
              (326 . |lastSubResultant|) (332 . =) (338 . |quo|)
              (344 . |exactQuotient|) (350 . |exactQuotient!|) (356 . |exquo|)
              (362 . |gcd|) (368 . |content|) (373 . |gcd|) (379 . |zero?|)
              (384 . |unitCanonical|) (389 . |primitivePart!|)
              (|Union| 127 '#1="failed") (|Matrix| $) (|Polynomial| 134)
              (|Polynomial| 132) (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 132)
              (|Record| (|:| |mat| 128) (|:| |vec| (|Vector| 132)))
              (|Vector| $) (|Matrix| 132) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 132 $) (|String|) (|Integer|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 132)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $) (|Factored| 136)
              (|Union| 140 '#1#) (|List| 136) (|Union| 134 '#2="failed")
              (|Union| 132 '#2#) (|List| 7) (|List| 11) (|Matrix| 6)
              (|Record| (|:| |mat| 145) (|:| |vec| (|Vector| 6)))
              (|IndexedExponents| 7) (|Union| 7 '#2#) (|Equation| $)
              (|List| 149) (|Union| 29 '#3="failed")
              (|Record| (|:| |var| 7) (|:| |exponent| 11)) (|Union| 152 '#3#)
              (|Polynomial| 6)
              (|Record| (|:| |coef| $) (|:| |gap| 11) (|:| |remainder| $))
              (|Union| 25 '"failed") (|SparseUnivariatePolynomial| 6)
              (|List| 6) (|Mapping| 147 147) (|Union| 6 '#2#) (|Mapping| 6 6)
              (|PositiveInteger|) (|HashState|) (|OutputForm|)
              (|SingleInteger|))
           '#(|zero?| 394 |tail| 399 |subResultantGcd| 404 |subResultantChain|
              410 |retractIfCan| 416 |resultant| 421 |pseudoDivide| 427
              |primitivePart!| 433 |prem| 438 |pquo| 444 |next_subResultant2|
              450 |mvar| 458 |monomial| 463 |monicModulo| 470 |mdeg| 476
              |mainMonomial| 481 |mainCoefficients| 486 |leastMonomial| 491
              |leadingCoefficient| 496 |lazyResidueClass| 502
              |lazyPseudoDivide| 508 |lazyPrem| 514 |lazyPquo| 520
              |lastSubResultant| 526 |iteratedInitials| 532 |init| 537 |head|
              542 |halfExtendedSubResultantGcd2| 547
              |halfExtendedSubResultantGcd1| 553 |ground?| 559 |ground| 564
              |gcd| 569 |extendedSubResultantGcd| 575 |exquo| 581
              |exactQuotient!| 587 |exactQuotient| 593 |degree| 599
              |deepestInitial| 605 |content| 610 |coerce| 615 |coefficient| 625
              ^ 632 |Zero| 638 |One| 642 |LazardQuotient2| 646 |LazardQuotient|
              654 = 661 - 667 + 673 * 679)
           'NIL
           (CONS
            (|makeByteWordVec2| 41
                                '(0 0 0 10 0 10 0 15 27 4 26 14 1 2 3 24 4 9 28
                                  16 4 29 12 29 0 1 24 28 0 0 1 4 0 0 0 0 1 1
                                  29 11 41 12 12 0 0 40 12 0 0 8 31 33 0 0 28
                                  12 0 0 0 0 0 0 0 0 4 5 6 7 28 13 35 37 17 12
                                  12 19 18 18))
            (CONS
             '#(|RecursivePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitOver&| NIL NIL |Algebra&| NIL NIL
                |Algebra&| NIL NIL |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&|
                |Module&| |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL
                NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |Magma&| |AbelianSemiGroup&| NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| NIL |Evalable&|
                |RetractableTo&| NIL NIL |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| |BasicType&| NIL NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL NIL NIL |InnerEvalable&|
                |RetractableTo&| NIL NIL NIL)
             (CONS
              '#((|RecursivePolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|FullyLinearlyExplicitOver| 6)
                 (|CommutativeRing|) (|LeftOreRing|) (|Algebra| 134)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 132)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 7)
                 (|Ring|) (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 134)
                 (|Module| 6) (|Module| $$) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 134 134) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 134) (|RightModule| 134) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 132) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|CommutativeStar|) (|Evalable| $$)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 7))
                 (|CoercibleTo| (|SparseMultivariatePolynomial| 6 7))
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 7 $$)
                 (|InnerEvalable| 7 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 164) (|unitsKnown|) (|RetractableTo| 134)
                 (|RetractableTo| 132) (|canonicalUnitNormal|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|ConvertibleTo| 124)
                 (|ConvertibleTo| 125) (|ConvertibleTo| 123)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 7)
                 (|ConvertibleTo| 131) (|ConvertibleTo| (|Polynomial| 6))
                 (|CoercibleTo| (|Polynomial| 6)))
              (|makeByteWordVec2| 118
                                  '(1 8 11 0 12 0 0 0 13 1 8 2 0 14 1 8 0 0 22
                                    1 8 0 0 24 1 8 25 0 26 1 8 2 0 27 2 31 0 2
                                    0 32 1 0 25 0 34 0 0 0 35 3 0 0 0 7 11 36 1
                                    8 11 0 38 1 8 31 0 40 2 7 25 0 0 42 2 0 11
                                    0 7 43 3 0 0 0 7 11 44 2 7 25 0 0 46 2 7 25
                                    0 0 47 2 50 48 49 48 51 2 8 0 0 0 52 1 0 25
                                    0 53 0 6 0 54 2 0 25 0 0 55 1 0 6 0 56 1 6
                                    57 0 58 2 0 0 6 0 59 2 0 0 0 0 60 2 0 0 0
                                    11 62 2 8 0 0 0 63 2 0 0 0 0 64 2 8 0 0 0
                                    71 2 8 0 0 0 73 2 0 0 0 0 74 2 8 76 0 0 77
                                    0 6 0 78 2 8 79 0 0 80 2 0 57 0 0 84 3 83 2
                                    2 2 11 85 3 0 0 0 0 11 86 4 0 0 0 0 0 11 87
                                    4 83 8 8 8 8 2 88 4 0 0 0 0 0 0 89 2 7 25 0
                                    0 90 2 8 0 0 0 91 2 0 0 0 0 92 2 8 93 0 0
                                    94 2 0 93 0 0 95 2 8 96 0 0 97 2 0 96 0 0
                                    98 2 8 99 0 0 100 2 0 99 0 0 101 2 8 2 0 0
                                    102 2 0 0 0 0 103 2 8 29 0 0 104 2 0 29 0 0
                                    105 2 8 0 0 0 106 2 0 0 0 0 107 2 6 25 0 0
                                    108 2 6 0 0 0 109 2 0 0 0 6 110 2 0 0 0 6
                                    111 2 6 57 0 0 112 2 6 0 0 0 113 1 0 6 0
                                    114 2 0 6 6 0 115 1 8 25 0 116 1 8 0 0 117
                                    1 0 0 0 118 1 52 25 0 34 1 0 0 0 28 2 25 0
                                    0 0 92 2 25 29 0 0 105 1 0 17 0 18 2 25 0 0
                                    0 103 2 0 69 0 0 70 1 14 0 0 118 2 0 0 0 0
                                    65 2 0 0 0 0 68 4 25 0 0 0 0 0 89 1 0 7 0
                                    19 3 0 0 0 7 11 36 2 0 0 0 0 61 1 0 11 0 20
                                    1 0 0 0 37 1 0 29 0 41 1 0 0 0 39 2 0 0 0 7
                                    45 2 0 81 0 0 82 2 0 66 0 0 67 2 0 0 0 0 72
                                    2 0 0 0 0 75 2 25 0 0 0 107 1 0 29 0 30 1 0
                                    0 0 21 1 0 0 0 23 2 25 96 0 0 98 2 25 93 0
                                    0 95 1 0 25 0 53 1 0 6 0 56 2 14 6 6 0 115
                                    2 25 99 0 0 101 2 47 57 0 0 84 2 25 0 0 6
                                    111 2 25 0 0 6 110 2 0 11 0 7 43 1 0 0 0 33
                                    1 14 6 0 114 1 0 0 5 16 1 0 5 0 15 3 0 0 0
                                    7 11 44 2 50 0 0 11 62 0 52 0 13 0 50 0 35
                                    4 25 0 0 0 0 11 87 3 25 0 0 0 11 86 2 0 25
                                    0 0 55 2 54 0 0 0 64 2 0 0 0 0 74 2 0 0 6 0
                                    59 2 0 0 0 0 60)))))
           '|lookupIncomplete|)) 
