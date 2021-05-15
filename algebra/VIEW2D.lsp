
(SDEFUN |VIEW2D;checkViewport| ((|viewport| $) ($ |Boolean|))
        (SPROG ((|i| (|Integer|)))
               (SEQ (|sockSendInt| |$ViewportServer| (QVELT |viewport| 0))
                    (LETT |i| (|sockGetInt| |$ViewportServer|))
                    (EXIT
                     (COND
                      ((< |i| 0)
                       (SEQ (QSETVELT |viewport| 0 0)
                            (EXIT
                             (|error|
                              "This viewport has already been closed!"))))
                      ('T 'T)))))) 

(SDEFUN |VIEW2D;doOptions| ((|v| |Rep|) ($ |Void|))
        (QSETVELT |v| 3 (SPADCALL (QVELT |v| 7) "FriCAS2D" (QREFELT $ 21)))) 

(PUT '|VIEW2D;options;$L;3| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 7))) 

(SDEFUN |VIEW2D;options;$L;3| ((|viewport| $) ($ |List| (|DrawOption|)))
        (QVELT |viewport| 7)) 

(SDEFUN |VIEW2D;options;$L$;4|
        ((|viewport| $) (|opts| |List| (|DrawOption|)) ($ $))
        (SEQ (QSETVELT |viewport| 7 |opts|) (EXIT |viewport|))) 

(SDEFUN |VIEW2D;putGraph;$GiPiV;5|
        ((|viewport| $) (|aGraph| |GraphImage|) (|which| |PositiveInteger|)
         ($ |Void|))
        (SEQ
         (COND
          ((OR (> |which| 9) (< |which| 1))
           (|error|
            "Trying to put a graph with a negative index or too big an index")))
         (EXIT
          (SPADCALL (QVELT |viewport| 1) |which| (CONS 0 |aGraph|)
                    (QREFELT $ 27))))) 

(SDEFUN |VIEW2D;getGraph;$PiGi;6|
        ((|viewport| $) (|which| |PositiveInteger|) ($ |GraphImage|))
        (SPROG ((#1=#:G442 NIL))
               (SEQ
                (COND
                 ((OR (> |which| 9) (< |which| 1))
                  (|error|
                   "Trying to get a graph with a negative index or too big an index")))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (QVELT |viewport| 1) |which| (QREFELT $ 31)) 1)
                   (|error| "Graph is undefined!"))
                  ('T
                   (PROG2
                       (LETT #1#
                             (SPADCALL (QVELT |viewport| 1) |which|
                                       (QREFELT $ 31)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (|GraphImage|)
                                     (|Union| (|GraphImage|) "undefined")
                                     #1#)))))))) 

(PUT '|VIEW2D;graphStates;$V;7| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 2))) 

(SDEFUN |VIEW2D;graphStates;$V;7|
        ((|viewport| $)
         ($ |Vector|
          (|Record| (|:| |scaleX| (|DoubleFloat|))
                    (|:| |scaleY| (|DoubleFloat|))
                    (|:| |deltaX| (|DoubleFloat|))
                    (|:| |deltaY| (|DoubleFloat|)) (|:| |points| (|Integer|))
                    (|:| |connect| (|Integer|)) (|:| |spline| (|Integer|))
                    (|:| |axes| (|Integer|)) (|:| |axesColor| (|Palette|))
                    (|:| |units| (|Integer|)) (|:| |unitsColor| (|Palette|))
                    (|:| |showing| (|Integer|)))))
        (QVELT |viewport| 2)) 

(PUT '|VIEW2D;graphs;$V;8| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 1))) 

(SDEFUN |VIEW2D;graphs;$V;8|
        ((|viewport| $) ($ |Vector| (|Union| (|GraphImage|) "undefined")))
        (QVELT |viewport| 1)) 

(PUT '|VIEW2D;key;$I;9| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 0))) 

(SDEFUN |VIEW2D;key;$I;9| ((|viewport| $) ($ |Integer|)) (QVELT |viewport| 0)) 

(SDEFUN |VIEW2D;dimensions;$2Nni2PiV;10|
        ((|viewport| $) (|ViewX| |NonNegativeInteger|)
         (|ViewY| |NonNegativeInteger|) (|ViewWidth| |PositiveInteger|)
         (|ViewHeight| |PositiveInteger|) ($ |Void|))
        (SEQ (QSETVELT |viewport| 4 (CONS |ViewX| |ViewY|))
             (EXIT (QSETVELT |viewport| 5 (CONS |ViewWidth| |ViewHeight|))))) 

(SDEFUN |VIEW2D;move;$2NniV;11|
        ((|viewport| $) (|xLoc| |NonNegativeInteger|)
         (|yLoc| |NonNegativeInteger|) ($ |Void|))
        (SPROG ((#1=#:G465 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 4 (CONS |xLoc| |yLoc|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                                   (QREFELT $ 41))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 102)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xLoc|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |yLoc|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G463)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;update;$GiPiV;12|
        ((|viewport| $) (|graph| |GraphImage|) (|slot| |PositiveInteger|)
         ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0 (QREFELT $ 41))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 106)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| $)
                   (SEQ
                    (|sockSendInt| |$ViewportServer|
                                   (SPADCALL |graph| (QREFELT $ 43)))
                    (|sockSendInt| |$ViewportServer| |slot|)
                    (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT $ 44)))))) 

(SDEFUN |VIEW2D;resize;$2PiV;13|
        ((|viewport| $) (|xSize| |PositiveInteger|) (|ySize| |PositiveInteger|)
         ($ |Void|))
        (SPROG ((#1=#:G477 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 5 (CONS |xSize| |ySize|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                                   (QREFELT $ 41))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 103)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xSize|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |ySize|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G475)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;translate;$Pi2FV;14|
        ((|viewport| $) (|graphIndex| |PositiveInteger|)
         (|xTranslateF| |Float|) (|yTranslateF| |Float|) ($ |Void|))
        (SPROG
         ((#1=#:G483 NIL) (|yTranslate| #2=(|DoubleFloat|)) (|xTranslate| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |xTranslate| (SPADCALL |xTranslateF| (QREFELT $ 12)))
                (LETT |yTranslate| (SPADCALL |yTranslateF| (QREFELT $ 12)))
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (QSETVELT
                 (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47)) 2
                 |xTranslate|)
                (QSETVELT
                 (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47)) 3
                 |yTranslate|)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                             (QREFELT $ 41))
                   (PROGN
                    (LETT #1#
                          (SEQ (|sockSendInt| |$ViewportServer| 3)
                               (|sockSendInt| |$ViewportServer| 0)
                               (EXIT
                                (COND
                                 ((|VIEW2D;checkViewport| |viewport| $)
                                  (SEQ
                                   (|sockSendInt| |$ViewportServer|
                                                  |graphIndex|)
                                   (|sockSendFloat| |$ViewportServer|
                                                    |xTranslate|)
                                   (|sockSendFloat| |$ViewportServer|
                                                    |yTranslate|)
                                   (EXIT
                                    (|sockGetInt| |$ViewportServer|))))))))
                    (GO #3=#:G481)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |VIEW2D;scale;$Pi2FV;15|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|xScaleF| |Float|)
         (|yScaleF| |Float|) ($ |Void|))
        (SPROG ((#1=#:G489 NIL) (|yScale| #2=(|DoubleFloat|)) (|xScale| #2#))
               (SEQ
                (EXIT
                 (SEQ (LETT |xScale| (SPADCALL |xScaleF| (QREFELT $ 12)))
                      (LETT |yScale| (SPADCALL |yScaleF| (QREFELT $ 12)))
                      (COND
                       ((> |graphIndex| 9)
                        (|error|
                         "Referring to a graph with too big an index")))
                      (QSETVELT
                       (SPADCALL (QVELT |viewport| 2) |graphIndex|
                                 (QREFELT $ 47))
                       0 |xScale|)
                      (QSETVELT
                       (SPADCALL (QVELT |viewport| 2) |graphIndex|
                                 (QREFELT $ 47))
                       1 |yScale|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                                   (QREFELT $ 41))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 1)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |graphIndex|)
                                         (|sockSendFloat| |$ViewportServer|
                                                          |xScale|)
                                         (|sockSendFloat| |$ViewportServer|
                                                          |yScale|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #3=#:G487)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |VIEW2D;viewport2D;$;16| (($ $))
        (VECTOR 0 (MAKEARR1 9 (CONS 1 "undefined"))
                (MAKEARR1 9 (MOVEVEC (MAKE_VEC 12) (QREFELT $ 17))) "FriCAS2D"
                (CONS (SPADCALL (SPADCALL (QREFELT $ 52)) 1 (QREFELT $ 53))
                      (SPADCALL (SPADCALL (QREFELT $ 52)) 2 (QREFELT $ 53)))
                (CONS (SPADCALL (SPADCALL (QREFELT $ 55)) 1 (QREFELT $ 56))
                      (SPADCALL (SPADCALL (QREFELT $ 55)) 2 (QREFELT $ 56)))
                (LIST 0) NIL)) 

(SDEFUN |VIEW2D;makeViewport2D;GiL$;17|
        ((|g| |GraphImage|) (|opts| |List| (|DrawOption|)) ($ $))
        (SPROG ((|viewport| ($)))
               (SEQ (LETT |viewport| (SPADCALL (QREFELT $ 57)))
                    (SPADCALL (QVELT |viewport| 1) 1 (CONS 0 |g|)
                              (QREFELT $ 27))
                    (QSETVELT |viewport| 7 |opts|)
                    (EXIT (|VIEW2D;makeViewport2D0| |viewport| $))))) 

(SDEFUN |VIEW2D;makeViewport2D;2$;18| ((|viewport| $) ($ $))
        (|VIEW2D;makeViewport2D0| (MOVEVEC (MAKE_VEC 8) |viewport|) $)) 

(SDEFUN |VIEW2D;send_graphs|
        ((|vg| |Vector| (|Union| (|GraphImage|) #1="undefined")) ($ |Void|))
        (SPROG
         ((|g| (|GraphImage|)) (|gu| (|Union| (|GraphImage|) #1#))
          (#2=#:G517 NIL) (|i| NIL))
         (SEQ (LETT |i| 1) (LETT #2# (QVSIZE |vg|)) G190
              (COND ((|greater_SI| |i| #2#) (GO G191)))
              (SEQ (LETT |gu| (SPADCALL |vg| |i| (QREFELT $ 31)))
                   (EXIT
                    (COND ((QEQCAR |gu| 1) "iterate")
                          ('T
                           (SEQ (LETT |g| (QCDR |gu|))
                                (EXIT
                                 (COND
                                  ((EQL (SPADCALL |g| (QREFELT $ 43)) 0)
                                   (SPADCALL |g| (QREFELT $ 60))))))))))
              (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |VIEW2D;makeViewport2D0| ((|viewportDollar| $) ($ $))
        (SPROG
         ((|hueShade| (|Integer|))
          (|gs|
           (|Record| (|:| |scaleX| (|DoubleFloat|))
                     (|:| |scaleY| (|DoubleFloat|))
                     (|:| |deltaX| (|DoubleFloat|))
                     (|:| |deltaY| (|DoubleFloat|)) (|:| |points| (|Integer|))
                     (|:| |connect| (|Integer|)) (|:| |spline| (|Integer|))
                     (|:| |axes| (|Integer|)) (|:| |axesColor| (|Palette|))
                     (|:| |units| (|Integer|)) (|:| |unitsColor| (|Palette|))
                     (|:| |showing| (|Integer|))))
          (|g| (|Union| (|GraphImage|) "undefined")) (|i| NIL)
          (|viewport| (|Rep|)))
         (SEQ (LETT |viewport| |viewportDollar|)
              (|VIEW2D;send_graphs| (QVELT |viewport| 1) $)
              (|VIEW2D;doOptions| |viewport| $)
              (SPADCALL
               "   FriCAS2D data being transmitted to the viewport manager..."
               (QREFELT $ 62))
              (|sockSendInt| |$ViewportServer| 3)
              (|sockSendInt| |$ViewportServer| -1)
              (|sockSendString| |$ViewportServer| (QVELT |viewport| 3))
              (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 4)))
              (|sockSendInt| |$ViewportServer| (QCDR (QVELT |viewport| 4)))
              (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 5)))
              (|sockSendInt| |$ViewportServer| (QCDR (QVELT |viewport| 5)))
              (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 6)))
              (SEQ (LETT |i| 1) G190 (COND ((|greater_SI| |i| 9) (GO G191)))
                   (SEQ
                    (LETT |g|
                          (SPADCALL (SPADCALL |viewport| (QREFELT $ 36)) |i|
                                    (QREFELT $ 31)))
                    (EXIT
                     (COND ((QEQCAR |g| 1) (|sockSendInt| |$ViewportServer| 0))
                           ('T
                            (SEQ
                             (|sockSendInt| |$ViewportServer|
                                            (SPADCALL (QCDR |g|)
                                                      (QREFELT $ 43)))
                             (LETT |gs|
                                   (SPADCALL
                                    (SPADCALL |viewport| (QREFELT $ 35)) |i|
                                    (QREFELT $ 47)))
                             (|sockSendFloat| |$ViewportServer| (QVELT |gs| 0))
                             (|sockSendFloat| |$ViewportServer| (QVELT |gs| 1))
                             (|sockSendFloat| |$ViewportServer| (QVELT |gs| 2))
                             (|sockSendFloat| |$ViewportServer| (QVELT |gs| 3))
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 4))
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 5))
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 6))
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 7))
                             (LETT |hueShade|
                                   (+
                                    (SPADCALL
                                     (SPADCALL (QVELT |gs| 8) (QREFELT $ 64))
                                     (QREFELT $ 65))
                                    (* (SPADCALL (QVELT |gs| 8) (QREFELT $ 66))
                                       (SPADCALL (QREFELT $ 67)))))
                             (|sockSendInt| |$ViewportServer| |hueShade|)
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 9))
                             (LETT |hueShade|
                                   (+
                                    (SPADCALL
                                     (SPADCALL (QVELT |gs| 10) (QREFELT $ 64))
                                     (QREFELT $ 65))
                                    (*
                                     (SPADCALL (QVELT |gs| 10) (QREFELT $ 66))
                                     (SPADCALL (QREFELT $ 67)))))
                             (|sockSendInt| |$ViewportServer| |hueShade|)
                             (EXIT
                              (|sockSendInt| |$ViewportServer|
                                             (QVELT |gs| 11))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |viewport| 0 (|sockGetInt| |$ViewportServer|))
              (EXIT |viewport|)))) 

(SDEFUN |VIEW2D;graphState;$Pi4Df4IPIPIV;21|
        ((|viewport| $) (|num| |PositiveInteger|) (|sX| |DoubleFloat|)
         (|sY| |DoubleFloat|) (|dX| |DoubleFloat|) (|dY| |DoubleFloat|)
         (|Points| |Integer|) (|Lines| |Integer|) (|Spline| |Integer|)
         (|Axes| |Integer|) (|AxesColor| |Palette|) (|Units| |Integer|)
         (|UnitsColor| |Palette|) (|Showing| |Integer|) ($ |Void|))
        (SPADCALL (QVELT |viewport| 2) |num|
                  (VECTOR |sX| |sY| |dX| |dY| |Points| |Lines| |Spline| |Axes|
                          |AxesColor| |Units| |UnitsColor| |Showing|)
                  (QREFELT $ 68))) 

(SDEFUN |VIEW2D;title;$SV;22| ((|viewport| $) (|Title| |String|) ($ |Void|))
        (SPROG ((#1=#:G537 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 3 |Title|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                                   (QREFELT $ 41))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 104)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendString| |$ViewportServer|
                                                           |Title|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G535)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;reset;$V;23| ((|viewport| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0 (QREFELT $ 41))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 100)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| $)
                   (SEQ (|sockSendInt| |$ViewportServer| 5)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT $ 44)))))) 

(SDEFUN |VIEW2D;axes;$PiSV;24|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G548 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47))
                   7 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 8)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G546)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;axes;$PiPV;25|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|color| |Palette|)
         ($ |Void|))
        (SPROG ((#1=#:G554 NIL) (|hueShade| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47))
                   8 |color|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 112)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (LETT |hueShade|
                                           (+
                                            (SPADCALL
                                             (SPADCALL |color| (QREFELT $ 64))
                                             (QREFELT $ 65))
                                            (*
                                             (SPADCALL |color| (QREFELT $ 66))
                                             (SPADCALL (QREFELT $ 67)))))
                                     (|sockSendInt| |$ViewportServer|
                                                    |hueShade|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G552)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;units;$PiSV;26|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G560 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47))
                   9 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 9)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G558)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;units;$PiPV;27|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|color| |Palette|)
         ($ |Void|))
        (SPROG ((#1=#:G566 NIL) (|hueShade| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47))
                   10 |color|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 113)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (LETT |hueShade|
                                           (+
                                            (SPADCALL
                                             (SPADCALL |color| (QREFELT $ 64))
                                             (QREFELT $ 65))
                                            (*
                                             (SPADCALL |color| (QREFELT $ 66))
                                             (SPADCALL (QREFELT $ 67)))))
                                     (|sockSendInt| |$ViewportServer|
                                                    |hueShade|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G564)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;connect;$PiSV;28|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G572 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47))
                   5 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 3)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G570)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;points;$PiSV;29|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G578 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47))
                   4 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 2)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G576)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;region;$PiSV;30|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G584 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47))
                   6 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 4)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G582)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;show;$PiSV;31|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G590 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 47))
                   11 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 105)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G588)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;controlPanel;$SV;32|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G596 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on")
                    (PROGN (RPLACA #2=(QVELT |viewport| 6) 1) (QCAR #2#)))
                   ('T (PROGN (RPLACA #3=(QVELT |viewport| 6) 0) (QCAR #3#))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                               (QREFELT $ 41))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 6)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QCAR
                                                     (QVELT |viewport| 6)))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #4=#:G594)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |VIEW2D;close;$V;33| ((|viewport| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0 (QREFELT $ 41))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 7)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| $)
                   (SEQ (|sockGetInt| |$ViewportServer|)
                        (EXIT (QSETVELT |viewport| 0 0))))))))
          ('T (SPADCALL (QREFELT $ 44)))))) 

(SDEFUN |VIEW2D;coerce;$Of;34| ((|viewport| $) ($ |OutputForm|))
        (COND
         ((EQL (SPADCALL |viewport| (QREFELT $ 37)) 0)
          (SPADCALL
           (LIST
            (SPADCALL "Closed or Undefined TwoDimensionalViewport: "
                      (QREFELT $ 83))
            (SPADCALL (QVELT |viewport| 3) (QREFELT $ 84)))
           (QREFELT $ 86)))
         ('T
          (SPADCALL
           (LIST (SPADCALL "TwoDimensionalViewport: " (QREFELT $ 83))
                 (SPADCALL (QVELT |viewport| 3) (QREFELT $ 84)))
           (QREFELT $ 86))))) 

(SDEFUN |VIEW2D;write;$3S;35|
        ((|viewport| $) (|Filename| |String|) (|aThingToWrite| |String|)
         ($ |String|))
        (SPADCALL |viewport| |Filename| (LIST |aThingToWrite|) (QREFELT $ 89))) 

(SDEFUN |VIEW2D;write;$2S;36|
        ((|viewport| $) (|Filename| |String|) ($ |String|))
        (SPADCALL |viewport| |Filename| (SPADCALL (QREFELT $ 91))
                  (QREFELT $ 89))) 

(SDEFUN |VIEW2D;write;$SLS;37|
        ((|viewport| $) (|Filename| |String|)
         (|thingsToWrite| |List| (|String|)) ($ |String|))
        (SPROG
         ((#1=#:G617 NIL) (|writeTypeInt| (|Integer|)) (#2=#:G618 NIL)
          (|aTypeOfFile| NIL) (|m| (|Integer|)) (|avail| (|List| (|String|)))
          (|stringToSend| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |stringToSend| "")
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |viewport| (QREFELT $ 37)) 0
                             (QREFELT $ 41))
                   (PROGN
                    (LETT #1#
                          (SEQ (|sockSendInt| |$ViewportServer| 3)
                               (|sockSendInt| |$ViewportServer| 110)
                               (EXIT
                                (COND
                                 ((|VIEW2D;checkViewport| |viewport| $)
                                  (SEQ
                                   (|sockSendString| |$ViewportServer|
                                                     |Filename|)
                                   (LETT |m|
                                         (PROGN
                                          (LETT |avail|
                                                (SPADCALL (QREFELT $ 93)))
                                          1))
                                   (SEQ (LETT |aTypeOfFile| NIL)
                                        (LETT #2# |thingsToWrite|) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |aTypeOfFile| (CAR #2#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |writeTypeInt|
                                               (-
                                                (SPADCALL
                                                 (SPADCALL |aTypeOfFile|
                                                           (QREFELT $ 94))
                                                 |avail| (QREFELT $ 95))
                                                |m|))
                                         (EXIT
                                          (COND
                                           ((< |writeTypeInt| 0)
                                            (SPADCALL
                                             (LIST "  > " |aTypeOfFile|
                                                   " is not a valid file type for writing a 2D viewport")
                                             (QREFELT $ 96)))
                                           ('T
                                            (|sockSendInt| |$ViewportServer|
                                                           (+ |writeTypeInt|
                                                              1))))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT NIL))
                                   (|sockSendInt| |$ViewportServer| 0)
                                   (|sockGetInt| |$ViewportServer|)
                                   (EXIT |Filename|)))))))
                    (GO #3=#:G615)))))))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |TwoDimensionalViewport;|)) 

(DEFUN |TwoDimensionalViewport| ()
  (SPROG NIL
         (PROG (#1=#:G620)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TwoDimensionalViewport|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TwoDimensionalViewport|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|TwoDimensionalViewport;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|TwoDimensionalViewport|)))))))))) 

(DEFUN |TwoDimensionalViewport;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TwoDimensionalViewport|))
          (LETT $ (GETREFV 100))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TwoDimensionalViewport| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |key| (|Integer|))
                              (|:| |graphsField|
                                   (|Vector|
                                    (|Union| (|GraphImage|) "undefined")))
                              (|:| |graphStatesField|
                                   (|Vector|
                                    (|Record| (|:| |scaleX| (|DoubleFloat|))
                                              (|:| |scaleY| (|DoubleFloat|))
                                              (|:| |deltaX| (|DoubleFloat|))
                                              (|:| |deltaY| (|DoubleFloat|))
                                              (|:| |points| (|Integer|))
                                              (|:| |connect| (|Integer|))
                                              (|:| |spline| (|Integer|))
                                              (|:| |axes| (|Integer|))
                                              (|:| |axesColor| (|Palette|))
                                              (|:| |units| (|Integer|))
                                              (|:| |unitsColor| (|Palette|))
                                              (|:| |showing| (|Integer|)))))
                              (|:| |title| (|String|))
                              (|:| |moveTo|
                                   (|Record| (|:| X (|NonNegativeInteger|))
                                             (|:| Y (|NonNegativeInteger|))))
                              (|:| |size|
                                   (|Record| (|:| X (|PositiveInteger|))
                                             (|:| Y (|PositiveInteger|))))
                              (|:| |flags|
                                   (|Record| (|:| |showCP| (|Integer|))))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          (QSETREFV $ 17
                    (VECTOR
                     (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 10))
                               (QREFELT $ 12))
                     (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 10))
                               (QREFELT $ 12))
                     0.0 0.0 1 1 0 1 (SPADCALL (QREFELT $ 15)) 0
                     (SPADCALL (QREFELT $ 16)) 1))
          $))) 

(MAKEPROP '|TwoDimensionalViewport| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|PositiveInteger|)
              (|Float|) (0 . |float|) (|DoubleFloat|) (7 . |convert|)
              (|Palette|) (|ViewDefaultsPackage|) (12 . |axesColorDefault|)
              (16 . |unitsColorDefault|) '|defaultGS| (|String|)
              (|List| (|DrawOption|)) (|DrawOptionFunctions0|) (20 . |title|)
              |VIEW2D;options;$L;3| |VIEW2D;options;$L$;4| (26 . |One|)
              (|Union| 29 '"undefined") (|Vector| 25) (30 . |setelt!|) (|Void|)
              (|GraphImage|) |VIEW2D;putGraph;$GiPiV;5| (37 . |elt|)
              |VIEW2D;getGraph;$PiGi;6|
              (|Record| (|:| |scaleX| 11) (|:| |scaleY| 11) (|:| |deltaX| 11)
                        (|:| |deltaY| 11) (|:| |points| 7) (|:| |connect| 7)
                        (|:| |spline| 7) (|:| |axes| 7) (|:| |axesColor| 13)
                        (|:| |units| 7) (|:| |unitsColor| 13)
                        (|:| |showing| 7))
              (|Vector| 33) |VIEW2D;graphStates;$V;7| |VIEW2D;graphs;$V;8|
              |VIEW2D;key;$I;9| (|NonNegativeInteger|)
              |VIEW2D;dimensions;$2Nni2PiV;10| (|Boolean|) (43 . ~=)
              |VIEW2D;move;$2NniV;11| (49 . |key|) (54 . |void|)
              |VIEW2D;update;$GiPiV;12| |VIEW2D;resize;$2PiV;13| (58 . |elt|)
              |VIEW2D;translate;$Pi2FV;14| |VIEW2D;scale;$Pi2FV;15|
              (64 . |Zero|) (|List| 38) (68 . |viewPosDefault|) (72 . |elt|)
              (|List| 8) (78 . |viewSizeDefault|) (82 . |elt|)
              |VIEW2D;viewport2D;$;16| |VIEW2D;makeViewport2D;GiL$;17|
              |VIEW2D;makeViewport2D;2$;18| (88 . |sendGraphImage|)
              (|DisplayPackage|) (93 . |say|) (|Color|) (98 . |hue|)
              (103 . |hue|) (108 . |shade|) (113 . |numberOfHues|)
              (117 . |setelt!|) |VIEW2D;graphState;$Pi4Df4IPIPIV;21|
              |VIEW2D;title;$SV;22| |VIEW2D;reset;$V;23| |VIEW2D;axes;$PiSV;24|
              |VIEW2D;axes;$PiPV;25| |VIEW2D;units;$PiSV;26|
              |VIEW2D;units;$PiPV;27| |VIEW2D;connect;$PiSV;28|
              |VIEW2D;points;$PiSV;29| |VIEW2D;region;$PiSV;30|
              |VIEW2D;show;$PiSV;31| |VIEW2D;controlPanel;$SV;32|
              |VIEW2D;close;$V;33| (|OutputForm|) (124 . |message|)
              (129 . |coerce|) (|List| $) (134 . |hconcat|)
              |VIEW2D;coerce;$Of;34| (|List| 18) |VIEW2D;write;$SLS;37|
              |VIEW2D;write;$3S;35| (139 . |viewWriteDefault|)
              |VIEW2D;write;$2S;36| (143 . |viewWriteAvailable|)
              (147 . |upperCase|) (152 . |position|) (158 . |say|)
              (|List| (|Point| 11)) (|SingleInteger|) (|HashState|))
           '#(~= 163 |write| 169 |viewport2D| 189 |update| 193 |units| 200
              |translate| 214 |title| 222 |show| 228 |scale| 235 |resize| 243
              |reset| 250 |region| 255 |putGraph| 262 |points| 269 |options|
              276 |move| 287 |makeViewport2D| 294 |latex| 305 |key| 310
              |hashUpdate!| 315 |hash| 321 |graphs| 326 |graphStates| 331
              |graphState| 336 |getPickedPoints| 354 |getGraph| 359
              |dimensions| 365 |controlPanel| 374 |connect| 380 |coerce| 387
              |close| 392 |axes| 397 = 411)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 82))
                        (|makeByteWordVec2| 99
                                            '(3 9 0 7 7 8 10 1 9 11 0 12 0 14
                                              13 15 0 14 13 16 2 20 18 19 18 21
                                              0 9 0 24 3 26 25 0 7 25 27 2 26
                                              25 0 7 31 2 7 40 0 0 41 1 29 7 0
                                              43 0 28 0 44 2 34 33 0 7 47 0 9 0
                                              50 0 14 51 52 2 51 38 0 7 53 0 14
                                              54 55 2 54 8 0 7 56 1 29 28 0 60
                                              1 61 28 18 62 1 13 63 0 64 1 63 7
                                              0 65 1 13 7 0 66 0 63 8 67 3 34
                                              33 0 7 33 68 1 82 0 18 83 1 18 82
                                              0 84 1 82 0 85 86 0 14 88 91 0 14
                                              88 93 1 18 0 0 94 2 88 7 18 0 95
                                              1 61 28 88 96 2 0 40 0 0 1 3 0 18
                                              0 18 18 90 3 0 18 0 18 88 89 2 0
                                              18 0 18 92 0 0 0 57 3 0 28 0 29 8
                                              45 3 0 28 0 8 18 74 3 0 28 0 8 13
                                              75 4 0 28 0 8 9 9 48 2 0 28 0 18
                                              70 3 0 28 0 8 18 79 4 0 28 0 8 9
                                              9 49 3 0 28 0 8 8 46 1 0 28 0 71
                                              3 0 28 0 8 18 78 3 0 28 0 29 8 30
                                              3 0 28 0 8 18 77 2 0 0 0 19 23 1
                                              0 19 0 22 3 0 28 0 38 38 42 2 0 0
                                              29 19 58 1 0 0 0 59 1 0 18 0 1 1
                                              0 7 0 37 2 0 99 99 0 1 1 0 98 0 1
                                              1 0 26 0 36 1 0 34 0 35 14 0 28 0
                                              8 11 11 11 11 7 7 7 7 13 7 13 7
                                              69 1 0 97 0 1 2 0 29 0 8 32 5 0
                                              28 0 38 38 8 8 39 2 0 28 0 18 80
                                              3 0 28 0 8 18 76 1 0 82 0 87 1 0
                                              28 0 81 3 0 28 0 8 18 72 3 0 28 0
                                              8 13 73 2 0 40 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|TwoDimensionalViewport| 'NILADIC T) 
