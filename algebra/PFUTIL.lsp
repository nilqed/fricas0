
(SDEFUN |PFUTIL;decompose;UP2L;1|
        ((|nn| (UP)) (|dens| (|List| UP)) (% (|List| UP)))
        (SPROG
         ((|ru| (|Union| (|List| UP) "failed")) (|sdeg| (|Integer|))
          (#1=#:G11 NIL) (|den| NIL))
         (SEQ
          (COND
           ((NULL |dens|)
            (COND
             ((SPADCALL |nn| (|spadConstant| % 9) (QREFELT % 11))
              (EXIT NIL)))))
          (LETT |sdeg| 0)
          (SEQ (LETT |den| NIL) (LETT #1# |dens|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |den| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |sdeg| (+ |sdeg| (SPADCALL |den| (QREFELT % 13))))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (< (SPADCALL |nn| (QREFELT % 13)) |sdeg|))
            (EXIT (|error| "decompose: has whole part"))))
          (LETT |ru| (SPADCALL |dens| |nn| (QREFELT % 16)))
          (EXIT
           (COND ((QEQCAR |ru| 1) (|error| "decompose: multiEuclidean failed"))
                 ('T (QCDR |ru|))))))) 

(DECLAIM (NOTINLINE |PartialFractionUtilities;|)) 

(DEFUN |PartialFractionUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|PartialFractionUtilities| DV$1 DV$2))
          (LETT % (GETREFV 19))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PartialFractionUtilities|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |PartialFractionUtilities| (&REST #1=#:G12)
  (SPROG NIL
         (PROG (#2=#:G13)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PartialFractionUtilities|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PartialFractionUtilities;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PartialFractionUtilities|)))))))))) 

(MAKEPROP '|PartialFractionUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|Boolean|) (8 . =)
              (|NonNegativeInteger|) (14 . |degree|) (|Union| 15 '"failed")
              (|List| %) (19 . |multiEuclidean|) (|List| 7)
              |PFUTIL;decompose;UP2L;1|)
           '#(|decompose| 25) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|decompose|
                                 ((|List| |#2|) |#2| (|List| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 18
                                            '(0 6 0 8 0 7 0 9 2 7 10 0 0 11 1 7
                                              12 0 13 2 7 14 15 0 16 2 0 17 7
                                              17 18)))))
           '|lookupComplete|)) 
