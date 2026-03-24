
(SDEFUN |FBICPO;join;%3Nni;1|
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

(SDEFUN |FBICPO;meet;%3Nni;2|
        ((|s| (%)) (|a| #1=(|NonNegativeInteger|)) (|b| #1#)
         (% (|NonNegativeInteger|)))
        (SPROG
         ((#2=#:G6 NIL) (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ (LETT |res| (SPADCALL |s| |a| |b| (QREFELT % 13)))
              (COND
               ((SPADCALL |res| (CONS 1 "failed") (QREFELT % 11))
                (|error| "This POSET does not have meet")))
              (EXIT
               (PROG2 (LETT #2# |res|)
                   (QCDR #2#)
                 (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                 (|Union| (|NonNegativeInteger|) "failed")
                                 #2#)))))) 

(DECLAIM (NOTINLINE |FiniteBiCPO;|)) 

(DEFUN |FiniteBiCPO;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FiniteBiCPO| DV$1))
          (LETT % (GETREFV 36))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FiniteBiCPO| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FiniteBiCPO| (#1=#:G15)
  (SPROG NIL
         (PROG (#2=#:G16)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteBiCPO|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FiniteBiCPO;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FiniteBiCPO|)))))))))) 

(MAKEPROP '|FiniteBiCPO| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FinitePoset| 6) (|local| |#1|)
              (|Union| 8 '"failed") (|NonNegativeInteger|) (0 . |joinIfCan|)
              (|Boolean|) (7 . =) |FBICPO;join;%3Nni;1| (13 . |meetIfCan|)
              |FBICPO;meet;%3Nni;2| (|OutputForm|) (|String|)
              (|Record| (|:| |value| 6) (|:| |posX| 8) (|:| |posY| 8))
              (|Record| (|:| |name| 16) (|:| |arrType| 8) (|:| |fromOb| 8)
                        (|:| |toOb| 8) (|:| |xOffset| 24) (|:| |yOffset| 24)
                        (|:| |map| 19))
              (|List| 8) (|List| 17) (|DirectedGraph| %) (|List| 18) (|List| 6)
              (|Integer|) (|Tree| 24) (|List| 25) (|List| (|Loop|))
              (|Matrix| 24) (|Matrix| 8) (|Void|) (|Scene| (|SCartesian| '2))
              (|List| %) (|List| (|List| 10)) (|Mapping| 10 6 6)
              (|IncidenceAlgebra| 24 6))
           '#(|meetIfCan| 20 |meet| 27 |joinIfCan| 34 |join| 41) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL |Poset&| NIL |FiniteGraph&| |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|BiCPO| 6) (|CoDcpo| 6) (|Dcpo| 6) (|Poset| 6)
                      (|Preorder| 6) (|FiniteGraph| 6) (|SetCategory|)
                      (|CoercibleTo| 15) (|BasicType|))
                   (|makeByteWordVec2| 14
                                       '(3 0 7 0 8 8 9 2 7 10 0 0 11 3 0 7 0 8
                                         8 13 3 0 7 0 8 8 13 3 0 8 0 8 8 14 3 0
                                         7 0 8 8 9 3 0 8 0 8 8 12)))))
           '|lookupIncomplete|)) 
