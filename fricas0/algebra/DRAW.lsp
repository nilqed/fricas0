
(SDEFUN |DRAW;makeObject;ExSbLGi;1|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |GraphImage|))
        (SPADCALL (SPADCALL |f| (SPADCALL |bind| (QREFELT $ 9)) (QREFELT $ 12))
                  (SPADCALL |bind| (QREFELT $ 14)) |l| (QREFELT $ 18))) 

(SDEFUN |DRAW;draw;ExSbLTdv;2|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |TwoDimensionalViewport|))
        (SPROG ((|g| (|GraphImage|)) (|s| (|String|)))
               (SEQ
                (COND
                 ((NULL (SPADCALL |l| '|title| (QREFELT $ 23)))
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 25))
                                   (QREFELT $ 27))
                         . #1=(|DRAW;draw;ExSbLTdv;2|))
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50
                                (QREFELT $ 31))
                      (LETT |l| (CONS (SPADCALL "FriCAS2D" (QREFELT $ 32)) |l|)
                            . #1#))
                     ('T
                      (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 32)) |l|)
                            . #1#)))))))
                (LETT |g| (SPADCALL |f| |bind| |l| (QREFELT $ 19)) . #1#)
                (EXIT (SPADCALL |g| |l| (QREFELT $ 34)))))) 

(SDEFUN |DRAW;draw;ExSbTdv;3|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         ($ |TwoDimensionalViewport|))
        (SPADCALL |f| |bind| NIL (QREFELT $ 35))) 

(SDEFUN |DRAW;makeObject;PpcSbLGi;4|
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
                . #1=(|DRAW;makeObject;PpcSbLGi;4|))
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

(SDEFUN |DRAW;draw;PpcSbLTdv;5|
        ((|ppc| |ParametricPlaneCurve| |Ex|)
         (|bind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |TwoDimensionalViewport|))
        (SPROG ((|g| (|GraphImage|)) (|s| (|String|)) (|f| (|Ex|)))
               (SEQ
                (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 39))
                      . #1=(|DRAW;draw;PpcSbLTdv;5|))
                (COND
                 ((NULL (SPADCALL |l| '|title| (QREFELT $ 23)))
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 25))
                                   (QREFELT $ 27))
                         . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50
                                (QREFELT $ 31))
                      (LETT |l| (CONS (SPADCALL "FriCAS2D" (QREFELT $ 32)) |l|)
                            . #1#))
                     ('T
                      (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 32)) |l|)
                            . #1#)))))))
                (LETT |g| (SPADCALL |ppc| |bind| |l| (QREFELT $ 43)) . #1#)
                (EXIT (SPADCALL |g| |l| (QREFELT $ 34)))))) 

(SDEFUN |DRAW;draw;PpcSbTdv;6|
        ((|ppc| |ParametricPlaneCurve| |Ex|)
         (|bind| |SegmentBinding| (|Float|)) ($ |TwoDimensionalViewport|))
        (SPADCALL |ppc| |bind| NIL (QREFELT $ 44))) 

(SDEFUN |DRAW;makeObject;PscSbLTs;7|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|curve|
           (|ParametricSpaceCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|s| (|String|)) (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|))
          (|tSeg| (|Segment| (|Float|))) (|t| (|Symbol|)))
         (SEQ
          (LETT |t| (SPADCALL |tBind| (QREFELT $ 9))
                . #1=(|DRAW;makeObject;PscSbLTs;7|))
          (LETT |tSeg| (SPADCALL |tBind| (QREFELT $ 14)) . #1#)
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 47)) . #1#)
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 47)) . #1#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 47)) . #1#)
          (COND
           ((NULL (SPADCALL |l| '|title| (QREFELT $ 23)))
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                   . #1#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50 (QREFELT $ 31))
                (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 32)) |l|)
                      . #1#))
               ('T
                (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 32)) |l|) . #1#)))))))
          (COND
           ((NULL (SPADCALL |l| '|style| (QREFELT $ 23)))
            (LETT |l|
                  (CONS
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                    (QREFELT $ 48))
                   |l|)
                  . #1#)))
          (LETT |curve|
                (SPADCALL (SPADCALL |f| |t| (QREFELT $ 12))
                          (SPADCALL |g| |t| (QREFELT $ 12))
                          (SPADCALL |h| |t| (QREFELT $ 12)) (QREFELT $ 50))
                . #1#)
          (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT $ 52)))))) 

(SDEFUN |DRAW;makeObject;PscSbTs;8|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |psc| |tBind| NIL (QREFELT $ 53))) 

(SDEFUN |DRAW;draw;PscSbLTdv;9|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|curve|
           (|ParametricSpaceCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|s| (|String|)) (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|))
          (|tSeg| (|Segment| (|Float|))) (|t| (|Symbol|)))
         (SEQ
          (LETT |t| (SPADCALL |tBind| (QREFELT $ 9))
                . #1=(|DRAW;draw;PscSbLTdv;9|))
          (LETT |tSeg| (SPADCALL |tBind| (QREFELT $ 14)) . #1#)
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 47)) . #1#)
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 47)) . #1#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 47)) . #1#)
          (COND
           ((NULL (SPADCALL |l| '|title| (QREFELT $ 23)))
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                   . #1#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50 (QREFELT $ 31))
                (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 32)) |l|)
                      . #1#))
               ('T
                (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 32)) |l|) . #1#)))))))
          (COND
           ((NULL (SPADCALL |l| '|style| (QREFELT $ 23)))
            (LETT |l|
                  (CONS
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                    (QREFELT $ 48))
                   |l|)
                  . #1#)))
          (LETT |curve|
                (SPADCALL (SPADCALL |f| |t| (QREFELT $ 12))
                          (SPADCALL |g| |t| (QREFELT $ 12))
                          (SPADCALL |h| |t| (QREFELT $ 12)) (QREFELT $ 50))
                . #1#)
          (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT $ 56)))))) 

(SDEFUN |DRAW;draw;PscSbTdv;10|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |psc| |tBind| NIL (QREFELT $ 57))) 

(SDEFUN |DRAW;makeObject;Ex2SbLTs;11|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|ySeg| #1=(|Segment| (|Float|))) (|y| #2=(|Symbol|)) (|xSeg| #1#)
          (|x| #2#) (|s| (|String|)))
         (SEQ
          (COND
           ((NULL (SPADCALL |l| '|title| (QREFELT $ 23)))
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                   . #3=(|DRAW;makeObject;Ex2SbLTs;11|))
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50 (QREFELT $ 31))
                (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 32)) |l|)
                      . #3#))
               ('T
                (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 32)) |l|) . #3#)))))))
          (COND
           ((NULL (SPADCALL |l| '|style| (QREFELT $ 23)))
            (LETT |l|
                  (CONS
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                    (QREFELT $ 48))
                   |l|)
                  . #3#)))
          (LETT |x| (SPADCALL |xBind| (QREFELT $ 9)) . #3#)
          (LETT |xSeg| (SPADCALL |xBind| (QREFELT $ 14)) . #3#)
          (LETT |y| (SPADCALL |yBind| (QREFELT $ 9)) . #3#)
          (LETT |ySeg| (SPADCALL |yBind| (QREFELT $ 14)) . #3#)
          (EXIT
           (SPADCALL (SPADCALL |f| |x| |y| (QREFELT $ 60)) |xSeg| |ySeg| |l|
                     (QREFELT $ 61)))))) 

(SDEFUN |DRAW;makeObject;Ex2SbTs;12|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |f| |xBind| |yBind| NIL (QREFELT $ 62))) 

(SDEFUN |DRAW;draw;Ex2SbLTdv;13|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|ySeg| #1=(|Segment| (|Float|))) (|y| #2=(|Symbol|)) (|xSeg| #1#)
          (|x| #2#) (|s| (|String|)))
         (SEQ
          (COND
           ((NULL (SPADCALL |l| '|title| (QREFELT $ 23)))
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                   . #3=(|DRAW;draw;Ex2SbLTdv;13|))
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50 (QREFELT $ 31))
                (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 32)) |l|)
                      . #3#))
               ('T
                (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 32)) |l|) . #3#)))))))
          (COND
           ((NULL (SPADCALL |l| '|style| (QREFELT $ 23)))
            (LETT |l|
                  (CONS
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                    (QREFELT $ 48))
                   |l|)
                  . #3#)))
          (LETT |x| (SPADCALL |xBind| (QREFELT $ 9)) . #3#)
          (LETT |xSeg| (SPADCALL |xBind| (QREFELT $ 14)) . #3#)
          (LETT |y| (SPADCALL |yBind| (QREFELT $ 9)) . #3#)
          (LETT |ySeg| (SPADCALL |yBind| (QREFELT $ 14)) . #3#)
          (EXIT
           (SPADCALL (SPADCALL |f| |x| |y| (QREFELT $ 60)) |xSeg| |ySeg| |l|
                     (QREFELT $ 64)))))) 

(SDEFUN |DRAW;draw;Ex2SbTdv;14|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |f| |xBind| |yBind| NIL (QREFELT $ 65))) 

(SDEFUN |DRAW;makeObject;Ps2SbLTs;15|
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
          (LETT |f| (SPADCALL |s| 1 (QREFELT $ 68))
                . #3=(|DRAW;makeObject;Ps2SbLTs;15|))
          (LETT |g| (SPADCALL |s| 2 (QREFELT $ 68)) . #3#)
          (LETT |h| (SPADCALL |s| 3 (QREFELT $ 68)) . #3#)
          (COND
           ((NULL (SPADCALL |l| '|title| (QREFELT $ 23)))
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50 (QREFELT $ 31))
                (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 32)) |l|)
                      . #3#))
               ('T
                (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 32)) |l|) . #3#)))))))
          (COND
           ((NULL (SPADCALL |l| '|style| (QREFELT $ 23)))
            (LETT |l|
                  (CONS
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                    (QREFELT $ 48))
                   |l|)
                  . #3#)))
          (LETT |u| (SPADCALL |uBind| (QREFELT $ 9)) . #3#)
          (LETT |uSeg| (SPADCALL |uBind| (QREFELT $ 14)) . #3#)
          (LETT |v| (SPADCALL |vBind| (QREFELT $ 9)) . #3#)
          (LETT |vSeg| (SPADCALL |vBind| (QREFELT $ 14)) . #3#)
          (LETT |surf|
                (SPADCALL (SPADCALL |f| |u| |v| (QREFELT $ 60))
                          (SPADCALL |g| |u| |v| (QREFELT $ 60))
                          (SPADCALL |h| |u| |v| (QREFELT $ 60)) (QREFELT $ 70))
                . #3#)
          (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT $ 71)))))) 

(SDEFUN |DRAW;makeObject;Ps2SbTs;16|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |s| |uBind| |vBind| NIL (QREFELT $ 72))) 

(SDEFUN |DRAW;draw;Ps2SbLTdv;17|
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
          (LETT |f| (SPADCALL |s| 1 (QREFELT $ 68))
                . #3=(|DRAW;draw;Ps2SbLTdv;17|))
          (LETT |g| (SPADCALL |s| 2 (QREFELT $ 68)) . #3#)
          (LETT |h| (SPADCALL |s| 3 (QREFELT $ 68)) . #3#)
          (COND
           ((NULL (SPADCALL |l| '|title| (QREFELT $ 23)))
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50 (QREFELT $ 31))
                (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 32)) |l|)
                      . #3#))
               ('T
                (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 32)) |l|) . #3#)))))))
          (COND
           ((NULL (SPADCALL |l| '|style| (QREFELT $ 23)))
            (LETT |l|
                  (CONS
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                    (QREFELT $ 48))
                   |l|)
                  . #3#)))
          (LETT |u| (SPADCALL |uBind| (QREFELT $ 9)) . #3#)
          (LETT |uSeg| (SPADCALL |uBind| (QREFELT $ 14)) . #3#)
          (LETT |v| (SPADCALL |vBind| (QREFELT $ 9)) . #3#)
          (LETT |vSeg| (SPADCALL |vBind| (QREFELT $ 14)) . #3#)
          (LETT |surf|
                (SPADCALL (SPADCALL |f| |u| |v| (QREFELT $ 60))
                          (SPADCALL |g| |u| |v| (QREFELT $ 60))
                          (SPADCALL |h| |u| |v| (QREFELT $ 60)) (QREFELT $ 70))
                . #3#)
          (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT $ 74)))))) 

(SDEFUN |DRAW;draw;Ps2SbTdv;18|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |s| |uBind| |vBind| NIL (QREFELT $ 75))) 

(DECLAIM (NOTINLINE |TopLevelDrawFunctions;|)) 

(DEFUN |TopLevelDrawFunctions| (#1=#:G802)
  (SPROG NIL
         (PROG (#2=#:G803)
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
          (LETT $ (GETREFV 77) . #1#)
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
              |DRAW;draw;ExSbLTdv;2| |DRAW;draw;ExSbTdv;3|
              (|NonNegativeInteger|) (|ParametricPlaneCurve| 6)
              (61 . |coordinate|) (|ParametricPlaneCurve| 10) (67 . |curve|)
              (73 . |makeObject|) |DRAW;makeObject;PpcSbLGi;4|
              |DRAW;draw;PpcSbLTdv;5| |DRAW;draw;PpcSbTdv;6|
              (|ParametricSpaceCurve| 6) (80 . |coordinate|) (86 . |style|)
              (|ParametricSpaceCurve| 10) (91 . |curve|)
              (|ThreeSpace| (|DoubleFloat|)) (98 . |makeObject|)
              |DRAW;makeObject;PscSbLTs;7| |DRAW;makeObject;PscSbTs;8|
              (|ThreeDimensionalViewport|) (105 . |draw|)
              |DRAW;draw;PscSbLTdv;9| |DRAW;draw;PscSbTdv;10|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
              (112 . |makeFloatFunction|) (119 . |makeObject|)
              |DRAW;makeObject;Ex2SbLTs;11| |DRAW;makeObject;Ex2SbTs;12|
              (127 . |draw|) |DRAW;draw;Ex2SbLTdv;13| |DRAW;draw;Ex2SbTdv;14|
              (|ParametricSurface| 6) (135 . |coordinate|)
              (|ParametricSurface| 59) (141 . |surface|) (148 . |makeObject|)
              |DRAW;makeObject;Ps2SbLTs;15| |DRAW;makeObject;Ps2SbTs;16|
              (156 . |draw|) |DRAW;draw;Ps2SbLTdv;17| |DRAW;draw;Ps2SbTdv;18|)
           '#(|makeObject| 164 |draw| 221) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(1 8 7 0 9 2 11 10 6 7 12 1 8
                                                   13 0 14 3 17 15 10 13 16 18
                                                   2 22 20 21 7 23 1 6 24 0 25
                                                   1 24 26 0 27 1 29 28 26 30 2
                                                   28 20 0 0 31 1 22 0 26 32 2
                                                   33 0 15 16 34 2 38 6 0 37 39
                                                   2 40 0 10 10 41 3 17 15 40
                                                   13 16 42 2 46 6 0 37 47 1 22
                                                   0 26 48 3 49 0 10 10 10 50 3
                                                   17 51 49 13 16 52 3 17 55 49
                                                   13 16 56 3 11 59 6 7 7 60 4
                                                   17 51 59 13 13 16 61 4 17 55
                                                   59 13 13 16 64 2 67 6 0 37
                                                   68 3 69 0 59 59 59 70 4 17
                                                   51 69 13 13 16 71 4 17 55 69
                                                   13 13 16 74 3 0 15 6 8 16 19
                                                   3 0 15 38 8 16 43 3 0 51 46
                                                   8 16 53 2 0 51 46 8 54 4 0
                                                   51 6 8 8 16 62 3 0 51 6 8 8
                                                   63 3 0 51 67 8 8 73 4 0 51
                                                   67 8 8 16 72 2 0 33 6 8 36 3
                                                   0 33 6 8 16 35 3 0 33 38 8
                                                   16 44 2 0 33 38 8 45 3 0 55
                                                   46 8 16 57 2 0 55 46 8 58 4
                                                   0 55 6 8 8 16 65 3 0 55 6 8
                                                   8 66 4 0 55 67 8 8 16 75 3 0
                                                   55 67 8 8 76)))))
           '|lookupComplete|)) 
