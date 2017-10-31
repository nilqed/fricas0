
(PUT '|OPQUERY;getDatabase;SD;1| '|SPADreplace| '|getBrowseDatabase|) 

(SDEFUN |OPQUERY;getDatabase;SD;1|
        ((|s| |String|) ($ |Database| (|IndexCard|))) (|getBrowseDatabase| |s|)) 

(DECLAIM (NOTINLINE |OperationsQuery;|)) 

(DEFUN |OperationsQuery| ()
  (SPROG NIL
         (PROG (#1=#:G692)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OperationsQuery|)
                    . #2=(|OperationsQuery|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OperationsQuery|
                             (LIST (CONS NIL (CONS 1 (|OperationsQuery;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OperationsQuery|)))))))))) 

(DEFUN |OperationsQuery;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OperationsQuery|) . #1=(|OperationsQuery|))
          (LETT $ (GETREFV 9) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OperationsQuery| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|OperationsQuery| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Database| (|IndexCard|)) (|String|)
              |OPQUERY;getDatabase;SD;1|)
           '#(|getDatabase| 0) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| 8 '(1 0 6 7 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|OperationsQuery| 'NILADIC T) 
