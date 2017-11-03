
(SDEFUN |SYMANA;ansatz;Jvf;1|
        (($ |JetVectorField| JB1 (|JetBundleExpression| JB1)))
        (SPROG
         ((|res| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (#1=#:G742 NIL) (|f| (|JetBundleExpression| JB1)) (|s| (|Symbol|))
          (#2=#:G748 NIL) (|i| NIL) (#3=#:G738 NIL) (#4=#:G747 NIL))
         (SEQ (LETT |res| (|spadConstant| $ 37) . #5=(|SYMANA;ansatz;Jvf;1|))
              (SEQ (LETT |i| 1 . #5#) (LETT #4# (QREFELT $ 11) . #5#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (LETT |s| (SPADCALL (QREFELT $ 22) |i| (QREFELT $ 39))
                          . #5#)
                    (LETT |f| (SPADCALL |s| (QREFELT $ 35) 0 (QREFELT $ 41))
                          . #5#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |f|
                                               (SPADCALL
                                                (PROG1 (LETT #3# |i| . #5#)
                                                  (|check_subtype2| (> #3# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
                                                                    #3#))
                                                (QREFELT $ 42))
                                               (QREFELT $ 43))
                                     (QREFELT $ 44))
                           . #5#)))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1 . #5#) (LETT #2# (QREFELT $ 13) . #5#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |s|
                          (SPADCALL (QREFELT $ 22) (+ (QREFELT $ 11) |i|)
                                    (QREFELT $ 39))
                          . #5#)
                    (LETT |f| (SPADCALL |s| (QREFELT $ 35) 0 (QREFELT $ 41))
                          . #5#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |f|
                                               (SPADCALL
                                                (PROG1 (LETT #1# |i| . #5#)
                                                  (|check_subtype2| (> #1# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                (QREFELT $ 45))
                                               (QREFELT $ 43))
                                     (QREFELT $ 44))
                           . #5#)))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SYMANA;transform;JbeJbe;2|
        ((|f| |JetBundleExpression| JB1)
         ($ |JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|)))
        (SPROG
         ((|g| (|Expression| (|Integer|)))
          (|SubL| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (JV (|List| (|Expression| (|Integer|))))
          (|lower| (|List| (|PositiveInteger|))) (#1=#:G787 NIL)
          (|id| #2=(|Integer|)) (#3=#:G803 NIL) (|d| NIL)
          (|up| (|PositiveInteger|)) (#4=#:G785 NIL) (#5=#:G783 NIL)
          (|diff| (|List| (|JetBundleExpression| JB1)))
          (|rarg| (|List| (|JetBundleExpression| JB1)))
          (|arg| (|List| (|JetBundleExpression| JB1))) (#6=#:G802 NIL)
          (|i| NIL) (|num| #2#) (|pos| (|Integer|)) (|fname| (|Symbol|))
          (#7=#:G774 NIL) (#8=#:G764 NIL) (#9=#:G760 NIL) (|ind| #2#)
          (|typ| (|Symbol|)) (#10=#:G752 NIL) (#11=#:G800 NIL) (|Ke| NIL)
          (#12=#:G801 NIL) (|Op| NIL) (|LOps| (|List| (|BasicOperator|)))
          (#13=#:G799 NIL) (#14=#:G798 NIL)
          (|LKernels| (|List| (|Kernel| (|JetBundleExpression| JB1)))))
         (SEQ (LETT JV NIL . #15=(|SYMANA;transform;JbeJbe;2|))
              (LETT |SubL| NIL . #15#)
              (LETT |LKernels| (SPADCALL |f| (QREFELT $ 48)) . #15#)
              (LETT |LOps|
                    (PROGN
                     (LETT #14# NIL . #15#)
                     (SEQ (LETT |Ke| NIL . #15#) (LETT #13# |LKernels| . #15#)
                          G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |Ke| (CAR #13#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |Ke| (QREFELT $ 51)) #14#)
                                  . #15#)))
                          (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #15#)
              (SEQ (LETT |Op| NIL . #15#) (LETT #12# |LOps| . #15#)
                   (LETT |Ke| NIL . #15#) (LETT #11# |LKernels| . #15#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |Ke| (CAR #11#) . #15#) NIL)
                         (ATOM #12#) (PROGN (LETT |Op| (CAR #12#) . #15#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 52))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet| (QREFELT $ 54))
                                        . #15#)
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#))
                              . #15#)
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Deriv|)
                           (|error|
                            "function contains illegal jet variables in transform"))
                          ('T
                           (SEQ
                            (LETT |ind|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |Ke| (QREFELT $ 56))
                                             (QREFELT $ 57))
                                   (QREFELT $ 58))
                                  . #15#)
                            (LETT JV
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (PROG1 (LETT #9# |ind| . #15#)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT $ 60))
                                    (QREFELT $ 62))
                                   JV)
                                  . #15#)
                            (EXIT
                             (COND
                              ((SPADCALL |ind| (QREFELT $ 11) (QREFELT $ 63))
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1
                                              (LETT #8#
                                                    (- |ind| (QREFELT $ 11))
                                                    . #15#)
                                            (|check_subtype2| (> #8# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #8#))
                                          (QREFELT $ 15))
                                         (QREFELT $ 64))
                                        (QREFELT $ 65)))
                                      |SubL|)
                                     . #15#))
                              ('T
                               (LETT |SubL|
                                     (CONS
                                      (|SPADfirst|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1 (LETT #7# |ind| . #15#)
                                            (|check_subtype2| (> #7# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #7#))
                                          (QREFELT $ 14))
                                         (QREFELT $ 64))
                                        (QREFELT $ 65)))
                                      |SubL|)
                                     . #15#))))))))))
                      ('T
                       (SEQ
                        (LETT |fname| (SPADCALL |Op| (QREFELT $ 66)) . #15#)
                        (LETT |pos|
                              (SPADCALL |fname| (QREFELT $ 22) (QREFELT $ 67))
                              . #15#)
                        (EXIT
                         (COND
                          ((>= |pos| (SPADCALL (QREFELT $ 22) (QREFELT $ 68)))
                           (SEQ
                            (LETT |arg| (SPADCALL |Ke| (QREFELT $ 56)) . #15#)
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |arg|) 3 (QREFELT $ 69))
                               (SEQ (LETT |arg| (CDR |arg|) . #15#)
                                    (LETT |num|
                                          (SPADCALL (|SPADfirst| |arg|)
                                                    (QREFELT $ 58))
                                          . #15#)
                                    (LETT |arg| (CDR (CDR |arg|)) . #15#)
                                    (LETT |rarg| NIL . #15#)
                                    (SEQ (LETT |i| 1 . #15#)
                                         (LETT #6# |num| . #15#) G190
                                         (COND
                                          ((|greater_SI| |i| #6#) (GO G191)))
                                         (SEQ
                                          (LETT |rarg|
                                                (CONS (|SPADfirst| |arg|)
                                                      |rarg|)
                                                . #15#)
                                          (EXIT
                                           (LETT |arg| (CDR |arg|) . #15#)))
                                         (LETT |i| (|inc_SI| |i|) . #15#)
                                         (GO G190) G191 (EXIT NIL))
                                    (LETT |rarg| (NREVERSE |rarg|) . #15#)
                                    (LETT |diff| |arg| . #15#)
                                    (EXIT
                                     (COND
                                      ((NULL |diff|)
                                       (SEQ
                                        (LETT JV
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL
                                                 (PROG1 (LETT #5# |pos| . #15#)
                                                   (|check_subtype2| (> #5# 0)
                                                                     '(|PositiveInteger|)
                                                                     '(|Integer|)
                                                                     #5#))
                                                 (QREFELT $ 70))
                                                (QREFELT $ 62))
                                               JV)
                                              . #15#)
                                        (EXIT
                                         (LETT |SubL|
                                               (CONS
                                                (|SPADfirst|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |Ke|
                                                             (QREFELT $ 72))
                                                   (QREFELT $ 73))
                                                  (QREFELT $ 65)))
                                                |SubL|)
                                               . #15#))))
                                      ('T
                                       (SEQ
                                        (LETT |up|
                                              (PROG1 (LETT #4# |pos| . #15#)
                                                (|check_subtype2| (> #4# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|Integer|)
                                                                  #4#))
                                              . #15#)
                                        (LETT |lower| NIL . #15#)
                                        (SEQ (LETT |d| NIL . #15#)
                                             (LETT #3# |diff| . #15#) G190
                                             (COND
                                              ((OR (ATOM #3#)
                                                   (PROGN
                                                    (LETT |d| (CAR #3#) . #15#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |id|
                                                    (SPADCALL |d|
                                                              (QREFELT $ 58))
                                                    . #15#)
                                              (EXIT
                                               (LETT |lower|
                                                     (CONS
                                                      (PROG1
                                                          (LETT #1# |id|
                                                                . #15#)
                                                        (|check_subtype2|
                                                         (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #1#))
                                                      |lower|)
                                                     . #15#)))
                                             (LETT #3# (CDR #3#) . #15#)
                                             (GO G190) G191 (EXIT NIL))
                                        (LETT |lower| (NREVERSE |lower|)
                                              . #15#)
                                        (LETT JV
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL |up| |lower|
                                                          (QREFELT $ 75))
                                                (QREFELT $ 62))
                                               JV)
                                              . #15#)
                                        (EXIT
                                         (LETT |SubL|
                                               (CONS
                                                (|SPADfirst|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |Ke|
                                                             (QREFELT $ 72))
                                                   (QREFELT $ 73))
                                                  (QREFELT $ 65)))
                                                |SubL|)
                                               . #15#)))))))))))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #15#))
                         . #15#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |g|
                    (SPADCALL (SPADCALL |f| (QREFELT $ 73)) |SubL| JV
                              (QREFELT $ 76))
                    . #15#)
              (EXIT (SPADCALL |g| (QREFELT $ 78)))))) 

(SDEFUN |SYMANA;detSys;LL;3|
        ((|sys| |List| (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((#1=#:G811 NIL) (|eq| NIL) (#2=#:G810 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G809 NIL)
          (#4=#:G808 NIL))
         (SEQ
          (LETT |ds|
                (SPADCALL |sys|
                          (PROGN
                           (LETT #4# NIL . #5=(|SYMANA;detSys;LL;3|))
                           (SEQ (LETT |eq| NIL . #5#) (LETT #3# |sys| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 46)) (QREFELT $ 81))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |eq| NIL . #5#) (LETT #1# |ds| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 79)) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;detSys;LJvfL;4|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G815 NIL) (|eq| NIL) (#2=#:G814 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #2# NIL . #3=(|SYMANA;detSys;LJvfL;4|))
                           (SEQ (LETT |eq| NIL . #3#) (LETT #1# |sys| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 81))))) 

(SDEFUN |SYMANA;detSys;LLJvfL;5|
        ((|sys| |List| (|JetBundleExpression| JB1)) (|sjb| |List| JB1)
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG
         ((#1=#:G872 NIL) (|co| NIL) (#2=#:G871 NIL)
          (|conds| (|List| (|Expression| (|Integer|))))
          (|coL| (|List| (|List| (|Expression| (|Integer|))))) (#3=#:G870 NIL)
          (|jp| NIL) (#4=#:G869 NIL)
          (|pcrit|
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB1)))
          (#5=#:G868 NIL) (|eq| NIL) (#6=#:G867 NIL)
          (|crit| (|List| (|JetBundleExpression| JB1))) (#7=#:G866 NIL)
          (#8=#:G865 NIL)
          (|pvf| (|JetVectorField| JB1 (|JetBundleExpression| JB1)))
          (|o| (|NonNegativeInteger|)) (|ol| (|List| (|NonNegativeInteger|)))
          (#9=#:G864 NIL) (#10=#:G863 NIL)
          (|solEq| (|List| (|Equation| (|JetBundleExpression| JB1))))
          (|tmp| (|Union| (|JetBundleExpression| JB1) "failed"))
          (#11=#:G861 NIL) (#12=#:G862 NIL) (|jv| NIL))
         (SEQ (LETT |solEq| NIL . #13=(|SYMANA;detSys;LLJvfL;5|))
              (SEQ (LETT |jv| NIL . #13#) (LETT #12# |sjb| . #13#)
                   (LETT |eq| NIL . #13#) (LETT #11# |sys| . #13#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#) . #13#) NIL)
                         (ATOM #12#) (PROGN (LETT |jv| (CAR #12#) . #13#) NIL))
                     (GO G191)))
                   (SEQ (LETT |tmp| (SPADCALL |eq| |jv| (QREFELT $ 86)) . #13#)
                        (EXIT
                         (COND
                          ((QEQCAR |tmp| 1) (|error| "cannot solve in detsys"))
                          ('T
                           (LETT |solEq|
                                 (CONS
                                  (SPADCALL (SPADCALL |jv| (QREFELT $ 34))
                                            (QCDR |tmp|) (QREFELT $ 89))
                                  |solEq|)
                                 . #13#)))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #13#))
                         . #13#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |solEq| (NREVERSE |solEq|) . #13#)
              (LETT |ol|
                    (PROGN
                     (LETT #10# NIL . #13#)
                     (SEQ (LETT |eq| NIL . #13#) (LETT #9# |sys| . #13#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |eq| (CAR #9#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS (SPADCALL |eq| (QREFELT $ 90)) #10#)
                                  . #13#)))
                          (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #13#)
              (LETT |o| (SPADCALL (ELT $ 95) |ol| 0 (QREFELT $ 98)) . #13#)
              (LETT |pvf| (SPADCALL |vf| |o| (QREFELT $ 99)) . #13#)
              (LETT |crit|
                    (PROGN
                     (LETT #8# NIL . #13#)
                     (SEQ (LETT |eq| NIL . #13#) (LETT #7# |sys| . #13#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |eq| (CAR #7#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |pvf| |eq| (QREFELT $ 100))
                                        #8#)
                                  . #13#)))
                          (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #13#)
              (LETT |pcrit|
                    (PROGN
                     (LETT #6# NIL . #13#)
                     (SEQ (LETT |eq| NIL . #13#) (LETT #5# |crit| . #13#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |eq| (CAR #5#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |eq| |solEq| (QREFELT $ 102))
                                    (QREFELT $ 104))
                                   #6#)
                                  . #13#)))
                          (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #13#)
              (LETT |coL|
                    (PROGN
                     (LETT #4# NIL . #13#)
                     (SEQ (LETT |jp| NIL . #13#) (LETT #3# |pcrit| . #13#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |jp| (CAR #3#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |jp| (QREFELT $ 106)) #4#)
                                  . #13#)))
                          (LETT #3# (CDR #3#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #13#)
              (LETT |conds| (SPADCALL (ELT $ 107) |coL| NIL (QREFELT $ 110))
                    . #13#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #13#)
                (SEQ (LETT |co| NIL . #13#) (LETT #1# |conds| . #13#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |co| (CAR #1#) . #13#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |co| (QREFELT $ 111)) #2#)
                             . #13#)))
                     (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LL;6|
        ((|sys| |List| (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| (|JetBundleSymAna| JB1 |xi| |eta|))))
        (SPROG
         ((#1=#:G880 NIL) (|eq| NIL) (#2=#:G879 NIL)
          (|ds| (|List| (|JetBundleExpression| JB1))) (#3=#:G878 NIL)
          (#4=#:G877 NIL))
         (SEQ
          (LETT |ds|
                (SPADCALL |sys|
                          (PROGN
                           (LETT #4# NIL . #5=(|SYMANA;ncDetSys;LL;6|))
                           (SEQ (LETT |eq| NIL . #5#) (LETT #3# |sys| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (SPADCALL (QREFELT $ 46)) (QREFELT $ 112))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |eq| NIL . #5#) (LETT #1# |ds| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 79)) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SYMANA;ncDetSys;LJvfL;7|
        ((|sys| |List| (|JetBundleExpression| JB1))
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG ((#1=#:G884 NIL) (|eq| NIL) (#2=#:G883 NIL))
               (SEQ
                (SPADCALL |sys|
                          (PROGN
                           (LETT #2# NIL . #3=(|SYMANA;ncDetSys;LJvfL;7|))
                           (SEQ (LETT |eq| NIL . #3#) (LETT #1# |sys| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |eq| (QREFELT $ 80))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |vf| (QREFELT $ 112))))) 

(SDEFUN |SYMANA;ncDetSys;LLJvfL;8|
        ((|sys| |List| (|JetBundleExpression| JB1)) (|sjb| |List| JB1)
         (|vf| |JetVectorField| JB1 (|JetBundleExpression| JB1))
         ($ |List| (|JetBundleExpression| JB1)))
        (SPROG
         ((|isc| #1=(|List| (|JetBundleExpression| JB1))) (|ijb| (|List| JB1))
          (|cond| (|JetBundleExpression| JB1)) (|jv| (JB1)) (#2=#:G896 NIL)
          (#3=#:G912 NIL) (|x| NIL) (#4=#:G913 NIL) (|i| NIL) (#5=#:G910 NIL)
          (|e| NIL) (#6=#:G911 NIL) (|j| (|Integer|)) (|Eta| #1#)
          (#7=#:G909 NIL) (#8=#:G907 NIL) (|co| NIL) (#9=#:G908 NIL)
          (|ind2| #10=(|List| (|PositiveInteger|))) (|tmp| #1#) (|ind1| #10#)
          (|Xi| #1#) (|jt| (|Symbol|)) (#11=#:G905 NIL) (#12=#:G906 NIL)
          (|coeffs| (|List| (|JetBundleExpression| JB1)))
          (|dirs| (|List| JB1)))
         (SEQ
          (LETT |dirs| (SPADCALL |vf| (QREFELT $ 115))
                . #13=(|SYMANA;ncDetSys;LLJvfL;8|))
          (LETT |coeffs| (SPADCALL |vf| (QREFELT $ 116)) . #13#)
          (LETT |Xi| NIL . #13#) (LETT |tmp| NIL . #13#)
          (LETT |ind1| NIL . #13#) (LETT |ind2| NIL . #13#)
          (SEQ (LETT |co| NIL . #13#) (LETT #12# |coeffs| . #13#)
               (LETT |jv| NIL . #13#) (LETT #11# |dirs| . #13#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |jv| (CAR #11#) . #13#) NIL)
                     (ATOM #12#) (PROGN (LETT |co| (CAR #12#) . #13#) NIL))
                 (GO G191)))
               (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 117)) . #13#)
                    (EXIT
                     (COND
                      ((EQUAL |jt| '|Indep|)
                       (SEQ (LETT |Xi| (CONS |co| |Xi|) . #13#)
                            (EXIT
                             (LETT |ind1|
                                   (CONS (SPADCALL |jv| (QREFELT $ 118))
                                         |ind1|)
                                   . #13#))))
                      ((EQUAL |jt| '|Dep|)
                       (SEQ (LETT |tmp| (CONS |co| |tmp|) . #13#)
                            (EXIT
                             (LETT |ind2|
                                   (CONS (SPADCALL |jv| (QREFELT $ 118))
                                         |ind2|)
                                   . #13#))))
                      ('T
                       (|error|
                        "Only independent and dependent variables allowed")))))
               (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #13#))
                     . #13#)
               (GO G190) G191 (EXIT NIL))
          (LETT |j| (QREFELT $ 13) . #13#) (LETT |Eta| NIL . #13#)
          (SEQ (LETT |i| NIL . #13#) (LETT #9# |ind2| . #13#)
               (LETT |co| NIL . #13#) (LETT #8# |tmp| . #13#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |co| (CAR #8#) . #13#) NIL)
                     (ATOM #9#) (PROGN (LETT |i| (CAR #9#) . #13#) NIL))
                 (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |j| |i| (QREFELT $ 63))) (GO G191)))
                     (SEQ
                      (LETT |Eta| (CONS (|spadConstant| $ 119) |Eta|) . #13#)
                      (EXIT (LETT |j| (- |j| 1) . #13#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |Eta| (CONS |co| |Eta|) . #13#)
                (EXIT (LETT |j| (- |j| 1) . #13#)))
               (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #13#)) . #13#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (ZEROP |j|))
            (SEQ (LETT |i| 1 . #13#) (LETT #7# |j| . #13#) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |Eta| (CONS (|spadConstant| $ 119) |Eta|) . #13#)))
                 (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191 (EXIT NIL))))
          (LETT |isc| NIL . #13#) (LETT |ijb| NIL . #13#)
          (SEQ (LETT |j| 1 . #13#) (LETT #6# (QREFELT $ 13) . #13#)
               (LETT |e| NIL . #13#) (LETT #5# |Eta| . #13#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#) . #13#) NIL)
                     (|greater_SI| |j| #6#))
                 (GO G191)))
               (SEQ (LETT |cond| (SPADCALL |e| (QREFELT $ 120)) . #13#)
                    (LETT |jv| (|spadConstant| $ 23) . #13#)
                    (SEQ (LETT |i| NIL . #13#) (LETT #4# |ind1| . #13#)
                         (LETT |x| NIL . #13#) (LETT #3# |Xi| . #13#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |x| (CAR #3#) . #13#) NIL)
                               (ATOM #4#)
                               (PROGN (LETT |i| (CAR #4#) . #13#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |x| (QREFELT $ 121)))
                             (SEQ
                              (LETT |jv|
                                    (SPADCALL
                                     (PROG1 (LETT #2# |j| . #13#)
                                       (|check_subtype2| (> #2# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #2#))
                                     (LIST |i|) (QREFELT $ 122))
                                    . #13#)
                              (EXIT
                               (LETT |cond|
                                     (SPADCALL |cond|
                                               (SPADCALL |x|
                                                         (SPADCALL |jv|
                                                                   (QREFELT $
                                                                            34))
                                                         (QREFELT $ 123))
                                               (QREFELT $ 124))
                                     . #13#)))))))
                         (LETT #3#
                               (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #13#))
                               . #13#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |jv| (QREFELT $ 125))
                       (|error| "cannot solve invariant surface condition"))
                      ('T
                       (SEQ (LETT |ijb| (CONS |jv| |ijb|) . #13#)
                            (EXIT (LETT |isc| (CONS |cond| |isc|) . #13#)))))))
               (LETT #5# (PROG1 (CDR #5#) (LETT |j| (|inc_SI| |j|) . #13#))
                     . #13#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |isc| |sys| (QREFELT $ 126))
                     (SPADCALL |ijb| |sjb| (QREFELT $ 127)) |vf|
                     (QREFELT $ 81)))))) 

(DECLAIM (NOTINLINE |SymmetryAnalysis;|)) 

(DEFUN |SymmetryAnalysis| (&REST #1=#:G932)
  (SPROG NIL
         (PROG (#2=#:G933)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SymmetryAnalysis|)
                                               '|domainEqualList|)
                    . #3=(|SymmetryAnalysis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SymmetryAnalysis;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SymmetryAnalysis|)))))))))) 

(DEFUN |SymmetryAnalysis;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G931 NIL) (|jv| NIL) (#2=#:G930 NIL) (#3=#:G929 NIL) (|i| NIL)
    (#4=#:G928 NIL) (#5=#:G927 NIL) (#6=#:G926 NIL) (#7=#:G925 NIL)
    (#8=#:G924 NIL) (#9=#:G719 NIL) (#10=#:G923 NIL) (#11=#:G922 NIL)
    (#12=#:G716 NIL) (#13=#:G921 NIL) (#14=#:G920 NIL) (|pv$| NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #15=(|SymmetryAnalysis|))
     (LETT DV$2 (|devaluate| |#2|) . #15#)
     (LETT DV$3 (|devaluate| |#3|) . #15#)
     (LETT |dv$| (LIST '|SymmetryAnalysis| DV$1 DV$2 DV$3) . #15#)
     (LETT $ (GETREFV 129) . #15#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #15#))
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
                 (LETT #14# NIL . #15#)
                 (SEQ (LETT |i| 1 . #15#) (LETT #13# (QREFELT $ 11) . #15#)
                      G190 (COND ((|greater_SI| |i| #13#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #12# |i| . #15#)
                                  (|check_subtype2| (> #12# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #12#))
                                (QREFELT $ 14))
                               #14#)
                              . #15#)))
                      (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                (PROGN
                 (LETT #11# NIL . #15#)
                 (SEQ (LETT |i| 1 . #15#) (LETT #10# (QREFELT $ 13) . #15#)
                      G190 (COND ((|greater_SI| |i| #10#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #9# |i| . #15#)
                                  (|check_subtype2| (> #9# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #9#))
                                (QREFELT $ 15))
                               #11#)
                              . #15#)))
                      (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                (QREFELT $ 17)))
     (QSETREFV $ 21
               (PROGN
                (LETT #8# NIL . #15#)
                (SEQ (LETT |jv| NIL . #15#) (LETT #7# (QREFELT $ 18) . #15#)
                     G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |jv| (CAR #7#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #8# (CONS (SPADCALL |jv| (QREFELT $ 20)) #8#)
                             . #15#)))
                     (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                     (EXIT (NREVERSE #8#)))))
     (QSETREFV $ 22 NIL)
     (COND
      ((QEQCAR |#2| 0)
       (COND
        ((SPADCALL (QREFELT $ 11) 1 (QREFELT $ 25))
         (SETELT $ 22
                 (PROGN
                  (LETT #6# NIL . #15#)
                  (SEQ (LETT |i| 1 . #15#) (LETT #5# (QREFELT $ 11) . #15#)
                       G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (SPADCALL (QCDR |#2|)
                                          (LIST (SPADCALL |i| (QREFELT $ 28)))
                                          (QREFELT $ 30))
                                #6#)
                               . #15#)))
                       (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))))
        ('T (SETELT $ 22 (LIST (QCDR |#2|))))))
      ('T (SETELT $ 22 (QCDR |#2|))))
     (COND
      ((QEQCAR |#3| 0)
       (COND
        ((SPADCALL (QREFELT $ 13) 1 (QREFELT $ 25))
         (SETELT $ 22
                 (SPADCALL (QREFELT $ 22)
                           (PROGN
                            (LETT #4# NIL . #15#)
                            (SEQ (LETT |i| 1 . #15#)
                                 (LETT #3# (QREFELT $ 13) . #15#) G190
                                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (SPADCALL (QCDR |#3|)
                                                    (LIST
                                                     (SPADCALL |i|
                                                               (QREFELT $ 28)))
                                                    (QREFELT $ 30))
                                          #4#)
                                         . #15#)))
                                 (LETT |i| (|inc_SI| |i|) . #15#) (GO G190)
                                 G191 (EXIT (NREVERSE #4#))))
                           (QREFELT $ 32))))
        ('T
         (SETELT $ 22
                 (SPADCALL (QREFELT $ 22) (LIST (QCDR |#3|))
                           (QREFELT $ 32))))))
      ('T (SETELT $ 22 (SPADCALL (QREFELT $ 22) (QCDR |#3|) (QREFELT $ 32)))))
     (QSETREFV $ 35
               (PROGN
                (LETT #2# NIL . #15#)
                (SEQ (LETT |jv| NIL . #15#) (LETT #1# (QREFELT $ 18) . #15#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |jv| (QREFELT $ 34)) #2#)
                             . #15#)))
                     (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))
     $)))) 

(MAKEPROP '|SymmetryAnalysis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |numIndVar|) '|nn|
              (4 . |numDepVar|) '|mm| (8 . X) (13 . U) (|List| 6)
              (18 . |concat!|) '|vars| (|Symbol|) (24 . |name|) '|indVars|
              '|depVars| (29 . |One|) (|Boolean|) (33 . >) (|OutputForm|)
              (|NonNegativeInteger|) (39 . |coerce|) (|List| 26)
              (44 . |superscript|) (|List| 19) (50 . |append|)
              (|JetBundleExpression| 6) (56 . |coerce|) '|JVars|
              (|JetVectorField| 6 33) (61 . |Zero|) (|Integer|) (65 . |qelt|)
              (|List| $) (71 . |function|) (78 . |diffX|) (83 . *) (89 . +)
              (95 . |diffU|) |SYMANA;ansatz;Jvf;1| (|List| 71) (100 . |tower|)
              (|BasicOperator|) (|Kernel| 33) (105 . |operator|) (110 . |has?|)
              (|Union| (|None|) '"failed") (116 . |property|) (|List| 33)
              (122 . |argument|) (127 . |second|) (132 . |retract|)
              (|JetBundleSymAna| 6 (NRTEVAL (QREFELT $ 7))
                                 (NRTEVAL (QREFELT $ 8)))
              (137 . X) (|Expression| 38) (142 . |coerce|) (147 . >)
              (153 . |coerce|) (158 . |kernels|) (163 . |name|)
              (168 . |position|) (174 . |minIndex|) (179 . >) (185 . U)
              (|Kernel| $) (190 . |coerce|) (195 . |coerce|) (|List| 9)
              (200 . |Pr|) (206 . |eval|) (|JetBundleExpression| 59)
              (213 . |coerce|) |SYMANA;transform;JbeJbe;2| (218 . |leadingDer|)
              |SYMANA;detSys;LLJvfL;5| (|List| 77) |SYMANA;detSys;LL;3|
              |SYMANA;detSys;LJvfL;4| (|Union| $ '"failed") (223 . |solveFor|)
              (229 . =) (|Equation| 33) (235 . =) (241 . |order|) (246 . |max|)
              (252 . |max|) (|Character|) (258 . |max|) (264 . |max|)
              (|Mapping| 27 27 27) (|List| 27) (270 . |reduce|)
              (277 . |prolong|) (283 . |eval|) (|List| (|Equation| $))
              (289 . |eval|) (|SparseMultivariatePolynomial| 61 6)
              (295 . |numerJP|) (|List| 61) (300 . |coefficients|)
              (305 . |append|) (|Mapping| 105 105 105) (|List| 105)
              (311 . |reduce|) (318 . |coerce|) |SYMANA;ncDetSys;LLJvfL;8|
              |SYMANA;ncDetSys;LL;6| |SYMANA;ncDetSys;LJvfL;7|
              (323 . |directions|) (328 . |coefficients|) (333 . |type|)
              (338 . |index|) (343 . |Zero|) (347 . -) (352 . |zero?|)
              (357 . |Pr|) (363 . *) (369 . +) (375 . |one?|) (380 . |append|)
              (386 . |append|)
              (|List|
               (|JetBundleLinearFunction| 59 (|JetBundleXExpression| 59))))
           '#(|transform| 392 |ncDetSys| 397 |linearize| 415 |detSysNS| 420
              |detSys| 431 |ansatz| 449)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 128
                                                 '(0 6 9 10 0 6 9 12 1 6 0 9 14
                                                   1 6 0 9 15 2 16 0 0 0 17 1 6
                                                   19 0 20 0 6 0 23 2 9 24 0 0
                                                   25 1 27 26 0 28 2 19 0 0 29
                                                   30 2 31 0 0 0 32 1 33 0 6 34
                                                   0 36 0 37 2 31 19 0 38 39 3
                                                   33 0 19 40 27 41 1 36 0 9 42
                                                   2 36 0 33 0 43 2 36 0 0 0 44
                                                   1 36 0 9 45 1 33 47 0 48 1
                                                   50 49 0 51 2 49 24 0 19 52 2
                                                   49 53 0 19 54 1 50 55 0 56 1
                                                   55 33 0 57 1 33 38 0 58 1 59
                                                   0 9 60 1 59 61 0 62 2 38 24
                                                   0 0 63 1 6 61 0 64 1 61 47 0
                                                   65 1 49 19 0 66 2 31 38 19 0
                                                   67 1 31 38 0 68 2 27 24 0 0
                                                   69 1 59 0 9 70 1 33 0 71 72
                                                   1 33 61 0 73 2 59 0 9 74 75
                                                   3 61 0 0 47 40 76 1 77 0 61
                                                   78 1 33 6 0 80 2 33 85 0 6
                                                   86 2 33 24 0 0 87 2 88 0 33
                                                   33 89 1 33 27 0 90 2 19 0 0
                                                   0 91 2 6 0 0 0 92 2 93 0 0 0
                                                   94 2 27 0 0 0 95 3 97 27 96
                                                   0 27 98 2 36 0 0 27 99 2 36
                                                   33 0 33 100 2 33 0 0 101 102
                                                   1 33 103 0 104 1 103 105 0
                                                   106 2 105 0 0 0 107 3 109
                                                   105 108 0 105 110 1 33 0 61
                                                   111 1 36 16 0 115 1 36 55 0
                                                   116 1 6 19 0 117 1 6 9 0 118
                                                   0 33 0 119 1 33 0 0 120 1 33
                                                   24 0 121 2 6 0 9 74 122 2 33
                                                   0 0 0 123 2 33 0 0 0 124 1 6
                                                   24 0 125 2 55 0 0 0 126 2 16
                                                   0 0 0 127 1 0 77 33 79 2 0
                                                   55 55 36 114 1 0 82 55 113 3
                                                   0 55 55 16 36 112 1 0 128 82
                                                   1 2 0 55 55 36 1 1 0 82 55 1
                                                   2 0 55 55 36 84 1 0 82 55 83
                                                   3 0 55 55 16 36 81 0 0 36
                                                   46)))))
           '|lookupComplete|)) 
