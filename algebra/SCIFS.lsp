
(PUT '|SCIFS;indexes;$L;1| '|SPADreplace| 'QCAR) 

(SDEFUN |SCIFS;indexes;$L;1|
        ((|me| $) ($ |List| (|List| (|NonNegativeInteger|)))) (QCAR |me|)) 

(PUT '|SCIFS;pointList;$L;2| '|SPADreplace| 'QCDR) 

(SDEFUN |SCIFS;pointList;$L;2| ((|me| $) ($ |List| PT)) (QCDR |me|)) 

(SDEFUN |SCIFS;meshIndex|
        ((|i| |Integer|) (|j| |Integer|) (|c| |Integer|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G389 NIL))
               (PROG1 (LETT #1# (+ (* |j| |c|) |i|))
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |SCIFS;smesh;LB$;4|
        ((|ptin| |List| (|List| PT)) (|clos| |Boolean|) ($ $))
        (SPROG
         ((|j| #1=(|NonNegativeInteger|))
          (|in2| (|List| (|List| (|NonNegativeInteger|))))
          (|thisLine| (|List| (|NonNegativeInteger|))) (|i| #1#)
          (|pt2| (|List| PT)) (#2=#:G400 NIL) (|p| NIL) (#3=#:G399 NIL)
          (|lpt| NIL) (|colLength| (|NonNegativeInteger|))
          (|rowLength| (|NonNegativeInteger|)))
         (SEQ (LETT |pt2| NIL) (LETT |in2| NIL)
              (LETT |rowLength| (LENGTH |ptin|))
              (LETT |colLength| (LENGTH (|SPADfirst| |ptin|))) (LETT |j| 0)
              (SEQ (LETT |lpt| NIL) (LETT #3# |ptin|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |lpt| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |i| 0)
                        (SEQ (LETT |p| NIL) (LETT #2# |lpt|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |pt2| (SPADCALL |pt2| |p| (QREFELT $ 12)))
                              (COND
                               ((> |i| 0)
                                (COND
                                 ((> |j| 0)
                                  (SEQ
                                   (LETT |thisLine|
                                         (LIST
                                          (|SCIFS;meshIndex| (- |i| 1)
                                           (- |j| 1) |colLength| $)
                                          (|SCIFS;meshIndex| |i| (- |j| 1)
                                           |colLength| $)
                                          (|SCIFS;meshIndex| |i| |j|
                                           |colLength| $)
                                          (|SCIFS;meshIndex| (- |i| 1) |j|
                                           |colLength| $)))
                                   (EXIT
                                    (LETT |in2|
                                          (SPADCALL |in2| |thisLine|
                                                    (QREFELT $ 14)))))))))
                              (EXIT (LETT |i| (+ |i| 1))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (COND
                         (|clos|
                          (COND
                           ((> |j| 0)
                            (SEQ
                             (LETT |thisLine|
                                   (LIST
                                    (|SCIFS;meshIndex| (- |i| 1) (- |j| 1)
                                     |colLength| $)
                                    (|SCIFS;meshIndex| 0 (- |j| 1) |colLength|
                                     $)
                                    (|SCIFS;meshIndex| 0 |j| |colLength| $)
                                    (|SCIFS;meshIndex| (- |i| 1) |j|
                                     |colLength| $)))
                             (EXIT
                              (LETT |in2|
                                    (SPADCALL |in2| |thisLine|
                                              (QREFELT $ 14)))))))))
                        (EXIT (LETT |j| (+ |j| 1))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |in2| |pt2|))))) 

(SDEFUN |SCIFS;singleFace;L$;5| ((|ptin| |List| PT) ($ $))
        (SPROG
         ((|in2| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G405 NIL)
          (|i| NIL) (#2=#:G404 NIL) (|pt2| (|List| PT)))
         (SEQ (LETT |pt2| |ptin|)
              (LETT |in2|
                    (LIST
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| 0) (LETT #1# (- (LENGTH |ptin|) 1)) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ (EXIT (LETT #2# (CONS |i| #2#))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))
              (EXIT (CONS |in2| |pt2|))))) 

(SDEFUN |SCIFS;subdivide;2$;6| ((|me| $) ($ $))
        (SPROG
         ((|indexSize| (|NonNegativeInteger|))
          (|in2| (|List| (|List| (|NonNegativeInteger|))))
          (|indexPos| (|NonNegativeInteger|))
          (|newFace| (|List| (|NonNegativeInteger|))) (#1=#:G422 NIL) (|j| NIL)
          (#2=#:G421 NIL) (#3=#:G420 NIL) (|ptIx| NIL) (|pt2| (|List| PT))
          (|newPt| (PT)) (#4=#:G419 NIL) (#5=#:G418 NIL) (|faceIx| NIL)
          (#6=#:G417 NIL) (|i| NIL) (#7=#:G416 NIL))
         (SEQ (LETT |indexSize| (LENGTH (QCDR |me|)))
              (LETT |pt2|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |i| 1) (LETT #6# |indexSize|) G190
                          (COND ((|greater_SI| |i| #6#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (QCDR |me|) |i| (QREFELT $ 20))
                                   #7#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |in2| NIL)
              (SEQ (LETT |faceIx| NIL) (LETT #5# (QCAR |me|)) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |faceIx| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |newPt| (SPADCALL 0 0 0 (QREFELT $ 21)))
                        (SEQ (LETT |ptIx| NIL) (LETT #4# |faceIx|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |ptIx| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |newPt|
                                     (SPADCALL |newPt|
                                               (SPADCALL |pt2| (+ |ptIx| 1)
                                                         (QREFELT $ 20))
                                               (QREFELT $ 22)))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (LETT |newPt|
                              (SPADCALL
                               (|div_DF_I| 1.0
                                           (SPADCALL |faceIx| (QREFELT $ 24)))
                               |newPt| (QREFELT $ 26)))
                        (LETT |pt2| (SPADCALL |pt2| |newPt| (QREFELT $ 12)))
                        (LETT |indexPos| 1)
                        (SEQ (LETT |ptIx| NIL) (LETT #3# |faceIx|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |ptIx| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |newFace|
                                    (PROGN
                                     (LETT #2# NIL)
                                     (SEQ (LETT |j| 1)
                                          (LETT #1#
                                                (SPADCALL |faceIx|
                                                          (QREFELT $ 24)))
                                          G190
                                          (COND
                                           ((|greater_SI| |j| #1#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (SPADCALL |faceIx| |j|
                                                             (QREFELT $ 27))
                                                   #2#))))
                                          (LETT |j| (|inc_SI| |j|)) (GO G190)
                                          G191 (EXIT (NREVERSE #2#)))))
                              (SPADCALL |newFace| |indexPos| |indexSize|
                                        (QREFELT $ 28))
                              (LETT |indexPos| (+ |indexPos| 1))
                              (EXIT
                               (LETT |in2|
                                     (SPADCALL |in2| |newFace|
                                               (QREFELT $ 14)))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |indexSize| (+ |indexSize| 1))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |in2| |pt2|))))) 

(SDEFUN |SCIFS;sierpinskiDivide;$Nni$;7|
        ((|me| $) (|level| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G434 NIL) (#2=#:G437 NIL) (|indexSize| (|NonNegativeInteger|))
          (|in2| (|List| (|List| (|NonNegativeInteger|))))
          (|index2| (|NonNegativeInteger|)) (|index1| (|NonNegativeInteger|))
          (|newFace| (|List| #3=(|NonNegativeInteger|))) (|ix4| #3#)
          (|ix3| #3#) (#4=#:G442 NIL) (|offset| NIL) (#5=#:G427 NIL)
          (|pt2| (|List| PT)) (|newPt| (PT)) (|ix2| #3#)
          (|ix1| (|NonNegativeInteger|)) (#6=#:G441 NIL) (#7=#:G440 NIL)
          (|faceIx| NIL) (#8=#:G439 NIL) (|i| NIL) (#9=#:G438 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |indexSize| (LENGTH (QCDR |me|)))
                (LETT |pt2|
                      (PROGN
                       (LETT #9# NIL)
                       (SEQ (LETT |i| 1) (LETT #8# |indexSize|) G190
                            (COND ((|greater_SI| |i| #8#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #9#
                                    (CONS
                                     (SPADCALL (QCDR |me|) |i| (QREFELT $ 20))
                                     #9#))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT (NREVERSE #9#)))))
                (LETT |in2| NIL)
                (SEQ (LETT |faceIx| NIL) (LETT #7# (QCAR |me|)) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |faceIx| (CAR #7#)) NIL))
                       (GO G191)))
                     (SEQ
                      (SEQ (LETT |offset| 1)
                           (LETT #6# (SPADCALL |faceIx| (QREFELT $ 24))) G190
                           (COND ((|greater_SI| |offset| #6#) (GO G191)))
                           (SEQ (LETT |ix1| |offset|)
                                (LETT |ix2| (+ |offset| 1))
                                (COND
                                 ((> |ix2| (SPADCALL |faceIx| (QREFELT $ 24)))
                                  (LETT |ix2| 1)))
                                (LETT |newPt|
                                      (SPADCALL
                                       (SPADCALL |pt2|
                                                 (+
                                                  (SPADCALL |faceIx| |ix1|
                                                            (QREFELT $ 27))
                                                  1)
                                                 (QREFELT $ 20))
                                       (SPADCALL |pt2|
                                                 (+
                                                  (SPADCALL |faceIx| |ix2|
                                                            (QREFELT $ 27))
                                                  1)
                                                 (QREFELT $ 20))
                                       (QREFELT $ 22)))
                                (LETT |newPt|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 5 -1 10 (QREFELT $ 32))
                                        (QREFELT $ 33))
                                       |newPt| (QREFELT $ 26)))
                                (EXIT
                                 (LETT |pt2|
                                       (SPADCALL |pt2| |newPt|
                                                 (QREFELT $ 12)))))
                           (LETT |offset| (|inc_SI| |offset|)) (GO G190) G191
                           (EXIT NIL))
                      (LETT |index1|
                            (PROG1
                                (LETT #5#
                                      (- (SPADCALL |faceIx| (QREFELT $ 24)) 1))
                              (|check_subtype2| (>= #5# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #5#)))
                      (LETT |index2| 0)
                      (SEQ (LETT |offset| 1)
                           (LETT #4# (SPADCALL |faceIx| (QREFELT $ 24))) G190
                           (COND ((|greater_SI| |offset| #4#) (GO G191)))
                           (SEQ (LETT |ix3| (+ |indexSize| |index1|))
                                (LETT |ix4| (+ |indexSize| |index2|))
                                (LETT |newFace|
                                      (LIST
                                       (SPADCALL |faceIx| |offset|
                                                 (QREFELT $ 27))
                                       |ix3| |ix4|))
                                (LETT |index1| (+ |index1| 1))
                                (COND
                                 ((EQL |index1|
                                       (SPADCALL |faceIx| (QREFELT $ 24)))
                                  (LETT |index1| 0)))
                                (LETT |index2| (+ |index2| 1))
                                (COND
                                 ((EQL |index2|
                                       (SPADCALL |faceIx| (QREFELT $ 24)))
                                  (LETT |index2| 0)))
                                (EXIT
                                 (LETT |in2|
                                       (SPADCALL |in2| |newFace|
                                                 (QREFELT $ 14)))))
                           (LETT |offset| (|inc_SI| |offset|)) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (LETT |indexSize|
                             (+ |indexSize|
                                (SPADCALL |faceIx| (QREFELT $ 24))))))
                     (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |level| 1)
                  (PROGN (LETT #2# (CONS |in2| |pt2|)) (GO #10=#:G436))))
                (EXIT
                 (SPADCALL (CONS |in2| |pt2|)
                           (PROG1 (LETT #1# (- |level| 1))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 34)))))
          #10# (EXIT #2#)))) 

(SDEFUN |SCIFS;listBranches|
        ((|functions| |List|
          (|Record| (|:| |source| (|Mapping| PT (|DoubleFloat|)))
                    (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
                    (|:| |knots| (|List| (|DoubleFloat|)))
                    (|:| |points| (|List| PT))))
         ($ |List| (|List| PT)))
        (SPROG ((|outList| (|List| (|List| PT))) (#1=#:G447 NIL) (|curve| NIL))
               (SEQ (LETT |outList| NIL)
                    (SEQ (LETT |curve| NIL) (LETT #1# |functions|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |curve| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |outList|
                                 (CONS (QVELT |curve| 3) |outList|))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |outList|)))) 

(SDEFUN |SCIFS;orthog| ((|x| PT) (|y| PT) ($ PT))
        (SPROG ((|a| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| |y| (QREFELT $ 41)) (QREFELT $ 36)
                            (QREFELT $ 42))
                  (LETT |y| (QREFELT $ 40))))
                (COND
                 ((SPADCALL (SPADCALL |x| |y| (QREFELT $ 41)) (QREFELT $ 36)
                            (QREFELT $ 42))
                  (LETT |y|
                        (COND
                         ((|less_DF|
                           (SPADCALL |x| (QREFELT $ 37) (QREFELT $ 41))
                           (QREFELT $ 36))
                          (QREFELT $ 37))
                         ('T (QREFELT $ 38))))))
                (LETT |a|
                      (|minus_DF|
                       (|div_DF| (SPADCALL |x| |y| (QREFELT $ 43))
                                 (SPADCALL |x| |x| (QREFELT $ 43)))))
                (EXIT
                 (SETELT $ 40
                         (SPADCALL (SPADCALL |a| |x| (QREFELT $ 26)) |y|
                                   (QREFELT $ 22))))))) 

(SDEFUN |SCIFS;poTriad|
        ((|pl| PT) (|po| PT) (|pr| PT)
         ($ |Record| (|:| |tang| PT) (|:| |norm| PT) (|:| |bin| PT)))
        (SPROG ((|n| (PT)) (|pol| (PT)) (|t| (PT)))
               (SEQ
                (LETT |t|
                      (SPADCALL (SPADCALL |pr| |pl| (QREFELT $ 44))
                                (QREFELT $ 45)))
                (LETT |pol| (SPADCALL |pl| |po| (QREFELT $ 44)))
                (LETT |n|
                      (SPADCALL (|SCIFS;orthog| |t| |pol| $) (QREFELT $ 45)))
                (EXIT (VECTOR |t| |n| (SPADCALL |t| |n| (QREFELT $ 46))))))) 

(SDEFUN |SCIFS;curveTriads|
        ((|l| |List| PT)
         ($ |List| (|Record| (|:| |tang| PT) (|:| |norm| PT) (|:| |bin| PT))))
        (SPROG
         ((|endtriad|
           #1=(|Record| (|:| |tang| PT) (|:| |norm| PT) (|:| |bin| PT)))
          (|n| (PT)) (|t| (PT))
          (|x| (|Record| (|:| |tang| PT) (|:| |norm| PT) (|:| |bin| PT)))
          (|begtriad| #1#)
          (|midtriads|
           (|List| (|Record| (|:| |tang| PT) (|:| |norm| PT) (|:| |bin| PT))))
          (#2=#:G465 NIL) (|pl| NIL) (#3=#:G466 NIL) (|po| NIL) (#4=#:G467 NIL)
          (|pr| NIL) (#5=#:G464 NIL) (|triad| #1#) (|b| (PT))
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND
                ((< |k| 2)
                 (|error| "Need at least 2 points to specify a curve"))
                (#6='T
                 (SEQ (SETELT $ 40 (QREFELT $ 39))
                      (EXIT
                       (COND
                        ((EQL |k| 2)
                         (SEQ
                          (LETT |t|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 47))
                                           (|SPADfirst| |l|) (QREFELT $ 44))
                                 (QREFELT $ 45)))
                          (LETT |n|
                                (SPADCALL
                                 (SPADCALL |t| (QREFELT $ 37) (QREFELT $ 44))
                                 (QREFELT $ 45)))
                          (LETT |b| (SPADCALL |t| |n| (QREFELT $ 46)))
                          (LETT |triad| (VECTOR |t| |n| |b|))
                          (EXIT (LIST |triad| |triad|))))
                        (#6#
                         (SEQ
                          (LETT |midtriads|
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |pr| NIL)
                                      (LETT #4# (CDR (CDR |l|)))
                                      (LETT |po| NIL) (LETT #3# (CDR |l|))
                                      (LETT |pl| NIL) (LETT #2# |l|) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |pl| (CAR #2#)) NIL)
                                            (ATOM #3#)
                                            (PROGN (LETT |po| (CAR #3#)) NIL)
                                            (ATOM #4#)
                                            (PROGN (LETT |pr| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (|SCIFS;poTriad| |pl| |po| |pr|
                                                $)
                                               #5#))))
                                      (LETT #2#
                                            (PROG1 (CDR #2#)
                                              (LETT #3#
                                                    (PROG1 (CDR #3#)
                                                      (LETT #4# (CDR #4#))))))
                                      (GO G190) G191 (EXIT (NREVERSE #5#)))))
                          (LETT |x| (|SPADfirst| |midtriads|))
                          (LETT |t|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 47))
                                           (|SPADfirst| |l|) (QREFELT $ 44))
                                 (QREFELT $ 45)))
                          (LETT |n|
                                (SPADCALL (|SCIFS;orthog| |t| (QVELT |x| 1) $)
                                          (QREFELT $ 45)))
                          (LETT |begtriad|
                                (VECTOR |t| |n|
                                        (SPADCALL |t| |n| (QREFELT $ 46))))
                          (LETT |x| (SPADCALL |midtriads| (QREFELT $ 50)))
                          (LETT |t|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| |k| (QREFELT $ 20))
                                           (SPADCALL |l| (- |k| 1)
                                                     (QREFELT $ 20))
                                           (QREFELT $ 44))
                                 (QREFELT $ 45)))
                          (LETT |n|
                                (SPADCALL (|SCIFS;orthog| |t| (QVELT |x| 1) $)
                                          (QREFELT $ 45)))
                          (LETT |endtriad|
                                (VECTOR |t| |n|
                                        (SPADCALL |t| |n| (QREFELT $ 46))))
                          (EXIT
                           (CONS |begtriad|
                                 (SPADCALL |midtriads| |endtriad|
                                           (QREFELT $ 51))))))))))))))) 

(SDEFUN |SCIFS;cosSinInfo|
        ((|n| |Integer|) ($ |List| (|List| (|DoubleFloat|))))
        (SPROG
         ((|ans| (|List| (|List| (|DoubleFloat|)))) (|angle| (|DoubleFloat|))
          (#1=#:G472 NIL) (|i| NIL) (|theta| (|DoubleFloat|)))
         (SEQ (LETT |ans| NIL)
              (LETT |theta|
                    (|div_DF_I|
                     (SPADCALL 2 (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                               (QREFELT $ 52))
                     |n|))
              (SEQ (LETT |i| 1) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |angle| (SPADCALL |i| |theta| (QREFELT $ 53)))
                        (EXIT
                         (LETT |ans|
                               (CONS
                                (LIST (|cos_DF| |angle|) (|sin_DF| |angle|))
                                |ans|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |SCIFS;loopPoints|
        ((|ctr| PT) (|pNorm| PT) (|bNorm| PT) (|rad| |DoubleFloat|)
         (|cosSin| |List| (|List| (|DoubleFloat|))) ($ |List| PT))
        (SPROG
         ((|pt| (PT)) (|ans| (|List| PT)) (|sin| (|DoubleFloat|))
          (|cos| (|DoubleFloat|)) (|cossin| (|List| (|DoubleFloat|))))
         (SEQ (LETT |ans| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |cosSin|))) (GO G191)))
                   (SEQ (LETT |cossin| (|SPADfirst| |cosSin|))
                        (LETT |cos| (|SPADfirst| |cossin|))
                        (LETT |sin| (SPADCALL |cossin| (QREFELT $ 55)))
                        (LETT |ans|
                              (CONS
                               (SPADCALL |ctr|
                                         (SPADCALL |rad|
                                                   (SPADCALL
                                                    (SPADCALL |cos| |pNorm|
                                                              (QREFELT $ 26))
                                                    (SPADCALL |sin| |bNorm|
                                                              (QREFELT $ 26))
                                                    (QREFELT $ 22))
                                                   (QREFELT $ 26))
                                         (QREFELT $ 22))
                               |ans|))
                        (EXIT (LETT |cosSin| (CDR |cosSin|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |pt|
                    (SPADCALL |ctr| (SPADCALL |rad| |pNorm| (QREFELT $ 26))
                              (QREFELT $ 22)))
              (EXIT (CONS |pt| (SPADCALL |ans| |pt| (QREFELT $ 12))))))) 

(SDEFUN |SCIFS;curveLoops;LDfIL;14|
        ((|pts1| |List| PT) (|r| |DoubleFloat|) (|nn| |Integer|)
         ($ |List| (|List| PT)))
        (SPROG
         ((|loops| (|List| (|List| PT))) (|b| (PT)) (|n| (PT)) (#1=#:G482 NIL)
          (|pt| NIL) (#2=#:G483 NIL) (|triad| NIL)
          (|cosSin| (|List| (|List| (|DoubleFloat|))))
          (|triads|
           (|List| (|Record| (|:| |tang| PT) (|:| |norm| PT) (|:| |bin| PT)))))
         (SEQ (LETT |triads| (|SCIFS;curveTriads| |pts1| $))
              (LETT |cosSin| (|SCIFS;cosSinInfo| |nn| $)) (LETT |loops| NIL)
              (SEQ (LETT |triad| NIL) (LETT #2# |triads|) (LETT |pt| NIL)
                   (LETT #1# |pts1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |pt| (CAR #1#)) NIL)
                         (ATOM #2#) (PROGN (LETT |triad| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |n| (QVELT |triad| 1))
                        (LETT |b| (QVELT |triad| 2))
                        (EXIT
                         (LETT |loops|
                               (CONS
                                (|SCIFS;loopPoints| |pt| |n| |b| |r| |cosSin|
                                 $)
                                |loops|))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (NREVERSE |loops|))))) 

(SDEFUN |SCIFS;stube;LDfI$;15|
        ((|functions| |List|
          (|Record| (|:| |source| (|Mapping| PT (|DoubleFloat|)))
                    (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
                    (|:| |knots| (|List| (|DoubleFloat|)))
                    (|:| |points| (|List| PT))))
         (|r| |DoubleFloat|) (|n| |Integer|) ($ $))
        (SPROG
         ((|loops| (|List| (|List| PT))) (#1=#:G491 NIL) (|bran| NIL)
          (|brans| (|List| (|List| PT))))
         (SEQ
          (COND ((< |n| 3) (|error| "tube: n should be at least 3"))
                ('T
                 (SEQ (LETT |brans| (|SCIFS;listBranches| |functions| $))
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
                                             (SPADCALL |bran| |r| |n|
                                                       (QREFELT $ 56))
                                             (QREFELT $ 57)))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL |loops| 'T (QREFELT $ 17))))))))) 

(SDEFUN |SCIFS;coerce;$Of;16| ((|me| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|List| (|OutputForm|))) (|r| (|OutputForm|)) (#1=#:G502 NIL)
          (|pIx| NIL) (#2=#:G501 NIL) (|faceIx| NIL) (#3=#:G500 NIL) (|p| NIL))
         (SEQ (LETT |r| (SPADCALL (QREFELT $ 63)))
              (SEQ (LETT |p| NIL) (LETT #3# (QCDR |me|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |r|
                          (SPADCALL |r| (SPADCALL |p| (QREFELT $ 64))
                                    (QREFELT $ 65)))
                    (EXIT
                     (LETT |r|
                           (SPADCALL |r| (SPADCALL " " (QREFELT $ 67))
                                     (QREFELT $ 65)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (LIST |r|))
              (SEQ (LETT |faceIx| NIL) (LETT #2# (QCAR |me|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |faceIx| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL (QREFELT $ 63)))
                        (SEQ (LETT |pIx| NIL) (LETT #1# |faceIx|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |pIx| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (SPADCALL |r|
                                              (SPADCALL |pIx| (QREFELT $ 68))
                                              (QREFELT $ 65)))
                              (EXIT
                               (LETT |r|
                                     (SPADCALL |r|
                                               (SPADCALL " " (QREFELT $ 67))
                                               (QREFELT $ 65)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |r| (QREFELT $ 70)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 72)))))) 

(DECLAIM (NOTINLINE |SceneIFS;|)) 

(DEFUN |SceneIFS| (#1=#:G503)
  (SPROG NIL
         (PROG (#2=#:G504)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SceneIFS|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SceneIFS;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|SceneIFS|)))))))))) 

(DEFUN |SceneIFS;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SceneIFS| DV$1))
          (LETT $ (GETREFV 74))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SceneIFS| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record|
                     (|:| |inx| (|List| (|List| (|NonNegativeInteger|))))
                     (|:| |pts| (|List| |#1|))))
          (QSETREFV $ 36
                    (SPADCALL (SPADCALL 995 -3 10 (QREFELT $ 32))
                              (QREFELT $ 35)))
          (QSETREFV $ 37 (SPADCALL 1 0 0 (QREFELT $ 21)))
          (QSETREFV $ 38 (SPADCALL 0 1 0 (QREFELT $ 21)))
          (QSETREFV $ 39 (SPADCALL 1 1 0 (QREFELT $ 21)))
          (QSETREFV $ 40 (QREFELT $ 39))
          $))) 

(MAKEPROP '|SceneIFS| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 13)
              |SCIFS;indexes;$L;1| (|List| 6) |SCIFS;pointList;$L;2|
              (0 . |concat|) (|List| 23) (6 . |concat|) (|List| 10) (|Boolean|)
              |SCIFS;smesh;LB$;4| |SCIFS;singleFace;L$;5| (|Integer|)
              (12 . |elt|) (18 . |sipnt|) (25 . +) (|NonNegativeInteger|)
              (31 . |#|) (|DoubleFloat|) (36 . *) (42 . |elt|) (48 . |setelt!|)
              |SCIFS;subdivide;2$;6| (|PositiveInteger|) (|Float|)
              (55 . |float|) (62 . |coerce|) |SCIFS;sierpinskiDivide;$Nni$;7|
              (67 . |convert|) 'LINMAX 'XHAT 'YHAT 'PREV0 'PREV
              (72 . |colinearity|) (78 . >) (84 . |parallel|) (90 . -)
              (96 . |unitVector|) (101 . |perpendicular|) (107 . |second|)
              (|Record| (|:| |tang| 6) (|:| |norm| 6) (|:| |bin| 6))
              (|List| 48) (112 . |last|) (117 . |concat|) (123 . *) (129 . *)
              (|List| 25) (135 . |second|) |SCIFS;curveLoops;LDfIL;14|
              (140 . |concat|) (|Mapping| 6 25)
              (|Record| (|:| |source| 58)
                        (|:| |ranges| (|List| (|Segment| 25))) (|:| |knots| 54)
                        (|:| |points| 10))
              (|List| 59) |SCIFS;stube;LDfI$;15| (|OutputForm|) (146 . |empty|)
              (150 . |coerce|) (155 . |hconcat|) (|String|) (161 . |message|)
              (166 . |coerce|) (|List| 62) (171 . |concat|) (|List| $)
              (177 . |vconcat|) |SCIFS;coerce;$Of;16|)
           '#(|subdivide| 182 |stube| 187 |smesh| 194 |singleFace| 200
              |sierpinskiDivide| 205 |pointList| 211 |indexes| 216 |curveLoops|
              221 |coerce| 228)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|smesh|
                                 ($$ (|List| (|List| |#1|)) (|Boolean|)))
                                T)
                              '((|singleFace| ($$ (|List| |#1|))) T)
                              '((|subdivide| ($$ $$)) T)
                              '((|sierpinskiDivide|
                                 ($$ $$ (|NonNegativeInteger|)))
                                T)
                              '((|stube|
                                 ($$
                                  (|List|
                                   (|Record|
                                    (|:| |source|
                                         (|Mapping| |#1| (|DoubleFloat|)))
                                    (|:| |ranges|
                                         (|List| (|Segment| (|DoubleFloat|))))
                                    (|:| |knots| (|List| (|DoubleFloat|)))
                                    (|:| |points| (|List| |#1|))))
                                  (|DoubleFloat|) (|Integer|)))
                                T)
                              '((|curveLoops|
                                 ((|List| (|List| |#1|)) (|List| |#1|)
                                  (|DoubleFloat|) (|Integer|)))
                                T)
                              '((|indexes|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$))
                                T)
                              '((|pointList| ((|List| |#1|) $$)) T)
                              '((|coerce| ((|OutputForm|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 73
                                            '(2 10 0 0 6 12 2 8 0 0 13 14 2 10
                                              6 0 19 20 3 6 0 19 19 19 21 2 6 0
                                              0 0 22 1 13 23 0 24 2 6 0 25 0 26
                                              2 13 23 0 19 27 3 13 23 0 19 23
                                              28 3 31 0 19 19 30 32 1 31 25 0
                                              33 1 31 25 0 35 2 6 25 0 0 41 2
                                              25 16 0 0 42 2 6 25 0 0 43 2 6 0
                                              0 0 44 1 6 0 0 45 2 6 0 0 0 46 1
                                              10 6 0 47 1 49 48 0 50 2 49 0 0
                                              48 51 2 25 0 30 0 52 2 25 0 23 0
                                              53 1 54 25 0 55 2 15 0 0 0 57 0
                                              62 0 63 1 6 62 0 64 2 62 0 0 0 65
                                              1 62 0 66 67 1 23 62 0 68 2 69 0
                                              0 62 70 1 62 0 71 72 1 0 0 0 29 3
                                              0 0 60 25 19 61 2 0 0 15 16 17 1
                                              0 0 10 18 2 0 0 0 23 34 1 0 10 0
                                              11 1 0 8 0 9 3 0 15 10 25 19 56 1
                                              0 62 0 73)))))
           '|lookupComplete|)) 
