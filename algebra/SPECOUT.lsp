
(SDEFUN |SPECOUT;juxtaposeTerms|
        ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL |l| (QREFELT % 8))) 

(PUT '|SPECOUT;outputAsFortran;OfV;2| '|SPADreplace| '|fortranFormat|) 

(SDEFUN |SPECOUT;outputAsFortran;OfV;2| ((|e| (|OutputForm|)) (% (|Void|)))
        (|fortranFormat| |e|)) 

(SDEFUN |SPECOUT;outputAsFortran;SOfV;3|
        ((|var| (|String|)) (|e| (|OutputForm|)) (% (|Void|)))
        (SEQ
         (LETT |e|
               (SPADCALL
                (SPADCALL (SPADCALL |var| (QREFELT % 13)) (QREFELT % 14)) |e|
                (QREFELT % 15)))
         (EXIT (SPADCALL |e| (QREFELT % 10))))) 

(SDEFUN |SPECOUT;outputAsFortran;LV;4|
        ((|l| (|List| (|OutputForm|))) (% (|Void|)))
        (SPADCALL (|SPECOUT;juxtaposeTerms| |l| %) (QREFELT % 10))) 

(PUT '|SPECOUT;outputAsMathML;OfV;5| '|SPADreplace| '|mathmlFormat|) 

(SDEFUN |SPECOUT;outputAsMathML;OfV;5| ((|e| (|OutputForm|)) (% (|Void|)))
        (|mathmlFormat| |e|)) 

(SDEFUN |SPECOUT;outputAsMathML;LV;6|
        ((|l| (|List| (|OutputForm|))) (% (|Void|)))
        (SPADCALL (|SPECOUT;juxtaposeTerms| |l| %) (QREFELT % 19))) 

(SDEFUN |SPECOUT;outputAsTex;OfV;7| ((|e| (|OutputForm|)) (% (|Void|)))
        (SEQ (|texFormat| |e|) (EXIT (SPADCALL (QREFELT % 21))))) 

(SDEFUN |SPECOUT;outputAsTex;LV;8| ((|l| (|List| (|OutputForm|))) (% (|Void|)))
        (SPADCALL (|SPECOUT;juxtaposeTerms| |l| %) (QREFELT % 22))) 

(DECLAIM (NOTINLINE |SpecialOutputPackage;|)) 

(DEFUN |SpecialOutputPackage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SpecialOutputPackage|))
          (LETT % (GETREFV 24))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SpecialOutputPackage| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |SpecialOutputPackage| ()
  (SPROG NIL
         (PROG (#1=#:G11)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SpecialOutputPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SpecialOutputPackage|
                             (LIST
                              (CONS NIL (CONS 1 (|SpecialOutputPackage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|SpecialOutputPackage|)))))))))) 

(MAKEPROP '|SpecialOutputPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| %) (|OutputForm|)
              (0 . |blankSeparate|) (|Void|) |SPECOUT;outputAsFortran;OfV;2|
              (|String|) (|Symbol|) (5 . |coerce|) (10 . |coerce|) (15 . =)
              |SPECOUT;outputAsFortran;SOfV;3| (|List| 7)
              |SPECOUT;outputAsFortran;LV;4| |SPECOUT;outputAsMathML;OfV;5|
              |SPECOUT;outputAsMathML;LV;6| (21 . |void|)
              |SPECOUT;outputAsTex;OfV;7| |SPECOUT;outputAsTex;LV;8|)
           '#(|outputAsTex| 25 |outputAsMathML| 35 |outputAsFortran| 45) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|outputAsFortran|
                                 ((|Void|) (|String|) (|OutputForm|)))
                                T)
                              '((|outputAsFortran| ((|Void|) (|OutputForm|)))
                                T)
                              '((|outputAsFortran|
                                 ((|Void|) (|List| (|OutputForm|))))
                                T)
                              '((|outputAsMathML| ((|Void|) (|OutputForm|))) T)
                              '((|outputAsMathML|
                                 ((|Void|) (|List| (|OutputForm|))))
                                T)
                              '((|outputAsTex| ((|Void|) (|OutputForm|))) T)
                              '((|outputAsTex|
                                 ((|Void|) (|List| (|OutputForm|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 23
                                            '(1 7 0 6 8 1 12 0 11 13 1 12 7 0
                                              14 2 7 0 0 0 15 0 9 0 21 1 0 9 7
                                              22 1 0 9 17 23 1 0 9 7 19 1 0 9
                                              17 20 1 0 9 7 10 1 0 9 17 18 2 0
                                              9 11 7 16)))))
           '|lookupComplete|)) 
