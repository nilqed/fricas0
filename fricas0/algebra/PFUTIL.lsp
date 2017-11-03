
(SDEFUN |PFUTIL;decompose;UP2L;1| ((|nn| UP) (|dens| |List| UP) ($ |List| UP))
        (SPROG
         ((|res| (|List| UP)) (|cden| (|Factored| UP)) (|cnum| (UP))
          (|ct| (|PartialFraction| UP)) (#1=#:G729 NIL) (|i| NIL)
          (#2=#:G728 NIL) (|fden| NIL) (|nfacs| (|Integer|))
          (|pfr| (|PartialFraction| UP)) (|nd| (|Factored| UP))
          (|fdens| (|List| (|Factored| UP))) (#3=#:G727 NIL) (|nden| NIL)
          (#4=#:G726 NIL))
         (SEQ
          (LETT |fdens|
                (PROGN
                 (LETT #4# NIL . #5=(|PFUTIL;decompose;UP2L;1|))
                 (SEQ (LETT |nden| NIL . #5#) (LETT #3# |dens| . #5#) G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |nden| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |nden| 1 (QREFELT $ 12)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |nd|
                (SPADCALL (ELT $ 14) |fdens| (|spadConstant| $ 15)
                          (QREFELT $ 18))
                . #5#)
          (LETT |pfr| (SPADCALL |nn| |nd| (QREFELT $ 20)) . #5#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |pfr| (QREFELT $ 21)) (|spadConstant| $ 22)
                       (QREFELT $ 24))
             (|error| "decompose: wholePart(pfr) ~= 0"))
            ('T
             (SEQ (LETT |nfacs| (SPADCALL |pfr| (QREFELT $ 25)) . #5#)
                  (LETT |res| NIL . #5#)
                  (SEQ (LETT |fden| NIL . #5#) (LETT #2# |fdens| . #5#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |fden| (CAR #2#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |i| 1 . #5#) (LETT #1# |nfacs| . #5#) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (LETT |ct| (SPADCALL |pfr| |i| (QREFELT $ 26))
                                     . #5#)
                               (LETT |cnum| (SPADCALL |ct| (QREFELT $ 27))
                                     . #5#)
                               (LETT |cden| (SPADCALL |ct| (QREFELT $ 28))
                                     . #5#)
                               (EXIT
                                (COND
                                 ((SPADCALL |cden| |fden| (QREFELT $ 29))
                                  (LETT |res| (CONS |cnum| |res|) . #5#)))))
                              (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT (NREVERSE |res|))))))))) 

(DECLAIM (NOTINLINE |PartialFractionUtilities;|)) 

(DEFUN |PartialFractionUtilities| (&REST #1=#:G730)
  (SPROG NIL
         (PROG (#2=#:G731)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PartialFractionUtilities|)
                                               '|domainEqualList|)
                    . #3=(|PartialFractionUtilities|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PartialFractionUtilities;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PartialFractionUtilities|)))))))))) 

(DEFUN |PartialFractionUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialFractionUtilities|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PartialFractionUtilities| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 32) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PartialFractionUtilities|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PartialFractionUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|Integer|) (|Factored| 7) (8 . |nilFactor|) (14 . *)
              (20 . *) (26 . |One|) (|Mapping| 11 11 11) (|List| 11)
              (30 . |reduce|) (|PartialFraction| 7) (37 . |partialFraction|)
              (43 . |wholePart|) (48 . |Zero|) (|Boolean|) (52 . ~=)
              (58 . |numberOfFractionalTerms|) (63 . |nthFractionalTerm|)
              (69 . |firstNumer|) (74 . |firstDenom|) (79 . =) (|List| 7)
              |PFUTIL;decompose;UP2L;1|)
           '#(|decompose| 85) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 31
                                                 '(0 6 0 8 0 7 0 9 2 11 0 7 10
                                                   12 2 7 0 0 0 13 2 11 0 0 0
                                                   14 0 11 0 15 3 17 11 16 0 11
                                                   18 2 19 0 7 11 20 1 19 7 0
                                                   21 0 7 0 22 2 7 23 0 0 24 1
                                                   19 10 0 25 2 19 0 0 10 26 1
                                                   19 7 0 27 1 19 11 0 28 2 11
                                                   23 0 0 29 2 0 30 7 30
                                                   31)))))
           '|lookupComplete|)) 
