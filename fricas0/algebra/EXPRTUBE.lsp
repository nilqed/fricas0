
(SDEFUN |EXPRTUBE;getVariable|
        ((|x| |Expression| (|Integer|)) (|y| |Expression| (|Integer|))
         (|z| |Expression| (|Integer|)) ($ |Symbol|))
        (SPROG
         ((|t2| #1=(|Symbol|)) (|t1| #1#) (#2=#:G727 NIL)
          (|varList3| #3=(|List| (|Symbol|))) (|varList2| #3#)
          (|varList1| #3#))
         (SEQ
          (LETT |varList1| (SPADCALL |x| (QREFELT $ 8))
                . #4=(|EXPRTUBE;getVariable|))
          (LETT |varList2| (SPADCALL |y| (QREFELT $ 8)) . #4#)
          (LETT |varList3| (SPADCALL |z| (QREFELT $ 8)) . #4#)
          (COND
           ((SPADCALL (LENGTH |varList1|) 1 (QREFELT $ 12))
            (COND
             ((SPADCALL (LENGTH |varList2|) 1 (QREFELT $ 12))
              (COND
               ((NULL (SPADCALL (LENGTH |varList3|) 1 (QREFELT $ 12)))
                (EXIT
                 (|error| #5="tubePlot: only one variable may be used")))))
             (#6='T (EXIT (|error| #5#)))))
           (#6# (EXIT (|error| #5#))))
          (EXIT
           (COND
            ((NULL |varList1|)
             (COND
              ((NULL |varList2|)
               (COND
                ((NULL |varList3|)
                 (|error| "tubePlot: a variable must appear in functions"))
                (#6# (|SPADfirst| |varList3|))))
              (#6#
               (SEQ (LETT |t2| (|SPADfirst| |varList2|) . #4#)
                    (EXIT
                     (COND ((NULL |varList3|) |t2|)
                           (#6#
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL (EQUAL (|SPADfirst| |varList3|) |t2|))
                                (PROGN
                                 (LETT #2#
                                       (|error|
                                        "tubePlot: only one variable may be used")
                                       . #4#)
                                 (GO #7=#:G717)))))
                             #7# (EXIT #2#)))))))))
            (#6#
             (SEQ (LETT |t1| (|SPADfirst| |varList1|) . #4#)
                  (EXIT
                   (COND
                    ((NULL |varList2|)
                     (COND
                      ((OR (NULL |varList3|)
                           (NULL (NULL (EQUAL (|SPADfirst| |varList3|) |t1|))))
                       |t1|)
                      ('T
                       (|error| "tubePlot: only one variable may be used"))))
                    (#6#
                     (SEQ (LETT |t2| (|SPADfirst| |varList2|) . #4#)
                          (EXIT
                           (COND
                            ((NULL |varList3|)
                             (COND ((EQUAL |t1| |t2|) |t1|)
                                   (#6#
                                    (|error|
                                     "tubePlot: only one variable may be used"))))
                            (#6#
                             (SEQ
                              (COND
                               ((EQUAL (|SPADfirst| |varList3|) |t1|)
                                (COND
                                 ((NULL (EQUAL |t2| |t1|))
                                  (EXIT
                                   (|error|
                                    #8="tubePlot: only one variable may be used")))))
                               (#6# (EXIT (|error| #8#))))
                              (EXIT |t1|)))))))))))))))) 

(SDEFUN |EXPRTUBE;tubePlot;3EMSMISTp;2|
        ((|x| |Expression| (|Integer|)) (|y| |Expression| (|Integer|))
         (|z| |Expression| (|Integer|))
         (|colorFcn| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         (|radFcn| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|n| |Integer|)
         (|string| |String|) ($ |TubePlot| (|Plot3D|)))
        (SPROG
         ((|loopList| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|lps| (|List| (|Point| (|DoubleFloat|))))
          (|bNorm| #1=(|Point| (|DoubleFloat|)))
          (|bNormList| (|List| #2=(|DoubleFloat|))) (|pNorm| #1#)
          (|pNormList| (|List| #2#))
          (|curvePts| (|List| (|Point| (|DoubleFloat|))))
          (|ctr| (|Point| (|DoubleFloat|))) (|tvals| (|List| (|DoubleFloat|)))
          (|tval| (|DoubleFloat|)) (|cosSin| (|List| (|List| (|DoubleFloat|))))
          (|parPlot| (|Plot3D|))
          (|BzFunc| #3=(|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
          (|ByFunc| #3#) (|BxFunc| #3#) (|Bz| #4=(|Expression| (|Integer|)))
          (|By| #4#) (|Bx| #4#) (|NzFunc| #3#) (|NyFunc| #3#) (|NxFunc| #3#)
          (|Nz| #5=(|Expression| (|Integer|))) (|Ny| #5#) (|Nx| #5#)
          (K #6=(|Expression| (|Integer|)))
          (|Tzp| #7=(|Expression| (|Integer|))) (|Typ| #7#) (|Txp| #7#)
          (|Tz| #5#) (|Ty| #5#) (|Tx| #5#) (|sp| #6#) (|zp| #7#) (|yp| #7#)
          (|xp| #7#) (|zFunc| #3#) (|yFunc| #3#) (|xFunc| #3#) (|t| (|Symbol|))
          (|flag| (|Boolean|)))
         (SEQ
          (COND ((< |n| 3) (|error| "tubePlot: n should be at least 3"))
                (#8='T
                 (SEQ
                  (LETT |flag|
                        (COND ((EQUAL |string| "closed") 'T)
                              ((EQUAL |string| "open") NIL)
                              (#8#
                               (|error|
                                "tubePlot: last argument should be open or closed")))
                        . #9=(|EXPRTUBE;tubePlot;3EMSMISTp;2|))
                  (LETT |t| (|EXPRTUBE;getVariable| |x| |y| |z| $) . #9#)
                  (LETT |xFunc| (SPADCALL |x| |t| (QREFELT $ 16)) . #9#)
                  (LETT |yFunc| (SPADCALL |y| |t| (QREFELT $ 16)) . #9#)
                  (LETT |zFunc| (SPADCALL |z| |t| (QREFELT $ 16)) . #9#)
                  (LETT |xp| (SPADCALL |x| |t| (QREFELT $ 17)) . #9#)
                  (LETT |yp| (SPADCALL |y| |t| (QREFELT $ 17)) . #9#)
                  (LETT |zp| (SPADCALL |z| |t| (QREFELT $ 17)) . #9#)
                  (LETT |sp|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |xp| 2 (QREFELT $ 19))
                                    (SPADCALL |yp| 2 (QREFELT $ 19))
                                    (QREFELT $ 20))
                          (SPADCALL |zp| 2 (QREFELT $ 19)) (QREFELT $ 20))
                         (QREFELT $ 21))
                        . #9#)
                  (LETT |Tx| (SPADCALL |xp| |sp| (QREFELT $ 22)) . #9#)
                  (LETT |Ty| (SPADCALL |yp| |sp| (QREFELT $ 22)) . #9#)
                  (LETT |Tz| (SPADCALL |zp| |sp| (QREFELT $ 22)) . #9#)
                  (LETT |Txp| (SPADCALL |Tx| |t| (QREFELT $ 17)) . #9#)
                  (LETT |Typ| (SPADCALL |Ty| |t| (QREFELT $ 17)) . #9#)
                  (LETT |Tzp| (SPADCALL |Tz| |t| (QREFELT $ 17)) . #9#)
                  (LETT K
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |Txp| 2 (QREFELT $ 19))
                                    (SPADCALL |Typ| 2 (QREFELT $ 19))
                                    (QREFELT $ 20))
                          (SPADCALL |Tzp| 2 (QREFELT $ 19)) (QREFELT $ 20))
                         (QREFELT $ 21))
                        . #9#)
                  (LETT |Nx| (SPADCALL |Txp| K (QREFELT $ 22)) . #9#)
                  (LETT |Ny| (SPADCALL |Typ| K (QREFELT $ 22)) . #9#)
                  (LETT |Nz| (SPADCALL |Tzp| K (QREFELT $ 22)) . #9#)
                  (LETT |NxFunc| (SPADCALL |Nx| |t| (QREFELT $ 16)) . #9#)
                  (LETT |NyFunc| (SPADCALL |Ny| |t| (QREFELT $ 16)) . #9#)
                  (LETT |NzFunc| (SPADCALL |Nz| |t| (QREFELT $ 16)) . #9#)
                  (LETT |Bx|
                        (SPADCALL (SPADCALL |Ty| |Nz| (QREFELT $ 23))
                                  (SPADCALL |Tz| |Ny| (QREFELT $ 23))
                                  (QREFELT $ 24))
                        . #9#)
                  (LETT |By|
                        (SPADCALL (SPADCALL |Tz| |Nx| (QREFELT $ 23))
                                  (SPADCALL |Tx| |Nz| (QREFELT $ 23))
                                  (QREFELT $ 24))
                        . #9#)
                  (LETT |Bz|
                        (SPADCALL (SPADCALL |Tx| |Ny| (QREFELT $ 23))
                                  (SPADCALL |Ty| |Nx| (QREFELT $ 23))
                                  (QREFELT $ 24))
                        . #9#)
                  (LETT |BxFunc| (SPADCALL |Bx| |t| (QREFELT $ 16)) . #9#)
                  (LETT |ByFunc| (SPADCALL |By| |t| (QREFELT $ 16)) . #9#)
                  (LETT |BzFunc| (SPADCALL |Bz| |t| (QREFELT $ 16)) . #9#)
                  (LETT |parPlot|
                        (SPADCALL |xFunc| |yFunc| |zFunc| |colorFcn| |tRange|
                                  (QREFELT $ 27))
                        . #9#)
                  (LETT |tvals|
                        (|SPADfirst| (SPADCALL |parPlot| (QREFELT $ 29)))
                        . #9#)
                  (LETT |curvePts|
                        (|SPADfirst| (SPADCALL |parPlot| (QREFELT $ 31)))
                        . #9#)
                  (LETT |cosSin| (SPADCALL |n| (QREFELT $ 34)) . #9#)
                  (LETT |loopList| NIL . #9#)
                  (SEQ G190 (COND ((NULL |tvals|) (GO G191)))
                       (SEQ (LETT |tval| (|SPADfirst| |tvals|) . #9#)
                            (LETT |tvals| (CDR |tvals|) . #9#)
                            (LETT |ctr| (|SPADfirst| |curvePts|) . #9#)
                            (LETT |curvePts| (CDR |curvePts|) . #9#)
                            (LETT |pNormList|
                                  (LIST (SPADCALL |tval| |NxFunc|)
                                        (SPADCALL |tval| |NyFunc|)
                                        (SPADCALL |tval| |NzFunc|)
                                        (SPADCALL |tval| |colorFcn|))
                                  . #9#)
                            (LETT |pNorm| (SPADCALL |pNormList| (QREFELT $ 37))
                                  . #9#)
                            (LETT |bNormList|
                                  (LIST (SPADCALL |tval| |BxFunc|)
                                        (SPADCALL |tval| |ByFunc|)
                                        (SPADCALL |tval| |BzFunc|)
                                        (SPADCALL |tval| |colorFcn|))
                                  . #9#)
                            (LETT |bNorm| (SPADCALL |bNormList| (QREFELT $ 37))
                                  . #9#)
                            (LETT |lps|
                                  (SPADCALL |ctr| |pNorm| |bNorm|
                                            (SPADCALL |tval| |radFcn|) |cosSin|
                                            (QREFELT $ 40))
                                  . #9#)
                            (EXIT
                             (LETT |loopList| (CONS |lps| |loopList|) . #9#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL |parPlot| (NREVERSE |loopList|) |flag|
                             (QREFELT $ 42))))))))) 

(SDEFUN |EXPRTUBE;tubePlot;3EMSMITp;3|
        ((|x| |Expression| (|Integer|)) (|y| |Expression| (|Integer|))
         (|z| |Expression| (|Integer|))
         (|colorFcn| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         (|radFcn| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|n| |Integer|)
         ($ |TubePlot| (|Plot3D|)))
        (SPADCALL |x| |y| |z| |colorFcn| |tRange| |radFcn| |n| "open"
                  (QREFELT $ 44))) 

(PUT '|EXPRTUBE;project| '|SPADreplace| '(XLAM (|x| |y|) |x|)) 

(SDEFUN |EXPRTUBE;project|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) ($ |DoubleFloat|)) |x|) 

(SDEFUN |EXPRTUBE;constantToUnaryFunction;DfM;5|
        ((|x| |DoubleFloat|) ($ |Mapping| (|DoubleFloat|) (|DoubleFloat|)))
        (SPROG NIL
               (CONS #'|EXPRTUBE;constantToUnaryFunction;DfM;5!0|
                     (VECTOR $ |x|)))) 

(SDEFUN |EXPRTUBE;constantToUnaryFunction;DfM;5!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1)
                . #1=(|EXPRTUBE;constantToUnaryFunction;DfM;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EXPRTUBE;project| |x| |s| $))))) 

(SDEFUN |EXPRTUBE;tubePlot;3EMSDfISTp;6|
        ((|x| |Expression| (|Integer|)) (|y| |Expression| (|Integer|))
         (|z| |Expression| (|Integer|))
         (|colorFcn| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) (|rad| |DoubleFloat|)
         (|n| |Integer|) (|s| |String|) ($ |TubePlot| (|Plot3D|)))
        (SPADCALL |x| |y| |z| |colorFcn| |tRange|
                  (SPADCALL |rad| (QREFELT $ 46)) |n| |s| (QREFELT $ 44))) 

(SDEFUN |EXPRTUBE;tubePlot;3EMSDfITp;7|
        ((|x| |Expression| (|Integer|)) (|y| |Expression| (|Integer|))
         (|z| |Expression| (|Integer|))
         (|colorFcn| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) (|rad| |DoubleFloat|)
         (|n| |Integer|) ($ |TubePlot| (|Plot3D|)))
        (SPADCALL |x| |y| |z| |colorFcn| |tRange| |rad| |n| "open"
                  (QREFELT $ 47))) 

(DECLAIM (NOTINLINE |ExpressionTubePlot;|)) 

(DEFUN |ExpressionTubePlot| ()
  (SPROG NIL
         (PROG (#1=#:G752)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ExpressionTubePlot|)
                    . #2=(|ExpressionTubePlot|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ExpressionTubePlot|
                             (LIST
                              (CONS NIL (CONS 1 (|ExpressionTubePlot;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ExpressionTubePlot|)))))))))) 

(DEFUN |ExpressionTubePlot;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ExpressionTubePlot|) . #1=(|ExpressionTubePlot|))
          (LETT $ (GETREFV 49) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionTubePlot| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ExpressionTubePlot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 14) (|Expression| 32)
              (0 . |variables|) (5 . |One|) (|Boolean|) (|NonNegativeInteger|)
              (9 . <=) (|Mapping| 39 39) (|Symbol|)
              (|MakeFloatCompiledFunction| 7) (15 . |makeFloatFunction|)
              (21 . |differentiate|) (|PositiveInteger|) (27 . ^) (33 . +)
              (39 . |sqrt|) (44 . /) (50 . *) (56 . -) (|Segment| 39)
              (|Plot3D|) (62 . |plot|) (|List| 35) (71 . |tValues|) (|List| 38)
              (76 . |listBranches|) (|Integer|) (|TubePlotTools|)
              (81 . |cosSinInfo|) (|List| 39) (|Point| 39) (86 . |point|)
              (|List| 36) (|DoubleFloat|) (91 . |loopPoints|) (|TubePlot| 26)
              (100 . |tube|) (|String|) |EXPRTUBE;tubePlot;3EMSMISTp;2|
              |EXPRTUBE;tubePlot;3EMSMITp;3|
              |EXPRTUBE;constantToUnaryFunction;DfM;5|
              |EXPRTUBE;tubePlot;3EMSDfISTp;6| |EXPRTUBE;tubePlot;3EMSDfITp;7|)
           '#(|tubePlot| 107 |constantToUnaryFunction| 153) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 48
                                                 '(1 7 6 0 8 0 7 0 9 2 11 10 0
                                                   0 12 2 15 13 7 14 16 2 7 0 0
                                                   14 17 2 7 0 0 18 19 2 7 0 0
                                                   0 20 1 7 0 0 21 2 7 0 0 0 22
                                                   2 7 0 0 0 23 2 7 0 0 0 24 5
                                                   26 0 13 13 13 13 25 27 1 26
                                                   28 0 29 1 26 30 0 31 1 33 28
                                                   32 34 1 36 0 35 37 5 33 38
                                                   36 36 36 39 28 40 3 41 0 26
                                                   30 10 42 7 0 41 7 7 7 13 25
                                                   13 32 45 8 0 41 7 7 7 13 25
                                                   13 32 43 44 8 0 41 7 7 7 13
                                                   25 39 32 43 47 7 0 41 7 7 7
                                                   13 25 39 32 48 1 0 13 39
                                                   46)))))
           '|lookupComplete|)) 

(MAKEPROP '|ExpressionTubePlot| 'NILADIC T) 
