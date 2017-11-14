
(SDEFUN |MAPHACK1;iter;MNni2A;1|
        ((|g| |Mapping| A A) (|n| |NonNegativeInteger|) (|x| A) ($ A))
        (SPROG ((#1=#:G700 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #2=(|MAPHACK1;iter;MNni2A;1|))
                     (LETT #1# |n| . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (LETT |x| (SPADCALL |x| |g|) . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |MAPHACK1;recur;MNni2A;2|
        ((|g| |Mapping| A (|NonNegativeInteger|) A) (|n| |NonNegativeInteger|)
         (|x| A) ($ A))
        (SPROG ((#1=#:G705 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #2=(|MAPHACK1;recur;MNni2A;2|))
                     (LETT #1# |n| . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (LETT |x| (SPADCALL |i| |x| |g|) . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |MappingPackageInternalHacks1;|)) 

(DEFUN |MappingPackageInternalHacks1| (#1=#:G706)
  (SPROG NIL
         (PROG (#2=#:G707)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|MappingPackageInternalHacks1|)
                                               '|domainEqualList|)
                    . #3=(|MappingPackageInternalHacks1|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|MappingPackageInternalHacks1;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|MappingPackageInternalHacks1|)))))))))) 

(DEFUN |MappingPackageInternalHacks1;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MappingPackageInternalHacks1|))
          (LETT |dv$| (LIST '|MappingPackageInternalHacks1| DV$1) . #1#)
          (LETT $ (GETREFV 12) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|MappingPackageInternalHacks1|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|MappingPackageInternalHacks1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Mapping| 6 6)
              (|NonNegativeInteger|) |MAPHACK1;iter;MNni2A;1| (|Mapping| 6 8 6)
              |MAPHACK1;recur;MNni2A;2|)
           '#(|recur| 0 |iter| 7) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 11
                                                 '(3 0 6 10 8 6 11 3 0 6 7 8 6
                                                   9)))))
           '|lookupComplete|)) 
