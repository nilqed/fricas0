
(SDEFUN |TUBETOOL;point;4DfP;1|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) (|z| |DoubleFloat|)
         (|c| . #1=(|DoubleFloat|)) ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL
                (LETT |l| (LIST |x| |y| |z| |c|) |TUBETOOL;point;4DfP;1|)
                (QREFELT $ 8)))) 

(SDEFUN |TUBETOOL;getColor| ((|pt| |Point| (|DoubleFloat|)) ($ |DoubleFloat|))
        (COND
         ((SPADCALL (SPADCALL |pt| (QREFELT $ 12)) 3 (QREFELT $ 14))
          (SPADCALL |pt| (QREFELT $ 16)))
         ('T 0.0))) 

(SDEFUN |TUBETOOL;getColor2|
        ((|p0| |Point| (|DoubleFloat|)) (|p1| |Point| (|DoubleFloat|))
         ($ |DoubleFloat|))
        (COND
         ((SPADCALL (SPADCALL |p0| (QREFELT $ 12)) 3 (QREFELT $ 14))
          (SPADCALL |p0| (QREFELT $ 16)))
         ((SPADCALL (SPADCALL |p1| (QREFELT $ 12)) 3 (QREFELT $ 14))
          (SPADCALL |p1| (QREFELT $ 16)))
         ('T 0.0))) 

(SDEFUN |TUBETOOL;*;Df2P;4|
        ((|a| |DoubleFloat|) (|p| |Point| (|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| (|DoubleFloat|))))
               (SEQ
                (LETT |l|
                      (LIST (|mul_DF| |a| (SPADCALL |p| (QREFELT $ 17)))
                            (|mul_DF| |a| (SPADCALL |p| (QREFELT $ 18)))
                            (|mul_DF| |a| (SPADCALL |p| (QREFELT $ 19)))
                            (|TUBETOOL;getColor| |p| $))
                      |TUBETOOL;*;Df2P;4|)
                (EXIT (SPADCALL |l| (QREFELT $ 8)))))) 

(SDEFUN |TUBETOOL;+;3P;5|
        ((|p0| |Point| (|DoubleFloat|)) (|p1| |Point| (|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| (|DoubleFloat|))))
               (SEQ
                (LETT |l|
                      (LIST
                       (|add_DF| (SPADCALL |p0| (QREFELT $ 17))
                                 (SPADCALL |p1| (QREFELT $ 17)))
                       (|add_DF| (SPADCALL |p0| (QREFELT $ 18))
                                 (SPADCALL |p1| (QREFELT $ 18)))
                       (|add_DF| (SPADCALL |p0| (QREFELT $ 19))
                                 (SPADCALL |p1| (QREFELT $ 19)))
                       (|TUBETOOL;getColor2| |p0| |p1| $))
                      |TUBETOOL;+;3P;5|)
                (EXIT (SPADCALL |l| (QREFELT $ 8)))))) 

(SDEFUN |TUBETOOL;-;3P;6|
        ((|p0| |Point| (|DoubleFloat|)) (|p1| |Point| (|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| (|DoubleFloat|))))
               (SEQ
                (LETT |l|
                      (LIST
                       (|sub_DF| (SPADCALL |p0| (QREFELT $ 17))
                                 (SPADCALL |p1| (QREFELT $ 17)))
                       (|sub_DF| (SPADCALL |p0| (QREFELT $ 18))
                                 (SPADCALL |p1| (QREFELT $ 18)))
                       (|sub_DF| (SPADCALL |p0| (QREFELT $ 19))
                                 (SPADCALL |p1| (QREFELT $ 19)))
                       (|TUBETOOL;getColor2| |p0| |p1| $))
                      |TUBETOOL;-;3P;6|)
                (EXIT (SPADCALL |l| (QREFELT $ 8)))))) 

(SDEFUN |TUBETOOL;dot;2PDf;7|
        ((|p0| |Point| (|DoubleFloat|)) (|p1| |Point| (|DoubleFloat|))
         ($ |DoubleFloat|))
        (|add_DF|
         (|add_DF|
          (|mul_DF| (SPADCALL |p0| (QREFELT $ 17))
                    (SPADCALL |p1| (QREFELT $ 17)))
          (|mul_DF| (SPADCALL |p0| (QREFELT $ 18))
                    (SPADCALL |p1| (QREFELT $ 18))))
         (|mul_DF| (SPADCALL |p0| (QREFELT $ 19))
                   (SPADCALL |p1| (QREFELT $ 19))))) 

(SDEFUN |TUBETOOL;cross;3P;8|
        ((|p0| |Point| (|DoubleFloat|)) (|p1| |Point| (|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG
         ((|l| (|List| (|DoubleFloat|))) (|z1| #1=(|DoubleFloat|))
          (|y1| #2=(|DoubleFloat|)) (|x1| #3=(|DoubleFloat|)) (|z0| #1#)
          (|y0| #2#) (|x0| #3#))
         (SEQ
          (LETT |x0| (SPADCALL |p0| (QREFELT $ 17))
                . #4=(|TUBETOOL;cross;3P;8|))
          (LETT |y0| (SPADCALL |p0| (QREFELT $ 18)) . #4#)
          (LETT |z0| (SPADCALL |p0| (QREFELT $ 19)) . #4#)
          (LETT |x1| (SPADCALL |p1| (QREFELT $ 17)) . #4#)
          (LETT |y1| (SPADCALL |p1| (QREFELT $ 18)) . #4#)
          (LETT |z1| (SPADCALL |p1| (QREFELT $ 19)) . #4#)
          (LETT |l|
                (LIST (|sub_DF| (|mul_DF| |y0| |z1|) (|mul_DF| |y1| |z0|))
                      (|sub_DF| (|mul_DF| |z0| |x1|) (|mul_DF| |z1| |x0|))
                      (|sub_DF| (|mul_DF| |x0| |y1|) (|mul_DF| |x1| |y0|))
                      (|TUBETOOL;getColor2| |p0| |p1| $))
                . #4#)
          (EXIT (SPADCALL |l| (QREFELT $ 8)))))) 

(SDEFUN |TUBETOOL;unitVector;2P;9|
        ((|p| |Point| (|DoubleFloat|)) ($ |Point| (|DoubleFloat|)))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |p| |p| (QREFELT $ 23)) (QREFELT $ 25))
                   (QREFELT $ 26))
         |p| (QREFELT $ 20))) 

(SDEFUN |TUBETOOL;cosSinInfo;IL;10|
        ((|n| |Integer|) ($ |List| (|List| (|DoubleFloat|))))
        (SPROG
         ((|ans| (|List| (|List| (|DoubleFloat|)))) (|angle| (|DoubleFloat|))
          (#1=#:G736 NIL) (|i| NIL) (|theta| (|DoubleFloat|)))
         (SEQ (LETT |ans| NIL . #2=(|TUBETOOL;cosSinInfo;IL;10|))
              (LETT |theta|
                    (|div_DF_I|
                     (SPADCALL 2 (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                               (QREFELT $ 29))
                     |n|)
                    . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |angle| (SPADCALL |i| |theta| (QREFELT $ 31)) . #2#)
                    (EXIT
                     (LETT |ans|
                           (CONS (LIST (|cos_DF| |angle|) (|sin_DF| |angle|))
                                 |ans|)
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |TUBETOOL;loopPoints;3PDfLL;11|
        ((|ctr| |Point| (|DoubleFloat|)) (|pNorm| |Point| (|DoubleFloat|))
         (|bNorm| |Point| (|DoubleFloat|)) (|rad| |DoubleFloat|)
         (|cosSin| |List| (|List| (|DoubleFloat|)))
         ($ |List| (|Point| (|DoubleFloat|))))
        (SPROG
         ((|pt| (|Point| (|DoubleFloat|)))
          (|ans| (|List| (|Point| (|DoubleFloat|)))) (|sin| (|DoubleFloat|))
          (|cos| (|DoubleFloat|)) (|cossin| (|List| (|DoubleFloat|))))
         (SEQ (LETT |ans| NIL . #1=(|TUBETOOL;loopPoints;3PDfLL;11|))
              (SEQ G190 (COND ((NULL (NULL (NULL |cosSin|))) (GO G191)))
                   (SEQ (LETT |cossin| (|SPADfirst| |cosSin|) . #1#)
                        (LETT |cos| (|SPADfirst| |cossin|) . #1#)
                        (LETT |sin| (SPADCALL |cossin| (QREFELT $ 34)) . #1#)
                        (LETT |ans|
                              (CONS
                               (SPADCALL |ctr|
                                         (SPADCALL |rad|
                                                   (SPADCALL
                                                    (SPADCALL |cos| |pNorm|
                                                              (QREFELT $ 20))
                                                    (SPADCALL |sin| |bNorm|
                                                              (QREFELT $ 20))
                                                    (QREFELT $ 21))
                                                   (QREFELT $ 20))
                                         (QREFELT $ 21))
                               |ans|)
                              . #1#)
                        (EXIT (LETT |cosSin| (CDR |cosSin|) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |pt|
                    (SPADCALL |ctr| (SPADCALL |rad| |pNorm| (QREFELT $ 20))
                              (QREFELT $ 21))
                    . #1#)
              (EXIT (CONS |pt| (SPADCALL |ans| |pt| (QREFELT $ 36))))))) 

(DECLAIM (NOTINLINE |TubePlotTools;|)) 

(DEFUN |TubePlotTools| ()
  (SPROG NIL
         (PROG (#1=#:G753)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TubePlotTools|)
                    . #2=(|TubePlotTools|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TubePlotTools|
                             (LIST (CONS NIL (CONS 1 (|TubePlotTools;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|TubePlotTools|)))))))))) 

(DEFUN |TubePlotTools;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TubePlotTools|) . #1=(|TubePlotTools|))
          (LETT $ (GETREFV 38) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TubePlotTools| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TubePlotTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 9) (|Point| 9) (0 . |point|)
              (|DoubleFloat|) |TUBETOOL;point;4DfP;1| (|Integer|)
              (5 . |maxIndex|) (|Boolean|) (10 . >) (|PointPackage| 9)
              (16 . |color|) (21 . |xCoord|) (26 . |yCoord|) (31 . |zCoord|)
              |TUBETOOL;*;Df2P;4| |TUBETOOL;+;3P;5| |TUBETOOL;-;3P;6|
              |TUBETOOL;dot;2PDf;7| |TUBETOOL;cross;3P;8| (36 . |sqrt|)
              (41 . |inv|) |TUBETOOL;unitVector;2P;9| (|PositiveInteger|)
              (46 . *) (|NonNegativeInteger|) (52 . *) (|List| 6)
              |TUBETOOL;cosSinInfo;IL;10| (58 . |second|) (|List| 7)
              (63 . |concat|) |TUBETOOL;loopPoints;3PDfLL;11|)
           '#(|unitVector| 69 |point| 74 |loopPoints| 82 |dot| 91 |cross| 97
              |cosSinInfo| 103 - 108 + 114 * 120)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 37
                                                 '(1 7 0 6 8 1 7 11 0 12 2 11
                                                   13 0 0 14 1 15 9 7 16 1 15 9
                                                   7 17 1 15 9 7 18 1 15 9 7 19
                                                   1 9 0 0 25 1 9 0 0 26 2 9 0
                                                   28 0 29 2 9 0 30 0 31 1 6 9
                                                   0 34 2 35 0 0 7 36 1 0 7 7
                                                   27 4 0 7 9 9 9 9 10 5 0 35 7
                                                   7 7 9 32 37 2 0 9 7 7 23 2 0
                                                   7 7 7 24 1 0 32 11 33 2 0 7
                                                   7 7 22 2 0 7 7 7 21 2 0 7 9
                                                   7 20)))))
           '|lookupComplete|)) 

(MAKEPROP '|TubePlotTools| 'NILADIC T) 
