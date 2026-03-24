
(PUT '|KERNEL;operator;%Bo;1| '|SPADreplace| 'SPAD_KERNEL-OP) 

(SDEFUN |KERNEL;operator;%Bo;1| ((|k| (%)) (% (|BasicOperator|)))
        (SPAD_KERNEL-OP |k|)) 

(PUT '|KERNEL;argument;%L;2| '|SPADreplace| 'SPAD_KERNEL-ARG) 

(SDEFUN |KERNEL;argument;%L;2| ((|k| (%)) (% (|List| S))) (SPAD_KERNEL-ARG |k|)) 

(PUT '|KERNEL;height;%Nni;3| '|SPADreplace| 'SPAD_KERNEL-NEST) 

(SDEFUN |KERNEL;height;%Nni;3| ((|k| (%)) (% (|NonNegativeInteger|)))
        (SPAD_KERNEL-NEST |k|)) 

(PUT '|KERNEL;position;%Nni;4| '|SPADreplace| 'SPAD_KERNEL-POSIT) 

(SDEFUN |KERNEL;position;%Nni;4| ((|k| (%)) (% (|NonNegativeInteger|)))
        (SPAD_KERNEL-POSIT |k|)) 

(PUT '|KERNEL;setPosition;%NniV;5| '|SPADreplace| 'SET_SPAD_KERNEL_POSIT) 

(SDEFUN |KERNEL;setPosition;%NniV;5|
        ((|k| (%)) (|n| (|NonNegativeInteger|)) (% (|Void|)))
        (SET_SPAD_KERNEL_POSIT |k| |n|)) 

(PUT '|KERNEL;mkKer| '|SPADreplace| '|makeSpadKernel|) 

(SDEFUN |KERNEL;mkKer|
        ((|o| (|BasicOperator|)) (|a| (|List| S)) (|n| (|NonNegativeInteger|))
         (% (%)))
        (|makeSpadKernel| |o| |a| |n|)) 

(SDEFUN |KERNEL;is?;%SB;7| ((|k| (%)) (|s| (|Symbol|)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |k| (QREFELT % 8)) |s| (QREFELT % 28))) 

(SDEFUN |KERNEL;is?;%BoB;8| ((|k| (%)) (|o| (|BasicOperator|)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |k| (QREFELT % 8)) |o| (QREFELT % 30))) 

(SDEFUN |KERNEL;name;%S;9| ((|k| (%)) (% (|Symbol|)))
        (SPADCALL (SPADCALL |k| (QREFELT % 8)) (QREFELT % 32))) 

(SDEFUN |KERNEL;B2Z| ((|flag| (|Boolean|)) (% (|Integer|)))
        (COND (|flag| -1) ('T 1))) 

(SDEFUN |KERNEL;kernel;S%;11| ((|s| (|Symbol|)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |s| 0 (QREFELT % 34)) (QREFELT % 16)
                   (QREFELT % 35))
         NIL 1 (QREFELT % 36))) 

(SDEFUN |KERNEL;preds| ((|o| (|BasicOperator|)) (% (|List| (|Any|))))
        (SPROG ((|u| (|Union| (|None|) "failed")))
               (SEQ (LETT |u| (SPADCALL |o| (QREFELT % 17) (QREFELT % 39)))
                    (EXIT (COND ((QEQCAR |u| 1) NIL) ('T (QCDR |u|))))))) 

(SDEFUN |KERNEL;symbolIfCan;%U;13|
        ((|k| (%)) (% (|Union| (|Symbol|) "failed")))
        (COND
         ((SPADCALL (SPADCALL |k| (QREFELT % 8)) (QREFELT % 16) (QREFELT % 40))
          (CONS 0 (SPADCALL (SPADCALL |k| (QREFELT % 8)) (QREFELT % 32))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |KERNEL;kerEqual|
        ((|k1| (%)) (|k2| (%)) (|f| (|Mapping| (|Boolean|) % %))
         (% (|Boolean|)))
        (COND
         ((OR
           (SPADCALL (SPADCALL |k1| (QREFELT % 12))
                     (SPADCALL |k2| (QREFELT % 12)) (QREFELT % 43))
           (OR
            (SPADCALL (SPADCALL |k1| (QREFELT % 8))
                      (SPADCALL |k2| (QREFELT % 8)) (QREFELT % 44))
            (SPADCALL (LENGTH (SPADCALL |k1| (QREFELT % 10)))
                      (LENGTH (SPADCALL |k2| (QREFELT % 10))) (QREFELT % 43))))
          NIL)
         ('T (SPADCALL |k1| |k2| |f|)))) 

(SDEFUN |KERNEL;kerEqual0| ((|k1| (%)) (|k2| (%)) (% (|Boolean|)))
        (EQL (|KERNEL;triage| |k1| |k2| %) 0)) 

(SDEFUN |KERNEL;kernelEnterInCache| ((|k| (%)) (% (%)))
        (SPROG
         ((#1=#:G66 NIL) (#2=#:G67 NIL) (|res| (|Union| % "failed"))
          (|f1| (|Mapping| (|Boolean|) % %))
          (|f0| (|Union| (|None|) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res|
                  (SPADCALL |k| (CONS (|function| |KERNEL;triage|) %)
                            (QREFELT % 47)))
            (EXIT
             (COND ((QEQCAR |res| 0) (QCDR |res|))
                   (#3='T
                    (SEQ
                     (EXIT
                      (SEQ
                       (SEQ
                        (LETT |f0|
                              (SPADCALL (SPADCALL |k| (QREFELT % 8))
                                        (QREFELT % 22) (QREFELT % 39)))
                        (EXIT
                         (COND
                          ((QEQCAR |f0| 0)
                           (SEQ (LETT |f1| (QCDR |f0|))
                                (LETT |res|
                                      (SPADCALL
                                       (CONS #'|KERNEL;kernelEnterInCache!0|
                                             (VECTOR % |f1| |k|))
                                       (QREFELT % 49)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |res| 0)
                                   (PROGN
                                    (LETT #2# (QCDR |res|))
                                    (GO #4=#:G65)))))))
                          (#3#
                           (SEQ
                            (LETT |res|
                                  (SPADCALL
                                   (CONS #'|KERNEL;kernelEnterInCache!1|
                                         (VECTOR % |k|))
                                   (QREFELT % 49)))
                            (EXIT
                             (COND
                              ((QEQCAR |res| 0)
                               (PROGN
                                (LETT #1#
                                      (PROGN (LETT #2# (QCDR |res|)) (GO #4#)))
                                (GO #5=#:G63))))))))))
                       (EXIT
                        (SPADCALL |k| (CONS (|function| |KERNEL;triage|) %)
                                  (QREFELT % 50)))))
                     #5# (EXIT #1#)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |KERNEL;kernelEnterInCache!1| ((|y| NIL) ($$ NIL))
        (PROG (|k| %)
          (LETT |k| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|KERNEL;kerEqual0| |k| |y| %))))) 

(SDEFUN |KERNEL;kernelEnterInCache!0| ((|y| NIL) ($$ NIL))
        (PROG (|k| |f1| %)
          (LETT |k| (QREFELT $$ 2))
          (LETT |f1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|KERNEL;kerEqual| |k| |y| |f1| %))))) 

(SDEFUN |KERNEL;=;2%B;17| ((|k1| (%)) (|k2| (%)) (% (|Boolean|)))
        (SPROG ((|p2| #1=(|NonNegativeInteger|)) (|p1| #1#))
               (SEQ (LETT |p1| (SPADCALL |k1| (QREFELT % 13)))
                    (LETT |p2| (SPADCALL |k2| (QREFELT % 13)))
                    (COND
                     ((SPADCALL |p1| 0 (QREFELT % 43))
                      (COND
                       ((SPADCALL |p2| 0 (QREFELT % 43))
                        (EXIT (EQL |p1| |p2|))))))
                    (COND
                     ((EQL |p1| 0)
                      (LETT |k1| (|KERNEL;kernelEnterInCache| |k1| %))))
                    (COND
                     ((EQL |p2| 0)
                      (LETT |k2| (|KERNEL;kernelEnterInCache| |k2| %))))
                    (EXIT
                     (EQL (SPADCALL |k1| (QREFELT % 13))
                          (SPADCALL |k2| (QREFELT % 13))))))) 

(SDEFUN |KERNEL;<;2%B;18| ((|k1| (%)) (|k2| (%)) (% (|Boolean|)))
        (SPROG ((|p2| #1=(|NonNegativeInteger|)) (|p1| #1#))
               (SEQ (LETT |p1| (SPADCALL |k1| (QREFELT % 13)))
                    (LETT |p2| (SPADCALL |k2| (QREFELT % 13)))
                    (COND
                     ((SPADCALL |p1| 0 (QREFELT % 43))
                      (COND
                       ((SPADCALL |p2| 0 (QREFELT % 43))
                        (EXIT (< |p1| |p2|))))))
                    (COND
                     ((EQL |p1| 0)
                      (LETT |k1| (|KERNEL;kernelEnterInCache| |k1| %))))
                    (COND
                     ((EQL |p2| 0)
                      (LETT |k2| (|KERNEL;kernelEnterInCache| |k2| %))))
                    (EXIT
                     (< (SPADCALL |k1| (QREFELT % 13))
                        (SPADCALL |k2| (QREFELT % 13))))))) 

(SDEFUN |KERNEL;kernel;BoLNni%;19|
        ((|fn| (|BasicOperator|)) (|x| (|List| S)) (|n| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((#1=#:G83 NIL) (|u| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |u| (SPADCALL |fn| (QREFELT % 54)))
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (COND
                           ((SPADCALL (LENGTH |x|) (QCDR |u|) (QREFELT % 43))
                            (PROGN
                             (LETT #1# (|error| "Wrong number of arguments"))
                             (GO #2=#:G81))))))))
                  (EXIT
                   (|KERNEL;kernelEnterInCache| (|KERNEL;mkKer| |fn| |x| |n| %)
                    %))))
                #2# (EXIT #1#)))) 

(SDEFUN |KERNEL;coerce;%Of;20| ((|k| (%)) (% (|OutputForm|)))
        (SPROG
         ((|u|
           (|Union| (|Mapping| (|OutputForm|) (|List| (|OutputForm|)))
                    "failed"))
          (|l| (|List| (|OutputForm|))) (#1=#:G102 NIL) (|x| NIL)
          (#2=#:G101 NIL) (|f| (|Union| (|None|) "failed"))
          (|o| (|BasicOperator|)) (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT % 42)))
              (EXIT
               (COND ((QEQCAR |v| 0) (SPADCALL (QCDR |v|) (QREFELT % 56)))
                     (#3='T
                      (SEQ
                       (LETT |f|
                             (SPADCALL (LETT |o| (SPADCALL |k| (QREFELT % 8)))
                                       (QREFELT % 21) (QREFELT % 39)))
                       (EXIT
                        (COND
                         ((QEQCAR |f| 0)
                          (SPADCALL (SPADCALL |k| (QREFELT % 10)) (QCDR |f|)))
                         (#3#
                          (SEQ
                           (LETT |l|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |x| NIL)
                                       (LETT #1# (SPADCALL |k| (QREFELT % 10)))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |x| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |x| (QREFELT % 57))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (LETT |u| (SPADCALL |o| (QREFELT % 60)))
                           (EXIT
                            (COND
                             ((QEQCAR |u| 1)
                              (SPADCALL
                               (SPADCALL (SPADCALL |o| (QREFELT % 32))
                                         (QREFELT % 56))
                               |l| (QREFELT % 62)))
                             (#3# (SPADCALL |l| (QCDR |u|)))))))))))))))) 

(SDEFUN |KERNEL;triage| ((|k1| (%)) (|k2| (%)) (% (|Integer|)))
        (SPROG
         ((#1=#:G111 NIL) (#2=#:G112 NIL) (#3=#:G113 NIL) (|x1| NIL)
          (#4=#:G114 NIL) (|x2| NIL) (|n2| (|Integer|)) (|n1| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |k1| (QREFELT % 12))
                       (SPADCALL |k2| (QREFELT % 12)) (QREFELT % 65))
             (|KERNEL;B2Z|
              (< (SPADCALL |k1| (QREFELT % 12)) (SPADCALL |k2| (QREFELT % 12)))
              %))
            ((SPADCALL (SPADCALL |k1| (QREFELT % 8))
                       (SPADCALL |k2| (QREFELT % 8)) (QREFELT % 44))
             (|KERNEL;B2Z|
              (SPADCALL (SPADCALL |k1| (QREFELT % 8))
                        (SPADCALL |k2| (QREFELT % 8)) (QREFELT % 66))
              %))
            ((SPADCALL (LETT |n1| (LENGTH (SPADCALL |k1| (QREFELT % 10))))
                       (LETT |n2| (LENGTH (SPADCALL |k2| (QREFELT % 10))))
                       (QREFELT % 65))
             (|KERNEL;B2Z| (< |n1| |n2|) %))
            ('T
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |x2| NIL) (LETT #4# (SPADCALL |k2| (QREFELT % 10)))
                     (LETT |x1| NIL) (LETT #3# (SPADCALL |k1| (QREFELT % 10)))
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x1| (CAR #3#)) NIL)
                           (ATOM #4#) (PROGN (LETT |x2| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x1| |x2| (QREFELT % 67))
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2#
                                       (|KERNEL;B2Z|
                                        (SPADCALL |x1| |x2| (QREFELT % 68)) %))
                                 (GO #5=#:G110)))
                          (GO #6=#:G105))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                     (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #1#))
              (EXIT 0)))))
          #5# (EXIT #2#)))) 

(SDEFUN |KERNEL;convert;%If;22| ((|k| (%)) (% (|InputForm|)))
        (SPROG
         ((|u|
           (|Union| (|Mapping| (|InputForm|) (|List| (|InputForm|))) "failed"))
          (|l| (|List| (|InputForm|))) (#1=#:G133 NIL) (|x| NIL)
          (#2=#:G132 NIL) (|f| (|Union| (|None|) "failed"))
          (|o| (|BasicOperator|)) (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT % 42)))
              (EXIT
               (COND ((QEQCAR |v| 0) (SPADCALL (QCDR |v|) (QREFELT % 70)))
                     (#3='T
                      (SEQ
                       (LETT |f|
                             (SPADCALL (LETT |o| (SPADCALL |k| (QREFELT % 8)))
                                       (QREFELT % 23) (QREFELT % 39)))
                       (EXIT
                        (COND
                         ((QEQCAR |f| 0)
                          (SPADCALL (SPADCALL |k| (QREFELT % 10)) (QCDR |f|)))
                         (#3#
                          (SEQ
                           (LETT |l|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |x| NIL)
                                       (LETT #1# (SPADCALL |k| (QREFELT % 10)))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |x| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |x| (QREFELT % 71))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (LETT |u|
                                 (SPADCALL (SPADCALL |k| (QREFELT % 8))
                                           (QREFELT % 74)))
                           (EXIT
                            (COND
                             ((QEQCAR |u| 1)
                              (SPADCALL
                               (CONS
                                (SPADCALL
                                 (SPADCALL (SPADCALL |k| (QREFELT % 8))
                                           (QREFELT % 32))
                                 (QREFELT % 70))
                                |l|)
                               (QREFELT % 77)))
                             (#3# (SPADCALL |l| (QCDR |u|)))))))))))))))) 

(SDEFUN |KERNEL;convert;%P;23| ((|k| (%)) (% (|Pattern| (|Integer|))))
        (SPROG
         ((#1=#:G143 NIL) (|x| NIL) (#2=#:G142 NIL) (|l| (|List| (|Any|)))
          (|s| (|Pattern| (|Integer|))) (|v| (|Union| (|Symbol|) "failed"))
          (|o| (|BasicOperator|)))
         (SEQ (LETT |o| (SPADCALL |k| (QREFELT % 8)))
              (LETT |v| (SPADCALL |k| (QREFELT % 42)))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (SEQ
                  (LETT |s|
                        (SPADCALL (QCDR |v|)
                                  (SPADCALL |o| (QREFELT % 20) (QREFELT % 40))
                                  (SPADCALL |o| (QREFELT % 18) (QREFELT % 40))
                                  (SPADCALL |o| (QREFELT % 19) (QREFELT % 40))
                                  (QREFELT % 80)))
                  (EXIT
                   (COND ((NULL (LETT |l| (|KERNEL;preds| |o| %))) |s|)
                         (#3='T (SPADCALL |s| |l| (QREFELT % 82)))))))
                (#3#
                 (SPADCALL |o|
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |x| NIL)
                                 (LETT #1# (SPADCALL |k| (QREFELT % 10))) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |x| (QREFELT % 83))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT % 84)))))))) 

(SDEFUN |KERNEL;convert;%P;24| ((|k| (%)) (% (|Pattern| (|Float|))))
        (SPROG
         ((#1=#:G153 NIL) (|x| NIL) (#2=#:G152 NIL) (|l| (|List| (|Any|)))
          (|s| (|Pattern| (|Float|))) (|v| (|Union| (|Symbol|) "failed"))
          (|o| (|BasicOperator|)))
         (SEQ (LETT |o| (SPADCALL |k| (QREFELT % 8)))
              (LETT |v| (SPADCALL |k| (QREFELT % 42)))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (SEQ
                  (LETT |s|
                        (SPADCALL (QCDR |v|)
                                  (SPADCALL |o| (QREFELT % 20) (QREFELT % 40))
                                  (SPADCALL |o| (QREFELT % 18) (QREFELT % 40))
                                  (SPADCALL |o| (QREFELT % 19) (QREFELT % 40))
                                  (QREFELT % 86)))
                  (EXIT
                   (COND ((NULL (LETT |l| (|KERNEL;preds| |o| %))) |s|)
                         (#3='T (SPADCALL |s| |l| (QREFELT % 87)))))))
                (#3#
                 (SPADCALL |o|
                           (PROGN
                            (LETT #2# NIL)
                            (SEQ (LETT |x| NIL)
                                 (LETT #1# (SPADCALL |k| (QREFELT % 10))) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL |x| (QREFELT % 88))
                                               #2#))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT % 89)))))))) 

(DECLAIM (NOTINLINE |Kernel;|)) 

(DEFUN |Kernel;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Kernel| DV$1))
          (LETT % (GETREFV 92))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Float|))))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Integer|))))))))
          (|haddProp| |$ConstructorCache| '|Kernel| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 16 '|%symbol|)
          (QSETREFV % 17 '|%pmpredicate|)
          (QSETREFV % 18 '|%pmoptional|)
          (QSETREFV % 19 '|%pmmultiple|)
          (QSETREFV % 20 '|%pmconstant|)
          (QSETREFV % 21 '|%specialDisp|)
          (QSETREFV % 22 '|%specialEqual|)
          (QSETREFV % 23 '|%specialInput|)
          (SPADCALL (QREFELT % 25))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 78
                      (CONS (|dispatchFunction| |KERNEL;convert;%If;22|) %))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV % 85
                      (CONS (|dispatchFunction| |KERNEL;convert;%P;23|) %))))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV % 90
                      (CONS (|dispatchFunction| |KERNEL;convert;%P;24|) %))))
          %))) 

(DEFUN |Kernel| (#1=#:G154)
  (SPROG NIL
         (PROG (#2=#:G155)
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

(MAKEPROP '|Kernel| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|BasicOperator|)
              |KERNEL;operator;%Bo;1| (|List| 6) |KERNEL;argument;%L;2|
              (|NonNegativeInteger|) |KERNEL;height;%Nni;3|
              |KERNEL;position;%Nni;4| (|Void|) |KERNEL;setPosition;%NniV;5|
              'SYMBOL 'PMPRED 'PMOPT 'PMMULT 'PMCONST 'SPECIALDISP
              'SPECIALEQUAL 'SPECIALINPUT (|SortedCache| $$) (0 . |clearCache|)
              (|Boolean|) (|Symbol|) (4 . |is?|) |KERNEL;is?;%SB;7| (10 . =)
              |KERNEL;is?;%BoB;8| (16 . |name|) |KERNEL;name;%S;9|
              (21 . |operator|) (27 . |assert|) |KERNEL;kernel;BoLNni%;19|
              |KERNEL;kernel;S%;11| (|Union| (|None|) '"failed")
              (33 . |property|) (39 . |has?|) (|Union| 27 '"failed")
              |KERNEL;symbolIfCan;%U;13| (45 . ~=) (51 . ~=)
              (|Union| $$ '"failed") (|Mapping| 64 $$ $$) (57 . |binarySearch|)
              (|Mapping| 26 $$) (63 . |linearSearch|) (68 . |enterInCache|)
              |KERNEL;=;2%B;17| |KERNEL;<;2%B;18| (|Union| 11 '"failed")
              (74 . |arity|) (|OutputForm|) (79 . |coerce|) (84 . |coerce|)
              (|Mapping| 55 (|List| 55)) (|Union| 58 '"failed")
              (89 . |display|) (|List| %) (94 . |prefix|)
              |KERNEL;coerce;%Of;20| (|Integer|) (100 . ~=) (106 . <)
              (112 . ~=) (118 . |smaller?|) (|InputForm|) (124 . |convert|)
              (129 . |convert|) (|Mapping| 69 (|List| 69))
              (|Union| 72 '"failed") (134 . |input|) (|Pattern| (|Float|))
              (139 . |convert|) (144 . |convert|) (149 . |convert|)
              (|Pattern| 64) (154 . |patternVariable|) (|List| (|Any|))
              (162 . |setPredicates|) (168 . |convert|) (173 . |elt|)
              (179 . |convert|) (184 . |patternVariable|)
              (192 . |setPredicates|) (198 . |convert|) (203 . |elt|)
              (209 . |convert|) (|String|))
           '#(~= 214 |symbolIfCan| 220 |smaller?| 225 |setPosition| 231
              |position| 237 |operator| 242 |name| 247 |min| 252 |max| 258
              |latex| 264 |kernel| 269 |is?| 281 |height| 293 |convert| 298
              |coerce| 313 |argument| 318 >= 323 > 329 = 335 <= 341 < 347)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(0 0 0 0 0 0 3 2 1 0 0 0))
                 (CONS
                  '#(NIL |OrderedSet&| NIL NIL |SetCategory&| NIL NIL NIL NIL
                     NIL |BasicType&| |PartialOrder&|)
                  (CONS
                   '#((|KernelCategory| 6) (|OrderedSet|) (|Comparable|)
                      (|CachableSet|) (|SetCategory|) (|Patternable| 6)
                      (|ConvertibleTo| 79) (|ConvertibleTo| 75)
                      (|ConvertibleTo| 69) (|CoercibleTo| 55) (|BasicType|)
                      (|PartialOrder|))
                   (|makeByteWordVec2| 91
                                       '(0 24 14 25 2 7 26 0 27 28 2 7 26 0 0
                                         30 1 7 27 0 32 2 7 0 27 11 34 2 7 0 0
                                         27 35 2 7 38 0 27 39 2 7 26 0 27 40 2
                                         11 26 0 0 43 2 7 26 0 0 44 2 24 45 2
                                         46 47 1 24 45 48 49 2 24 2 2 46 50 1 7
                                         53 0 54 1 27 55 0 56 1 6 55 0 57 1 7
                                         59 0 60 2 55 0 0 61 62 2 64 26 0 0 65
                                         2 7 26 0 0 66 2 6 26 0 0 67 2 6 26 0 0
                                         68 1 27 69 0 70 1 6 69 0 71 1 7 73 0
                                         74 1 27 75 0 76 1 69 0 61 77 1 0 69 0
                                         78 4 79 0 27 26 26 26 80 2 79 0 0 81
                                         82 1 6 79 0 83 2 79 0 7 61 84 1 0 79 0
                                         85 4 75 0 27 26 26 26 86 2 75 0 0 81
                                         87 1 6 75 0 88 2 75 0 7 61 89 1 0 75 0
                                         90 2 0 26 0 0 1 1 0 41 0 42 2 0 26 0 0
                                         1 2 0 14 0 11 15 1 0 11 0 13 1 0 7 0 8
                                         1 0 27 0 33 2 0 0 0 0 1 2 0 0 0 0 1 1
                                         0 91 0 1 3 0 0 7 9 11 36 1 0 0 27 37 2
                                         0 26 0 7 31 2 0 26 0 27 29 1 0 11 0 12
                                         1 1 69 0 78 1 2 75 0 90 1 3 79 0 85 1
                                         0 55 0 63 1 0 9 0 10 2 0 26 0 0 1 2 0
                                         26 0 0 1 2 0 26 0 0 51 2 0 26 0 0 1 2
                                         0 26 0 0 52)))))
           '|lookupComplete|)) 
