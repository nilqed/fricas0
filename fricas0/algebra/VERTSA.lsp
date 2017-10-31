
(SDEFUN |VERTSA;vertexSeta;Nni$;1| ((|d| |NonNegativeInteger|) ($ $))
        (SPADCALL |d| (QREFELT $ 8))) 

(SDEFUN |VERTSA;maxFaces;$Nni;2| ((|a| $) ($ |NonNegativeInteger|))
        (SPADCALL |a| (QREFELT $ 10))) 

(SDEFUN |VERTSA;setMaxFaces;$NniV;3|
        ((|a| $) (|b| |NonNegativeInteger|) ($ |Void|))
        (SEQ (SPADCALL |a| |b| (QREFELT $ 12))
             (EXIT (SPADCALL (QREFELT $ 14))))) 

(SDEFUN |VERTSA;join;3$;4| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (+ (SPADCALL |a| (QREFELT $ 10)) (SPADCALL |b| (QREFELT $ 10)))
         (QREFELT $ 8))) 

(SDEFUN |VERTSA;prod;3$;5| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (* (SPADCALL |a| (QREFELT $ 10)) (SPADCALL |b| (QREFELT $ 10)))
         (QREFELT $ 8))) 

(SDEFUN |VERTSA;coerce;$Of;6| ((|s| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 10)) (QREFELT $ 20))) 

(DECLAIM (NOTINLINE |VertexSetAbstract;|)) 

(DEFUN |VertexSetAbstract| ()
  (SPROG NIL
         (PROG (#1=#:G701)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|VertexSetAbstract|)
                    . #2=(|VertexSetAbstract|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|VertexSetAbstract|
                             (LIST
                              (CONS NIL (CONS 1 (|VertexSetAbstract;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|VertexSetAbstract|)))))))))) 

(DEFUN |VertexSetAbstract;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|VertexSetAbstract|) . #1=(|VertexSetAbstract|))
          (LETT $ (GETREFV 26) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|VertexSetAbstract| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|Reference| (|NonNegativeInteger|)))
          $))) 

(MAKEPROP '|VertexSetAbstract| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|NonNegativeInteger|) (0 . |ref|)
              |VERTSA;vertexSeta;Nni$;1| (5 . |deref|) |VERTSA;maxFaces;$Nni;2|
              (10 . |setref|) (|Void|) (16 . |void|)
              |VERTSA;setMaxFaces;$NniV;3| |VERTSA;join;3$;4|
              |VERTSA;prod;3$;5| (|Integer|) (|OutputForm|) (20 . |outputForm|)
              |VERTSA;coerce;$Of;6| (|String|) (|SingleInteger|) (|HashState|)
              (|Boolean|))
           '#(~= 25 |vertexSeta| 31 |setMaxFaces| 36 |prod| 42 |maxFaces| 48
              |latex| 53 |join| 58 |hashUpdate!| 64 |hash| 70 |coerce| 75 = 80)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|VertexSet|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 19))
                        (|makeByteWordVec2| 25
                                            '(1 6 0 7 8 1 6 7 0 10 2 6 7 0 7 12
                                              0 13 0 14 1 19 0 18 20 2 0 25 0 0
                                              1 1 0 0 7 9 2 0 13 0 7 15 2 0 0 0
                                              0 17 1 0 7 0 11 1 0 22 0 1 2 0 0
                                              0 0 16 2 0 24 24 0 1 1 0 23 0 1 1
                                              0 19 0 21 2 0 25 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|VertexSetAbstract| 'NILADIC T) 
