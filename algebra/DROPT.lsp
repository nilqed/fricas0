
(PUT '|DROPT;length| '|SPADreplace| 'LENGTH) 

(SDEFUN |DROPT;length|
        ((|tup| |List| (|Segment| (|Float|))) ($ |NonNegativeInteger|))
        (LENGTH |tup|)) 

(PUT '|DROPT;lengthR| '|SPADreplace| 'LENGTH) 

(SDEFUN |DROPT;lengthR|
        ((|tup| |List| (|Segment| (|Fraction| (|Integer|))))
         ($ |NonNegativeInteger|))
        (LENGTH |tup|)) 

(PUT '|DROPT;lengthI| '|SPADreplace| 'LENGTH) 

(SDEFUN |DROPT;lengthI| ((|tup| |List| (|Integer|)) ($ |NonNegativeInteger|))
        (LENGTH |tup|)) 

(SDEFUN |DROPT;viewpoint;R$;4|
        ((|vp| |Record| (|:| |theta| (|DoubleFloat|))
          (|:| |phi| (|DoubleFloat|)) (|:| |scale| (|DoubleFloat|))
          (|:| |scaleX| (|DoubleFloat|)) (|:| |scaleY| (|DoubleFloat|))
          (|:| |scaleZ| (|DoubleFloat|)) (|:| |deltaX| (|DoubleFloat|))
          (|:| |deltaY| (|DoubleFloat|)))
         ($ $))
        (CONS '|viewpoint| (SPADCALL |vp| (QREFELT $ 10)))) 

(SDEFUN |DROPT;title;S$;5| ((|s| |String|) ($ $))
        (CONS '|title| (SPADCALL |s| (QREFELT $ 14)))) 

(SDEFUN |DROPT;style;S$;6| ((|s| |String|) ($ $))
        (CONS '|style| (SPADCALL |s| (QREFELT $ 14)))) 

(SDEFUN |DROPT;toScale;B$;7| ((|b| |Boolean|) ($ $))
        (CONS '|toScale| (SPADCALL |b| (QREFELT $ 19)))) 

(SDEFUN |DROPT;clip;B$;8| ((|b| |Boolean|) ($ $))
        (CONS '|clipBoolean| (SPADCALL |b| (QREFELT $ 19)))) 

(SDEFUN |DROPT;adaptive;B$;9| ((|b| |Boolean|) ($ $))
        (CONS '|adaptive| (SPADCALL |b| (QREFELT $ 19)))) 

(SDEFUN |DROPT;pointColor;F$;10| ((|x| |Float|) ($ $))
        (CONS '|pointColorFloat| (SPADCALL |x| (QREFELT $ 25)))) 

(SDEFUN |DROPT;pointColor;P$;11| ((|c| |Palette|) ($ $))
        (CONS '|pointColorPalette| (SPADCALL |c| (QREFELT $ 29)))) 

(SDEFUN |DROPT;curveColor;F$;12| ((|x| |Float|) ($ $))
        (CONS '|curveColorFloat| (SPADCALL |x| (QREFELT $ 25)))) 

(SDEFUN |DROPT;curveColor;P$;13| ((|c| |Palette|) ($ $))
        (CONS '|curveColorPalette| (SPADCALL |c| (QREFELT $ 29)))) 

(SDEFUN |DROPT;colorFunction;M$;14|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) ($ $))
        (CONS '|colorFunction1| (SPADCALL |f| (QREFELT $ 35)))) 

(SDEFUN |DROPT;colorFunction;M$;15|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)) ($ $))
        (CONS '|colorFunction2| (SPADCALL |f| (QREFELT $ 39)))) 

(SDEFUN |DROPT;colorFunction;M$;16|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
          (|DoubleFloat|))
         ($ $))
        (CONS '|colorFunction3| (SPADCALL |f| (QREFELT $ 43)))) 

(SDEFUN |DROPT;clip;L$;17| ((|tup| |List| (|Segment| (|Float|))) ($ $))
        (COND
         ((SPADCALL (|DROPT;length| |tup| $) 3 (QREFELT $ 46))
          (|error| "clip: at most 3 segments may be specified"))
         ('T (CONS '|clipSegment| (SPADCALL |tup| (QREFELT $ 49)))))) 

(SDEFUN |DROPT;coordinates;M$;18|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))
         ($ $))
        (CONS '|coordinates| (SPADCALL |f| (QREFELT $ 53)))) 

(SDEFUN |DROPT;tubeRadius;F$;19| ((|x| |Float|) ($ $))
        (CONS '|tubeRadius| (SPADCALL |x| (QREFELT $ 25)))) 

(SDEFUN |DROPT;range;L$;20| ((|tup| |List| (|Segment| (|Float|))) ($ $))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (|DROPT;length| |tup| $) |DROPT;range;L$;20|)
                    (EXIT
                     (COND
                      ((SPADCALL |n| 3 (QREFELT $ 46))
                       (|error| "range: at most 3 segments may be specified"))
                      ((< |n| 2)
                       (|error| "range: at least 2 segments may be specified"))
                      ('T
                       (CONS '|rangeFloat|
                             (SPADCALL |tup| (QREFELT $ 49))))))))) 

(SDEFUN |DROPT;range;L$;21|
        ((|tup| |List| (|Segment| (|Fraction| (|Integer|)))) ($ $))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (|DROPT;lengthR| |tup| $) |DROPT;range;L$;21|)
                    (EXIT
                     (COND
                      ((SPADCALL |n| 3 (QREFELT $ 46))
                       (|error| "range: at most 3 segments may be specified"))
                      ((< |n| 2)
                       (|error| "range: at least 2 segments may be specified"))
                      ('T
                       (CONS '|rangeRat| (SPADCALL |tup| (QREFELT $ 59))))))))) 

(SDEFUN |DROPT;ranges;L$;22| ((|s| |List| (|Segment| (|Float|))) ($ $))
        (CONS '|ranges| (SPADCALL |s| (QREFELT $ 49)))) 

(SDEFUN |DROPT;space;Ts$;23| ((|s| |ThreeSpace| (|DoubleFloat|)) ($ $))
        (CONS '|space| (SPADCALL |s| (QREFELT $ 64)))) 

(SDEFUN |DROPT;var1Steps;Pi$;24| ((|s| |PositiveInteger|) ($ $))
        (CONS '|var1Steps| (SPADCALL |s| (QREFELT $ 68)))) 

(SDEFUN |DROPT;var2Steps;Pi$;25| ((|s| |PositiveInteger|) ($ $))
        (CONS '|var2Steps| (SPADCALL |s| (QREFELT $ 68)))) 

(SDEFUN |DROPT;tubePoints;Pi$;26| ((|s| |PositiveInteger|) ($ $))
        (CONS '|tubePoints| (SPADCALL |s| (QREFELT $ 68)))) 

(SDEFUN |DROPT;coord;M$;27|
        ((|s| |Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))
         ($ $))
        (CONS '|coord| (SPADCALL |s| (QREFELT $ 53)))) 

(SDEFUN |DROPT;unit;L$;28| ((|s| |List| (|Float|)) ($ $))
        (CONS '|unit| (SPADCALL |s| (QREFELT $ 75)))) 

(SDEFUN |DROPT;coerce;$Of;29| ((|x| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 79))
                  (SPADCALL (QCDR |x|) (QREFELT $ 80)) (QREFELT $ 81))) 

(SDEFUN |DROPT;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((EQUAL (QCAR |x|) (QCAR |y|))
          (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 83)))
         ('T NIL))) 

(SDEFUN |DROPT;option?;LSB;31| ((|l| |List| $) (|s| |Symbol|) ($ |Boolean|))
        (SPROG ((#1=#:G770 NIL) (#2=#:G771 NIL) (#3=#:G772 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |x| NIL . #4=(|DROPT;option?;LSB;31|))
                         (LETT #3# |l| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQUAL (QCAR |x|) |s|)
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# 'T . #4#) (GO #5=#:G769))
                                    . #4#)
                              (GO #6=#:G767))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |DROPT;option;LSU;32|
        ((|l| |List| $) (|s| |Symbol|) ($ |Union| (|Any|) "failed"))
        (SPROG ((#1=#:G784 NIL) (#2=#:G785 NIL) (#3=#:G786 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |x| NIL . #4=(|DROPT;option;LSU;32|))
                         (LETT #3# |l| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQUAL (QCAR |x|) |s|)
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (CONS 0 (QCDR |x|)) . #4#)
                                     (GO #5=#:G783))
                                    . #4#)
                              (GO #6=#:G778))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (CONS 1 "failed"))))
                #5# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |DrawOption;|)) 

(DEFUN |DrawOption| ()
  (SPROG NIL
         (PROG (#1=#:G788)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DrawOption|)
                    . #2=(|DrawOption|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DrawOption|
                             (LIST (CONS NIL (CONS 1 (|DrawOption;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|DrawOption|)))))))))) 

(DEFUN |DrawOption;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DrawOption|) . #1=(|DrawOption|))
          (LETT $ (GETREFV 91) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DrawOption| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |keyword| (|Symbol|))
                              (|:| |value| (|Any|))))
          $))) 

(MAKEPROP '|DrawOption| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Any|)
              (|Record| (|:| |theta| (|DoubleFloat|))
                        (|:| |phi| (|DoubleFloat|))
                        (|:| |scale| (|DoubleFloat|))
                        (|:| |scaleX| (|DoubleFloat|))
                        (|:| |scaleY| (|DoubleFloat|))
                        (|:| |scaleZ| (|DoubleFloat|))
                        (|:| |deltaX| (|DoubleFloat|))
                        (|:| |deltaY| (|DoubleFloat|)))
              (|AnyFunctions1| 8) (0 . |coerce|) |DROPT;viewpoint;R$;4|
              (|String|) (|AnyFunctions1| 12) (5 . |coerce|) |DROPT;title;S$;5|
              |DROPT;style;S$;6| (|Boolean|) (|AnyFunctions1| 17)
              (10 . |coerce|) |DROPT;toScale;B$;7| |DROPT;clip;B$;8|
              |DROPT;adaptive;B$;9| (|Float|) (|AnyFunctions1| 23)
              (15 . |coerce|) |DROPT;pointColor;F$;10| (|Palette|)
              (|AnyFunctions1| 27) (20 . |coerce|) |DROPT;pointColor;P$;11|
              |DROPT;curveColor;F$;12| |DROPT;curveColor;P$;13|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|AnyFunctions1| 33)
              (25 . |coerce|) |DROPT;colorFunction;M$;14|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
              (|AnyFunctions1| 37) (30 . |coerce|) |DROPT;colorFunction;M$;15|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
                         (|DoubleFloat|))
              (|AnyFunctions1| 41) (35 . |coerce|) |DROPT;colorFunction;M$;16|
              (|NonNegativeInteger|) (40 . >) (|List| (|Segment| 23))
              (|AnyFunctions1| 47) (46 . |coerce|) |DROPT;clip;L$;17|
              (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))
              (|AnyFunctions1| 51) (51 . |coerce|) |DROPT;coordinates;M$;18|
              |DROPT;tubeRadius;F$;19| |DROPT;range;L$;20|
              (|List| (|Segment| (|Fraction| (|Integer|))))
              (|AnyFunctions1| 57) (56 . |coerce|) |DROPT;range;L$;21|
              |DROPT;ranges;L$;22| (|ThreeSpace| (|DoubleFloat|))
              (|AnyFunctions1| 62) (61 . |coerce|) |DROPT;space;Ts$;23|
              (|PositiveInteger|) (|AnyFunctions1| 66) (66 . |coerce|)
              |DROPT;var1Steps;Pi$;24| |DROPT;var2Steps;Pi$;25|
              |DROPT;tubePoints;Pi$;26| |DROPT;coord;M$;27| (|List| 23)
              (|AnyFunctions1| 73) (71 . |coerce|) |DROPT;unit;L$;28|
              (|OutputForm|) (|Symbol|) (76 . |coerce|) (81 . |coerce|)
              (86 . =) |DROPT;coerce;$Of;29| (92 . =) |DROPT;=;2$B;30|
              (|List| $) |DROPT;option?;LSB;31| (|Union| 7 '"failed")
              |DROPT;option;LSU;32| (|SingleInteger|) (|HashState|))
           '#(~= 98 |viewpoint| 104 |var2Steps| 109 |var1Steps| 114 |unit| 119
              |tubeRadius| 124 |tubePoints| 129 |toScale| 134 |title| 139
              |style| 144 |space| 149 |ranges| 154 |range| 159 |pointColor| 169
              |option?| 179 |option| 185 |latex| 191 |hashUpdate!| 196 |hash|
              202 |curveColor| 207 |coordinates| 217 |coord| 222
              |colorFunction| 227 |coerce| 242 |clip| 247 |adaptive| 257 = 262)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 77))
                        (|makeByteWordVec2| 90
                                            '(1 9 7 8 10 1 13 7 12 14 1 18 7 17
                                              19 1 24 7 23 25 1 28 7 27 29 1 34
                                              7 33 35 1 38 7 37 39 1 42 7 41 43
                                              2 45 17 0 0 46 1 48 7 47 49 1 52
                                              7 51 53 1 58 7 57 59 1 63 7 62 64
                                              1 67 7 66 68 1 74 7 73 75 1 78 77
                                              0 79 1 7 77 0 80 2 77 0 0 0 81 2
                                              7 17 0 0 83 2 0 17 0 0 1 1 0 0 8
                                              11 1 0 0 66 70 1 0 0 66 69 1 0 0
                                              73 76 1 0 0 23 55 1 0 0 66 71 1 0
                                              0 17 20 1 0 0 12 15 1 0 0 12 16 1
                                              0 0 62 65 1 0 0 47 61 1 0 0 57 60
                                              1 0 0 47 56 1 0 0 27 30 1 0 0 23
                                              26 2 0 17 85 78 86 2 0 87 85 78
                                              88 1 0 12 0 1 2 0 90 90 0 1 1 0
                                              89 0 1 1 0 0 27 32 1 0 0 23 31 1
                                              0 0 51 54 1 0 0 51 72 1 0 0 37 40
                                              1 0 0 41 44 1 0 0 33 36 1 0 77 0
                                              82 1 0 0 47 50 1 0 0 17 21 1 0 0
                                              17 22 2 0 17 0 0 84)))))
           '|lookupComplete|)) 

(MAKEPROP '|DrawOption| 'NILADIC T) 
