
(SDEFUN |FDCPO;join;%3Nni;1|
        ((|s| (%)) (|a| #1=(|NonNegativeInteger|)) (|b| #1#)
         (% (|NonNegativeInteger|)))
        (SPROG
         ((#2=#:G1 NIL) (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ (LETT |res| (SPADCALL |s| |a| |b| (QREFELT % 9)))
              (COND
               ((SPADCALL |res| (CONS 1 "failed") (QREFELT % 11))
                (|error| "This POSET does not have join")))
              (EXIT
               (PROG2 (LETT #2# |res|)
                   (QCDR #2#)
                 (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                 (|Union| (|NonNegativeInteger|) "failed")
                                 #2#)))))) 

(DECLAIM (NOTINLINE |FiniteDcpo;|)) 

(DEFUN |FiniteDcpo;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FiniteDcpo| DV$1))
          (LETT % (GETREFV 34))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FiniteDcpo| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FiniteDcpo| (#1=#:G10)
  (SPROG NIL
         (PROG (#2=#:G11)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteDcpo|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FiniteDcpo;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FiniteDcpo|)))))))))) 

(MAKEPROP '|FiniteDcpo| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FinitePoset| 6) (|local| |#1|)
              (|Union| 8 '"failed") (|NonNegativeInteger|) (0 . |joinIfCan|)
              (|Boolean|) (7 . =) |FDCPO;join;%3Nni;1| (|OutputForm|)
              (|String|)
              (|Record| (|:| |value| 6) (|:| |posX| 8) (|:| |posY| 8))
              (|Record| (|:| |name| 14) (|:| |arrType| 8) (|:| |fromOb| 8)
                        (|:| |toOb| 8) (|:| |xOffset| 22) (|:| |yOffset| 22)
                        (|:| |map| 17))
              (|List| 8) (|List| 15) (|DirectedGraph| %) (|List| 16) (|List| 6)
              (|Integer|) (|Tree| 22) (|List| 23) (|List| (|Loop|))
              (|Matrix| 22) (|Matrix| 8) (|Void|) (|Scene| (|SCartesian| '2))
              (|List| %) (|List| (|List| 10)) (|Mapping| 10 6 6)
              (|IncidenceAlgebra| 22 6))
           '#(|joinIfCan| 13 |join| 20) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |Poset&| NIL |FiniteGraph&| |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|Dcpo| 6) (|Poset| 6) (|Preorder| 6) (|FiniteGraph| 6)
                      (|SetCategory|) (|CoercibleTo| 13) (|BasicType|))
                   (|makeByteWordVec2| 12
                                       '(3 0 7 0 8 8 9 2 7 10 0 0 11 3 0 7 0 8
                                         8 9 3 0 8 0 8 8 12)))))
           '|lookupIncomplete|)) 
