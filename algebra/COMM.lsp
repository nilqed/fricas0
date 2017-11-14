
(SDEFUN |COMM;=;2$B;1| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((|yy| (P)) (|xx| (P)))
               (SEQ
                (COND
                 ((QEQCAR |x| 0)
                  (COND
                   ((QEQCAR |y| 0)
                    (EXIT (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 10)))))))
                (COND
                 ((QEQCAR |x| 1)
                  (COND
                   ((QEQCAR |y| 1)
                    (EXIT
                     (SEQ (LETT |xx| (QCDR |x|) . #1=(|COMM;=;2$B;1|))
                          (LETT |yy| (QCDR |y|) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL (QCDR |xx|) (QCDR |yy|) (QREFELT $ 11))
                             (SPADCALL (QCAR |xx|) (QCAR |yy|) (QREFELT $ 11)))
                            ('T NIL)))))))))
                (EXIT NIL)))) 

(SDEFUN |COMM;mkcomm;I$;2| ((|i| |Integer|) ($ $))
        (CONS 0 (SPADCALL |i| (QREFELT $ 13)))) 

(SDEFUN |COMM;mkcomm;3$;3| ((|x| $) (|y| $) ($ $)) (CONS 1 (CONS |x| |y|))) 

(SDEFUN |COMM;coerce;$Of;4| ((|x| $) ($ |OutputForm|))
        (SPROG ((|xx| (P)))
               (SEQ
                (COND ((QEQCAR |x| 0) (SPADCALL (QCDR |x|) (QREFELT $ 17)))
                      ('T
                       (SEQ (LETT |xx| (QCDR |x|) |COMM;coerce;$Of;4|)
                            (EXIT
                             (SPADCALL
                              (LIST (SPADCALL (QCAR |xx|) (QREFELT $ 18))
                                    (SPADCALL (QCDR |xx|) (QREFELT $ 18)))
                              (QREFELT $ 20))))))))) 

(DECLAIM (NOTINLINE |Commutator;|)) 

(DEFUN |Commutator| ()
  (SPROG NIL
         (PROG (#1=#:G716)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Commutator|)
                    . #2=(|Commutator|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Commutator|
                             (LIST (CONS NIL (CONS 1 (|Commutator;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|Commutator|)))))))))) 

(DEFUN |Commutator;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Commutator|) . #1=(|Commutator|))
          (LETT $ (GETREFV 24) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Commutator| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|Record| (|:| |left| $) (|:| |right| $)))
          (QSETREFV $ 7 (|Union| (|OrdSetInts|) (QREFELT $ 6)))
          $))) 

(MAKEPROP '|Commutator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL 'P '|Rep| (|Boolean|) (|OrdSetInts|)
              (0 . =) |COMM;=;2$B;1| (|Integer|) (6 . |coerce|)
              |COMM;mkcomm;I$;2| |COMM;mkcomm;3$;3| (|OutputForm|)
              (11 . |coerce|) |COMM;coerce;$Of;4| (|List| $) (16 . |bracket|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 21 |mkcomm| 27 |latex| 38 |hashUpdate!| 43 |hash| 49 |coerce|
              54 = 59)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 16))
                        (|makeByteWordVec2| 23
                                            '(2 9 8 0 0 10 1 9 0 12 13 1 9 16 0
                                              17 1 16 0 19 20 2 0 8 0 0 1 1 0 0
                                              12 14 2 0 0 0 0 15 1 0 22 0 1 2 0
                                              21 21 0 1 1 0 23 0 1 1 0 16 0 18
                                              2 0 8 0 0 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|Commutator| 'NILADIC T) 
