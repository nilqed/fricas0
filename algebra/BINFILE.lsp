
(SDEFUN |BINFILE;defstream|
        ((|fn| |FileName|) (|mode| |String|) ($ |SExpression|))
        (COND
         ((EQUAL |mode| "input")
          (COND
           ((NULL (SPADCALL |fn| (QREFELT $ 9)))
            (|error|
             (LIST '|mathprint|
                   (LIST 'CONCAT
                         (SPADCALL "File is not readable" (QREFELT $ 12))
                         (SPADCALL |fn| (QREFELT $ 13))))))
           (#1='T (BINARY_OPEN_INPUT (SPADCALL |fn| (QREFELT $ 14))))))
         ((EQUAL |mode| "output")
          (COND
           ((NULL (SPADCALL |fn| (QREFELT $ 15)))
            (|error|
             (LIST '|mathprint|
                   (LIST 'CONCAT
                         (SPADCALL "File is not writable" (QREFELT $ 12))
                         (SPADCALL |fn| (QREFELT $ 13))))))
           (#1# (BINARY_OPEN_OUTPUT (SPADCALL |fn| (QREFELT $ 14))))))
         ('T
          (|error|
           (LIST '|mathprint|
                 (LIST 'CONCAT
                       (SPADCALL "IO mode must be input or output"
                                 (QREFELT $ 12))
                       (SPADCALL |mode| (QREFELT $ 12)))))))) 

(SDEFUN |BINFILE;open;FnS$;2| ((|fname| |FileName|) (|mode| |String|) ($ $))
        (SPROG ((|fstream| (|SExpression|)))
               (SEQ (LETT |fstream| (|BINFILE;defstream| |fname| |mode| $))
                    (EXIT (VECTOR |fname| |fstream| |mode|))))) 

(SDEFUN |BINFILE;reopen!;$S$;3| ((|f| $) (|mode| |String|) ($ $))
        (SPROG ((|fname| (|FileName|)))
               (SEQ (LETT |fname| (QVELT |f| 0))
                    (QSETVELT |f| 1 (|BINFILE;defstream| |fname| |mode| $))
                    (QSETVELT |f| 2 |mode|) (EXIT |f|)))) 

(SDEFUN |BINFILE;close!;2$;4| ((|f| $) ($ $))
        (SEQ
         (COND
          ((EQUAL (QVELT |f| 2) "output")
           (SEQ (BINARY_CLOSE_OUTPUT) (EXIT |f|)))
          ((EQUAL (QVELT |f| 2) "input") (SEQ (BINARY_CLOSE_INPUT) (EXIT |f|)))
          ('T (|error| "file must be in read or write state"))))) 

(SDEFUN |BINFILE;read!;$Si;5| ((|f| $) ($ |SingleInteger|))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 19))
           (|error| "File not in read state"))
          ('T
           (SEQ (BINARY_SELECT_INPUT (QVELT |f| 1))
                (EXIT (BINARY_READBYTE))))))) 

(SDEFUN |BINFILE;readIfCan!;$U;6|
        ((|f| $) ($ |Union| (|SingleInteger|) "failed"))
        (SPROG ((|n| (|SingleInteger|)))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 19))
                  (|error| "File not in read state"))
                 (#1='T
                  (SEQ (BINARY_SELECT_INPUT (QVELT |f| 1))
                       (LETT |n| (BINARY_READBYTE))
                       (EXIT
                        (COND ((|eql_SI| |n| -1) (CONS 1 "failed"))
                              (#1# (CONS 0 |n|)))))))))) 

(SDEFUN |BINFILE;write!;$2Si;7|
        ((|f| $) (|x| . #1=(|SingleInteger|)) ($ . #1#))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "output" (QREFELT $ 19))
           (|error| "File not in write state"))
          ((OR (|less_SI| |x| 0) (> |x| 255))
           (|error| "integer cannot be represented as a byte"))
          ('T (SEQ (BINARY_PRINBYTE |x|) (EXIT |x|)))))) 

(SDEFUN |BINFILE;position;$Si;8| ((|f| $) ($ |SingleInteger|))
        (COND
         ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 19))
          (|error| "file must be in read state"))
         ('T (FILE-POSITION (QVELT |f| 1))))) 

(SDEFUN |BINFILE;position!;$2Si;9|
        ((|f| $) (|i| |SingleInteger|) ($ |SingleInteger|))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 19))
           (|error| "file must be in read state"))
          ('T (SEQ (FILE-POSITION (QVELT |f| 1) |i|) (EXIT |i|)))))) 

(DECLAIM (NOTINLINE |BinaryFile;|)) 

(DEFUN |BinaryFile| ()
  (SPROG NIL
         (PROG (#1=#:G432)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BinaryFile|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BinaryFile|
                             (LIST (CONS NIL (CONS 1 (|BinaryFile;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|BinaryFile|)))))))))) 

(DEFUN |BinaryFile;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BinaryFile|))
          (LETT $ (GETREFV 29))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BinaryFile| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |fileName| (|FileName|))
                              (|:| |fileState| (|SExpression|))
                              (|:| |fileIOmode| (|String|))))
          $))) 

(MAKEPROP '|BinaryFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|File| 20) '|Rep| (|Boolean|) (|FileName|)
              (0 . |readable?|) (|OutputForm|) (|String|) (5 . |coerce|)
              (10 . |coerce|) (15 . |coerce|) (20 . |writable?|)
              |BINFILE;open;FnS$;2| |BINFILE;reopen!;$S$;3|
              |BINFILE;close!;2$;4| (25 . ~=) (|SingleInteger|)
              |BINFILE;read!;$Si;5| (|Union| 20 '"failed")
              |BINFILE;readIfCan!;$U;6| |BINFILE;write!;$2Si;7|
              |BINFILE;position;$Si;8| |BINFILE;position!;$2Si;9| (|Void|)
              (|HashState|))
           '#(|write!| 31 |reopen!| 37 |readIfCan!| 43 |read!| 48 |position!|
              53 |position| 59 |open| 64 |close!| 70)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|FileCategory| 8 20) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 10))
                        (|makeByteWordVec2| 26
                                            '(1 8 7 0 9 1 11 10 0 12 1 8 10 0
                                              13 1 8 11 0 14 1 8 7 0 15 2 11 7
                                              0 0 19 2 0 20 0 20 24 2 0 0 0 11
                                              17 1 0 22 0 23 1 0 20 0 21 2 0 20
                                              0 20 26 1 0 20 0 25 2 0 0 8 11 16
                                              1 0 0 0 18)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|BinaryFile| 'NILADIC T) 
