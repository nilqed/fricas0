
(SDEFUN |DRAW;makeObject;ExSbLGi;1|
        ((|f| (|Ex|)) (|bind| (|SegmentBinding| (|Float|)))
         (|l| (|List| (|DrawOption|))) (% (|GraphImage|)))
        (SPADCALL (SPADCALL |f| (SPADCALL |bind| (QREFELT % 9)) (QREFELT % 12))
                  (SPADCALL |bind| (QREFELT % 14)) |l| (QREFELT % 18))) 

(SDEFUN |DRAW;maybe_add_title0|
        ((|f| (|Ex|)) (|l| (|List| (|DrawOption|))) (|s0| (|String|))
         (% (|List| (|DrawOption|))))
        (SPROG ((|s| (|String|)))
               (SEQ
                (COND ((SPADCALL |l| '|title| (QREFELT % 23)) |l|)
                      (#1='T
                       (SEQ
                        (LETT |s|
                              (SPADCALL (SPADCALL |f| (QREFELT % 25))
                                        (QREFELT % 27)))
                        (EXIT
                         (COND
                          ((> (SPADCALL |s| (QREFELT % 30)) 50)
                           (CONS (SPADCALL |s0| (QREFELT % 31)) |l|))
                          (#1# (CONS (SPADCALL |s| (QREFELT % 31)) |l|)))))))))) 

(SDEFUN |DRAW;maybe_add_title2D|
        ((|f| (|Ex|)) (|l| (|List| (|DrawOption|)))
         (% (|List| (|DrawOption|))))
        (|DRAW;maybe_add_title0| |f| |l| "FriCAS2D" %)) 

(SDEFUN |DRAW;maybe_add_title3D|
        ((|f| (|Ex|)) (|l| (|List| (|DrawOption|)))
         (% (|List| (|DrawOption|))))
        (|DRAW;maybe_add_title0| |f| |l| "FriCAS3D" %)) 

(SDEFUN |DRAW;draw;ExSbLTdv;5|
        ((|f| (|Ex|)) (|bind| (|SegmentBinding| (|Float|)))
         (|l| (|List| (|DrawOption|))) (% (|TwoDimensionalViewport|)))
        (SPROG ((|g| (|GraphImage|)))
               (SEQ (LETT |l| (|DRAW;maybe_add_title2D| |f| |l| %))
                    (LETT |g| (SPADCALL |f| |bind| |l| (QREFELT % 19)))
                    (EXIT (SPADCALL |g| |l| (QREFELT % 33)))))) 

(SDEFUN |DRAW;draw;ExSbTdv;6|
        ((|f| (|Ex|)) (|bind| (|SegmentBinding| (|Float|)))
         (% (|TwoDimensionalViewport|)))
        (SPADCALL |f| |bind| NIL (QREFELT % 34))) 

(SDEFUN |DRAW;makeObject;PpcSbLGi;7|
        ((|ppc| (|ParametricPlaneCurve| |Ex|))
         (|bind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|GraphImage|)))
        (SPROG
         ((|curve|
           (|ParametricPlaneCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ (LETT |f| (SPADCALL |ppc| 1 (QREFELT % 38)))
              (LETT |g| (SPADCALL |ppc| 2 (QREFELT % 38)))
              (LETT |curve|
                    (SPADCALL
                     (SPADCALL |f| (SPADCALL |bind| (QREFELT % 9))
                               (QREFELT % 12))
                     (SPADCALL |g| (SPADCALL |bind| (QREFELT % 9))
                               (QREFELT % 12))
                     (QREFELT % 40)))
              (EXIT
               (SPADCALL |curve| (SPADCALL |bind| (QREFELT % 14)) |l|
                         (QREFELT % 41)))))) 

(SDEFUN |DRAW;draw;PpcSbLTdv;8|
        ((|ppc| (|ParametricPlaneCurve| |Ex|))
         (|bind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|TwoDimensionalViewport|)))
        (SPROG ((|g| (|GraphImage|)) (|f| (|Ex|)))
               (SEQ (LETT |f| (SPADCALL |ppc| 1 (QREFELT % 38)))
                    (LETT |l| (|DRAW;maybe_add_title2D| |f| |l| %))
                    (LETT |g| (SPADCALL |ppc| |bind| |l| (QREFELT % 42)))
                    (EXIT (SPADCALL |g| |l| (QREFELT % 33)))))) 

(SDEFUN |DRAW;draw;PpcSbTdv;9|
        ((|ppc| (|ParametricPlaneCurve| |Ex|))
         (|bind| (|SegmentBinding| (|Float|))) (% (|TwoDimensionalViewport|)))
        (SPADCALL |ppc| |bind| NIL (QREFELT % 43))) 

(SDEFUN |DRAW;makeObject;PccSbLGi;10|
        ((|pcc| (|ParametricComplexCurve| |Ex|))
         (|bind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|GraphImage|)))
        (SPROG
         ((|curve|
           (|ParametricPlaneCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|cfi| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
          (|cfr| (|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|v| (|Symbol|))
          (|f| (|Ex|)))
         (SEQ (LETT |f| (SPADCALL |pcc| (QREFELT % 46)))
              (LETT |v| (SPADCALL |bind| (QREFELT % 9)))
              (LETT |cfr| (SPADCALL |f| |v| (QREFELT % 47)))
              (LETT |cfi| (SPADCALL |f| |v| (QREFELT % 48)))
              (LETT |curve| (SPADCALL |cfr| |cfi| (QREFELT % 40)))
              (EXIT
               (SPADCALL |curve| (SPADCALL |bind| (QREFELT % 14)) |l|
                         (QREFELT % 41)))))) 

(SDEFUN |DRAW;draw;PccSbLTdv;11|
        ((|pcc| (|ParametricComplexCurve| |Ex|))
         (|bind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|TwoDimensionalViewport|)))
        (SPROG ((|g| (|GraphImage|)) (|f| (|Ex|)))
               (SEQ (LETT |f| (SPADCALL |pcc| (QREFELT % 46)))
                    (LETT |l| (|DRAW;maybe_add_title2D| |f| |l| %))
                    (LETT |g| (SPADCALL |pcc| |bind| |l| (QREFELT % 49)))
                    (EXIT (SPADCALL |g| |l| (QREFELT % 33)))))) 

(SDEFUN |DRAW;draw;PccSbTdv;12|
        ((|pcc| (|ParametricComplexCurve| |Ex|))
         (|bind| (|SegmentBinding| (|Float|))) (% (|TwoDimensionalViewport|)))
        (SPADCALL |pcc| |bind| NIL (QREFELT % 50))) 

(SDEFUN |DRAW;makeObject;PscSbLTs;13|
        ((|psc| (|ParametricSpaceCurve| |Ex|))
         (|tBind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|ThreeSpace| (|DoubleFloat|))))
        (SPROG
         ((|curve|
           (|ParametricSpaceCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)) (|tSeg| (|Segment| (|Float|)))
          (|t| (|Symbol|)))
         (SEQ (LETT |t| (SPADCALL |tBind| (QREFELT % 9)))
              (LETT |tSeg| (SPADCALL |tBind| (QREFELT % 14)))
              (LETT |f| (SPADCALL |psc| 1 (QREFELT % 53)))
              (LETT |g| (SPADCALL |psc| 2 (QREFELT % 53)))
              (LETT |h| (SPADCALL |psc| 3 (QREFELT % 53)))
              (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| %))
              (LETT |curve|
                    (SPADCALL (SPADCALL |f| |t| (QREFELT % 12))
                              (SPADCALL |g| |t| (QREFELT % 12))
                              (SPADCALL |h| |t| (QREFELT % 12))
                              (QREFELT % 55)))
              (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT % 57)))))) 

(SDEFUN |DRAW;makeObject;PscSbTs;14|
        ((|psc| (|ParametricSpaceCurve| |Ex|))
         (|tBind| (|SegmentBinding| (|Float|)))
         (% (|ThreeSpace| (|DoubleFloat|))))
        (SPADCALL |psc| |tBind| NIL (QREFELT % 58))) 

(SDEFUN |DRAW;draw;PscSbLTdv;15|
        ((|psc| (|ParametricSpaceCurve| |Ex|))
         (|tBind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|ThreeDimensionalViewport|)))
        (SPROG
         ((|curve|
           (|ParametricSpaceCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)) (|tSeg| (|Segment| (|Float|)))
          (|t| (|Symbol|)))
         (SEQ (LETT |t| (SPADCALL |tBind| (QREFELT % 9)))
              (LETT |tSeg| (SPADCALL |tBind| (QREFELT % 14)))
              (LETT |f| (SPADCALL |psc| 1 (QREFELT % 53)))
              (LETT |g| (SPADCALL |psc| 2 (QREFELT % 53)))
              (LETT |h| (SPADCALL |psc| 3 (QREFELT % 53)))
              (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| %))
              (LETT |curve|
                    (SPADCALL (SPADCALL |f| |t| (QREFELT % 12))
                              (SPADCALL |g| |t| (QREFELT % 12))
                              (SPADCALL |h| |t| (QREFELT % 12))
                              (QREFELT % 55)))
              (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT % 61)))))) 

(SDEFUN |DRAW;draw;PscSbTdv;16|
        ((|psc| (|ParametricSpaceCurve| |Ex|))
         (|tBind| (|SegmentBinding| (|Float|)))
         (% (|ThreeDimensionalViewport|)))
        (SPADCALL |psc| |tBind| NIL (QREFELT % 62))) 

(SDEFUN |DRAW;makeObject;Ex2SbLTs;17|
        ((|f| (|Ex|)) (|xBind| (|SegmentBinding| (|Float|)))
         (|yBind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|ThreeSpace| (|DoubleFloat|))))
        (SPROG
         ((|ySeg| #1=(|Segment| (|Float|))) (|y| #2=(|Symbol|)) (|xSeg| #1#)
          (|x| #2#))
         (SEQ (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| %))
              (LETT |x| (SPADCALL |xBind| (QREFELT % 9)))
              (LETT |xSeg| (SPADCALL |xBind| (QREFELT % 14)))
              (LETT |y| (SPADCALL |yBind| (QREFELT % 9)))
              (LETT |ySeg| (SPADCALL |yBind| (QREFELT % 14)))
              (EXIT
               (SPADCALL (SPADCALL |f| |x| |y| (QREFELT % 65)) |xSeg| |ySeg|
                         |l| (QREFELT % 66)))))) 

(SDEFUN |DRAW;makeObject;Ex2SbTs;18|
        ((|f| (|Ex|)) (|xBind| (|SegmentBinding| (|Float|)))
         (|yBind| (|SegmentBinding| (|Float|)))
         (% (|ThreeSpace| (|DoubleFloat|))))
        (SPADCALL |f| |xBind| |yBind| NIL (QREFELT % 67))) 

(SDEFUN |DRAW;draw;Ex2SbLTdv;19|
        ((|f| (|Ex|)) (|xBind| (|SegmentBinding| (|Float|)))
         (|yBind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|ThreeDimensionalViewport|)))
        (SPROG
         ((|ySeg| #1=(|Segment| (|Float|))) (|y| #2=(|Symbol|)) (|xSeg| #1#)
          (|x| #2#))
         (SEQ (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| %))
              (LETT |x| (SPADCALL |xBind| (QREFELT % 9)))
              (LETT |xSeg| (SPADCALL |xBind| (QREFELT % 14)))
              (LETT |y| (SPADCALL |yBind| (QREFELT % 9)))
              (LETT |ySeg| (SPADCALL |yBind| (QREFELT % 14)))
              (EXIT
               (SPADCALL (SPADCALL |f| |x| |y| (QREFELT % 65)) |xSeg| |ySeg|
                         |l| (QREFELT % 69)))))) 

(SDEFUN |DRAW;draw;Ex2SbTdv;20|
        ((|f| (|Ex|)) (|xBind| (|SegmentBinding| (|Float|)))
         (|yBind| (|SegmentBinding| (|Float|)))
         (% (|ThreeDimensionalViewport|)))
        (SPADCALL |f| |xBind| |yBind| NIL (QREFELT % 70))) 

(SDEFUN |DRAW;makeObject;Ps2SbLTs;21|
        ((|s| (|ParametricSurface| |Ex|))
         (|uBind| (|SegmentBinding| (|Float|)))
         (|vBind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|ThreeSpace| (|DoubleFloat|))))
        (SPROG
         ((|surf|
           (|ParametricSurface|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|vSeg| #1=(|Segment| (|Float|))) (|v| #2=(|Symbol|)) (|uSeg| #1#)
          (|u| #2#) (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ (LETT |f| (SPADCALL |s| 1 (QREFELT % 73)))
              (LETT |g| (SPADCALL |s| 2 (QREFELT % 73)))
              (LETT |h| (SPADCALL |s| 3 (QREFELT % 73)))
              (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| %))
              (LETT |u| (SPADCALL |uBind| (QREFELT % 9)))
              (LETT |uSeg| (SPADCALL |uBind| (QREFELT % 14)))
              (LETT |v| (SPADCALL |vBind| (QREFELT % 9)))
              (LETT |vSeg| (SPADCALL |vBind| (QREFELT % 14)))
              (LETT |surf|
                    (SPADCALL (SPADCALL |f| |u| |v| (QREFELT % 65))
                              (SPADCALL |g| |u| |v| (QREFELT % 65))
                              (SPADCALL |h| |u| |v| (QREFELT % 65))
                              (QREFELT % 75)))
              (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT % 76)))))) 

(SDEFUN |DRAW;makeObject;Ps2SbTs;22|
        ((|s| (|ParametricSurface| |Ex|))
         (|uBind| (|SegmentBinding| (|Float|)))
         (|vBind| (|SegmentBinding| (|Float|)))
         (% (|ThreeSpace| (|DoubleFloat|))))
        (SPADCALL |s| |uBind| |vBind| NIL (QREFELT % 77))) 

(SDEFUN |DRAW;draw;Ps2SbLTdv;23|
        ((|s| (|ParametricSurface| |Ex|))
         (|uBind| (|SegmentBinding| (|Float|)))
         (|vBind| (|SegmentBinding| (|Float|))) (|l| (|List| (|DrawOption|)))
         (% (|ThreeDimensionalViewport|)))
        (SPROG
         ((|surf|
           (|ParametricSurface|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|vSeg| #1=(|Segment| (|Float|))) (|v| #2=(|Symbol|)) (|uSeg| #1#)
          (|u| #2#) (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ (LETT |f| (SPADCALL |s| 1 (QREFELT % 73)))
              (LETT |g| (SPADCALL |s| 2 (QREFELT % 73)))
              (LETT |h| (SPADCALL |s| 3 (QREFELT % 73)))
              (LETT |l| (|DRAW;maybe_add_title3D| |f| |l| %))
              (LETT |u| (SPADCALL |uBind| (QREFELT % 9)))
              (LETT |uSeg| (SPADCALL |uBind| (QREFELT % 14)))
              (LETT |v| (SPADCALL |vBind| (QREFELT % 9)))
              (LETT |vSeg| (SPADCALL |vBind| (QREFELT % 14)))
              (LETT |surf|
                    (SPADCALL (SPADCALL |f| |u| |v| (QREFELT % 65))
                              (SPADCALL |g| |u| |v| (QREFELT % 65))
                              (SPADCALL |h| |u| |v| (QREFELT % 65))
                              (QREFELT % 75)))
              (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT % 79)))))) 

(SDEFUN |DRAW;draw;Ps2SbTdv;24|
        ((|s| (|ParametricSurface| |Ex|))
         (|uBind| (|SegmentBinding| (|Float|)))
         (|vBind| (|SegmentBinding| (|Float|)))
         (% (|ThreeDimensionalViewport|)))
        (SPADCALL |s| |uBind| |vBind| NIL (QREFELT % 80))) 

(DECLAIM (NOTINLINE |TopLevelDrawFunctions;|)) 

(DEFUN |TopLevelDrawFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|TopLevelDrawFunctions| DV$1))
          (LETT % (GETREFV 82))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TopLevelDrawFunctions| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |TopLevelDrawFunctions| (#1=#:G69)
  (SPROG NIL
         (PROG (#2=#:G70)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TopLevelDrawFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TopLevelDrawFunctions;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TopLevelDrawFunctions|)))))))))) 

(MAKEPROP '|TopLevelDrawFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              (|SegmentBinding| (|Float|)) (0 . |variable|)
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|))
              (|MakeFloatCompiledFunction| 6) (5 . |makeFloatFunction|)
              (|Segment| (|Float|)) (11 . |segment|) (|GraphImage|) (|List| 22)
              (|TopLevelDrawFunctionsForCompiledFunctions|) (16 . |makeObject|)
              |DRAW;makeObject;ExSbLGi;1| (|Boolean|) (|List| %) (|DrawOption|)
              (23 . |option?|) (|InputForm|) (29 . |convert|) (|String|)
              (34 . |unparse|) (|Integer|) (|DisplayPackage|)
              (39 . |sayLength|) (44 . |title|) (|TwoDimensionalViewport|)
              (49 . |makeViewport2D|) |DRAW;draw;ExSbLTdv;5|
              |DRAW;draw;ExSbTdv;6| (|NonNegativeInteger|)
              (|ParametricPlaneCurve| 6) (55 . |coordinate|)
              (|ParametricPlaneCurve| 10) (61 . |curve|) (67 . |makeObject|)
              |DRAW;makeObject;PpcSbLGi;7| |DRAW;draw;PpcSbLTdv;8|
              |DRAW;draw;PpcSbTdv;9| (|ParametricComplexCurve| 6)
              (74 . |get_value|) (79 . |make_real_part_function|)
              (85 . |make_imaginary_part_function|)
              |DRAW;makeObject;PccSbLGi;10| |DRAW;draw;PccSbLTdv;11|
              |DRAW;draw;PccSbTdv;12| (|ParametricSpaceCurve| 6)
              (91 . |coordinate|) (|ParametricSpaceCurve| 10) (97 . |curve|)
              (|ThreeSpace| (|DoubleFloat|)) (104 . |makeObject|)
              |DRAW;makeObject;PscSbLTs;13| |DRAW;makeObject;PscSbTs;14|
              (|ThreeDimensionalViewport|) (111 . |draw|)
              |DRAW;draw;PscSbLTdv;15| |DRAW;draw;PscSbTdv;16|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
              (118 . |makeFloatFunction|) (125 . |makeObject|)
              |DRAW;makeObject;Ex2SbLTs;17| |DRAW;makeObject;Ex2SbTs;18|
              (133 . |draw|) |DRAW;draw;Ex2SbLTdv;19| |DRAW;draw;Ex2SbTdv;20|
              (|ParametricSurface| 6) (141 . |coordinate|)
              (|ParametricSurface| 64) (147 . |surface|) (154 . |makeObject|)
              |DRAW;makeObject;Ps2SbLTs;21| |DRAW;makeObject;Ps2SbTs;22|
              (162 . |draw|) |DRAW;draw;Ps2SbLTdv;23| |DRAW;draw;Ps2SbTdv;24|)
           '#(|makeObject| 170 |draw| 234) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|draw|
                                 ((|TwoDimensionalViewport|) |#1|
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|TwoDimensionalViewport|) |#1|
                                  (|SegmentBinding| (|Float|))))
                                T)
                              '((|makeObject|
                                 ((|GraphImage|) |#1|
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|TwoDimensionalViewport|)
                                  (|ParametricPlaneCurve| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|TwoDimensionalViewport|)
                                  (|ParametricPlaneCurve| |#1|)
                                  (|SegmentBinding| (|Float|))))
                                T)
                              '((|makeObject|
                                 ((|GraphImage|) (|ParametricPlaneCurve| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|TwoDimensionalViewport|)
                                  (|ParametricComplexCurve| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|TwoDimensionalViewport|)
                                  (|ParametricComplexCurve| |#1|)
                                  (|SegmentBinding| (|Float|))))
                                T)
                              '((|makeObject|
                                 ((|GraphImage|)
                                  (|ParametricComplexCurve| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|ThreeDimensionalViewport|)
                                  (|ParametricSpaceCurve| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|ThreeDimensionalViewport|)
                                  (|ParametricSpaceCurve| |#1|)
                                  (|SegmentBinding| (|Float|))))
                                T)
                              '((|makeObject|
                                 ((|ThreeSpace| (|DoubleFloat|))
                                  (|ParametricSpaceCurve| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|makeObject|
                                 ((|ThreeSpace| (|DoubleFloat|))
                                  (|ParametricSpaceCurve| |#1|)
                                  (|SegmentBinding| (|Float|))))
                                T)
                              '((|draw|
                                 ((|ThreeDimensionalViewport|) |#1|
                                  (|SegmentBinding| (|Float|))
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|ThreeDimensionalViewport|) |#1|
                                  (|SegmentBinding| (|Float|))
                                  (|SegmentBinding| (|Float|))))
                                T)
                              '((|makeObject|
                                 ((|ThreeSpace| (|DoubleFloat|)) |#1|
                                  (|SegmentBinding| (|Float|))
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|makeObject|
                                 ((|ThreeSpace| (|DoubleFloat|)) |#1|
                                  (|SegmentBinding| (|Float|))
                                  (|SegmentBinding| (|Float|))))
                                T)
                              '((|draw|
                                 ((|ThreeDimensionalViewport|)
                                  (|ParametricSurface| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|draw|
                                 ((|ThreeDimensionalViewport|)
                                  (|ParametricSurface| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|SegmentBinding| (|Float|))))
                                T)
                              '((|makeObject|
                                 ((|ThreeSpace| (|DoubleFloat|))
                                  (|ParametricSurface| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|SegmentBinding| (|Float|))
                                  (|List| (|DrawOption|))))
                                T)
                              '((|makeObject|
                                 ((|ThreeSpace| (|DoubleFloat|))
                                  (|ParametricSurface| |#1|)
                                  (|SegmentBinding| (|Float|))
                                  (|SegmentBinding| (|Float|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 81
                                            '(1 8 7 0 9 2 11 10 6 7 12 1 8 13 0
                                              14 3 17 15 10 13 16 18 2 22 20 21
                                              7 23 1 6 24 0 25 1 24 26 0 27 1
                                              29 28 26 30 1 22 0 26 31 2 32 0
                                              15 16 33 2 37 6 0 36 38 2 39 0 10
                                              10 40 3 17 15 39 13 16 41 1 45 6
                                              0 46 2 11 10 6 7 47 2 11 10 6 7
                                              48 2 52 6 0 36 53 3 54 0 10 10 10
                                              55 3 17 56 54 13 16 57 3 17 60 54
                                              13 16 61 3 11 64 6 7 7 65 4 17 56
                                              64 13 13 16 66 4 17 60 64 13 13
                                              16 69 2 72 6 0 36 73 3 74 0 64 64
                                              64 75 4 17 56 74 13 13 16 76 4 17
                                              60 74 13 13 16 79 4 0 56 72 8 8
                                              16 77 3 0 56 72 8 8 78 3 0 56 6 8
                                              8 68 4 0 56 6 8 8 16 67 2 0 56 52
                                              8 59 3 0 56 52 8 16 58 3 0 15 45
                                              8 16 49 3 0 15 37 8 16 42 3 0 15
                                              6 8 16 19 3 0 60 72 8 8 81 4 0 60
                                              72 8 8 16 80 4 0 60 6 8 8 16 70 3
                                              0 60 6 8 8 71 2 0 60 52 8 63 3 0
                                              60 52 8 16 62 2 0 32 45 8 51 3 0
                                              32 45 8 16 50 3 0 32 37 8 16 43 2
                                              0 32 37 8 44 3 0 32 6 8 16 34 2 0
                                              32 6 8 35)))))
           '|lookupComplete|)) 
