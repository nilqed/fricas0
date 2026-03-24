
(PUT '|ODVAR;makeVariable;SNni%;1| '|SPADreplace| 'CONS) 

(SDEFUN |ODVAR;makeVariable;SNni%;1|
        ((|s| (S)) (|n| (|NonNegativeInteger|)) (% (%))) (CONS |s| |n|)) 

(PUT '|ODVAR;variable;%S;2| '|SPADreplace| 'QCAR) 

(SDEFUN |ODVAR;variable;%S;2| ((|v| (%)) (% (S))) (QCAR |v|)) 

(PUT '|ODVAR;order;%Nni;3| '|SPADreplace| 'QCDR) 

(SDEFUN |ODVAR;order;%Nni;3| ((|v| (%)) (% (|NonNegativeInteger|))) (QCDR |v|)) 

(DECLAIM (NOTINLINE |OrderlyDifferentialVariable;|)) 

(DEFUN |OrderlyDifferentialVariable;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|OrderlyDifferentialVariable| DV$1))
          (LETT % (GETREFV 16))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrderlyDifferentialVariable|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |var| |#1|)
                              (|:| |ord| (|NonNegativeInteger|))))
          %))) 

(DEFUN |OrderlyDifferentialVariable| (#1=#:G8)
  (SPROG NIL
         (PROG (#2=#:G9)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OrderlyDifferentialVariable|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|OrderlyDifferentialVariable;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrderlyDifferentialVariable|)))))))))) 

(MAKEPROP '|OrderlyDifferentialVariable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |ODVAR;makeVariable;SNni%;1|
              |ODVAR;variable;%S;2| |ODVAR;order;%Nni;3| (|Boolean|)
              (|OutputForm|) (|String|) (|Union| 6 '"failed"))
           '#(~= 0 |weight| 6 |variable| 11 |smaller?| 16 |retractIfCan| 22
              |retract| 27 |order| 32 |min| 37 |max| 43 |makeVariable| 49
              |latex| 55 |differentiate| 60 |coerce| 71 >= 81 > 87 = 93 <= 99 <
              105)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|DifferentialVariableCategory&| |OrderedSet&| NIL
                     |RetractableTo&| |SetCategory&| NIL |PartialOrder&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|DifferentialVariableCategory| 6) (|OrderedSet|)
                      (|Comparable|) (|RetractableTo| 6) (|SetCategory|)
                      (|CoercibleTo| 13) (|PartialOrder|) (|CoercibleFrom| 6)
                      (|BasicType|))
                   (|makeByteWordVec2| 15
                                       '(2 0 12 0 0 1 1 0 8 0 1 1 0 6 0 10 2 0
                                         12 0 0 1 1 0 15 0 1 1 0 6 0 1 1 0 8 0
                                         11 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 6 8 9
                                         1 0 14 0 1 2 0 0 0 8 1 1 0 0 0 1 1 0
                                         13 0 1 1 0 0 6 1 2 0 12 0 0 1 2 0 12 0
                                         0 1 2 0 12 0 0 1 2 0 12 0 0 1 2 0 12 0
                                         0 1)))))
           '|lookupComplete|)) 
