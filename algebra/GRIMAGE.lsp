
(SDEFUN |GRIMAGE;numberCheck| ((|nums| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPROG ((#1=#:G400 NIL) (#2=#:G396 NIL) (#3=#:G401 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| (SPADCALL |nums| (QREFELT $ 9)))
                      (LETT #3# (SPADCALL |nums| (QREFELT $ 10))) G190
                      (COND ((> |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COMPLEXP
                           (SPADCALL |nums|
                                     (PROG1 (LETT #2# |i|)
                                       (|check_subtype2| (> #2# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT $ 12)))
                          (PROGN
                           (LETT #1#
                                 (|error|
                                  "An unexpected complex number was encountered in the calculations."))
                           (GO #4=#:G398))))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |GRIMAGE;doOptions| ((|g| |Rep|) ($ |Void|))
        (SPROG
         ((|lu| (|List| (|Float|))) (|lr| (|List| (|Segment| (|Float|)))))
         (SEQ
          (LETT |lr|
                (SPADCALL (QVELT |g| 7) (SPADCALL |g| (QREFELT $ 14))
                          (QREFELT $ 17)))
          (COND
           ((> (LENGTH |lr|) 1)
            (QSETVELT |g| 1
                      (LIST
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 1 (QREFELT $ 19))
                                   (QREFELT $ 21))
                         (QREFELT $ 22))
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 1 (QREFELT $ 19))
                                   (QREFELT $ 23))
                         (QREFELT $ 22))
                        (QREFELT $ 25))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 2 (QREFELT $ 19))
                                   (QREFELT $ 21))
                         (QREFELT $ 22))
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 2 (QREFELT $ 19))
                                   (QREFELT $ 23))
                         (QREFELT $ 22))
                        (QREFELT $ 25)))))
           (#1='T (QSETVELT |g| 1 NIL)))
          (LETT |lu|
                (SPADCALL (QVELT |g| 7) (SPADCALL |g| (QREFELT $ 27))
                          (QREFELT $ 28)))
          (EXIT
           (COND
            ((> (LENGTH |lu|) 1)
             (QSETVELT |g| 2
                       (LIST
                        (SPADCALL (SPADCALL |lu| 1 (QREFELT $ 29))
                                  (QREFELT $ 22))
                        (SPADCALL (SPADCALL |lu| 2 (QREFELT $ 29))
                                  (QREFELT $ 22)))))
            (#1# (QSETVELT |g| 2 NIL))))))) 

(SDEFUN |GRIMAGE;putColorInfo;LLL;3|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|listOfPalettes| |List| (|Palette|))
         ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|llp2| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|lp2| (|List| (|Point| (|DoubleFloat|))))
          (|p| (|Point| (|DoubleFloat|))) (|d| (|PositiveInteger|))
          (#1=#:G416 NIL) (|daShade| (|DoubleFloat|)) (|daHue| (|DoubleFloat|))
          (#2=#:G414 NIL) (|lp| NIL) (#3=#:G415 NIL) (|pal| NIL))
         (SEQ (LETT |llp2| NIL)
              (SEQ (LETT |pal| NIL) (LETT #3# |listOfPalettes|) (LETT |lp| NIL)
                   (LETT #2# |llp|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |lp| (CAR #2#)) NIL)
                         (ATOM #3#) (PROGN (LETT |pal| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lp2| NIL)
                        (LETT |daHue|
                              (FLOAT
                               (SPADCALL (SPADCALL |pal| (QREFELT $ 32))
                                         (QREFELT $ 33))
                               MOST-POSITIVE-DOUBLE-FLOAT))
                        (LETT |daShade|
                              (FLOAT (SPADCALL |pal| (QREFELT $ 34))
                                     MOST-POSITIVE-DOUBLE-FLOAT))
                        (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 36)))
                                   (EXIT
                                    (COND
                                     ((< |d| 3)
                                      (LETT |p|
                                            (SPADCALL |p|
                                                      (LIST |daHue| |daShade|)
                                                      (QREFELT $ 38))))
                                     ('T
                                      (SEQ
                                       (SPADCALL |p| 3 |daHue| (QREFELT $ 39))
                                       (EXIT
                                        (COND
                                         ((< |d| 4)
                                          (LETT |p|
                                                (SPADCALL |p| (LIST |daShade|)
                                                          (QREFELT $ 38))))
                                         ('T
                                          (SPADCALL |p| 4 |daShade|
                                                    (QREFELT $ 39))))))))))
                              (EXIT (LETT |lp2| (CONS |p| |lp2|))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |llp2| (CONS (NREVERSE |lp2|) |llp2|))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (NREVERSE |llp2|))))) 

(SDEFUN |GRIMAGE;graph| ((|demRanges| |List| (|Segment| (|Float|))) ($ $))
        (SPROG ((|demRangesSF| (|List| (|Segment| (|DoubleFloat|)))))
               (SEQ
                (COND
                 ((NULL |demRanges|) (VECTOR 0 NIL NIL NIL NIL NIL NIL NIL))
                 ('T
                  (SEQ
                   (LETT |demRangesSF|
                         (LIST
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT $ 19))
                                      (QREFELT $ 21))
                            (QREFELT $ 22))
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT $ 19))
                                      (QREFELT $ 23))
                            (QREFELT $ 22))
                           (QREFELT $ 25))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT $ 19))
                                      (QREFELT $ 21))
                            (QREFELT $ 22))
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT $ 19))
                                      (QREFELT $ 23))
                            (QREFELT $ 22))
                           (QREFELT $ 25))))
                   (EXIT (VECTOR 0 |demRangesSF| NIL NIL NIL NIL NIL NIL)))))))) 

(SDEFUN |GRIMAGE;scaleStep|
        ((|range_seg| |Segment| (|DoubleFloat|)) ($ |DoubleFloat|))
        (SPROG
         ((|scaleDown| (|DoubleFloat|)) (|numerals| (|String|))
          (|tryStep| (|DoubleFloat|)) (|range| (|DoubleFloat|))
          (|adjust| (|NonNegativeInteger|)))
         (SEQ
          (LETT |range|
                (|sub_DF| (SPADCALL |range_seg| (QREFELT $ 43))
                          (SPADCALL |range_seg| (QREFELT $ 44))))
          (LETT |adjust| 0)
          (SEQ G190
               (COND
                ((NULL
                  (|less_DF| |range|
                             (SPADCALL (SPADCALL 100 0 10 (QREFELT $ 45))
                                       (QREFELT $ 46))))
                 (GO G191)))
               (SEQ (LETT |adjust| (+ |adjust| 1))
                    (EXIT
                     (LETT |range|
                           (|mul_DF| |range|
                                     (SPADCALL
                                      (SPADCALL 10 0 10 (QREFELT $ 45))
                                      (QREFELT $ 46))))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |tryStep|
                (|div_DF| |range|
                          (SPADCALL (SPADCALL 10 0 10 (QREFELT $ 45))
                                    (QREFELT $ 46))))
          (LETT |numerals|
                (STRINGIMAGE
                 (SPADCALL (SPADCALL |tryStep| (QREFELT $ 47))
                           (QREFELT $ 48))))
          (LETT |scaleDown|
                (FLOAT (EXPT 10 (- (QCSIZE |numerals|) 1))
                       MOST-POSITIVE-DOUBLE-FLOAT))
          (EXIT
           (|div_DF|
            (|mul_DF| |scaleDown|
                      (SPADCALL
                       (|sub_DF| (|div_DF| |tryStep| |scaleDown|)
                                 (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 45))
                                           (QREFELT $ 46)))
                       (QREFELT $ 47)))
            (FLOAT (EXPT 10 |adjust|) MOST-POSITIVE-DOUBLE-FLOAT)))))) 

(SDEFUN |GRIMAGE;figureUnits|
        ((|ranges| |List| (|Segment| (|DoubleFloat|)))
         ($ |List| (|DoubleFloat|)))
        (LIST (|GRIMAGE;scaleStep| (|SPADfirst| |ranges|) $)
              (|GRIMAGE;scaleStep| (SPADCALL |ranges| (QREFELT $ 50)) $))) 

(SDEFUN |GRIMAGE;roundRange|
        ((|range| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (SPROG
         ((|high| (|DoubleFloat|)) (|low| (|DoubleFloat|))
          (|single_eps| (|DoubleFloat|)))
         (SEQ
          (LETT |single_eps|
                (|expt_DF_I|
                 (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 45)) (QREFELT $ 46))
                 -19))
          (LETT |low| (SPADCALL |range| (QREFELT $ 44)))
          (LETT |low|
                (COND
                 ((|less_DF| (|abs_DF| |low|) 1.0)
                  (|sub_DF| |low| |single_eps|))
                 ((|less_DF| |low| 0.0)
                  (|mul_DF|
                   (|add_DF|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 45)) (QREFELT $ 46))
                    |single_eps|)
                   |low|))
                 (#1='T
                  (|mul_DF|
                   (|sub_DF|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 45)) (QREFELT $ 46))
                    |single_eps|)
                   |low|))))
          (LETT |high| (SPADCALL |range| (QREFELT $ 43)))
          (LETT |high|
                (COND
                 ((|less_DF| (|abs_DF| |high|) 1.0)
                  (|add_DF| |high| |single_eps|))
                 ((|less_DF| |high| 0.0)
                  (|mul_DF|
                   (|sub_DF|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 45)) (QREFELT $ 46))
                    |single_eps|)
                   |high|))
                 (#1#
                  (|mul_DF|
                   (|add_DF|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 45)) (QREFELT $ 46))
                    |single_eps|)
                   |high|))))
          (EXIT (SPADCALL |low| |high| (QREFELT $ 53)))))) 

(SDEFUN |GRIMAGE;roundRanges|
        ((|ranges| |List| (|Segment| (|DoubleFloat|)))
         ($ |List| (|Segment| (|DoubleFloat|))))
        (LIST (|GRIMAGE;roundRange| (|SPADfirst| |ranges|) $)
              (|GRIMAGE;roundRange| (SPADCALL |ranges| (QREFELT $ 50)) $))) 

(SDEFUN |GRIMAGE;plotLists|
        ((|graf| |Rep|)
         (|listOfListsOfPoints| |List| (|List| (|Point| (|DoubleFloat|))))
         (|listOfPointColors| |List| (|Palette|))
         (|listOfLineColors| |List| (|Palette|))
         (|listOfPointSizes| |List| (|PositiveInteger|)) ($ $))
        (SPROG
         ((#1=#:G463 NIL) (|givenLen| #2=(|NonNegativeInteger|))
          (#3=#:G453 NIL) (#4=#:G443 NIL) (|len| #2#) (#5=#:G468 NIL) (|l| NIL)
          (#6=#:G467 NIL))
         (SEQ (LETT |givenLen| (LENGTH |listOfListsOfPoints|))
              (LETT |listOfListsOfPoints|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |l| NIL) (LETT #5# |listOfListsOfPoints|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL (NULL |l|)) (LETT #6# (CONS |l| #6#))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (COND
               ((NULL |listOfListsOfPoints|)
                (|error|
                 "GraphImage was given a list that contained no valid point lists")))
              (COND
               ((SPADCALL (LETT |len| (LENGTH |listOfListsOfPoints|))
                          |givenLen| (QREFELT $ 56))
                (SPADCALL "   Warning: Ignoring pointless point list"
                          (QREFELT $ 60))))
              (QSETVELT |graf| 3 |listOfListsOfPoints|)
              (SEQ (LETT |givenLen| (LENGTH |listOfPointColors|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 4
                                (SPADCALL |listOfPointColors|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #4# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            1)
                                           (SPADCALL (QREFELT $ 62))
                                           (QREFELT $ 63))
                                          (QREFELT $ 64))))
                     (#7='T
                      (QSETVELT |graf| 4
                                (SPADCALL |listOfPointColors| |len|
                                          (QREFELT $ 65)))))))
              (SEQ (LETT |givenLen| (LENGTH |listOfLineColors|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 5
                                (SPADCALL |listOfLineColors|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #3# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #3# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #3#))
                                            1)
                                           (SPADCALL (QREFELT $ 66))
                                           (QREFELT $ 63))
                                          (QREFELT $ 64))))
                     (#7#
                      (QSETVELT |graf| 5
                                (SPADCALL |listOfLineColors| |len|
                                          (QREFELT $ 65)))))))
              (SEQ (LETT |givenLen| (LENGTH |listOfPointSizes|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 6
                                (SPADCALL |listOfPointSizes|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #1# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            1)
                                           (SPADCALL (QREFELT $ 67))
                                           (QREFELT $ 69))
                                          (QREFELT $ 70))))
                     (#7#
                      (QSETVELT |graf| 6
                                (SPADCALL |listOfPointSizes| |len|
                                          (QREFELT $ 71)))))))
              (EXIT |graf|)))) 

(SDEFUN |GRIMAGE;sendGraphImage;$V;10| ((|graf| $) ($ |Void|))
        (SPROG
         ((|hueShade| (|Integer|)) (|aPoint| #1=(|Point| (|DoubleFloat|)))
          (#2=#:G485 NIL) (|p| NIL) (#3=#:G481 NIL) (|aList| NIL)
          (#4=#:G482 NIL) (|pColor| NIL) (#5=#:G483 NIL) (|lColor| NIL)
          (#6=#:G484 NIL) (|s| (|NonNegativeInteger|))
          (|tonto| (|List| (|Segment| (|DoubleFloat|))))
          (|transform| (|Mapping| #1# (|Point| (|DoubleFloat|)))))
         (SEQ (|GRIMAGE;doOptions| |graf| $)
              (LETT |s| (LENGTH (QVELT |graf| 3)))
              (EXIT
               (COND
                ((EQL |s| 0)
                 (|error| "You are trying to make a graph with no points"))
                ((SPADCALL (SPADCALL |graf| (QREFELT $ 72)) 0 (QREFELT $ 73))
                 (|error| "You are trying to draw over an existing graph"))
                ('T
                 (SEQ
                  (LETT |transform|
                        (SPADCALL (QVELT |graf| 7) (ELT $ 75) (QREFELT $ 77)))
                  (QSETVELT |graf| 3
                            (SPADCALL (QVELT |graf| 3) (QVELT |graf| 4)
                                      (QREFELT $ 42)))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT $ 14)))
                    (QSETVELT |graf| 1
                              (SPADCALL (QVELT |graf| 3) (QREFELT $ 79)))))
                  (QSETVELT |graf| 1
                            (|GRIMAGE;roundRanges| (QVELT |graf| 1) $))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT $ 27)))
                    (QSETVELT |graf| 2
                              (|GRIMAGE;figureUnits| (QVELT |graf| 1) $))))
                  (SPADCALL
                   "   Graph data being transmitted to the viewport manager..."
                   (QREFELT $ 60))
                  (|sockSendInt| |$ViewportServer| 2)
                  (|sockSendInt| |$ViewportServer| -1)
                  (LETT |tonto| (QVELT |graf| 1))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (|SPADfirst| |tonto|)
                                             (QREFELT $ 44)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (|SPADfirst| |tonto|)
                                             (QREFELT $ 43)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (SPADCALL |tonto| (QREFELT $ 50))
                                             (QREFELT $ 44)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (SPADCALL |tonto| (QREFELT $ 50))
                                             (QREFELT $ 43)))
                  (|sockSendFloat| |$ViewportServer|
                                   (|SPADfirst| (QVELT |graf| 2)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (QVELT |graf| 2) (QREFELT $ 80)))
                  (|sockSendInt| |$ViewportServer| |s|)
                  (SEQ (LETT |s| NIL) (LETT #6# (QVELT |graf| 6))
                       (LETT |lColor| NIL) (LETT #5# (QVELT |graf| 5))
                       (LETT |pColor| NIL) (LETT #4# (QVELT |graf| 4))
                       (LETT |aList| NIL) (LETT #3# (QVELT |graf| 3)) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |aList| (CAR #3#)) NIL)
                             (ATOM #4#) (PROGN (LETT |pColor| (CAR #4#)) NIL)
                             (ATOM #5#) (PROGN (LETT |lColor| (CAR #5#)) NIL)
                             (ATOM #6#) (PROGN (LETT |s| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ (|sockSendInt| |$ViewportServer| (LENGTH |aList|))
                            (SEQ (LETT |p| NIL) (LETT #2# |aList|) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |p| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |aPoint| (SPADCALL |p| |transform|))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |aPoint|
                                                             (QREFELT $ 82)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |aPoint|
                                                             (QREFELT $ 83)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |p|
                                                             (QREFELT $ 84)))
                                  (EXIT
                                   (|sockSendFloat| |$ViewportServer|
                                                    (SPADCALL |p|
                                                              (QREFELT $
                                                                       85)))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL (SPADCALL |pColor| (QREFELT $ 32))
                                             (QREFELT $ 33))
                                   (* (SPADCALL |pColor| (QREFELT $ 34))
                                      (SPADCALL (QREFELT $ 86)))))
                            (|sockSendInt| |$ViewportServer| |hueShade|)
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL
                                    (-
                                     (SPADCALL
                                      (SPADCALL |lColor| (QREFELT $ 32))
                                      (QREFELT $ 33))
                                     1)
                                    5 (QREFELT $ 88))
                                   (SPADCALL |lColor| (QREFELT $ 34))))
                            (|sockSendInt| |$ViewportServer| |hueShade|)
                            (EXIT (|sockSendInt| |$ViewportServer| |s|)))
                       (LETT #3#
                             (PROG1 (CDR #3#)
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #5#
                                             (PROG1 (CDR #5#)
                                               (LETT #6# (CDR #6#))))))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (QSETVELT |graf| 0 (|sockGetInt| |$ViewportServer|)))))))))) 

(PUT '|GRIMAGE;key;$I;11| '|SPADreplace| '(XLAM (|graf|) (QVELT |graf| 0))) 

(SDEFUN |GRIMAGE;key;$I;11| ((|graf| $) ($ |Integer|)) (QVELT |graf| 0)) 

(PUT '|GRIMAGE;pointLists;$L;12| '|SPADreplace|
     '(XLAM (|graf|) (QVELT |graf| 3))) 

(SDEFUN |GRIMAGE;pointLists;$L;12|
        ((|graf| $) ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (QVELT |graf| 3)) 

(SDEFUN |GRIMAGE;ranges;$L;13| ((|graf| $) ($ |List| (|Segment| (|Float|))))
        (COND ((NULL (QVELT |graf| 1)) NIL)
              ('T
               (LIST
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT $ 91))
                            (QREFELT $ 44))
                  (QREFELT $ 92))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT $ 91))
                            (QREFELT $ 43))
                  (QREFELT $ 92))
                 (QREFELT $ 93))
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT $ 91))
                            (QREFELT $ 44))
                  (QREFELT $ 92))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT $ 91))
                            (QREFELT $ 43))
                  (QREFELT $ 92))
                 (QREFELT $ 93)))))) 

(SDEFUN |GRIMAGE;ranges;$2L;14|
        ((|graf| $) (|rangesList| |List| (|Segment| (|Float|)))
         ($ |List| (|Segment| (|Float|))))
        (SEQ
         (QSETVELT |graf| 1
                   (LIST
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 1 (QREFELT $ 19))
                                (QREFELT $ 21))
                      (QREFELT $ 22))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 1 (QREFELT $ 19))
                                (QREFELT $ 23))
                      (QREFELT $ 22))
                     (QREFELT $ 25))
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 2 (QREFELT $ 19))
                                (QREFELT $ 21))
                      (QREFELT $ 22))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 2 (QREFELT $ 19))
                                (QREFELT $ 23))
                      (QREFELT $ 22))
                     (QREFELT $ 25))))
         (EXIT |rangesList|))) 

(SDEFUN |GRIMAGE;units;$L;15| ((|graf| $) ($ |List| (|Float|)))
        (COND ((NULL (QVELT |graf| 2)) NIL)
              ('T
               (LIST
                (SPADCALL (SPADCALL (QVELT |graf| 2) 1 (QREFELT $ 95))
                          (QREFELT $ 92))
                (SPADCALL (SPADCALL (QVELT |graf| 2) 2 (QREFELT $ 95))
                          (QREFELT $ 92)))))) 

(SDEFUN |GRIMAGE;units;$2L;16|
        ((|graf| $) (|unitsToBe| |List| (|Float|)) ($ |List| (|Float|)))
        (SEQ
         (QSETVELT |graf| 2
                   (LIST
                    (SPADCALL (SPADCALL |unitsToBe| 1 (QREFELT $ 29))
                              (QREFELT $ 22))
                    (SPADCALL (SPADCALL |unitsToBe| 2 (QREFELT $ 29))
                              (QREFELT $ 22))))
         (EXIT |unitsToBe|))) 

(SDEFUN |GRIMAGE;graphImage;$;17| (($ $)) (|GRIMAGE;graph| NIL $)) 

(SDEFUN |GRIMAGE;makeGraphImage;L$;18|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|)))) ($ $))
        (SPROG
         ((#1=#:G507 NIL) (|i| NIL) (#2=#:G506 NIL) (#3=#:G505 NIL)
          (#4=#:G504 NIL) (#5=#:G503 NIL) (|l| (|Integer|)) (#6=#:G502 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |i| 1) (LETT #5# (LETT |l| (LENGTH |llp|)))
                          G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6# (CONS (SPADCALL (QREFELT $ 62)) #6#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |i| 1) (LETT #3# |l|) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL (QREFELT $ 66)) #4#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| 1) (LETT #1# |l|) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL (QREFELT $ 67)) #2#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 98))))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LL$;19|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|lpc| |List| (|Palette|)) (|llc| |List| (|Palette|))
         (|lps| |List| (|PositiveInteger|)) ($ $))
        (SPADCALL |llp| |lpc| |llc| |lps| NIL (QREFELT $ 100))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LLL$;20|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|lpc| |List| (|Palette|)) (|llc| |List| (|Palette|))
         (|lps| |List| (|PositiveInteger|)) (|opts| |List| (|DrawOption|))
         ($ $))
        (SPROG
         ((|aPoint| #1=(|Point| (|DoubleFloat|))) (#2=#:G516 NIL) (|p| NIL)
          (#3=#:G515 NIL) (|aList| NIL)
          (|transform| (|Mapping| #1# (|Point| (|DoubleFloat|)))) (|graf| ($)))
         (SEQ
          (LETT |graf|
                (|GRIMAGE;graph| (SPADCALL |opts| NIL (QREFELT $ 17)) $))
          (QSETVELT |graf| 7 |opts|)
          (LETT |graf| (|GRIMAGE;plotLists| |graf| |llp| |lpc| |llc| |lps| $))
          (LETT |transform|
                (SPADCALL (QVELT |graf| 7) (ELT $ 75) (QREFELT $ 77)))
          (SEQ (LETT |aList| NIL) (LETT #3# (QVELT |graf| 3)) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |aList| (CAR #3#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL) (LETT #2# |aList|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |aPoint| (SPADCALL |p| |transform|))
                           (EXIT (|GRIMAGE;numberCheck| |aPoint| $)))
                      (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT |graf|)))) 

(SDEFUN |GRIMAGE;component;$L2PPiV;21|
        ((|graf| $) (|ListOfPoints| |List| (|Point| (|DoubleFloat|)))
         (|PointColor| |Palette|) (|LineColor| |Palette|)
         (|PointSize| |PositiveInteger|) ($ |Void|))
        (SEQ
         (QSETVELT |graf| 3
                   (SPADCALL (QVELT |graf| 3) (LIST |ListOfPoints|)
                             (QREFELT $ 101)))
         (QSETVELT |graf| 4
                   (SPADCALL (QVELT |graf| 4) (LIST |PointColor|)
                             (QREFELT $ 102)))
         (QSETVELT |graf| 5
                   (SPADCALL (QVELT |graf| 5) (LIST |LineColor|)
                             (QREFELT $ 102)))
         (EXIT
          (QSETVELT |graf| 6
                    (SPADCALL (QVELT |graf| 6) (LIST |PointSize|)
                              (QREFELT $ 103)))))) 

(SDEFUN |GRIMAGE;component;$PV;22|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPADCALL |graf| |aPoint| (SPADCALL (QREFELT $ 62))
                  (SPADCALL (QREFELT $ 66)) (SPADCALL (QREFELT $ 67))
                  (QREFELT $ 106))) 

(SDEFUN |GRIMAGE;component;$P2PPiV;23|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) (|PointColor| |Palette|)
         (|LineColor| |Palette|) (|PointSize| |PositiveInteger|) ($ |Void|))
        (SPADCALL |graf| (LIST |aPoint|) |PointColor| |LineColor| |PointSize|
                  (QREFELT $ 105))) 

(SDEFUN |GRIMAGE;appendPoint;$PV;24|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPROG ((|num| (|Integer|)))
               (SEQ (LETT |num| (- (LENGTH (QVELT |graf| 3)) 1))
                    (EXIT
                     (COND
                      ((< |num| 0) (|error| "No point lists to append to!"))
                      ('T
                       (SPADCALL (QVELT |graf| 3) |num|
                                 (SPADCALL
                                  (SPADCALL (QVELT |graf| 3) |num|
                                            (QREFELT $ 108))
                                  (LIST |aPoint|) (QREFELT $ 109))
                                 (QREFELT $ 110)))))))) 

(SDEFUN |GRIMAGE;point;$PPV;25|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) (|PointColor| |Palette|)
         ($ |Void|))
        (SPADCALL |graf| |aPoint| |PointColor| (SPADCALL (QREFELT $ 66))
                  (SPADCALL (QREFELT $ 67)) (QREFELT $ 106))) 

(SDEFUN |GRIMAGE;coerce;L$;26|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|)))) ($ $))
        (SPROG
         ((#1=#:G534 NIL) (|i| NIL) (#2=#:G533 NIL) (#3=#:G532 NIL)
          (#4=#:G531 NIL) (#5=#:G530 NIL) (|l| (|Integer|)) (#6=#:G529 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |i| 1) (LETT #5# (LETT |l| (LENGTH |llp|)))
                          G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6# (CONS (SPADCALL (QREFELT $ 62)) #6#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |i| 1) (LETT #3# |l|) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL (QREFELT $ 66)) #4#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| 1) (LETT #1# |l|) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL (QREFELT $ 67)) #2#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 98))))) 

(SDEFUN |GRIMAGE;coerce;$Of;27| ((|graf| $) ($ |OutputForm|))
        (SPROG ((|p| (|NonNegativeInteger|)))
               (SPADCALL
                (LIST (SPADCALL "Graph with " (QREFELT $ 115))
                      (SPADCALL
                       (LETT |p| (LENGTH (SPADCALL |graf| (QREFELT $ 90))))
                       (QREFELT $ 116))
                      (SPADCALL
                       (COND ((EQL |p| 1) " point list") ('T " point lists"))
                       (QREFELT $ 115)))
                (QREFELT $ 118)))) 

(DECLAIM (NOTINLINE |GraphImage;|)) 

(DEFUN |GraphImage| ()
  (SPROG NIL
         (PROG (#1=#:G537)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GraphImage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GraphImage|
                             (LIST (CONS NIL (CONS 1 (|GraphImage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|GraphImage|)))))))))) 

(DEFUN |GraphImage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GraphImage|))
          (LETT $ (GETREFV 121))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GraphImage| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |key| (|Integer|))
                              (|:| |rangesField|
                                   (|List| (|Segment| (|DoubleFloat|))))
                              (|:| |unitsField| (|List| (|DoubleFloat|)))
                              (|:| |llPoints|
                                   (|List| (|List| (|Point| (|DoubleFloat|)))))
                              (|:| |pointColors| (|List| (|Palette|)))
                              (|:| |lineColors| (|List| (|Palette|)))
                              (|:| |pointSizes| (|List| (|PositiveInteger|)))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          $))) 

(MAKEPROP '|GraphImage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|Point| 11)
              (0 . |minIndex|) (5 . |maxIndex|) (|DoubleFloat|) (10 . |elt|)
              (|List| 18) |GRIMAGE;ranges;$L;13| (|List| (|DrawOption|))
              (|DrawOptionFunctions0|) (16 . |ranges|) (|Segment| 20)
              (22 . |elt|) (|Float|) (28 . |low|) (33 . |convert|)
              (38 . |high|) (|Segment| 11) (43 . |segment|) (|List| 20)
              |GRIMAGE;units;$L;15| (49 . |units|) (55 . |elt|) (|Color|)
              (|Palette|) (61 . |hue|) (66 . |hue|) (71 . |shade|)
              (|PositiveInteger|) (76 . |dimension|) (|List| 11)
              (81 . |extend|) (87 . |setelt!|) (|List| 104) (|List| 31)
              |GRIMAGE;putColorInfo;LLL;3| (94 . |high|) (99 . |low|)
              (104 . |float|) (111 . |coerce|) (116 . |ceiling|)
              (121 . |retract|) (|List| 24) (126 . |second|) (131 . |Zero|)
              (135 . |One|) (139 . SEGMENT) (|Boolean|) (|NonNegativeInteger|)
              (145 . ~=) (|Void|) (|String|) (|DisplayPackage|) (151 . |say|)
              (|ViewDefaultsPackage|) (156 . |pointColorDefault|) (160 . |new|)
              (166 . |concat|) (172 . |first|) (178 . |lineColorDefault|)
              (182 . |pointSizeDefault|) (|List| 35) (186 . |new|)
              (192 . |concat|) (198 . |first|) |GRIMAGE;key;$I;11| (204 . ~=)
              (|CoordinateSystems| 11) (210 . |cartesian|) (|Mapping| 8 8)
              (215 . |coord|) (|PlotTools|) (221 . |calcRanges|)
              (226 . |second|) (|PointPackage| 11) (231 . |xCoord|)
              (236 . |yCoord|) (241 . |hue|) (246 . |shade|)
              (251 . |numberOfHues|) (|SingleInteger|) (255 . *)
              |GRIMAGE;sendGraphImage;$V;10| |GRIMAGE;pointLists;$L;12|
              (261 . |elt|) (267 . |convert|) (272 . |segment|)
              |GRIMAGE;ranges;$2L;14| (278 . |elt|) |GRIMAGE;units;$2L;16|
              |GRIMAGE;graphImage;$;17| |GRIMAGE;makeGraphImage;L2LL$;19|
              |GRIMAGE;makeGraphImage;L$;18| |GRIMAGE;makeGraphImage;L2LLL$;20|
              (284 . |append|) (290 . |append|) (296 . |append|) (|List| 8)
              |GRIMAGE;component;$L2PPiV;21| |GRIMAGE;component;$P2PPiV;23|
              |GRIMAGE;component;$PV;22| (302 . |elt|) (308 . |append|)
              (314 . |setelt!|) |GRIMAGE;appendPoint;$PV;24|
              |GRIMAGE;point;$PPV;25| |GRIMAGE;coerce;L$;26| (|OutputForm|)
              (321 . |message|) (326 . |coerce|) (|List| $) (331 . |hconcat|)
              |GRIMAGE;coerce;$Of;27| (|HashState|))
           '#(~= 336 |units| 342 |sendGraphImage| 353 |ranges| 358
              |putColorInfo| 369 |pointLists| 375 |point| 380 |makeGraphImage|
              387 |latex| 409 |key| 414 |hashUpdate!| 419 |hash| 425
              |graphImage| 430 |component| 434 |coerce| 458 |appendPoint| 468 =
              474)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 114))
                        (|makeByteWordVec2| 120
                                            '(1 8 7 0 9 1 8 7 0 10 2 8 11 0 7
                                              12 2 16 13 15 13 17 2 13 18 0 7
                                              19 1 18 20 0 21 1 20 11 0 22 1 18
                                              20 0 23 2 24 0 11 11 25 2 16 26
                                              15 26 28 2 26 20 0 7 29 1 31 30 0
                                              32 1 30 7 0 33 1 31 7 0 34 1 8 35
                                              0 36 2 8 0 0 37 38 3 8 11 0 7 11
                                              39 1 24 11 0 43 1 24 11 0 44 3 20
                                              0 7 7 35 45 1 20 11 0 46 1 11 0 0
                                              47 1 11 7 0 48 1 49 24 0 50 0 20
                                              0 51 0 20 0 52 2 24 0 11 11 53 2
                                              55 54 0 0 56 1 59 57 58 60 0 61
                                              31 62 2 41 0 55 31 63 2 41 0 0 0
                                              64 2 41 0 0 55 65 0 61 31 66 0 61
                                              35 67 2 68 0 55 35 69 2 68 0 0 0
                                              70 2 68 0 0 55 71 2 7 54 0 0 73 1
                                              74 8 8 75 2 16 76 15 76 77 1 78
                                              49 40 79 1 37 11 0 80 1 81 11 8
                                              82 1 81 11 8 83 1 81 11 8 84 1 81
                                              11 8 85 0 30 35 86 2 87 0 7 0 88
                                              2 49 24 0 7 91 1 11 20 0 92 2 18
                                              0 20 20 93 2 37 11 0 7 95 2 40 0
                                              0 0 101 2 41 0 0 0 102 2 68 0 0 0
                                              103 2 40 104 0 7 108 2 104 0 0 0
                                              109 3 40 104 0 7 104 110 1 114 0
                                              58 115 1 55 114 0 116 1 114 0 117
                                              118 2 0 54 0 0 1 1 0 26 0 27 2 0
                                              26 0 26 96 1 0 57 0 89 2 0 13 0
                                              13 94 1 0 13 0 14 2 0 40 40 41 42
                                              1 0 40 0 90 3 0 57 0 8 31 112 4 0
                                              0 40 41 41 68 98 5 0 0 40 41 41
                                              68 15 100 1 0 0 40 99 1 0 58 0 1
                                              1 0 7 0 72 2 0 120 120 0 1 1 0 87
                                              0 1 0 0 0 97 2 0 57 0 8 107 5 0
                                              57 0 8 31 31 35 106 5 0 57 0 104
                                              31 31 35 105 1 0 0 40 113 1 0 114
                                              0 119 2 0 57 0 8 111 2 0 54 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|GraphImage| 'NILADIC T) 
