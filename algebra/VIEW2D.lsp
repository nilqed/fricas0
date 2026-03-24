
(SDEFUN |VIEW2D;checkViewport| ((|viewport| (%)) (% (|Boolean|)))
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

(SDEFUN |VIEW2D;doOptions| ((|v| (|Rep|)) (% (|Void|)))
        (QSETVELT |v| 3 (SPADCALL (QVELT |v| 7) "FriCAS2D" (QREFELT % 15)))) 

(PUT '|VIEW2D;options;%L;3| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 7))) 

(SDEFUN |VIEW2D;options;%L;3| ((|viewport| (%)) (% (|List| (|DrawOption|))))
        (QVELT |viewport| 7)) 

(SDEFUN |VIEW2D;options;%L%;4|
        ((|viewport| (%)) (|opts| (|List| (|DrawOption|))) (% (%)))
        (SEQ (QSETVELT |viewport| 7 |opts|) (EXIT |viewport|))) 

(SDEFUN |VIEW2D;putGraph;%GiPiV;5|
        ((|viewport| (%)) (|aGraph| (|GraphImage|))
         (|which| (|PositiveInteger|)) (% (|Void|)))
        (SEQ
         (COND
          ((OR (> |which| 9) (< |which| 1))
           (|error|
            "Trying to put a graph with a negative index or too big an index")))
         (EXIT
          (SPADCALL (QVELT |viewport| 1) |which| (CONS 0 |aGraph|)
                    (QREFELT % 21))))) 

(SDEFUN |VIEW2D;getGraph;%PiGi;6|
        ((|viewport| (%)) (|which| (|PositiveInteger|)) (% (|GraphImage|)))
        (SPROG ((#1=#:G65 NIL))
               (SEQ
                (COND
                 ((OR (> |which| 9) (< |which| 1))
                  (|error|
                   "Trying to get a graph with a negative index or too big an index")))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (QVELT |viewport| 1) |which| (QREFELT % 26)) 1)
                   (|error| "Graph is undefined!"))
                  ('T
                   (PROG2
                       (LETT #1#
                             (SPADCALL (QVELT |viewport| 1) |which|
                                       (QREFELT % 26)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (|GraphImage|)
                                     (|Union| (|GraphImage|) "undefined")
                                     #1#)))))))) 

(PUT '|VIEW2D;graphStates;%V;7| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 2))) 

(SDEFUN |VIEW2D;graphStates;%V;7|
        ((|viewport| (%))
         (%
          (|Vector|
           (|Record| (|:| |scaleX| (|DoubleFloat|))
                     (|:| |scaleY| (|DoubleFloat|))
                     (|:| |deltaX| (|DoubleFloat|))
                     (|:| |deltaY| (|DoubleFloat|)) (|:| |points| (|Integer|))
                     (|:| |connect| (|Integer|)) (|:| |spline| (|Integer|))
                     (|:| |axes| (|Integer|)) (|:| |axesColor| (|Palette|))
                     (|:| |units| (|Integer|)) (|:| |unitsColor| (|Palette|))
                     (|:| |showing| (|Integer|))))))
        (QVELT |viewport| 2)) 

(PUT '|VIEW2D;graphs;%V;8| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 1))) 

(SDEFUN |VIEW2D;graphs;%V;8|
        ((|viewport| (%)) (% (|Vector| (|Union| (|GraphImage|) "undefined"))))
        (QVELT |viewport| 1)) 

(PUT '|VIEW2D;key;%I;9| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 0))) 

(SDEFUN |VIEW2D;key;%I;9| ((|viewport| (%)) (% (|Integer|)))
        (QVELT |viewport| 0)) 

(SDEFUN |VIEW2D;dimensions;%2Nni2PiV;10|
        ((|viewport| (%)) (|ViewX| (|NonNegativeInteger|))
         (|ViewY| (|NonNegativeInteger|)) (|ViewWidth| (|PositiveInteger|))
         (|ViewHeight| (|PositiveInteger|)) (% (|Void|)))
        (SEQ (QSETVELT |viewport| 4 (CONS |ViewX| |ViewY|))
             (EXIT (QSETVELT |viewport| 5 (CONS |ViewWidth| |ViewHeight|))))) 

(SDEFUN |VIEW2D;move;%2NniV;11|
        ((|viewport| (%)) (|xLoc| (|NonNegativeInteger|))
         (|yLoc| (|NonNegativeInteger|)) (% (|Void|)))
        (SPROG ((#1=#:G88 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 4 (CONS |xLoc| |yLoc|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                                   (QREFELT % 36))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 102)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| %)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xLoc|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |yLoc|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G86)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;update;%GiPiV;12|
        ((|viewport| (%)) (|graph| (|GraphImage|)) (|slot| (|PositiveInteger|))
         (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0 (QREFELT % 36))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 106)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| %)
                   (SEQ
                    (|sockSendInt| |$ViewportServer|
                                   (SPADCALL |graph| (QREFELT % 38)))
                    (|sockSendInt| |$ViewportServer| |slot|)
                    (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT % 39)))))) 

(SDEFUN |VIEW2D;resize;%2PiV;13|
        ((|viewport| (%)) (|xSize| (|PositiveInteger|))
         (|ySize| (|PositiveInteger|)) (% (|Void|)))
        (SPROG ((#1=#:G100 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 5 (CONS |xSize| |ySize|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                                   (QREFELT % 36))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 103)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| %)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xSize|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |ySize|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G98)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;translate;%Pi2FV;14|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|xTranslateF| (|Float|)) (|yTranslateF| (|Float|)) (% (|Void|)))
        (SPROG
         ((#1=#:G106 NIL) (|yTranslate| #2=(|DoubleFloat|)) (|xTranslate| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |xTranslate| (SPADCALL |xTranslateF| (QREFELT % 44)))
                (LETT |yTranslate| (SPADCALL |yTranslateF| (QREFELT % 44)))
                (COND
                 ((> |graphIndex| 9)
                  (|error| "Referring to a graph with too big an index")))
                (QSETVELT
                 (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45)) 2
                 |xTranslate|)
                (QSETVELT
                 (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45)) 3
                 |yTranslate|)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                             (QREFELT % 36))
                   (PROGN
                    (LETT #1#
                          (SEQ (|sockSendInt| |$ViewportServer| 3)
                               (|sockSendInt| |$ViewportServer| 0)
                               (EXIT
                                (COND
                                 ((|VIEW2D;checkViewport| |viewport| %)
                                  (SEQ
                                   (|sockSendInt| |$ViewportServer|
                                                  |graphIndex|)
                                   (|sockSendFloat| |$ViewportServer|
                                                    |xTranslate|)
                                   (|sockSendFloat| |$ViewportServer|
                                                    |yTranslate|)
                                   (EXIT
                                    (|sockGetInt| |$ViewportServer|))))))))
                    (GO #3=#:G104)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |VIEW2D;scale;%Pi2FV;15|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|xScaleF| (|Float|)) (|yScaleF| (|Float|)) (% (|Void|)))
        (SPROG ((#1=#:G112 NIL) (|yScale| #2=(|DoubleFloat|)) (|xScale| #2#))
               (SEQ
                (EXIT
                 (SEQ (LETT |xScale| (SPADCALL |xScaleF| (QREFELT % 44)))
                      (LETT |yScale| (SPADCALL |yScaleF| (QREFELT % 44)))
                      (COND
                       ((> |graphIndex| 9)
                        (|error|
                         "Referring to a graph with too big an index")))
                      (QSETVELT
                       (SPADCALL (QVELT |viewport| 2) |graphIndex|
                                 (QREFELT % 45))
                       0 |xScale|)
                      (QSETVELT
                       (SPADCALL (QVELT |viewport| 2) |graphIndex|
                                 (QREFELT % 45))
                       1 |yScale|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                                   (QREFELT % 36))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 1)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| %)
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
                          (GO #3=#:G110)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |VIEW2D;viewport2D;%;16| ((% (%)))
        (VECTOR 0 (MAKEARR1 9 (CONS 1 "undefined"))
                (MAKEARR1 9 (MOVEVEC (MAKE_VEC 12) (QREFELT % 11))) "FriCAS2D"
                (CONS (SPADCALL (SPADCALL (QREFELT % 49)) 1 (QREFELT % 50))
                      (SPADCALL (SPADCALL (QREFELT % 49)) 2 (QREFELT % 50)))
                (CONS (SPADCALL (SPADCALL (QREFELT % 52)) 1 (QREFELT % 53))
                      (SPADCALL (SPADCALL (QREFELT % 52)) 2 (QREFELT % 53)))
                (LIST 0) NIL)) 

(SDEFUN |VIEW2D;makeViewport2D;GiL%;17|
        ((|g| (|GraphImage|)) (|opts| (|List| (|DrawOption|))) (% (%)))
        (SPROG ((|viewport| (%)))
               (SEQ (LETT |viewport| (SPADCALL (QREFELT % 54)))
                    (SPADCALL (QVELT |viewport| 1) 1 (CONS 0 |g|)
                              (QREFELT % 21))
                    (QSETVELT |viewport| 7 |opts|)
                    (COND
                     ((NULL (NULL (SPADCALL |opts| NIL (QREFELT % 56))))
                      (QSETVELT
                       (SPADCALL (QVELT |viewport| 2) 1 (QREFELT % 45)) 9 1)))
                    (EXIT (|VIEW2D;makeViewport2D0| |viewport| %))))) 

(SDEFUN |VIEW2D;makeViewport2D;2%;18| ((|viewport| (%)) (% (%)))
        (|VIEW2D;makeViewport2D0| (MOVEVEC (MAKE_VEC 8) |viewport|) %)) 

(SDEFUN |VIEW2D;send_graphs|
        ((|vg| (|Vector| (|Union| (|GraphImage|) #1="undefined")))
         (% (|Void|)))
        (SPROG
         ((|g| (|GraphImage|)) (#2=#:G142 NIL)
          (|gu| (|Union| (|GraphImage|) #1#)) (#3=#:G143 NIL) (|i| NIL))
         (SEQ (LETT |i| 1) (LETT #3# (QVSIZE |vg|)) G190
              (COND ((|greater_SI| |i| #3#) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |gu| (SPADCALL |vg| |i| (QREFELT % 26)))
                     (EXIT
                      (COND
                       ((QEQCAR |gu| 1)
                        (PROGN (LETT #2# |$NoValue|) (GO #4=#:G133)))
                       ('T
                        (SEQ (LETT |g| (QCDR |gu|))
                             (EXIT
                              (COND
                               ((EQL (SPADCALL |g| (QREFELT % 38)) 0)
                                (SPADCALL |g| (QREFELT % 59)))))))))))
               #4# (EXIT #2#))
              (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |VIEW2D;makeViewport2D0| ((|viewportDollar| (%)) (% (%)))
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
              (|VIEW2D;send_graphs| (QVELT |viewport| 1) %)
              (|VIEW2D;doOptions| |viewport| %)
              (SPADCALL
               "   FriCAS2D data being transmitted to the viewport manager..."
               (QREFELT % 61))
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
                          (SPADCALL (SPADCALL |viewport| (QREFELT % 31)) |i|
                                    (QREFELT % 26)))
                    (EXIT
                     (COND ((QEQCAR |g| 1) (|sockSendInt| |$ViewportServer| 0))
                           ('T
                            (SEQ
                             (|sockSendInt| |$ViewportServer|
                                            (SPADCALL (QCDR |g|)
                                                      (QREFELT % 38)))
                             (LETT |gs|
                                   (SPADCALL
                                    (SPADCALL |viewport| (QREFELT % 30)) |i|
                                    (QREFELT % 45)))
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
                                     (SPADCALL (QVELT |gs| 8) (QREFELT % 63))
                                     (QREFELT % 64))
                                    (* (SPADCALL (QVELT |gs| 8) (QREFELT % 65))
                                       (SPADCALL (QREFELT % 66)))))
                             (|sockSendInt| |$ViewportServer| |hueShade|)
                             (|sockSendInt| |$ViewportServer| (QVELT |gs| 9))
                             (LETT |hueShade|
                                   (+
                                    (SPADCALL
                                     (SPADCALL (QVELT |gs| 10) (QREFELT % 63))
                                     (QREFELT % 64))
                                    (*
                                     (SPADCALL (QVELT |gs| 10) (QREFELT % 65))
                                     (SPADCALL (QREFELT % 66)))))
                             (|sockSendInt| |$ViewportServer| |hueShade|)
                             (EXIT
                              (|sockSendInt| |$ViewportServer|
                                             (QVELT |gs| 11))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |viewport| 0 (|sockGetInt| |$ViewportServer|))
              (EXIT |viewport|)))) 

(SDEFUN |VIEW2D;graphState;%Pi4Df4IPIPIV;21|
        ((|viewport| (%)) (|num| (|PositiveInteger|)) (|sX| (|DoubleFloat|))
         (|sY| (|DoubleFloat|)) (|dX| (|DoubleFloat|)) (|dY| (|DoubleFloat|))
         (|Points| (|Integer|)) (|Lines| (|Integer|)) (|Spline| (|Integer|))
         (|Axes| (|Integer|)) (|AxesColor| (|Palette|)) (|Units| (|Integer|))
         (|UnitsColor| (|Palette|)) (|Showing| (|Integer|)) (% (|Void|)))
        (SPADCALL (QVELT |viewport| 2) |num|
                  (VECTOR |sX| |sY| |dX| |dY| |Points| |Lines| |Spline| |Axes|
                          |AxesColor| |Units| |UnitsColor| |Showing|)
                  (QREFELT % 67))) 

(SDEFUN |VIEW2D;title;%SV;22|
        ((|viewport| (%)) (|Title| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G164 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 3 |Title|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                                   (QREFELT % 36))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 104)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| %)
                                        (SEQ
                                         (|sockSendString| |$ViewportServer|
                                                           |Title|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G162)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;reset;%V;23| ((|viewport| (%)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0 (QREFELT % 36))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 100)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| %)
                   (SEQ (|sockSendInt| |$ViewportServer| 5)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT % 39)))))) 

(SDEFUN |VIEW2D;axes;%PiSV;24|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G175 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45))
                   7 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 8)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G173)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;axes;%PiPV;25|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|color| (|Palette|)) (% (|Void|)))
        (SPROG ((#1=#:G181 NIL) (|hueShade| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45))
                   8 |color|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 112)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (LETT |hueShade|
                                           (+
                                            (SPADCALL
                                             (SPADCALL |color| (QREFELT % 63))
                                             (QREFELT % 64))
                                            (*
                                             (SPADCALL |color| (QREFELT % 65))
                                             (SPADCALL (QREFELT % 66)))))
                                     (|sockSendInt| |$ViewportServer|
                                                    |hueShade|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G179)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;units;%PiSV;26|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G187 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45))
                   9 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 9)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G185)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;units;%PiPV;27|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|color| (|Palette|)) (% (|Void|)))
        (SPROG ((#1=#:G193 NIL) (|hueShade| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45))
                   10 |color|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 113)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (LETT |hueShade|
                                           (+
                                            (SPADCALL
                                             (SPADCALL |color| (QREFELT % 63))
                                             (QREFELT % 64))
                                            (*
                                             (SPADCALL |color| (QREFELT % 65))
                                             (SPADCALL (QREFELT % 66)))))
                                     (|sockSendInt| |$ViewportServer|
                                                    |hueShade|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G191)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;connect;%PiSV;28|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G199 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45))
                   5 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 3)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G197)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;points;%PiSV;29|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G205 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45))
                   4 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 2)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G203)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;region;%PiSV;30|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G211 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45))
                   6 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 4)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G209)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;show;%PiSV;31|
        ((|viewport| (%)) (|graphIndex| (|PositiveInteger|))
         (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G217 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> |graphIndex| 9)
                    (|error| "Referring to a graph with too big an index")))
                  (COND ((EQUAL |onOff| "on") (LETT |status| 1))
                        ('T (LETT |status| 0)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT % 45))
                   11 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 105)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G215)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW2D;controlPanel;%SV;32|
        ((|viewport| (%)) (|onOff| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G223 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on")
                    (PROGN (RPLACA #2=(QVELT |viewport| 6) 1) (QCAR #2#)))
                   ('T (PROGN (RPLACA #3=(QVELT |viewport| 6) 0) (QCAR #3#))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0
                               (QREFELT % 36))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 6)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| %)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QCAR
                                                     (QVELT |viewport| 6)))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #4=#:G221)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |VIEW2D;close;%V;33| ((|viewport| (%)) (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0 (QREFELT % 36))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 7)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| %)
                   (SEQ (|sockGetInt| |$ViewportServer|)
                        (EXIT (QSETVELT |viewport| 0 0))))))))
          ('T (SPADCALL (QREFELT % 39)))))) 

(SDEFUN |VIEW2D;coerce;%Of;34| ((|viewport| (%)) (% (|OutputForm|)))
        (COND
         ((EQL (SPADCALL |viewport| (QREFELT % 32)) 0)
          (SPADCALL
           (LIST
            (SPADCALL "Closed or Undefined TwoDimensionalViewport: "
                      (QREFELT % 82))
            (SPADCALL (QVELT |viewport| 3) (QREFELT % 83)))
           (QREFELT % 85)))
         ('T
          (SPADCALL
           (LIST (SPADCALL "TwoDimensionalViewport: " (QREFELT % 82))
                 (SPADCALL (QVELT |viewport| 3) (QREFELT % 83)))
           (QREFELT % 85))))) 

(SDEFUN |VIEW2D;write;%3S;35|
        ((|viewport| (%)) (|Filename| (|String|)) (|aThingToWrite| (|String|))
         (% (|String|)))
        (SPADCALL |viewport| |Filename| (LIST |aThingToWrite|) (QREFELT % 88))) 

(SDEFUN |VIEW2D;write;%2S;36|
        ((|viewport| (%)) (|Filename| (|String|)) (% (|String|)))
        (SPADCALL |viewport| |Filename| (SPADCALL (QREFELT % 90))
                  (QREFELT % 88))) 

(SDEFUN |VIEW2D;write;%SLS;37|
        ((|viewport| (%)) (|Filename| (|String|))
         (|thingsToWrite| (|List| (|String|))) (% (|String|)))
        (SPROG
         ((|writeTypeInt| (|Integer|)) (#1=#:G245 NIL) (|aTypeOfFile| NIL)
          (|m| (|Integer|)) (|avail| (|List| (|String|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |viewport| (QREFELT % 32)) 0 (QREFELT % 36))
            (SEQ (|sockSendInt| |$ViewportServer| 3)
                 (|sockSendInt| |$ViewportServer| 110)
                 (EXIT
                  (COND
                   ((|VIEW2D;checkViewport| |viewport| %)
                    (SEQ (|sockSendString| |$ViewportServer| |Filename|)
                         (LETT |m|
                               (PROGN
                                (LETT |avail| (SPADCALL (QREFELT % 92)))
                                1))
                         (SEQ (LETT |aTypeOfFile| NIL)
                              (LETT #1# |thingsToWrite|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |aTypeOfFile| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |writeTypeInt|
                                     (-
                                      (SPADCALL
                                       (SPADCALL |aTypeOfFile| (QREFELT % 93))
                                       |avail| (QREFELT % 94))
                                      |m|))
                               (EXIT
                                (COND
                                 ((< |writeTypeInt| 0)
                                  (SPADCALL
                                   (LIST "  > " |aTypeOfFile|
                                         " is not a valid file type for writing a 2D viewport")
                                   (QREFELT % 95)))
                                 ('T
                                  (|sockSendInt| |$ViewportServer|
                                                 (+ |writeTypeInt| 1))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (|sockSendInt| |$ViewportServer| 0)
                         (|sockGetInt| |$ViewportServer|)
                         (EXIT |Filename|))))))))))) 

(DECLAIM (NOTINLINE |TwoDimensionalViewport;|)) 

(DEFUN |TwoDimensionalViewport;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TwoDimensionalViewport|))
          (LETT % (GETREFV 97))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TwoDimensionalViewport| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
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
          (QSETREFV % 11
                    (VECTOR (|mk_DF| 9 -1) (|mk_DF| 9 -1) 0.0 0.0 1 1 0 1
                            (SPADCALL (QREFELT % 9)) 0
                            (SPADCALL (QREFELT % 10)) 1))
          %))) 

(DEFUN |TwoDimensionalViewport| ()
  (SPROG NIL
         (PROG (#1=#:G247)
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

(MAKEPROP '|TwoDimensionalViewport| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Palette|)
              (|ViewDefaultsPackage|) (0 . |axesColorDefault|)
              (4 . |unitsColorDefault|) '|defaultGS| (|String|)
              (|List| (|DrawOption|)) (|DrawOptionFunctions0|) (8 . |title|)
              |VIEW2D;options;%L;3| |VIEW2D;options;%L%;4|
              (|Union| 23 '"undefined") (|Integer|) (|Vector| 18)
              (14 . |setelt!|) (|Void|) (|GraphImage|) (|PositiveInteger|)
              |VIEW2D;putGraph;%GiPiV;5| (21 . |elt|) |VIEW2D;getGraph;%PiGi;6|
              (|Record| (|:| |scaleX| 42) (|:| |scaleY| 42) (|:| |deltaX| 42)
                        (|:| |deltaY| 42) (|:| |points| 19) (|:| |connect| 19)
                        (|:| |spline| 19) (|:| |axes| 19) (|:| |axesColor| 7)
                        (|:| |units| 19) (|:| |unitsColor| 7)
                        (|:| |showing| 19))
              (|Vector| 28) |VIEW2D;graphStates;%V;7| |VIEW2D;graphs;%V;8|
              |VIEW2D;key;%I;9| (|NonNegativeInteger|)
              |VIEW2D;dimensions;%2Nni2PiV;10| (|Boolean|) (27 . ~=)
              |VIEW2D;move;%2NniV;11| (33 . |key|) (38 . |void|)
              |VIEW2D;update;%GiPiV;12| |VIEW2D;resize;%2PiV;13|
              (|DoubleFloat|) (|Float|) (42 . |convert|) (47 . |elt|)
              |VIEW2D;translate;%Pi2FV;14| |VIEW2D;scale;%Pi2FV;15| (|List| 33)
              (53 . |viewPosDefault|) (57 . |elt|) (|List| 24)
              (63 . |viewSizeDefault|) (67 . |elt|) |VIEW2D;viewport2D;%;16|
              (|List| 43) (73 . |units|) |VIEW2D;makeViewport2D;GiL%;17|
              |VIEW2D;makeViewport2D;2%;18| (79 . |sendGraphImage|)
              (|DisplayPackage|) (84 . |say|) (|Color|) (89 . |hue|)
              (94 . |hue|) (99 . |shade|) (104 . |numberOfHues|)
              (108 . |setelt!|) |VIEW2D;graphState;%Pi4Df4IPIPIV;21|
              |VIEW2D;title;%SV;22| |VIEW2D;reset;%V;23| |VIEW2D;axes;%PiSV;24|
              |VIEW2D;axes;%PiPV;25| |VIEW2D;units;%PiSV;26|
              |VIEW2D;units;%PiPV;27| |VIEW2D;connect;%PiSV;28|
              |VIEW2D;points;%PiSV;29| |VIEW2D;region;%PiSV;30|
              |VIEW2D;show;%PiSV;31| |VIEW2D;controlPanel;%SV;32|
              |VIEW2D;close;%V;33| (|OutputForm|) (115 . |message|)
              (120 . |coerce|) (|List| %) (125 . |hconcat|)
              |VIEW2D;coerce;%Of;34| (|List| 12) |VIEW2D;write;%SLS;37|
              |VIEW2D;write;%3S;35| (130 . |viewWriteDefault|)
              |VIEW2D;write;%2S;36| (134 . |viewWriteAvailable|)
              (138 . |upperCase|) (143 . |position|) (149 . |say|)
              (|List| (|Point| 42)))
           '#(~= 154 |write| 160 |viewport2D| 180 |update| 184 |units| 191
              |translate| 205 |title| 213 |show| 219 |scale| 226 |resize| 234
              |reset| 241 |region| 246 |putGraph| 253 |points| 260 |options|
              267 |move| 278 |makeViewport2D| 285 |latex| 296 |key| 301
              |graphs| 306 |graphStates| 311 |graphState| 316 |getPickedPoints|
              334 |getGraph| 339 |dimensions| 345 |controlPanel| 354 |connect|
              360 |coerce| 367 |close| 372 |axes| 377 = 391)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 81) (|BasicType|))
                        (|makeByteWordVec2| 96
                                            '(0 8 7 9 0 8 7 10 2 14 12 13 12 15
                                              3 20 18 0 19 18 21 2 20 18 0 19
                                              26 2 19 35 0 0 36 1 23 19 0 38 0
                                              22 0 39 1 43 42 0 44 2 29 28 0 19
                                              45 0 8 48 49 2 48 33 0 19 50 0 8
                                              51 52 2 51 24 0 19 53 2 14 55 13
                                              55 56 1 23 22 0 59 1 60 22 12 61
                                              1 7 62 0 63 1 62 19 0 64 1 7 19 0
                                              65 0 62 24 66 3 29 28 0 19 28 67
                                              1 81 0 12 82 1 12 81 0 83 1 81 0
                                              84 85 0 8 87 90 0 8 87 92 1 12 0
                                              0 93 2 87 19 12 0 94 1 60 22 87
                                              95 2 0 35 0 0 1 2 0 12 0 12 91 3
                                              0 12 0 12 87 88 3 0 12 0 12 12 89
                                              0 0 0 54 3 0 22 0 23 24 40 3 0 22
                                              0 24 12 73 3 0 22 0 24 7 74 4 0
                                              22 0 24 43 43 46 2 0 22 0 12 69 3
                                              0 22 0 24 12 78 4 0 22 0 24 43 43
                                              47 3 0 22 0 24 24 41 1 0 22 0 70
                                              3 0 22 0 24 12 77 3 0 22 0 23 24
                                              25 3 0 22 0 24 12 76 1 0 13 0 16
                                              2 0 0 0 13 17 3 0 22 0 33 33 37 1
                                              0 0 0 58 2 0 0 23 13 57 1 0 12 0
                                              1 1 0 19 0 32 1 0 20 0 31 1 0 29
                                              0 30 14 0 22 0 24 42 42 42 42 19
                                              19 19 19 7 19 7 19 68 1 0 96 0 1
                                              2 0 23 0 24 27 5 0 22 0 33 33 24
                                              24 34 2 0 22 0 12 79 3 0 22 0 24
                                              12 75 1 0 81 0 86 1 0 22 0 80 3 0
                                              22 0 24 12 71 3 0 22 0 24 7 72 2
                                              0 35 0 0 1)))))
           '|lookupComplete|)) 
