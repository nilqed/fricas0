
(SDEFUN |FLOOPS;plus;3R;1|
        ((|x|
          #1=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (|y|
          #2=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (%
          (|Record| (|:| |mantissa| #3=(|Integer|))
                    (|:| |exponent| #4=(|Integer|)))))
        (SPROG
         ((|de| (|Integer|)) (|ye| #4#) (|ym| #3#) (|#G5| #2#) (|xe| #4#)
          (|xm| #3#) (|#G4| #1#))
         (SEQ
          (PROGN
           (LETT |#G4| |x|)
           (LETT |xm| (QCAR |#G4|))
           (LETT |xe| (QCDR |#G4|))
           |#G4|)
          (PROGN
           (LETT |#G5| |y|)
           (LETT |ym| (QCAR |#G5|))
           (LETT |ye| (QCDR |#G5|))
           |#G5|)
          (EXIT
           (COND ((EQL |xm| 0) |y|) ((EQL |ym| 0) |x|)
                 ((EQL |xe| |ye|) (CONS (+ |xm| |ym|) |ye|))
                 (#5='T
                  (SEQ (LETT |de| (- |xe| |ye|))
                       (EXIT
                        (COND ((> |de| 0) (CONS (+ (ASH |xm| |de|) |ym|) |ye|))
                              (#5#
                               (CONS (+ |xm| (ASH |ym| (- |de|)))
                                     |xe|))))))))))) 

(SDEFUN |FLOOPS;minus;3R;2|
        ((|x|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|y|
          #1=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (%
          (|Record| (|:| |mantissa| #2=(|Integer|))
                    (|:| |exponent| #3=(|Integer|)))))
        (SPROG ((|ye| #3#) (|ym| #2#) (|#G8| #1#))
               (SEQ
                (PROGN
                 (LETT |#G8| |y|)
                 (LETT |ym| (QCAR |#G8|))
                 (LETT |ye| (QCDR |#G8|))
                 |#G8|)
                (EXIT (SPADCALL |x| (CONS (- |ym|) |ye|) (QREFELT % 7)))))) 

(SDEFUN |FLOOPS;times;3R;3|
        ((|x|
          #1=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (|y|
          #2=(|Record| (|:| |mantissa| (|Integer|))
                       (|:| |exponent| (|Integer|))))
         (%
          (|Record| (|:| |mantissa| #3=(|Integer|))
                    (|:| |exponent| #4=(|Integer|)))))
        (SPROG
         ((|ye| #4#) (|ym| #3#) (|#G12| #2#) (|xe| #4#) (|xm| #3#)
          (|#G11| #1#))
         (SEQ
          (PROGN
           (LETT |#G11| |x|)
           (LETT |xm| (QCAR |#G11|))
           (LETT |xe| (QCDR |#G11|))
           |#G11|)
          (PROGN
           (LETT |#G12| |y|)
           (LETT |ym| (QCAR |#G12|))
           (LETT |ye| (QCDR |#G12|))
           |#G12|)
          (EXIT (CONS (* |xm| |ym|) (+ |xe| |ye|)))))) 

(DECLAIM (NOTINLINE |FloatingPointOperations;|)) 

(DEFUN |FloatingPointOperations;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatingPointOperations|))
          (LETT % (GETREFV 10))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatingPointOperations| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FloatingPointOperations| ()
  (SPROG NIL
         (PROG (#1=#:G12)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatingPointOperations|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatingPointOperations|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|FloatingPointOperations;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FloatingPointOperations|)))))))))) 

(MAKEPROP '|FloatingPointOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL
              (|Record| (|:| |mantissa| (|Integer|))
                        (|:| |exponent| (|Integer|)))
              |FLOOPS;plus;3R;1| |FLOOPS;minus;3R;2| |FLOOPS;times;3R;3|)
           '#(|times| 0 |plus| 6 |minus| 12) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|plus|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))))
                                T)
                              '((|minus|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))))
                                T)
                              '((|times|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 9
                                            '(2 0 6 6 6 9 2 0 6 6 6 7 2 0 6 6 6
                                              8)))))
           '|lookupComplete|)) 
