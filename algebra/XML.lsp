
(SDEFUN |XML;writeXml;XeSV;1|
        ((|content| |XmlElement|) (|filename| |String|) ($ |Void|))
        (SPROG
         ((#1=#:G702 NIL) (|line| NIL) (|lines| (|List| (|String|)))
          (|s1| (|String|)) (|f1| (|TextFile|)))
         (SEQ
          (LETT |f1|
                (SPADCALL (SPADCALL |filename| (QREFELT $ 8)) "output"
                          (QREFELT $ 10))
                . #2=(|XML;writeXml;XeSV;1|))
          (LETT |s1| "<?xml version=" . #2#)
          (LETT |s1| (SPADCALL |s1| (STR_ELT #3="\" " 0) (QREFELT $ 12)) . #2#)
          (LETT |s1| (STRCONC |s1| "1.0") . #2#)
          (LETT |s1| (SPADCALL |s1| (STR_ELT #3# 0) (QREFELT $ 12)) . #2#)
          (LETT |s1| (STRCONC |s1| " encoding=") . #2#)
          (LETT |s1| (SPADCALL |s1| (STR_ELT #3# 0) (QREFELT $ 12)) . #2#)
          (LETT |s1| (STRCONC |s1| "UTF-8") . #2#)
          (LETT |s1| (SPADCALL |s1| (STR_ELT #3# 0) (QREFELT $ 12)) . #2#)
          (LETT |s1| (STRCONC |s1| " standalone=") . #2#)
          (LETT |s1| (SPADCALL |s1| (STR_ELT #3# 0) (QREFELT $ 12)) . #2#)
          (LETT |s1| (STRCONC |s1| "no") . #2#)
          (LETT |s1| (SPADCALL |s1| (STR_ELT #3# 0) (QREFELT $ 12)) . #2#)
          (LETT |s1| (STRCONC |s1| "?>") . #2#)
          (SPADCALL |f1| |s1| (QREFELT $ 13))
          (LETT |lines| (SPADCALL |content| (QREFELT $ 16)) . #2#)
          (SEQ (LETT |line| NIL . #2#) (LETT #1# |lines| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |line| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |f1| |line| (QREFELT $ 13))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |f1| (QREFELT $ 17)))))) 

(SDEFUN |XML;writeVRML;XeSV;2|
        ((|content| |XmlElement|) (|filename| |String|) ($ |Void|))
        (SPROG ((|f1| (|TextFile|)))
               (SEQ
                (LETT |f1|
                      (SPADCALL (SPADCALL |filename| (QREFELT $ 8)) "output"
                                (QREFELT $ 10))
                      |XML;writeVRML;XeSV;2|)
                (SPADCALL |f1| "#VRML V2.0 utf8" (QREFELT $ 13))
                (SPADCALL |content| |f1| (QREFELT $ 20))
                (EXIT (SPADCALL |f1| (QREFELT $ 17)))))) 

(DECLAIM (NOTINLINE |ExportXml;|)) 

(DEFUN |ExportXml| ()
  (SPROG NIL
         (PROG (#1=#:G706)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ExportXml|)
                    . #2=(|ExportXml|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ExportXml|
                             (LIST (CONS NIL (CONS 1 (|ExportXml;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|ExportXml|)))))))))) 

(DEFUN |ExportXml;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ExportXml|) . #1=(|ExportXml|))
          (LETT $ (GETREFV 22) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExportXml| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ExportXml| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|FileName|) (0 . |coerce|)
              (|TextFile|) (5 . |open|) (|Character|) (11 . |concat|)
              (17 . |writeLine!|) (|List| 6) (|XmlElement|) (23 . |coerce|)
              (28 . |close!|) (|Void|) |XML;writeXml;XeSV;1|
              (33 . |outputVRML|) |XML;writeVRML;XeSV;2|)
           '#(|writeXml| 39 |writeVRML| 45) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(1 7 0 6 8 2 9 0 7 6 10 2 6 0
                                                   0 11 12 2 9 6 0 6 13 1 15 14
                                                   0 16 1 9 0 0 17 2 15 18 0 9
                                                   20 2 0 18 15 6 19 2 0 18 15
                                                   6 21)))))
           '|lookupComplete|)) 

(MAKEPROP '|ExportXml| 'NILADIC T) 
