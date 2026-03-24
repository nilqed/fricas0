
(SDEFUN |BASFILE;open;FnS%;1| ((|fn| (|FileName|)) (|mode| (|String|)) (% (%)))
        (COND
         ((EQUAL |mode| "input")
          (COND
           ((NULL (SPADCALL |fn| (QREFELT % 8)))
            (|error|
             (LIST '|mathprint|
                   (LIST 'CONCAT
                         (SPADCALL "File is not readable" (QREFELT % 11))
                         (SPADCALL |fn| (QREFELT % 12))))))
           (#1='T (MAKE_INSTREAM (SPADCALL |fn| (QREFELT % 13))))))
         ((EQUAL |mode| "output")
          (COND
           ((NULL (SPADCALL |fn| (QREFELT % 14)))
            (|error|
             (LIST '|mathprint|
                   (LIST 'CONCAT
                         (SPADCALL "File is not writable" (QREFELT % 11))
                         (SPADCALL |fn| (QREFELT % 12))))))
           (#1# (MAKE_OUTSTREAM (SPADCALL |fn| (QREFELT % 13))))))
         ('T
          (|error|
           (LIST '|mathprint|
                 (LIST 'CONCAT
                       (SPADCALL "IO mode must be input or output"
                                 (QREFELT % 11))
                       (SPADCALL |mode| (QREFELT % 11)))))))) 

(PUT '|BASFILE;close!;%V;2| '|SPADreplace| 'SHUT) 

(SDEFUN |BASFILE;close!;%V;2| ((|f| (%)) (% (|Void|))) (SHUT |f|)) 

(SDEFUN |BASFILE;readIfCan;%U;3| ((|f| (%)) (% (|Union| (|None|) "failed")))
        (SPROG ((|res1| (|None|)))
               (SEQ (LETT |res1| (READ |f| NIL |$eof_marker|))
                    (EXIT
                     (COND ((|eof_marker?| |res1|) (CONS 1 "failed"))
                           ('T (CONS 0 (SPADCALL |res1| (QREFELT % 20))))))))) 

(SDEFUN |BASFILE;read;%N;4| ((|f| (%)) (% (|None|)))
        (SPROG ((|res1| (|None|)))
               (SEQ (LETT |res1| (READ |f| NIL |$eof_marker|))
                    (EXIT
                     (COND ((|eof_marker?| |res1|) (|error| "End of file"))
                           ('T (SPADCALL |res1| (QREFELT % 20)))))))) 

(SDEFUN |BASFILE;write!;%NV;5| ((|f| (%)) (|d| (|None|)) (% (|Void|)))
        (SPROG ((|res1| (|Union| (|None|) "failed")))
               (SEQ
                (LETT |res1| (|trappedSpadEval| (SPADCALL |d| (QREFELT % 24))))
                (EXIT
                 (COND
                  ((QEQCAR |res1| 1)
                   (|error| "The value cannot be saved to a file."))
                  ('T (|write_to_stream| (QCDR |res1|) |f|))))))) 

(PUT '|BASFILE;flush;%V;6| '|SPADreplace| 'FORCE-OUTPUT) 

(SDEFUN |BASFILE;flush;%V;6| ((|f| (%)) (% (|Void|))) (FORCE-OUTPUT |f|)) 

(DECLAIM (NOTINLINE |BasicFile;|)) 

(DEFUN |BasicFile;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BasicFile|))
          (LETT % (GETREFV 27))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BasicFile| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |BasicFile| ()
  (SPROG NIL
         (PROG (#1=#:G27)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BasicFile|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BasicFile|
                             (LIST (CONS NIL (CONS 1 (|BasicFile;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|BasicFile|)))))))))) 

(MAKEPROP '|BasicFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|FileName|)
              (0 . |readable?|) (|OutputForm|) (|String|) (5 . |coerce|)
              (10 . |coerce|) (15 . |coerce|) (20 . |writable?|)
              |BASFILE;open;FnS%;1| (|Void|) |BASFILE;close!;%V;2| (|None|)
              (|FileSerialization|) (25 . |deserialize|) (|Union| 18 '"failed")
              |BASFILE;readIfCan;%U;3| |BASFILE;read;%N;4| (30 . |serialize|)
              |BASFILE;write!;%NV;5| |BASFILE;flush;%V;6|)
           '#(|write!| 35 |readIfCan| 41 |read| 46 |open| 51 |flush| 57
              |close!| 62)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|open| ($$ (|FileName|) (|String|))) T)
                                   '((|close!| ((|Void|) $$)) T)
                                   '((|read| ((|None|) $$)) T)
                                   '((|readIfCan|
                                      ((|Union| (|None|) "failed") $$))
                                     T)
                                   '((|write!| ((|Void|) $$ (|None|))) T)
                                   '((|flush| ((|Void|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 26
                                            '(1 7 6 0 8 1 10 9 0 11 1 7 9 0 12
                                              1 7 10 0 13 1 7 6 0 14 1 19 18 18
                                              20 1 19 18 18 24 2 0 16 0 18 25 1
                                              0 21 0 22 1 0 18 0 23 2 0 0 7 10
                                              15 1 0 16 0 26 1 0 16 0 17)))))
           '|lookupComplete|)) 
