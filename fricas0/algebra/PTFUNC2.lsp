
(SDEFUN |PTFUNC2;map;MPP;1|
        ((|mapping| |Mapping| R2 R1) (|p| |Point| R1) ($ |Point| R2))
        (SPROG ((#1=#:G702 NIL) (#2=#:G707 NIL) (|i| NIL) (#3=#:G706 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|PTFUNC2;map;MPP;1|))
                  (SEQ (LETT |i| (SPADCALL |p| (QREFELT $ 10)) . #4#)
                       (LETT #2# (SPADCALL |p| (QREFELT $ 11)) . #4#) G190
                       (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS
                                (SPADCALL
                                 (SPADCALL |p|
                                           (PROG1 (LETT #1# |i| . #4#)
                                             (|check_subtype2| (> #1# 0)
                                                               '(|PositiveInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT $ 12))
                                 |mapping|)
                                #3#)
                               . #4#)))
                       (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 15))))) 

(DECLAIM (NOTINLINE |PointFunctions2;|)) 

(DEFUN |PointFunctions2| (&REST #1=#:G708)
  (SPROG NIL
         (PROG (#2=#:G709)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PointFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|PointFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PointFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PointFunctions2|)))))))))) 

(DEFUN |PointFunctions2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PointFunctions2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PointFunctions2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PointFunctions2| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PointFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (|Point| 6) (0 . |minIndex|) (5 . |maxIndex|) (10 . |elt|)
              (|List| 7) (|Point| 7) (16 . |point|) (|Mapping| 7 6)
              |PTFUNC2;map;MPP;1|)
           '#(|map| 21) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 9 8 0 10 1 9 8 0 11 2 9 6
                                                   0 8 12 1 14 0 13 15 2 0 14
                                                   16 9 17)))))
           '|lookupComplete|)) 
