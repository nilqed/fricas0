
(PUT '|SETLAT;subsetLattice;L$;1| '|SPADreplace| '(XLAM (|obj|) |obj|)) 

(SDEFUN |SETLAT;subsetLattice;L$;1| ((|obj| |List| S) ($ $)) |obj|) 

(SDEFUN |SETLAT;/\\;3$;2| ((|a| $) (|b| $) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 11))) 

(SDEFUN |SETLAT;\\/;3$;3| ((|a| $) (|b| $) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 13))) 

(SDEFUN |SETLAT;complement;2$;4| ((|a| $) ($ $))
        (SPROG
         ((|r| (|List| S)) (|contains| (|Boolean|)) (#1=#:G718 NIL) (|c| NIL)
          (#2=#:G717 NIL) (|b| NIL))
         (SEQ (LETT |r| NIL . #3=(|SETLAT;complement;2$;4|))
              (SEQ (LETT |b| NIL . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |contains| NIL . #3#)
                        (SEQ (LETT |c| NIL . #3#) (LETT #1# |a| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |b| |c| (QREFELT $ 16))
                                 (LETT |contains| 'T . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |contains|)
                           (LETT |r| (SPADCALL |r| |b| (QREFELT $ 17))
                                 . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |SETLAT;complement;$L$;5| ((|a| $) (|pseudoTop| |List| S) ($ $))
        (SPROG
         ((|r| (|List| S)) (|contains| (|Boolean|)) (#1=#:G725 NIL) (|c| NIL)
          (#2=#:G724 NIL) (|b| NIL))
         (SEQ (LETT |r| NIL . #3=(|SETLAT;complement;$L$;5|))
              (SEQ (LETT |b| NIL . #3#) (LETT #2# |pseudoTop| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |contains| NIL . #3#)
                        (SEQ (LETT |c| NIL . #3#) (LETT #1# |a| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |b| |c| (QREFELT $ 16))
                                 (LETT |contains| 'T . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |contains|)
                           (LETT |r| (SPADCALL |r| |b| (QREFELT $ 17))
                                 . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(PUT '|SETLAT;hash;$Si;6| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |SETLAT;hash;$Si;6| ((|s| $) ($ |SingleInteger|)) 0) 

(SDEFUN |SETLAT;latex;$S;7| ((|n| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "" |SETLAT;latex;$S;7|) (EXIT |s|)))) 

(PUT '|SETLAT;=;2$B;8| '|SPADreplace| 'EQL) 

(SDEFUN |SETLAT;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|)) (EQL |x| |y|)) 

(SDEFUN |SETLAT;~=;2$B;9| ((|x| $) (|y| $) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 24)))) 

(SDEFUN |SETLAT;coerce;$Of;10| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|oup| (|List| (|OutputForm|))) (#1=#:G737 NIL) (|x| NIL)
          (|inp| ($)))
         (SEQ (LETT |inp| |s| . #2=(|SETLAT;coerce;$Of;10|))
              (LETT |oup| NIL . #2#)
              (SEQ (LETT |x| NIL . #2#) (LETT #1# |inp| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |oup|
                           (SPADCALL |oup| (SPADCALL |x| (QREFELT $ 27))
                                     (QREFELT $ 29))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |oup| (QREFELT $ 31)))))) 

(DECLAIM (NOTINLINE |SubsetLattice;|)) 

(DEFUN |SubsetLattice| (&REST #1=#:G738)
  (SPROG NIL
         (PROG (#2=#:G739)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SubsetLattice|)
                                               '|domainEqualList|)
                    . #3=(|SubsetLattice|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SubsetLattice;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SubsetLattice|)))))))))) 

(DEFUN |SubsetLattice;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SubsetLattice|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SubsetLattice| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 34) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SubsetLattice| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|List| |#1|))
          $))) 

(MAKEPROP '|SubsetLattice| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|List| 6) |SETLAT;subsetLattice;L$;1| (0 . |setUnion|)
              |SETLAT;/\\;3$;2| (6 . |setIntersection|) |SETLAT;\\/;3$;3|
              (|Boolean|) (12 . =) (18 . |concat|) |SETLAT;complement;2$;4|
              |SETLAT;complement;$L$;5| (|SingleInteger|) |SETLAT;hash;$Si;6|
              (|String|) |SETLAT;latex;$S;7| |SETLAT;=;2$B;8| |SETLAT;~=;2$B;9|
              (|OutputForm|) (24 . |coerce|) (|List| 26) (29 . |concat|)
              (|List| $) (35 . |bracket|) |SETLAT;coerce;$Of;10| (|HashState|))
           '#(~= 40 |subsetLattice| 46 |latex| 51 |hashUpdate!| 56 |hash| 62
              |complement| 67 |coerce| 78 |\\/| 83 = 89 |/\\| 95)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS '#(NIL NIL NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|Lattice|) (|MeetSemilattice|) (|JoinSemilattice|)
                           (|SetCategory|) (|BasicType|) (|CoercibleTo| 26))
                        (|makeByteWordVec2| 33
                                            '(2 9 0 0 0 11 2 9 0 0 0 13 2 6 15
                                              0 0 16 2 9 0 0 6 17 1 6 26 0 27 2
                                              28 0 0 26 29 1 26 0 30 31 2 0 15
                                              0 0 25 1 0 0 9 10 1 0 22 0 23 2 0
                                              33 33 0 1 1 0 20 0 21 1 0 0 0 18
                                              2 0 0 0 9 19 1 0 26 0 32 2 0 0 0
                                              0 14 2 0 15 0 0 24 2 0 0 0 0
                                              12)))))
           '|lookupComplete|)) 
