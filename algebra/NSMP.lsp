
(SDEFUN |NSMP;PSimp| ((|up| (D)) (|mv| (|VarSet|)) (% (%)))
        (COND
         ((EQL (SPADCALL |up| (QREFELT % 12)) 0)
          (SPADCALL |up| (QREFELT % 14)))
         ('T (CONS 1 (CONS |mv| |up|))))) 

(PUT '|NSMP;coerce;%Smp;2| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSMP;coerce;%Smp;2|
        ((|p| (%)) (% (|SparseMultivariatePolynomial| R |VarSet|))) |p|) 

(PUT '|NSMP;coerce;Smp%;3| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSMP;coerce;Smp%;3|
        ((|p| (|SparseMultivariatePolynomial| R |VarSet|)) (% (%))) |p|) 

(PUT '|NSMP;retractIfCan;%U;4| '|SPADreplace| '(XLAM (|p|) (CONS 0 |p|))) 

(SDEFUN |NSMP;retractIfCan;%U;4|
        ((|p| (%))
         (% (|Union| (|SparseMultivariatePolynomial| R |VarSet|) "failed")))
        (CONS 0 |p|)) 

(SDEFUN |NSMP;mvar;%VarSet;5| ((|p| (%)) (% (|VarSet|)))
        (COND
         ((QEQCAR |p| 0)
          (|error| "Error in mvar from NSMP : #1 has no variables."))
         ('T (QCAR (QCDR |p|))))) 

(SDEFUN |NSMP;mdeg;%Nni;6| ((|p| (%)) (% (|NonNegativeInteger|)))
        (COND ((QEQCAR |p| 0) 0)
              ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 12))))) 

(SDEFUN |NSMP;init;2%;7| ((|p| (%)) (% (%)))
        (COND
         ((QEQCAR |p| 0)
          (|error| "Error in init from NSMP : #1 has no variables."))
         ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 14))))) 

(SDEFUN |NSMP;head;2%;8| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))))))) 

(SDEFUN |NSMP;tail;2%;9| ((|p| (%)) (% (%)))
        (SPROG ((|red| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 13))
                      (#1='T
                       (SEQ
                        (LETT |red|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24)))
                        (EXIT
                         (COND
                          ((SPADCALL |red| (QREFELT % 26))
                           (SPADCALL |red| (QREFELT % 27)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |red|))))))))))) 

(SDEFUN |NSMP;iteratedInitials;%L;10| ((|p| (%)) (% (|List| %)))
        (SEQ
         (COND ((QEQCAR |p| 0) NIL)
               ('T
                (SEQ (LETT |p| (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 14)))
                     (EXIT
                      (SPADCALL |p| (SPADCALL |p| (QREFELT % 30))
                                (QREFELT % 32)))))))) 

(SDEFUN |NSMP;localDeepestInitial| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (|NSMP;localDeepestInitial|
                (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 14)) %)))) 

(SDEFUN |NSMP;deepestInitial;2%;12| ((|p| (%)) (% (%)))
        (COND
         ((QEQCAR |p| 0)
          (|error| "Error in deepestInitial from NSMP : #1 has no variables."))
         ('T
          (|NSMP;localDeepestInitial|
           (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 14)) %)))) 

(SDEFUN |NSMP;mainMonomial;2%;13| ((|p| (%)) (% (%)))
        (COND
         ((SPADCALL |p| (QREFELT % 34))
          (|error| "Error in mainMonomial from NSMP : the argument is zero"))
         ((QEQCAR |p| 0) (|spadConstant| % 35))
         ('T
          (SPADCALL (|spadConstant| % 35) (QCAR (QCDR |p|))
                    (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 12))
                    (QREFELT % 36))))) 

(SDEFUN |NSMP;leastMonomial;2%;14| ((|p| (%)) (% (%)))
        (COND
         ((SPADCALL |p| (QREFELT % 34))
          (|error| "Error in leastMonomial from NSMP : the argument is zero"))
         ((QEQCAR |p| 0) (|spadConstant| % 35))
         ('T
          (SPADCALL (|spadConstant| % 35) (QCAR (QCDR |p|))
                    (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 38))
                    (QREFELT % 36))))) 

(SDEFUN |NSMP;mainCoefficients;%L;15| ((|p| (%)) (% (|List| %)))
        (COND
         ((SPADCALL |p| (QREFELT % 34))
          (|error|
           "Error in mainCoefficients from NSMP : the argument is zero"))
         ((QEQCAR |p| 0) (LIST |p|))
         ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))))) 

(SDEFUN |NSMP;leadingCoefficient;%VarSet%;16|
        ((|p| (%)) (|x| (|VarSet|)) (% (%)))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND ((QEQCAR |p| 0) |p|)
                     ((SPADCALL (QCAR (QCDR |p|)) |x| (QREFELT % 42))
                      (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 14)))
                     ((ZEROP (LETT |d| (SPADCALL |p| |x| (QREFELT % 43)))) |p|)
                     ('T (SPADCALL |p| |x| |d| (QREFELT % 44)))))) 

(SDEFUN |NSMP;localMonicModulo| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((|mM| (%)) (|m| (D)))
               (SEQ
                (COND
                 ((OR (QEQCAR |a| 0)
                      (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                                (QREFELT % 46)))
                  |a|)
                 ('T
                  (SEQ
                   (COND
                    ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                               (QREFELT % 47))
                     (LETT |m|
                           (SPADCALL
                            (CONS #'|NSMP;localMonicModulo!0| (VECTOR % |b|))
                            (QCDR (QCDR |a|)) (QREFELT % 51))))
                    (#1='T
                     (LETT |m|
                           (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                     (QREFELT % 52)))))
                   (COND
                    ((SPADCALL |m| (QREFELT % 26))
                     (LETT |mM| (SPADCALL |m| (QREFELT % 27))))
                    (#1# (LETT |mM| (CONS 1 (CONS (QCAR (QCDR |a|)) |m|)))))
                   (EXIT |mM|))))))) 

(SDEFUN |NSMP;localMonicModulo!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| %)
          (LETT |b| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|NSMP;localMonicModulo| |a1| |b| %))))) 

(SDEFUN |NSMP;monicModulo;3%;18| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((|mM| (%)) (|rec| (|Union| R "failed")) (|r| (R)) (|ib| (%)))
               (SEQ
                (COND
                 ((QEQCAR |b| 0)
                  (|error| "Error in monicModulo from NSMP : #2 is constant"))
                 (#1='T
                  (SEQ (LETT |ib| (SPADCALL |b| (QREFELT % 21)))
                       (COND
                        ((NULL (SPADCALL |ib| (QREFELT % 53)))
                         (EXIT
                          (|error|
                           "Error in monicModulo from NSMP : #2 is not monic"))))
                       (COND
                        ((SPADCALL |ib| (|spadConstant| % 35) (QREFELT % 55))
                         (LETT |mM| (|NSMP;localMonicModulo| |a| |b| %)))
                        (#1#
                         (SEQ (LETT |r| (SPADCALL |ib| (QREFELT % 56)))
                              (LETT |rec| (SPADCALL |r| (QREFELT % 58)))
                              (EXIT
                               (COND
                                ((QEQCAR |rec| 1)
                                 (|error|
                                  "Error in monicModulo from NSMP : #2 is not monic"))
                                ((QEQCAR |a| 0) |a|)
                                (#1#
                                 (SEQ
                                  (LETT |a|
                                        (SPADCALL (CONS 0 (QCDR |rec|)) |a|
                                                  (QREFELT % 59)))
                                  (LETT |b|
                                        (SPADCALL (CONS 0 (QCDR |rec|)) |b|
                                                  (QREFELT % 59)))
                                  (EXIT
                                   (LETT |mM|
                                         (SPADCALL |ib|
                                                   (|NSMP;localMonicModulo| |a|
                                                    |b| %)
                                                   (QREFELT % 59)))))))))))
                       (EXIT |mM|))))))) 

(SDEFUN |NSMP;prem;3%;19| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((#1=#:G139 NIL) (|test| (|Integer|)) (|delta| (|Integer|))
          (|term| (%)) (#2=#:G132 NIL) (#3=#:G143 NIL) (|r| (D))
          (#4=#:G118 NIL) (|lcb| (%)) (|db| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND ((QEQCAR |b| 0) (|error| "in prem$NSMP: ground? #2"))
                 (#5='T
                  (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 12)))
                       (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 14)))
                       (LETT |test|
                             (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT % 43))
                                |db|))
                       (LETT |delta| (MAX (+ |test| 1) 0))
                       (COND
                        ((OR (QEQCAR |a| 0)
                             (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                                       (QREFELT % 46)))
                         (EXIT
                          (SPADCALL
                           (SPADCALL |lcb|
                                     (PROG1 (LETT #4# |delta|)
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                     (QREFELT % 61))
                           |a| (QREFELT % 59)))))
                       (EXIT
                        (COND
                         ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                                    (QREFELT % 42))
                          (SEQ
                           (LETT |r|
                                 (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                           (QREFELT % 62)))
                           (EXIT
                            (COND
                             ((SPADCALL |r| (QREFELT % 26))
                              (PROGN
                               (LETT #3# (SPADCALL |r| (QREFELT % 27)))
                               (GO #6=#:G142)))
                             (#5# (CONS 1 (CONS (QCAR (QCDR |a|)) |r|)))))))
                         (#5#
                          (SEQ
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND ((SPADCALL |a| (QREFELT % 34)) NIL)
                                         ('T (NULL (MINUSP |test|)))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |term|
                                       (SPADCALL
                                        (SPADCALL |a| (QCAR (QCDR |b|))
                                                  (QREFELT % 45))
                                        (QCAR (QCDR |b|))
                                        (PROG1 (LETT #2# |test|)
                                          (|check_subtype2| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                        (QREFELT % 36)))
                                 (LETT |a|
                                       (SPADCALL
                                        (SPADCALL |lcb| |a| (QREFELT % 59))
                                        (SPADCALL |term| |b| (QREFELT % 59))
                                        (QREFELT % 63)))
                                 (LETT |delta| (- |delta| 1))
                                 (EXIT
                                  (LETT |test|
                                        (-
                                         (SPADCALL |a| (QCAR (QCDR |b|))
                                                   (QREFELT % 43))
                                         |db|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL
                             (SPADCALL |lcb|
                                       (PROG1 (LETT #1# |delta|)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                       (QREFELT % 61))
                             |a| (QREFELT % 59)))))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |NSMP;pquo;3%;20| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((|c| (%))
          (|cPS|
           (|Record| (|:| |coef| %) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| %) (|:| |remainder| %))))
         (SEQ (LETT |cPS| (SPADCALL |a| |b| (QREFELT % 66)))
              (LETT |c|
                    (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT % 61)))
              (EXIT (SPADCALL |c| (QVELT |cPS| 2) (QREFELT % 59)))))) 

(SDEFUN |NSMP;pseudoDivide;2%R;21|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG
         ((|c| (%))
          (|cPS|
           (|Record| (|:| |coef| %) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| %) (|:| |remainder| %))))
         (SEQ (LETT |cPS| (SPADCALL |a| |b| (QREFELT % 66)))
              (LETT |c|
                    (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT % 61)))
              (EXIT
               (CONS (SPADCALL |c| (QVELT |cPS| 2) (QREFELT % 59))
                     (SPADCALL |c| (QVELT |cPS| 3) (QREFELT % 59))))))) 

(SDEFUN |NSMP;lazyPrem;3%;22| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((|test| (|Integer|)) (|term| (%)) (#1=#:G159 NIL) (|lcb| (%))
          (|db| (|NonNegativeInteger|)))
         (SEQ
          (COND ((QEQCAR |b| 0) (|error| "in lazyPrem$NSMP: ground? #2"))
                ((OR (QEQCAR |a| 0)
                     (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                               (QREFELT % 46)))
                 |a|)
                ('T
                 (COND
                  ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                             (QREFELT % 42))
                   (|NSMP;PSimp|
                    (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                              (QREFELT % 70))
                    (QCAR (QCDR |a|)) %))
                  ('T
                   (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 12)))
                        (LETT |lcb|
                              (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 14)))
                        (LETT |test|
                              (-
                               (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT % 43))
                               |db|))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((SPADCALL |a| (QREFELT % 34)) NIL)
                                      ('T (NULL (MINUSP |test|)))))
                               (GO G191)))
                             (SEQ
                              (LETT |term|
                                    (SPADCALL
                                     (SPADCALL |a| (QCAR (QCDR |b|))
                                               (QREFELT % 45))
                                     (QCAR (QCDR |b|))
                                     (PROG1 (LETT #1# |test|)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT % 36)))
                              (LETT |a|
                                    (SPADCALL
                                     (SPADCALL |lcb| |a| (QREFELT % 59))
                                     (SPADCALL |term| |b| (QREFELT % 59))
                                     (QREFELT % 63)))
                              (EXIT
                               (LETT |test|
                                     (-
                                      (SPADCALL |a| (QCAR (QCDR |b|))
                                                (QREFELT % 43))
                                      |db|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |a|))))))))) 

(SDEFUN |NSMP;lazyPquo;3%;23| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((|test| (|Integer|)) (|q| (%)) (|term| (%)) (#1=#:G172 NIL)
          (|lcb| (%)) (|db| (|NonNegativeInteger|)))
         (SEQ
          (COND ((QEQCAR |b| 0) (|error| "in lazyPquo$NSMP: #2 is constant"))
                ((OR (QEQCAR |a| 0)
                     (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                               (QREFELT % 46)))
                 (|spadConstant| % 13))
                ('T
                 (COND
                  ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                             (QREFELT % 42))
                   (|NSMP;PSimp|
                    (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                              (QREFELT % 72))
                    (QCAR (QCDR |a|)) %))
                  ('T
                   (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 12)))
                        (LETT |lcb|
                              (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 14)))
                        (LETT |test|
                              (-
                               (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT % 43))
                               |db|))
                        (LETT |q| (|spadConstant| % 13))
                        (LETT |test|
                              (-
                               (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT % 43))
                               |db|))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((SPADCALL |a| (QREFELT % 34)) NIL)
                                      ('T (NULL (MINUSP |test|)))))
                               (GO G191)))
                             (SEQ
                              (LETT |term|
                                    (SPADCALL
                                     (SPADCALL |a| (QCAR (QCDR |b|))
                                               (QREFELT % 45))
                                     (QCAR (QCDR |b|))
                                     (PROG1 (LETT #1# |test|)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT % 36)))
                              (LETT |a|
                                    (SPADCALL
                                     (SPADCALL |lcb| |a| (QREFELT % 59))
                                     (SPADCALL |term| |b| (QREFELT % 59))
                                     (QREFELT % 63)))
                              (LETT |q|
                                    (SPADCALL
                                     (SPADCALL |lcb| |q| (QREFELT % 59)) |term|
                                     (QREFELT % 73)))
                              (EXIT
                               (LETT |test|
                                     (-
                                      (SPADCALL |a| (QCAR (QCDR |b|))
                                                (QREFELT % 43))
                                      |db|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |q|))))))))) 

(SDEFUN |NSMP;lazyPseudoDivide;2%R;24|
        ((|a| (%)) (|b| (%))
         (%
          (|Record| (|:| |coef| %) (|:| |gap| (|NonNegativeInteger|))
                    (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG
         ((#1=#:G192 NIL) (|test| (|Integer|)) (|delta| (|Integer|)) (|q| (%))
          (|term| (%)) (#2=#:G188 NIL) (|lcb| (%))
          (|db| (|NonNegativeInteger|))
          (|cgqr|
           (|Record| (|:| |coef| %) (|:| |gap| (|NonNegativeInteger|))
                     (|:| |quotient| D) (|:| |remainder| D))))
         (SEQ
          (COND
           ((QEQCAR |b| 0)
            (|error| "in lazyPseudoDivide$NSMP: #2 is constant"))
           ((OR (QEQCAR |a| 0)
                (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT % 46)))
            (VECTOR (|spadConstant| % 35) 0 (|spadConstant| % 13) |a|))
           ('T
            (COND
             ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT % 42))
              (SEQ
               (LETT |cgqr|
                     (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                               (QREFELT % 76)))
               (EXIT
                (VECTOR (QVELT |cgqr| 0) (QVELT |cgqr| 1)
                        (|NSMP;PSimp| (QVELT |cgqr| 2) (QCAR (QCDR |a|)) %)
                        (|NSMP;PSimp| (QVELT |cgqr| 3) (QCAR (QCDR |a|)) %)))))
             ('T
              (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 12)))
                   (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 14)))
                   (LETT |test|
                         (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT % 43))
                            |db|))
                   (LETT |q| (|spadConstant| % 13))
                   (LETT |delta| (MAX (+ |test| 1) 0))
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((SPADCALL |a| (QREFELT % 34)) NIL)
                                 ('T (NULL (MINUSP |test|)))))
                          (GO G191)))
                        (SEQ
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT % 45))
                                (QCAR (QCDR |b|))
                                (PROG1 (LETT #2# |test|)
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#))
                                (QREFELT % 36)))
                         (LETT |a|
                               (SPADCALL (SPADCALL |lcb| |a| (QREFELT % 59))
                                         (SPADCALL |term| |b| (QREFELT % 59))
                                         (QREFELT % 63)))
                         (LETT |q|
                               (SPADCALL (SPADCALL |lcb| |q| (QREFELT % 59))
                                         |term| (QREFELT % 73)))
                         (LETT |delta| (- |delta| 1))
                         (EXIT
                          (LETT |test|
                                (-
                                 (SPADCALL |a| (QCAR (QCDR |b|))
                                           (QREFELT % 43))
                                 |db|))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (VECTOR |lcb|
                            (PROG1 (LETT #1# |delta|)
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            |q| |a|)))))))))) 

(SDEFUN |NSMP;lazyResidueClass;2%R;25|
        ((|a| (%)) (|b| (%))
         (%
          (|Record| (|:| |polnum| %) (|:| |polden| %)
                    (|:| |power| (|NonNegativeInteger|)))))
        (SPROG
         ((|test| (|Integer|)) (|pow| (|NonNegativeInteger|)) (|term| (%))
          (#1=#:G206 NIL) (|db| (|NonNegativeInteger|))
          (|lrc|
           (|Record| (|:| |polnum| D) (|:| |polden| %)
                     (|:| |power| (|NonNegativeInteger|))))
          (|lcb| (%)))
         (SEQ
          (COND
           ((QEQCAR |b| 0)
            (|error| "in lazyResidueClass$NSMP: #2 is constant"))
           (#2='T
            (SEQ (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 14)))
                 (COND
                  ((OR (QEQCAR |a| 0)
                       (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                                 (QREFELT % 46)))
                   (EXIT (VECTOR |a| |lcb| 0))))
                 (EXIT
                  (COND
                   ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                              (QREFELT % 42))
                    (SEQ
                     (LETT |lrc|
                           (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                     (QREFELT % 79)))
                     (EXIT
                      (VECTOR
                       (|NSMP;PSimp| (QVELT |lrc| 0) (QCAR (QCDR |a|)) %)
                       (QVELT |lrc| 1) (QVELT |lrc| 2)))))
                   (#2#
                    (SEQ
                     (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT % 12)))
                     (LETT |test|
                           (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT % 43))
                              |db|))
                     (LETT |pow| 0)
                     (SEQ G190
                          (COND
                           ((NULL
                             (COND ((SPADCALL |a| (QREFELT % 34)) NIL)
                                   ('T (NULL (MINUSP |test|)))))
                            (GO G191)))
                          (SEQ
                           (LETT |term|
                                 (SPADCALL
                                  (SPADCALL |a| (QCAR (QCDR |b|))
                                            (QREFELT % 45))
                                  (QCAR (QCDR |b|))
                                  (PROG1 (LETT #1# |test|)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT % 36)))
                           (LETT |a|
                                 (SPADCALL (SPADCALL |lcb| |a| (QREFELT % 59))
                                           (SPADCALL |term| |b| (QREFELT % 59))
                                           (QREFELT % 63)))
                           (LETT |pow| (+ |pow| 1))
                           (EXIT
                            (LETT |test|
                                  (-
                                   (SPADCALL |a| (QCAR (QCDR |b|))
                                             (QREFELT % 43))
                                   |db|))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (VECTOR |a| |lcb| |pow|)))))))))))) 

(SDEFUN |NSMP;exactQuo| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|ex| (|Union| % "failed")))
               (SEQ (LETT |ex| (SPADCALL |x| |y| (QREFELT % 83)))
                    (EXIT
                     (COND ((QEQCAR |ex| 0) (QCDR |ex|))
                           ('T (|error| "in exactQuotient$NSMP: bad args"))))))) 

(SDEFUN |NSMP;LazardQuotient;2%Nni%;27|
        ((|x| (%)) (|y| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |x| |y| |n| (QREFELT % 84))) 

(SDEFUN |NSMP;LazardQuotient2;3%Nni%;28|
        ((|p| (%)) (|a| (%)) (|b| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|c| (%)) (#1=#:G222 NIL))
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
                                        (QREFELT % 85)))
                        (EXIT
                         (|NSMP;exactQuo| (SPADCALL |c| |p| (QREFELT % 59)) |b|
                          %)))))))) 

(SDEFUN |NSMP;next_subResultant2;5%;29|
        ((|p| (%)) (|q| (%)) (|z| (%)) (|s| (%)) (% (%)))
        (|NSMP;PSimp|
         (SPADCALL (QCDR (QCDR |p|)) (QCDR (QCDR |q|)) (QCDR (QCDR |z|)) |s|
                   (QREFELT % 87))
         (QCAR (QCDR |p|)) %)) 

(SDEFUN |NSMP;subResultantGcd;3%;30| ((|a| (%)) (|b| (%)) (% (%)))
        (COND
         ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
          (|error| "subResultantGcd$NSMP: one arg is constant"))
         ('T
          (COND
           ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT % 89))
            (|error| "subResultantGcd$NSMP: mvar(#1) ~= mvar(#2)"))
           ('T
            (|NSMP;PSimp|
             (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT % 90))
             (QCAR (QCDR |a|)) %)))))) 

(SDEFUN |NSMP;halfExtendedSubResultantGcd1;2%R;31|
        ((|a| (%)) (|b| (%)) (% (|Record| (|:| |gcd| %) (|:| |coef1| %))))
        (SPROG ((|hesrg| (|Record| (|:| |gcd| D) (|:| |coef1| D))))
               (SEQ
                (COND
                 ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
                  (|error|
                   "halfExtendedSubResultantGcd1$NSMP: one arg is constant"))
                 ('T
                  (COND
                   ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                              (QREFELT % 89))
                    (|error|
                     "halfExtendedSubResultantGcd1$NSMP: mvar(#1) ~= mvar(#2)"))
                   ('T
                    (SEQ
                     (LETT |hesrg|
                           (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                     (QREFELT % 93)))
                     (EXIT
                      (CONS (|NSMP;PSimp| (QCAR |hesrg|) (QCAR (QCDR |a|)) %)
                            (|NSMP;PSimp| (QCDR |hesrg|) (QCAR (QCDR |a|))
                             %))))))))))) 

(SDEFUN |NSMP;halfExtendedSubResultantGcd2;2%R;32|
        ((|a| (%)) (|b| (%)) (% (|Record| (|:| |gcd| %) (|:| |coef2| %))))
        (SPROG ((|hesrg| (|Record| (|:| |gcd| D) (|:| |coef2| D))))
               (SEQ
                (COND
                 ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
                  (|error|
                   "halfExtendedSubResultantGcd2$NSMP: one arg is constant"))
                 ('T
                  (COND
                   ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                              (QREFELT % 89))
                    (|error|
                     "halfExtendedSubResultantGcd2$NSMP: mvar(#1) ~= mvar(#2)"))
                   ('T
                    (SEQ
                     (LETT |hesrg|
                           (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                     (QREFELT % 96)))
                     (EXIT
                      (CONS (|NSMP;PSimp| (QCAR |hesrg|) (QCAR (QCDR |a|)) %)
                            (|NSMP;PSimp| (QCDR |hesrg|) (QCAR (QCDR |a|))
                             %))))))))))) 

(SDEFUN |NSMP;extendedSubResultantGcd;2%R;33|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |gcd| %) (|:| |coef1| %) (|:| |coef2| %))))
        (SPROG
         ((|esrg| (|Record| (|:| |gcd| D) (|:| |coef1| D) (|:| |coef2| D))))
         (SEQ
          (COND
           ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
            (|error| "extendedSubResultantGcd$NSMP: one arg is constant"))
           ('T
            (COND
             ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT % 89))
              (|error| "extendedSubResultantGcd$NSMP: mvar(#1) ~= mvar(#2)"))
             ('T
              (SEQ
               (LETT |esrg|
                     (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                               (QREFELT % 99)))
               (EXIT
                (VECTOR (|NSMP;PSimp| (QVELT |esrg| 0) (QCAR (QCDR |a|)) %)
                        (|NSMP;PSimp| (QVELT |esrg| 1) (QCAR (QCDR |a|)) %)
                        (|NSMP;PSimp| (QVELT |esrg| 2) (QCAR (QCDR |a|))
                         %))))))))))) 

(SDEFUN |NSMP;resultant;3%;34| ((|a| (%)) (|b| (%)) (% (%)))
        (COND
         ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
          (|error| "resultant$NSMP: one arg is constant"))
         ('T
          (COND
           ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT % 89))
            (|error| "resultant$NSMP: mvar(#1) ~= mvar(#2)"))
           ('T
            (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT % 101))))))) 

(SDEFUN |NSMP;subResultantChain;2%L;35| ((|a| (%)) (|b| (%)) (% (|List| %)))
        (SPROG ((#1=#:G269 NIL) (|up| NIL) (#2=#:G268 NIL))
               (SEQ
                (COND
                 ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
                  (|error| "subResultantChain$NSMP: one arg is constant"))
                 ('T
                  (COND
                   ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                              (QREFELT % 89))
                    (|error| "subResultantChain$NSMP: mvar(#1) ~= mvar(#2)"))
                   ('T
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |up| NIL)
                          (LETT #1#
                                (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                          (QREFELT % 103)))
                          G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |up| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (|NSMP;PSimp| |up| (QCAR (QCDR |a|)) %)
                                        #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |NSMP;lastSubResultant;3%;36| ((|a| (%)) (|b| (%)) (% (%)))
        (COND
         ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
          (|error| "lastSubResultant$NSMP: one arg is constant"))
         ('T
          (COND
           ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT % 89))
            (|error| "lastSubResultant$NSMP: mvar(#1) ~= mvar(#2)"))
           ('T
            (|NSMP;PSimp|
             (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT % 105))
             (QCAR (QCDR |a|)) %)))))) 

(SDEFUN |NSMP;exactQuotient;%R%;37| ((|a| (%)) (|b| (R)) (% (%)))
        (SPROG NIL
               (COND
                ((SPADCALL |b| (QCDR (|spadConstant| % 35)) (QREFELT % 107))
                 |a|)
                ((QEQCAR |a| 0)
                 (CONS 0 (SPADCALL (QCDR |a|) |b| (QREFELT % 108))))
                ('T
                 (CONS 1
                       (CONS (QCAR (QCDR |a|))
                             (SPADCALL
                              (CONS #'|NSMP;exactQuotient;%R%;37!0|
                                    (VECTOR % |b|))
                              (QCDR (QCDR |a|)) (QREFELT % 51)))))))) 

(SDEFUN |NSMP;exactQuotient;%R%;37!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| %)
          (LETT |b| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT % 109)))))) 

(SDEFUN |NSMP;exactQuotient!;%R%;38| ((|a| (%)) (|b| (R)) (% (%)))
        (SPROG NIL
               (SEQ
                (COND
                 ((SPADCALL |b| (QCDR (|spadConstant| % 35)) (QREFELT % 107))
                  |a|)
                 ((QEQCAR |a| 0)
                  (CONS 0 (SPADCALL (QCDR |a|) |b| (QREFELT % 108))))
                 ('T
                  (SEQ
                   (PROGN
                    (RPLACD #1=(QCDR |a|)
                            (SPADCALL
                             (CONS #'|NSMP;exactQuotient!;%R%;38!0|
                                   (VECTOR % |b|))
                             (QCDR (QCDR |a|)) (QREFELT % 51)))
                    (QCDR #1#))
                   (EXIT |a|))))))) 

(SDEFUN |NSMP;exactQuotient!;%R%;38!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| %)
          (LETT |b| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT % 110)))))) 

(SDEFUN |NSMP;exactQuotient;%R%;39| ((|a| (%)) (|b| (R)) (% (%)))
        (SPROG ((#1=#:G285 NIL))
               (COND
                ((SPADCALL |b| (QCDR (|spadConstant| % 35)) (QREFELT % 107))
                 |a|)
                ((QEQCAR |a| 0)
                 (CONS 0
                       (PROG2
                           (LETT #1# (SPADCALL (QCDR |a|) |b| (QREFELT % 111)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                         (|Union| (QREFELT % 6) "failed")
                                         #1#))))
                ('T
                 (CONS 1
                       (CONS (QCAR (QCDR |a|))
                             (SPADCALL
                              (CONS #'|NSMP;exactQuotient;%R%;39!0|
                                    (VECTOR % |b|))
                              (QCDR (QCDR |a|)) (QREFELT % 51)))))))) 

(SDEFUN |NSMP;exactQuotient;%R%;39!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| %)
          (LETT |b| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT % 109)))))) 

(SDEFUN |NSMP;exactQuotient!;%R%;40| ((|a| (%)) (|b| (R)) (% (%)))
        (SPROG ((#1=#:G294 NIL))
               (SEQ
                (COND
                 ((SPADCALL |b| (QCDR (|spadConstant| % 35)) (QREFELT % 107))
                  |a|)
                 ((QEQCAR |a| 0)
                  (CONS 0
                        (PROG2
                            (LETT #1#
                                  (SPADCALL (QCDR |a|) |b| (QREFELT % 111)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                          (|Union| (QREFELT % 6) "failed")
                                          #1#))))
                 ('T
                  (SEQ
                   (PROGN
                    (RPLACD #2=(QCDR |a|)
                            (SPADCALL
                             (CONS #'|NSMP;exactQuotient!;%R%;40!0|
                                   (VECTOR % |b|))
                             (QCDR (QCDR |a|)) (QREFELT % 51)))
                    (QCDR #2#))
                   (EXIT |a|))))))) 

(SDEFUN |NSMP;exactQuotient!;%R%;40!0| ((|a1| NIL) ($$ NIL))
        (PROG (|b| %)
          (LETT |b| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT % 110)))))) 

(SDEFUN |NSMP;localGcd| ((|r| (R)) (|p| (%)) (% (R)))
        (COND ((QEQCAR |p| 0) (SPADCALL |r| (QCDR |p|) (QREFELT % 112)))
              ('T
               (SPADCALL |r| (SPADCALL |p| (QREFELT % 113)) (QREFELT % 112))))) 

(SDEFUN |NSMP;gcd;R%R;42| ((|r| (R)) (|p| (%)) (% (R)))
        (COND
         ((OR (SPADCALL |r| (QCDR (|spadConstant| % 35)) (QREFELT % 107))
              (SPADCALL |p| (QREFELT % 34)))
          |r|)
         ('T (|NSMP;localGcd| |r| |p| %)))) 

(SDEFUN |NSMP;content;%R;43| ((|p| (%)) (% (R)))
        (SPROG ((|up| (D)) (|r| (R)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ (LETT |up| (QCDR (QCDR |p|)))
                            (LETT |r| (|spadConstant| % 77))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL
                                     (OR (SPADCALL |up| (QREFELT % 115))
                                         (SPADCALL |r|
                                                   (QCDR (|spadConstant| % 35))
                                                   (QREFELT % 107)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |r|
                                        (|NSMP;localGcd| |r|
                                         (SPADCALL |up| (QREFELT % 14)) %))
                                  (EXIT
                                   (LETT |up| (SPADCALL |up| (QREFELT % 24)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |r|))))))) 

(SDEFUN |NSMP;primitivePart!;2%;44| ((|p| (%)) (% (%)))
        (SPROG ((|cp| (R)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT % 34)) |p|)
                      ((QEQCAR |p| 0) (|spadConstant| % 35))
                      ('T
                       (SEQ (LETT |cp| (SPADCALL |p| (QREFELT % 113)))
                            (PROGN
                             (RPLACD #1=(QCDR |p|)
                                     (SPADCALL
                                      (SPADCALL
                                       (CONS #'|NSMP;primitivePart!;2%;44!0|
                                             (VECTOR % |cp|))
                                       (QCDR (QCDR |p|)) (QREFELT % 51))
                                      (QREFELT % 116)))
                             (QCDR #1#))
                            (EXIT |p|))))))) 

(SDEFUN |NSMP;primitivePart!;2%;44!0| ((|a1| NIL) ($$ NIL))
        (PROG (|cp| %)
          (LETT |cp| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a1| |cp| (QREFELT % 110)))))) 

(DECLAIM (NOTINLINE |NewSparseMultivariatePolynomial;|)) 

(DEFUN |NewSparseMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G360 NIL) (|pv$| NIL) (#2=#:G350 NIL) (#3=#:G352 NIL) (#4=#:G351 NIL)
    (#5=#:G353 NIL) (#6=#:G354 NIL) (#7=#:G355 NIL) (#8=#:G356 NIL)
    (#9=#:G357 NIL) (#10=#:G358 NIL) (#11=#:G359 NIL) (% NIL) (|dv$| NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|NewSparseMultivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 169))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                                       '(|CommutativeRing|))
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
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #11#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #11#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| |#2|
                                                            '(|Hashable|)))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|Symbol|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #10#)
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
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
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #11# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #11# #9#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #8#
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #11#
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
                                         #8#)
                                        (LETT #7#
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #11#
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
                                         #7#)
                                        (LETT #6#
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #11#
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
                                         #6#)
                                        (LETT #5#
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
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #11#
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
                                         #5#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #11#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
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
                                         #10#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Integer|)))
                                         #10#)))))
    (|haddProp| |$ConstructorCache| '|NewSparseMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 281474976710656))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 562949953421312))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #11#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #11# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 576460752303423488))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|NewSparseUnivariatePolynomial| %))
    (QSETREFV % 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT % 8))))
    (QSETREFV % 10 (|Union| |#1| (QREFELT % 9)))
    (COND
     ((|testBitVector| |pv$| 25)
      (PROGN
       (QSETREFV % 82 (|PseudoRemainderSequence| % (QREFELT % 8)))
       (QSETREFV % 85
                 (CONS (|dispatchFunction| |NSMP;LazardQuotient;2%Nni%;27|) %))
       (QSETREFV % 86
                 (CONS (|dispatchFunction| |NSMP;LazardQuotient2;3%Nni%;28|)
                       %))
       (QSETREFV % 88
                 (CONS (|dispatchFunction| |NSMP;next_subResultant2;5%;29|) %))
       (QSETREFV % 91
                 (CONS (|dispatchFunction| |NSMP;subResultantGcd;3%;30|) %))
       (QSETREFV % 94
                 (CONS
                  (|dispatchFunction|
                   |NSMP;halfExtendedSubResultantGcd1;2%R;31|)
                  %))
       (QSETREFV % 97
                 (CONS
                  (|dispatchFunction|
                   |NSMP;halfExtendedSubResultantGcd2;2%R;32|)
                  %))
       (QSETREFV % 100
                 (CONS
                  (|dispatchFunction| |NSMP;extendedSubResultantGcd;2%R;33|)
                  %))
       (QSETREFV % 102 (CONS (|dispatchFunction| |NSMP;resultant;3%;34|) %))
       (QSETREFV % 104
                 (CONS (|dispatchFunction| |NSMP;subResultantChain;2%L;35|) %))
       (QSETREFV % 106
                 (CONS (|dispatchFunction| |NSMP;lastSubResultant;3%;36|) %))
       (COND
        ((|HasCategory| |#1| '(|EuclideanDomain|))
         (PROGN
          (QSETREFV % 109
                    (CONS (|dispatchFunction| |NSMP;exactQuotient;%R%;37|) %))
          (QSETREFV % 110
                    (CONS (|dispatchFunction| |NSMP;exactQuotient!;%R%;38|)
                          %))))
        ('T
         (PROGN
          (QSETREFV % 109
                    (CONS (|dispatchFunction| |NSMP;exactQuotient;%R%;39|) %))
          (QSETREFV % 110
                    (CONS (|dispatchFunction| |NSMP;exactQuotient!;%R%;40|)
                          %))))))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV % 114 (CONS (|dispatchFunction| |NSMP;gcd;R%R;42|) %))
       (QSETREFV % 113 (CONS (|dispatchFunction| |NSMP;content;%R;43|) %))
       (QSETREFV % 117
                 (CONS (|dispatchFunction| |NSMP;primitivePart!;2%;44|) %)))))
    %))) 

(DEFUN |NewSparseMultivariatePolynomial| (&REST #1=#:G361)
  (SPROG NIL
         (PROG (#2=#:G362)
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

(MAKEPROP '|NewSparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) 'D '|VPoly| '|Rep|
              (|NonNegativeInteger|) (0 . |degree|) (5 . |Zero|)
              (9 . |leadingCoefficient|) |NSMP;coerce;%Smp;2|
              |NSMP;coerce;Smp%;3| (|Union| 5 '"failed")
              |NSMP;retractIfCan;%U;4| |NSMP;mvar;%VarSet;5| |NSMP;mdeg;%Nni;6|
              |NSMP;init;2%;7| (14 . |leadingMonomial|) |NSMP;head;2%;8|
              (19 . |reductum|) (|Boolean|) (24 . |ground?|) (29 . |ground|)
              |NSMP;tail;2%;9| (|List| %) |NSMP;iteratedInitials;%L;10|
              (|List| $$) (34 . |cons|) |NSMP;deepestInitial;2%;12|
              (40 . |zero?|) (45 . |One|) (49 . |monomial|)
              |NSMP;mainMonomial;2%;13| (56 . |minimumDegree|)
              |NSMP;leastMonomial;2%;14| (61 . |coefficients|)
              |NSMP;mainCoefficients;%L;15| (66 . =) (72 . |degree|)
              (78 . |coefficient|) |NSMP;leadingCoefficient;%VarSet%;16|
              (85 . <) (91 . >) (|NewSparseUnivariatePolynomial| $$)
              (|Mapping| $$ $$)
              (|NewSparseUnivariatePolynomialFunctions2| $$ $$) (97 . |map|)
              (103 . |monicModulo|) (109 . |ground?|) (114 . |One|) (118 . =)
              (124 . |ground|) (|Union| % '"failed") (129 . |recip|) (134 . *)
              |NSMP;monicModulo;3%;18| (140 . ^) (146 . |pseudoRemainder|)
              (152 . -) |NSMP;prem;3%;19|
              (|Record| (|:| |coef| %) (|:| |gap| 11) (|:| |quotient| %)
                        (|:| |remainder| %))
              |NSMP;lazyPseudoDivide;2%R;24| |NSMP;pquo;3%;20|
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |NSMP;pseudoDivide;2%R;21| (158 . |lazyPseudoRemainder|)
              |NSMP;lazyPrem;3%;22| (164 . |lazyPseudoQuotient|) (170 . +)
              |NSMP;lazyPquo;3%;23|
              (|Record| (|:| |coef| $$) (|:| |gap| 11) (|:| |quotient| %)
                        (|:| |remainder| %))
              (176 . |lazyPseudoDivide|) (182 . |Zero|)
              (|Record| (|:| |polnum| %) (|:| |polden| $$) (|:| |power| 11))
              (186 . |lazyResidueClass|)
              (|Record| (|:| |polnum| %) (|:| |polden| %) (|:| |power| 11))
              |NSMP;lazyResidueClass;2%R;25| '|packD| (192 . |exquo|)
              (198 . |LazardQuotient|) (205 . |LazardQuotient|)
              (212 . |LazardQuotient2|) (220 . |next_sousResultant2|)
              (228 . |next_subResultant2|) (236 . ~=) (242 . |subResultantGcd|)
              (248 . |subResultantGcd|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %))
              (254 . |halfExtendedSubResultantGcd1|)
              (260 . |halfExtendedSubResultantGcd1|)
              (|Record| (|:| |gcd| %) (|:| |coef2| %))
              (266 . |halfExtendedSubResultantGcd2|)
              (272 . |halfExtendedSubResultantGcd2|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %) (|:| |coef2| %))
              (278 . |extendedSubResultantGcd|)
              (284 . |extendedSubResultantGcd|) (290 . |resultant|)
              (296 . |resultant|) (302 . |subResultantsChain|)
              (308 . |subResultantChain|) (314 . |lastSubResultant|)
              (320 . |lastSubResultant|) (326 . =) (332 . |quo|)
              (338 . |exactQuotient|) (344 . |exactQuotient!|) (350 . |exquo|)
              (356 . |gcd|) (362 . |content|) (367 . |gcd|) (373 . |zero?|)
              (378 . |unitCanonical|) (383 . |primitivePart!|) (|String|)
              (|OutputForm|) (|PositiveInteger|)
              (|Record| (|:| |k| 124) (|:| |c| 6)) (|List| 121) (|Mapping| 6 6)
              (|IndexedExponents| 7) (|List| 6) (|List| 124)
              (|Union| 6 '#1="failed") (|Mapping| 124 124) (|List| 11)
              (|List| 7) (|Union| 7 '"failed") (|SparseUnivariatePolynomial| %)
              (|SparseUnivariatePolynomial| 6) (|Union| 29 '#2="failed")
              (|Union| 25 '"failed")
              (|Record| (|:| |coef| %) (|:| |gap| 11) (|:| |remainder| %))
              (|Union| 148 '#3="failed") (|Matrix| %) (|Polynomial| 153)
              (|Polynomial| 146) (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 146) (|SingleInteger|) (|HashState|) (|Integer|)
              (|Record| (|:| |mat| 149) (|:| |vec| (|Vector| 146)))
              (|Vector| %) (|Matrix| 146) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 146 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 146) (|Mapping| 6 124) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Factored| 132) (|Union| 159 '#3#) (|List| 132)
              (|Union| 153 '#1#) (|Union| 146 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 162) (|:| |vec| (|Vector| 6)))
              (|Record| (|:| |var| 7) (|:| |exponent| 11)) (|Union| 164 '#2#)
              (|List| 167) (|Equation| %) (|Polynomial| 6))
           '#(|zero?| 388 |tail| 393 |subResultantGcd| 398 |subResultantChain|
              404 |retractIfCan| 410 |resultant| 415 |pseudoDivide| 421
              |primitivePart!| 427 |prem| 432 |pquo| 438 |next_subResultant2|
              444 |mvar| 452 |monomial| 457 |monicModulo| 464 |mdeg| 470
              |mainMonomial| 475 |mainCoefficients| 480 |leastMonomial| 485
              |leadingCoefficient| 490 |lazyResidueClass| 496
              |lazyPseudoDivide| 502 |lazyPrem| 508 |lazyPquo| 514
              |lastSubResultant| 520 |iteratedInitials| 526 |init| 531 |head|
              536 |halfExtendedSubResultantGcd2| 541
              |halfExtendedSubResultantGcd1| 547 |ground?| 553 |ground| 558
              |gcd| 563 |extendedSubResultantGcd| 569 |exquo| 575
              |exactQuotient!| 581 |exactQuotient| 587 |degree| 593
              |deepestInitial| 599 |content| 604 |coerce| 609 |coefficient| 619
              ^ 626 |Zero| 632 |One| 636 |LazardQuotient2| 640 |LazardQuotient|
              648 = 655 - 661 + 667 * 673)
           'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 0 10 0 10 0 16 0 27 14 26 4 17 28 15 3 2 1
                                  29 29 28 12 15 1 0 28 4 5 1 0 0 40 4 4 1 0 0
                                  0 29 40 1 1 0 0 0 0 0 11 12 12 46 12 45 0 0
                                  33 31 9 0 0 0 12 12 19 28 7 6 0 0 0 20 20 21
                                  12 12 18 37 35 13 28 8 7 6 4 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(|RecursivePolynomialCategory&| |PolynomialCategory&|
                |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                NIL NIL NIL |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |RetractableTo&| |Evalable&| |Hashable&| NIL |RetractableTo&|
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&| NIL NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|RecursivePolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 7) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| 6) (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 153) (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRing|) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 153)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7)) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 153)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|SemiRng|) (|LinearlyExplicitOver| 146)
                 (|LinearlyExplicitOver| 6) (|NonAssociativeRing|)
                 (|BiModule| 153 153) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|NonAssociativeRng|) (|RightModule| 146) (|RightModule| 153)
                 (|LeftModule| 153) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|PatternMatchable| 146)
                 (|PatternMatchable| (|Float|)) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|RetractableTo| 7) (|Evalable| $$) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 146)
                 (|RetractableTo| 153) (|SetCategory|) (|RetractableTo| 6)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 7))
                 (|CoercibleTo| (|Polynomial| 6))
                 (|ConvertibleTo| (|Polynomial| 6)) (|ConvertibleTo| 118)
                 (|CoercibleFrom| 7) (|InnerEvalable| $$ $$)
                 (|ConvertibleTo| 141) (|ConvertibleTo| 143)
                 (|ConvertibleTo| 142) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|canonicalUnitNormal|) (|CoercibleFrom| 146)
                 (|CoercibleFrom| 153) (|unitsKnown|) (|CoercibleTo| 119)
                 (|BasicType|) (|CoercibleFrom| 6) (|InnerEvalable| 7 6)
                 (|InnerEvalable| 7 $$) (|VariablesCommuteWithCoefficients|)
                 (|CoercibleTo| (|SparseMultivariatePolynomial| 6 7))
                 (|CoercibleFrom| (|SparseMultivariatePolynomial| 6 7)))
              (|makeByteWordVec2| 117
                                  '(1 8 11 0 12 0 0 0 13 1 8 2 0 14 1 8 0 0 22
                                    1 8 0 0 24 1 8 25 0 26 1 8 2 0 27 2 31 0 2
                                    0 32 1 0 25 0 34 0 0 0 35 3 0 0 0 7 11 36 1
                                    8 11 0 38 1 8 31 0 40 2 7 25 0 0 42 2 0 11
                                    0 7 43 3 0 0 0 7 11 44 2 7 25 0 0 46 2 7 25
                                    0 0 47 2 50 48 49 48 51 2 8 0 0 0 52 1 0 25
                                    0 53 0 6 0 54 2 0 25 0 0 55 1 0 6 0 56 1 6
                                    57 0 58 2 0 0 0 0 59 2 0 0 0 11 61 2 8 0 0
                                    0 62 2 0 0 0 0 63 2 8 0 0 0 70 2 8 0 0 0 72
                                    2 0 0 0 0 73 2 8 75 0 0 76 0 6 0 77 2 8 78
                                    0 0 79 2 0 57 0 0 83 3 82 2 2 2 11 84 3 0 0
                                    0 0 11 85 4 0 0 0 0 0 11 86 4 82 8 8 8 8 2
                                    87 4 0 0 0 0 0 0 88 2 7 25 0 0 89 2 8 0 0 0
                                    90 2 0 0 0 0 91 2 8 92 0 0 93 2 0 92 0 0 94
                                    2 8 95 0 0 96 2 0 95 0 0 97 2 8 98 0 0 99 2
                                    0 98 0 0 100 2 8 2 0 0 101 2 0 0 0 0 102 2
                                    8 29 0 0 103 2 0 29 0 0 104 2 8 0 0 0 105 2
                                    0 0 0 0 106 2 6 25 0 0 107 2 6 0 0 0 108 2
                                    0 0 0 6 109 2 0 0 0 6 110 2 6 57 0 0 111 2
                                    6 0 0 0 112 1 0 6 0 113 2 0 6 6 0 114 1 8
                                    25 0 115 1 8 0 0 116 1 0 0 0 117 1 58 25 0
                                    34 1 0 0 0 28 2 25 0 0 0 91 2 25 29 0 0 104
                                    1 0 17 0 18 2 25 0 0 0 102 2 0 68 0 0 69 1
                                    14 0 0 117 2 0 0 0 0 64 2 0 0 0 0 67 4 25 0
                                    0 0 0 0 88 1 0 7 0 19 3 0 0 0 7 11 36 2 0 0
                                    0 0 60 1 0 11 0 20 1 0 0 0 37 1 0 29 0 41 1
                                    0 0 0 39 2 0 0 0 7 45 2 0 80 0 0 81 2 0 65
                                    0 0 66 2 0 0 0 0 71 2 0 0 0 0 74 2 25 0 0 0
                                    106 1 0 29 0 30 1 0 0 0 21 1 0 0 0 23 2 25
                                    95 0 0 97 2 25 92 0 0 94 1 0 25 0 53 1 0 6
                                    0 56 2 14 6 6 0 114 2 25 98 0 0 100 2 52 57
                                    0 0 83 2 25 0 0 6 110 2 25 0 0 6 109 2 0 11
                                    0 7 43 1 0 0 0 33 1 14 6 0 113 1 0 5 0 15 1
                                    0 0 5 16 3 0 0 0 7 11 44 2 56 0 0 11 61 0
                                    58 0 13 0 56 0 35 4 25 0 0 0 0 11 86 3 25 0
                                    0 0 11 85 2 0 25 0 0 55 2 60 0 0 0 63 2 0 0
                                    0 0 73 2 0 0 0 0 59)))))
           '|lookupIncomplete|)) 
