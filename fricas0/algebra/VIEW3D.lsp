
(SDEFUN |VIEW3D;checkViewport| ((|viewport| $) ($ |Boolean|))
        (SPROG ((|i| (|Integer|)))
               (SEQ (|sockSendInt| |$ViewportServer| (QVELT |viewport| 0))
                    (LETT |i| (|sockGetInt| |$ViewportServer|)
                          |VIEW3D;checkViewport|)
                    (EXIT
                     (COND
                      ((< |i| 0)
                       (SEQ (QSETVELT |viewport| 0 0)
                            (EXIT
                             (|error|
                              "This viewport has already been closed!"))))
                      ('T 'T)))))) 

(SDEFUN |VIEW3D;arcsinTemp| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (COND
         ((SPADCALL |x| 1.0 (QREFELT $ 28))
          (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2))
         ((SPADCALL |x| (|minus_DF| 1.0) (QREFELT $ 29))
          (|div_DF_I|
           (SPADCALL 3 (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 30))
           2))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 31)) (QREFELT $ 32))
                    (QREFELT $ 17))))) 

(SDEFUN |VIEW3D;arctanTemp| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 31)) (QREFELT $ 33))
                  (QREFELT $ 17))) 

(SDEFUN |VIEW3D;doOptions| ((|v| |Rep|) ($ |Void|))
        (SPROG ((|st| (|String|)))
               (SEQ
                (QSETVELT |v| 2
                          (SPADCALL (QVELT |v| 12) "FriCAS3D" (QREFELT $ 37)))
                (LETT |st| (SPADCALL (QVELT |v| 12) "render" (QREFELT $ 38))
                      |VIEW3D;doOptions|)
                (COND
                 ((OR (EQUAL |st| "shade") (EQUAL |st| "render"))
                  (QSETVELT (QVELT |v| 7) 1 3))
                 ((OR (EQUAL |st| "solid") (EQUAL |st| "opaque"))
                  (QSETVELT (QVELT |v| 7) 1 7))
                 ((EQUAL |st| "contour") (QSETVELT (QVELT |v| 7) 1 24))
                 ((EQUAL |st| "smooth") (QSETVELT (QVELT |v| 7) 1 22))
                 ((EQUAL |st| "wireMesh") (QSETVELT (QVELT |v| 7) 1 9))
                 ('T (QSETVELT (QVELT |v| 7) 1 3)))
                (EXIT
                 (QSETVELT |v| 5
                           (SPADCALL (QVELT |v| 12)
                                     (VECTOR
                                      (SPADCALL (QREFELT $ 20) (QREFELT $ 39))
                                      (SPADCALL (QREFELT $ 22) (QREFELT $ 39))
                                      (SPADCALL (QREFELT $ 23) (QREFELT $ 39))
                                      1.0 1.0 1.0
                                      (SPADCALL (QREFELT $ 24) (QREFELT $ 39))
                                      (SPADCALL (QREFELT $ 25) (QREFELT $ 39)))
                                     (QREFELT $ 41))))))) 

(SDEFUN |VIEW3D;viewport3D;$;5| (($ $))
        (VECTOR 0 1 "FriCAS3D"
                (CONS (SPADCALL (SPADCALL (QREFELT $ 44)) 1 (QREFELT $ 46))
                      (SPADCALL (SPADCALL (QREFELT $ 44)) 2 (QREFELT $ 46)))
                (CONS (SPADCALL (SPADCALL (QREFELT $ 48)) 1 (QREFELT $ 49))
                      (SPADCALL (SPADCALL (QREFELT $ 48)) 2 (QREFELT $ 49)))
                (VECTOR (SPADCALL (QREFELT $ 20) (QREFELT $ 39))
                        (SPADCALL (QREFELT $ 22) (QREFELT $ 39))
                        (SPADCALL (QREFELT $ 23) (QREFELT $ 39)) 1.0 1.0 1.0
                        (SPADCALL (QREFELT $ 24) (QREFELT $ 39))
                        (SPADCALL (QREFELT $ 25) (QREFELT $ 39)))
                (CONS 0 27) (VECTOR 0 3 1 0 1 0)
                (VECTOR 0.0 0.0 1.0 0.0 0.0 1.0)
                (VECTOR 1 (FLOAT 500 MOST-POSITIVE-DOUBLE-FLOAT)
                        (FLOAT -250 MOST-POSITIVE-DOUBLE-FLOAT))
                (VECTOR 0.0 1.0 0.0 1.0 0.0 1.0 0 1) (SPADCALL (QREFELT $ 51))
                NIL)) 

(PUT '|VIEW3D;subspace;$Ts;6| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 11))) 

(SDEFUN |VIEW3D;subspace;$Ts;6|
        ((|viewport| $) ($ |ThreeSpace| (|DoubleFloat|))) (QVELT |viewport| 11)) 

(SDEFUN |VIEW3D;subspace;$Ts$;7|
        ((|viewport| $) (|space| |ThreeSpace| (|DoubleFloat|)) ($ $))
        (SEQ (QSETVELT |viewport| 11 |space|) (EXIT |viewport|))) 

(PUT '|VIEW3D;options;$L;8| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 12))) 

(SDEFUN |VIEW3D;options;$L;8| ((|viewport| $) ($ |List| (|DrawOption|)))
        (QVELT |viewport| 12)) 

(SDEFUN |VIEW3D;options;$L$;9|
        ((|viewport| $) (|opts| |List| (|DrawOption|)) ($ $))
        (SEQ (QSETVELT |viewport| 12 |opts|) (EXIT |viewport|))) 

(SDEFUN |VIEW3D;makeViewport3D;2$;10| ((|viewport| $) ($ $))
        (|VIEW3D;makeViewport3D0| (MOVEVEC (MAKE-VEC 13) |viewport|) $)) 

(SDEFUN |VIEW3D;makeViewport3D;TsS$;11|
        ((|space| |ThreeSpace| (|DoubleFloat|)) (|Title| |String|) ($ $))
        (SPROG ((|v| ($)))
               (SEQ
                (LETT |v| (SPADCALL (QREFELT $ 52))
                      |VIEW3D;makeViewport3D;TsS$;11|)
                (QSETVELT |v| 11 |space|)
                (QSETVELT |v| 12 (LIST (SPADCALL |Title| (QREFELT $ 59))))
                (EXIT (|VIEW3D;makeViewport3D0| |v| $))))) 

(SDEFUN |VIEW3D;makeViewport3D;TsL$;12|
        ((|space| |ThreeSpace| (|DoubleFloat|)) (|opts| |List| (|DrawOption|))
         ($ $))
        (SPROG ((|v| ($)))
               (SEQ
                (LETT |v| (SPADCALL (QREFELT $ 52))
                      |VIEW3D;makeViewport3D;TsL$;12|)
                (QSETVELT |v| 11 |space|) (QSETVELT |v| 12 |opts|)
                (EXIT (|VIEW3D;makeViewport3D0| |v| $))))) 

(SDEFUN |VIEW3D;makeViewport3D0| ((|viewport| $) ($ $))
        (SPROG
         ((#1=#:G845 NIL) (|oneIndexedPoint| NIL) (#2=#:G843 NIL)
          (|alipts| NIL) (#3=#:G844 NIL) (|tinyprop| NIL) (#4=#:G840 NIL)
          (|allipts| NIL) (#5=#:G841 NIL) (|oneprop| NIL) (#6=#:G842 NIL)
          (|onelprops| NIL) (|aPoint| #7=(|Point| (|DoubleFloat|)))
          (#8=#:G839 NIL) (|pt| NIL) (|n| (|PositiveInteger|)) (#9=#:G838 NIL)
          (|s| (|Set| (|PositiveInteger|)))
          (|lprops| (|List| (|SubSpaceComponentProperty|)))
          (|llprops| (|List| (|List| (|SubSpaceComponentProperty|))))
          (|lllipts| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|lpts| (|List| (|Point| (|DoubleFloat|))))
          (|transform| (|Mapping| #7# (|Point| (|DoubleFloat|)))))
         (SEQ (|VIEW3D;doOptions| |viewport| $)
              (|sayBrightly| (LIST "   Transmitting data..."))
              (LETT |transform|
                    (SPADCALL (QVELT |viewport| 12) (ELT $ 64) (QREFELT $ 66))
                    . #10=(|VIEW3D;makeViewport3D0|))
              (SPADCALL (QVELT |viewport| 11) (QREFELT $ 67))
              (LETT |lpts| (SPADCALL (QVELT |viewport| 11) (QREFELT $ 69))
                    . #10#)
              (LETT |lllipts| (SPADCALL (QVELT |viewport| 11) (QREFELT $ 71))
                    . #10#)
              (LETT |llprops| (SPADCALL (QVELT |viewport| 11) (QREFELT $ 73))
                    . #10#)
              (LETT |lprops| (SPADCALL (QVELT |viewport| 11) (QREFELT $ 75))
                    . #10#)
              (LETT |s| (SPADCALL (QREFELT $ 77)) . #10#)
              (SEQ (LETT |pt| NIL . #10#) (LETT #9# |lpts| . #10#) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |pt| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |pt| (QREFELT $ 78)) |s|
                               (QREFELT $ 79))))
                   (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |s| (QREFELT $ 80)) 1 (QREFELT $ 81))
                 (|error| "All points should have the same dimension"))
                (#11='T
                 (SEQ
                  (LETT |n| (|SPADfirst| (SPADCALL |s| (QREFELT $ 82))) . #10#)
                  (EXIT
                   (COND
                    ((< |n| 3)
                     (|error| "Dimension of points should be greater than 2"))
                    (#11#
                     (SEQ
                      (|sockSendInt| |$ViewportServer| (QVELT |viewport| 1))
                      (|sockSendInt| |$ViewportServer| -1)
                      (|sockSendString| |$ViewportServer| (QVELT |viewport| 2))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 5) 6))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 5) 7))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 5) 2))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 5) 3))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 5) 4))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 5) 5))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 5) 0))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 5) 1))
                      (|sockSendInt| |$ViewportServer|
                                     (QCAR (QVELT |viewport| 3)))
                      (|sockSendInt| |$ViewportServer|
                                     (QCDR (QVELT |viewport| 3)))
                      (|sockSendInt| |$ViewportServer|
                                     (QCAR (QVELT |viewport| 4)))
                      (|sockSendInt| |$ViewportServer|
                                     (QCDR (QVELT |viewport| 4)))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 7) 0))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 7) 1))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 7) 2))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 7) 3))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 7) 4))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 7) 5))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 10) 6))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 10) 7))
                      (|sockSendInt| |$ViewportServer|
                                     (QCAR (QVELT |viewport| 6)))
                      (|sockSendInt| |$ViewportServer|
                                     (QCDR (QVELT |viewport| 6)))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 8) 0))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 8) 1))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 8) 2))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 8) 5))
                      (|sockSendInt| |$ViewportServer|
                                     (QVELT (QVELT |viewport| 9) 0))
                      (|sockSendFloat| |$ViewportServer|
                                       (QVELT (QVELT |viewport| 9) 1))
                      (|sockSendInt| |$ViewportServer| (LENGTH |lpts|))
                      (SEQ (LETT |pt| NIL . #10#) (LETT #8# |lpts| . #10#) G190
                           (COND
                            ((OR (ATOM #8#)
                                 (PROGN (LETT |pt| (CAR #8#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |aPoint| (SPADCALL |pt| |transform|) . #10#)
                            (|sockSendFloat| |$ViewportServer|
                                             (SPADCALL |aPoint|
                                                       (QREFELT $ 84)))
                            (|sockSendFloat| |$ViewportServer|
                                             (SPADCALL |aPoint|
                                                       (QREFELT $ 85)))
                            (|sockSendFloat| |$ViewportServer|
                                             (SPADCALL |aPoint|
                                                       (QREFELT $ 86)))
                            (EXIT
                             (COND
                              ((EQL |n| 3)
                               (|sockSendFloat| |$ViewportServer|
                                                (SPADCALL |aPoint|
                                                          (QREFELT $ 86))))
                              ('T
                               (|sockSendFloat| |$ViewportServer|
                                                (SPADCALL |aPoint|
                                                          (QREFELT $ 87)))))))
                           (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                           (EXIT NIL))
                      (|sockSendInt| |$ViewportServer| (LENGTH |lllipts|))
                      (SEQ (LETT |onelprops| NIL . #10#)
                           (LETT #6# |llprops| . #10#)
                           (LETT |oneprop| NIL . #10#)
                           (LETT #5# |lprops| . #10#)
                           (LETT |allipts| NIL . #10#)
                           (LETT #4# |lllipts| . #10#) G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |allipts| (CAR #4#) . #10#) NIL)
                                 (ATOM #5#)
                                 (PROGN (LETT |oneprop| (CAR #5#) . #10#) NIL)
                                 (ATOM #6#)
                                 (PROGN
                                  (LETT |onelprops| (CAR #6#) . #10#)
                                  NIL))
                             (GO G191)))
                           (SEQ
                            (|sockSendInt| |$ViewportServer|
                                           (COND
                                            ((SPADCALL |oneprop|
                                                       (QREFELT $ 89))
                                             1)
                                            ('T 0)))
                            (|sockSendInt| |$ViewportServer|
                                           (COND
                                            ((SPADCALL |oneprop|
                                                       (QREFELT $ 90))
                                             1)
                                            ('T 0)))
                            (|sockSendInt| |$ViewportServer|
                                           (LENGTH |allipts|))
                            (EXIT
                             (SEQ (LETT |tinyprop| NIL . #10#)
                                  (LETT #3# |onelprops| . #10#)
                                  (LETT |alipts| NIL . #10#)
                                  (LETT #2# |allipts| . #10#) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN
                                         (LETT |alipts| (CAR #2#) . #10#)
                                         NIL)
                                        (ATOM #3#)
                                        (PROGN
                                         (LETT |tinyprop| (CAR #3#) . #10#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (|sockSendInt| |$ViewportServer|
                                                  (COND
                                                   ((SPADCALL |tinyprop|
                                                              (QREFELT $ 89))
                                                    1)
                                                   ('T 0)))
                                   (|sockSendInt| |$ViewportServer|
                                                  (COND
                                                   ((SPADCALL |tinyprop|
                                                              (QREFELT $ 90))
                                                    1)
                                                   ('T 0)))
                                   (|sockSendInt| |$ViewportServer|
                                                  (SPADCALL |alipts|
                                                            (QREFELT $ 91)))
                                   (EXIT
                                    (SEQ (LETT |oneIndexedPoint| NIL . #10#)
                                         (LETT #1# |alipts| . #10#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |oneIndexedPoint|
                                                      (CAR #1#) . #10#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (|sockSendInt| |$ViewportServer|
                                                          |oneIndexedPoint|)))
                                         (LETT #1# (CDR #1#) . #10#) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT #2#
                                        (PROG1 (CDR #2#)
                                          (LETT #3# (CDR #3#) . #10#))
                                        . #10#)
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT #4#
                                 (PROG1 (CDR #4#)
                                   (LETT #5#
                                         (PROG1 (CDR #5#)
                                           (LETT #6# (CDR #6#) . #10#))
                                         . #10#))
                                 . #10#)
                           (GO G190) G191 (EXIT NIL))
                      (QSETVELT |viewport| 0 (|sockGetInt| |$ViewportServer|))
                      (EXIT |viewport|)))))))))))) 

(SDEFUN |VIEW3D;viewThetaDefault;F;14| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 20) (QREFELT $ 92)) (QREFELT $ 31))) 

(SDEFUN |VIEW3D;viewThetaDefault;2F;15| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 20) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 94))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;viewPhiDefault;F;16| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 22) (QREFELT $ 92)) (QREFELT $ 31))) 

(SDEFUN |VIEW3D;viewPhiDefault;2F;17| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 22) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 94))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;viewZoomDefault;F;18| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 23) (QREFELT $ 92)) (QREFELT $ 31))) 

(SDEFUN |VIEW3D;viewZoomDefault;2F;19| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 23) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 94))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;viewDeltaXDefault;F;20| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 24) (QREFELT $ 92)) (QREFELT $ 31))) 

(SDEFUN |VIEW3D;viewDeltaXDefault;2F;21| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 24) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 94))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;viewDeltaYDefault;F;22| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 25) (QREFELT $ 92)) (QREFELT $ 31))) 

(SDEFUN |VIEW3D;viewDeltaYDefault;2F;23| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 25) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 94))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;lighting;$3FV;24|
        ((|viewport| $) (|Xlight| |Float|) (|Ylight| |Float|)
         (|Zlight| |Float|) ($ |Void|))
        (SPROG ((#1=#:G866 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 8) 0
                            (SPADCALL |Xlight| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 8) 1
                            (SPADCALL |Ylight| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 8) 2
                            (SPADCALL |Zlight| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 108)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 8) 0))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 8) 1))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 8) 2))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;lighting;$3FV;24|)
                      (GO #2=#:G864)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;axes;$SV;25| ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G872 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 2 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 2 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 6)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           2))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;axes;$SV;25|)
                      (GO #2=#:G870)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;diagonals;$SV;26|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G878 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 3 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 3 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 26)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           3))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;diagonals;$SV;26|)
                      (GO #2=#:G876)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;outlineRender;$SV;27|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G884 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 4 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 4 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 13)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           4))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;outlineRender;$SV;27|)
                      (GO #2=#:G882)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;controlPanel;$SV;28|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G890 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 0 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 0 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 4)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           0))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;controlPanel;$SV;28|)
                      (GO #2=#:G888)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;drawStyle;$SV;29| ((|viewport| $) (|how| |String|) ($ |Void|))
        (SPROG ((#1=#:G895 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |how| "shade") (QSETVELT (QVELT |viewport| 7) 1 3))
                   ((EQUAL |how| "solid") (QSETVELT (QVELT |viewport| 7) 1 7))
                   ((EQUAL |how| "contour")
                    (QSETVELT (QVELT |viewport| 7) 1 24))
                   ((EQUAL |how| "smooth")
                    (QSETVELT (QVELT |viewport| 7) 1 22))
                   ('T (QSETVELT (QVELT |viewport| 7) 1 9)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer|
                                                (QVELT (QVELT |viewport| 7) 1))
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (|sockGetInt| |$ViewportServer|)))))
                            |VIEW3D;drawStyle;$SV;29|)
                      (GO #2=#:G893)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;reset;$V;30| ((|viewport| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0 (QREFELT $ 105))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| 100)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |viewport| $)
                   (SEQ (|sockSendInt| |$ViewportServer| 8)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT $ 113)))))) 

(SDEFUN |VIEW3D;close;$V;31| ((|viewport| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0 (QREFELT $ 105))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| 5)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |viewport| $)
                   (SEQ (|sockGetInt| |$ViewportServer|)
                        (EXIT (QSETVELT |viewport| 0 0))))))))
          ('T (SPADCALL (QREFELT $ 113)))))) 

(SDEFUN |VIEW3D;viewpoint;$R;32|
        ((|viewport| $)
         ($ |Record| (|:| |theta| (|DoubleFloat|)) (|:| |phi| (|DoubleFloat|))
          (|:| |scale| (|DoubleFloat|)) (|:| |scaleX| (|DoubleFloat|))
          (|:| |scaleY| (|DoubleFloat|)) (|:| |scaleZ| (|DoubleFloat|))
          (|:| |deltaX| (|DoubleFloat|)) (|:| |deltaY| (|DoubleFloat|))))
        (SPROG
         ((|phi_sf| (|DoubleFloat|)) (|theta_sf| (|DoubleFloat|))
          (|scaleZ_sf| (|DoubleFloat|)) (|scaleY_sf| (|DoubleFloat|))
          (|scaleX_sf| (|DoubleFloat|)) (|scale_sf| (|DoubleFloat|))
          (|deltaY_sf| (|DoubleFloat|)) (|deltaX_sf| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0 (QREFELT $ 105))
            (SEQ (|sockSendInt| |$ViewportServer| 1)
                 (|sockSendInt| |$ViewportServer| 117)
                 (EXIT
                  (COND
                   ((|VIEW3D;checkViewport| |viewport| $)
                    (SEQ
                     (LETT |deltaX_sf| (|sockGetFloat| |$ViewportServer|)
                           . #1=(|VIEW3D;viewpoint;$R;32|))
                     (LETT |deltaY_sf| (|sockGetFloat| |$ViewportServer|)
                           . #1#)
                     (LETT |scale_sf| (|sockGetFloat| |$ViewportServer|) . #1#)
                     (LETT |scaleX_sf| (|sockGetFloat| |$ViewportServer|)
                           . #1#)
                     (LETT |scaleY_sf| (|sockGetFloat| |$ViewportServer|)
                           . #1#)
                     (LETT |scaleZ_sf| (|sockGetFloat| |$ViewportServer|)
                           . #1#)
                     (LETT |theta_sf| (|sockGetFloat| |$ViewportServer|) . #1#)
                     (LETT |phi_sf| (|sockGetFloat| |$ViewportServer|) . #1#)
                     (|sockGetInt| |$ViewportServer|)
                     (EXIT
                      (QSETVELT |viewport| 5
                                (VECTOR |theta_sf| |phi_sf| |scale_sf|
                                        |scaleX_sf| |scaleY_sf| |scaleZ_sf|
                                        |deltaX_sf| |deltaY_sf|)))))
                   (#2='T (QVELT |viewport| 5))))))
           (#2# (QVELT |viewport| 5)))))) 

(SDEFUN |VIEW3D;viewpoint;$RV;33|
        ((|viewport| $)
         (|viewpt| |Record| (|:| |theta| (|DoubleFloat|))
          (|:| |phi| (|DoubleFloat|)) (|:| |scale| (|DoubleFloat|))
          (|:| |scaleX| (|DoubleFloat|)) (|:| |scaleY| (|DoubleFloat|))
          (|:| |scaleZ| (|DoubleFloat|)) (|:| |deltaX| (|DoubleFloat|))
          (|:| |deltaY| (|DoubleFloat|)))
         ($ |Void|))
        (SPROG ((#1=#:G916 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 5 |viewpt|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                                   (QREFELT $ 105))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 118)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           6))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           7))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           2))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           3))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           4))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           5))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           0))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           1))
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|)))))))
                                |VIEW3D;viewpoint;$RV;33|)
                          (GO #2=#:G914)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;viewpoint;$5FV;34|
        ((|viewport| $) (|Theta| |Float|) (|Phi| |Float|) (|Scale| |Float|)
         (|DeltaX| |Float|) (|DeltaY| |Float|) ($ |Void|))
        (QSETVELT |viewport| 5
                  (VECTOR (SPADCALL |Theta| (QREFELT $ 17))
                          (SPADCALL |Phi| (QREFELT $ 17))
                          (SPADCALL |Scale| (QREFELT $ 17)) 1.0 1.0 1.0
                          (SPADCALL |DeltaX| (QREFELT $ 17))
                          (SPADCALL |DeltaY| (QREFELT $ 17))))) 

(SDEFUN |VIEW3D;viewpoint;$2I3FV;35|
        ((|viewport| $) (|Theta| |Integer|) (|Phi| |Integer|) (|Scale| |Float|)
         (|DeltaX| |Float|) (|DeltaY| |Float|) ($ |Void|))
        (QSETVELT |viewport| 5
                  (VECTOR
                   (|mul_DF| (FLOAT |Theta| MOST-POSITIVE-DOUBLE-FLOAT)
                             (QREFELT $ 15))
                   (|mul_DF| (FLOAT |Phi| MOST-POSITIVE-DOUBLE-FLOAT)
                             (QREFELT $ 15))
                   (SPADCALL |Scale| (QREFELT $ 17)) 1.0 1.0 1.0
                   (SPADCALL |DeltaX| (QREFELT $ 17))
                   (SPADCALL |DeltaY| (QREFELT $ 17))))) 

(SDEFUN |VIEW3D;viewpoint;$2FV;36|
        ((|viewport| $) (|Theta| |Float|) (|Phi| |Float|) ($ |Void|))
        (SEQ
         (QSETVELT (QVELT |viewport| 5) 0
                   (|mul_DF| (SPADCALL |Theta| (QREFELT $ 17)) (QREFELT $ 15)))
         (EXIT
          (QSETVELT (QVELT |viewport| 5) 1
                    (|mul_DF| (SPADCALL |Phi| (QREFELT $ 17))
                              (QREFELT $ 15)))))) 

(SDEFUN |VIEW3D;viewpoint;$3FV;37|
        ((|viewport| $) (X |Float|) (Y |Float|) (Z |Float|) ($ |Void|))
        (SPROG ((|Phi| #1=(|Float|)) (|Theta| #1#) (R (|Float|)))
               (SEQ
                (COND
                 ((SPADCALL X (|spadConstant| $ 9) (QREFELT $ 121))
                  (COND
                   ((SPADCALL Y (|spadConstant| $ 9) (QREFELT $ 121))
                    (SEQ
                     (LETT |Theta| (|spadConstant| $ 9)
                           . #2=(|VIEW3D;viewpoint;$3FV;37|))
                     (EXIT
                      (COND
                       ((SPADCALL Z (|spadConstant| $ 9) (QREFELT $ 122))
                        (LETT |Phi| (|spadConstant| $ 9) . #2#))
                       (#3='T
                        (LETT |Phi| (SPADCALL 180 0 10 (QREFELT $ 12))
                              . #2#))))))
                   (#3#
                    (SEQ
                     (LETT |Theta|
                           (SPADCALL
                            (SPADCALL Y
                                      (LETT R
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL X X (QREFELT $ 123))
                                              (SPADCALL Y Y (QREFELT $ 123))
                                              (QREFELT $ 124))
                                             (QREFELT $ 125))
                                            . #2#)
                                      (QREFELT $ 13))
                            (QREFELT $ 32))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL Z (|spadConstant| $ 9) (QREFELT $ 121))
                        (LETT |Phi| (SPADCALL 90 0 10 (QREFELT $ 12)) . #2#))
                       (#3#
                        (LETT |Phi|
                              (SPADCALL (SPADCALL Z R (QREFELT $ 13))
                                        (QREFELT $ 33))
                              . #2#))))))))
                 (#3#
                  (SEQ
                   (LETT |Theta|
                         (SPADCALL
                          (SPADCALL Y
                                    (LETT R
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL X X (QREFELT $ 123))
                                            (SPADCALL Y Y (QREFELT $ 123))
                                            (QREFELT $ 124))
                                           (QREFELT $ 125))
                                          . #2#)
                                    (QREFELT $ 13))
                          (QREFELT $ 32))
                         . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL Z (|spadConstant| $ 9) (QREFELT $ 121))
                      (LETT |Phi| (SPADCALL 90 0 10 (QREFELT $ 12)) . #2#))
                     (#3#
                      (LETT |Phi|
                            (SPADCALL (SPADCALL Z R (QREFELT $ 13))
                                      (QREFELT $ 33))
                            . #2#)))))))
                (EXIT
                 (SPADCALL |viewport|
                           (SPADCALL |Theta| (QREFELT $ 14) (QREFELT $ 123))
                           (SPADCALL |Phi| (QREFELT $ 14) (QREFELT $ 123))
                           (QREFELT $ 126)))))) 

(SDEFUN |VIEW3D;title;$SV;38| ((|viewport| $) (|Title| |String|) ($ |Void|))
        (SPROG ((#1=#:G933 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 2 |Title|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                                   (QREFELT $ 105))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 104)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendString| |$ViewportServer|
                                                           |Title|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|)))))))
                                |VIEW3D;title;$SV;38|)
                          (GO #2=#:G931)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;colorDef;$2CV;39|
        ((|viewport| $) (|HueOffset| |Color|) (|HueNumber| |Color|) ($ |Void|))
        (SPROG ((#1=#:G940 NIL) (|h| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT |viewport| 6
                            (CONS
                             (LETT |h| (SPADCALL |HueOffset| (QREFELT $ 130))
                                   . #2=(|VIEW3D;colorDef;$2CV;39|))
                             (- (SPADCALL |HueNumber| (QREFELT $ 130)) |h|)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 101)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (SPADCALL |HueOffset|
                                                              (QREFELT $ 130)))
                                     (|sockSendInt| |$ViewportServer|
                                                    (SPADCALL |HueNumber|
                                                              (QREFELT $ 130)))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #3=#:G938)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |VIEW3D;dimensions;$2Nni2PiV;40|
        ((|viewport| $) (|ViewX| |NonNegativeInteger|)
         (|ViewY| |NonNegativeInteger|) (|ViewWidth| |PositiveInteger|)
         (|ViewHeight| |PositiveInteger|) ($ |Void|))
        (SEQ (QSETVELT |viewport| 3 (CONS |ViewX| |ViewY|))
             (EXIT (QSETVELT |viewport| 4 (CONS |ViewWidth| |ViewHeight|))))) 

(SDEFUN |VIEW3D;move;$2NniV;41|
        ((|viewport| $) (|xLoc| |NonNegativeInteger|)
         (|yLoc| |NonNegativeInteger|) ($ |Void|))
        (SPROG ((#1=#:G951 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 3 (CONS |xLoc| |yLoc|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                                   (QREFELT $ 105))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 102)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xLoc|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |yLoc|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|)))))))
                                |VIEW3D;move;$2NniV;41|)
                          (GO #2=#:G949)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;resize;$2PiV;42|
        ((|viewport| $) (|xSize| |PositiveInteger|) (|ySize| |PositiveInteger|)
         ($ |Void|))
        (SPROG ((#1=#:G958 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 4 (CONS |xSize| |ySize|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                                   (QREFELT $ 105))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 103)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xSize|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |ySize|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|)))))))
                                |VIEW3D;resize;$2PiV;42|)
                          (GO #2=#:G956)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;coerce;$Of;43| ((|viewport| $) ($ |OutputForm|))
        (COND
         ((EQL (SPADCALL |viewport| (QREFELT $ 104)) 0)
          (SPADCALL
           (LIST "Closed or Undefined ThreeDimensionalViewport: "
                 (SPADCALL (QVELT |viewport| 2) (QREFELT $ 136)))
           (QREFELT $ 138)))
         ('T
          (SPADCALL
           (LIST "ThreeDimensionalViewport: "
                 (SPADCALL (QVELT |viewport| 2) (QREFELT $ 136)))
           (QREFELT $ 138))))) 

(PUT '|VIEW3D;key;$I;44| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 0))) 

(SDEFUN |VIEW3D;key;$I;44| ((|viewport| $) ($ |Integer|)) (QVELT |viewport| 0)) 

(SDEFUN |VIEW3D;rotate;$2IV;45|
        ((|viewport| $) (|Theta| |Integer|) (|Phi| |Integer|) ($ |Void|))
        (SPADCALL |viewport|
                  (SPADCALL (SPADCALL |Theta| (QREFELT $ 140)) (QREFELT $ 14)
                            (QREFELT $ 123))
                  (SPADCALL (SPADCALL |Phi| (QREFELT $ 140)) (QREFELT $ 14)
                            (QREFELT $ 123))
                  (QREFELT $ 126))) 

(SDEFUN |VIEW3D;rotate;$2FV;46|
        ((|viewport| $) (|Theta| |Float|) (|Phi| |Float|) ($ |Void|))
        (SPROG ((#1=#:G969 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 5) 0
                            (SPADCALL |Theta| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 5) 1
                            (SPADCALL |Phi| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 0)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 0))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 1))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;rotate;$2FV;46|)
                      (GO #2=#:G967)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;zoom;$FV;47| ((|viewport| $) (|Scale| |Float|) ($ |Void|))
        (SPROG ((#1=#:G975 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 5) 2
                            (SPADCALL |Scale| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 1)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 2))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;zoom;$FV;47|)
                      (GO #2=#:G973)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;zoom;$3FV;48|
        ((|viewport| $) (|ScaleX| |Float|) (|ScaleY| |Float|)
         (|ScaleZ| |Float|) ($ |Void|))
        (SPROG ((#1=#:G981 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 5) 3
                            (SPADCALL |ScaleX| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 5) 4
                            (SPADCALL |ScaleY| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 5) 5
                            (SPADCALL |ScaleZ| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 14)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 3))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 4))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 5))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;zoom;$3FV;48|)
                      (GO #2=#:G979)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;translate;$2FV;49|
        ((|viewport| $) (|DeltaX| |Float|) (|DeltaY| |Float|) ($ |Void|))
        (SPROG ((#1=#:G987 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 5) 6
                            (SPADCALL |DeltaX| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 5) 7
                            (SPADCALL |DeltaY| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 2)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 6))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 7))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;translate;$2FV;49|)
                      (GO #2=#:G985)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;intensity;$FV;50|
        ((|viewport| $) (|Amount| |Float|) ($ |Void|))
        (SPROG ((#1=#:G995 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR
                     (SPADCALL |Amount| (|spadConstant| $ 9) (QREFELT $ 145))
                     (SPADCALL |Amount| (|spadConstant| $ 26) (QREFELT $ 146)))
                    (|error|
                     "The intensity must be a value between 0 and 1, inclusively.")))
                  (QSETVELT (QVELT |viewport| 8) 5
                            (SPADCALL |Amount| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 109)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 8) 5))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;intensity;$FV;50|)
                      (GO #2=#:G993)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;write;$3S;51|
        ((|viewport| $) (|Filename| |String|) (|aThingToWrite| |String|)
         ($ |String|))
        (SPADCALL |viewport| |Filename| (LIST |aThingToWrite|) (QREFELT $ 149))) 

(SDEFUN |VIEW3D;write;$2S;52|
        ((|viewport| $) (|Filename| |String|) ($ |String|))
        (SPADCALL |viewport| |Filename| (SPADCALL (QREFELT $ 151))
                  (QREFELT $ 149))) 

(SDEFUN |VIEW3D;write;$SLS;53|
        ((|viewport| $) (|Filename| |String|)
         (|thingsToWrite| |List| (|String|)) ($ |String|))
        (SPROG
         ((#1=#:G1008 NIL) (|writeTypeInt| (|Integer|)) (#2=#:G1009 NIL)
          (|aTypeOfFile| NIL) (|m| (|Integer|)) (|avail| (|List| (|String|)))
          (|stringToSend| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |stringToSend| "" . #3=(|VIEW3D;write;$SLS;53|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                             (QREFELT $ 105))
                   (PROGN
                    (LETT #1#
                          (SEQ (|sockSendInt| |$ViewportServer| 1)
                               (|sockSendInt| |$ViewportServer| 110)
                               (EXIT
                                (COND
                                 ((|VIEW3D;checkViewport| |viewport| $)
                                  (SEQ
                                   (|sockSendString| |$ViewportServer|
                                                     |Filename|)
                                   (LETT |m|
                                         (SPADCALL
                                          (LETT |avail|
                                                (SPADCALL (QREFELT $ 153))
                                                . #3#)
                                          (QREFELT $ 154))
                                         . #3#)
                                   (SEQ (LETT |aTypeOfFile| NIL . #3#)
                                        (LETT #2# |thingsToWrite| . #3#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |aTypeOfFile| (CAR #2#)
                                                     . #3#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |writeTypeInt|
                                               (-
                                                (SPADCALL
                                                 (SPADCALL |aTypeOfFile|
                                                           (QREFELT $ 155))
                                                 |avail| (QREFELT $ 156))
                                                |m|)
                                               . #3#)
                                         (EXIT
                                          (COND
                                           ((< |writeTypeInt| 0)
                                            (|sayBrightly|
                                             (LIST "  > "
                                                   (SPADCALL
                                                    (STRCONC |aTypeOfFile|
                                                             " is not a valid file type for writing a 3D viewport")
                                                    (QREFELT $ 136)))))
                                           ('T
                                            (|sockSendInt| |$ViewportServer|
                                                           (+ |writeTypeInt|
                                                              1))))))
                                        (LETT #2# (CDR #2#) . #3#) (GO G190)
                                        G191 (EXIT NIL))
                                   (|sockSendInt| |$ViewportServer| 0)
                                   (|sockGetInt| |$ViewportServer|)
                                   (EXIT |Filename|))))))
                          . #3#)
                    (GO #4=#:G1006)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |VIEW3D;perspective;$SV;54|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G1015 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 9) 0 1))
                   ('T (QSETVELT (QVELT |viewport| 9) 0 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 27)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 9)
                                                           0))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;perspective;$SV;54|)
                      (GO #2=#:G1013)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;showRegion;$SV;55|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G1021 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 5 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 5 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 12)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           5))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;showRegion;$SV;55|)
                      (GO #2=#:G1019)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;showClipRegion;$SV;56|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G1027 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 10) 6 1))
                   ('T (QSETVELT (QVELT |viewport| 10) 6 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 66)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT
                                                     (QVELT |viewport| 10) 6))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;showClipRegion;$SV;56|)
                      (GO #2=#:G1025)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;clipSurface;$SV;57|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G1033 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 10) 7 1))
                   ('T (QSETVELT (QVELT |viewport| 10) 7 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 67)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT
                                                     (QVELT |viewport| 10) 7))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;clipSurface;$SV;57|)
                      (GO #2=#:G1031)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;eyeDistance;$FV;58|
        ((|viewport| $) (|EyeDistance| |Float|) ($ |Void|))
        (SPROG ((#1=#:G1039 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 9) 1
                            (SPADCALL |EyeDistance| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 111)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 9) 1))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;eyeDistance;$FV;58|)
                      (GO #2=#:G1037)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;hitherPlane;$FV;59|
        ((|viewport| $) (|HitherPlane| |Float|) ($ |Void|))
        (SPROG ((#1=#:G1045 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 9) 2
                            (SPADCALL |HitherPlane| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                               (QREFELT $ 105))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 116)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 9) 2))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW3D;hitherPlane;$FV;59|)
                      (GO #2=#:G1043)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;modifyPointData;$NniPV;60|
        ((|viewport| $) (|anIndex| |NonNegativeInteger|)
         (|aPoint| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPROG ((#1=#:G1052 NIL) (|n| (|PositiveInteger|)))
               (SEQ
                (LETT |n| (SPADCALL |aPoint| (QREFELT $ 78))
                      . #2=(|VIEW3D;modifyPointData;$NniPV;60|))
                (EXIT
                 (COND
                  ((< |n| 3)
                   (|error| "The point should have dimension of at least 3"))
                  (#3='T
                   (SEQ
                    (EXIT
                     (SEQ
                      (QSETVELT |viewport| 11
                                (SPADCALL (QVELT |viewport| 11) |anIndex|
                                          |aPoint| (QREFELT $ 163)))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 104)) 0
                                   (QREFELT $ 105))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 114)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |anIndex|)
                                         (|sockSendFloat| |$ViewportServer|
                                                          (SPADCALL |aPoint|
                                                                    (QREFELT $
                                                                             84)))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (SPADCALL |aPoint|
                                                                    (QREFELT $
                                                                             85)))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (SPADCALL |aPoint|
                                                                    (QREFELT $
                                                                             86)))
                                         (COND
                                          ((EQL |n| 3)
                                           (|sockSendFloat| |$ViewportServer|
                                                            (SPADCALL
                                                             (SPADCALL 5 -1 10
                                                                       (QREFELT
                                                                        $ 12))
                                                             (QREFELT $ 17))))
                                          (#3#
                                           (|sockSendFloat| |$ViewportServer|
                                                            (SPADCALL |aPoint|
                                                                      (QREFELT
                                                                       $
                                                                       87)))))
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|)))))))
                                . #2#)
                          (GO #4=#:G1049)))))))
                    #4# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |ThreeDimensionalViewport;|)) 

(DEFUN |ThreeDimensionalViewport| ()
  (SPROG NIL
         (PROG (#1=#:G1054)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ThreeDimensionalViewport|)
                    . #2=(|ThreeDimensionalViewport|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ThreeDimensionalViewport|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|ThreeDimensionalViewport;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ThreeDimensionalViewport|)))))))))) 

(DEFUN |ThreeDimensionalViewport;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ThreeDimensionalViewport|)
                . #1=(|ThreeDimensionalViewport|))
          (LETT $ (GETREFV 167) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ThreeDimensionalViewport| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |key| (|Integer|)) (|:| |fun| (|Integer|))
                              (|:| |title| (|String|))
                              (|:| |moveTo|
                                   (|Record| (|:| X (|NonNegativeInteger|))
                                             (|:| Y (|NonNegativeInteger|))))
                              (|:| |size|
                                   (|Record| (|:| X (|PositiveInteger|))
                                             (|:| Y (|PositiveInteger|))))
                              (|:| |viewpoint|
                                   (|Record| (|:| |theta| (|DoubleFloat|))
                                             (|:| |phi| (|DoubleFloat|))
                                             (|:| |scale| (|DoubleFloat|))
                                             (|:| |scaleX| (|DoubleFloat|))
                                             (|:| |scaleY| (|DoubleFloat|))
                                             (|:| |scaleZ| (|DoubleFloat|))
                                             (|:| |deltaX| (|DoubleFloat|))
                                             (|:| |deltaY| (|DoubleFloat|))))
                              (|:| |colors|
                                   (|Record| (|:| |hueOffset| (|Integer|))
                                             (|:| |hueNumber| (|Integer|))))
                              (|:| |flags|
                                   (|Record| (|:| |showCP| (|Integer|))
                                             (|:| |style| (|Integer|))
                                             (|:| |axesOn| (|Integer|))
                                             (|:| |diagonalsOn| (|Integer|))
                                             (|:| |outlineRenderOn|
                                                  (|Integer|))
                                             (|:| |showRegionField|
                                                  (|Integer|))))
                              (|:| |lighting|
                                   (|Record| (|:| |lightX| (|DoubleFloat|))
                                             (|:| |lightY| (|DoubleFloat|))
                                             (|:| |lightZ| (|DoubleFloat|))
                                             (|:| |lightTheta| (|DoubleFloat|))
                                             (|:| |lightPhi| (|DoubleFloat|))
                                             (|:| |translucence|
                                                  (|DoubleFloat|))))
                              (|:| |perspective|
                                   (|Record|
                                    (|:| |perspectiveField| (|Integer|))
                                    (|:| |eyeDistance| (|DoubleFloat|))
                                    (|:| |hitherPlane| (|DoubleFloat|))))
                              (|:| |volume|
                                   (|Record| (|:| |clipXMin| (|DoubleFloat|))
                                             (|:| |clipXMax| (|DoubleFloat|))
                                             (|:| |clipYMin| (|DoubleFloat|))
                                             (|:| |clipYMax| (|DoubleFloat|))
                                             (|:| |clipZMin| (|DoubleFloat|))
                                             (|:| |clipZMax| (|DoubleFloat|))
                                             (|:| |clipRegionField|
                                                  (|Integer|))
                                             (|:| |clipSurfaceField|
                                                  (|Integer|))))
                              (|:| |space3D| (|ThreeSpace| (|DoubleFloat|)))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          (QSETREFV $ 14
                    (SPADCALL (SPADCALL (QREFELT $ 8))
                              (SPADCALL 180 0 10 (QREFELT $ 12))
                              (QREFELT $ 13)))
          (QSETREFV $ 15
                    (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 180))
          (QSETREFV $ 20
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 8))
                                (SPADCALL 4 0 10 (QREFELT $ 12))
                                (QREFELT $ 13))
                      (QREFELT $ 17))
                     (QREFELT $ 19)))
          (QSETREFV $ 22
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 8))
                                 (SPADCALL 4 0 10 (QREFELT $ 12))
                                 (QREFELT $ 13))
                       (QREFELT $ 21))
                      (QREFELT $ 17))
                     (QREFELT $ 19)))
          (QSETREFV $ 23
                    (SPADCALL
                     (SPADCALL (SPADCALL 12 -1 10 (QREFELT $ 12))
                               (QREFELT $ 17))
                     (QREFELT $ 19)))
          (QSETREFV $ 24 (SPADCALL 0.0 (QREFELT $ 19)))
          (QSETREFV $ 25 (SPADCALL 0.0 (QREFELT $ 19)))
          $))) 

(MAKEPROP '|ThreeDimensionalViewport| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Float|) (0 . |pi|) (4 . |Zero|)
              (|Integer|) (|PositiveInteger|) (8 . |float|) (15 . /) '|degrees|
              '|degreesSF| (|DoubleFloat|) (21 . |convert|) (|Reference| 16)
              (26 . |ref|) '|defaultTheta| (31 . -) '|defaultPhi|
              '|defaultZoom| '|defaultDeltaX| '|defaultDeltaY| (36 . |One|)
              (|Boolean|) (40 . >=) (46 . <=) (52 . *) (58 . |convert|)
              (63 . |asin|) (68 . |atan|) (|String|) (|List| 58)
              (|DrawOptionFunctions0|) (73 . |title|) (79 . |style|)
              (85 . |deref|)
              (|Record| (|:| |theta| 16) (|:| |phi| 16) (|:| |scale| 16)
                        (|:| |scaleX| 16) (|:| |scaleY| 16) (|:| |scaleZ| 16)
                        (|:| |deltaX| 16) (|:| |deltaY| 16))
              (90 . |viewpoint|) (|List| 45) (|ViewDefaultsPackage|)
              (96 . |viewPosDefault|) (|NonNegativeInteger|) (100 . |elt|)
              (|List| 11) (106 . |viewSizeDefault|) (110 . |elt|)
              (|ThreeSpace| 16) (116 . |create3Space|) |VIEW3D;viewport3D;$;5|
              |VIEW3D;subspace;$Ts;6| |VIEW3D;subspace;$Ts$;7|
              |VIEW3D;options;$L;8| |VIEW3D;options;$L$;9|
              |VIEW3D;makeViewport3D;2$;10| (|DrawOption|) (120 . |title|)
              |VIEW3D;makeViewport3D;TsS$;11| |VIEW3D;makeViewport3D;TsL$;12|
              (|Point| 16) (|CoordinateSystems| 16) (125 . |cartesian|)
              (|Mapping| 62 62) (130 . |coord|) (136 . |check|) (|List| 62)
              (141 . |lp|) (|List| (|List| 42)) (146 . |lllip|) (|List| 74)
              (151 . |llprop|) (|List| 88) (156 . |lprop|) (|Set| 11)
              (161 . |brace|) (165 . |dimension|) (170 . |insert!|) (176 . |#|)
              (181 . >) (187 . |parts|) (|PointPackage| 16) (192 . |xCoord|)
              (197 . |yCoord|) (202 . |zCoord|) (207 . |color|)
              (|SubSpaceComponentProperty|) (212 . |closed?|) (217 . |solid?|)
              (222 . |#|) (227 . |elt|) |VIEW3D;viewThetaDefault;F;14|
              (232 . |setelt!|) |VIEW3D;viewThetaDefault;2F;15|
              |VIEW3D;viewPhiDefault;F;16| |VIEW3D;viewPhiDefault;2F;17|
              |VIEW3D;viewZoomDefault;F;18| |VIEW3D;viewZoomDefault;2F;19|
              |VIEW3D;viewDeltaXDefault;F;20| |VIEW3D;viewDeltaXDefault;2F;21|
              |VIEW3D;viewDeltaYDefault;F;22| |VIEW3D;viewDeltaYDefault;2F;23|
              |VIEW3D;key;$I;44| (238 . ~=) (|Void|) |VIEW3D;lighting;$3FV;24|
              |VIEW3D;axes;$SV;25| |VIEW3D;diagonals;$SV;26|
              |VIEW3D;outlineRender;$SV;27| |VIEW3D;controlPanel;$SV;28|
              |VIEW3D;drawStyle;$SV;29| (244 . |void|) |VIEW3D;reset;$V;30|
              |VIEW3D;close;$V;31| |VIEW3D;viewpoint;$R;32|
              |VIEW3D;viewpoint;$RV;33| |VIEW3D;viewpoint;$5FV;34|
              |VIEW3D;viewpoint;$2I3FV;35| |VIEW3D;viewpoint;$2FV;36| (248 . =)
              (254 . >=) (260 . *) (266 . +) (272 . |sqrt|)
              |VIEW3D;rotate;$2FV;46| |VIEW3D;viewpoint;$3FV;37|
              |VIEW3D;title;$SV;38| (|Color|) (277 . |hue|)
              |VIEW3D;colorDef;$2CV;39| |VIEW3D;dimensions;$2Nni2PiV;40|
              |VIEW3D;move;$2NniV;41| |VIEW3D;resize;$2PiV;42| (|OutputForm|)
              (282 . |coerce|) (|List| $) (287 . |hconcat|)
              |VIEW3D;coerce;$Of;43| (292 . |coerce|) |VIEW3D;rotate;$2IV;45|
              |VIEW3D;zoom;$FV;47| |VIEW3D;zoom;$3FV;48|
              |VIEW3D;translate;$2FV;49| (297 . <) (303 . >)
              |VIEW3D;intensity;$FV;50| (|List| 34) |VIEW3D;write;$SLS;53|
              |VIEW3D;write;$3S;51| (309 . |viewWriteDefault|)
              |VIEW3D;write;$2S;52| (313 . |viewWriteAvailable|)
              (317 . |minIndex|) (322 . |upperCase|) (327 . |position|)
              |VIEW3D;perspective;$SV;54| |VIEW3D;showRegion;$SV;55|
              |VIEW3D;showClipRegion;$SV;56| |VIEW3D;clipSurface;$SV;57|
              |VIEW3D;eyeDistance;$FV;58| |VIEW3D;hitherPlane;$FV;59|
              (333 . |modifyPointData|) |VIEW3D;modifyPointData;$NniPV;60|
              (|HashState|) (|SingleInteger|))
           '#(~= 340 |zoom| 346 |write| 360 |viewport3D| 380 |viewpoint| 384
              |viewZoomDefault| 430 |viewThetaDefault| 439 |viewPhiDefault| 448
              |viewDeltaYDefault| 457 |viewDeltaXDefault| 466 |translate| 475
              |title| 482 |subspace| 488 |showRegion| 499 |showClipRegion| 505
              |rotate| 511 |resize| 525 |reset| 532 |perspective| 537
              |outlineRender| 543 |options| 549 |move| 560 |modifyPointData|
              567 |makeViewport3D| 574 |lighting| 591 |latex| 599 |key| 604
              |intensity| 609 |hitherPlane| 615 |hashUpdate!| 621 |hash| 627
              |eyeDistance| 632 |drawStyle| 638 |dimensions| 644 |diagonals|
              653 |controlPanel| 659 |colorDef| 665 |coerce| 672 |close| 677
              |clipSurface| 682 |axes| 688 = 694)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 135))
                        (|makeByteWordVec2| 166
                                            '(0 7 0 8 0 7 0 9 3 7 0 10 10 11 12
                                              2 7 0 0 0 13 1 7 16 0 17 1 18 0
                                              16 19 1 7 0 0 21 0 7 0 26 2 16 27
                                              0 0 28 2 16 27 0 0 29 2 16 0 11 0
                                              30 1 7 0 16 31 1 7 0 0 32 1 7 0 0
                                              33 2 36 34 35 34 37 2 36 34 35 34
                                              38 1 18 16 0 39 2 36 40 35 40 41
                                              0 43 42 44 2 42 45 0 10 46 0 43
                                              47 48 2 47 11 0 10 49 0 50 0 51 1
                                              58 0 34 59 1 63 62 62 64 2 36 65
                                              35 65 66 1 50 0 0 67 1 50 68 0 69
                                              1 50 70 0 71 1 50 72 0 73 1 50 74
                                              0 75 0 76 0 77 1 62 11 0 78 2 76
                                              0 11 0 79 1 76 45 0 80 2 45 27 0
                                              0 81 1 76 47 0 82 1 83 16 62 84 1
                                              83 16 62 85 1 83 16 62 86 1 83 16
                                              62 87 1 88 27 0 89 1 88 27 0 90 1
                                              42 45 0 91 1 18 16 0 92 2 18 16 0
                                              16 94 2 10 27 0 0 105 0 106 0 113
                                              2 7 27 0 0 121 2 7 27 0 0 122 2 7
                                              0 0 0 123 2 7 0 0 0 124 1 7 0 0
                                              125 1 129 10 0 130 1 34 135 0 136
                                              1 135 0 137 138 1 7 0 10 140 2 7
                                              27 0 0 145 2 7 27 0 0 146 0 43
                                              148 151 0 43 148 153 1 148 10 0
                                              154 1 34 0 0 155 2 148 10 34 0
                                              156 3 50 0 0 45 62 163 2 0 27 0 0
                                              1 2 0 106 0 7 142 4 0 106 0 7 7 7
                                              143 3 0 34 0 34 148 149 2 0 34 0
                                              34 152 3 0 34 0 34 34 150 0 0 0
                                              52 4 0 106 0 7 7 7 127 6 0 106 0
                                              10 10 7 7 7 119 3 0 106 0 7 7 120
                                              1 0 40 0 116 2 0 106 0 40 117 6 0
                                              106 0 7 7 7 7 7 118 0 0 7 98 1 0
                                              7 7 99 0 0 7 93 1 0 7 7 95 0 0 7
                                              96 1 0 7 7 97 1 0 7 7 103 0 0 7
                                              102 0 0 7 100 1 0 7 7 101 3 0 106
                                              0 7 7 144 2 0 106 0 34 128 2 0 0
                                              0 50 54 1 0 50 0 53 2 0 106 0 34
                                              158 2 0 106 0 34 159 3 0 106 0 7
                                              7 126 3 0 106 0 10 10 141 3 0 106
                                              0 11 11 134 1 0 106 0 114 2 0 106
                                              0 34 157 2 0 106 0 34 110 1 0 35
                                              0 55 2 0 0 0 35 56 3 0 106 0 45
                                              45 133 3 0 106 0 45 62 164 2 0 0
                                              50 35 61 1 0 0 0 57 2 0 0 50 34
                                              60 4 0 106 0 7 7 7 107 1 0 34 0 1
                                              1 0 10 0 104 2 0 106 0 7 147 2 0
                                              106 0 7 162 2 0 165 165 0 1 1 0
                                              166 0 1 2 0 106 0 7 161 2 0 106 0
                                              34 112 5 0 106 0 45 45 11 11 132
                                              2 0 106 0 34 109 2 0 106 0 34 111
                                              3 0 106 0 129 129 131 1 0 135 0
                                              139 1 0 106 0 115 2 0 106 0 34
                                              160 2 0 106 0 34 108 2 0 27 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ThreeDimensionalViewport| 'NILADIC T) 
