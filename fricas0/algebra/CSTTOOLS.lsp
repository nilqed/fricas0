
(SDEFUN |CSTTOOLS;cycleElt;STU;1| ((|x| ST) ($ |Union| ST "failed"))
        (SPROG ((#1=#:G712 NIL) (#2=#:G713 NIL) (|y| (ST)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|CSTTOOLS;cycleElt;STU;1|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((OR (SPADCALL |y| (QREFELT $ 9))
                                    (SPADCALL |y| (QREFELT $ 10)))
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #3#)
                                 (GO #4=#:G711)))
                               ('T
                                (SEQ
                                 (LETT |y| (SPADCALL |y| (QREFELT $ 11)) . #3#)
                                 (COND
                                  ((ODDP |i|)
                                   (LETT |x| (SPADCALL |x| (QREFELT $ 11))
                                         . #3#)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x| |y| (QREFELT $ 12))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# (CONS 0 |y|) . #3#)
                                            (GO #4#))
                                           . #3#)
                                     (GO #5=#:G705)))))))))
                             #5# (EXIT #1#))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |CSTTOOLS;computeCycleLength;STNni;2|
        ((|cycElt| ST) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G718 NIL) (#2=#:G719 NIL) (|y| (ST)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |y| |cycElt|
                        . #3=(|CSTTOOLS;computeCycleLength;STNni;2|))
                  (EXIT
                   (SEQ (LETT |i| 1 . #3#) G190 NIL
                        (SEQ
                         (EXIT
                          (SEQ (LETT |y| (SPADCALL |y| (QREFELT $ 11)) . #3#)
                               (EXIT
                                (COND
                                 ((SPADCALL |y| |cycElt| (QREFELT $ 12))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN
                                          (LETT #2# |i| . #3#)
                                          (GO #4=#:G717))
                                         . #3#)
                                   (GO #5=#:G714)))))))
                         #5# (EXIT #1#))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |CSTTOOLS;computeCycleEntry;3ST;3| ((|x| ST) (|cycElt| ST) ($ ST))
        (SPROG ((|y| (ST)) (#1=#:G725 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |y|
                        (SPADCALL |x| (SPADCALL |cycElt| (QREFELT $ 16))
                                  (QREFELT $ 17))
                        . #2=(|CSTTOOLS;computeCycleEntry;3ST;3|))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |x| |y| (QREFELT $ 12))
                            (PROGN (LETT #1# |x| . #2#) (GO #3=#:G724)))
                           ('T
                            (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 11)) . #2#)
                                 (EXIT
                                  (LETT |y| (SPADCALL |y| (QREFELT $ 11))
                                        . #2#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))
                #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |CyclicStreamTools;|)) 

(DEFUN |CyclicStreamTools| (&REST #1=#:G726)
  (SPROG NIL
         (PROG (#2=#:G727)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CyclicStreamTools|)
                                               '|domainEqualList|)
                    . #3=(|CyclicStreamTools|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CyclicStreamTools;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CyclicStreamTools|)))))))))) 

(DEFUN |CyclicStreamTools;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|CyclicStreamTools|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|CyclicStreamTools| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 19) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CyclicStreamTools| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|CyclicStreamTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |explicitlyEmpty?|) (5 . |lazy?|) (10 . |rst|) (15 . |eq?|)
              (|Union| 7 '"failed") |CSTTOOLS;cycleElt;STU;1|
              (|NonNegativeInteger|) |CSTTOOLS;computeCycleLength;STNni;2|
              (21 . |rest|) |CSTTOOLS;computeCycleEntry;3ST;3|)
           '#(|cycleElt| 27 |computeCycleLength| 32 |computeCycleEntry| 37)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 18
                                                 '(1 7 8 0 9 1 7 8 0 10 1 7 0 0
                                                   11 2 7 8 0 0 12 2 7 0 0 15
                                                   17 1 0 13 7 14 1 0 15 7 16 2
                                                   0 7 7 7 18)))))
           '|lookupComplete|)) 
