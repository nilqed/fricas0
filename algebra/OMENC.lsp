
(PUT '|OMENC;=;2$B;1| '|SPADreplace| '|eql_SI|) 

(SDEFUN |OMENC;=;2$B;1| ((|u| $) (|v| $) ($ |Boolean|)) (|eql_SI| |u| |v|)) 

(SDEFUN |OMENC;coerce;$Of;2| ((|u| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |u| 0 (QREFELT $ 8)) (SPADCALL "Unknown" (QREFELT $ 11)))
         ((SPADCALL |u| 1 (QREFELT $ 8)) (SPADCALL "Binary" (QREFELT $ 11)))
         ((SPADCALL |u| (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 8))
          (SPADCALL "XML" (QREFELT $ 11)))
         ((SPADCALL |u| (SPADCALL 3 (QREFELT $ 13)) (QREFELT $ 8))
          (SPADCALL "SGML" (QREFELT $ 11)))
         ('T (|error| "Bogus OpenMath Encoding Type")))) 

(PUT '|OMENC;OMencodingUnknown;$;3| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |OMENC;OMencodingUnknown;$;3| (($ $)) 0) 

(PUT '|OMENC;OMencodingBinary;$;4| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |OMENC;OMencodingBinary;$;4| (($ $)) 1) 

(SDEFUN |OMENC;OMencodingXML;$;5| (($ $)) (SPADCALL 2 (QREFELT $ 13))) 

(SDEFUN |OMENC;OMencodingSGML;$;6| (($ $)) (SPADCALL 3 (QREFELT $ 13))) 

(DECLAIM (NOTINLINE |OpenMathEncoding;|)) 

(DEFUN |OpenMathEncoding| ()
  (SPROG NIL
         (PROG (#1=#:G708)
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
          (LETT $ (GETREFV 21) . #1#)
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
              (|String|) (|OutputForm|) (0 . |message|) (|Integer|)
              (5 . |coerce|) |OMENC;coerce;$Of;2| |OMENC;OMencodingUnknown;$;3|
              |OMENC;OMencodingBinary;$;4| |OMENC;OMencodingXML;$;5|
              |OMENC;OMencodingSGML;$;6| (|SingleInteger|) (|HashState|))
           '#(~= 10 |latex| 16 |hashUpdate!| 21 |hash| 27 |coerce| 32
              |OMencodingXML| 37 |OMencodingUnknown| 41 |OMencodingSGML| 45
              |OMencodingBinary| 49 = 53)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 10))
                        (|makeByteWordVec2| 20
                                            '(1 10 0 9 11 1 6 0 12 13 2 0 7 0 0
                                              1 1 0 9 0 1 2 0 20 20 0 1 1 0 19
                                              0 1 1 0 10 0 14 0 0 0 17 0 0 0 15
                                              0 0 0 18 0 0 0 16 2 0 7 0 0
                                              8)))))
           '|lookupComplete|)) 

(MAKEPROP '|OpenMathEncoding| 'NILADIC T) 
