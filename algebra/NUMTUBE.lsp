
(SDEFUN |NUMTUBE;colinearity|
        ((|x| |Point| (|DoubleFloat|)) (|y| |Point| (|DoubleFloat|))
         ($ |DoubleFloat|))
        (|div_DF| (|expt_DF_I| (SPADCALL |x| |y| (QREFELT $ 23)) 2)
                  (|mul_DF| (SPADCALL |x| |x| (QREFELT $ 23))
                            (SPADCALL |y| |y| (QREFELT $ 23))))) 

(SDEFUN |NUMTUBE;orthog|
        ((|x| |Point| (|DoubleFloat|)) (|y| |Point| (|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|a| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((SPADCALL (|NUMTUBE;colinearity| |x| |y| $) (QREFELT $ 13)
                            (QREFELT $ 25))
                  (LETT |y| (QREFELT $ 22))))
                (COND
                 ((SPADCALL (|NUMTUBE;colinearity| |x| |y| $) (QREFELT $ 13)
                            (QREFELT $ 25))
                  (LETT |y|
                        (COND
                         ((|less_DF|
                           (|NUMTUBE;colinearity| |x| (QREFELT $ 18) $)
                           (QREFELT $ 13))
                          (QREFELT $ 18))
                         ('T (QREFELT $ 20))))))
                (LETT |a|
                      (|minus_DF|
                       (|div_DF| (SPADCALL |x| |y| (QREFELT $ 23))
                                 (SPADCALL |x| |x| (QREFELT $ 23)))))
                (EXIT
                 (SETELT $ 22
                         (SPADCALL (SPADCALL |a| |x| (QREFELT $ 26)) |y|
                                   (QREFELT $ 27))))))) 

(SDEFUN |NUMTUBE;poTriad|
        ((|pl| |Point| (|DoubleFloat|)) (|po| |Point| (|DoubleFloat|))
         (|pr| |Point| (|DoubleFloat|))
         ($ |Record| (|:| |tang| (|Point| (|DoubleFloat|)))
          (|:| |norm| (|Point| (|DoubleFloat|)))
          (|:| |bin| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|n| #1=(|Point| (|DoubleFloat|))) (|pol| (|Point| (|DoubleFloat|)))
          (|t| #1#))
         (SEQ
          (LETT |t|
                (SPADCALL (SPADCALL |pr| |pl| (QREFELT $ 28)) (QREFELT $ 29)))
          (LETT |pol| (SPADCALL |pl| |po| (QREFELT $ 28)))
          (LETT |n| (SPADCALL (|NUMTUBE;orthog| |t| |pol| $) (QREFELT $ 29)))
          (EXIT (VECTOR |t| |n| (SPADCALL |t| |n| (QREFELT $ 30))))))) 

(SDEFUN |NUMTUBE;curveTriads|
        ((|l| |List| (|Point| (|DoubleFloat|)))
         ($ |List|
          #1=(|Record| (|:| |tang| (|Point| (|DoubleFloat|)))
                       (|:| |norm| (|Point| (|DoubleFloat|)))
                       (|:| |bin| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|endtriad| #1#) (|n| #2=(|Point| (|DoubleFloat|))) (|t| #2#)
          (|x|
           (|Record| (|:| |tang| (|Point| (|DoubleFloat|)))
                     (|:| |norm| (|Point| (|DoubleFloat|)))
                     (|:| |bin| (|Point| (|DoubleFloat|)))))
          (|begtriad| #1#)
          (|midtriads|
           (|List|
            (|Record| (|:| |tang| (|Point| (|DoubleFloat|)))
                      (|:| |norm| (|Point| (|DoubleFloat|)))
                      (|:| |bin| (|Point| (|DoubleFloat|))))))
          (#3=#:G399 NIL) (|pl| NIL) (#4=#:G400 NIL) (|po| NIL) (#5=#:G401 NIL)
          (|pr| NIL) (#6=#:G398 NIL) (|triad| #1#)
          (|b| (|Point| (|DoubleFloat|))) (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND
                ((< |k| 2)
                 (|error| "Need at least 2 points to specify a curve"))
                (#7='T
                 (SEQ (SETELT $ 22 (QREFELT $ 21))
                      (EXIT
                       (COND
                        ((EQL |k| 2)
                         (SEQ
                          (LETT |t|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 32))
                                           (|SPADfirst| |l|) (QREFELT $ 28))
                                 (QREFELT $ 29)))
                          (LETT |n|
                                (SPADCALL
                                 (SPADCALL |t| (QREFELT $ 18) (QREFELT $ 28))
                                 (QREFELT $ 29)))
                          (LETT |b| (SPADCALL |t| |n| (QREFELT $ 30)))
                          (LETT |triad| (VECTOR |t| |n| |b|))
                          (EXIT (LIST |triad| |triad|))))
                        (#7#
                         (SEQ
                          (LETT |midtriads|
                                (PROGN
                                 (LETT #6# NIL)
                                 (SEQ (LETT |pr| NIL)
                                      (LETT #5# (CDR (CDR |l|)))
                                      (LETT |po| NIL) (LETT #4# (CDR |l|))
                                      (LETT |pl| NIL) (LETT #3# |l|) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN (LETT |pl| (CAR #3#)) NIL)
                                            (ATOM #4#)
                                            (PROGN (LETT |po| (CAR #4#)) NIL)
                                            (ATOM #5#)
                                            (PROGN (LETT |pr| (CAR #5#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #6#
                                              (CONS
                                               (|NUMTUBE;poTriad| |pl| |po|
                                                |pr| $)
                                               #6#))))
                                      (LETT #3#
                                            (PROG1 (CDR #3#)
                                              (LETT #4#
                                                    (PROG1 (CDR #4#)
                                                      (LETT #5# (CDR #5#))))))
                                      (GO G190) G191 (EXIT (NREVERSE #6#)))))
                          (LETT |x| (|SPADfirst| |midtriads|))
                          (LETT |t|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 32))
                                           (|SPADfirst| |l|) (QREFELT $ 28))
                                 (QREFELT $ 29)))
                          (LETT |n|
                                (SPADCALL
                                 (|NUMTUBE;orthog| |t| (QVELT |x| 1) $)
                                 (QREFELT $ 29)))
                          (LETT |begtriad|
                                (VECTOR |t| |n|
                                        (SPADCALL |t| |n| (QREFELT $ 30))))
                          (LETT |x| (SPADCALL |midtriads| (QREFELT $ 35)))
                          (LETT |t|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| |k| (QREFELT $ 36))
                                           (SPADCALL |l| (- |k| 1)
                                                     (QREFELT $ 36))
                                           (QREFELT $ 28))
                                 (QREFELT $ 29)))
                          (LETT |n|
                                (SPADCALL
                                 (|NUMTUBE;orthog| |t| (QVELT |x| 1) $)
                                 (QREFELT $ 29)))
                          (LETT |endtriad|
                                (VECTOR |t| |n|
                                        (SPADCALL |t| |n| (QREFELT $ 30))))
                          (EXIT
                           (CONS |begtriad|
                                 (SPADCALL |midtriads| |endtriad|
                                           (QREFELT $ 37))))))))))))))) 

(SDEFUN |NUMTUBE;curveLoops|
        ((|pts| |List| (|Point| (|DoubleFloat|))) (|r| |DoubleFloat|)
         (|nn| |Integer|) ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|loops| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|b| #1=(|Point| (|DoubleFloat|))) (|n| #2=(|Point| (|DoubleFloat|)))
          (#3=#:G407 NIL) (|pt| NIL) (#4=#:G408 NIL) (|triad| NIL)
          (|cosSin| (|List| (|List| (|DoubleFloat|))))
          (|triads|
           (|List|
            (|Record| (|:| |tang| (|Point| (|DoubleFloat|))) (|:| |norm| #2#)
                      (|:| |bin| #1#)))))
         (SEQ (LETT |triads| (|NUMTUBE;curveTriads| |pts| $))
              (LETT |cosSin| (SPADCALL |nn| (QREFELT $ 39))) (LETT |loops| NIL)
              (SEQ (LETT |triad| NIL) (LETT #4# |triads|) (LETT |pt| NIL)
                   (LETT #3# |pts|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |pt| (CAR #3#)) NIL)
                         (ATOM #4#) (PROGN (LETT |triad| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |n| (QVELT |triad| 1))
                        (LETT |b| (QVELT |triad| 2))
                        (EXIT
                         (LETT |loops|
                               (CONS
                                (SPADCALL |pt| |n| |b| |r| |cosSin|
                                          (QREFELT $ 40))
                                |loops|))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (NREVERSE |loops|))))) 

(SDEFUN |NUMTUBE;tube;CurveDfITp;6|
        ((|curve| |Curve|) (|r| |DoubleFloat|) (|n| |Integer|)
         ($ |TubePlot| |Curve|))
        (SPROG
         ((|loops| (|List| (|List| (|Point| (|DoubleFloat|))))) (#1=#:G412 NIL)
          (|bran| NIL) (|brans| (|List| (|List| (|Point| (|DoubleFloat|))))))
         (SEQ
          (COND ((< |n| 3) (|error| "tube: n should be at least 3"))
                ('T
                 (SEQ (LETT |brans| (SPADCALL |curve| (QREFELT $ 42)))
                      (LETT |loops| NIL)
                      (SEQ (LETT |bran| NIL) (LETT #1# |brans|) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |bran| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |loops|
                                   (SPADCALL |loops|
                                             (|NUMTUBE;curveLoops| |bran| |r|
                                              |n| $)
                                             (QREFELT $ 43)))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL |curve| |loops| NIL (QREFELT $ 45))))))))) 

(DECLAIM (NOTINLINE |NumericTubePlot;|)) 

(DEFUN |NumericTubePlot| (#1=#:G413)
  (SPROG NIL
         (PROG (#2=#:G414)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NumericTubePlot|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|NumericTubePlot;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NumericTubePlot|)))))))))) 

(DEFUN |NumericTubePlot;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|NumericTubePlot| DV$1))
          (LETT $ (GETREFV 47))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NumericTubePlot| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 13
                    (SPADCALL (SPADCALL 995 -3 10 (QREFELT $ 10))
                              (QREFELT $ 12)))
          (QSETREFV $ 18 (SPADCALL 1.0 0.0 0.0 0.0 (QREFELT $ 17)))
          (QSETREFV $ 20 (SPADCALL 0.0 1.0 0.0 0.0 (QREFELT $ 17)))
          (QSETREFV $ 21 (SPADCALL 1.0 1.0 0.0 0.0 (QREFELT $ 17)))
          (QSETREFV $ 22 (QREFELT $ 21))
          $))) 

(MAKEPROP '|NumericTubePlot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              (|PositiveInteger|) (|Float|) (0 . |float|) (|DoubleFloat|)
              (7 . |convert|) 'LINMAX (12 . |One|) (|Point| 11)
              (|TubePlotTools|) (16 . |point|) 'XHAT (24 . |Zero|) 'YHAT 'PREV0
              'PREV (28 . |dot|) (|Boolean|) (34 . >) (40 . *) (46 . +)
              (52 . -) (58 . |unitVector|) (63 . |cross|) (|List| 15)
              (69 . |second|)
              (|Record| (|:| |tang| 15) (|:| |norm| 15) (|:| |bin| 15))
              (|List| 33) (74 . |last|) (79 . |elt|) (85 . |concat|)
              (|List| (|List| 11)) (91 . |cosSinInfo|) (96 . |loopPoints|)
              (|List| 31) (105 . |listBranches|) (110 . |concat|)
              (|TubePlot| 6) (116 . |tube|) |NUMTUBE;tube;CurveDfITp;6|)
           '#(|tube| 123) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|tube|
                                 ((|TubePlot| |#1|) |#1| (|DoubleFloat|)
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 46
                                            '(3 9 0 7 7 8 10 1 9 11 0 12 0 9 0
                                              14 4 16 15 11 11 11 11 17 0 9 0
                                              19 2 16 11 15 15 23 2 11 24 0 0
                                              25 2 16 15 11 15 26 2 16 15 15 15
                                              27 2 16 15 15 15 28 1 16 15 15 29
                                              2 16 15 15 15 30 1 31 15 0 32 1
                                              34 33 0 35 2 31 15 0 7 36 2 34 0
                                              0 33 37 1 16 38 7 39 5 16 31 15
                                              15 15 11 38 40 1 6 41 0 42 2 41 0
                                              0 0 43 3 44 0 6 41 24 45 3 0 44 6
                                              11 7 46)))))
           '|lookupComplete|)) 
