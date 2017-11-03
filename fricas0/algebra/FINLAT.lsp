
(PUT '|FINLAT;finiteLattice;Nni$;1| '|SPADreplace| '(XLAM (|index|) |index|)) 

(SDEFUN |FINLAT;finiteLattice;Nni$;1| ((|index| |NonNegativeInteger|) ($ $))
        |index|) 

(SDEFUN |FINLAT;finiteLattice;S$;2| ((|obj| S) ($ $))
        (SPADCALL (QREFELT $ 7) |obj| (QREFELT $ 12))) 

(SDEFUN |FINLAT;/\\;3$;3| ((|a| $) (|b| $) ($ $))
        (SPADCALL (QREFELT $ 7) |a| |b| (QREFELT $ 14))) 

(SDEFUN |FINLAT;\\/;3$;4| ((|a| $) (|b| $) ($ $))
        (SPADCALL (QREFELT $ 7) |a| |b| (QREFELT $ 16))) 

(PUT '|FINLAT;hash;$Si;5| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |FINLAT;hash;$Si;5| ((|s| $) ($ |SingleInteger|)) 0) 

(SDEFUN |FINLAT;latex;$S;6| ((|n| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "" |FINLAT;latex;$S;6|) (EXIT |s|)))) 

(SDEFUN |FINLAT;=;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 23))) 

(SDEFUN |FINLAT;~=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 23)))) 

(SDEFUN |FINLAT;coerce;$Of;9| ((|s| $) ($ |OutputForm|))
        (SPROG ((|obj| (S)) (|index| (|NonNegativeInteger|)))
               (SEQ (LETT |index| |s| . #1=(|FINLAT;coerce;$Of;9|))
                    (LETT |obj| (SPADCALL (QREFELT $ 7) |index| (QREFELT $ 25))
                          . #1#)
                    (EXIT (SPADCALL |obj| (QREFELT $ 27)))))) 

(DECLAIM (NOTINLINE |FiniteLattice;|)) 

(DEFUN |FiniteLattice| (&REST #1=#:G707)
  (SPROG NIL
         (PROG (#2=#:G708)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteLattice|)
                                               '|domainEqualList|)
                    . #3=(|FiniteLattice|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteLattice;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FiniteLattice|)))))))))) 

(DEFUN |FiniteLattice;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteLattice|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteLattice| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 30) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteLattice| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|NonNegativeInteger|))
          $))) 

(MAKEPROP '|FiniteLattice| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) |FINLAT;finiteLattice;Nni$;1|
              (|FiniteBiCPO| 6) (0 . |objectToIndex|)
              |FINLAT;finiteLattice;S$;2| (6 . |meet|) |FINLAT;/\\;3$;3|
              (13 . |join|) |FINLAT;\\/;3$;4| (|SingleInteger|)
              |FINLAT;hash;$Si;5| (|String|) |FINLAT;latex;$S;6| (|Boolean|)
              |FINLAT;=;2$B;7| |FINLAT;~=;2$B;8| (20 . |indexToObject|)
              (|OutputForm|) (26 . |coerce|) |FINLAT;coerce;$Of;9|
              (|HashState|))
           '#(~= 31 |latex| 37 |hashUpdate!| 42 |hash| 48 |finiteLattice| 53
              |coerce| 63 |\\/| 68 = 74 |/\\| 80)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS '#(NIL NIL NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|Lattice|) (|MeetSemilattice|) (|JoinSemilattice|)
                           (|SetCategory|) (|BasicType|) (|CoercibleTo| 26))
                        (|makeByteWordVec2| 29
                                            '(2 11 9 0 6 12 3 11 9 0 9 9 14 3
                                              11 9 0 9 9 16 2 11 6 0 9 25 1 6
                                              26 0 27 2 0 22 0 0 24 1 0 20 0 21
                                              2 0 29 29 0 1 1 0 18 0 19 1 0 0 9
                                              10 1 0 0 6 13 1 0 26 0 28 2 0 0 0
                                              0 17 2 0 22 0 0 23 2 0 0 0 0
                                              15)))))
           '|lookupComplete|)) 
