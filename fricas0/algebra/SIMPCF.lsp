
(SDEFUN |SIMPCF;sphereSolid;NniFsc;1|
        ((|dim| |NonNegativeInteger|)
         ($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G701 NIL)
          (|n| NIL) (#2=#:G700 NIL)
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |simplicialComplex|
                     ($ #3=(|VertexSetAbstract|)
                      (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |simplicialComplex| ($ #3#))
                    (SIGNATURE |simplicialComplex| ($ (|DeltaComplex| #3#)))
                    (SIGNATURE |addSimplex| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |sort| ($ $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |star| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |link| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |cone| ($ $ (|NonNegativeInteger|)))
                    (SIGNATURE |simplicialJoin| ($ $ $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |oneSkeleton|
                     ((|DirectedGraph| (|NonNegativeInteger|)) $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #3#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteSimplicialComplex| (|VertexSetAbstract|))
                . #4=(|SIMPCF;sphereSolid;NniFsc;1|))
          (LETT |v1|
                (LIST
                 (PROGN
                  (LETT #2# NIL . #4#)
                  (SEQ (LETT |n| 1 . #4#) (LETT #1# (+ |dim| 1) . #4#) G190
                       (COND ((|greater_SI| |n| #1#) (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS |n| #2#) . #4#)))
                       (LETT |n| (|inc_SI| |n|) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
                . #4#)
          (LETT |vs1| (SPADCALL (+ |dim| 1) (QREFELT $ 8)) . #4#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|simplicialComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|NonNegativeInteger|))))
                                                 ASIMP))
                . #4#)
          (EXIT |r|)))) 

(SDEFUN |SIMPCF;sphereSurface;NniFsc;2|
        ((|dim| |NonNegativeInteger|)
         ($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|s| (|FiniteSimplicialComplex| (|VertexSetAbstract|))))
         (SEQ
          (LETT |s| (SPADCALL |dim| (QREFELT $ 10))
                . #1=(|SIMPCF;sphereSurface;NniFsc;2|))
          (LETT |r| (SPADCALL |s| (QREFELT $ 11)) . #1#) (EXIT |r|)))) 

(SDEFUN |SIMPCF;torusSurface;Fsc;3|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |simplicialComplex|
                     ($ #1=(|VertexSetAbstract|)
                      (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |simplicialComplex| ($ #1#))
                    (SIGNATURE |simplicialComplex| ($ (|DeltaComplex| #1#)))
                    (SIGNATURE |addSimplex| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |sort| ($ $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |star| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |link| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |cone| ($ $ (|NonNegativeInteger|)))
                    (SIGNATURE |simplicialJoin| ($ $ $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |oneSkeleton|
                     ((|DirectedGraph| (|NonNegativeInteger|)) $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteSimplicialComplex| (|VertexSetAbstract|))
                . #2=(|SIMPCF;torusSurface;Fsc;3|))
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 2 3 5) (LIST 2 4 5) (LIST 2 4 7)
                      (LIST 1 2 6) (LIST 2 6 7) (LIST 3 4 6) (LIST 3 5 6)
                      (LIST 3 4 7) (LIST 1 3 7) (LIST 1 4 5) (LIST 1 4 6)
                      (LIST 5 6 7) (LIST 1 5 7))
                . #2#)
          (LETT |vs1| (SPADCALL 7 (QREFELT $ 8)) . #2#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|simplicialComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|NonNegativeInteger|))))
                                                 ASIMP))
                . #2#)
          (EXIT |r|)))) 

(SDEFUN |SIMPCF;band;Fsc;4|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |simplicialComplex|
                     ($ #1=(|VertexSetAbstract|)
                      (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |simplicialComplex| ($ #1#))
                    (SIGNATURE |simplicialComplex| ($ (|DeltaComplex| #1#)))
                    (SIGNATURE |addSimplex| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |sort| ($ $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |star| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |link| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |cone| ($ $ (|NonNegativeInteger|)))
                    (SIGNATURE |simplicialJoin| ($ $ $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |oneSkeleton|
                     ((|DirectedGraph| (|NonNegativeInteger|)) $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteSimplicialComplex| (|VertexSetAbstract|))
                . #2=(|SIMPCF;band;Fsc;4|))
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 1 2 6) (LIST 1 5 6) (LIST 2 3 4)
                      (LIST 3 4 5) (LIST 4 5 6))
                . #2#)
          (LETT |vs1| (SPADCALL 6 (QREFELT $ 8)) . #2#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|simplicialComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|NonNegativeInteger|))))
                                                 ASIMP))
                . #2#)
          (EXIT |r|)))) 

(SDEFUN |SIMPCF;moebiusBand;Fsc;5|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |simplicialComplex|
                     ($ #1=(|VertexSetAbstract|)
                      (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |simplicialComplex| ($ #1#))
                    (SIGNATURE |simplicialComplex| ($ (|DeltaComplex| #1#)))
                    (SIGNATURE |addSimplex| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |sort| ($ $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |star| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |link| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |cone| ($ $ (|NonNegativeInteger|)))
                    (SIGNATURE |simplicialJoin| ($ $ $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |oneSkeleton|
                     ((|DirectedGraph| (|NonNegativeInteger|)) $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteSimplicialComplex| (|VertexSetAbstract|))
                . #2=(|SIMPCF;moebiusBand;Fsc;5|))
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 2 3 4) (LIST 3 4 5) (LIST 1 4 5)
                      (LIST 1 2 5))
                . #2#)
          (LETT |vs1| (SPADCALL 5 (QREFELT $ 8)) . #2#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|simplicialComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|NonNegativeInteger|))))
                                                 ASIMP))
                . #2#)
          (EXIT |r|)))) 

(SDEFUN |SIMPCF;projectivePlane;Fsc;6|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |simplicialComplex|
                     ($ #1=(|VertexSetAbstract|)
                      (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |simplicialComplex| ($ #1#))
                    (SIGNATURE |simplicialComplex| ($ (|DeltaComplex| #1#)))
                    (SIGNATURE |addSimplex| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |sort| ($ $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |star| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |link| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |cone| ($ $ (|NonNegativeInteger|)))
                    (SIGNATURE |simplicialJoin| ($ $ $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |oneSkeleton|
                     ((|DirectedGraph| (|NonNegativeInteger|)) $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteSimplicialComplex| (|VertexSetAbstract|))
                . #2=(|SIMPCF;projectivePlane;Fsc;6|))
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 1 3 4) (LIST 1 2 6) (LIST 1 5 6)
                      (LIST 1 4 5) (LIST 2 3 5) (LIST 2 4 5) (LIST 2 4 6)
                      (LIST 3 4 6) (LIST 3 5 6))
                . #2#)
          (LETT |vs1| (SPADCALL 6 (QREFELT $ 8)) . #2#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|simplicialComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|NonNegativeInteger|))))
                                                 ASIMP))
                . #2#)
          (EXIT |r|)))) 

(SDEFUN |SIMPCF;kleinBottle;Fsc;7|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |simplicialComplex|
                     ($ #1=(|VertexSetAbstract|)
                      (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |simplicialComplex| ($ #1#))
                    (SIGNATURE |simplicialComplex| ($ (|DeltaComplex| #1#)))
                    (SIGNATURE |addSimplex| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |sort| ($ $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|OrientedFacet|))) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |star| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |link| ($ $ (|OrientedFacet|)))
                    (SIGNATURE |cone| ($ $ (|NonNegativeInteger|)))
                    (SIGNATURE |simplicialJoin| ($ $ $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |oneSkeleton|
                     ((|DirectedGraph| (|NonNegativeInteger|)) $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteSimplicialComplex| (|VertexSetAbstract|))
                . #2=(|SIMPCF;kleinBottle;Fsc;7|))
          (LETT |v1|
                (LIST (LIST 3 4 8) (LIST 2 3 4) (LIST 2 4 6) (LIST 2 6 8)
                      (LIST 2 5 8) (LIST 3 5 7) (LIST 2 3 7) (LIST 2 7 1)
                      (LIST 2 5 1) (LIST 3 5 1) (LIST 4 5 8) (LIST 4 5 7)
                      (LIST 4 6 7) (LIST 6 7 1) (LIST 3 6 1) (LIST 3 6 8))
                . #2#)
          (LETT |vs1| (SPADCALL 8 (QREFELT $ 8)) . #2#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|simplicialComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|NonNegativeInteger|))))
                                                 ASIMP))
                . #2#)
          (EXIT |r|)))) 

(DECLAIM (NOTINLINE |SimplicialComplexFactory;|)) 

(DEFUN |SimplicialComplexFactory| ()
  (SPROG NIL
         (PROG (#1=#:G715)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SimplicialComplexFactory|)
                    . #2=(|SimplicialComplexFactory|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SimplicialComplexFactory|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|SimplicialComplexFactory;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|SimplicialComplexFactory|)))))))))) 

(DEFUN |SimplicialComplexFactory;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SimplicialComplexFactory|)
                . #1=(|SimplicialComplexFactory|))
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SimplicialComplexFactory| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SimplicialComplexFactory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|)
              (|VertexSetAbstract|) (0 . |vertexSeta|)
              (|FiniteSimplicialComplex| 7) |SIMPCF;sphereSolid;NniFsc;1|
              (5 . |delta|) |SIMPCF;sphereSurface;NniFsc;2|
              |SIMPCF;torusSurface;Fsc;3| |SIMPCF;band;Fsc;4|
              |SIMPCF;moebiusBand;Fsc;5| |SIMPCF;projectivePlane;Fsc;6|
              |SIMPCF;kleinBottle;Fsc;7|)
           '#(|torusSurface| 10 |sphereSurface| 14 |sphereSolid| 19
              |projectivePlane| 24 |moebiusBand| 28 |kleinBottle| 32 |band| 36)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 7 0 6 8 1 9 0 0 11 0 0 9
                                                   13 1 0 9 6 12 1 0 9 6 10 0 0
                                                   9 16 0 0 9 15 0 0 9 17 0 0 9
                                                   14)))))
           '|lookupComplete|)) 

(MAKEPROP '|SimplicialComplexFactory| 'NILADIC T) 
