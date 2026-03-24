
(SDEFUN |BKAFILE;open;FnS%;1| ((|fn| (|FileName|)) (|mode| (|String|)) (% (%)))
        (COND
         ((OR (EQUAL |mode| "input") (EQUAL |mode| "output"))
          (|kaf_open| (SPADCALL |fn| (QREFELT % 8)) (EQUAL |mode| "output")))
         ('T
          (|error|
           (LIST '|mathprint|
                 (LIST 'CONCAT
                       (SPADCALL "IO mode must be input or output"
                                 (QREFELT % 10))
                       (SPADCALL |mode| (QREFELT % 10)))))))) 

(PUT '|BKAFILE;close!;%V;2| '|SPADreplace| '|kaf_close|) 

(SDEFUN |BKAFILE;close!;%V;2| ((|f| (%)) (% (|Void|))) (|kaf_close| |f|)) 

(SDEFUN |BKAFILE;read;%SN;3| ((|f| (%)) (|key| (|String|)) (% (|None|)))
        (SPADCALL (|kaf_read| |f| |key| |$error_mark|) (QREFELT % 16))) 

(SDEFUN |BKAFILE;write!;%SNV;4|
        ((|f| (%)) (|key| (|String|)) (|val| (|None|)) (% (|Void|)))
        (SPROG ((|res1| (|Union| (|None|) "failed")))
               (SEQ
                (LETT |res1|
                      (|trappedSpadEval| (SPADCALL |val| (QREFELT % 18))))
                (EXIT
                 (COND
                  ((QEQCAR |res1| 1) (|error| "can not save value to file"))
                  ('T (|kaf_write| |f| |key| (QCDR |res1|)))))))) 

(PUT '|BKAFILE;remove!;%SV;5| '|SPADreplace| '|kaf_remove|) 

(SDEFUN |BKAFILE;remove!;%SV;5| ((|f| (%)) (|key| (|String|)) (% (|Void|)))
        (|kaf_remove| |f| |key|)) 

(PUT '|BKAFILE;keys;%L;6| '|SPADreplace| '|rkeys2|) 

(SDEFUN |BKAFILE;keys;%L;6| ((|f| (%)) (% (|List| (|String|)))) (|rkeys2| |f|)) 

(DECLAIM (NOTINLINE |BasicKeyedAccessFile;|)) 

(DEFUN |BasicKeyedAccessFile;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BasicKeyedAccessFile|))
          (LETT % (GETREFV 23))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BasicKeyedAccessFile| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |BasicKeyedAccessFile| ()
  (SPROG NIL
         (PROG (#1=#:G12)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BasicKeyedAccessFile|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BasicKeyedAccessFile|
                             (LIST
                              (CONS NIL (CONS 1 (|BasicKeyedAccessFile;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|BasicKeyedAccessFile|)))))))))) 

(MAKEPROP '|BasicKeyedAccessFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|FileName|) (0 . |coerce|)
              (|OutputForm|) (5 . |coerce|) |BKAFILE;open;FnS%;1| (|Void|)
              |BKAFILE;close!;%V;2| (|None|) (|FileSerialization|)
              (10 . |deserialize|) |BKAFILE;read;%SN;3| (15 . |serialize|)
              |BKAFILE;write!;%SNV;4| |BKAFILE;remove!;%SV;5| (|List| 6)
              |BKAFILE;keys;%L;6|)
           '#(|write!| 20 |remove!| 27 |read| 33 |open| 39 |keys| 45 |close!|
              50)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|open| ($$ (|FileName|) (|String|))) T)
                                   '((|close!| ((|Void|) $$)) T)
                                   '((|read| ((|None|) $$ (|String|))) T)
                                   '((|write!|
                                      ((|Void|) $$ (|String|) (|None|)))
                                     T)
                                   '((|remove!| ((|Void|) $$ (|String|))) T)
                                   '((|keys| ((|List| (|String|)) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 22
                                            '(1 7 6 0 8 1 6 9 0 10 1 15 14 14
                                              16 1 15 14 14 18 3 0 12 0 6 14 19
                                              2 0 12 0 6 20 2 0 14 0 6 17 2 0 0
                                              7 6 11 1 0 21 0 22 1 0 12 0
                                              13)))))
           '|lookupComplete|)) 
