
(SDEFUN |INFINITY;infinity;Opc;1| (($ |OnePointCompletion| (|Integer|)))
        (SPADCALL (QREFELT $ 7))) 

(SDEFUN |INFINITY;plusInfinity;Oc;2| (($ |OrderedCompletion| (|Integer|)))
        (SPADCALL (QREFELT $ 10))) 

(SDEFUN |INFINITY;minusInfinity;Oc;3| (($ |OrderedCompletion| (|Integer|)))
        (SPADCALL (QREFELT $ 12))) 

(DECLAIM (NOTINLINE |Infinity;|)) 

(DEFUN |Infinity| ()
  (SPROG NIL
         (PROG (#1=#:G699)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Infinity|)
                    . #2=(|Infinity|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Infinity|
                             (LIST (CONS NIL (CONS 1 (|Infinity;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Infinity|)))))))))) 

(DEFUN |Infinity;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Infinity|) . #1=(|Infinity|))
          (LETT $ (GETREFV 14) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Infinity| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Infinity| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OnePointCompletion| (|Integer|))
              (0 . |infinity|) |INFINITY;infinity;Opc;1|
              (|OrderedCompletion| (|Integer|)) (4 . |plusInfinity|)
              |INFINITY;plusInfinity;Oc;2| (8 . |minusInfinity|)
              |INFINITY;minusInfinity;Oc;3|)
           '#(|plusInfinity| 12 |minusInfinity| 16 |infinity| 20) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13
                                                 '(0 6 0 7 0 9 0 10 0 9 0 12 0
                                                   0 9 11 0 0 9 13 0 0 6 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|Infinity| 'NILADIC T) 
