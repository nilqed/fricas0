
(PUT '|FILSER;l_to_s| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |FILSER;l_to_s| ((|l| (|List| (|SExpression|))) (% (|SExpression|)))
        |l|) 

(SDEFUN |FILSER;spadClosure?| ((|d| (|None|)) (% (|None|)))
        (SPROG ((|name| (|None|)) (|fun| (|None|)))
               (SEQ (LETT |fun| (QCAR |d|))
                    (COND ((NULL (FUNCTIONP |fun|)) (EXIT NIL)))
                    (EXIT
                     (COND
                      ((OR (NULL (LETT |name| (BPINAME |fun|)))
                           (NULL (VECP (QCDR |d|))))
                       NIL)
                      ('T |name|)))))) 

(SDEFUN |FILSER;get_type_tag| ((|lt| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|res| (|SExpression|)) (|ct| (|SExpression|)) (#1=#:G59 NIL)
          (|tp| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |tp| NIL) (LETT #1# (QREFELT % 11)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |tp| (CAR #1#)) NIL)
                         (NULL (NULL |res|)))
                     (GO G191)))
                   (SEQ (LETT |ct| (QCDR |tp|))
                        (EXIT
                         (COND
                          ((SUBTYPEP |lt| |ct|)
                           (COND
                            ((SUBTYPEP |ct| |lt|)
                             (LETT |res|
                                   (SPADCALL (QCAR |tp|) (QREFELT % 8)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FILSER;get_lisp_type| ((|tt| (|Symbol|)) (% (|SExpression|)))
        (SPROG ((|res| (|SExpression|)) (#1=#:G65 NIL) (|tp| NIL))
               (SEQ (LETT |res| 'NIL)
                    (SEQ (LETT |tp| NIL) (LETT #1# (QREFELT % 11)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |tp| (CAR #1#)) NIL)
                               (NULL (NULL |res|)))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQUAL |tt| (QCAR |tp|))
                             (LETT |res| (QCDR |tp|))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |FILSER;do_serialize|
        ((|d| (|None|)) (|seen| (|HashTable| (|None|) (|None|) "EQ"))
         (% #1=(|None|)))
        (SPROG
         ((#2=#:G112 NIL) (|k| NIL) (#3=#:G111 NIL) (|keys| (|List| (|None|)))
          (|nd| (|None|)) (#4=#:G110 NIL) (|i| NIL)
          (|nv| #5=(|PrimitiveArray| (|None|))) (|n| (|NonNegativeInteger|))
          (|dims| (|None|)) (|tt| (|SExpression|)) (#6=#:G109 NIL)
          (#7=#:G108 NIL) (|noa| #5#) (|oa| (|PrimitiveArray| (|None|)))
          (|d1| #1#) (|qcdr| (|None|)) (|qcar| (|None|)) (|name| (|None|))
          (|e| (|None|)))
         (SEQ
          (COND ((NULL |d|) NIL)
                ((NULL (NULL (LETT |e| (HGET |seen| |d|)))) |e|)
                (#8='T
                 (COND
                  ((PAIRP |d|)
                   (SEQ (LETT |qcar| (QCAR |d|)) (LETT |qcdr| (QCDR |d|))
                        (EXIT
                         (COND
                          ((EQUAL |qcar| (|function| |newGoGet|))
                           (|FILSER;do_serialize| (|replaceGoGetSlot| |qcdr|)
                            |seen| %))
                          ((NULL
                            (NULL (LETT |name| (|FILSER;spadClosure?| |d| %))))
                           (SEQ
                            (LETT |d1| (|FILSER;do_serialize| |qcdr| |seen| %))
                            (LETT |nd|
                                  (LIST 'WRITIFIED!! 'SPADCLOSURE |d1| |name|))
                            (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                            (EXIT |nd|)))
                          (#8#
                           (SEQ (LETT |nd| (CONS |qcar| |qcdr|))
                                (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                                (LETT |qcar|
                                      (|FILSER;do_serialize| |qcar| |seen| %))
                                (LETT |qcdr|
                                      (|FILSER;do_serialize| |qcdr| |seen| %))
                                (QRPLACA |nd| |qcar|) (QRPLACD |nd| |qcdr|)
                                (EXIT |nd|)))))))
                  ((VECP |d|)
                   (COND
                    ((|isDomainOrPackage| |d|)
                     (SEQ (LETT |d1| (|mkEvalable| (|devaluate| |d|)))
                          (LETT |nd|
                                (LIST 'WRITIFIED!! 'DEVALUATED
                                      (|FILSER;do_serialize| |d1| |seen| %)))
                          (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                          (EXIT |nd|)))
                    (#9='T
                     (SEQ (LETT |oa| |d|)
                          (EXIT
                           (COND
                            ((SPADCALL |oa| (QREFELT % 17))
                             (SEQ (SPADCALL |seen| |d| |d| (QREFELT % 18))
                                  (EXIT |d|)))
                            (#9#
                             (SEQ (LETT |n| (QVSIZE |oa|))
                                  (LETT |noa| (MAKEARR1 |n| (QAREF1 |oa| 0)))
                                  (LETT |nd| |noa|)
                                  (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                                  (SEQ (LETT |i| 0) (LETT #7# (- |n| 1)) G190
                                       (COND
                                        ((|greater_SI| |i| #7#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (QSETAREF1 |noa| |i|
                                                    (|FILSER;do_serialize|
                                                     (QAREF1 |oa| |i|) |seen|
                                                     %))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT |nd|)))))))))
                  ((GENERAL_ARRAY? |d|)
                   (SEQ (LETT |nd| (MAKE-ARRAY (ARRAY-DIMENSIONS |d|)))
                        (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                        (LETT |n| (ARRAY-TOTAL-SIZE |d|))
                        (SEQ (LETT |i| 0) (LETT #6# (- |n| 1)) G190
                             (COND ((|greater_SI| |i| #6#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SETF (ROW-MAJOR-AREF |nd| |i|)
                                       (|FILSER;do_serialize|
                                        (ROW-MAJOR-AREF |d| |i|) |seen| %))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |nd|)))
                  ((|is_BVEC| |d|) |d|)
                  ((STRINGP |d|)
                   (COND
                    ((EQ |d| |$NullStream|) (LIST 'WRITIFIED!! 'NULLSTREAM))
                    ((EQ |d| |$NonNullStream|)
                     (LIST 'WRITIFIED!! 'NONNULLSTREAM))
                    (#9# |d|)))
                  ((ARRAYP |d|)
                   (SEQ
                    (LETT |tt|
                          (|FILSER;get_type_tag| (ARRAY-ELEMENT-TYPE |d|) %))
                    (COND
                     ((NULL (NULL |tt|))
                      (EXIT
                       (SEQ (LETT |dims| (ARRAY-DIMENSIONS |d|))
                            (LETT |n| (ARRAY-TOTAL-SIZE |d|))
                            (LETT |nv| (MAKEARR1 |n| NIL))
                            (LETT |nd|
                                  (LIST 'WRITIFIED!! 'TYARR |tt| |dims| |nv|))
                            (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                            (SEQ (LETT |i| 0) (LETT #4# (- |n| 1)) G190
                                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF1 |nv| |i|
                                              (|FILSER;do_serialize|
                                               (ROW-MAJOR-AREF |d| |i|) |seen|
                                               %))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |nd|)))))
                    (EXIT (|error| "serialize: failed uknown ARRAY"))))
                  ((SPAD_KERNEL-P |d|)
                   (SEQ
                    (LETT |nd|
                          (|makeSpadKernel| NIL NIL (SPAD_KERNEL-NEST |d|)))
                    (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                    (SETF (SPAD_KERNEL-OP |nd|)
                            (|FILSER;do_serialize| (SPAD_KERNEL-OP |d|) |seen|
                             %))
                    (SETF (SPAD_KERNEL-ARG |nd|)
                            (|FILSER;do_serialize| (SPAD_KERNEL-ARG |d|) |seen|
                             %))
                    (EXIT |nd|)))
                  ((EQ |d| 'WRITIFIED!!) (LIST 'WRITIFIED!! 'SELF))
                  ((COMPILED-FUNCTION-P |d|)
                   (|error| "serialize: failed COMPILED-FUNCTION"))
                  ((HASHTABLEP |d|)
                   (SEQ (LETT |nd| (LIST 'WRITIFIED!!))
                        (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                        (LETT |keys| (HKEYS |d|))
                        (QRPLACD |nd|
                                 (LIST 'HASHTABLE (HASHTABLE_CLASS |d|)
                                       (|FILSER;do_serialize| |keys| |seen| %)
                                       (PROGN
                                        (LETT #3# NIL)
                                        (SEQ (LETT |k| NIL) (LETT #2# |keys|)
                                             G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |k| (CAR #2#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #3#
                                                     (CONS
                                                      (|FILSER;do_serialize|
                                                       (HGET |d| |k|) |seen| %)
                                                      #3#))))
                                             (LETT #2# (CDR #2#)) (GO G190)
                                             G191 (EXIT (NREVERSE #3#))))))
                        (EXIT |nd|)))
                  ((FLOATP |d|)
                   (COND ((EQUAL |d| (READ-FROM-STRING (STRINGIMAGE |d|))) |d|)
                         (#9# (|error| "serialize: failed FLOAT"))))
                  (#9# |d|))))))) 

(SDEFUN |FILSER;serialize;2N;6| ((|d| (|None|)) (% (|None|)))
        (SPROG ((|seen| (|HashTable| (|None|) (|None|) "EQ")))
               (SEQ
                (COND ((NULL (|scan_for_unwritable| |d|)) |d|)
                      ('T
                       (SEQ (LETT |seen| (SPADCALL (QREFELT % 19)))
                            (EXIT (|FILSER;do_serialize| |d| |seen| %)))))))) 

(SDEFUN |FILSER;do_deserialize|
        ((|d| (|None|)) (|seen| (|HashTable| (|None|) (|None|) "EQ"))
         (% #1=(|None|)))
        (SPROG
         ((|nd| (|None|)) (#2=#:G155 NIL) (|i| NIL) (|n| (|Integer|))
          (#3=#:G154 NIL) (|noa| (|PrimitiveArray| (|None|)))
          (|oa| (|PrimitiveArray| (|None|))) (|qcdr| (|None|))
          (|qcar| (|None|)) (|name| #4=(|Symbol|)) (|vec| #1#) (#5=#:G152 NIL)
          (|k| NIL) (#6=#:G153 NIL) (#7=#:G151 NIL)
          (|ov| (|PrimitiveArray| (|None|))) (|lt| (|SExpression|))
          (|type| #4#) (|dl| (|List| (|SExpression|))) (|e| (|None|)))
         (SEQ
          (COND ((NULL |d|) NIL)
                ((NULL (NULL (LETT |e| (HGET |seen| |d|)))) |e|)
                ('T
                 (SEQ
                  (COND
                   ((PAIRP |d|)
                    (COND
                     ((EQ (|SPADfirst| |d|) 'WRITIFIED!!)
                      (EXIT
                       (SEQ (LETT |dl| |d|)
                            (LETT |type|
                                  (SPADCALL (SPADCALL |dl| 2 (QREFELT % 22))
                                            (QREFELT % 23)))
                            (EXIT
                             (COND ((EQUAL |type| 'SELF) 'WRITIFIED!!)
                                   ((EQUAL |type| 'TYARR)
                                    (SEQ
                                     (LETT |lt|
                                           (|FILSER;get_lisp_type|
                                            (SPADCALL
                                             (SPADCALL |dl| 3 (QREFELT % 22))
                                             (QREFELT % 23))
                                            %))
                                     (LETT |nd|
                                           (MAKE_TYPED_ARRAY
                                            (SPADCALL |dl| 4 (QREFELT % 22))
                                            |lt|))
                                     (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                                     (LETT |ov|
                                           (SPADCALL |dl| 5 (QREFELT % 22)))
                                     (LETT |n| (ARRAY-TOTAL-SIZE |nd|))
                                     (SEQ (LETT |i| 0) (LETT #7# (- |n| 1))
                                          G190
                                          (COND
                                           ((|greater_SI| |i| #7#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SETF (ROW-MAJOR-AREF |nd| |i|)
                                                    (|FILSER;do_deserialize|
                                                     (QAREF1 |ov| |i|) |seen|
                                                     %))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT |nd|)))
                                   ((EQUAL |type| 'HASHTABLE)
                                    (SEQ
                                     (LETT |nd|
                                           (MAKE_HASHTABLE
                                            (SPADCALL |dl| 3 (QREFELT % 22))))
                                     (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                                     (SEQ
                                      (LETT #6#
                                            (SPADCALL
                                             (SPADCALL |dl| 5 (QREFELT % 22))
                                             (QREFELT % 25)))
                                      (LETT |k| NIL)
                                      (LETT #5#
                                            (SPADCALL
                                             (SPADCALL |dl| 4 (QREFELT % 22))
                                             (QREFELT % 25)))
                                      G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN (LETT |k| (CAR #5#)) NIL)
                                            (ATOM #6#)
                                            (PROGN (LETT |e| (CAR #6#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (HPUT |nd|
                                              (|FILSER;do_deserialize| |k|
                                               |seen| %)
                                              (|FILSER;do_deserialize| |e|
                                               |seen| %))))
                                      (LETT #5#
                                            (PROG1 (CDR #5#)
                                              (LETT #6# (CDR #6#))))
                                      (GO G190) G191 (EXIT NIL))
                                     (EXIT |nd|)))
                                   ((EQUAL |type| 'DEVALUATED)
                                    (SEQ
                                     (LETT |nd|
                                           (EVAL
                                            (|FILSER;do_deserialize|
                                             (SPADCALL |dl| 3 (QREFELT % 22))
                                             |seen| %)))
                                     (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                                     (EXIT |nd|)))
                                   ((EQUAL |type| 'SPADCLOSURE)
                                    (SEQ
                                     (LETT |vec|
                                           (|FILSER;do_deserialize|
                                            (SPADCALL |dl| 3 (QREFELT % 22))
                                            |seen| %))
                                     (LETT |name|
                                           (SPADCALL
                                            (SPADCALL |dl| 4 (QREFELT % 22))
                                            (QREFELT % 23)))
                                     (COND
                                      ((NULL (FBOUNDP |name|))
                                       (EXIT
                                        (|error|
                                         (LIST '|mathprint|
                                               (LIST 'CONCAT
                                                     (SPADCALL
                                                      "undefined function: "
                                                      (QREFELT % 29))
                                                     (SPADCALL
                                                      (SPADCALL |name|
                                                                (QREFELT % 27))
                                                      (QREFELT % 29))))))))
                                     (LETT |nd|
                                           (CONS (SYMBOL-FUNCTION |name|)
                                                 |vec|))
                                     (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                                     (EXIT |nd|)))
                                   ((EQUAL |type| 'NULLSTREAM) |$NullStream|)
                                   ((EQUAL |type| 'NONNULLSTREAM)
                                    |$NonNullStream|)
                                   (#8='T
                                    (|error|
                                     "Unknown type to deserialize."))))))))))
                  (EXIT
                   (COND
                    ((PAIRP |d|)
                     (SEQ (LETT |qcar| (QCAR |d|)) (LETT |qcdr| (QCDR |d|))
                          (LETT |nd| (CONS |qcar| |qcdr|))
                          (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                          (QRPLACA |nd|
                                   (|FILSER;do_deserialize| |qcar| |seen| %))
                          (QRPLACD |nd|
                                   (|FILSER;do_deserialize| |qcdr| |seen| %))
                          (EXIT |nd|)))
                    ((VECP |d|)
                     (SEQ (LETT |oa| |d|)
                          (EXIT
                           (COND
                            ((SPADCALL |oa| (QREFELT % 17))
                             (SEQ (SPADCALL |seen| |d| |d| (QREFELT % 18))
                                  (EXIT |d|)))
                            (#8#
                             (SEQ (LETT |n| (QVSIZE |oa|))
                                  (LETT |noa| (MAKEARR1 |n| (QAREF1 |oa| 0)))
                                  (LETT |nd| |noa|)
                                  (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                                  (SEQ (LETT |i| 0) (LETT #3# (- |n| 1)) G190
                                       (COND
                                        ((|greater_SI| |i| #3#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (QSETAREF1 |noa| |i|
                                                    (|FILSER;do_deserialize|
                                                     (QAREF1 |oa| |i|) |seen|
                                                     %))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT |nd|)))))))
                    ((GENERAL_ARRAY? |d|)
                     (SEQ (LETT |nd| (MAKE-ARRAY (ARRAY-DIMENSIONS |d|)))
                          (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                          (LETT |n| (ARRAY-TOTAL-SIZE |d|))
                          (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SETF (ROW-MAJOR-AREF |nd| |i|)
                                         (|FILSER;do_deserialize|
                                          (ROW-MAJOR-AREF |d| |i|) |seen| %))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT |nd|)))
                    ((SPAD_KERNEL-P |d|)
                     (SEQ
                      (LETT |nd|
                            (|makeSpadKernel| NIL NIL (SPAD_KERNEL-NEST |d|)))
                      (SPADCALL |seen| |d| |nd| (QREFELT % 14))
                      (SETF (SPAD_KERNEL-OP |nd|)
                              (|FILSER;do_deserialize| (SPAD_KERNEL-OP |d|)
                               |seen| %))
                      (SETF (SPAD_KERNEL-ARG |nd|)
                              (|FILSER;do_deserialize| (SPAD_KERNEL-ARG |d|)
                               |seen| %))
                      (EXIT |nd|)))
                    (#8# |d|))))))))) 

(SDEFUN |FILSER;deserialize;2N;8| ((|d| (|None|)) (% (|None|)))
        (SPROG ((|seen| (|HashTable| (|None|) (|None|) "EQ")))
               (SEQ
                (COND ((NULL (|scan_for_writified| |d|)) |d|)
                      ('T
                       (SEQ (LETT |seen| (SPADCALL (QREFELT % 19)))
                            (EXIT (|FILSER;do_deserialize| |d| |seen| %)))))))) 

(DECLAIM (NOTINLINE |FileSerialization;|)) 

(DEFUN |FileSerialization;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FileSerialization|))
          (LETT % (GETREFV 31))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FileSerialization| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11
                    (LIST
                     (CONS 'U8
                           (|FILSER;l_to_s|
                            (LIST (SPADCALL 'UNSIGNED-BYTE (QREFELT % 8))
                                  (SPADCALL 8 (QREFELT % 10)))
                            %))
                     (CONS 'U16
                           (|FILSER;l_to_s|
                            (LIST (SPADCALL 'UNSIGNED-BYTE (QREFELT % 8))
                                  (SPADCALL 16 (QREFELT % 10)))
                            %))
                     (CONS 'U32
                           (|FILSER;l_to_s|
                            (LIST (SPADCALL 'UNSIGNED-BYTE (QREFELT % 8))
                                  (SPADCALL 32 (QREFELT % 10)))
                            %))
                     (CONS 'I8
                           (|FILSER;l_to_s|
                            (LIST (SPADCALL 'SIGNED-BYTE (QREFELT % 8))
                                  (SPADCALL 8 (QREFELT % 10)))
                            %))
                     (CONS 'I16
                           (|FILSER;l_to_s|
                            (LIST (SPADCALL 'SIGNED-BYTE (QREFELT % 8))
                                  (SPADCALL 16 (QREFELT % 10)))
                            %))
                     (CONS 'I32
                           (|FILSER;l_to_s|
                            (LIST (SPADCALL 'SIGNED-BYTE (QREFELT % 8))
                                  (SPADCALL 32 (QREFELT % 10)))
                            %))
                     (CONS 'FIX (SPADCALL 'FIXNUM (QREFELT % 8)))
                     (CONS 'DF (SPADCALL 'DOUBLE-FLOAT (QREFELT % 8)))))
          %))) 

(DEFUN |FileSerialization| ()
  (SPROG NIL
         (PROG (#1=#:G160)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FileSerialization|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FileSerialization|
                             (LIST
                              (CONS NIL (CONS 1 (|FileSerialization;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FileSerialization|)))))))))) 

(MAKEPROP '|FileSerialization| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Symbol|) (|SExpression|)
              (0 . |convert|) (|Integer|) (5 . |convert|) '|type_tags| (|None|)
              (|HashTable| 12 12 '"EQ") (10 . |setelt!|) (|Boolean|)
              (|PrimitiveArray| 12) (17 . |empty?|) (22 . |qsetelt!|)
              (29 . |empty|) |FILSER;serialize;2N;6| (|List| 7) (33 . |elt|)
              (39 . |symbol|) (|List| %) (44 . |destruct|) (|String|)
              (49 . |string|) (|OutputForm|) (54 . |coerce|)
              |FILSER;deserialize;2N;8|)
           '#(|serialize| 59 |deserialize| 64) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|serialize| ((|None|) (|None|))) T)
                                   '((|deserialize| ((|None|) (|None|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 30
                                            '(1 7 0 6 8 1 7 0 9 10 3 13 12 0 12
                                              12 14 1 16 15 0 17 3 13 12 0 12
                                              12 18 0 13 0 19 2 21 7 0 9 22 1 7
                                              6 0 23 1 7 24 0 25 1 6 26 0 27 1
                                              26 28 0 29 1 0 12 12 20 1 0 12 12
                                              30)))))
           '|lookupComplete|)) 
