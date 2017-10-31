
(PUT '|OMENC;=;2$B;1| '|SPADreplace| '|eql_SI|) 

(SDEFUN |OMENC;=;2$B;1| ((|u| $) (|v| $) ($ |Boolean|)) (|eql_SI| |u| |v|)) 

(SDEFUN |OMENC;coerce;$Of;2| ((|u| $) ($ |OutputForm|))
        (COND ((SPADCALL |u| 0 (QREFELT $ 8)) "Unknown")
              ((SPADCALL |u| 1 (QREFELT $ 8)) "Binary")
              ((SPADCALL |u| (SPADCALL 2 (QREFELT $ 10)) (QREFELT $ 8)) "XML")
              ((SPADCALL |u| (SPADCALL 3 (QREFELT $ 10)) (QREFELT $ 8)) "SGML")
              ('T (|error| "Bogus OpenMath Encoding Type")))) 

(PUT '|OMENC;OMencodingUnknown;$;3| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |OMENC;OMencodingUnknown;$;3| (($ $)) 0) 

(PUT '|OMENC;OMencodingBinary;$;4| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |OMENC;OMencodingBinary;$;4| (($ $)) 1) 

(SDEFUN |OMENC;OMencodingXML;$;5| (($ $)) (SPADCALL 2 (QREFELT $ 10))) 

(SDEFUN |OMENC;OMencodingSGML;$;6| (($ $)) (SPADCALL 3 (QREFELT $ 10))) 

(DECLAIM (NOTINLINE |OpenMathEncoding;|)) 

(DEFUN |OpenMathEncoding| ()
  (SPROG NIL
         (PROG (#1=#:G704)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OpenMathEncoding|)
                    . #2=(|OpenMathEncoding|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OpenMathEncoding|
                             (LIST (CONS NIL (CONS 1 (|OpenMathEncoding;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OpenMathEncoding|)))))))))) 

(DEFUN |OpenMathEncoding;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OpenMathEncoding|) . #1=(|OpenMathEncoding|))
          (LETT $ (GETREFV 20) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OpenMathEncoding| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|SingleInteger|))
          $))) 

(MAKEPROP '|OpenMathEncoding| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) |OMENC;=;2$B;1|
              (|Integer|) (0 . |coerce|) (|OutputForm|) |OMENC;coerce;$Of;2|
              |OMENC;OMencodingUnknown;$;3| |OMENC;OMencodingBinary;$;4|
              |OMENC;OMencodingXML;$;5| |OMENC;OMencodingSGML;$;6| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 5 |latex| 11 |hashUpdate!| 16 |hash| 22 |coerce| 27
              |OMencodingXML| 32 |OMencodingUnknown| 36 |OMencodingSGML| 40
              |OMencodingBinary| 44 = 48)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 11))
                        (|makeByteWordVec2| 19
                                            '(1 6 0 9 10 2 0 7 0 0 1 1 0 17 0 1
                                              2 0 19 19 0 1 1 0 18 0 1 1 0 11 0
                                              12 0 0 0 15 0 0 0 13 0 0 0 16 0 0
                                              0 14 2 0 7 0 0 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|OpenMathEncoding| 'NILADIC T) 
