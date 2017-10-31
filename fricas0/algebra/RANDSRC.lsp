
(SDEFUN |RANDSRC;randnum;I;1| (($ |Integer|))
        (SPROG ((|t| (|Integer|)))
               (SEQ
                (LETT |t|
                      (REM
                       (- (SPADCALL 271828183 (QREFELT $ 8) (QREFELT $ 11))
                          (SPADCALL 314159269 (QREFELT $ 7) (QREFELT $ 11)))
                       (QREFELT $ 6))
                      . #1=(|RANDSRC;randnum;I;1|))
                (COND ((< |t| 0) (LETT |t| (+ |t| (QREFELT $ 6)) . #1#)))
                (SETELT $ 7 (QREFELT $ 8)) (EXIT (SETELT $ 8 |t|))))) 

(SDEFUN |RANDSRC;size;I;2| (($ |Integer|)) (QREFELT $ 6)) 

(SDEFUN |RANDSRC;reseed;IV;3| ((|n| |Integer|) ($ |Void|))
        (SEQ (SETELT $ 7 (REM |n| (QREFELT $ 6)))
             (EXIT (SETELT $ 8 (QUOTIENT2 |n| (QREFELT $ 6)))))) 

(SDEFUN |RANDSRC;seed;I;4| (($ |Integer|))
        (+ (* (QREFELT $ 8) (QREFELT $ 6)) (QREFELT $ 7))) 

(SDEFUN |RANDSRC;randnum;2I;5| ((|n| |Integer|) ($ |Integer|))
        (QUOTIENT2 (* |n| (SPADCALL (QREFELT $ 12))) (QREFELT $ 6))) 

(DECLAIM (NOTINLINE |RandomNumberSource;|)) 

(DEFUN |RandomNumberSource| ()
  (SPROG NIL
         (PROG (#1=#:G700)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RandomNumberSource|)
                    . #2=(|RandomNumberSource|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RandomNumberSource|
                             (LIST
                              (CONS NIL (CONS 1 (|RandomNumberSource;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|RandomNumberSource|)))))))))) 

(DEFUN |RandomNumberSource;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RandomNumberSource|) . #1=(|RandomNumberSource|))
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RandomNumberSource| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (- (EXPT 2 31) 1))
          (QSETREFV $ 7 1231231231)
          (QSETREFV $ 8 3243232987)
          $))) 

(MAKEPROP '|RandomNumberSource| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|ranbase| '|x0| '|x1|
              (|PositiveInteger|) (|Integer|) (0 . *) |RANDSRC;randnum;I;1|
              |RANDSRC;size;I;2| (|Void|) |RANDSRC;reseed;IV;3|
              |RANDSRC;seed;I;4| |RANDSRC;randnum;2I;5|)
           '#(|size| 6 |seed| 10 |reseed| 14 |randnum| 19) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(2 10 0 9 0 11 0 0 10 13 0 0
                                                   10 16 1 0 14 10 15 0 0 10 12
                                                   1 0 10 10 17)))))
           '|lookupComplete|)) 

(MAKEPROP '|RandomNumberSource| 'NILADIC T) 
