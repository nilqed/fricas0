
(PUT '|INTBIT;bitLength;2I;1| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |INTBIT;bitLength;2I;1| ((|n| |Integer|) ($ |Integer|))
        (INTEGER-LENGTH |n|)) 

(SDEFUN |INTBIT;bitCoef;3I;2| ((|n| |Integer|) (|i| |Integer|) ($ |Integer|))
        (COND ((INTEGER-BIT |n| |i|) 1) ('T 0))) 

(PUT '|INTBIT;bitTruth;2IB;3| '|SPADreplace| 'INTEGER-BIT) 

(SDEFUN |INTBIT;bitTruth;2IB;3| ((|n| |Integer|) (|i| |Integer|) ($ |Boolean|))
        (INTEGER-BIT |n| |i|)) 

(DECLAIM (NOTINLINE |IntegerBits;|)) 

(DEFUN |IntegerBits| ()
  (SPROG NIL
         (PROG (#1=#:G699)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|IntegerBits|)
                    . #2=(|IntegerBits|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|IntegerBits|
                             (LIST (CONS NIL (CONS 1 (|IntegerBits;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|IntegerBits|)))))))))) 

(DEFUN |IntegerBits;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IntegerBits|) . #1=(|IntegerBits|))
          (LETT $ (GETREFV 11) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IntegerBits| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|IntegerBits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |INTBIT;bitLength;2I;1|
              |INTBIT;bitCoef;3I;2| (|Boolean|) |INTBIT;bitTruth;2IB;3|)
           '#(|bitTruth| 0 |bitLength| 6 |bitCoef| 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(2 0 9 6 6 10 1 0 6 6 7 2 0 6
                                                   6 6 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|IntegerBits| 'NILADIC T) 
