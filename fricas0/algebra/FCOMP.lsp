
(SDEFUN |FCOMP;sin;E$;1| ((|e| E) ($ $)) (CONS 'T |e|)) 

(PUT '|FCOMP;cos;E$;2| '|SPADreplace| '(XLAM (|e|) (CONS NIL |e|))) 

(SDEFUN |FCOMP;cos;E$;2| ((|e| E) ($ $)) (CONS NIL |e|)) 

(PUT '|FCOMP;sin?;$B;3| '|SPADreplace| 'QCAR) 

(SDEFUN |FCOMP;sin?;$B;3| ((|x| $) ($ |Boolean|)) (QCAR |x|)) 

(PUT '|FCOMP;argument;$E;4| '|SPADreplace| 'QCDR) 

(SDEFUN |FCOMP;argument;$E;4| ((|x| $) ($ E)) (QCDR |x|)) 

(SDEFUN |FCOMP;coerce;$Of;5| ((|x| $) ($ |OutputForm|))
        (SPADCALL (COND ((QCAR |x|) "sin") ('T "cos"))
                  (SPADCALL (SPADCALL (QCDR |x|) (QREFELT $ 14))
                            (QREFELT $ 15))
                  (QREFELT $ 16))) 

(SDEFUN |FCOMP;<;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 18)) 'T)
              ((OR (SPADCALL (QCDR |y|) (QCDR |x|) (QREFELT $ 18)) (QCAR |x|))
               NIL)
              ('T (QCAR |y|)))) 

(DECLAIM (NOTINLINE |FourierComponent;|)) 

(DEFUN |FourierComponent| (#1=#:G712)
  (SPROG NIL
         (PROG (#2=#:G713)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FourierComponent|)
                                               '|domainEqualList|)
                    . #3=(|FourierComponent|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FourierComponent;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FourierComponent|)))))))))) 

(DEFUN |FourierComponent;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FourierComponent|))
          (LETT |dv$| (LIST '|FourierComponent| DV$1) . #1#)
          (LETT $ (GETREFV 23) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FourierComponent| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |SinIfTrue| (|Boolean|)) (|:| |arg| |#1|)))
          $))) 

(MAKEPROP '|FourierComponent| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| |FCOMP;sin;E$;1|
              |FCOMP;cos;E$;2| (|Boolean|) |FCOMP;sin?;$B;3|
              |FCOMP;argument;$E;4| (|OutputForm|) (0 . |coerce|)
              (5 . |bracket|) (10 . |hconcat|) |FCOMP;coerce;$Of;5| (16 . <)
              |FCOMP;<;2$B;6| (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 22 |smaller?| 28 |sin?| 34 |sin| 39 |min| 44 |max| 50 |latex|
              56 |hashUpdate!| 61 |hash| 67 |cos| 72 |coerce| 77 |argument| 82
              >= 87 > 93 = 99 <= 105 < 111)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|BasicType|) (|PartialOrder|) (|CoercibleTo| 13))
                   (|makeByteWordVec2| 22
                                       '(1 6 13 0 14 1 13 0 0 15 2 13 0 0 0 16
                                         2 6 10 0 0 18 2 0 10 0 0 1 2 0 10 0 0
                                         1 1 0 10 0 11 1 0 0 6 8 2 0 0 0 0 1 2
                                         0 0 0 0 1 1 0 20 0 1 2 0 22 22 0 1 1 0
                                         21 0 1 1 0 0 6 9 1 0 13 0 17 1 0 6 0
                                         12 2 0 10 0 0 1 2 0 10 0 0 1 2 0 10 0
                                         0 1 2 0 10 0 0 1 2 0 10 0 0 19)))))
           '|lookupComplete|)) 
