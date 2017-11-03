
(SDEFUN |SIMPCF;sphereSolid;NniFsc;1|
        ((|dim| |NonNegativeInteger|) ($ |FiniteSimplicialComplex| VS))
        (SPROG
         ((|vs1| (|List| VS)) (|v1| (|List| (|List| (|NonNegativeInteger|))))
          (#1=#:G704 NIL) (|n| NIL) (#2=#:G703 NIL))
         (SEQ
          (LETT |v1|
                (LIST
                 (PROGN
                  (LETT #2# NIL . #3=(|SIMPCF;sphereSolid;NniFsc;1|))
                  (SEQ (LETT |n| 1 . #3#) (LETT #1# (+ |dim| 1) . #3#) G190
                       (COND ((|greater_SI| |n| #1#) (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS |n| #2#) . #3#)))
                       (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
                . #3#)
          (LETT |vs1| NIL . #3#) (EXIT (SPADCALL |vs1| |v1| (QREFELT $ 10)))))) 

(SDEFUN |SIMPCF;sphereSurface;NniFsc;2|
        ((|dim| |NonNegativeInteger|) ($ |FiniteSimplicialComplex| VS))
        (SPROG ((|s| (|FiniteSimplicialComplex| VS)))
               (SEQ
                (LETT |s| (SPADCALL |dim| (QREFELT $ 12))
                      |SIMPCF;sphereSurface;NniFsc;2|)
                (EXIT (SPADCALL |s| (QREFELT $ 13)))))) 

(SDEFUN |SIMPCF;line;Fsc;3| (($ |FiniteSimplicialComplex| VS))
        (SPROG
         ((|vs1| (|List| VS)) (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ (LETT |v1| (LIST (LIST 1 2)) . #1=(|SIMPCF;line;Fsc;3|))
              (LETT |vs1| NIL . #1#)
              (EXIT (SPADCALL |vs1| |v1| (QREFELT $ 10)))))) 

(SDEFUN |SIMPCF;torusSurface;Fsc;4| (($ |FiniteSimplicialComplex| VS))
        (SPROG
         ((|vs1| (|List| VS)) (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 2 3 5) (LIST 2 4 5) (LIST 2 4 7)
                      (LIST 1 2 6) (LIST 2 6 7) (LIST 3 4 6) (LIST 3 5 6)
                      (LIST 3 4 7) (LIST 1 3 7) (LIST 1 4 5) (LIST 1 4 6)
                      (LIST 5 6 7) (LIST 1 5 7))
                . #1=(|SIMPCF;torusSurface;Fsc;4|))
          (LETT |vs1| NIL . #1#) (EXIT (SPADCALL |vs1| |v1| (QREFELT $ 10)))))) 

(SDEFUN |SIMPCF;band;Fsc;5| (($ |FiniteSimplicialComplex| VS))
        (SPROG
         ((|vs1| (|List| VS)) (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 1 2 6) (LIST 1 5 6) (LIST 2 3 4)
                      (LIST 3 4 5) (LIST 4 5 6))
                . #1=(|SIMPCF;band;Fsc;5|))
          (LETT |vs1| NIL . #1#) (EXIT (SPADCALL |vs1| |v1| (QREFELT $ 10)))))) 

(SDEFUN |SIMPCF;moebiusBand;Fsc;6| (($ |FiniteSimplicialComplex| VS))
        (SPROG
         ((|vs1| (|List| VS)) (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 2 3 4) (LIST 3 4 5) (LIST 1 4 5)
                      (LIST 1 2 5))
                . #1=(|SIMPCF;moebiusBand;Fsc;6|))
          (LETT |vs1| NIL . #1#) (EXIT (SPADCALL |vs1| |v1| (QREFELT $ 10)))))) 

(SDEFUN |SIMPCF;projectiveSpace;IFsc;7|
        ((|n| |Integer|) ($ |FiniteSimplicialComplex| VS))
        (SPROG
         ((|vs1| (|List| VS)) (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 1 3 4) (LIST 1 2 6) (LIST 1 5 6)
                      (LIST 1 4 5) (LIST 2 3 5) (LIST 2 4 5) (LIST 2 4 6)
                      (LIST 3 4 6) (LIST 3 5 6))
                . #1=(|SIMPCF;projectiveSpace;IFsc;7|))
          (LETT |vs1| NIL . #1#) (EXIT (SPADCALL |vs1| |v1| (QREFELT $ 10)))))) 

(SDEFUN |SIMPCF;kleinBottle;Fsc;8| (($ |FiniteSimplicialComplex| VS))
        (SPROG
         ((|vs1| (|List| VS)) (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 3 4 8) (LIST 2 3 4) (LIST 2 4 6) (LIST 2 6 8)
                      (LIST 2 5 8) (LIST 3 5 7) (LIST 2 3 7) (LIST 2 7 1)
                      (LIST 2 5 1) (LIST 3 5 1) (LIST 4 5 8) (LIST 4 5 7)
                      (LIST 4 6 7) (LIST 6 7 1) (LIST 3 6 1) (LIST 3 6 8))
                . #1=(|SIMPCF;kleinBottle;Fsc;8|))
          (LETT |vs1| NIL . #1#) (EXIT (SPADCALL |vs1| |v1| (QREFELT $ 10)))))) 

(SDEFUN |SIMPCF;dunceHat;Fsc;9| (($ |FiniteSimplicialComplex| VS))
        (SPROG
         ((|vs1| (|List| VS)) (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 8) (LIST 2 3 8) (LIST 3 7 8) (LIST 1 3 7)
                      (LIST 1 2 7) (LIST 1 6 8) (LIST 1 2 6) (LIST 6 7 8)
                      (LIST 2 4 6) (LIST 5 6 7) (LIST 2 5 7) (LIST 4 5 6)
                      (LIST 2 3 4) (LIST 2 3 5) (LIST 1 3 4) (LIST 1 4 5)
                      (LIST 1 3 5))
                . #1=(|SIMPCF;dunceHat;Fsc;9|))
          (LETT |vs1| NIL . #1#) (EXIT (SPADCALL |vs1| |v1| (QREFELT $ 10)))))) 

(DECLAIM (NOTINLINE |SimplicialComplexFactory;|)) 

(DEFUN |SimplicialComplexFactory| (#1=#:G721)
  (SPROG NIL
         (PROG (#2=#:G722)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SimplicialComplexFactory|)
                                               '|domainEqualList|)
                    . #3=(|SimplicialComplexFactory|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SimplicialComplexFactory;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SimplicialComplexFactory|)))))))))) 

(DEFUN |SimplicialComplexFactory;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SimplicialComplexFactory|))
          (LETT |dv$| (LIST '|SimplicialComplexFactory| DV$1) . #1#)
          (LETT $ (GETREFV 23) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SimplicialComplexFactory|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SimplicialComplexFactory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 6)
              (|List| (|List| 11)) (|FiniteSimplicialComplex| 6)
              (0 . |simplicialComplex|) (|NonNegativeInteger|)
              |SIMPCF;sphereSolid;NniFsc;1| (6 . |boundary|)
              |SIMPCF;sphereSurface;NniFsc;2| |SIMPCF;line;Fsc;3|
              |SIMPCF;torusSurface;Fsc;4| |SIMPCF;band;Fsc;5|
              |SIMPCF;moebiusBand;Fsc;6| (|Integer|)
              |SIMPCF;projectiveSpace;IFsc;7| |SIMPCF;kleinBottle;Fsc;8|
              |SIMPCF;dunceHat;Fsc;9|)
           '#(|torusSurface| 11 |sphereSurface| 15 |sphereSolid| 20
              |projectiveSpace| 25 |moebiusBand| 30 |line| 34 |kleinBottle| 38
              |dunceHat| 42 |band| 46)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(2 9 0 7 8 10 1 9 0 0 13 0 0
                                                   9 16 1 0 9 11 14 1 0 9 11 12
                                                   1 0 9 19 20 0 0 9 18 0 0 9
                                                   15 0 0 9 21 0 0 9 22 0 0 9
                                                   17)))))
           '|lookupComplete|)) 
