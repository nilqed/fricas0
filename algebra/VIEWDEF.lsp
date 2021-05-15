
(SDEFUN |VIEWDEF;viewPosDefault;L;1| (($ |List| (|NonNegativeInteger|)))
        (LIST (SPADCALL (QREFELT $ 27) (QREFELT $ 50))
              (SPADCALL (QREFELT $ 28) (QREFELT $ 50)))) 

(SDEFUN |VIEWDEF;viewPosDefault;2L;2|
        ((|l| |List| (|NonNegativeInteger|)) ($ |List| (|NonNegativeInteger|)))
        (COND
         ((< (SPADCALL |l| (QREFELT $ 53)) 2)
          (|error| "viewPosDefault expects a list with two elements"))
         ('T
          (LIST (SPADCALL (QREFELT $ 27) (|SPADfirst| |l|) (QREFELT $ 54))
                (SPADCALL (QREFELT $ 28) (SPADCALL |l| (QREFELT $ 55))
                          (QREFELT $ 54)))))) 

(SDEFUN |VIEWDEF;viewSizeDefault;L;3| (($ |List| (|PositiveInteger|)))
        (LIST (SPADCALL (QREFELT $ 29) (QREFELT $ 57))
              (SPADCALL (QREFELT $ 30) (QREFELT $ 57)))) 

(SDEFUN |VIEWDEF;viewSizeDefault;2L;4|
        ((|l| |List| (|PositiveInteger|)) ($ |List| (|PositiveInteger|)))
        (COND
         ((< (LENGTH |l|) 2)
          (|error| "viewSizeDefault expects a list with two elements"))
         ('T
          (LIST (SPADCALL (QREFELT $ 29) (|SPADfirst| |l|) (QREFELT $ 60))
                (SPADCALL (QREFELT $ 30) (SPADCALL |l| (QREFELT $ 61))
                          (QREFELT $ 60)))))) 

(SDEFUN |VIEWDEF;viewDefaults;V;5| (($ |Void|))
        (SEQ
         (SETELT $ 12
                 (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 7)) (QREFELT $ 9))
                           (QREFELT $ 11)))
         (SETELT $ 15
                 (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 13)) (QREFELT $ 14))
                           (QREFELT $ 11)))
         (SETELT $ 17
                 (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 7)) (QREFELT $ 16))
                           (QREFELT $ 11)))
         (SETELT $ 19
                 (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 18)) (QREFELT $ 16))
                           (QREFELT $ 11)))
         (SETELT $ 23 (SPADCALL 3 (QREFELT $ 22)))
         (SETELT $ 27 (SPADCALL 0 (QREFELT $ 26)))
         (SETELT $ 28 (SPADCALL 0 (QREFELT $ 26)))
         (SETELT $ 29 (SPADCALL 400 (QREFELT $ 22)))
         (EXIT (SETELT $ 30 (SPADCALL 427 (QREFELT $ 22)))))) 

(SDEFUN |VIEWDEF;pointColorDefault;P;6| (($ |Palette|))
        (SPADCALL (QREFELT $ 12) (QREFELT $ 65))) 

(SDEFUN |VIEWDEF;pointColorDefault;2P;7| ((|p| |Palette|) ($ |Palette|))
        (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 67))) 

(SDEFUN |VIEWDEF;lineColorDefault;P;8| (($ |Palette|))
        (SPADCALL (QREFELT $ 15) (QREFELT $ 65))) 

(SDEFUN |VIEWDEF;lineColorDefault;2P;9| ((|p| |Palette|) ($ |Palette|))
        (SPADCALL (QREFELT $ 15) |p| (QREFELT $ 67))) 

(SDEFUN |VIEWDEF;axesColorDefault;P;10| (($ |Palette|))
        (SPADCALL (QREFELT $ 17) (QREFELT $ 65))) 

(SDEFUN |VIEWDEF;axesColorDefault;2P;11| ((|p| |Palette|) ($ |Palette|))
        (SPADCALL (QREFELT $ 17) |p| (QREFELT $ 67))) 

(SDEFUN |VIEWDEF;unitsColorDefault;P;12| (($ |Palette|))
        (SPADCALL (QREFELT $ 19) (QREFELT $ 65))) 

(SDEFUN |VIEWDEF;unitsColorDefault;2P;13| ((|p| |Palette|) ($ |Palette|))
        (SPADCALL (QREFELT $ 19) |p| (QREFELT $ 67))) 

(SDEFUN |VIEWDEF;pointSizeDefault;Pi;14| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 23) (QREFELT $ 57))) 

(SDEFUN |VIEWDEF;pointSizeDefault;2Pi;15|
        ((|x| |PositiveInteger|) ($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 60))) 

(SDEFUN |VIEWDEF;var1StepsDefault;Pi;16| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 35) (QREFELT $ 57))) 

(SDEFUN |VIEWDEF;var1StepsDefault;2Pi;17|
        ((|i| |PositiveInteger|) ($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 35) |i| (QREFELT $ 60))) 

(SDEFUN |VIEWDEF;var2StepsDefault;Pi;18| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 36) (QREFELT $ 57))) 

(SDEFUN |VIEWDEF;var2StepsDefault;2Pi;19|
        ((|i| |PositiveInteger|) ($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 36) |i| (QREFELT $ 60))) 

(SDEFUN |VIEWDEF;tubePointsDefault;Pi;20| (($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 37) (QREFELT $ 57))) 

(SDEFUN |VIEWDEF;tubePointsDefault;2Pi;21|
        ((|i| |PositiveInteger|) ($ |PositiveInteger|))
        (SPADCALL (QREFELT $ 37) |i| (QREFELT $ 60))) 

(SDEFUN |VIEWDEF;tubeRadiusDefault;Df;22| (($ |DoubleFloat|))
        (SPADCALL (QREFELT $ 45) (QREFELT $ 83))) 

(SDEFUN |VIEWDEF;tubeRadiusDefault;FDf;23| ((|f| |Float|) ($ |DoubleFloat|))
        (SPADCALL (QREFELT $ 45) (SPADCALL |f| (QREFELT $ 42)) (QREFELT $ 85))) 

(PUT '|VIEWDEF;viewWriteAvailable;L;24| '|SPADreplace|
     '(XLAM NIL (LIST "PIXMAP" "BITMAP" "POSTSCRIPT" "IMAGE"))) 

(SDEFUN |VIEWDEF;viewWriteAvailable;L;24| (($ |List| (|String|)))
        (LIST "PIXMAP" "BITMAP" "POSTSCRIPT" "IMAGE")) 

(SDEFUN |VIEWDEF;viewWriteDefault;L;25| (($ |List| (|String|)))
        (SPADCALL (QREFELT $ 34) (QREFELT $ 88))) 

(SDEFUN |VIEWDEF;viewWriteDefault;2L;26|
        ((|listOfThings| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((|thingsToWrite| (|List| (|String|))) (|writeTypeInt| (|Integer|))
          (#1=#:G414 NIL) (|aTypeOfFile| NIL))
         (SEQ (LETT |thingsToWrite| NIL)
              (SEQ (LETT |aTypeOfFile| NIL) (LETT #1# |listOfThings|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |aTypeOfFile| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |writeTypeInt|
                          (SPADCALL (SPADCALL |aTypeOfFile| (QREFELT $ 91))
                                    (SPADCALL (QREFELT $ 87)) (QREFELT $ 92)))
                    (EXIT
                     (COND
                      ((< |writeTypeInt| 1)
                       (SPADCALL
                        (LIST "  > " |aTypeOfFile|
                              " is not a valid file type for writing a viewport")
                        (QREFELT $ 94)))
                      ('T
                       (LETT |thingsToWrite|
                             (SPADCALL |thingsToWrite| (LIST |aTypeOfFile|)
                                       (QREFELT $ 95)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT $ 34) |thingsToWrite| (QREFELT $ 96)))))) 

(DECLAIM (NOTINLINE |ViewDefaultsPackage;|)) 

(DEFUN |ViewDefaultsPackage| ()
  (SPROG NIL
         (PROG (#1=#:G416)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ViewDefaultsPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ViewDefaultsPackage|
                             (LIST
                              (CONS NIL (CONS 1 (|ViewDefaultsPackage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ViewDefaultsPackage|)))))))))) 

(DEFUN |ViewDefaultsPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ViewDefaultsPackage|))
          (LETT $ (GETREFV 98))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ViewDefaultsPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 12
                    (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 7)) (QREFELT $ 9))
                              (QREFELT $ 11)))
          (QSETREFV $ 15
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 13)) (QREFELT $ 14))
                     (QREFELT $ 11)))
          (QSETREFV $ 17
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 7)) (QREFELT $ 16))
                     (QREFELT $ 11)))
          (QSETREFV $ 19
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 18)) (QREFELT $ 16))
                     (QREFELT $ 11)))
          (QSETREFV $ 23 (SPADCALL 3 (QREFELT $ 22)))
          (QSETREFV $ 27 (SPADCALL 0 (QREFELT $ 26)))
          (QSETREFV $ 28 (SPADCALL 0 (QREFELT $ 26)))
          (QSETREFV $ 29 (SPADCALL 400 (QREFELT $ 22)))
          (QSETREFV $ 30 (SPADCALL 400 (QREFELT $ 22)))
          (QSETREFV $ 34 (SPADCALL NIL (QREFELT $ 33)))
          (QSETREFV $ 35 (SPADCALL 27 (QREFELT $ 22)))
          (QSETREFV $ 36 (SPADCALL 27 (QREFELT $ 22)))
          (QSETREFV $ 37 (SPADCALL 6 (QREFELT $ 22)))
          (QSETREFV $ 45
                    (SPADCALL
                     (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 40))
                               (QREFELT $ 42))
                     (QREFELT $ 44)))
          (QSETREFV $ 49 (SPADCALL NIL (QREFELT $ 48)))
          $))) 

(MAKEPROP '|ViewDefaultsPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Color|) (0 . |red|) (|Palette|)
              (4 . |bright|) (|Reference| 8) (9 . |ref|) '|defaultPointColor|
              (14 . |green|) (18 . |pastel|) '|defaultLineColor| (23 . |dim|)
              '|defaultAxesColor| (28 . |yellow|) '|defaultUnitsColor|
              (|PositiveInteger|) (|Reference| 20) (32 . |ref|)
              '|defaultPointSize| (|NonNegativeInteger|) (|Reference| 24)
              (37 . |ref|) '|defaultXPos| '|defaultYPos| '|defaultWidth|
              '|defaultHeight| (|List| 90) (|Reference| 31) (42 . |ref|)
              '|defaultThingsToWrite| '|defaultVar1Steps| '|defaultVar2Steps|
              '|defaultTubePoints| (|Integer|) (|Float|) (47 . |float|)
              (|DoubleFloat|) (54 . |convert|) (|Reference| 41) (59 . |ref|)
              '|defaultTubeRadius| (|Boolean|) (|Reference| 46) (64 . |ref|)
              '|defaultClosed| (69 . |elt|) (|List| 24)
              |VIEWDEF;viewPosDefault;L;1| (74 . |#|) (79 . |setelt!|)
              (85 . |last|) |VIEWDEF;viewPosDefault;2L;2| (90 . |elt|)
              (|List| 20) |VIEWDEF;viewSizeDefault;L;3| (95 . |setelt!|)
              (101 . |last|) |VIEWDEF;viewSizeDefault;2L;4| (|Void|)
              |VIEWDEF;viewDefaults;V;5| (106 . |elt|)
              |VIEWDEF;pointColorDefault;P;6| (111 . |setelt!|)
              |VIEWDEF;pointColorDefault;2P;7| |VIEWDEF;lineColorDefault;P;8|
              |VIEWDEF;lineColorDefault;2P;9| |VIEWDEF;axesColorDefault;P;10|
              |VIEWDEF;axesColorDefault;2P;11| |VIEWDEF;unitsColorDefault;P;12|
              |VIEWDEF;unitsColorDefault;2P;13|
              |VIEWDEF;pointSizeDefault;Pi;14|
              |VIEWDEF;pointSizeDefault;2Pi;15|
              |VIEWDEF;var1StepsDefault;Pi;16|
              |VIEWDEF;var1StepsDefault;2Pi;17|
              |VIEWDEF;var2StepsDefault;Pi;18|
              |VIEWDEF;var2StepsDefault;2Pi;19|
              |VIEWDEF;tubePointsDefault;Pi;20|
              |VIEWDEF;tubePointsDefault;2Pi;21| (117 . |elt|)
              |VIEWDEF;tubeRadiusDefault;Df;22| (122 . |setelt!|)
              |VIEWDEF;tubeRadiusDefault;FDf;23|
              |VIEWDEF;viewWriteAvailable;L;24| (128 . |elt|)
              |VIEWDEF;viewWriteDefault;L;25| (|String|) (133 . |upperCase|)
              (138 . |position|) (|DisplayPackage|) (144 . |say|)
              (149 . |append|) (155 . |setelt!|)
              |VIEWDEF;viewWriteDefault;2L;26|)
           '#(|viewWriteDefault| 161 |viewWriteAvailable| 170 |viewSizeDefault|
              174 |viewPosDefault| 183 |viewDefaults| 192 |var2StepsDefault|
              196 |var1StepsDefault| 205 |unitsColorDefault| 214
              |tubeRadiusDefault| 223 |tubePointsDefault| 232
              |pointSizeDefault| 241 |pointColorDefault| 250 |lineColorDefault|
              259 |axesColorDefault| 268)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|pointColorDefault| ((|Palette|))) T)
                                   '((|pointColorDefault|
                                      ((|Palette|) (|Palette|)))
                                     T)
                                   '((|lineColorDefault| ((|Palette|))) T)
                                   '((|lineColorDefault|
                                      ((|Palette|) (|Palette|)))
                                     T)
                                   '((|axesColorDefault| ((|Palette|))) T)
                                   '((|axesColorDefault|
                                      ((|Palette|) (|Palette|)))
                                     T)
                                   '((|unitsColorDefault| ((|Palette|))) T)
                                   '((|unitsColorDefault|
                                      ((|Palette|) (|Palette|)))
                                     T)
                                   '((|pointSizeDefault| ((|PositiveInteger|)))
                                     T)
                                   '((|pointSizeDefault|
                                      ((|PositiveInteger|)
                                       (|PositiveInteger|)))
                                     T)
                                   '((|viewPosDefault|
                                      ((|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|viewPosDefault|
                                      ((|List| (|NonNegativeInteger|))
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|viewSizeDefault|
                                      ((|List| (|PositiveInteger|))))
                                     T)
                                   '((|viewSizeDefault|
                                      ((|List| (|PositiveInteger|))
                                       (|List| (|PositiveInteger|))))
                                     T)
                                   '((|viewDefaults| ((|Void|))) T)
                                   '((|viewWriteDefault| ((|List| (|String|))))
                                     T)
                                   '((|viewWriteDefault|
                                      ((|List| (|String|))
                                       (|List| (|String|))))
                                     T)
                                   '((|viewWriteAvailable|
                                      ((|List| (|String|))))
                                     T)
                                   '((|var1StepsDefault| ((|PositiveInteger|)))
                                     T)
                                   '((|var2StepsDefault| ((|PositiveInteger|)))
                                     T)
                                   '((|var1StepsDefault|
                                      ((|PositiveInteger|)
                                       (|PositiveInteger|)))
                                     T)
                                   '((|var2StepsDefault|
                                      ((|PositiveInteger|)
                                       (|PositiveInteger|)))
                                     T)
                                   '((|tubePointsDefault|
                                      ((|PositiveInteger|)
                                       (|PositiveInteger|)))
                                     T)
                                   '((|tubePointsDefault|
                                      ((|PositiveInteger|)))
                                     T)
                                   '((|tubeRadiusDefault|
                                      ((|DoubleFloat|) (|Float|)))
                                     T)
                                   '((|tubeRadiusDefault| ((|DoubleFloat|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 97
                                            '(0 6 0 7 1 8 0 6 9 1 10 0 8 11 0 6
                                              0 13 1 8 0 6 14 1 8 0 6 16 0 6 0
                                              18 1 21 0 20 22 1 25 0 24 26 1 32
                                              0 31 33 3 39 0 38 38 20 40 1 39
                                              41 0 42 1 43 0 41 44 1 47 0 46 48
                                              1 25 24 0 50 1 51 24 0 53 2 25 24
                                              0 24 54 1 51 24 0 55 1 21 20 0 57
                                              2 21 20 0 20 60 1 58 20 0 61 1 10
                                              8 0 65 2 10 8 0 8 67 1 43 41 0 83
                                              2 43 41 0 41 85 1 32 31 0 88 1 90
                                              0 0 91 2 31 38 90 0 92 1 93 63 31
                                              94 2 31 0 0 0 95 2 32 31 0 31 96
                                              0 0 31 89 1 0 31 31 97 0 0 31 87
                                              0 0 58 59 1 0 58 58 62 0 0 51 52
                                              1 0 51 51 56 0 0 63 64 0 0 20 79
                                              1 0 20 20 80 0 0 20 77 1 0 20 20
                                              78 0 0 8 73 1 0 8 8 74 0 0 41 84
                                              1 0 41 39 86 0 0 20 81 1 0 20 20
                                              82 0 0 20 75 1 0 20 20 76 0 0 8
                                              66 1 0 8 8 68 0 0 8 69 1 0 8 8 70
                                              1 0 8 8 72 0 0 8 71)))))
           '|lookupComplete|)) 

(MAKEPROP '|ViewDefaultsPackage| 'NILADIC T) 
