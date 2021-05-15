
(SDEFUN |SYMANA;ansatz;Jvf;1|
        (($ |JetVectorField| JB1 (|JetBundleExpression| JB1)))
        (SPROG
         ((|res| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (#1=#:G407 NIL) (|f| (|JetBundleExpression| JB1)) (|s| (|Symbol|))
          (#2=#:G413 NIL) (|i| NIL) (#3=#:G403 NIL) (#4=#:G412 NIL))
         (SEQ (LETT |res| (|spadConstant| $ 35))
              (SEQ (LETT |i| 1) (LETT #4# (QREFELT $ 11)) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |s| (SPADCALL (QREFELT $ 22) |i| (QREFELT $ 37)))
                        (LETT |f|
                              (SPADCALL |s| (QREFELT $ 33) 0 (QREFELT $ 39)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |f|
                                                   (SPADCALL
                                                    (PROG1 (LETT #3# |i|)
                                                      (|check_subtype2|
                                                       (> #3# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #3#))
                                                    (QREFELT $ 40))
                                                   (QREFELT $ 41))
                                         (QREFELT $ 42)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #2# (QREFELT $ 13)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |s|
                          (SPADCALL (QREFELT $ 22) (+ (QREFELT $ 11) |i|)
                                    (QREFELT $ 37)))
                    (LETT |f| (SPADCALL |s| (QREFELT $ 33) 0 (QREFELT $ 39)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |f|
                                               (SPADCALL
                                                (PROG1 (LETT #1# |i|)
                                                  (|check_subtype2| (> #1# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                (QREFELT $ 43))
                                               (QREFELT $ 41))
                                     (QREFELT $ 42)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SYMANA;transform;JbeJbe;2|
        ((|f| |JetBundleExpression| JB1)
         ($ |JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|)))
        (SPROG
         ((|g| (|Expression| (|Integer|)))
          (|SubL| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (JV (|List| (|Expression| (|Integer|))))
          (|lower| (|List| (|PositiveInteger|))) (#1=#:G449 NIL)
          (|id| #2=(|Integer|)) (#3=#:G465 NIL) (|d| NIL)
          (|up| (|PositiveInteger|)) (#4=#:G447 NIL) (#5=#:G445 NIL)
          (|diff| (|List| (|JetBundleExpression| JB1)))
          (|rarg| (|List| (|JetBundleExpression| JB1)))
          (|arg| (|List| (|JetBundleExpression| JB1))) (#6=#:G464 NIL)
          (|i| NIL) (|num| #2#) (|pos| (|Integer|)) (|fname| (|Symbol|))
          (#7=#:G436 NIL) (#8=#:G426 NIL) (#9=#:G422 NIL) (|ind| #2#)
          (|typ| (|Symbol|)) (#10=#:G416 NIL) (#11=#:G462 NIL) (|Ke| NIL)
          (#12=#:G463 NIL) (|Op| NIL) (|LOps| (|List| (|BasicOperator|)))
          (#13=#:G461 NIL) (#14=#:G460 NIL)
          (|LKernels| (|List| (|Kernel| (|JetBundleExpression| JB1)))))
         (SEQ (LETT JV NIL) (LETT |SubL| NIL)
              (LETT |LKernels| (SPADCALL |f| (QREFELT $ 46)))
              (LETT |LOps|
                    (PROGN
                     (LETT #14# NIL)
                     (SEQ (LETT |Ke| NIL) (LETT #13# |LKernels|) G190
                          (COND
                           ((OR (ATOM #13#) (PROGN (LETT |Ke| (CAR #13#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |Ke| (QREFELT $ 49)) #14#))))
                          (LETT #13# (CDR #13#)) (GO G190) G191
                          (EXIT (NREVERSE #14#)))))
              (SEQ (LETT |Op| NIL) (LETT #12# |LOps|) (LETT |Ke| NIL)
                   (LETT #11# |LKernels|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |Ke| (CAR #11#)) NIL)
                         (ATOM #12#) (PROGN (LETT |Op| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 51))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet| (QREFELT $ 53)))
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#)))
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Deriv|)
                           (|error|
                            "function contains illegal jet variables in transform"))
                          ('T
                           (SEQ
                            (LETT |ind|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |Ke| (QREFELT $ 55))
                                             (QREFELT $ 56))
                                   (QREFELT $ 57)))
                            (LETT JV
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (PROG1 (LETT #9# |ind|)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT $ 59))
                                    (QREFELT $ 61))
                                   JV))
                            (EXIT
                             (COND
                              ((> |ind| (QREFELT $ 11))
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1
                                              (LETT #8#
                                                    (- |ind| (QREFELT $ 11)))
                                            (|check_subtype2| (> #8# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #8#))
                                          (QREFELT $ 15))
                                         (QREFELT $ 62))
                                        (QREFELT $ 63)))
                                      |SubL|)))
                              ('T
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1 (LETT #7# |ind|)
                                            (|check_subtype2| (> #7# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #7#))
                                          (QREFELT $ 14))
                                         (QREFELT $ 62))
                                        (QREFELT $ 63)))
                                      |SubL|)))))))))))
                      ('T
                       (SEQ (LETT |fname| (SPADCALL |Op| (QREFELT $ 64)))
                            (LETT |pos|
                                  (SPADCALL |fname| (QREFELT $ 22)
                                            (QREFELT $ 65)))
                            (EXIT
                             (COND
                              ((>= |pos| (PROGN (QREFELT $ 22) 1))
                               (SEQ (LETT |arg| (SPADCALL |Ke| (QREFELT $ 55)))
                                    (EXIT
                                     (COND
                                      ((> (LENGTH |arg|) 3)
                                       (SEQ (LETT |arg| (CDR |arg|))
                                            (LETT |num|
                                                  (SPADCALL (|SPADfirst| |arg|)
                                                            (QREFELT $ 57)))
                                            (LETT |arg| (CDR (CDR |arg|)))
                                            (LETT |rarg| NIL)
                                            (SEQ (LETT |i| 1) (LETT #6# |num|)
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |i| #6#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |rarg|
                                                        (CONS
                                                         (|SPADfirst| |arg|)
                                                         |rarg|))
                                                  (EXIT
                                                   (LETT |arg| (CDR |arg|))))
                                                 (LETT |i| (|inc_SI| |i|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (LETT |rarg| (NREVERSE |rarg|))
                                            (LETT |diff| |arg|)
                                            (EXIT
                                             (COND
                                              ((NULL |diff|)
                                               (SEQ
                                                (LETT JV
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (PROG1
                                                             (LETT #5# |pos|)
                                                           (|check_subtype2|
                                                            (> #5# 0)
                                                            '(|PositiveInteger|)
                                                            '(|Integer|) #5#))
                                                         (QREFELT $ 66))
                                                        (QREFELT $ 61))
                                                       JV))
                                                (EXIT
                                                 (LETT |SubL|
                                                       (CONS
                                                        (|SPADfirst|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |Ke|
                                                                     (QREFELT $
                                                                              68))
                                                           (QREFELT $ 69))
                                                          (QREFELT $ 63)))
                                                        |SubL|)))))
                                              ('T
                                               (SEQ
                                                (LETT |up|
                                                      (PROG1 (LETT #4# |pos|)
                                                        (|check_subtype2|
                                                         (> #4# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #4#)))
                                                (LETT |lower| NIL)
                                                (SEQ (LETT |d| NIL)
                                                     (LETT #3# |diff|) G190
                                                     (COND
                                                      ((OR (ATOM #3#)
                                                           (PROGN
                                                            (LETT |d|
                                                                  (CAR #3#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (LETT |id|
                                                            (SPADCALL |d|
                                                                      (QREFELT
                                                                       $ 57)))
                                                      (EXIT
                                                       (LETT |lower|
                                                             (CONS
                                                              (PROG1
                                                                  (LETT #1#
                                                                        |id|)
                                                                (|check_subtype2|
                                                                 (> #1# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                                              |lower|))))
                                                     (LETT #3# (CDR #3#))
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |lower|
                                                      (NREVERSE |lower|))
                                                (LETT JV
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |up| |lower|
                                                                  (QREFELT $
                                                                           71))
                                                        (QREFELT $ 61))
                                                       JV))
                                                (EXIT
                                                 (LETT |SubL|
                                                       (CONS
                                                        (|SPADfirst|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |Ke|
                                                                     (QREFELT $
                                                                              68))
                                                           (QREFELT $ 69))
                                                          (QREFELT $ 63)))
                                                        |SubL|))))))))))))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |g|
                    (SPADCALL (SPADCALL |f| (QREFELT $ 69)) |SubL| JV
                              (QREFELT $ 72)))
              (EXIT (SPADCALL |g| (QREFELT $ 74)))))) 

(SDEFUN |SYMANA;detSys;LL;3|
        ((|sys| |List| (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((#1=#:G473 NIL) (|eq| NIL) (#2=#:G472 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G471 NIL)
          (#4=#:G470 NIL))
         (SEQ
          (LETT |ds|
                (SPADCALL |sys|
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #3# |sys|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |eq| (QREFELT $ 76))
                                              #4#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 44)) (QREFELT $ 77)))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |eq| NIL) (LETT #1# |ds|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 75)) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;detSys;LJvfL;4|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G477 NIL) (|eq| NIL) (#2=#:G476 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #1# |sys|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |eq| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |eq| (QREFELT $ 76))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 77))))) 

(SDEFUN |SYMANA;detSys;LLJvfL;5|
        ((|sys| |List| (|JetBundleExpression| JB1)) (|sjb| |List| JB1)
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG
         ((#1=#:G539 NIL) (|co| NIL) (#2=#:G538 NIL)
          (|conds| (|List| (|Expression| (|Integer|))))
          (|coL| (|List| (|List| (|Expression| (|Integer|))))) (#3=#:G537 NIL)
          (|jp| NIL) (#4=#:G536 NIL)
          (|pcrit|
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB1)))
          (#5=#:G535 NIL) (|eq| NIL) (#6=#:G534 NIL)
          (|crit| (|List| (|JetBundleExpression| JB1))) (#7=#:G533 NIL)
          (#8=#:G532 NIL)
          (|pvf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (|o| (|NonNegativeInteger|)) (|ol| (|List| (|NonNegativeInteger|)))
          (#9=#:G531 NIL) (#10=#:G530 NIL)
          (|solEq| (|List| (|Equation| (|JetBundleExpression| JB1))))
          (|tmp| (|Union| (|JetBundleExpression| JB1) "failed"))
          (#11=#:G528 NIL) (#12=#:G529 NIL) (|jv| NIL))
         (SEQ (LETT |solEq| NIL)
              (SEQ (LETT |jv| NIL) (LETT #12# |sjb|) (LETT |eq| NIL)
                   (LETT #11# |sys|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#)) NIL)
                         (ATOM #12#) (PROGN (LETT |jv| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |tmp| (SPADCALL |eq| |jv| (QREFELT $ 82)))
                        (EXIT
                         (COND
                          ((QEQCAR |tmp| 1) (|error| "cannot solve in detsys"))
                          ('T
                           (LETT |solEq|
                                 (CONS
                                  (SPADCALL (SPADCALL |jv| (QREFELT $ 32))
                                            (QCDR |tmp|) (QREFELT $ 85))
                                  |solEq|))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |solEq| (NREVERSE |solEq|))
              (LETT |ol|
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #9# |sys|) G190
                          (COND
                           ((OR (ATOM #9#) (PROGN (LETT |eq| (CAR #9#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS (SPADCALL |eq| (QREFELT $ 86)) #10#))))
                          (LETT #9# (CDR #9#)) (GO G190) G191
                          (EXIT (NREVERSE #10#)))))
              (LETT |o| (SPADCALL (ELT $ 91) |ol| 0 (QREFELT $ 94)))
              (LETT |pvf| (SPADCALL |vf| |o| (QREFELT $ 95)))
              (LETT |crit|
                    (PROGN
                     (LETT #8# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #7# |sys|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |eq| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |pvf| |eq| (QREFELT $ 96))
                                        #8#))))
                          (LETT #7# (CDR #7#)) (GO G190) G191
                          (EXIT (NREVERSE #8#)))))
              (LETT |pcrit|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |eq| NIL) (LETT #5# |crit|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |eq| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |eq| |solEq| (QREFELT $ 98))
                                    (QREFELT $ 100))
                                   #6#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (LETT |coL|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |jp| NIL) (LETT #3# |pcrit|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |jp| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |jp| (QREFELT $ 102)) #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |conds| (SPADCALL (ELT $ 103) |coL| NIL (QREFELT $ 106)))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |co| NIL) (LETT #1# |conds|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |co| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |co| (QREFELT $ 107)) #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LL;6|
        ((|sys| |List| (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((#1=#:G547 NIL) (|eq| NIL) (#2=#:G546 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G545 NIL)
          (#4=#:G544 NIL))
         (SEQ
          (LETT |ds|
                (SPADCALL |sys|
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #3# |sys|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |eq| (QREFELT $ 76))
                                              #4#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 44)) (QREFELT $ 108)))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |eq| NIL) (LETT #1# |ds|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 75)) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LJvfL;7|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G551 NIL) (|eq| NIL) (#2=#:G550 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #1# |sys|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |eq| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |eq| (QREFELT $ 76))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 108))))) 

(SDEFUN |SYMANA;ncDetSys;LLJvfL;8|
        ((|sys| |List| (|JetBundleExpression| JB1)) (|sjb| |List| JB1)
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG
         ((|isc| #1=(|List| (|JetBundleExpression| JB1))) (|ijb| (|List| JB1))
          (|cond| (|JetBundleExpression| JB1)) (|jv| (JB1)) (#2=#:G563 NIL)
          (#3=#:G579 NIL) (|x| NIL) (#4=#:G580 NIL) (|i| NIL) (#5=#:G577 NIL)
          (|e| NIL) (#6=#:G578 NIL) (|j| (|Integer|)) (|Eta| #1#)
          (#7=#:G576 NIL) (#8=#:G574 NIL) (|co| NIL) (#9=#:G575 NIL)
          (|ind2| #10=(|List| (|PositiveInteger|))) (|tmp| #1#) (|ind1| #10#)
          (|Xi| #1#) (|jt| (|Symbol|)) (#11=#:G572 NIL) (#12=#:G573 NIL)
          (|coeffs| (|List| (|JetBundleExpression| JB1)))
          (|dirs| (|List| JB1)))
         (SEQ (LETT |dirs| (SPADCALL |vf| (QREFELT $ 111)))
              (LETT |coeffs| (SPADCALL |vf| (QREFELT $ 112))) (LETT |Xi| NIL)
              (LETT |tmp| NIL) (LETT |ind1| NIL) (LETT |ind2| NIL)
              (SEQ (LETT |co| NIL) (LETT #12# |coeffs|) (LETT |jv| NIL)
                   (LETT #11# |dirs|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |jv| (CAR #11#)) NIL)
                         (ATOM #12#) (PROGN (LETT |co| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 113)))
                        (EXIT
                         (COND
                          ((EQUAL |jt| '|Indep|)
                           (SEQ (LETT |Xi| (CONS |co| |Xi|))
                                (EXIT
                                 (LETT |ind1|
                                       (CONS (SPADCALL |jv| (QREFELT $ 114))
                                             |ind1|)))))
                          ((EQUAL |jt| '|Dep|)
                           (SEQ (LETT |tmp| (CONS |co| |tmp|))
                                (EXIT
                                 (LETT |ind2|
                                       (CONS (SPADCALL |jv| (QREFELT $ 114))
                                             |ind2|)))))
                          ('T
                           (|error|
                            "Only independent and dependent variables allowed")))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |j| (QREFELT $ 13)) (LETT |Eta| NIL)
              (SEQ (LETT |i| NIL) (LETT #9# |ind2|) (LETT |co| NIL)
                   (LETT #8# |tmp|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |co| (CAR #8#)) NIL)
                         (ATOM #9#) (PROGN (LETT |i| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ G190 (COND ((NULL (> |j| |i|)) (GO G191)))
                         (SEQ (LETT |Eta| (CONS (|spadConstant| $ 115) |Eta|))
                              (EXIT (LETT |j| (- |j| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |Eta| (CONS |co| |Eta|)) (EXIT (LETT |j| (- |j| 1))))
                   (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#)))) (GO G190)
                   G191 (EXIT NIL))
              (COND
               ((NULL (ZEROP |j|))
                (SEQ (LETT |i| 1) (LETT #7# |j|) G190
                     (COND ((|greater_SI| |i| #7#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |Eta| (CONS (|spadConstant| $ 115) |Eta|))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
              (LETT |isc| NIL) (LETT |ijb| NIL)
              (SEQ (LETT |j| 1) (LETT #6# (QREFELT $ 13)) (LETT |e| NIL)
                   (LETT #5# |Eta|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#)) NIL)
                         (|greater_SI| |j| #6#))
                     (GO G191)))
                   (SEQ (LETT |cond| (SPADCALL |e| (QREFELT $ 116)))
                        (LETT |jv| (|spadConstant| $ 23))
                        (SEQ (LETT |i| NIL) (LETT #4# |ind1|) (LETT |x| NIL)
                             (LETT #3# |Xi|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL)
                                   (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |x| (QREFELT $ 117)))
                                 (SEQ
                                  (LETT |jv|
                                        (SPADCALL
                                         (PROG1 (LETT #2# |j|)
                                           (|check_subtype2| (> #2# 0)
                                                             '(|PositiveInteger|)
                                                             '(|NonNegativeInteger|)
                                                             #2#))
                                         (LIST |i|) (QREFELT $ 118)))
                                  (EXIT
                                   (LETT |cond|
                                         (SPADCALL |cond|
                                                   (SPADCALL |x|
                                                             (SPADCALL |jv|
                                                                       (QREFELT
                                                                        $ 32))
                                                             (QREFELT $ 119))
                                                   (QREFELT $ 120)))))))))
                             (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |jv| (QREFELT $ 121))
                           (|error|
                            "cannot solve invariant surface condition"))
                          ('T
                           (SEQ (LETT |ijb| (CONS |jv| |ijb|))
                                (EXIT (LETT |isc| (CONS |cond| |isc|))))))))
                   (LETT #5# (PROG1 (CDR #5#) (LETT |j| (|inc_SI| |j|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |isc| |sys| (QREFELT $ 122))
                         (SPADCALL |ijb| |sjb| (QREFELT $ 123)) |vf|
                         (QREFELT $ 77)))))) 

(DECLAIM (NOTINLINE |SymmetryAnalysis;|)) 

(DEFUN |SymmetryAnalysis| (&REST #1=#:G593)
  (SPROG NIL
         (PROG (#2=#:G594)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SymmetryAnalysis|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SymmetryAnalysis;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SymmetryAnalysis|)))))))))) 

(DEFUN |SymmetryAnalysis;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G592 NIL) (|jv| NIL) (#2=#:G591 NIL) (#3=#:G590 NIL) (|i| NIL)
    (#4=#:G589 NIL) (#5=#:G588 NIL) (#6=#:G587 NIL) (#7=#:G586 NIL)
    (#8=#:G585 NIL) (#9=#:G396 NIL) (#10=#:G584 NIL) (#11=#:G583 NIL)
    (#12=#:G393 NIL) (#13=#:G582 NIL) (#14=#:G581 NIL) (|pv$| NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 (|devaluate| |#2|))
     (LETT DV$3 (|devaluate| |#3|))
     (LETT |dv$| (LIST '|SymmetryAnalysis| DV$1 DV$2 DV$3))
     (LETT $ (GETREFV 125))
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
     (|haddProp| |$ConstructorCache| '|SymmetryAnalysis| (LIST DV$1 DV$2 DV$3)
                 (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
     (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
     (QSETREFV $ 18
               (SPADCALL
                (PROGN
                 (LETT #14# NIL)
                 (SEQ (LETT |i| 1) (LETT #13# (QREFELT $ 11)) G190
                      (COND ((|greater_SI| |i| #13#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #12# |i|)
                                  (|check_subtype2| (> #12# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #12#))
                                (QREFELT $ 14))
                               #14#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                (PROGN
                 (LETT #11# NIL)
                 (SEQ (LETT |i| 1) (LETT #10# (QREFELT $ 13)) G190
                      (COND ((|greater_SI| |i| #10#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #9# |i|)
                                  (|check_subtype2| (> #9# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #9#))
                                (QREFELT $ 15))
                               #11#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                (QREFELT $ 17)))
     (QSETREFV $ 21
               (PROGN
                (LETT #8# NIL)
                (SEQ (LETT |jv| NIL) (LETT #7# (QREFELT $ 18)) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |jv| (CAR #7#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #8# (CONS (SPADCALL |jv| (QREFELT $ 20)) #8#))))
                     (LETT #7# (CDR #7#)) (GO G190) G191
                     (EXIT (NREVERSE #8#)))))
     (QSETREFV $ 22 NIL)
     (COND
      ((QEQCAR |#2| 0)
       (COND
        ((> (QREFELT $ 11) 1)
         (SETELT $ 22
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT |i| 1) (LETT #5# (QREFELT $ 11)) G190
                       (COND ((|greater_SI| |i| #5#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (SPADCALL (QCDR |#2|)
                                          (LIST (SPADCALL |i| (QREFELT $ 26)))
                                          (QREFELT $ 28))
                                #6#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #6#))))))
        ('T (SETELT $ 22 (LIST (QCDR |#2|))))))
      ('T (SETELT $ 22 (QCDR |#2|))))
     (COND
      ((QEQCAR |#3| 0)
       (COND
        ((> (QREFELT $ 13) 1)
         (SETELT $ 22
                 (SPADCALL (QREFELT $ 22)
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |i| 1) (LETT #3# (QREFELT $ 13)) G190
                                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (SPADCALL (QCDR |#3|)
                                                    (LIST
                                                     (SPADCALL |i|
                                                               (QREFELT $ 26)))
                                                    (QREFELT $ 28))
                                          #4#))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT (NREVERSE #4#))))
                           (QREFELT $ 30))))
        ('T
         (SETELT $ 22
                 (SPADCALL (QREFELT $ 22) (LIST (QCDR |#3|))
                           (QREFELT $ 30))))))
      ('T (SETELT $ 22 (SPADCALL (QREFELT $ 22) (QCDR |#3|) (QREFELT $ 30)))))
     (QSETREFV $ 33
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |jv| NIL) (LETT #1# (QREFELT $ 18)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |jv| (QREFELT $ 32)) #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))
     $)))) 

(MAKEPROP '|SymmetryAnalysis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |numIndVar|) '|nn|
              (4 . |numDepVar|) '|mm| (8 . X) (13 . U) (|List| 6)
              (18 . |concat!|) '|vars| (|Symbol|) (24 . |name|) '|indVars|
              '|depVars| (29 . |One|) (|OutputForm|) (|NonNegativeInteger|)
              (33 . |coerce|) (|List| 24) (38 . |superscript|) (|List| 19)
              (44 . |append|) (|JetBundleExpression| 6) (50 . |coerce|)
              '|JVars| (|JetVectorField| 6 31) (55 . |Zero|) (|Integer|)
              (59 . |qelt|) (|List| $) (65 . |function|) (72 . |diffX|)
              (77 . *) (83 . +) (89 . |diffU|) |SYMANA;ansatz;Jvf;1|
              (|List| 67) (94 . |tower|) (|BasicOperator|) (|Kernel| 31)
              (99 . |operator|) (|Boolean|) (104 . |has?|)
              (|Union| (|None|) '"failed") (110 . |property|) (|List| 31)
              (116 . |argument|) (121 . |second|) (126 . |retract|)
              (|JetBundleSymAna| 6 (NRTEVAL (QREFELT $ 7))
                                 (NRTEVAL (QREFELT $ 8)))
              (131 . X) (|Expression| 36) (136 . |coerce|) (141 . |coerce|)
              (146 . |kernels|) (151 . |name|) (156 . |position|) (162 . U)
              (|Kernel| $) (167 . |coerce|) (172 . |coerce|) (|List| 9)
              (177 . |Pr|) (183 . |eval|) (|JetBundleExpression| 58)
              (190 . |coerce|) |SYMANA;transform;JbeJbe;2| (195 . |leadingDer|)
              |SYMANA;detSys;LLJvfL;5| (|List| 73) |SYMANA;detSys;LL;3|
              |SYMANA;detSys;LJvfL;4| (|Union| $ '"failed") (200 . |solveFor|)
              (206 . =) (|Equation| 31) (212 . =) (218 . |order|) (223 . |max|)
              (229 . |max|) (|Character|) (235 . |max|) (241 . |max|)
              (|Mapping| 25 25 25) (|List| 25) (247 . |reduce|)
              (254 . |prolong|) (260 . |eval|) (|List| (|Equation| $))
              (266 . |eval|) (|SparseMultivariatePolynomial| 60 6)
              (272 . |numerJP|) (|List| 60) (277 . |coefficients|)
              (282 . |append|) (|Mapping| 101 101 101) (|List| 101)
              (288 . |reduce|) (295 . |coerce|) |SYMANA;ncDetSys;LLJvfL;8|
              |SYMANA;ncDetSys;LL;6| |SYMANA;ncDetSys;LJvfL;7|
              (300 . |directions|) (305 . |coefficients|) (310 . |type|)
              (315 . |index|) (320 . |Zero|) (324 . -) (329 . |zero?|)
              (334 . |Pr|) (340 . *) (346 . +) (352 . |one?|) (357 . |append|)
              (363 . |append|)
              (|List|
               (|JetBundleLinearFunction| 58 (|JetBundleXExpression| 58))))
           '#(|transform| 369 |ncDetSys| 374 |linearize| 392 |detSysNS| 397
              |detSys| 408 |ansatz| 426)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|ansatz|
                                 ((|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|transform|
                                 ((|JetBundleExpression|
                                   (|JetBundleSymAna| |#1| |#2| |#3|))
                                  (|JetBundleExpression| |#1|)))
                                T)
                              '((|linearize|
                                 ((|List|
                                   (|JetBundleLinearFunction|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)
                                    (|JetBundleXExpression|
                                     (|JetBundleSymAna| |#1| |#2| |#3|))))
                                  (|List|
                                   (|JetBundleExpression|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)))))
                                T)
                              '((|detSys|
                                 ((|List|
                                   (|JetBundleExpression|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)))
                                  (|List| (|JetBundleExpression| |#1|))))
                                T)
                              '((|detSys|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|detSys|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|List| |#1|)
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|ncDetSys|
                                 ((|List|
                                   (|JetBundleExpression|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)))
                                  (|List| (|JetBundleExpression| |#1|))))
                                T)
                              '((|ncDetSys|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|ncDetSys|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|List| |#1|)
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T)
                              '((|detSysNS|
                                 ((|List|
                                   (|JetBundleExpression|
                                    (|JetBundleSymAna| |#1| |#2| |#3|)))
                                  (|List| (|JetBundleExpression| |#1|))))
                                T)
                              '((|detSysNS|
                                 ((|List| (|JetBundleExpression| |#1|))
                                  (|List| (|JetBundleExpression| |#1|))
                                  (|JetVectorField| |#1|
                                                    (|JetBundleExpression|
                                                     |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 124
                                            '(0 6 9 10 0 6 9 12 1 6 0 9 14 1 6
                                              0 9 15 2 16 0 0 0 17 1 6 19 0 20
                                              0 6 0 23 1 25 24 0 26 2 19 0 0 27
                                              28 2 29 0 0 0 30 1 31 0 6 32 0 34
                                              0 35 2 29 19 0 36 37 3 31 0 19 38
                                              25 39 1 34 0 9 40 2 34 0 31 0 41
                                              2 34 0 0 0 42 1 34 0 9 43 1 31 45
                                              0 46 1 48 47 0 49 2 47 50 0 19 51
                                              2 47 52 0 19 53 1 48 54 0 55 1 54
                                              31 0 56 1 31 36 0 57 1 58 0 9 59
                                              1 58 60 0 61 1 6 60 0 62 1 60 45
                                              0 63 1 47 19 0 64 2 29 36 19 0 65
                                              1 58 0 9 66 1 31 0 67 68 1 31 60
                                              0 69 2 58 0 9 70 71 3 60 0 0 45
                                              38 72 1 73 0 60 74 1 31 6 0 76 2
                                              31 81 0 6 82 2 31 50 0 0 83 2 84
                                              0 31 31 85 1 31 25 0 86 2 19 0 0
                                              0 87 2 6 0 0 0 88 2 89 0 0 0 90 2
                                              25 0 0 0 91 3 93 25 92 0 25 94 2
                                              34 0 0 25 95 2 34 31 0 31 96 2 31
                                              0 0 97 98 1 31 99 0 100 1 99 101
                                              0 102 2 101 0 0 0 103 3 105 101
                                              104 0 101 106 1 31 0 60 107 1 34
                                              16 0 111 1 34 54 0 112 1 6 19 0
                                              113 1 6 9 0 114 0 31 0 115 1 31 0
                                              0 116 1 31 50 0 117 2 6 0 9 70
                                              118 2 31 0 0 0 119 2 31 0 0 0 120
                                              1 6 50 0 121 2 54 0 0 0 122 2 16
                                              0 0 0 123 1 0 73 31 75 2 0 54 54
                                              34 110 1 0 78 54 109 3 0 54 54 16
                                              34 108 1 0 124 78 1 2 0 54 54 34
                                              1 1 0 78 54 1 2 0 54 54 34 80 1 0
                                              78 54 79 3 0 54 54 16 34 77 0 0
                                              34 44)))))
           '|lookupComplete|)) 
