
(PUT '|KERNEL;operator;$Bo;1| '|SPADreplace| 'SPAD-KERNEL-OP) 

(SDEFUN |KERNEL;operator;$Bo;1| ((|k| $) ($ |BasicOperator|))
        (SPAD-KERNEL-OP |k|)) 

(PUT '|KERNEL;argument;$L;2| '|SPADreplace| 'SPAD-KERNEL-ARG) 

(SDEFUN |KERNEL;argument;$L;2| ((|k| $) ($ |List| S)) (SPAD-KERNEL-ARG |k|)) 

(PUT '|KERNEL;height;$Nni;3| '|SPADreplace| 'SPAD-KERNEL-NEST) 

(SDEFUN |KERNEL;height;$Nni;3| ((|k| $) ($ |NonNegativeInteger|))
        (SPAD-KERNEL-NEST |k|)) 

(PUT '|KERNEL;position;$Nni;4| '|SPADreplace| 'SPAD-KERNEL-POSIT) 

(SDEFUN |KERNEL;position;$Nni;4| ((|k| $) ($ |NonNegativeInteger|))
        (SPAD-KERNEL-POSIT |k|)) 

(PUT '|KERNEL;setPosition;$NniV;5| '|SPADreplace| 'SET-SPAD-KERNEL-POSIT) 

(SDEFUN |KERNEL;setPosition;$NniV;5|
        ((|k| $) (|n| |NonNegativeInteger|) ($ |Void|))
        (SET-SPAD-KERNEL-POSIT |k| |n|)) 

(PUT '|KERNEL;mkKer| '|SPADreplace| '|makeSpadKernel|) 

(SDEFUN |KERNEL;mkKer|
        ((|o| |BasicOperator|) (|a| |List| S) (|n| |NonNegativeInteger|) ($ $))
        (|makeSpadKernel| |o| |a| |n|)) 

(SDEFUN |KERNEL;is?;$SB;7| ((|k| $) (|s| |Symbol|) ($ |Boolean|))
        (SPADCALL (SPADCALL |k| (QREFELT $ 8)) |s| (QREFELT $ 28))) 

(SDEFUN |KERNEL;is?;$BoB;8| ((|k| $) (|o| |BasicOperator|) ($ |Boolean|))
        (SPADCALL (SPADCALL |k| (QREFELT $ 8)) |o| (QREFELT $ 30))) 

(SDEFUN |KERNEL;name;$S;9| ((|k| $) ($ |Symbol|))
        (SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 32))) 

(SDEFUN |KERNEL;B2Z| ((|flag| |Boolean|) ($ |Integer|))
        (COND (|flag| -1) ('T 1))) 

(SDEFUN |KERNEL;kernel;S$;11| ((|s| |Symbol|) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |s| 0 (QREFELT $ 34)) (QREFELT $ 16)
                   (QREFELT $ 35))
         NIL 1 (QREFELT $ 36))) 

(SDEFUN |KERNEL;preds| ((|o| |BasicOperator|) ($ |List| (|Any|)))
        (SPROG ((|u| (|Union| (|None|) "failed")))
               (SEQ (LETT |u| (SPADCALL |o| (QREFELT $ 17) (QREFELT $ 39)))
                    (EXIT (COND ((QEQCAR |u| 1) NIL) ('T (QCDR |u|))))))) 

(SDEFUN |KERNEL;symbolIfCan;$U;13| ((|k| $) ($ |Union| (|Symbol|) "failed"))
        (COND
         ((SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 16) (QREFELT $ 40))
          (CONS 0 (SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 32))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |KERNEL;kerEqual|
        ((|k1| $) (|k2| $) (|f| |Mapping| (|Boolean|) $ $) ($ |Boolean|))
        (COND
         ((OR
           (SPADCALL (SPADCALL |k1| (QREFELT $ 12))
                     (SPADCALL |k2| (QREFELT $ 12)) (QREFELT $ 43))
           (OR
            (SPADCALL (SPADCALL |k1| (QREFELT $ 8))
                      (SPADCALL |k2| (QREFELT $ 8)) (QREFELT $ 44))
            (SPADCALL (LENGTH (SPADCALL |k1| (QREFELT $ 10)))
                      (LENGTH (SPADCALL |k2| (QREFELT $ 10))) (QREFELT $ 43))))
          NIL)
         ('T (SPADCALL |k1| |k2| |f|)))) 

(SDEFUN |KERNEL;kernelEnterInCache| ((|k| $) ($ $))
        (SPROG
         ((#1=#:G438 NIL) (|res| (|Union| $ "failed"))
          (|f1| (|Mapping| (|Boolean|) $ $))
          (|f0| (|Union| (|None|) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |f0|
                   (SPADCALL (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 22)
                             (QREFELT $ 39)))
             (EXIT
              (COND
               ((QEQCAR |f0| 0)
                (SEQ (LETT |f1| (QCDR |f0|))
                     (LETT |res|
                           (SPADCALL |k|
                                     (CONS #'|KERNEL;kernelEnterInCache!0|
                                           (VECTOR $ |f1| |k|))
                                     (QREFELT $ 47)))
                     (EXIT
                      (COND
                       ((QEQCAR |res| 0)
                        (PROGN (LETT #1# (QCDR |res|)) (GO #2=#:G437))))))))))
            (EXIT
             (SPADCALL |k| (CONS (|function| |KERNEL;triage|) $)
                       (QREFELT $ 49)))))
          #2# (EXIT #1#)))) 

(SDEFUN |KERNEL;kernelEnterInCache!0| ((|y| NIL) ($$ NIL))
        (PROG (|k| |f1| $)
          (LETT |k| (QREFELT $$ 2))
          (LETT |f1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|KERNEL;kerEqual| |k| |y| |f1| $))))) 

(SDEFUN |KERNEL;=;2$B;16| ((|k1| $) (|k2| $) ($ |Boolean|))
        (SEQ
         (COND
          ((EQL (SPADCALL |k1| (QREFELT $ 13)) 0)
           (LETT |k1| (|KERNEL;kernelEnterInCache| |k1| $))))
         (COND
          ((EQL (SPADCALL |k2| (QREFELT $ 13)) 0)
           (LETT |k2| (|KERNEL;kernelEnterInCache| |k2| $))))
         (EXIT
          (EQL (SPADCALL |k1| (QREFELT $ 13)) (SPADCALL |k2| (QREFELT $ 13)))))) 

(SDEFUN |KERNEL;<;2$B;17| ((|k1| $) (|k2| $) ($ |Boolean|))
        (SEQ
         (COND
          ((EQL (SPADCALL |k1| (QREFELT $ 13)) 0)
           (LETT |k1| (|KERNEL;kernelEnterInCache| |k1| $))))
         (COND
          ((EQL (SPADCALL |k2| (QREFELT $ 13)) 0)
           (LETT |k2| (|KERNEL;kernelEnterInCache| |k2| $))))
         (EXIT
          (< (SPADCALL |k1| (QREFELT $ 13)) (SPADCALL |k2| (QREFELT $ 13)))))) 

(SDEFUN |KERNEL;kernel;BoLNni$;18|
        ((|fn| |BasicOperator|) (|x| |List| S) (|n| |NonNegativeInteger|)
         ($ $))
        (SPROG
         ((#1=#:G454 NIL) (|u| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |u| (SPADCALL |fn| (QREFELT $ 53)))
                 (EXIT
                  (COND
                   ((QEQCAR |u| 0)
                    (COND
                     ((SPADCALL (LENGTH |x|) (QCDR |u|) (QREFELT $ 43))
                      (PROGN
                       (LETT #1# (|error| "Wrong number of arguments"))
                       (GO #2=#:G452))))))))
            (EXIT
             (|KERNEL;kernelEnterInCache| (|KERNEL;mkKer| |fn| |x| |n| $) $))))
          #2# (EXIT #1#)))) 

(SDEFUN |KERNEL;coerce;$Of;19| ((|k| $) ($ |OutputForm|))
        (SPROG
         ((|u|
           (|Union| (|Mapping| (|OutputForm|) (|List| (|OutputForm|)))
                    "failed"))
          (|l| (|List| (|OutputForm|))) (#1=#:G472 NIL) (|x| NIL)
          (#2=#:G471 NIL) (|f| (|Union| (|None|) "failed"))
          (|o| (|BasicOperator|)) (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 42)))
              (EXIT
               (COND ((QEQCAR |v| 0) (SPADCALL (QCDR |v|) (QREFELT $ 55)))
                     (#3='T
                      (SEQ
                       (LETT |f|
                             (SPADCALL (LETT |o| (SPADCALL |k| (QREFELT $ 8)))
                                       (QREFELT $ 21) (QREFELT $ 39)))
                       (EXIT
                        (COND
                         ((QEQCAR |f| 0)
                          (SPADCALL (SPADCALL |k| (QREFELT $ 10)) (QCDR |f|)))
                         (#3#
                          (SEQ
                           (LETT |l|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |x| NIL)
                                       (LETT #1# (SPADCALL |k| (QREFELT $ 10)))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |x| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |x| (QREFELT $ 56))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (LETT |u| (SPADCALL |o| (QREFELT $ 59)))
                           (EXIT
                            (COND
                             ((QEQCAR |u| 1)
                              (SPADCALL
                               (SPADCALL (SPADCALL |o| (QREFELT $ 32))
                                         (QREFELT $ 55))
                               |l| (QREFELT $ 61)))
                             (#3# (SPADCALL |l| (QCDR |u|)))))))))))))))) 

(SDEFUN |KERNEL;triage| ((|k1| $) (|k2| $) ($ |Integer|))
        (SPROG
         ((#1=#:G480 NIL) (#2=#:G481 NIL) (#3=#:G482 NIL) (|x1| NIL)
          (#4=#:G483 NIL) (|x2| NIL) (|n2| (|Integer|)) (|n1| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |k1| (QREFELT $ 12))
                       (SPADCALL |k2| (QREFELT $ 12)) (QREFELT $ 64))
             (|KERNEL;B2Z|
              (< (SPADCALL |k1| (QREFELT $ 12)) (SPADCALL |k2| (QREFELT $ 12)))
              $))
            ((SPADCALL (SPADCALL |k1| (QREFELT $ 8))
                       (SPADCALL |k2| (QREFELT $ 8)) (QREFELT $ 44))
             (|KERNEL;B2Z|
              (SPADCALL (SPADCALL |k1| (QREFELT $ 8))
                        (SPADCALL |k2| (QREFELT $ 8)) (QREFELT $ 65))
              $))
            ((SPADCALL (LETT |n1| (LENGTH (SPADCALL |k1| (QREFELT $ 10))))
                       (LETT |n2| (LENGTH (SPADCALL |k2| (QREFELT $ 10))))
                       (QREFELT $ 64))
             (|KERNEL;B2Z| (< |n1| |n2|) $))
            ('T
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |x2| NIL) (LETT #4# (SPADCALL |k2| (QREFELT $ 10)))
                     (LETT |x1| NIL) (LETT #3# (SPADCALL |k1| (QREFELT $ 10)))
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x1| (CAR #3#)) NIL)
                           (ATOM #4#) (PROGN (LETT |x2| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x1| |x2| (QREFELT $ 66))
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2#
                                       (|KERNEL;B2Z|
                                        (SPADCALL |x1| |x2| (QREFELT $ 67)) $))
                                 (GO #5=#:G479)))
                          (GO #6=#:G474))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                     (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #1#))
              (EXIT 0)))))
          #5# (EXIT #2#)))) 

(SDEFUN |KERNEL;convert;$If;21| ((|k| $) ($ |InputForm|))
        (SPROG
         ((|u|
           (|Union| (|Mapping| (|InputForm|) (|List| (|InputForm|))) "failed"))
          (|l| (|List| (|InputForm|))) (#1=#:G501 NIL) (|x| NIL)
          (#2=#:G500 NIL) (|f| (|Union| (|None|) "failed"))
          (|o| (|BasicOperator|)) (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 42)))
              (EXIT
               (COND ((QEQCAR |v| 0) (SPADCALL (QCDR |v|) (QREFELT $ 69)))
                     (#3='T
                      (SEQ
                       (LETT |f|
                             (SPADCALL (LETT |o| (SPADCALL |k| (QREFELT $ 8)))
                                       (QREFELT $ 23) (QREFELT $ 39)))
                       (EXIT
                        (COND
                         ((QEQCAR |f| 0)
                          (SPADCALL (SPADCALL |k| (QREFELT $ 10)) (QCDR |f|)))
                         (#3#
                          (SEQ
                           (LETT |l|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |x| NIL)
                                       (LETT #1# (SPADCALL |k| (QREFELT $ 10)))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |x| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |x| (QREFELT $ 70))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (LETT |u|
                                 (SPADCALL (SPADCALL |k| (QREFELT $ 8))
                                           (QREFELT $ 73)))
                           (EXIT
                            (COND
                             ((QEQCAR |u| 1)
                              (SPADCALL
                               (CONS
                                (SPADCALL
                                 (SPADCALL (SPADCALL |k| (QREFELT $ 8))
                                           (QREFELT $ 32))
                                 (QREFELT $ 69))
                                |l|)
                               (QREFELT $ 76)))
                             (#3# (SPADCALL |l| (QCDR |u|)))))))))))))))) 

(SDEFUN |KERNEL;convert;$P;22| ((|k| $) ($ |Pattern| (|Integer|)))
        (SPROG
         ((#1=#:G510 NIL) (|x| NIL) (#2=#:G509 NIL) (|l| (|List| (|Any|)))
          (|s| (|Pattern| (|Integer|))) (|v| (|Union| (|Symbol|) "failed"))
          (|o| (|BasicOperator|)))
         (SEQ (LETT |o| (SPADCALL |k| (QREFELT $ 8)))
              (LETT |v| (SPADCALL |k| (QREFELT $ 42)))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (SEQ
                  (LETT |s|
                        (SPADCALL (QCDR |v|)
                                  (SPADCALL |o| (QREFELT $ 20) (QREFELT $ 40))
                                  (SPADCALL |o| (QREFELT $ 18) (QREFELT $ 40))
                                  (SPADCALL |o| (QREFELT $ 19) (QREFELT $ 40))
                                  (QREFELT $ 79)))
                  (EXIT
                   (COND ((NULL (LETT |l| (|KERNEL;preds| |o| $))) |s|)
                         (#3='T (SPADCALL |s| |l| (QREFELT $ 81)))))))
                (#3#
                 (SPADCALL |o|
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |x| NIL)
                                 (LETT #1# (SPADCALL |k| (QREFELT $ 10))) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |x| (QREFELT $ 82))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 83)))))))) 

(SDEFUN |KERNEL;convert;$P;23| ((|k| $) ($ |Pattern| (|Float|)))
        (SPROG
         ((#1=#:G519 NIL) (|x| NIL) (#2=#:G518 NIL) (|l| (|List| (|Any|)))
          (|s| (|Pattern| (|Float|))) (|v| (|Union| (|Symbol|) "failed"))
          (|o| (|BasicOperator|)))
         (SEQ (LETT |o| (SPADCALL |k| (QREFELT $ 8)))
              (LETT |v| (SPADCALL |k| (QREFELT $ 42)))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (SEQ
                  (LETT |s|
                        (SPADCALL (QCDR |v|)
                                  (SPADCALL |o| (QREFELT $ 20) (QREFELT $ 40))
                                  (SPADCALL |o| (QREFELT $ 18) (QREFELT $ 40))
                                  (SPADCALL |o| (QREFELT $ 19) (QREFELT $ 40))
                                  (QREFELT $ 85)))
                  (EXIT
                   (COND ((NULL (LETT |l| (|KERNEL;preds| |o| $))) |s|)
                         (#3='T (SPADCALL |s| |l| (QREFELT $ 86)))))))
                (#3#
                 (SPADCALL |o|
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |x| NIL)
                                 (LETT #1# (SPADCALL |k| (QREFELT $ 10))) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |x| (QREFELT $ 87))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 88)))))))) 

(DECLAIM (NOTINLINE |Kernel;|)) 

(DEFUN |Kernel| (#1=#:G520)
  (SPROG NIL
         (PROG (#2=#:G521)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Kernel|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Kernel;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Kernel|)))))))))) 

(DEFUN |Kernel;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Kernel| DV$1))
          (LETT $ (GETREFV 93))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Float|))))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))))))
          (|haddProp| |$ConstructorCache| '|Kernel| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 16 '|%symbol|)
          (QSETREFV $ 17 '|%pmpredicate|)
          (QSETREFV $ 18 '|%pmoptional|)
          (QSETREFV $ 19 '|%pmmultiple|)
          (QSETREFV $ 20 '|%pmconstant|)
          (QSETREFV $ 21 '|%specialDisp|)
          (QSETREFV $ 22 '|%specialEqual|)
          (QSETREFV $ 23 '|%specialInput|)
          (SPADCALL (QREFELT $ 25))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 77
                      (CONS (|dispatchFunction| |KERNEL;convert;$If;21|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV $ 84
                      (CONS (|dispatchFunction| |KERNEL;convert;$P;22|) $))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 89
                      (CONS (|dispatchFunction| |KERNEL;convert;$P;23|) $))))
          $))) 

(MAKEPROP '|Kernel| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|BasicOperator|)
              |KERNEL;operator;$Bo;1| (|List| 6) |KERNEL;argument;$L;2|
              (|NonNegativeInteger|) |KERNEL;height;$Nni;3|
              |KERNEL;position;$Nni;4| (|Void|) |KERNEL;setPosition;$NniV;5|
              'SYMBOL 'PMPRED 'PMOPT 'PMMULT 'PMCONST 'SPECIALDISP
              'SPECIALEQUAL 'SPECIALINPUT (|SortedCache| $$) (0 . |clearCache|)
              (|Boolean|) (|Symbol|) (4 . |is?|) |KERNEL;is?;$SB;7| (10 . =)
              |KERNEL;is?;$BoB;8| (16 . |name|) |KERNEL;name;$S;9|
              (21 . |operator|) (27 . |assert|) |KERNEL;kernel;BoLNni$;18|
              |KERNEL;kernel;S$;11| (|Union| (|None|) '"failed")
              (33 . |property|) (39 . |has?|) (|Union| 27 '"failed")
              |KERNEL;symbolIfCan;$U;13| (45 . ~=) (51 . ~=)
              (|Union| $$ '"failed") (|Mapping| 26 $$) (57 . |linearSearch|)
              (|Mapping| 63 $$ $$) (63 . |enterInCache|) |KERNEL;=;2$B;16|
              |KERNEL;<;2$B;17| (|Union| 11 '"failed") (69 . |arity|)
              (|OutputForm|) (74 . |coerce|) (79 . |coerce|)
              (|Mapping| 54 (|List| 54)) (|Union| 57 '"failed")
              (84 . |display|) (|List| $) (89 . |prefix|)
              |KERNEL;coerce;$Of;19| (|Integer|) (95 . ~=) (101 . <) (107 . ~=)
              (113 . |smaller?|) (|InputForm|) (119 . |convert|)
              (124 . |convert|) (|Mapping| 68 (|List| 68))
              (|Union| 71 '"failed") (129 . |input|) (|Pattern| (|Float|))
              (134 . |convert|) (139 . |convert|) (144 . |convert|)
              (|Pattern| 63) (149 . |patternVariable|) (|List| (|Any|))
              (157 . |setPredicates|) (163 . |convert|) (168 . |elt|)
              (174 . |convert|) (179 . |patternVariable|)
              (187 . |setPredicates|) (193 . |convert|) (198 . |elt|)
              (204 . |convert|) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 209 |symbolIfCan| 215 |smaller?| 220 |setPosition| 226
              |position| 232 |operator| 237 |name| 242 |min| 247 |max| 253
              |latex| 259 |kernel| 264 |is?| 276 |height| 288 |hashUpdate!| 293
              |hash| 299 |convert| 304 |coerce| 319 |argument| 324 >= 329 > 335
              = 341 <= 347 < 353)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(0 0 0 0 0 0 0 0 1 2 3))
                 (CONS
                  '#(|OrderedSet&| NIL NIL NIL |SetCategory&| |PartialOrder&|
                     |BasicType&| NIL NIL NIL NIL)
                  (CONS
                   '#((|OrderedSet|) (|CachableSet|) (|Comparable|)
                      (|Patternable| 6) (|SetCategory|) (|PartialOrder|)
                      (|BasicType|) (|CoercibleTo| 54) (|ConvertibleTo| 74)
                      (|ConvertibleTo| 78) (|ConvertibleTo| 68))
                   (|makeByteWordVec2| 92
                                       '(0 24 14 25 2 7 26 0 27 28 2 7 26 0 0
                                         30 1 7 27 0 32 2 7 0 27 11 34 2 7 0 0
                                         27 35 2 7 38 0 27 39 2 7 26 0 27 40 2
                                         11 26 0 0 43 2 7 26 0 0 44 2 24 45 2
                                         46 47 2 24 2 2 48 49 1 7 52 0 53 1 27
                                         54 0 55 1 6 54 0 56 1 7 58 0 59 2 54 0
                                         0 60 61 2 63 26 0 0 64 2 7 26 0 0 65 2
                                         6 26 0 0 66 2 6 26 0 0 67 1 27 68 0 69
                                         1 6 68 0 70 1 7 72 0 73 1 27 74 0 75 1
                                         68 0 60 76 1 0 68 0 77 4 78 0 27 26 26
                                         26 79 2 78 0 0 80 81 1 6 78 0 82 2 78
                                         0 7 60 83 1 0 78 0 84 4 74 0 27 26 26
                                         26 85 2 74 0 0 80 86 1 6 74 0 87 2 74
                                         0 7 60 88 1 0 74 0 89 2 0 26 0 0 1 1 0
                                         41 0 42 2 0 26 0 0 1 2 0 14 0 11 15 1
                                         0 11 0 13 1 0 7 0 8 1 0 27 0 33 2 0 0
                                         0 0 1 2 0 0 0 0 1 1 0 91 0 1 1 0 0 27
                                         37 3 0 0 7 9 11 36 2 0 26 0 27 29 2 0
                                         26 0 7 31 1 0 11 0 12 2 0 90 90 0 1 1
                                         0 92 0 1 1 3 68 0 77 1 1 74 0 89 1 2
                                         78 0 84 1 0 54 0 62 1 0 9 0 10 2 0 26
                                         0 0 1 2 0 26 0 0 1 2 0 26 0 0 50 2 0
                                         26 0 0 1 2 0 26 0 0 51)))))
           '|lookupComplete|)) 
