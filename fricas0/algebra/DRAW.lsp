
(SDEFUN |DRAW;makeObject;ExSbLGi;1|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |GraphImage|))
        (SPADCALL (SPADCALL |f| (SPADCALL |bind| (QREFELT $ 9)) (QREFELT $ 12))
                  (SPADCALL |bind| (QREFELT $ 14)) |l| (QREFELT $ 18))) 

(SDEFUN |DRAW;maybe_add_title0|
        ((|f| |Ex|) (|l| |List| (|DrawOption|)) (|s0| |String|)
         ($ |List| (|DrawOption|)))
        (SPROG ((|s| (|String|)))
               (SEQ
                (COND ((SPADCALL |l| '|title| (QREFELT $ 23)) |l|)
                      (#1='T
                       (SEQ
                        (LETT |s|
                              (SPADCALL (SPADCALL |f| (QREFELT $ 25))
                                        (QREFELT $ 27))
                              |DRAW;maybe_add_title0|)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50
                                     (QREFELT $ 31))
                           (CONS (SPADCALL |s0| (QREFELT $ 32)) |l|))
                          (#1# (CONS (SPADCALL |s| (QREFELT $ 32)) |l|)))))))))) 

(SDEFUN |DRAW;maybe_add_title2D|
        ((|f| |Ex|) (|l| |List| (|DrawOption|)) ($ |List| (|DrawOption|)))
        (|DRAW;maybe_add_title0| |f| |l| "FriCAS2D" $)) 

(SDEFUN |DRAW;maybe_add_title3D|
        ((|f| |Ex|) (|l| |List| (|DrawOption|)) ($ |List| (|DrawOption|)))
        (|DRAW;maybe_add_title0| |f| |l| "FriCAS3D" $)) 

(SDEFUN |DRAW;draw;ExSbLTdv;5|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |TwoDimensionalViewport|))
        (SPROG ((|g| (|GraphImage|)))
               (SEQ
                (LETT |l| (|DRAW;maybe_add_title2D| |f| |l| $)
                      . #1=(|DRAW;draw;ExSbLTdv;5|))
                (LETT |g| (SPADCALL |f| |bind| |l| (QREFELT $ 19)) . #1#)
                (EXIT (SPADCALL |g| |l| (QREFELT $ 34)))))) 

(SDEFUN |DRAW;draw;ExSbTdv;6|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         ($ |TwoDimensionalViewport|))
        (SPADCALL |f| |bind| NIL (QREFELT $ 35))) 

(SDEFUN |DRAW;makeObject;PpcSbLGi;7|
        ((|ppc| |ParametricPlaneCurve| |Ex|)
         (|bind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |GraphImage|))
        (SPROG
         ((|curve|
           (|ParametricPlaneCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ
          (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 39))
                . #1=(|DRAW;makeObject;PpcSbLGi;7|))
          (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 39)) . #1#)
          (LETT |curve|
                (SPADCALL
                 (SPADCALL |f| (SPADCALL |bind| (QREFELT $ 9)) (QREFELT $ 12))
                 (SPADCALL |g| (SPADCALL |bind| (QREFELT $ 9)) (QREFELT $ 12))
                 (QREFELT $ 41))
                . #1#)
          (EXIT
           (SPADCALL |curve| (SPADCALL |bind| (QREFELT $ 14)) |l|
                     (QREFELT $ 42)))))) 

(SDEFUN |DRAW;draw;PpcSbLTdv;8|
        ((|ppc| |ParametricPlaneCurve| |Ex|)
         (|bind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |TwoDimensionalViewport|))
        (SPROG ((|g| (|GraphImage|)) (|f| (|Ex|)))
               (SEQ
                (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 39))
                      . #1=(|DRAW;draw;PpcSbLTdv;8|))
                (LETT |l| (|DRAW;maybe_add_title2D| |f| |l| $) . #1#)
                (LETT |g| (SPADCALL |ppc| |bind| |l| (QREFELT $ 43)) . #1#)
                (EXIT (SPADCALL |g| |l| (QREFELT $ 34)))))) 

(SDEFUN |DRAW;draw;PpcSbTdv;9|
        ((|ppc| |ParametricPlaneCurve| |Ex|)
         (|bind| |SegmentBinding| (|Float|)) ($ |TwoDimensionalViewport|))
        (SPADCALL |ppc| |bind| NIL (QREFELT $ 44))) 

(SDEFUN |DRAW;makeObject;PscSbLTs;10|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|curve|
           (|ParametricSpaceCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)) (|tSeg| (|Segment| (|Float|)))
          (|t| (|Symbol|)))
         (SEQ
          (LETT |t| (SPADCALL |tBind| (QREFELT $ 9))
                . #1=(|DRAW;makeObject;PscSbLTs;10|))
          (LETT |tSeg| (SPADCALL |tBind| (QREFELT $ 14)) . #1#)
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 47)) . #1#)
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 47)) . #1#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 47)) . #1#)
          (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| $) . #1#)
          (LETT |curve|
                (SPADCALL (SPADCALL |f| |t| (QREFELT $ 12))
                          (SPADCALL |g| |t| (QREFELT $ 12))
                          (SPADCALL |h| |t| (QREFELT $ 12)) (QREFELT $ 49))
                . #1#)
          (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT $ 51)))))) 

(SDEFUN |DRAW;makeObject;PscSbTs;11|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |psc| |tBind| NIL (QREFELT $ 52))) 

(SDEFUN |DRAW;draw;PscSbLTdv;12|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|curve|
           (|ParametricSpaceCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)) (|tSeg| (|Segment| (|Float|)))
          (|t| (|Symbol|)))
         (SEQ
          (LETT |t| (SPADCALL |tBind| (QREFELT $ 9))
                . #1=(|DRAW;draw;PscSbLTdv;12|))
          (LETT |tSeg| (SPADCALL |tBind| (QREFELT $ 14)) . #1#)
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 47)) . #1#)
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 47)) . #1#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 47)) . #1#)
          (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| $) . #1#)
          (LETT |curve|
                (SPADCALL (SPADCALL |f| |t| (QREFELT $ 12))
                          (SPADCALL |g| |t| (QREFELT $ 12))
                          (SPADCALL |h| |t| (QREFELT $ 12)) (QREFELT $ 49))
                . #1#)
          (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT $ 55)))))) 

(SDEFUN |DRAW;draw;PscSbTdv;13|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |psc| |tBind| NIL (QREFELT $ 56))) 

(SDEFUN |DRAW;makeObject;Ex2SbLTs;14|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|ySeg| #1=(|Segment| (|Float|))) (|y| #2=(|Symbol|)) (|xSeg| #1#)
          (|x| #2#))
         (SEQ
          (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| $)
                . #3=(|DRAW;makeObject;Ex2SbLTs;14|))
          (LETT |x| (SPADCALL |xBind| (QREFELT $ 9)) . #3#)
          (LETT |xSeg| (SPADCALL |xBind| (QREFELT $ 14)) . #3#)
          (LETT |y| (SPADCALL |yBind| (QREFELT $ 9)) . #3#)
          (LETT |ySeg| (SPADCALL |yBind| (QREFELT $ 14)) . #3#)
          (EXIT
           (SPADCALL (SPADCALL |f| |x| |y| (QREFELT $ 59)) |xSeg| |ySeg| |l|
                     (QREFELT $ 60)))))) 

(SDEFUN |DRAW;makeObject;Ex2SbTs;15|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |f| |xBind| |yBind| NIL (QREFELT $ 61))) 

(SDEFUN |DRAW;draw;Ex2SbLTdv;16|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|ySeg| #1=(|Segment| (|Float|))) (|y| #2=(|Symbol|)) (|xSeg| #1#)
          (|x| #2#))
         (SEQ
          (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| $)
                . #3=(|DRAW;draw;Ex2SbLTdv;16|))
          (LETT |x| (SPADCALL |xBind| (QREFELT $ 9)) . #3#)
          (LETT |xSeg| (SPADCALL |xBind| (QREFELT $ 14)) . #3#)
          (LETT |y| (SPADCALL |yBind| (QREFELT $ 9)) . #3#)
          (LETT |ySeg| (SPADCALL |yBind| (QREFELT $ 14)) . #3#)
          (EXIT
           (SPADCALL (SPADCALL |f| |x| |y| (QREFELT $ 59)) |xSeg| |ySeg| |l|
                     (QREFELT $ 63)))))) 

(SDEFUN |DRAW;draw;Ex2SbTdv;17|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |f| |xBind| |yBind| NIL (QREFELT $ 64))) 

(SDEFUN |DRAW;makeObject;Ps2SbLTs;18|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|surf|
           (|ParametricSurface|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|vSeg| #1=(|Segment| (|Float|))) (|v| #2=(|Symbol|)) (|uSeg| #1#)
          (|u| #2#) (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ
          (LETT |f| (SPADCALL |s| 1 (QREFELT $ 67))
                . #3=(|DRAW;makeObject;Ps2SbLTs;18|))
          (LETT |g| (SPADCALL |s| 2 (QREFELT $ 67)) . #3#)
          (LETT |h| (SPADCALL |s| 3 (QREFELT $ 67)) . #3#)
          (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| $) . #3#)
          (LETT |u| (SPADCALL |uBind| (QREFELT $ 9)) . #3#)
          (LETT |uSeg| (SPADCALL |uBind| (QREFELT $ 14)) . #3#)
          (LETT |v| (SPADCALL |vBind| (QREFELT $ 9)) . #3#)
          (LETT |vSeg| (SPADCALL |vBind| (QREFELT $ 14)) . #3#)
          (LETT |surf|
                (SPADCALL (SPADCALL |f| |u| |v| (QREFELT $ 59))
                          (SPADCALL |g| |u| |v| (QREFELT $ 59))
                          (SPADCALL |h| |u| |v| (QREFELT $ 59)) (QREFELT $ 69))
                . #3#)
          (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT $ 70)))))) 

(SDEFUN |DRAW;makeObject;Ps2SbTs;19|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |s| |uBind| |vBind| NIL (QREFELT $ 71))) 

(SDEFUN |DRAW;draw;Ps2SbLTdv;20|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|surf|
           (|ParametricSurface|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|vSeg| #1=(|Segment| (|Float|))) (|v| #2=(|Symbol|)) (|uSeg| #1#)
          (|u| #2#) (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ
          (LETT |f| (SPADCALL |s| 1 (QREFELT $ 67))
                . #3=(|DRAW;draw;Ps2SbLTdv;20|))
          (LETT |g| (SPADCALL |s| 2 (QREFELT $ 67)) . #3#)
          (LETT |h| (SPADCALL |s| 3 (QREFELT $ 67)) . #3#)
          (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| $) . #3#)
          (LETT |u| (SPADCALL |uBind| (QREFELT $ 9)) . #3#)
          (LETT |uSeg| (SPADCALL |uBind| (QREFELT $ 14)) . #3#)
          (LETT |v| (SPADCALL |vBind| (QREFELT $ 9)) . #3#)
          (LETT |vSeg| (SPADCALL |vBind| (QREFELT $ 14)) . #3#)
          (LETT |surf|
                (SPADCALL (SPADCALL |f| |u| |v| (QREFELT $ 59))
                          (SPADCALL |g| |u| |v| (QREFELT $ 59))
                          (SPADCALL |h| |u| |v| (QREFELT $ 59)) (QREFELT $ 69))
                . #3#)
          (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT $ 73)))))) 

(SDEFUN |DRAW;draw;Ps2SbTdv;21|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |s| |uBind| |vBind| NIL (QREFELT $ 74))) 

(DECLAIM (NOTINLINE |TopLevelDrawFunctions;|)) 

(DEFUN |TopLevelDrawFunctions| (#1=#:G769)
  (SPROG NIL
         (PROG (#2=#:G770)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TopLevelDrawFunctions|)
                                               '|domainEqualList|)
                    . #3=(|TopLevelDrawFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TopLevelDrawFunctions;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TopLevelDrawFunctions|)))))))))) 

(DEFUN |TopLevelDrawFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TopLevelDrawFunctions|))
          (LETT |dv$| (LIST '|TopLevelDrawFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 76) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TopLevelDrawFunctions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TopLevelDrawFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              (|SegmentBinding| (|Float|)) (0 . |variable|)
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|))
              (|MakeFloatCompiledFunction| 6) (5 . |makeFloatFunction|)
              (|Segment| (|Float|)) (11 . |segment|) (|GraphImage|) (|List| 22)
              (|TopLevelDrawFunctionsForCompiledFunctions|) (16 . |makeObject|)
              |DRAW;makeObject;ExSbLGi;1| (|Boolean|) (|List| $) (|DrawOption|)
              (23 . |option?|) (|InputForm|) (29 . |convert|) (|String|)
              (34 . |unparse|) (|Integer|) (|DisplayPackage|)
              (39 . |sayLength|) (44 . >) (50 . |title|)
              (|TwoDimensionalViewport|) (55 . |makeViewport2D|)
              |DRAW;draw;ExSbLTdv;5| |DRAW;draw;ExSbTdv;6|
              (|NonNegativeInteger|) (|ParametricPlaneCurve| 6)
              (61 . |coordinate|) (|ParametricPlaneCurve| 10) (67 . |curve|)
              (73 . |makeObject|) |DRAW;makeObject;PpcSbLGi;7|
              |DRAW;draw;PpcSbLTdv;8| |DRAW;draw;PpcSbTdv;9|
              (|ParametricSpaceCurve| 6) (80 . |coordinate|)
              (|ParametricSpaceCurve| 10) (86 . |curve|)
              (|ThreeSpace| (|DoubleFloat|)) (93 . |makeObject|)
              |DRAW;makeObject;PscSbLTs;10| |DRAW;makeObject;PscSbTs;11|
              (|ThreeDimensionalViewport|) (100 . |draw|)
              |DRAW;draw;PscSbLTdv;12| |DRAW;draw;PscSbTdv;13|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
              (107 . |makeFloatFunction|) (114 . |makeObject|)
              |DRAW;makeObject;Ex2SbLTs;14| |DRAW;makeObject;Ex2SbTs;15|
              (122 . |draw|) |DRAW;draw;Ex2SbLTdv;16| |DRAW;draw;Ex2SbTdv;17|
              (|ParametricSurface| 6) (130 . |coordinate|)
              (|ParametricSurface| 58) (136 . |surface|) (143 . |makeObject|)
              |DRAW;makeObject;Ps2SbLTs;18| |DRAW;makeObject;Ps2SbTs;19|
              (151 . |draw|) |DRAW;draw;Ps2SbLTdv;20| |DRAW;draw;Ps2SbTdv;21|)
           '#(|makeObject| 159 |draw| 216) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 75
                                                 '(1 8 7 0 9 2 11 10 6 7 12 1 8
                                                   13 0 14 3 17 15 10 13 16 18
                                                   2 22 20 21 7 23 1 6 24 0 25
                                                   1 24 26 0 27 1 29 28 26 30 2
                                                   28 20 0 0 31 1 22 0 26 32 2
                                                   33 0 15 16 34 2 38 6 0 37 39
                                                   2 40 0 10 10 41 3 17 15 40
                                                   13 16 42 2 46 6 0 37 47 3 48
                                                   0 10 10 10 49 3 17 50 48 13
                                                   16 51 3 17 54 48 13 16 55 3
                                                   11 58 6 7 7 59 4 17 50 58 13
                                                   13 16 60 4 17 54 58 13 13 16
                                                   63 2 66 6 0 37 67 3 68 0 58
                                                   58 58 69 4 17 50 68 13 13 16
                                                   70 4 17 54 68 13 13 16 73 3
                                                   0 15 6 8 16 19 3 0 15 38 8
                                                   16 43 3 0 50 46 8 16 52 2 0
                                                   50 46 8 53 4 0 50 6 8 8 16
                                                   61 3 0 50 6 8 8 62 3 0 50 66
                                                   8 8 72 4 0 50 66 8 8 16 71 2
                                                   0 33 6 8 36 3 0 33 6 8 16 35
                                                   3 0 33 38 8 16 44 2 0 33 38
                                                   8 45 3 0 54 46 8 16 56 2 0
                                                   54 46 8 57 4 0 54 6 8 8 16
                                                   64 3 0 54 6 8 8 65 4 0 54 66
                                                   8 8 16 74 3 0 54 66 8 8
                                                   75)))))
           '|lookupComplete|)) 
