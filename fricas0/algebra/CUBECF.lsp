
(SDEFUN |CUBECF;sphereSolid;NniFcc;1|
        ((|dim| |NonNegativeInteger|)
         ($ |FiniteCubicalComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|List| (|Integer|))))) (#1=#:G701 NIL)
          (|n| NIL) (#2=#:G700 NIL)
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |cubicalComplex|
                     ($ #3=(|VertexSetAbstract|) (|List| (|CubicalFacet|))))
                    (SIGNATURE |cubicalComplex|
                     ($ #3# (|List| (|List| (|Segment| (|Integer|))))))
                    (SIGNATURE |cubicalComplex|
                     ($ #3# (|List| (|List| (|List| (|Integer|))))))
                    (SIGNATURE |cubicalComplex| ($ #3#))
                    (SIGNATURE |addCube| ($ $ (|CubicalFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #3#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteCubicalComplex| (|VertexSetAbstract|))
                . #4=(|CUBECF;sphereSolid;NniFcc;1|))
          (LETT |v1|
                (LIST
                 (PROGN
                  (LETT #2# NIL . #4#)
                  (SEQ (LETT |n| 1 . #4#) (LETT #1# |dim| . #4#) G190
                       (COND ((|greater_SI| |n| #1#) (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (LIST 1 2) #2#) . #4#)))
                       (LETT |n| (|inc_SI| |n|) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
                . #4#)
          (LETT |vs1| (SPADCALL |dim| (QREFELT $ 8)) . #4#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|cubicalComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|List|
                                                                    (LIST
                                                                     '|Integer|)))))
                                                 ASIMP))
                . #4#)
          (EXIT |r|)))) 

(SDEFUN |CUBECF;sphereSurface;NniFcc;2|
        ((|dim| |NonNegativeInteger|)
         ($ |FiniteCubicalComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteCubicalComplex| (|VertexSetAbstract|)))
          (|s| (|FiniteCubicalComplex| (|VertexSetAbstract|))))
         (SEQ
          (LETT |s| (SPADCALL |dim| (QREFELT $ 10))
                . #1=(|CUBECF;sphereSurface;NniFcc;2|))
          (LETT |r| (SPADCALL |s| (QREFELT $ 11)) . #1#) (EXIT |r|)))) 

(SDEFUN |CUBECF;torusSurface;Fcc;3|
        (($ |FiniteCubicalComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|b| #1=(|FiniteCubicalComplex| (|VertexSetAbstract|))) (|a| #1#))
         (SEQ
          (LETT |a| (SPADCALL 2 (QREFELT $ 12))
                . #2=(|CUBECF;torusSurface;Fcc;3|))
          (LETT |b| (SPADCALL 2 (QREFELT $ 12)) . #2#)
          (EXIT (SPADCALL |a| |b| (QREFELT $ 13)))))) 

(SDEFUN |CUBECF;band;Fcc;4| (($ |FiniteCubicalComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|b| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|List| (|Integer|)))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |cubicalComplex|
                     ($ #1=(|VertexSetAbstract|) (|List| (|CubicalFacet|))))
                    (SIGNATURE |cubicalComplex|
                     ($ #1# (|List| (|List| (|Segment| (|Integer|))))))
                    (SIGNATURE |cubicalComplex|
                     ($ #1# (|List| (|List| (|List| (|Integer|))))))
                    (SIGNATURE |cubicalComplex| ($ #1#))
                    (SIGNATURE |addCube| ($ $ (|CubicalFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $)))))
          (|a| (|FiniteCubicalComplex| (|VertexSetAbstract|))))
         (SEQ (LETT |a| (SPADCALL 2 (QREFELT $ 12)) . #2=(|CUBECF;band;Fcc;4|))
              (LETT ASIMP (|FiniteCubicalComplex| (|VertexSetAbstract|)) . #2#)
              (LETT |v1| (LIST (LIST (LIST 1 2))) . #2#)
              (LETT |vs1| (SPADCALL 2 (QREFELT $ 8)) . #2#)
              (LETT |b|
                    (SPADCALL |vs1| |v1|
                              (|compiledLookupCheck| '|cubicalComplex|
                                                     (LIST '$
                                                           (LIST
                                                            '|VertexSetAbstract|)
                                                           (LIST '|List|
                                                                 (LIST '|List|
                                                                       (LIST
                                                                        '|List|
                                                                        (LIST
                                                                         '|Integer|)))))
                                                     ASIMP))
                    . #2#)
              (EXIT (SPADCALL |a| |b| (QREFELT $ 13)))))) 

(SDEFUN |CUBECF;projectivePlane;Fcc;5|
        (($ |FiniteCubicalComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|List| (|Integer|)))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |cubicalComplex|
                     ($ #1=(|VertexSetAbstract|) (|List| (|CubicalFacet|))))
                    (SIGNATURE |cubicalComplex|
                     ($ #1# (|List| (|List| (|Segment| (|Integer|))))))
                    (SIGNATURE |cubicalComplex|
                     ($ #1# (|List| (|List| (|List| (|Integer|))))))
                    (SIGNATURE |cubicalComplex| ($ #1#))
                    (SIGNATURE |addCube| ($ $ (|CubicalFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |delta| ($ $))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteCubicalComplex| (|VertexSetAbstract|))
                . #2=(|CUBECF;projectivePlane;Fcc;5|))
          (LETT |v1|
                (LIST
                 (LIST (LIST 1 2) (LIST 1 1) (LIST 1 1) (LIST 1 2) (LIST 1 1))
                 (LIST (LIST 1 2) (LIST 1 1) (LIST 1 1) (LIST 1 1) (LIST 1 2))
                 (LIST (LIST 1 1) (LIST 1 2) (LIST 1 2) (LIST 1 1) (LIST 1 1))
                 (LIST (LIST 1 1) (LIST 1 2) (LIST 1 1) (LIST 1 2) (LIST 1 1))
                 (LIST (LIST 1 1) (LIST 1 1) (LIST 1 2) (LIST 1 1) (LIST 1 2))
                 (LIST (LIST 1 2) (LIST 1 2) (LIST 2 2) (LIST 1 1) (LIST 1 1))
                 (LIST (LIST 1 2) (LIST 2 2) (LIST 1 2) (LIST 1 1) (LIST 1 1))
                 (LIST (LIST 2 2) (LIST 1 2) (LIST 1 2) (LIST 1 1) (LIST 1 1))
                 (LIST (LIST 1 2) (LIST 1 2) (LIST 1 1) (LIST 1 1) (LIST 2 2))
                 (LIST (LIST 1 2) (LIST 2 2) (LIST 1 1) (LIST 1 1) (LIST 1 2))
                 (LIST (LIST 2 2) (LIST 1 2) (LIST 1 1) (LIST 1 1) (LIST 1 2))
                 (LIST (LIST 1 2) (LIST 1 1) (LIST 1 2) (LIST 2 2) (LIST 1 1))
                 (LIST (LIST 1 2) (LIST 1 1) (LIST 2 2) (LIST 1 2) (LIST 1 1))
                 (LIST (LIST 2 2) (LIST 1 1) (LIST 1 2) (LIST 1 2) (LIST 1 1))
                 (LIST (LIST 1 1) (LIST 1 2) (LIST 1 1) (LIST 1 2) (LIST 2 2))
                 (LIST (LIST 1 1) (LIST 1 2) (LIST 1 1) (LIST 2 2) (LIST 1 2))
                 (LIST (LIST 1 1) (LIST 2 2) (LIST 1 1) (LIST 1 2) (LIST 1 2))
                 (LIST (LIST 1 1) (LIST 1 1) (LIST 1 2) (LIST 1 2) (LIST 2 2))
                 (LIST (LIST 1 1) (LIST 1 1) (LIST 1 2) (LIST 2 2) (LIST 1 2))
                 (LIST (LIST 1 1) (LIST 1 1) (LIST 2 2) (LIST 1 2) (LIST 1 2)))
                . #2#)
          (LETT |vs1| (SPADCALL 6 (QREFELT $ 8)) . #2#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|cubicalComplex|
                                                 (LIST '$
                                                       (LIST
                                                        '|VertexSetAbstract|)
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|List|
                                                                    (LIST
                                                                     '|Integer|)))))
                                                 ASIMP))
                . #2#)
          (EXIT |r|)))) 

(DECLAIM (NOTINLINE |CubicalComplexFactory;|)) 

(DEFUN |CubicalComplexFactory| ()
  (SPROG NIL
         (PROG (#1=#:G715)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CubicalComplexFactory|)
                    . #2=(|CubicalComplexFactory|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CubicalComplexFactory|
                             (LIST
                              (CONS NIL (CONS 1 (|CubicalComplexFactory;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CubicalComplexFactory|)))))))))) 

(DEFUN |CubicalComplexFactory;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CubicalComplexFactory|)
                . #1=(|CubicalComplexFactory|))
          (LETT $ (GETREFV 17) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CubicalComplexFactory| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|CubicalComplexFactory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|)
              (|VertexSetAbstract|) (0 . |vertexSeta|)
              (|FiniteCubicalComplex| 7) |CUBECF;sphereSolid;NniFcc;1|
              (5 . |delta|) |CUBECF;sphereSurface;NniFcc;2| (10 . |product|)
              |CUBECF;torusSurface;Fcc;3| |CUBECF;band;Fcc;4|
              |CUBECF;projectivePlane;Fcc;5|)
           '#(|torusSurface| 16 |sphereSurface| 20 |sphereSolid| 25
              |projectivePlane| 30 |moebiusBand| 34 |kleinBottle| 38 |band| 42)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 7 0 6 8 1 9 0 0 11 2 9 0 0
                                                   0 13 0 0 9 14 1 0 9 6 12 1 0
                                                   9 6 10 0 0 9 16 0 0 9 1 0 0
                                                   9 1 0 0 9 15)))))
           '|lookupComplete|)) 

(MAKEPROP '|CubicalComplexFactory| 'NILADIC T) 
