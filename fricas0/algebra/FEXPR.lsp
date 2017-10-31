
(SDEFUN |FEXPR;mkEqn|
        ((|s1| |Symbol|) (|s2| |Symbol|) ($ |Equation| (|Expression| R)))
        (SPADCALL (SPADCALL |s2| (QREFELT $ 13))
                  (SPADCALL
                   (SPADCALL |s1| (SPADCALL |s2| (QREFELT $ 15))
                             (QREFELT $ 16))
                   (QREFELT $ 13))
                  (QREFELT $ 18))) 

(SDEFUN |FEXPR;fixUpSymbols|
        ((|u| |Expression| R) ($ |Union| (|Expression| R) "failed"))
        (SPROG
         ((#1=#:G761 NIL) (|i| NIL) (#2=#:G760 NIL) (|sym| (|Symbol|))
          (|syms| (|List| (|Symbol|))) (#3=#:G759 NIL) (|s| NIL)
          (#4=#:G758 NIL) (#5=#:G755 NIL) (#6=#:G756 NIL) (#7=#:G757 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |syms| (SPADCALL |u| (QREFELT $ 20))
                  . #8=(|FEXPR;fixUpSymbols|))
            (COND
             ((EQL (LENGTH (QREFELT $ 6)) 1)
              (COND
               ((ZEROP (LENGTH (QREFELT $ 7)))
                (EXIT
                 (COND ((NULL (EQL (LENGTH |syms|) 1)) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL |u|
                                        (SPADCALL
                                         (SPADCALL (|SPADfirst| |syms|)
                                                   (QREFELT $ 13))
                                         (SPADCALL (|SPADfirst| (QREFELT $ 6))
                                                   (QREFELT $ 13))
                                         (QREFELT $ 18))
                                        (QREFELT $ 23))))))))))
            (COND
             ((ZEROP (LENGTH (QREFELT $ 6)))
              (COND
               ((EQL (LENGTH (QREFELT $ 7)) 1)
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |s| NIL . #8#) (LETT #7# |syms| . #8#) G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |s| (CAR #7#) . #8#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |s| (QREFELT $ 25)))
                             (PROGN
                              (LETT #5#
                                    (PROGN
                                     (LETT #6# (CONS 1 "failed") . #8#)
                                     (GO #9=#:G754))
                                    . #8#)
                              (GO #10=#:G737))))))
                         (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL)))
                   #10# (EXIT #5#))
                  (COND
                   ((NULL
                     (EQL
                      (LENGTH
                       (LETT |syms|
                             (SPADCALL
                              (PROGN
                               (LETT #4# NIL . #8#)
                               (SEQ (LETT |s| NIL . #8#)
                                    (LETT #3# |syms| . #8#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |s| (CAR #3#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS (SPADCALL |s| (QREFELT $ 26))
                                                  #4#)
                                            . #8#)))
                                    (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 27))
                             . #8#))
                      1))
                    (EXIT (CONS 1 "failed"))))
                  (LETT |sym| (|SPADfirst| (QREFELT $ 7)) . #8#)
                  (EXIT
                   (CONS 0
                         (SPADCALL |u|
                                   (PROGN
                                    (LETT #2# NIL . #8#)
                                    (SEQ (LETT |i| NIL . #8#)
                                         (LETT #1#
                                               (SPADCALL |u| (QREFELT $ 20))
                                               . #8#)
                                         G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |i| (CAR #1#) . #8#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (|FEXPR;mkEqn| |sym| |i| $)
                                                  #2#)
                                                 . #8#)))
                                         (LETT #1# (CDR #1#) . #8#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 29))))))))))
            (EXIT (CONS 1 "failed"))))
          #9# (EXIT #6#)))) 

(SDEFUN |FEXPR;extraSymbols?| ((|u| |Expression| R) ($ |Boolean|))
        (SPROG
         ((|extras| (|List| (|Symbol|))) (|syms| (|List| (|Symbol|)))
          (#1=#:G766 NIL) (|v| NIL) (#2=#:G765 NIL))
         (SEQ
          (LETT |syms|
                (PROGN
                 (LETT #2# NIL . #3=(|FEXPR;extraSymbols?|))
                 (SEQ (LETT |v| NIL . #3#)
                      (LETT #1# (SPADCALL |u| (QREFELT $ 20)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 26)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |extras|
                (SPADCALL |syms|
                          (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 30))
                          (QREFELT $ 31))
                . #3#)
          (EXIT (NULL (NULL |extras|)))))) 

(SDEFUN |FEXPR;checkSymbols| ((|u| |Expression| R) ($ |Expression| R))
        (SPROG
         ((#1=#:G779 NIL) (|v| NIL) (#2=#:G778 NIL)
          (|m| (|Union| (|Expression| R) "failed"))
          (|extras| (|List| (|Symbol|))) (|syms| (|List| (|Symbol|)))
          (#3=#:G777 NIL) (#4=#:G776 NIL))
         (SEQ
          (LETT |syms|
                (PROGN
                 (LETT #4# NIL . #5=(|FEXPR;checkSymbols|))
                 (SEQ (LETT |v| NIL . #5#)
                      (LETT #3# (SPADCALL |u| (QREFELT $ 20)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 26)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |extras|
                (SPADCALL |syms|
                          (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 30))
                          (QREFELT $ 31))
                . #5#)
          (COND
           ((NULL (NULL |extras|))
            (EXIT
             (SEQ (LETT |m| (|FEXPR;fixUpSymbols| |u| $) . #5#)
                  (EXIT
                   (COND ((QEQCAR |m| 0) (QCDR |m|))
                         ('T
                          (|error|
                           (LIST '|mathprint|
                                 (LIST 'CONCAT "Extra symbols detected:"
                                       (SPADCALL
                                        (PROGN
                                         (LETT #2# NIL . #5#)
                                         (SEQ (LETT |v| NIL . #5#)
                                              (LETT #1# |extras| . #5#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |v| (CAR #1#) . #5#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |v|
                                                                 (QREFELT $
                                                                          33))
                                                       #2#)
                                                      . #5#)))
                                              (LETT #1# (CDR #1#) . #5#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        (QREFELT $ 36))))))))))))
          (EXIT |u|)))) 

(SDEFUN |FEXPR;notSymbol?| ((|v| |BasicOperator|) ($ |Boolean|))
        (SPROG ((|s| (|Symbol|)))
               (SEQ (LETT |s| (SPADCALL |v| (QREFELT $ 38)) |FEXPR;notSymbol?|)
                    (COND
                     ((SPADCALL |s| (QREFELT $ 6) (QREFELT $ 39)) (EXIT NIL))
                     ((SPADCALL |s| (QREFELT $ 25))
                      (COND
                       ((SPADCALL (SPADCALL |s| (QREFELT $ 26)) (QREFELT $ 7)
                                  (QREFELT $ 39))
                        (EXIT NIL)))))
                    (EXIT 'T)))) 

(SDEFUN |FEXPR;extraOperators?| ((|u| |Expression| R) ($ |Boolean|))
        (SPROG
         ((|extras| (|List| (|Symbol|)))
          (|fortranFunctions| (|List| (|Symbol|))) (|ops| (|List| (|Symbol|)))
          (#1=#:G789 NIL) (|v| NIL) (#2=#:G788 NIL))
         (SEQ
          (LETT |ops|
                (PROGN
                 (LETT #2# NIL . #3=(|FEXPR;extraOperators?|))
                 (SEQ (LETT |v| NIL . #3#)
                      (LETT #1# (SPADCALL |u| (QREFELT $ 41)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|FEXPR;notSymbol?| |v| $)
                          (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 38)) #2#)
                                . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (COND
           ((QREFELT $ 11)
            (LETT |fortranFunctions|
                  (SPADCALL (QREFELT $ 9) (QREFELT $ 10) (QREFELT $ 42))
                  . #3#))
           ('T (LETT |fortranFunctions| (QREFELT $ 9) . #3#)))
          (LETT |extras| (SPADCALL |ops| |fortranFunctions| (QREFELT $ 31))
                . #3#)
          (EXIT (NULL (NULL |extras|)))))) 

(SDEFUN |FEXPR;checkOperators| ((|u| |Expression| R) ($ |Void|))
        (SPROG
         ((#1=#:G801 NIL) (|v| NIL) (#2=#:G800 NIL)
          (|extras| (|List| (|Symbol|)))
          (|fortranFunctions| (|List| (|Symbol|))) (|ops| (|List| (|Symbol|)))
          (#3=#:G799 NIL) (#4=#:G798 NIL))
         (SEQ
          (LETT |ops|
                (PROGN
                 (LETT #4# NIL . #5=(|FEXPR;checkOperators|))
                 (SEQ (LETT |v| NIL . #5#)
                      (LETT #3# (SPADCALL |u| (QREFELT $ 41)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|FEXPR;notSymbol?| |v| $)
                          (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 38)) #4#)
                                . #5#)))))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (COND
           ((QREFELT $ 11)
            (LETT |fortranFunctions|
                  (SPADCALL (QREFELT $ 9) (QREFELT $ 10) (QREFELT $ 42))
                  . #5#))
           ('T (LETT |fortranFunctions| (QREFELT $ 9) . #5#)))
          (LETT |extras| (SPADCALL |ops| |fortranFunctions| (QREFELT $ 31))
                . #5#)
          (COND
           ((NULL (NULL |extras|))
            (EXIT
             (|error|
              (LIST '|mathprint|
                    (LIST 'CONCAT "Non FORTRAN-77 functions detected:"
                          (SPADCALL
                           (PROGN
                            (LETT #2# NIL . #5#)
                            (SEQ (LETT |v| NIL . #5#) (LETT #1# |extras| . #5#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |v| (QREFELT $ 33))
                                               #2#)
                                         . #5#)))
                                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 36))))))))
          (EXIT (SPADCALL (QREFELT $ 44)))))) 

(SDEFUN |FEXPR;checkForNagOperators| ((|u| |Expression| R) ($ $))
        (SPROG
         ((|piSub| (|Equation| (|Expression| R))) (|piOp| (|BasicOperator|)))
         (SEQ
          (COND
           ((QREFELT $ 11)
            (SEQ
             (LETT |piOp| (SPADCALL 'X01AAF (QREFELT $ 45))
                   . #1=(|FEXPR;checkForNagOperators|))
             (LETT |piSub|
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 47)) (QREFELT $ 49))
                    (SPADCALL |piOp| (|spadConstant| $ 50) (QREFELT $ 51))
                    (QREFELT $ 18))
                   . #1#)
             (EXIT (SPADCALL |u| |piSub| (QREFELT $ 23)))))
           ('T |u|))))) 

(SDEFUN |FEXPR;retractIfCan;PU;9|
        ((|u| |Polynomial| (|Integer|)) ($ |Union| $ "failed"))
        (SPADCALL (SPADCALL |u| (QREFELT $ 54)) (QREFELT $ 56))) 

(SDEFUN |FEXPR;retract;P$;10| ((|u| |Polynomial| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL |u| (QREFELT $ 54)) (QREFELT $ 58))) 

(SDEFUN |FEXPR;retractIfCan;FU;11|
        ((|u| |Fraction| (|Polynomial| (|Integer|))) ($ |Union| $ "failed"))
        (SPADCALL (SPADCALL |u| (QREFELT $ 61)) (QREFELT $ 56))) 

(SDEFUN |FEXPR;retract;F$;12|
        ((|u| |Fraction| (|Polynomial| (|Integer|))) ($ $))
        (SPADCALL (SPADCALL |u| (QREFELT $ 61)) (QREFELT $ 58))) 

(SDEFUN |FEXPR;int2R| ((|u| |Integer|) ($ R)) (SPADCALL |u| (QREFELT $ 65))) 

(SDEFUN |FEXPR;retractIfCan;EU;14|
        ((|u| |Expression| (|Integer|)) ($ |Union| $ "failed"))
        (SPADCALL
         (SPADCALL (CONS (|function| |FEXPR;int2R|) $) |u| (QREFELT $ 68))
         (QREFELT $ 69))) 

(SDEFUN |FEXPR;retract;E$;15| ((|u| |Expression| (|Integer|)) ($ $))
        (SPADCALL
         (SPADCALL (CONS (|function| |FEXPR;int2R|) $) |u| (QREFELT $ 68))
         (QREFELT $ 70))) 

(SDEFUN |FEXPR;retractIfCan;PU;16|
        ((|u| |Polynomial| (|Float|)) ($ |Union| $ "failed"))
        (SPADCALL (SPADCALL |u| (QREFELT $ 73)) (QREFELT $ 74))) 

(SDEFUN |FEXPR;retract;P$;17| ((|u| |Polynomial| (|Float|)) ($ $))
        (SPADCALL (SPADCALL |u| (QREFELT $ 73)) (QREFELT $ 76))) 

(SDEFUN |FEXPR;retractIfCan;FU;18|
        ((|u| |Fraction| (|Polynomial| (|Float|))) ($ |Union| $ "failed"))
        (SPADCALL (SPADCALL |u| (QREFELT $ 79)) (QREFELT $ 74))) 

(SDEFUN |FEXPR;retract;F$;19| ((|u| |Fraction| (|Polynomial| (|Float|))) ($ $))
        (SPADCALL (SPADCALL |u| (QREFELT $ 79)) (QREFELT $ 76))) 

(SDEFUN |FEXPR;float2R| ((|u| |Float|) ($ R)) (SPADCALL |u| (QREFELT $ 83))) 

(SDEFUN |FEXPR;retractIfCan;EU;21|
        ((|u| |Expression| (|Float|)) ($ |Union| $ "failed"))
        (SPADCALL
         (SPADCALL (CONS (|function| |FEXPR;float2R|) $) |u| (QREFELT $ 86))
         (QREFELT $ 69))) 

(SDEFUN |FEXPR;retract;E$;22| ((|u| |Expression| (|Float|)) ($ $))
        (SPADCALL
         (SPADCALL (CONS (|function| |FEXPR;float2R|) $) |u| (QREFELT $ 86))
         (QREFELT $ 70))) 

(SDEFUN |FEXPR;useNagFunctions;B;23| (($ |Boolean|)) (QREFELT $ 11)) 

(SDEFUN |FEXPR;useNagFunctions;2B;24| ((|v| |Boolean|) ($ |Boolean|))
        (SPROG ((|old| (|Boolean|)))
               (SEQ (LETT |old| (QREFELT $ 11) |FEXPR;useNagFunctions;2B;24|)
                    (SETELT $ 11 |v|) (EXIT |old|)))) 

(SDEFUN |FEXPR;log10;2$;25| ((|x| $) ($ $))
        (SPADCALL (SPADCALL '|log10| (QREFELT $ 45)) |x| (QREFELT $ 89))) 

(SDEFUN |FEXPR;pi;$;26| (($ $))
        (SPADCALL (SPADCALL 'X01AAF (QREFELT $ 45)) (|spadConstant| $ 91)
                  (QREFELT $ 89))) 

(PUT '|FEXPR;coerce;$E;27| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |FEXPR;coerce;$E;27| ((|u| $) ($ |Expression| R)) |u|) 

(SDEFUN |FEXPR;retractIfCan;EU;28|
        ((|u| |Expression| R) ($ |Union| $ "failed"))
        (SPROG ((#1=#:G862 NIL) (|m| (|Union| (|Expression| R) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((|FEXPR;extraSymbols?| |u| $)
                    (SEQ
                     (LETT |m| (|FEXPR;fixUpSymbols| |u| $)
                           . #2=(|FEXPR;retractIfCan;EU;28|))
                     (EXIT
                      (COND
                       ((QEQCAR |m| 1)
                        (PROGN
                         (LETT #1# (CONS 1 "failed") . #2#)
                         (GO #3=#:G861)))
                       (#4='T (LETT |u| (QCDR |m|) . #2#)))))))
                  (EXIT
                   (COND ((|FEXPR;extraOperators?| |u| $) (CONS 1 "failed"))
                         (#4#
                          (CONS 0 (|FEXPR;checkForNagOperators| |u| $)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FEXPR;retract;E$;29| ((|u| |Expression| R) ($ $))
        (SEQ (LETT |u| (|FEXPR;checkSymbols| |u| $) |FEXPR;retract;E$;29|)
             (|FEXPR;checkOperators| |u| $)
             (EXIT (|FEXPR;checkForNagOperators| |u| $)))) 

(SDEFUN |FEXPR;retractIfCan;SU;30| ((|u| |Symbol|) ($ |Union| $ "failed"))
        (SEQ
         (COND
          ((NULL (SPADCALL |u| (QREFELT $ 6) (QREFELT $ 39)))
           (COND
            ((SPADCALL |u| (QREFELT $ 25))
             (COND
              ((NULL
                (SPADCALL (SPADCALL |u| (QREFELT $ 26)) (QREFELT $ 7)
                          (QREFELT $ 39)))
               (EXIT (CONS 1 #1="failed")))))
            ('T (EXIT (CONS 1 #1#))))))
         (EXIT (CONS 0 (SPADCALL |u| (QREFELT $ 13)))))) 

(SDEFUN |FEXPR;retract;S$;31| ((|u| |Symbol|) ($ $))
        (SPROG ((|res| (|Union| $ "failed")))
               (SEQ
                (LETT |res| (SPADCALL |u| (QREFELT $ 94))
                      |FEXPR;retract;S$;31|)
                (EXIT
                 (COND
                  ((QEQCAR |res| 1)
                   (|error|
                    (LIST '|mathprint|
                          (LIST 'CONCAT "Illegal Symbol Detected:" NIL))))
                  ('T (QCDR |res|))))))) 

(DECLAIM (NOTINLINE |FortranExpression;|)) 

(DEFUN |FortranExpression| (&REST #1=#:G889)
  (SPROG NIL
         (PROG (#2=#:G890)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FortranExpression|)
                                               '|domainEqualList|)
                    . #3=(|FortranExpression|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FortranExpression;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FortranExpression|)))))))))) 

(DEFUN |FortranExpression;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FortranExpression|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|FortranExpression| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 111) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|RetractableTo|
                                                               (|Float|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|FortranExpression|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 4))
          (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| $ 8))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9
                    '(|abs| |sqrt| |exp| |log| |log10| |sin| |cos| |tan| |asin|
                      |acos| |atan| |sinh| |cosh| |tanh| |nthRoot| |%power|))
          (QSETREFV $ 10 '(|pi| X01AAF))
          (QSETREFV $ 11 'T)
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 57
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;PU;9|) $))
             (QSETREFV $ 59
                       (CONS (|dispatchFunction| |FEXPR;retract;P$;10|) $))
             (QSETREFV $ 62
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;FU;11|)
                             $))
             (QSETREFV $ 63
                       (CONS (|dispatchFunction| |FEXPR;retract;F$;12|) $))
             (QSETREFV $ 56
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;EU;14|)
                             $))
             (QSETREFV $ 58
                       (CONS (|dispatchFunction| |FEXPR;retract;E$;15|) $)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 75
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;PU;16|)
                             $))
             (QSETREFV $ 77
                       (CONS (|dispatchFunction| |FEXPR;retract;P$;17|) $))
             (QSETREFV $ 80
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;FU;18|)
                             $))
             (QSETREFV $ 81
                       (CONS (|dispatchFunction| |FEXPR;retract;F$;19|) $))
             (QSETREFV $ 74
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;EU;21|)
                             $))
             (QSETREFV $ 76
                       (CONS (|dispatchFunction| |FEXPR;retract;E$;22|) $)))))
          $))) 

(MAKEPROP '|FortranExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|f77Functions| '|nagFunctions|
              '|useNagFunctionsFlag| (|Symbol|) (0 . |coerce|)
              (|Record| (|:| |sub| (|List| 34)) (|:| |sup| (|List| 34))
                        (|:| |presup| (|List| 34)) (|:| |presub| (|List| 34))
                        (|:| |args| (|List| 34)))
              (5 . |scripts|) (10 . |script|) (|Equation| 5) (16 . |equation|)
              (|List| 12) (22 . |variables|) (27 . |One|) (|Equation| $)
              (31 . |subst|) (|Boolean|) (37 . |scripted?|) (42 . |name|)
              (47 . |removeDuplicates!|) (|List| 22) (52 . |subst|)
              (58 . |setUnion|) (64 . |setDifference|) (|String|)
              (70 . |string|) (|OutputForm|) (|List| 32) (75 . |coerce|)
              (|BasicOperator|) (80 . |name|) (85 . |member?|) (|List| 37)
              (91 . |operators|) (96 . |append|) (|Void|) (102 . |void|)
              (106 . |operator|) (|Pi|) (111 . |pi|) (|PiCoercions| 8)
              (115 . |coerce|) (120 . |Zero|) (124 . |kernel|)
              (|Polynomial| 64) (|Expression| 64) (130 . |coerce|)
              (|Union| $ '"failed") (135 . |retractIfCan|)
              (140 . |retractIfCan|) (145 . |retract|) (150 . |retract|)
              (|Fraction| 52) (155 . |coerce|) (160 . |retractIfCan|)
              (165 . |retract|) (|Integer|) (170 . |coerce|) (|Mapping| 8 64)
              (|ExpressionFunctions2| 64 8) (175 . |map|)
              |FEXPR;retractIfCan;EU;28| |FEXPR;retract;E$;29|
              (|Polynomial| 82) (|Expression| 82) (181 . |coerce|)
              (186 . |retractIfCan|) (191 . |retractIfCan|) (196 . |retract|)
              (201 . |retract|) (|Fraction| 71) (206 . |coerce|)
              (211 . |retractIfCan|) (216 . |retract|) (|Float|)
              (221 . |coerce|) (|Mapping| 8 82) (|ExpressionFunctions2| 82 8)
              (226 . |map|) |FEXPR;useNagFunctions;B;23|
              |FEXPR;useNagFunctions;2B;24| (232 . |kernel|)
              |FEXPR;log10;2$;25| (238 . |Zero|) |FEXPR;pi;$;26|
              |FEXPR;coerce;$E;27| |FEXPR;retractIfCan;SU;30|
              |FEXPR;retract;S$;31| (|SparseUnivariatePolynomial| $)
              (|Kernel| $) (|NonNegativeInteger|) (|List| 98)
              (|Union| 8 '"failed") (|PositiveInteger|) (|Mapping| $ $)
              (|Mapping| $ 106) (|List| 103) (|List| 102) (|List| $)
              (|List| 97) (|Union| 97 '"failed") (|SingleInteger|)
              (|HashState|))
           '#(~= 242 |zero?| 248 |variables| 253 |useNagFunctions| 258 |tower|
              267 |tanh| 277 |tan| 282 |subtractIfCan| 287 |subst| 293 |sqrt|
              312 |smaller?| 317 |sinh| 323 |sin| 328 |sample| 333
              |retractIfCan| 337 |retract| 387 |recip| 437 |pi| 442 |paren| 446
              |opposite?| 456 |operators| 462 |operator| 467 |one?| 472 |odd?|
              477 |minPoly| 482 |map| 487 |mainKernel| 493 |log10| 498 |log|
              503 |latex| 508 |kernels| 513 |kernel| 523 |is?| 535 |height| 547
              |hashUpdate!| 552 |hash| 558 |freeOf?| 563 |exp| 575 |even?| 580
              |eval| 585 |elt| 681 |distribute| 777 |differentiate| 788
              |definingPolynomial| 814 |cosh| 819 |cos| 824 |coerce| 829
              |characteristic| 854 |box| 858 |belong?| 868 |atan| 873 |asin|
              878 |annihilate?| 883 |acos| 889 |abs| 894 ^ 899 |Zero| 911 |One|
              915 D 919 = 945 - 951 + 962 * 968)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|Algebra&| |PartialDifferentialRing&| |Module&| NIL |Ring&| NIL
                NIL NIL |Rng&| |AbelianGroup&| NIL NIL |ExpressionSpace&|
                |Monoid&| NIL |AbelianMonoid&| NIL |SemiGroup&|
                |AbelianSemiGroup&| |SetCategory&| |Evalable&| |RetractableTo&|
                NIL |BasicType&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL)
             (CONS
              '#((|Algebra| 8) (|PartialDifferentialRing| 12) (|Module| 8)
                 (|BiModule| 8 8) (|Ring|) (|RightModule| 8) (|LeftModule| 8)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|ExpressionSpace|) (|Monoid|)
                 (|SemiRng|) (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|Evalable| $$)
                 (|RetractableTo| 8) (|unitsKnown|) (|BasicType|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|CoercibleTo| 34))
              (|makeByteWordVec2| 110
                                  '(1 5 0 12 13 1 12 14 0 15 2 12 0 0 14 16 2
                                    17 0 5 5 18 1 5 19 0 20 0 0 0 21 2 5 0 0 22
                                    23 1 12 24 0 25 1 12 0 0 26 1 19 0 0 27 2 5
                                    0 0 28 29 2 19 0 0 0 30 2 19 0 0 0 31 1 12
                                    32 0 33 1 35 34 0 36 1 37 12 0 38 2 19 24
                                    12 0 39 1 5 40 0 41 2 19 0 0 0 42 0 43 0 44
                                    1 37 0 12 45 0 46 0 47 1 48 5 46 49 0 5 0
                                    50 2 5 0 37 0 51 1 53 0 52 54 1 0 55 53 56
                                    1 0 55 52 57 1 0 0 53 58 1 0 0 52 59 1 53 0
                                    60 61 1 0 55 60 62 1 0 0 60 63 1 8 0 64 65
                                    2 67 5 66 53 68 1 72 0 71 73 1 0 55 72 74 1
                                    0 55 71 75 1 0 0 72 76 1 0 0 71 77 1 72 0
                                    78 79 1 0 55 78 80 1 0 0 78 81 1 8 0 82 83
                                    2 85 5 84 72 86 2 0 0 37 0 89 0 0 0 91 2 0
                                    24 0 0 1 1 0 24 0 1 1 0 19 0 1 0 0 24 87 1
                                    0 24 24 88 1 0 107 106 1 1 0 107 0 1 1 0 0
                                    0 1 1 0 0 0 1 2 0 55 0 0 1 2 0 0 0 28 1 3 0
                                    0 0 107 106 1 2 0 0 0 22 1 1 0 0 0 1 2 0 24
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 2 55 71
                                    75 1 2 55 78 80 1 2 55 72 74 1 1 55 52 57 1
                                    1 55 60 62 1 1 55 53 56 1 0 55 12 94 1 0 55
                                    5 69 1 0 100 0 1 1 0 108 0 1 1 2 0 71 77 1
                                    2 0 78 81 1 2 0 72 76 1 1 0 52 59 1 1 0 60
                                    63 1 1 0 53 58 1 0 0 12 95 1 0 0 5 70 1 0 8
                                    0 1 1 0 97 0 1 1 0 55 0 1 0 0 0 92 1 0 0 0
                                    1 1 0 0 106 1 2 0 24 0 0 1 1 0 40 0 1 1 0
                                    37 37 1 1 0 24 0 1 1 4 24 0 1 1 3 96 97 1 2
                                    0 0 102 97 1 1 0 108 0 1 1 0 0 0 90 1 0 0 0
                                    1 1 0 32 0 1 1 0 107 106 1 1 0 107 0 1 2 0
                                    0 37 0 89 2 0 0 37 106 1 2 0 24 0 37 1 2 0
                                    24 0 12 1 1 0 98 0 1 2 0 110 110 0 1 1 0
                                    109 0 1 2 0 24 0 12 1 2 0 24 0 0 1 1 0 0 0
                                    1 1 4 24 0 1 3 0 0 0 37 102 1 3 0 0 0 40
                                    104 1 3 0 0 0 37 103 1 3 0 0 0 12 102 1 3 0
                                    0 0 40 105 1 3 0 0 0 19 104 1 3 0 0 0 12
                                    103 1 3 0 0 0 19 105 1 3 0 0 0 106 106 1 2
                                    0 0 0 22 1 3 0 0 0 0 0 1 3 0 0 0 107 106 1
                                    2 0 0 0 28 1 3 0 0 0 97 0 1 2 0 0 37 106 1
                                    9 0 0 37 0 0 0 0 0 0 0 0 1 10 0 0 37 0 0 0
                                    0 0 0 0 0 0 1 7 0 0 37 0 0 0 0 0 0 1 8 0 0
                                    37 0 0 0 0 0 0 0 1 5 0 0 37 0 0 0 0 1 6 0 0
                                    37 0 0 0 0 0 1 3 0 0 37 0 0 1 4 0 0 37 0 0
                                    0 1 2 0 0 37 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 0 12 1 3 0 0 0 12 98 1 2 0 0 0 19 1 3 0 0
                                    0 19 99 1 1 3 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    5 0 93 1 0 0 64 1 1 0 0 8 1 1 0 0 97 1 1 0
                                    34 0 1 0 0 98 1 1 0 0 0 1 1 0 0 106 1 1 0
                                    24 37 1 1 0 0 0 1 1 0 0 0 1 2 0 24 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 101 1 2 0 0 0 98
                                    1 0 0 0 91 0 0 0 21 2 0 0 0 12 1 3 0 0 0 12
                                    98 1 2 0 0 0 19 1 3 0 0 0 19 99 1 2 0 24 0
                                    0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    101 0 1 2 0 0 98 0 1 2 0 0 64 0 1 2 0 0 0 0
                                    1 2 0 0 8 0 1 2 0 0 0 8 1)))))
           '|lookupComplete|)) 
