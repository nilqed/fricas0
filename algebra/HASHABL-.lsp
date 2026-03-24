
(SDEFUN |HASHABL-;hash;SSi;1| ((|s| (S)) (% (|SingleInteger|)))
        (HASHSTATEMAKEFIXNUM (SPADCALL HASHSTATEBASIS |s| (QREFELT % 8)))) 

(DECLAIM (NOTINLINE |Hashable&;|)) 

(DEFUN |Hashable&| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Hashable&| DV$1))
          (LETT % (GETREFV 11))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|Hashable&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|HashState|)
              (0 . |hashUpdate!|) (|SingleInteger|) |HASHABL-;hash;SSi;1|)
           '#(|hash| 6) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|hash| ((|SingleInteger|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 10 '(2 6 7 7 0 8 1 0 9 0 10)))))
           '|lookupComplete|)) 
