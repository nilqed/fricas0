
(PUT '|SETLAT;subsetLattice;L%;1| '|SPADreplace| '(XLAM (|obj|) |obj|)) 

(SDEFUN |SETLAT;subsetLattice;L%;1| ((|obj| (|List| S)) (% (%))) |obj|) 

(SDEFUN |SETLAT;/\\;3%;2| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL |a| |b| (QREFELT % 11))) 

(SDEFUN |SETLAT;\\/;3%;3| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL |a| |b| (QREFELT % 13))) 

(SDEFUN |SETLAT;complement;2%;4| ((|a| (%)) (% (%)))
        (SPROG
         ((|r| (|List| S)) (|contains| (|Boolean|)) (#1=#:G11 NIL) (|c| NIL)
          (#2=#:G10 NIL) (|b| NIL))
         (SEQ (LETT |r| NIL)
              (SEQ (LETT |b| NIL) (LETT #2# (QREFELT % 7)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |contains| NIL)
                        (SEQ (LETT |c| NIL) (LETT #1# |a|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |b| |c| (QREFELT % 16))
                                 (LETT |contains| 'T)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |contains|)
                           (LETT |r| (SPADCALL |r| |b| (QREFELT % 17)))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |SETLAT;complement;%L%;5| ((|a| (%)) (|pseudoTop| (|List| S)) (% (%)))
        (SPROG
         ((|r| (|List| S)) (|contains| (|Boolean|)) (#1=#:G20 NIL) (|c| NIL)
          (#2=#:G19 NIL) (|b| NIL))
         (SEQ (LETT |r| NIL)
              (SEQ (LETT |b| NIL) (LETT #2# |pseudoTop|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |contains| NIL)
                        (SEQ (LETT |c| NIL) (LETT #1# |a|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |b| |c| (QREFELT % 16))
                                 (LETT |contains| 'T)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |contains|)
                           (LETT |r| (SPADCALL |r| |b| (QREFELT % 17)))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(PUT '|SETLAT;hash| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |SETLAT;hash| ((|s| (%)) (% (|SingleInteger|))) 0) 

(PUT '|SETLAT;=;2%B;7| '|SPADreplace| 'EQL) 

(SDEFUN |SETLAT;=;2%B;7| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (EQL |x| |y|)) 

(SDEFUN |SETLAT;~=;2%B;8| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (NULL (SPADCALL |x| |y| (QREFELT % 20)))) 

(SDEFUN |SETLAT;coerce;%Of;9| ((|s| (%)) (% (|OutputForm|)))
        (SPROG
         ((|oup| (|List| (|OutputForm|))) (#1=#:G28 NIL) (|x| NIL) (|inp| (%)))
         (SEQ (LETT |inp| |s|) (LETT |oup| NIL)
              (SEQ (LETT |x| NIL) (LETT #1# |inp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |oup|
                           (SPADCALL |oup| (SPADCALL |x| (QREFELT % 23))
                                     (QREFELT % 25)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |oup| (QREFELT % 27)))))) 

(DECLAIM (NOTINLINE |SubsetLattice;|)) 

(DEFUN |SubsetLattice;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|SubsetLattice| DV$1 DV$2))
          (LETT % (GETREFV 30))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SubsetLattice| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 (|List| |#1|))
          %))) 

(DEFUN |SubsetLattice| (&REST #1=#:G29)
  (SPROG NIL
         (PROG (#2=#:G30)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|SubsetLattice|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SubsetLattice;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SubsetLattice|)))))))))) 

(MAKEPROP '|SubsetLattice| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|List| 6) |SETLAT;subsetLattice;L%;1| (0 . |setUnion|)
              |SETLAT;/\\;3%;2| (6 . |setIntersection|) |SETLAT;\\/;3%;3|
              (|Boolean|) (12 . =) (18 . |concat|) |SETLAT;complement;2%;4|
              |SETLAT;complement;%L%;5| |SETLAT;=;2%B;7| |SETLAT;~=;2%B;8|
              (|OutputForm|) (24 . |coerce|) (|List| 22) (29 . |concat|)
              (|List| %) (35 . |bracket|) |SETLAT;coerce;%Of;9| (|String|))
           '#(~= 40 |subsetLattice| 46 |latex| 51 |complement| 56 |coerce| 67
              |\\/| 72 = 78 |/\\| 84)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS '#(NIL NIL NIL |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|Lattice|) (|JoinSemilattice|) (|MeetSemilattice|)
                           (|SetCategory|) (|CoercibleTo| 22) (|BasicType|))
                        (|makeByteWordVec2| 29
                                            '(2 9 0 0 0 11 2 9 0 0 0 13 2 6 15
                                              0 0 16 2 9 0 0 6 17 1 6 22 0 23 2
                                              24 0 0 22 25 1 22 0 26 27 2 0 15
                                              0 0 21 1 0 0 9 10 1 0 29 0 1 2 0
                                              0 0 9 19 1 0 0 0 18 1 0 22 0 28 2
                                              0 0 0 0 14 2 0 15 0 0 20 2 0 0 0
                                              0 12)))))
           '|lookupComplete|)) 
