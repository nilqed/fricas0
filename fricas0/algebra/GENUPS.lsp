
(SDEFUN |GENUPS;genStream|
        ((|f| |Mapping| FE (|Integer|)) (|n| |Integer|) ($ |Stream| FE))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUPS;genStream!0| (VECTOR $ |f| |n|))
                         (QREFELT $ 16)))) 

(SDEFUN |GENUPS;genStream!0| (($$ NIL))
        (PROG (|n| |f| $)
          (LETT |n| (QREFELT $$ 2) . #1=(|GENUPS;genStream|))
          (LETT |f| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |n| |f|)
                      (|GENUPS;genStream| |f|
                       (SPADCALL |n| (|spadConstant| $ 11) (QREFELT $ 12)) $)
                      (QREFELT $ 14)))))) 

(SDEFUN |GENUPS;genFiniteStream|
        ((|f| |Mapping| FE (|Integer|)) (|n| |Integer|) (|m| |Integer|)
         ($ |Stream| FE))
        (COND ((SPADCALL |n| |m| (QREFELT $ 18)) (SPADCALL (QREFELT $ 19)))
              ('T (|GENUPS;genFiniteStream0| |f| |n| |m| $)))) 

(SDEFUN |GENUPS;genFiniteStream0|
        ((|f| |Mapping| FE (|Integer|)) (|n| |Integer|) (|m| |Integer|)
         ($ |Stream| FE))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS;genFiniteStream0!0| (VECTOR |f| $ |m| |n|))
                (QREFELT $ 16)))) 

(SDEFUN |GENUPS;genFiniteStream0!0| (($$ NIL))
        (PROG (|n| |m| $ |f|)
          (LETT |n| (QREFELT $$ 3) . #1=(|GENUPS;genFiniteStream0|))
          (LETT |m| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |n| |m| (QREFELT $ 20))
              (SPADCALL (SPADCALL |n| |f|) (SPADCALL (QREFELT $ 19))
                        (QREFELT $ 14)))
             ('T
              (SPADCALL (SPADCALL |n| |f|)
                        (|GENUPS;genFiniteStream0| |f|
                         (SPADCALL |n| (|spadConstant| $ 11) (QREFELT $ 12))
                         |m| $)
                        (QREFELT $ 14)))))))) 

(SDEFUN |GENUPS;taylor;MEA;4|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE) ($ |Any|))
        (SPROG
         ((|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 22)) (QREFELT $ 24))
                . #1=(|GENUPS;taylor;MEA;4|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            ('T
             (SEQ (LETT |x| (QCDR |xx|) . #1#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 25)) . #1#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (|GENUPS;genStream| |f| 0 $)
                              (|compiledLookupCheck| '|series|
                                                     (LIST '$
                                                           (LIST '|Stream|
                                                                 (|devaluate|
                                                                  (ELT $ 7))))
                                                     (|UnivariateTaylorSeries|
                                                      (ELT $ 7) |x| |a|)))
                    (|compiledLookupCheck| '|coerce|
                                           (LIST (LIST '|Any|)
                                                 (LIST
                                                  '|UnivariateTaylorSeries|
                                                  (|devaluate| (ELT $ 7)) |x|
                                                  |a|))
                                           (|AnyFunctions1|
                                            (|UnivariateTaylorSeries| (ELT $ 7)
                                                                      |x|
                                                                      |a|)))))))))))) 

(SDEFUN |GENUPS;taylor;FESEA;5|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE) ($ |Any|))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUPS;taylor;FESEA;5!0| (VECTOR $ |n| |an|))
                         |eq| (QREFELT $ 28)))) 

(SDEFUN |GENUPS;taylor;FESEA;5!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2) . #1=(|GENUPS;taylor;FESEA;5|))
          (LETT |n| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 30))
                                (SPADCALL |i| (QREFELT $ 31)) (QREFELT $ 33))
                      (QREFELT $ 35)))))) 

(SDEFUN |GENUPS;taylor;MEUsA;6|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|NonNegativeInteger|)) ($ |Any|))
        (SPROG
         ((|uts| (|UnivariateTaylorSeries| FE |x| |a|))
          (|n0| #1=(|NonNegativeInteger|)) (|n1| #2=(|NonNegativeInteger|))
          (|#G21| #1#) (|#G20| #2#) (|a| (FE)) (|x| (|Symbol|))
          (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 22)) (QREFELT $ 24))
                . #3=(|GENUPS;taylor;MEUsA;6|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            (#4='T
             (SEQ (LETT |x| (QCDR |xx|) . #3#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 25)) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |seg| (QREFELT $ 38))
                     (SEQ (LETT |n0| (SPADCALL |seg| (QREFELT $ 40)) . #3#)
                          (LETT |n1| (SPADCALL |seg| (QREFELT $ 41)) . #3#)
                          (COND
                           ((< |n1| |n0|)
                            (PROGN
                             (LETT |#G20| |n1| . #3#)
                             (LETT |#G21| |n0| . #3#)
                             (LETT |n0| |#G20| . #3#)
                             (LETT |n1| |#G21| . #3#))))
                          (LETT |uts|
                                (SPADCALL
                                 (|GENUPS;genFiniteStream| |f| |n0| |n1| $)
                                 (|compiledLookupCheck| '|series|
                                                        (LIST '$
                                                              (LIST '|Stream|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))
                                                        (|UnivariateTaylorSeries|
                                                         (ELT $ 7) |x| |a|)))
                                . #3#)
                          (LETT |uts|
                                (SPADCALL |uts|
                                          (SPADCALL (|spadConstant| $ 9) |n0|
                                                    (|compiledLookupCheck|
                                                     '|monomial|
                                                     (LIST '$
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     (|UnivariateTaylorSeries|
                                                      (ELT $ 7) |x| |a|)))
                                          (|compiledLookupCheck| '*
                                                                 (LIST '$ '$
                                                                       '$)
                                                                 (|UnivariateTaylorSeries|
                                                                  (ELT $ 7) |x|
                                                                  |a|)))
                                . #3#)
                          (EXIT
                           (SPADCALL |uts|
                                     (|compiledLookupCheck| '|coerce|
                                                            (LIST (LIST '|Any|)
                                                                  (LIST
                                                                   '|UnivariateTaylorSeries|
                                                                   (|devaluate|
                                                                    (ELT $ 7))
                                                                   |x| |a|))
                                                            (|AnyFunctions1|
                                                             (|UnivariateTaylorSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))))))
                    (#4#
                     (SEQ (LETT |n0| (SPADCALL |seg| (QREFELT $ 40)) . #3#)
                          (LETT |uts|
                                (SPADCALL (|GENUPS;genStream| |f| |n0| $)
                                          (|compiledLookupCheck| '|series|
                                                                 (LIST '$
                                                                       (LIST
                                                                        '|Stream|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              7))))
                                                                 (|UnivariateTaylorSeries|
                                                                  (ELT $ 7) |x|
                                                                  |a|)))
                                . #3#)
                          (LETT |uts|
                                (SPADCALL |uts|
                                          (SPADCALL (|spadConstant| $ 9) |n0|
                                                    (|compiledLookupCheck|
                                                     '|monomial|
                                                     (LIST '$
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     (|UnivariateTaylorSeries|
                                                      (ELT $ 7) |x| |a|)))
                                          (|compiledLookupCheck| '*
                                                                 (LIST '$ '$
                                                                       '$)
                                                                 (|UnivariateTaylorSeries|
                                                                  (ELT $ 7) |x|
                                                                  |a|)))
                                . #3#)
                          (EXIT
                           (SPADCALL |uts|
                                     (|compiledLookupCheck| '|coerce|
                                                            (LIST (LIST '|Any|)
                                                                  (LIST
                                                                   '|UnivariateTaylorSeries|
                                                                   (|devaluate|
                                                                    (ELT $ 7))
                                                                   |x| |a|))
                                                            (|AnyFunctions1|
                                                             (|UnivariateTaylorSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))))))))))))))) 

(SDEFUN |GENUPS;taylor;FESEUsA;7|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|NonNegativeInteger|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS;taylor;FESEUsA;7!0| (VECTOR $ |n| |an|)) |eq|
                |seg| (QREFELT $ 42)))) 

(SDEFUN |GENUPS;taylor;FESEUsA;7!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2) . #1=(|GENUPS;taylor;FESEUsA;7|))
          (LETT |n| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 30))
                                (SPADCALL |i| (QREFELT $ 31)) (QREFELT $ 33))
                      (QREFELT $ 35)))))) 

(SDEFUN |GENUPS;laurent;MEUsA;8|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG
         ((|uts| (|UnivariateTaylorSeries| FE |x| |a|)) (|n0| #1=(|Integer|))
          (|n1| #2=(|Integer|)) (|#G31| #1#) (|#G30| #2#) (|a| (FE))
          (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 22)) (QREFELT $ 24))
                . #3=(|GENUPS;laurent;MEUsA;8|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "taylor: left hand side must be a variable"))
            (#4='T
             (SEQ (LETT |x| (QCDR |xx|) . #3#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 25)) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |seg| (QREFELT $ 45))
                     (SEQ (LETT |n0| (SPADCALL |seg| (QREFELT $ 46)) . #3#)
                          (LETT |n1| (SPADCALL |seg| (QREFELT $ 47)) . #3#)
                          (COND
                           ((< |n1| |n0|)
                            (PROGN
                             (LETT |#G30| |n1| . #3#)
                             (LETT |#G31| |n0| . #3#)
                             (LETT |n0| |#G30| . #3#)
                             (LETT |n1| |#G31| . #3#))))
                          (LETT |uts|
                                (SPADCALL
                                 (|GENUPS;genFiniteStream| |f| |n0| |n1| $)
                                 (|compiledLookupCheck| '|series|
                                                        (LIST '$
                                                              (LIST '|Stream|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))
                                                        (|UnivariateTaylorSeries|
                                                         (ELT $ 7) |x| |a|)))
                                . #3#)
                          (EXIT
                           (SPADCALL
                            (SPADCALL |n0| |uts|
                                      (|compiledLookupCheck| '|laurent|
                                                             (LIST '$
                                                                   (LIST
                                                                    '|Integer|)
                                                                   (LIST
                                                                    '|UnivariateTaylorSeries|
                                                                    (|devaluate|
                                                                     (ELT $ 7))
                                                                    |x| |a|))
                                                             (|UnivariateLaurentSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))
                            (|compiledLookupCheck| '|coerce|
                                                   (LIST (LIST '|Any|)
                                                         (LIST
                                                          '|UnivariateLaurentSeries|
                                                          (|devaluate|
                                                           (ELT $ 7))
                                                          |x| |a|))
                                                   (|AnyFunctions1|
                                                    (|UnivariateLaurentSeries|
                                                     (ELT $ 7) |x| |a|)))))))
                    (#4#
                     (SEQ (LETT |n0| (SPADCALL |seg| (QREFELT $ 46)) . #3#)
                          (LETT |uts|
                                (SPADCALL (|GENUPS;genStream| |f| |n0| $)
                                          (|compiledLookupCheck| '|series|
                                                                 (LIST '$
                                                                       (LIST
                                                                        '|Stream|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              7))))
                                                                 (|UnivariateTaylorSeries|
                                                                  (ELT $ 7) |x|
                                                                  |a|)))
                                . #3#)
                          (EXIT
                           (SPADCALL
                            (SPADCALL |n0| |uts|
                                      (|compiledLookupCheck| '|laurent|
                                                             (LIST '$
                                                                   (LIST
                                                                    '|Integer|)
                                                                   (LIST
                                                                    '|UnivariateTaylorSeries|
                                                                    (|devaluate|
                                                                     (ELT $ 7))
                                                                    |x| |a|))
                                                             (|UnivariateLaurentSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))
                            (|compiledLookupCheck| '|coerce|
                                                   (LIST (LIST '|Any|)
                                                         (LIST
                                                          '|UnivariateLaurentSeries|
                                                          (|devaluate|
                                                           (ELT $ 7))
                                                          |x| |a|))
                                                   (|AnyFunctions1|
                                                    (|UnivariateLaurentSeries|
                                                     (ELT $ 7) |x|
                                                     |a|)))))))))))))))) 

(SDEFUN |GENUPS;laurent;FESEUsA;9|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS;laurent;FESEUsA;9!0| (VECTOR $ |n| |an|)) |eq|
                |seg| (QREFELT $ 48)))) 

(SDEFUN |GENUPS;laurent;FESEUsA;9!0| ((|i| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2) . #1=(|GENUPS;laurent;FESEUsA;9|))
          (LETT |n| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 30))
                                (SPADCALL |i| (QREFELT $ 31)) (QREFELT $ 33))
                      (QREFELT $ 35)))))) 

(SDEFUN |GENUPS;modifyFcn|
        ((|f| |Mapping| FE (|Fraction| (|Integer|))) (|n0| |Integer|)
         (|nn| |Integer|) (|q| |Integer|) (|m| |Integer|) ($ FE))
        (COND
         ((ZEROP (REM (- |m| |n0|) |nn|))
          (SPADCALL (SPADCALL |m| |q| (QREFELT $ 51)) |f|))
         ('T (|spadConstant| $ 52)))) 

(SDEFUN |GENUPS;puiseux;MEUsFA;11|
        ((|f| |Mapping| FE (|Fraction| (|Integer|))) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPROG
         ((|uls| (|UnivariateLaurentSeries| FE |x| |a|)) (|ulsUnion| (|Any|))
          (|nn| #1=(|Integer|)) (|n0| #1#) (|q| (|Integer|))
          (|q2| #2=(|Integer|)) (|p2| #3=(|Integer|)) (|q0| #2#) (|p0| #3#)
          (|r0| #4=(|Fraction| (|Integer|))) (|n1| #1#) (|q1| #2#) (|p1| #3#)
          (|r1| #5=(|Fraction| (|Integer|))) (|#G47| #4#) (|#G46| #5#)
          (|a| (FE)) (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 22)) (QREFELT $ 24))
                . #6=(|GENUPS;puiseux;MEUsFA;11|))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "puiseux: left hand side must be a variable"))
            (#7='T
             (SEQ (LETT |x| (QCDR |xx|) . #6#)
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 25)) . #6#)
                  (COND
                   ((NULL (SPADCALL |r| (QREFELT $ 53)))
                    (EXIT
                     (|error| "puiseux: last argument must be positive"))))
                  (EXIT
                   (COND
                    ((SPADCALL |seg| (QREFELT $ 55))
                     (SEQ (LETT |r0| (SPADCALL |seg| (QREFELT $ 56)) . #6#)
                          (LETT |r1| (SPADCALL |seg| (QREFELT $ 57)) . #6#)
                          (COND
                           ((SPADCALL |r1| |r0| (QREFELT $ 58))
                            (PROGN
                             (LETT |#G46| |r1| . #6#)
                             (LETT |#G47| |r0| . #6#)
                             (LETT |r0| |#G46| . #6#)
                             (LETT |r1| |#G47| . #6#))))
                          (LETT |p0| (SPADCALL |r0| (QREFELT $ 59)) . #6#)
                          (LETT |q0| (SPADCALL |r0| (QREFELT $ 60)) . #6#)
                          (LETT |p1| (SPADCALL |r1| (QREFELT $ 59)) . #6#)
                          (LETT |q1| (SPADCALL |r1| (QREFELT $ 60)) . #6#)
                          (LETT |p2| (SPADCALL |r| (QREFELT $ 59)) . #6#)
                          (LETT |q2| (SPADCALL |r| (QREFELT $ 60)) . #6#)
                          (LETT |q|
                                (SPADCALL (SPADCALL |q0| |q1| (QREFELT $ 61))
                                          |q2| (QREFELT $ 61))
                                . #6#)
                          (LETT |n0| (* |p0| (QUOTIENT2 |q| |q0|)) . #6#)
                          (LETT |n1| (* |p1| (QUOTIENT2 |q| |q1|)) . #6#)
                          (LETT |nn| (* |p2| (QUOTIENT2 |q| |q2|)) . #6#)
                          (LETT |ulsUnion|
                                (SPADCALL
                                 (CONS #'|GENUPS;puiseux;MEUsFA;11!0|
                                       (VECTOR $ |q| |nn| |n0| |f|))
                                 |eq| (SPADCALL |n0| |n1| (QREFELT $ 62))
                                 (QREFELT $ 48))
                                . #6#)
                          (LETT |uls|
                                (SPADCALL |ulsUnion|
                                          (|compiledLookupCheck| '|retract|
                                                                 (LIST
                                                                  (LIST
                                                                   '|UnivariateLaurentSeries|
                                                                   (|devaluate|
                                                                    (ELT $ 7))
                                                                   |x| |a|)
                                                                  (LIST
                                                                   '|Any|))
                                                                 (|AnyFunctions1|
                                                                  (|UnivariateLaurentSeries|
                                                                   (ELT $ 7)
                                                                   |x| |a|))))
                                . #6#)
                          (EXIT
                           (SPADCALL
                            (SPADCALL (SPADCALL 1 |q| (QREFELT $ 51)) |uls|
                                      (|compiledLookupCheck| '|puiseux|
                                                             (LIST '$
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|Integer|))
                                                                   (LIST
                                                                    '|UnivariateLaurentSeries|
                                                                    (|devaluate|
                                                                     (ELT $ 7))
                                                                    |x| |a|))
                                                             (|UnivariatePuiseuxSeries|
                                                              (ELT $ 7) |x|
                                                              |a|)))
                            (|compiledLookupCheck| '|coerce|
                                                   (LIST (LIST '|Any|)
                                                         (LIST
                                                          '|UnivariatePuiseuxSeries|
                                                          (|devaluate|
                                                           (ELT $ 7))
                                                          |x| |a|))
                                                   (|AnyFunctions1|
                                                    (|UnivariatePuiseuxSeries|
                                                     (ELT $ 7) |x| |a|)))))))
                    (#7#
                     (SEQ
                      (LETT |p0|
                            (SPADCALL
                             (LETT |r0| (SPADCALL |seg| (QREFELT $ 56)) . #6#)
                             (QREFELT $ 59))
                            . #6#)
                      (LETT |q0| (SPADCALL |r0| (QREFELT $ 60)) . #6#)
                      (LETT |p2| (SPADCALL |r| (QREFELT $ 59)) . #6#)
                      (LETT |q2| (SPADCALL |r| (QREFELT $ 60)) . #6#)
                      (LETT |q| (SPADCALL |q0| |q2| (QREFELT $ 61)) . #6#)
                      (LETT |n0| (* |p0| (QUOTIENT2 |q| |q0|)) . #6#)
                      (LETT |nn| (* |p2| (QUOTIENT2 |q| |q2|)) . #6#)
                      (LETT |ulsUnion|
                            (SPADCALL
                             (CONS #'|GENUPS;puiseux;MEUsFA;11!1|
                                   (VECTOR $ |q| |nn| |n0| |f|))
                             |eq| (SPADCALL |n0| (QREFELT $ 63))
                             (QREFELT $ 48))
                            . #6#)
                      (LETT |uls|
                            (SPADCALL |ulsUnion|
                                      (|compiledLookupCheck| '|retract|
                                                             (LIST
                                                              (LIST
                                                               '|UnivariateLaurentSeries|
                                                               (|devaluate|
                                                                (ELT $ 7))
                                                               |x| |a|)
                                                              (LIST '|Any|))
                                                             (|AnyFunctions1|
                                                              (|UnivariateLaurentSeries|
                                                               (ELT $ 7) |x|
                                                               |a|))))
                            . #6#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 |q| (QREFELT $ 51)) |uls|
                                  (|compiledLookupCheck| '|puiseux|
                                                         (LIST '$
                                                               (LIST
                                                                '|Fraction|
                                                                (LIST
                                                                 '|Integer|))
                                                               (LIST
                                                                '|UnivariateLaurentSeries|
                                                                (|devaluate|
                                                                 (ELT $ 7))
                                                                |x| |a|))
                                                         (|UnivariatePuiseuxSeries|
                                                          (ELT $ 7) |x| |a|)))
                        (|compiledLookupCheck| '|coerce|
                                               (LIST (LIST '|Any|)
                                                     (LIST
                                                      '|UnivariatePuiseuxSeries|
                                                      (|devaluate| (ELT $ 7))
                                                      |x| |a|))
                                               (|AnyFunctions1|
                                                (|UnivariatePuiseuxSeries|
                                                 (ELT $ 7) |x|
                                                 |a|)))))))))))))))) 

(SDEFUN |GENUPS;puiseux;MEUsFA;11!1| ((|i| NIL) ($$ NIL))
        (PROG (|f| |n0| |nn| |q| $)
          (LETT |f| (QREFELT $$ 4) . #1=(|GENUPS;puiseux;MEUsFA;11|))
          (LETT |n0| (QREFELT $$ 3) . #1#)
          (LETT |nn| (QREFELT $$ 2) . #1#)
          (LETT |q| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GENUPS;modifyFcn| |f| |n0| |nn| |q| |i| $))))) 

(SDEFUN |GENUPS;puiseux;MEUsFA;11!0| ((|i| NIL) ($$ NIL))
        (PROG (|f| |n0| |nn| |q| $)
          (LETT |f| (QREFELT $$ 4) . #1=(|GENUPS;puiseux;MEUsFA;11|))
          (LETT |n0| (QREFELT $$ 3) . #1#)
          (LETT |nn| (QREFELT $$ 2) . #1#)
          (LETT |q| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GENUPS;modifyFcn| |f| |n0| |nn| |q| |i| $))))) 

(SDEFUN |GENUPS;puiseux;FESEUsFA;12|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|r0| |UniversalSegment| (|Fraction| (|Integer|)))
         (|m| |Fraction| (|Integer|)) ($ |Any|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUPS;puiseux;FESEUsFA;12!0| (VECTOR $ |n| |an|))
                |eq| |r0| |m| (QREFELT $ 65)))) 

(SDEFUN |GENUPS;puiseux;FESEUsFA;12!0| ((|r| NIL) ($$ NIL))
        (PROG (|an| |n| $)
          (LETT |an| (QREFELT $$ 2) . #1=(|GENUPS;puiseux;FESEUsFA;12|))
          (LETT |n| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |an|
                      (SPADCALL (SPADCALL |n| (QREFELT $ 30))
                                (SPADCALL |r| (QREFELT $ 66)) (QREFELT $ 33))
                      (QREFELT $ 35)))))) 

(SDEFUN |GENUPS;series;MEA;13|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE) ($ |Any|))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUPS;series;MEA;13!0| (VECTOR |f| $)) |eq|
                         (SPADCALL (|spadConstant| $ 69) (QREFELT $ 70))
                         (|spadConstant| $ 71) (QREFELT $ 65)))) 

(SDEFUN |GENUPS;series;MEA;13!0| ((|r| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|GENUPS;series;MEA;13|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |r| (QREFELT $ 59)) |f|))))) 

(SDEFUN |GENUPS;series;FESEA;14|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE) ($ |Any|))
        (SPADCALL |an| |n| |eq| (SPADCALL (|spadConstant| $ 69) (QREFELT $ 70))
                  (|spadConstant| $ 71) (QREFELT $ 67))) 

(SDEFUN |GENUPS;series;MEUsA;15|
        ((|f| |Mapping| FE (|Integer|)) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG ((|ratSeg| (|UniversalSegment| (|Fraction| (|Integer|)))))
               (SEQ
                (LETT |ratSeg| (SPADCALL (ELT $ 74) |seg| (QREFELT $ 77))
                      |GENUPS;series;MEUsA;15|)
                (EXIT
                 (SPADCALL (CONS #'|GENUPS;series;MEUsA;15!0| (VECTOR |f| $))
                           |eq| |ratSeg| (|spadConstant| $ 71)
                           (QREFELT $ 65)))))) 

(SDEFUN |GENUPS;series;MEUsA;15!0| ((|r| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|GENUPS;series;MEUsA;15|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |r| (QREFELT $ 59)) |f|))))) 

(SDEFUN |GENUPS;series;FESEUsA;16|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Integer|)) ($ |Any|))
        (SPROG ((|ratSeg| (|UniversalSegment| (|Fraction| (|Integer|)))))
               (SEQ
                (LETT |ratSeg| (SPADCALL (ELT $ 74) |seg| (QREFELT $ 77))
                      |GENUPS;series;FESEUsA;16|)
                (EXIT
                 (SPADCALL |an| |n| |eq| |ratSeg| (|spadConstant| $ 71)
                           (QREFELT $ 67)))))) 

(SDEFUN |GENUPS;series;MEUsFA;17|
        ((|f| |Mapping| FE (|Fraction| (|Integer|))) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPADCALL |f| |eq| |seg| |r| (QREFELT $ 65))) 

(SDEFUN |GENUPS;series;FESEUsFA;18|
        ((|an| FE) (|n| |Symbol|) (|eq| |Equation| FE)
         (|seg| |UniversalSegment| (|Fraction| (|Integer|)))
         (|r| |Fraction| (|Integer|)) ($ |Any|))
        (SPADCALL |an| |n| |eq| |seg| |r| (QREFELT $ 67))) 

(DECLAIM (NOTINLINE |GenerateUnivariatePowerSeries;|)) 

(DEFUN |GenerateUnivariatePowerSeries| (&REST #1=#:G784)
  (SPROG NIL
         (PROG (#2=#:G785)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenerateUnivariatePowerSeries|)
                                               '|domainEqualList|)
                    . #3=(|GenerateUnivariatePowerSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GenerateUnivariatePowerSeries;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GenerateUnivariatePowerSeries|)))))))))) 

(DEFUN |GenerateUnivariatePowerSeries;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GenerateUnivariatePowerSeries|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|GenerateUnivariatePowerSeries| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 82) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GenerateUnivariatePowerSeries|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GenerateUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|Integer|) (8 . |One|) (12 . +) (|Stream| 7)
              (18 . |concat|) (|Mapping| $) (24 . |delay|) (|Boolean|) (29 . >)
              (35 . |empty|) (39 . =) (|Equation| 7) (45 . |lhs|)
              (|Union| 29 '"failed") (50 . |retractIfCan|) (55 . |rhs|) (|Any|)
              (|Mapping| 7 10) |GENUPS;taylor;MEA;4| (|Symbol|) (60 . |coerce|)
              (65 . |coerce|) (70 . =) (76 . =) (|Equation| $) (82 . |eval|)
              |GENUPS;taylor;FESEA;5| (|UniversalSegment| 39) (88 . |hasHi|)
              (|NonNegativeInteger|) (93 . |lo|) (98 . |hi|)
              |GENUPS;taylor;MEUsA;6| |GENUPS;taylor;FESEUsA;7|
              (|UniversalSegment| 10) (103 . |hasHi|) (108 . |lo|) (113 . |hi|)
              |GENUPS;laurent;MEUsA;8| |GENUPS;laurent;FESEUsA;9|
              (|Fraction| 10) (118 . /) (124 . |Zero|) (128 . |positive?|)
              (|UniversalSegment| 50) (133 . |hasHi|) (138 . |lo|) (143 . |hi|)
              (148 . <) (154 . |numer|) (159 . |denom|) (164 . |lcm|)
              (170 . |segment|) (176 . |segment|) (|Mapping| 7 50)
              |GENUPS;puiseux;MEUsFA;11| (181 . |coerce|)
              |GENUPS;puiseux;FESEUsFA;12| (186 . |Zero|) (190 . |Zero|)
              (194 . |segment|) (199 . |One|) |GENUPS;series;MEA;13|
              |GENUPS;series;FESEA;14| (203 . |coerce|) (|Mapping| 50 10)
              (|UniversalSegmentFunctions2| 10 50) (208 . |map|)
              |GENUPS;series;MEUsA;15| |GENUPS;series;FESEUsA;16|
              |GENUPS;series;MEUsFA;17| |GENUPS;series;FESEUsFA;18|)
           '#(|taylor| 214 |series| 242 |puiseux| 287 |laurent| 304) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 81
                                                 '(0 6 0 8 0 7 0 9 0 10 0 11 2
                                                   10 0 0 0 12 2 13 0 7 0 14 1
                                                   13 0 15 16 2 10 17 0 0 18 0
                                                   13 0 19 2 10 17 0 0 20 1 21
                                                   7 0 22 1 7 23 0 24 1 21 7 0
                                                   25 1 7 0 29 30 1 7 0 10 31 2
                                                   7 17 0 0 32 2 21 0 7 7 33 2
                                                   7 0 0 34 35 1 37 17 0 38 1
                                                   37 39 0 40 1 37 39 0 41 1 44
                                                   17 0 45 1 44 10 0 46 1 44 10
                                                   0 47 2 50 0 10 10 51 0 7 0
                                                   52 1 50 17 0 53 1 54 17 0 55
                                                   1 54 50 0 56 1 54 50 0 57 2
                                                   50 17 0 0 58 1 50 10 0 59 1
                                                   50 10 0 60 2 10 0 0 0 61 2
                                                   44 0 10 10 62 1 44 0 10 63 1
                                                   7 0 50 66 0 6 0 68 0 50 0 69
                                                   1 54 0 50 70 0 50 0 71 1 50
                                                   0 10 74 2 76 54 75 44 77 2 0
                                                   26 27 21 28 3 0 26 27 21 37
                                                   42 3 0 26 7 29 21 36 4 0 26
                                                   7 29 21 37 43 3 0 26 7 29 21
                                                   73 2 0 26 27 21 72 4 0 26 7
                                                   29 21 44 79 3 0 26 27 21 44
                                                   78 5 0 26 7 29 21 54 50 81 4
                                                   0 26 64 21 54 50 80 4 0 26
                                                   64 21 54 50 65 5 0 26 7 29
                                                   21 54 50 67 3 0 26 27 21 44
                                                   48 4 0 26 7 29 21 44 49)))))
           '|lookupComplete|)) 
