
(SDEFUN |FEXPR;mkEqn|
        ((|s1| (|Symbol|)) (|s2| (|Symbol|)) (% (|Equation| (|Expression| R))))
        (SPADCALL (SPADCALL |s2| (QREFELT % 11))
                  (SPADCALL
                   (SPADCALL |s1| (SPADCALL |s2| (QREFELT % 13))
                             (QREFELT % 14))
                   (QREFELT % 11))
                  (QREFELT % 16))) 

(SDEFUN |FEXPR;fixUpSymbols|
        ((|u| (|Expression| R)) (% (|Union| (|Expression| R) "failed")))
        (SPROG
         ((#1=#:G65 NIL) (|i| NIL) (#2=#:G64 NIL) (|sym| (|Symbol|))
          (|syms| (|List| (|Symbol|))) (#3=#:G63 NIL) (|s| NIL) (#4=#:G62 NIL)
          (#5=#:G59 NIL) (#6=#:G60 NIL) (#7=#:G61 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |syms| (SPADCALL |u| (QREFELT % 18)))
                (COND
                 ((EQL (LENGTH (QREFELT % 6)) 1)
                  (COND
                   ((ZEROP (LENGTH (QREFELT % 7)))
                    (EXIT
                     (COND ((NULL (EQL (LENGTH |syms|) 1)) (CONS 1 "failed"))
                           ('T
                            (CONS 0
                                  (SPADCALL |u|
                                            (SPADCALL
                                             (SPADCALL (|SPADfirst| |syms|)
                                                       (QREFELT % 11))
                                             (SPADCALL
                                              (|SPADfirst| (QREFELT % 6))
                                              (QREFELT % 11))
                                             (QREFELT % 16))
                                            (QREFELT % 21))))))))))
                (COND
                 ((ZEROP (LENGTH (QREFELT % 6)))
                  (COND
                   ((EQL (LENGTH (QREFELT % 7)) 1)
                    (EXIT
                     (SEQ
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| NIL) (LETT #7# |syms|) G190
                             (COND
                              ((OR (ATOM #7#) (PROGN (LETT |s| (CAR #7#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |s| (QREFELT % 23)))
                                 (PROGN
                                  (LETT #5#
                                        (PROGN
                                         (LETT #6# (CONS 1 "failed"))
                                         (GO #8=#:G58)))
                                  (GO #9=#:G30))))))
                             (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL)))
                       #9# (EXIT #5#))
                      (COND
                       ((NULL
                         (EQL
                          (LENGTH
                           (LETT |syms|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #4# NIL)
                                   (SEQ (LETT |s| NIL) (LETT #3# |syms|) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN (LETT |s| (CAR #3#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #4#
                                                (CONS
                                                 (SPADCALL |s| (QREFELT % 24))
                                                 #4#))))
                                        (LETT #3# (CDR #3#)) (GO G190) G191
                                        (EXIT (NREVERSE #4#))))
                                  (QREFELT % 25))))
                          1))
                        (EXIT (CONS 1 "failed"))))
                      (LETT |sym| (|SPADfirst| (QREFELT % 7)))
                      (EXIT
                       (CONS 0
                             (SPADCALL |u|
                                       (PROGN
                                        (LETT #2# NIL)
                                        (SEQ (LETT |i| NIL)
                                             (LETT #1#
                                                   (SPADCALL |u|
                                                             (QREFELT % 18)))
                                             G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |i| (CAR #1#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #2#
                                                     (CONS
                                                      (|FEXPR;mkEqn| |sym| |i|
                                                       %)
                                                      #2#))))
                                             (LETT #1# (CDR #1#)) (GO G190)
                                             G191 (EXIT (NREVERSE #2#))))
                                       (QREFELT % 27))))))))))
                (EXIT (CONS 1 "failed"))))
          #8# (EXIT #6#)))) 

(SDEFUN |FEXPR;extraSymbols?| ((|u| (|Expression| R)) (% (|Boolean|)))
        (SPROG
         ((|extras| (|List| (|Symbol|))) (|syms| (|List| (|Symbol|)))
          (#1=#:G71 NIL) (|v| NIL) (#2=#:G70 NIL))
         (SEQ
          (LETT |syms|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |v| NIL) (LETT #1# (SPADCALL |u| (QREFELT % 18)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |v| (QREFELT % 24)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |extras|
                (SPADCALL |syms|
                          (SPADCALL (QREFELT % 6) (QREFELT % 7) (QREFELT % 28))
                          (QREFELT % 29)))
          (EXIT (NULL (NULL |extras|)))))) 

(SDEFUN |FEXPR;checkSymbols| ((|u| (|Expression| R)) (% (|Expression| R)))
        (SPROG
         ((#1=#:G89 NIL) (|v| NIL) (#2=#:G88 NIL)
          (|m| (|Union| (|Expression| R) "failed"))
          (|extras| (|List| (|Symbol|))) (|syms| (|List| (|Symbol|)))
          (#3=#:G87 NIL) (#4=#:G86 NIL))
         (SEQ
          (LETT |syms|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |v| NIL) (LETT #3# (SPADCALL |u| (QREFELT % 18)))
                      G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |v| (QREFELT % 24)) #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (LETT |extras|
                (SPADCALL |syms|
                          (SPADCALL (QREFELT % 6) (QREFELT % 7) (QREFELT % 28))
                          (QREFELT % 29)))
          (COND
           ((NULL (NULL |extras|))
            (EXIT
             (SEQ (LETT |m| (|FEXPR;fixUpSymbols| |u| %))
                  (EXIT
                   (COND ((QEQCAR |m| 0) (QCDR |m|))
                         ('T
                          (|error|
                           (LIST '|mathprint|
                                 (LIST 'CONCAT
                                       (SPADCALL "Extra symbols detected:"
                                                 (QREFELT % 33))
                                       (SPADCALL
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |v| NIL)
                                              (LETT #1# |extras|) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |v| (CAR #1#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |v|
                                                                 (QREFELT %
                                                                          31))
                                                       #2#))))
                                              (LETT #1# (CDR #1#)) (GO G190)
                                              G191 (EXIT (NREVERSE #2#))))
                                        (QREFELT % 35))))))))))))
          (EXIT |u|)))) 

(SDEFUN |FEXPR;notSymbol?| ((|v| (|BasicOperator|)) (% (|Boolean|)))
        (SPROG ((|s| (|Symbol|)))
               (SEQ (LETT |s| (SPADCALL |v| (QREFELT % 37)))
                    (COND
                     ((SPADCALL |s| (QREFELT % 6) (QREFELT % 38)) (EXIT NIL))
                     ((SPADCALL |s| (QREFELT % 23))
                      (COND
                       ((SPADCALL (SPADCALL |s| (QREFELT % 24)) (QREFELT % 7)
                                  (QREFELT % 38))
                        (EXIT NIL)))))
                    (EXIT 'T)))) 

(SDEFUN |FEXPR;extraOperators?| ((|u| (|Expression| R)) (% (|Boolean|)))
        (SPROG
         ((|extras| (|List| (|Symbol|)))
          (|fortranFunctions| (|List| (|Symbol|))) (|ops| (|List| (|Symbol|)))
          (#1=#:G100 NIL) (|v| NIL) (#2=#:G99 NIL))
         (SEQ
          (LETT |ops|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |v| NIL) (LETT #1# (SPADCALL |u| (QREFELT % 40)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|FEXPR;notSymbol?| |v| %)
                          (LETT #2#
                                (CONS (SPADCALL |v| (QREFELT % 37)) #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |fortranFunctions| (QREFELT % 9))
          (LETT |extras| (SPADCALL |ops| |fortranFunctions| (QREFELT % 29)))
          (EXIT (NULL (NULL |extras|)))))) 

(SDEFUN |FEXPR;checkOperators| ((|u| (|Expression| R)) (% (|Void|)))
        (SPROG
         ((#1=#:G121 NIL) (|v| NIL) (#2=#:G120 NIL)
          (|extras| (|List| (|Symbol|)))
          (|fortranFunctions| (|List| (|Symbol|))) (|ops| (|List| (|Symbol|)))
          (#3=#:G119 NIL) (#4=#:G118 NIL))
         (SEQ
          (LETT |ops|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |v| NIL) (LETT #3# (SPADCALL |u| (QREFELT % 40)))
                      G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|FEXPR;notSymbol?| |v| %)
                          (LETT #4#
                                (CONS (SPADCALL |v| (QREFELT % 37)) #4#))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (LETT |fortranFunctions| (QREFELT % 9))
          (LETT |extras| (SPADCALL |ops| |fortranFunctions| (QREFELT % 29)))
          (COND
           ((NULL (NULL |extras|))
            (EXIT
             (|error|
              (LIST '|mathprint|
                    (LIST 'CONCAT
                          (SPADCALL "Non FORTRAN-77 functions detected:"
                                    (QREFELT % 33))
                          (SPADCALL
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |v| NIL) (LETT #1# |extras|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |v| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |v| (QREFELT % 31))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT % 35))))))))
          (EXIT (SPADCALL (QREFELT % 42)))))) 

(SDEFUN |FEXPR;retractIfCan;PU;8|
        ((|u| (|Polynomial| (|Integer|))) (% (|Union| % "failed")))
        (SPADCALL (SPADCALL |u| (QREFELT % 45)) (QREFELT % 47))) 

(SDEFUN |FEXPR;retract;P%;9| ((|u| (|Polynomial| (|Integer|))) (% (%)))
        (SPADCALL (SPADCALL |u| (QREFELT % 45)) (QREFELT % 49))) 

(SDEFUN |FEXPR;retractIfCan;FU;10|
        ((|u| (|Fraction| (|Polynomial| (|Integer|))))
         (% (|Union| % "failed")))
        (SPADCALL (SPADCALL |u| (QREFELT % 52)) (QREFELT % 47))) 

(SDEFUN |FEXPR;retract;F%;11|
        ((|u| (|Fraction| (|Polynomial| (|Integer|)))) (% (%)))
        (SPADCALL (SPADCALL |u| (QREFELT % 52)) (QREFELT % 49))) 

(SDEFUN |FEXPR;int2R| ((|u| (|Integer|)) (% (R))) (SPADCALL |u| (QREFELT % 56))) 

(SDEFUN |FEXPR;retractIfCan;EU;13|
        ((|u| (|Expression| (|Integer|))) (% (|Union| % "failed")))
        (SPADCALL
         (SPADCALL (CONS (|function| |FEXPR;int2R|) %) |u| (QREFELT % 59))
         (QREFELT % 60))) 

(SDEFUN |FEXPR;retract;E%;14| ((|u| (|Expression| (|Integer|))) (% (%)))
        (SPADCALL
         (SPADCALL (CONS (|function| |FEXPR;int2R|) %) |u| (QREFELT % 59))
         (QREFELT % 61))) 

(SDEFUN |FEXPR;retractIfCan;PU;15|
        ((|u| (|Polynomial| (|Float|))) (% (|Union| % "failed")))
        (SPADCALL (SPADCALL |u| (QREFELT % 64)) (QREFELT % 65))) 

(SDEFUN |FEXPR;retract;P%;16| ((|u| (|Polynomial| (|Float|))) (% (%)))
        (SPADCALL (SPADCALL |u| (QREFELT % 64)) (QREFELT % 67))) 

(SDEFUN |FEXPR;retractIfCan;FU;17|
        ((|u| (|Fraction| (|Polynomial| (|Float|)))) (% (|Union| % "failed")))
        (SPADCALL (SPADCALL |u| (QREFELT % 70)) (QREFELT % 65))) 

(SDEFUN |FEXPR;retract;F%;18|
        ((|u| (|Fraction| (|Polynomial| (|Float|)))) (% (%)))
        (SPADCALL (SPADCALL |u| (QREFELT % 70)) (QREFELT % 67))) 

(SDEFUN |FEXPR;float2R| ((|u| (|Float|)) (% (R))) (SPADCALL |u| (QREFELT % 74))) 

(SDEFUN |FEXPR;retractIfCan;EU;20|
        ((|u| (|Expression| (|Float|))) (% (|Union| % "failed")))
        (SPADCALL
         (SPADCALL (CONS (|function| |FEXPR;float2R|) %) |u| (QREFELT % 77))
         (QREFELT % 60))) 

(SDEFUN |FEXPR;retract;E%;21| ((|u| (|Expression| (|Float|))) (% (%)))
        (SPADCALL
         (SPADCALL (CONS (|function| |FEXPR;float2R|) %) |u| (QREFELT % 77))
         (QREFELT % 61))) 

(SDEFUN |FEXPR;log10;2%;22| ((|x| (%)) (% (%)))
        (SPADCALL (SPADCALL '|log10| (QREFELT % 78)) |x| (QREFELT % 79))) 

(SDEFUN |FEXPR;pi;%;23| ((% (%)))
        (SPADCALL (SPADCALL 'X01AAF (QREFELT % 78)) (|spadConstant| % 81)
                  (QREFELT % 79))) 

(PUT '|FEXPR;coerce;%E;24| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |FEXPR;coerce;%E;24| ((|u| (%)) (% (|Expression| R))) |u|) 

(SDEFUN |FEXPR;retractIfCan;EU;25|
        ((|u| (|Expression| R)) (% (|Union| % "failed")))
        (SPROG ((#1=#:G168 NIL) (|m| (|Union| (|Expression| R) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((|FEXPR;extraSymbols?| |u| %)
                    (SEQ (LETT |m| (|FEXPR;fixUpSymbols| |u| %))
                         (EXIT
                          (COND
                           ((QEQCAR |m| 1)
                            (PROGN
                             (LETT #1# (CONS 1 "failed"))
                             (GO #2=#:G167)))
                           (#3='T (LETT |u| (QCDR |m|))))))))
                  (EXIT
                   (COND ((|FEXPR;extraOperators?| |u| %) (CONS 1 "failed"))
                         (#3# (CONS 0 |u|))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FEXPR;retract;E%;26| ((|u| (|Expression| R)) (% (%)))
        (SEQ (LETT |u| (|FEXPR;checkSymbols| |u| %))
             (|FEXPR;checkOperators| |u| %) (EXIT |u|))) 

(SDEFUN |FEXPR;retractIfCan;SU;27| ((|u| (|Symbol|)) (% (|Union| % "failed")))
        (SEQ
         (COND
          ((NULL (SPADCALL |u| (QREFELT % 6) (QREFELT % 38)))
           (COND
            ((SPADCALL |u| (QREFELT % 23))
             (COND
              ((NULL
                (SPADCALL (SPADCALL |u| (QREFELT % 24)) (QREFELT % 7)
                          (QREFELT % 38)))
               (EXIT (CONS 1 #1="failed")))))
            ('T (EXIT (CONS 1 #1#))))))
         (EXIT (CONS 0 (SPADCALL |u| (QREFELT % 11)))))) 

(SDEFUN |FEXPR;retract;S%;28| ((|u| (|Symbol|)) (% (%)))
        (SPROG ((|res| (|Union| % "failed")))
               (SEQ (LETT |res| (SPADCALL |u| (QREFELT % 84)))
                    (EXIT
                     (COND
                      ((QEQCAR |res| 1)
                       (|error|
                        (LIST '|mathprint|
                              (LIST 'CONCAT
                                    (SPADCALL "Illegal Symbol Detected:"
                                              (QREFELT % 33))
                                    NIL))))
                      ('T (QCDR |res|))))))) 

(DECLAIM (NOTINLINE |FortranExpression;|)) 

(DEFUN |FortranExpression;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|FortranExpression| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 99))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#3|
                                                             '(|RetractableTo|
                                                               (|Float|)))))))
          (|haddProp| |$ConstructorCache| '|FortranExpression|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 4))
          (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| % 8))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9
                    '(|abs| |sqrt| |exp| |log| |log10| |sin| |cos| |tan| |asin|
                      |acos| |atan| |sinh| |cosh| |tanh| |nthRoot| |%power|))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 48
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;PU;8|) %))
             (QSETREFV % 50 (CONS (|dispatchFunction| |FEXPR;retract;P%;9|) %))
             (QSETREFV % 53
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;FU;10|)
                             %))
             (QSETREFV % 54
                       (CONS (|dispatchFunction| |FEXPR;retract;F%;11|) %))
             (QSETREFV % 47
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;EU;13|)
                             %))
             (QSETREFV % 49
                       (CONS (|dispatchFunction| |FEXPR;retract;E%;14|) %)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV % 66
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;PU;15|)
                             %))
             (QSETREFV % 68
                       (CONS (|dispatchFunction| |FEXPR;retract;P%;16|) %))
             (QSETREFV % 71
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;FU;17|)
                             %))
             (QSETREFV % 72
                       (CONS (|dispatchFunction| |FEXPR;retract;F%;18|) %))
             (QSETREFV % 65
                       (CONS (|dispatchFunction| |FEXPR;retractIfCan;EU;20|)
                             %))
             (QSETREFV % 67
                       (CONS (|dispatchFunction| |FEXPR;retract;E%;21|) %)))))
          %))) 

(DEFUN |FortranExpression| (&REST #1=#:G194)
  (SPROG NIL
         (PROG (#2=#:G195)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL NIL T))
                     (HGET |$ConstructorCache| '|FortranExpression|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FortranExpression;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FortranExpression|)))))))))) 

(MAKEPROP '|FortranExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|f77Functions| (|Symbol|)
              (0 . |coerce|)
              (|Record| (|:| |sub| (|List| 32)) (|:| |sup| (|List| 32))
                        (|:| |presup| (|List| 32)) (|:| |presub| (|List| 32))
                        (|:| |args| (|List| 32)))
              (5 . |scripts|) (10 . |script|) (|Equation| 5) (16 . |equation|)
              (|List| 10) (22 . |variables|) (27 . |One|) (|Equation| %)
              (31 . |subst|) (|Boolean|) (37 . |scripted?|) (42 . |name|)
              (47 . |removeDuplicates!|) (|List| 20) (52 . |subst|)
              (58 . |setUnion|) (64 . |setDifference|) (|String|)
              (70 . |string|) (|OutputForm|) (75 . |coerce|) (|List| 30)
              (80 . |coerce|) (|BasicOperator|) (85 . |name|) (90 . |member?|)
              (|List| 36) (96 . |operators|) (|Void|) (101 . |void|)
              (|Polynomial| 55) (|Expression| 55) (105 . |coerce|)
              (|Union| % '"failed") (110 . |retractIfCan|)
              (115 . |retractIfCan|) (120 . |retract|) (125 . |retract|)
              (|Fraction| 43) (130 . |coerce|) (135 . |retractIfCan|)
              (140 . |retract|) (|Integer|) (145 . |coerce|) (|Mapping| 8 55)
              (|ExpressionFunctions2| 55 8) (150 . |map|)
              |FEXPR;retractIfCan;EU;25| |FEXPR;retract;E%;26|
              (|Polynomial| 73) (|Expression| 73) (156 . |coerce|)
              (161 . |retractIfCan|) (166 . |retractIfCan|) (171 . |retract|)
              (176 . |retract|) (|Fraction| 62) (181 . |coerce|)
              (186 . |retractIfCan|) (191 . |retract|) (|Float|)
              (196 . |coerce|) (|Mapping| 8 73) (|ExpressionFunctions2| 73 8)
              (201 . |map|) (207 . |operator|) (212 . |kernel|)
              |FEXPR;log10;2%;22| (218 . |Zero|) |FEXPR;pi;%;23|
              |FEXPR;coerce;%E;24| |FEXPR;retractIfCan;SU;27|
              |FEXPR;retract;S%;28| (|Union| 87 '#1="failed") (|Kernel| %)
              (|List| 87) (|List| %) (|NonNegativeInteger|) (|Mapping| % %)
              (|Mapping| % 89) (|List| 92) (|List| 91) (|PositiveInteger|)
              (|Union| 8 '#1#) (|List| 90) (|SparseUnivariatePolynomial| %))
           '#(~= 222 |zero?| 228 |variables| 233 |tower| 238 |tanh| 248 |tan|
              253 |subtractIfCan| 258 |subst| 264 |sqrt| 283 |smaller?| 288
              |sinh| 294 |sin| 299 |sample| 304 |rightRecip| 308 |rightPower|
              313 |retractIfCan| 325 |retract| 375 |recip| 425 |plenaryPower|
              430 |pi| 436 |paren| 440 |opposite?| 445 |operators| 451
              |operator| 456 |one?| 461 |odd?| 466 |minPoly| 471 |map| 476
              |mainKernel| 482 |log10| 487 |log| 492 |leftRecip| 497
              |leftPower| 502 |latex| 514 |kernels| 519 |kernel| 529 |is?| 541
              |height| 553 |freeOf?| 558 |exp| 570 |even?| 575 |eval| 580 |elt|
              676 |distribute| 772 |differentiate| 783 |definingPolynomial| 809
              |cosh| 814 |cos| 819 |commutator| 824 |coerce| 830
              |characteristic| 855 |box| 859 |belong?| 864 |atan| 869
              |associator| 874 |asin| 881 |antiCommutator| 886 |annihilate?|
              892 |acos| 898 |abs| 903 ^ 908 |Zero| 920 |One| 924 D 928 = 954 -
              960 + 971 * 977)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|Algebra&| |PartialDifferentialRing&| NIL |Rng&| NIL
                |NonAssociativeAlgebra&| NIL |Module&| NIL
                |NonAssociativeRing&| NIL |NonAssociativeRng&| NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |NonAssociativeSemiRng&|
                |AbelianMonoid&| |MagmaWithUnit&| NIL |ExpressionSpace2&|
                |AbelianSemiGroup&| |Magma&| NIL |RetractableTo&| |Evalable&|
                |SetCategory&| |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |BasicType&| NIL NIL)
             (CONS
              '#((|Algebra| 8) (|PartialDifferentialRing| 10) (|Ring|) (|Rng|)
                 (|SemiRing|) (|NonAssociativeAlgebra| 8) (|SemiRng|)
                 (|Module| 8) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|BiModule| 8 8) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 8) (|RightModule| 8)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|ExpressionSpace|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|ExpressionSpace2| (|Kernel| $$))
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|RetractableTo| (|Kernel| $$)) (|Evalable| $$)
                 (|SetCategory|) (|RetractableTo| 8) (|CoercibleTo| 32)
                 (|CoercibleFrom| (|Kernel| $$))
                 (|InnerEvalable| (|Kernel| $$) $$) (|InnerEvalable| $$ $$)
                 (|BasicType|) (|unitsKnown|) (|CoercibleFrom| 8))
              (|makeByteWordVec2| 98
                                  '(1 5 0 10 11 1 10 12 0 13 2 10 0 0 12 14 2
                                    15 0 5 5 16 1 5 17 0 18 0 0 0 19 2 5 0 0 20
                                    21 1 10 22 0 23 1 10 0 0 24 1 17 0 0 25 2 5
                                    0 0 26 27 2 17 0 0 0 28 2 17 0 0 0 29 1 10
                                    30 0 31 1 30 32 0 33 1 34 32 0 35 1 36 10 0
                                    37 2 17 22 10 0 38 1 5 39 0 40 0 41 0 42 1
                                    44 0 43 45 1 0 46 44 47 1 0 46 43 48 1 0 0
                                    44 49 1 0 0 43 50 1 44 0 51 52 1 0 46 51 53
                                    1 0 0 51 54 1 8 0 55 56 2 58 5 57 44 59 1
                                    63 0 62 64 1 0 46 63 65 1 0 46 62 66 1 0 0
                                    63 67 1 0 0 62 68 1 63 0 69 70 1 0 46 69 71
                                    1 0 0 69 72 1 8 0 73 74 2 76 5 75 63 77 1
                                    36 0 10 78 2 0 0 36 0 79 0 0 0 81 2 0 22 0
                                    0 1 1 0 22 0 1 1 0 17 0 1 1 0 88 0 1 1 0 88
                                    89 1 1 0 0 0 1 1 0 0 0 1 2 0 46 0 0 1 2 0 0
                                    0 26 1 2 0 0 0 20 1 3 0 0 0 88 89 1 1 0 0 0
                                    1 2 0 22 0 0 1 1 0 0 0 1 1 0 0 0 1 0 0 0 1
                                    1 0 46 0 1 2 0 0 0 90 1 2 0 0 0 95 1 1 0 86
                                    0 1 1 0 96 0 1 1 0 46 5 60 1 0 46 10 84 1 2
                                    46 63 65 1 2 46 69 71 1 2 46 62 66 1 1 46
                                    44 47 1 1 46 51 53 1 1 46 43 48 1 0 87 0 1
                                    1 0 8 0 1 1 0 0 5 61 1 0 0 10 85 1 2 0 63
                                    67 1 2 0 69 72 1 2 0 62 68 1 1 0 44 49 1 1
                                    0 51 54 1 1 0 43 50 1 0 46 0 1 2 0 0 0 95 1
                                    0 0 0 82 1 0 0 0 1 2 0 22 0 0 1 1 0 39 0 1
                                    1 0 36 36 1 1 0 22 0 1 1 4 22 0 1 1 3 98 87
                                    1 2 0 0 91 87 1 1 0 86 0 1 1 0 0 0 80 1 0 0
                                    0 1 1 0 46 0 1 2 0 0 0 90 1 2 0 0 0 95 1 1
                                    0 30 0 1 1 0 88 0 1 1 0 88 89 1 2 0 0 36 0
                                    79 2 0 0 36 89 1 2 0 22 0 36 1 2 0 22 0 10
                                    1 1 0 90 0 1 2 0 22 0 10 1 2 0 22 0 0 1 1 0
                                    0 0 1 1 4 22 0 1 3 0 0 0 87 0 1 2 0 0 0 26
                                    1 3 0 0 0 88 89 1 3 0 0 0 0 0 1 2 0 0 0 20
                                    1 3 0 0 0 89 89 1 3 0 0 0 17 93 1 3 0 0 0
                                    17 94 1 3 0 0 0 10 91 1 3 0 0 0 10 92 1 3 0
                                    0 0 39 93 1 3 0 0 0 39 94 1 3 0 0 0 36 92 1
                                    3 0 0 0 36 91 1 2 0 0 36 0 1 4 0 0 36 0 0 0
                                    1 3 0 0 36 0 0 1 6 0 0 36 0 0 0 0 0 1 5 0 0
                                    36 0 0 0 0 1 7 0 0 36 0 0 0 0 0 0 1 9 0 0
                                    36 0 0 0 0 0 0 0 0 1 8 0 0 36 0 0 0 0 0 0 0
                                    1 2 0 0 36 89 1 10 0 0 36 0 0 0 0 0 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 1 3 0 0 0 10 90 1 3 0
                                    0 0 17 97 1 2 0 0 0 10 1 2 0 0 0 17 1 1 3 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 32
                                    0 1 1 0 0 87 1 1 0 0 8 1 1 0 0 55 1 1 0 5 0
                                    83 0 0 90 1 1 0 0 0 1 1 0 22 36 1 1 0 0 0 1
                                    3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 22
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 90 1 2 0
                                    0 0 95 1 0 0 0 81 0 0 0 19 3 0 0 0 10 90 1
                                    3 0 0 0 17 97 1 2 0 0 0 10 1 2 0 0 0 17 1 2
                                    0 22 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 8 0 1 2 0 0 0 8 1 2 0 0 90 0 1 2 0
                                    0 55 0 1 2 0 0 0 0 1 2 0 0 95 0 1)))))
           '|lookupComplete|)) 
