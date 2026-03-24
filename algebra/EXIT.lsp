
(PUT '|EXIT;coerce;%Of;1| '|SPADreplace|
     '(XLAM (|n|) (|error| "Cannot use an Exit value."))) 

(SDEFUN |EXIT;coerce;%Of;1| ((|n| (%)) (% (|OutputForm|)))
        (|error| "Cannot use an Exit value.")) 

(PUT '|EXIT;=;2%B;2| '|SPADreplace|
     '(XLAM (|n1| |n2|) (|error| "Cannot use an Exit value."))) 

(SDEFUN |EXIT;=;2%B;2| ((|n1| (%)) (|n2| (%)) (% (|Boolean|)))
        (|error| "Cannot use an Exit value.")) 

(DECLAIM (NOTINLINE |Exit;|)) 

(DEFUN |Exit;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Exit|))
          (LETT % (GETREFV 11))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Exit| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Exit| ()
  (SPROG NIL
         (PROG (#1=#:G3)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Exit|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Exit|
                             (LIST (CONS NIL (CONS 1 (|Exit;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Exit|)))))))))) 

(MAKEPROP '|Exit| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) |EXIT;coerce;%Of;1|
              (|Boolean|) |EXIT;=;2%B;2| (|String|))
           '#(~= 0 |latex| 6 |coerce| 11 = 16) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 6) (|BasicType|))
                        (|makeByteWordVec2| 10
                                            '(2 0 8 0 0 1 1 0 10 0 1 1 0 6 0 7
                                              2 0 8 0 0 9)))))
           '|lookupComplete|)) 
