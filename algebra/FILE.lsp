
(SDEFUN |FILE;=;2%B;1| ((|f1| (%)) (|f2| (%)) (% (|Boolean|)))
        (SPADCALL (QVELT |f1| 0) (QVELT |f2| 0) (QREFELT % 10))) 

(SDEFUN |FILE;coerce;%Of;2| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL (QVELT |f| 0) (QREFELT % 13))) 

(SDEFUN |FILE;open;Fn%;3| ((|fname| (|FileName|)) (% (%)))
        (SPADCALL |fname| "input" (QREFELT % 16))) 

(SDEFUN |FILE;open;FnS%;4| ((|fname| (|FileName|)) (|mode| (|String|)) (% (%)))
        (SPROG ((|fstream| (|BasicFile|)))
               (SEQ (LETT |fstream| (SPADCALL |fname| |mode| (QREFELT % 19)))
                    (EXIT (VECTOR |fname| |fstream| |mode|))))) 

(SDEFUN |FILE;reopen!;%S%;5| ((|f| (%)) (|mode| (|String|)) (% (%)))
        (SPROG ((|fname| (|FileName|)))
               (SEQ
                (COND
                 ((EQUAL (QVELT |f| 2) "output")
                  (SPADCALL |f| (QREFELT % 21))))
                (LETT |fname| (QVELT |f| 0))
                (QSETVELT |f| 1 (SPADCALL |fname| |mode| (QREFELT % 19)))
                (QSETVELT |f| 2 |mode|) (EXIT |f|)))) 

(SDEFUN |FILE;close!;2%;6| ((|f| (%)) (% (%)))
        (SEQ (SPADCALL (QVELT |f| 1) (QREFELT % 23)) (QSETVELT |f| 2 "closed")
             (EXIT |f|))) 

(PUT '|FILE;name;%Fn;7| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |FILE;name;%Fn;7| ((|f| (%)) (% (|FileName|))) (QVELT |f| 0)) 

(PUT '|FILE;iomode;%S;8| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |FILE;iomode;%S;8| ((|f| (%)) (% (|String|))) (QVELT |f| 2)) 

(SDEFUN |FILE;read!;%S;9| ((|f| (%)) (% (S)))
        (COND
         ((SPADCALL (QVELT |f| 2) "input" (QREFELT % 27))
          (|error| "File not in read state"))
         ('T (SPADCALL (QVELT |f| 1) (QREFELT % 29))))) 

(SDEFUN |FILE;readIfCan!;%U;10| ((|f| (%)) (% (|Union| S "failed")))
        (SPROG ((|res1| (|Union| (|None|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |f| 2) "input" (QREFELT % 27))
                  (|error| "File not in read state"))
                 (#1='T
                  (SEQ (LETT |res1| (SPADCALL (QVELT |f| 1) (QREFELT % 32)))
                       (EXIT
                        (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                              (#1# (CONS 0 (QCDR |res1|))))))))))) 

(SDEFUN |FILE;write!;%2S;11| ((|f| (%)) (|x| (S)) (% (S)))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "output" (QREFELT % 27))
           (|error| "File not in write state"))
          ('T (SEQ (SPADCALL (QVELT |f| 1) |x| (QREFELT % 35)) (EXIT |x|)))))) 

(SDEFUN |FILE;flush;%V;12| ((|f| (%)) (% (|Void|)))
        (COND
         ((SPADCALL (QVELT |f| 2) "output" (QREFELT % 27))
          (|error| "File not in write state"))
         ('T (SPADCALL (QVELT |f| 1) (QREFELT % 37))))) 

(DECLAIM (NOTINLINE |File;|)) 

(DEFUN |File;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|File| DV$1))
          (LETT % (GETREFV 38))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|File| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |fileName| (|FileName|))
                              (|:| |fileState| (|BasicFile|))
                              (|:| |fileIOmode| (|String|))))
          %))) 

(DEFUN |File| (#1=#:G44)
  (SPROG NIL
         (PROG (#2=#:G45)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|File|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|File;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|File|)))))))))) 

(MAKEPROP '|File| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              (|FileName|) (0 . =) |FILE;=;2%B;1| (|OutputForm|) (6 . |coerce|)
              |FILE;coerce;%Of;2| (|String|) |FILE;open;FnS%;4|
              |FILE;open;Fn%;3| (|BasicFile|) (11 . |open|) (|Void|)
              |FILE;flush;%V;12| |FILE;reopen!;%S%;5| (17 . |close!|)
              |FILE;close!;2%;6| |FILE;name;%Fn;7| |FILE;iomode;%S;8| (22 . ~=)
              (|None|) (28 . |read|) |FILE;read!;%S;9| (|Union| 28 '"failed")
              (33 . |readIfCan|) (|Union| 6 '"failed") |FILE;readIfCan!;%U;10|
              (38 . |write!|) |FILE;write!;%2S;11| (44 . |flush|))
           '#(~= 49 |write!| 55 |reopen!| 61 |readIfCan!| 67 |read!| 72 |open|
              77 |name| 88 |latex| 93 |iomode| 98 |flush| 103 |coerce| 108
              |close!| 113 = 118)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FileCategory| 9 6) (|SetCategory|)
                           (|CoercibleTo| 12) (|BasicType|))
                        (|makeByteWordVec2| 37
                                            '(2 9 8 0 0 10 1 9 12 0 13 2 18 0 9
                                              15 19 1 18 20 0 23 2 15 8 0 0 27
                                              1 18 28 0 29 1 18 31 0 32 2 18 20
                                              0 28 35 1 18 20 0 37 2 0 8 0 0 1
                                              2 0 6 0 6 36 2 0 0 0 15 22 1 0 33
                                              0 34 1 0 6 0 30 2 0 0 9 15 16 1 0
                                              0 9 17 1 0 9 0 25 1 0 15 0 1 1 0
                                              15 0 26 1 0 20 0 21 1 0 12 0 14 1
                                              0 0 0 24 2 0 8 0 0 11)))))
           '|lookupComplete|)) 
