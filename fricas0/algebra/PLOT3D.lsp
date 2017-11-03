
(SDEFUN |PLOT3D;point|
        ((|xx| |DoubleFloat|) (|yy| |DoubleFloat|) (|zz| |DoubleFloat|)
         (|col| . #1=(|DoubleFloat|)) ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |xx| |yy| |zz| |col|) |PLOT3D;point|)
                         (QREFELT $ 18)))) 

(SDEFUN |PLOT3D;fourth|
        ((|list| |List| (|Segment| (|DoubleFloat|)))
         ($ |Segment| (|DoubleFloat|)))
        (|SPADfirst| (CDR (CDR (CDR |list|))))) 

(SDEFUN |PLOT3D;checkRange|
        ((|r| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (COND
         ((SPADCALL (SPADCALL |r| (QREFELT $ 20)) (SPADCALL |r| (QREFELT $ 21))
                    (QREFELT $ 23))
          (|error| "ranges cannot be negative"))
         ('T |r|))) 

(SDEFUN |PLOT3D;intersect|
        ((|s| |Segment| (|DoubleFloat|)) (|t| |Segment| (|DoubleFloat|))
         ($ |Segment| (|DoubleFloat|)))
        (|PLOT3D;checkRange|
         (SPADCALL
          (|max_DF| (SPADCALL |s| (QREFELT $ 20))
                    (SPADCALL |t| (QREFELT $ 20)))
          (|min_DF| (SPADCALL |s| (QREFELT $ 21))
                    (SPADCALL |t| (QREFELT $ 21)))
          (QREFELT $ 24))
         $)) 

(SDEFUN |PLOT3D;union|
        ((|s| |Segment| (|DoubleFloat|)) (|t| |Segment| (|DoubleFloat|))
         ($ |Segment| (|DoubleFloat|)))
        (SPADCALL
         (|min_DF| (SPADCALL |s| (QREFELT $ 20)) (SPADCALL |t| (QREFELT $ 20)))
         (|max_DF| (SPADCALL |s| (QREFELT $ 21)) (SPADCALL |t| (QREFELT $ 21)))
         (QREFELT $ 24))) 

(SDEFUN |PLOT3D;join|
        ((|l| |List|
          (|Record|
           (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
           (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
           (|:| |knots| (|List| (|DoubleFloat|)))
           (|:| |points| (|List| (|Point| (|DoubleFloat|))))))
         (|i| |Integer|) ($ |Segment| (|DoubleFloat|)))
        (SPROG
         ((|u| (|Segment| (|DoubleFloat|))) (#1=#:G737 NIL) (|r| NIL)
          (|rr|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
            (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ (LETT |rr| (|SPADfirst| |l|) . #2=(|PLOT3D;join|))
              (LETT |u|
                    (COND ((EQL |i| 0) (|SPADfirst| (QVELT |rr| 1)))
                          ((EQL |i| 1)
                           (SPADCALL (QVELT |rr| 1) (QREFELT $ 26)))
                          ((EQL |i| 2)
                           (SPADCALL (QVELT |rr| 1) (QREFELT $ 27)))
                          ('T (|PLOT3D;fourth| (QVELT |rr| 1) $)))
                    . #2#)
              (SEQ (LETT |r| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL |i| 0)
                       (LETT |u|
                             (|PLOT3D;union| |u| (|SPADfirst| (QVELT |r| 1)) $)
                             . #2#))
                      ((EQL |i| 1)
                       (LETT |u|
                             (|PLOT3D;union| |u|
                              (SPADCALL (QVELT |r| 1) (QREFELT $ 26)) $)
                             . #2#))
                      ((EQL |i| 2)
                       (LETT |u|
                             (|PLOT3D;union| |u|
                              (SPADCALL (QVELT |r| 1) (QREFELT $ 27)) $)
                             . #2#))
                      ('T
                       (LETT |u|
                             (|PLOT3D;union| |u|
                              (|PLOT3D;fourth| (QVELT |r| 1) $) $)
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |u|)))) 

(SDEFUN |PLOT3D;parametricRange| ((|r| $) ($ |Segment| (|DoubleFloat|)))
        (|SPADfirst| (QVELT |r| 1))) 

(SDEFUN |PLOT3D;minPoints3D;I;8| (($ |Integer|)) (QREFELT $ 8)) 

(SDEFUN |PLOT3D;setMinPoints3D;2I;9| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
             (COND ((< (QREFELT $ 9) |n|) (SETELT $ 9 |n|)))
             (EXIT (SETELT $ 8 |n|)))) 

(SDEFUN |PLOT3D;maxPoints3D;I;10| (($ |Integer|)) (QREFELT $ 9)) 

(SDEFUN |PLOT3D;setMaxPoints3D;2I;11| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
             (COND
              ((SPADCALL (QREFELT $ 8) |n| (QREFELT $ 32)) (SETELT $ 8 |n|)))
             (EXIT (SETELT $ 9 |n|)))) 

(SDEFUN |PLOT3D;screenResolution3D;I;12| (($ |Integer|)) (QREFELT $ 11)) 

(SDEFUN |PLOT3D;setScreenResolution3D;2I;13| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 2) (|error| "buy a new terminal")))
             (EXIT (SETELT $ 11 |n|)))) 

(SDEFUN |PLOT3D;adaptive3D?;B;14| (($ |Boolean|)) (QREFELT $ 7)) 

(SDEFUN |PLOT3D;setAdaptive3D;2B;15| ((|b| |Boolean|) ($ |Boolean|))
        (SETELT $ 7 |b|)) 

(SDEFUN |PLOT3D;numFunEvals3D;I;16| (($ |Integer|)) (QREFELT $ 10)) 

(SDEFUN |PLOT3D;debug3D;2B;17| ((|b| |Boolean|) ($ |Boolean|))
        (SETELT $ 15 |b|)) 

(SDEFUN |PLOT3D;xRange;$S;18| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (SPADCALL (QVELT |plot| 1) (QREFELT $ 26))) 

(SDEFUN |PLOT3D;yRange;$S;19| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (SPADCALL (QVELT |plot| 1) (QREFELT $ 27))) 

(SDEFUN |PLOT3D;zRange;$S;20| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (|PLOT3D;fourth| (QVELT |plot| 1) $)) 

(SDEFUN |PLOT3D;tRange;$S;21| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (|SPADfirst| (QVELT |plot| 1))) 

(SDEFUN |PLOT3D;tValues;$L;22| ((|plot| $) ($ |List| (|List| (|DoubleFloat|))))
        (SPROG
         ((|outList| (|List| (|List| (|DoubleFloat|)))) (#1=#:G760 NIL)
          (|curve| NIL))
         (SEQ (LETT |outList| NIL . #2=(|PLOT3D;tValues;$L;22|))
              (SEQ (LETT |curve| NIL . #2#) (LETT #1# (QVELT |plot| 4) . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |curve| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |outList| (CONS (QVELT |curve| 2) |outList|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |outList|)))) 

(SDEFUN |PLOT3D;select|
        ((|l| |List| (|Point| (|DoubleFloat|)))
         (|f| |Mapping| #1=(|DoubleFloat|) (|Point| (|DoubleFloat|)))
         (|g| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         ($ |DoubleFloat|))
        (SPROG ((|m| #1#) (|fp| #1#) (#2=#:G765 NIL) (|p| NIL))
               (SEQ
                (LETT |m| (SPADCALL (|SPADfirst| |l|) |f|)
                      . #3=(|PLOT3D;select|))
                (SEQ (LETT |p| NIL . #3#) (LETT #2# (CDR |l|) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |fp| (SPADCALL |p| |f|) . #3#)
                          (EXIT (LETT |m| (SPADCALL |m| |fp| |g|) . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |PLOT3D;rangeRefine|
        ((|curve| |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|)))))
         (|nRange| |Segment| (|DoubleFloat|))
         ($ |Record|
          (|:| |source|
               #1=(|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| #2=(|List| (|DoubleFloat|)))
          (|:| |points| #3=(|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|zRange| #4=(|Segment| (|DoubleFloat|))) (|yRange| #4#)
          (|xRange| #4#) (|p| #3#) (|t| #2#) (|t1| (|DoubleFloat|))
          (#5=#:G809 NIL) (|i| NIL) (|d| #6=(|DoubleFloat|)) (|n| (|Integer|))
          (|q| (|List| (|Point| (|DoubleFloat|))))
          (|c| (|List| (|DoubleFloat|))) (|s| #6#) (#7=#:G808 NIL) (|f| #1#)
          (|h| (|DoubleFloat|)) (|l| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (|PLOT3D;checkRange| |nRange| $)
                (LETT |l| (SPADCALL |nRange| (QREFELT $ 20))
                      . #8=(|PLOT3D;rangeRefine|))
                (LETT |h| (SPADCALL |nRange| (QREFELT $ 21)) . #8#)
                (LETT |t| (QVELT |curve| 2) . #8#)
                (LETT |p| (QVELT |curve| 3) . #8#)
                (LETT |f| (QVELT |curve| 0) . #8#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |t|) NIL)
                              ('T (|less_DF| (|SPADfirst| |t|) |l|))))
                       (GO G191)))
                     (SEQ (LETT |t| (CDR |t|) . #8#)
                          (EXIT (LETT |p| (CDR |p|) . #8#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |c| NIL . #8#) (LETT |q| NIL . #8#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |t|) NIL)
                              ('T
                               (SPADCALL (|SPADfirst| |t|) |h|
                                         (QREFELT $ 46)))))
                       (GO G191)))
                     (SEQ (LETT |c| (CONS (|SPADfirst| |t|) |c|) . #8#)
                          (LETT |q| (CONS (|SPADfirst| |p|) |q|) . #8#)
                          (LETT |t| (CDR |t|) . #8#)
                          (EXIT (LETT |p| (CDR |p|) . #8#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((NULL |c|)
                  (PROGN
                   (LETT #7# (|PLOT3D;basicPlot| |f| |nRange| $) . #8#)
                   (GO #9=#:G807))))
                (COND
                 ((|less_DF| (|SPADfirst| |c|) |h|)
                  (SEQ (LETT |c| (CONS |h| |c|) . #8#)
                       (LETT |q| (CONS (SPADCALL |h| |f|) |q|) . #8#)
                       (EXIT (SETELT $ 10 (+ (QREFELT $ 10) 1))))))
                (LETT |t| (LETT |c| (NREVERSE |c|) . #8#) . #8#)
                (LETT |p| (LETT |q| (NREVERSE |q|) . #8#) . #8#)
                (LETT |s|
                      (|div_DF| (|sub_DF| |h| |l|)
                                (|sub_DF|
                                 (FLOAT (QREFELT $ 8)
                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                 1.0))
                      . #8#)
                (COND
                 ((SPADCALL (|SPADfirst| |t|) |l| (QREFELT $ 47))
                  (SEQ (LETT |t| (LETT |c| (CONS |l| |c|) . #8#) . #8#)
                       (LETT |p| (LETT |q| (CONS (SPADCALL |l| |f|) |p|) . #8#)
                             . #8#)
                       (EXIT (SETELT $ 10 (+ (QREFELT $ 10) 1))))))
                (SEQ G190 (COND ((NULL (NULL (NULL (CDR |t|)))) (GO G191)))
                     (SEQ
                      (LETT |n|
                            (TRUNCATE
                             (|div_DF|
                              (|sub_DF| (SPADCALL |t| (QREFELT $ 48))
                                        (|SPADfirst| |t|))
                              |s|))
                            . #8#)
                      (LETT |d|
                            (|div_DF|
                             (|sub_DF| (SPADCALL |t| (QREFELT $ 48))
                                       (|SPADfirst| |t|))
                             (FLOAT (+ |n| 1) MOST-POSITIVE-DOUBLE-FLOAT))
                            . #8#)
                      (SEQ (LETT |i| 1 . #8#) (LETT #5# |n| . #8#) G190
                           (COND ((|greater_SI| |i| #5#) (GO G191)))
                           (SEQ
                            (SPADCALL |t| '|rest|
                                      (CONS (|add_DF| (|SPADfirst| |t|) |d|)
                                            (CDR |t|))
                                      (QREFELT $ 50))
                            (LETT |t1| (SPADCALL |t| (QREFELT $ 48)) . #8#)
                            (SPADCALL |p| '|rest|
                                      (CONS (SPADCALL |t1| |f|) (CDR |p|))
                                      (QREFELT $ 52))
                            (SETELT $ 10 (+ (QREFELT $ 10) 1))
                            (LETT |t| (CDR |t|) . #8#)
                            (EXIT (LETT |p| (CDR |p|) . #8#)))
                           (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |t| (CDR |t|) . #8#)
                      (EXIT (LETT |p| (CDR |p|) . #8#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |xRange|
                      (SPADCALL (|PLOT3D;select| |q| (ELT $ 54) (ELT $ 55) $)
                                (|PLOT3D;select| |q| (ELT $ 54) (ELT $ 56) $)
                                (QREFELT $ 24))
                      . #8#)
                (LETT |yRange|
                      (SPADCALL (|PLOT3D;select| |q| (ELT $ 57) (ELT $ 55) $)
                                (|PLOT3D;select| |q| (ELT $ 57) (ELT $ 56) $)
                                (QREFELT $ 24))
                      . #8#)
                (LETT |zRange|
                      (SPADCALL (|PLOT3D;select| |q| (ELT $ 58) (ELT $ 55) $)
                                (|PLOT3D;select| |q| (ELT $ 58) (ELT $ 56) $)
                                (QREFELT $ 24))
                      . #8#)
                (EXIT
                 (VECTOR |f| (LIST |nRange| |xRange| |yRange| |zRange|) |c|
                         |q|))))
          #9# (EXIT #7#)))) 

(SDEFUN |PLOT3D;adaptivePlot|
        ((|curve| |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|)))))
         (|tRg| |Segment| (|DoubleFloat|)) (|xRg| |Segment| (|DoubleFloat|))
         (|yRg| |Segment| (|DoubleFloat|)) (|zRg| |Segment| (|DoubleFloat|))
         (|pixelfraction| |Integer|) (|resolution| |Integer|)
         ($ |Record|
          (|:| |source|
               #1=(|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| #2=(|List| (|DoubleFloat|)))
          (|:| |points| #3=(|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|p| #3#) (|t| #2#) (|tj| #4=(|DoubleFloat|)) (|n| (|Integer|))
          (#5=#:G855 NIL) (|sp| #6=(|List| (|Point| (|DoubleFloat|))))
          (|st| #7=(|List| (|DoubleFloat|))) (|dp| (|DoubleFloat|))
          (|s2| #8=(|DoubleFloat|)) (|s1| #8#) (|c2| #4#) (|b2| #4#) (|a2| #4#)
          (|c1| #4#) (|b1| #4#) (|a1| #4#) (|z2| #9=(|DoubleFloat|))
          (|y2| #10=(|DoubleFloat|)) (|x2| #11=(|DoubleFloat|)) (|z1| #9#)
          (|y1| #10#) (|x1| #11#) (|z0| #9#) (|y0| #10#) (|x0| #11#)
          (|t2| (|DoubleFloat|)) (|t1| (|DoubleFloat|)) (|t0| (|DoubleFloat|))
          (|headerp| #6#) (|headert| #7#) (|tLimit| #4#) (|maxLength| #4#)
          (|minLength| #4#) (|f| #1#) (|tDiff| #12=(|DoubleFloat|))
          (|h| (|DoubleFloat|)) (|l| (|DoubleFloat|)) (|zDiff| #12#)
          (|yDiff| #12#) (|xDiff| #12#))
         (SEQ
          (LETT |xDiff|
                (|sub_DF| (SPADCALL |xRg| (QREFELT $ 21))
                          (SPADCALL |xRg| (QREFELT $ 20)))
                . #13=(|PLOT3D;adaptivePlot|))
          (LETT |yDiff|
                (|sub_DF| (SPADCALL |yRg| (QREFELT $ 21))
                          (SPADCALL |yRg| (QREFELT $ 20)))
                . #13#)
          (LETT |zDiff|
                (|sub_DF| (SPADCALL |zRg| (QREFELT $ 21))
                          (SPADCALL |zRg| (QREFELT $ 20)))
                . #13#)
          (COND ((|eql_DF| |xDiff| 0.0) (LETT |xDiff| 1.0 . #13#)))
          (COND ((|eql_DF| |yDiff| 0.0) (LETT |yDiff| 1.0 . #13#)))
          (COND ((|eql_DF| |zDiff| 0.0) (LETT |zDiff| 1.0 . #13#)))
          (LETT |l| (SPADCALL |tRg| (QREFELT $ 20)) . #13#)
          (LETT |h| (SPADCALL |tRg| (QREFELT $ 21)) . #13#)
          (LETT |tDiff| (|sub_DF| |h| |l|) . #13#)
          (EXIT
           (COND ((|eql_DF| |tDiff| 0.0) |curve|)
                 (#14='T
                  (SEQ (LETT |t| (QVELT |curve| 2) . #13#)
                       (EXIT
                        (COND ((< (LENGTH |t|) 3) |curve|)
                              (#14#
                               (SEQ (LETT |p| (QVELT |curve| 3) . #13#)
                                    (LETT |f| (QVELT |curve| 0) . #13#)
                                    (LETT |minLength|
                                          (|div_DF|
                                           (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)
                                           (FLOAT |resolution|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #13#)
                                    (LETT |maxLength|
                                          (|div_DF| 1.0
                                                    (FLOAT 4
                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #13#)
                                    (LETT |tLimit|
                                          (|div_DF| |tDiff|
                                                    (FLOAT
                                                     (* |pixelfraction|
                                                        |resolution|)
                                                     MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #13#)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND ((NULL |t|) NIL)
                                                  ('T
                                                   (|less_DF| (|SPADfirst| |t|)
                                                              |l|))))
                                           (GO G191)))
                                         (SEQ (LETT |t| (CDR |t|) . #13#)
                                              (EXIT
                                               (LETT |p| (CDR |p|) . #13#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND ((< (LENGTH |t|) 3) |curve|)
                                           (#14#
                                            (SEQ (LETT |headert| |t| . #13#)
                                                 (LETT |headerp| |p| . #13#)
                                                 (LETT |st| |headert| . #13#)
                                                 (LETT |sp| |headerp| . #13#)
                                                 (LETT |n| 0 . #13#)
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ G190
                                                        (COND
                                                         ((NULL
                                                           (NULL
                                                            (NULL
                                                             (CDR
                                                              (CDR |st|)))))
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT |t0|
                                                               (|SPADfirst|
                                                                |st|)
                                                               . #13#)
                                                         (LETT |t1|
                                                               (SPADCALL |st|
                                                                         (QREFELT
                                                                          $
                                                                          48))
                                                               . #13#)
                                                         (LETT |t2|
                                                               (SPADCALL |st|
                                                                         (QREFELT
                                                                          $
                                                                          59))
                                                               . #13#)
                                                         (COND
                                                          ((SPADCALL |t2| |h|
                                                                     (QREFELT $
                                                                              23))
                                                           (PROGN
                                                            (LETT #5#
                                                                  |$NoValue|
                                                                  . #13#)
                                                            (GO #15=#:G829))))
                                                         (EXIT
                                                          (COND
                                                           ((|less_DF|
                                                             (|sub_DF| |t2|
                                                                       |t0|)
                                                             |tLimit|)
                                                            (SEQ
                                                             (LETT |st|
                                                                   (CDR |st|)
                                                                   . #13#)
                                                             (EXIT
                                                              (LETT |sp|
                                                                    (CDR |sp|)
                                                                    . #13#))))
                                                           ('T
                                                            (SEQ
                                                             (LETT |x0|
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |sp|)
                                                                    (QREFELT $
                                                                             54))
                                                                   . #13#)
                                                             (LETT |y0|
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |sp|)
                                                                    (QREFELT $
                                                                             57))
                                                                   . #13#)
                                                             (LETT |z0|
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |sp|)
                                                                    (QREFELT $
                                                                             58))
                                                                   . #13#)
                                                             (LETT |x1|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              60))
                                                                    (QREFELT $
                                                                             54))
                                                                   . #13#)
                                                             (LETT |y1|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              60))
                                                                    (QREFELT $
                                                                             57))
                                                                   . #13#)
                                                             (LETT |z1|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              60))
                                                                    (QREFELT $
                                                                             58))
                                                                   . #13#)
                                                             (LETT |x2|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              61))
                                                                    (QREFELT $
                                                                             54))
                                                                   . #13#)
                                                             (LETT |y2|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              61))
                                                                    (QREFELT $
                                                                             57))
                                                                   . #13#)
                                                             (LETT |z2|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              61))
                                                                    (QREFELT $
                                                                             58))
                                                                   . #13#)
                                                             (LETT |a1|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |x1| |x0|)
                                                                    |xDiff|)
                                                                   . #13#)
                                                             (LETT |b1|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |y1| |y0|)
                                                                    |yDiff|)
                                                                   . #13#)
                                                             (LETT |c1|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |z1| |z0|)
                                                                    |zDiff|)
                                                                   . #13#)
                                                             (LETT |a2|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |x2| |x1|)
                                                                    |xDiff|)
                                                                   . #13#)
                                                             (LETT |b2|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |y2| |y1|)
                                                                    |yDiff|)
                                                                   . #13#)
                                                             (LETT |c2|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |z2| |z1|)
                                                                    |zDiff|)
                                                                   . #13#)
                                                             (LETT |s1|
                                                                   (SPADCALL
                                                                    (|add_DF|
                                                                     (|add_DF|
                                                                      (SPADCALL
                                                                       |a1| 2
                                                                       (QREFELT
                                                                        $ 63))
                                                                      (SPADCALL
                                                                       |b1| 2
                                                                       (QREFELT
                                                                        $ 63)))
                                                                     (SPADCALL
                                                                      |c1| 2
                                                                      (QREFELT
                                                                       $ 63)))
                                                                    (QREFELT $
                                                                             64))
                                                                   . #13#)
                                                             (LETT |s2|
                                                                   (SPADCALL
                                                                    (|add_DF|
                                                                     (|add_DF|
                                                                      (SPADCALL
                                                                       |a2| 2
                                                                       (QREFELT
                                                                        $ 63))
                                                                      (SPADCALL
                                                                       |b2| 2
                                                                       (QREFELT
                                                                        $ 63)))
                                                                     (SPADCALL
                                                                      |c2| 2
                                                                      (QREFELT
                                                                       $ 63)))
                                                                    (QREFELT $
                                                                             64))
                                                                   . #13#)
                                                             (LETT |dp|
                                                                   (|add_DF|
                                                                    (|add_DF|
                                                                     (|mul_DF|
                                                                      |a1|
                                                                      |a2|)
                                                                     (|mul_DF|
                                                                      |b1|
                                                                      |b2|))
                                                                    (|mul_DF|
                                                                     |c1|
                                                                     |c2|))
                                                                   . #13#)
                                                             (COND
                                                              ((|less_DF| |s1|
                                                                          |maxLength|)
                                                               (COND
                                                                ((|less_DF|
                                                                  |s2|
                                                                  |maxLength|)
                                                                 (COND
                                                                  ((OR
                                                                    (|eql_DF|
                                                                     |s1| 0.0)
                                                                    (|eql_DF|
                                                                     |s2| 0.0))
                                                                   (EXIT
                                                                    (SEQ
                                                                     (LETT |st|
                                                                           (CDR
                                                                            |st|)
                                                                           . #13#)
                                                                     (EXIT
                                                                      (LETT
                                                                       |sp|
                                                                       (CDR
                                                                        |sp|)
                                                                       . #13#)))))
                                                                  ((|less_DF|
                                                                    |s1|
                                                                    |minLength|)
                                                                   (COND
                                                                    ((OR
                                                                      (|less_DF|
                                                                       |s2|
                                                                       |minLength|)
                                                                      (SPADCALL
                                                                       (|div_DF|
                                                                        (|div_DF|
                                                                         |dp|
                                                                         |s1|)
                                                                        |s2|)
                                                                       (QREFELT
                                                                        $ 14)
                                                                       (QREFELT
                                                                        $ 23)))
                                                                     (EXIT
                                                                      (SEQ
                                                                       (LETT
                                                                        |st|
                                                                        (CDR
                                                                         |st|)
                                                                        . #13#)
                                                                       (EXIT
                                                                        (LETT
                                                                         |sp|
                                                                         (CDR
                                                                          |sp|)
                                                                         . #13#)))))))
                                                                  ('T
                                                                   (COND
                                                                    ((SPADCALL
                                                                      (|div_DF|
                                                                       (|div_DF|
                                                                        |dp|
                                                                        |s1|)
                                                                       |s2|)
                                                                      (QREFELT
                                                                       $ 14)
                                                                      (QREFELT
                                                                       $ 23))
                                                                     (EXIT
                                                                      (SEQ
                                                                       (LETT
                                                                        |st|
                                                                        (CDR
                                                                         |st|)
                                                                        . #13#)
                                                                       (EXIT
                                                                        (LETT
                                                                         |sp|
                                                                         (CDR
                                                                          |sp|)
                                                                         . #13#))))))))))))
                                                             (COND
                                                              ((EQL |n|
                                                                    (QREFELT $
                                                                             9))
                                                               (PROGN
                                                                (LETT #5#
                                                                      |$NoValue|
                                                                      . #13#)
                                                                (GO #15#)))
                                                              ('T
                                                               (LETT |n|
                                                                     (+ |n| 1)
                                                                     . #13#)))
                                                             (LETT |t| |st|
                                                                   . #13#)
                                                             (LETT |p| |sp|
                                                                   . #13#)
                                                             (LETT |tj|
                                                                   (|div_DF|
                                                                    (|add_DF|
                                                                     |t0| |t1|)
                                                                    (FLOAT 2
                                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                                                   . #13#)
                                                             (|qset_rest| |t|
                                                                          (CONS
                                                                           |tj|
                                                                           (CDR
                                                                            |t|)))
                                                             (|qset_rest| |p|
                                                                          (CONS
                                                                           (SPADCALL
                                                                            |tj|
                                                                            |f|)
                                                                           (CDR
                                                                            |p|)))
                                                             (LETT |t|
                                                                   (CDR |t|)
                                                                   . #13#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #13#)
                                                             (LETT |t|
                                                                   (CDR |t|)
                                                                   . #13#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #13#)
                                                             (LETT |tj|
                                                                   (|div_DF|
                                                                    (|add_DF|
                                                                     |t1| |t2|)
                                                                    (FLOAT 2
                                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                                                   . #13#)
                                                             (|qset_rest| |t|
                                                                          (CONS
                                                                           |tj|
                                                                           (CDR
                                                                            |t|)))
                                                             (EXIT
                                                              (|qset_rest| |p|
                                                                           (CONS
                                                                            (SPADCALL
                                                                             |tj|
                                                                             |f|)
                                                                            (CDR
                                                                             |p|)))))))))
                                                        NIL (GO G190) G191
                                                        (EXIT NIL)))
                                                  #15# (EXIT #5#))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |n| 0
                                                              (QREFELT $ 32))
                                                    (SEQ
                                                     (SETELT $ 10
                                                             (+ (QREFELT $ 10)
                                                                |n|))
                                                     (LETT |t|
                                                           (QVELT |curve| 2)
                                                           . #13#)
                                                     (LETT |p|
                                                           (QVELT |curve| 3)
                                                           . #13#)
                                                     (LETT |xRg|
                                                           (SPADCALL
                                                            (|PLOT3D;select|
                                                             |p| (ELT $ 54)
                                                             (ELT $ 55) $)
                                                            (|PLOT3D;select|
                                                             |p| (ELT $ 54)
                                                             (ELT $ 56) $)
                                                            (QREFELT $ 24))
                                                           . #13#)
                                                     (LETT |yRg|
                                                           (SPADCALL
                                                            (|PLOT3D;select|
                                                             |p| (ELT $ 57)
                                                             (ELT $ 55) $)
                                                            (|PLOT3D;select|
                                                             |p| (ELT $ 57)
                                                             (ELT $ 56) $)
                                                            (QREFELT $ 24))
                                                           . #13#)
                                                     (LETT |zRg|
                                                           (SPADCALL
                                                            (|PLOT3D;select|
                                                             |p| (ELT $ 58)
                                                             (ELT $ 55) $)
                                                            (|PLOT3D;select|
                                                             |p| (ELT $ 58)
                                                             (ELT $ 56) $)
                                                            (QREFELT $ 24))
                                                           . #13#)
                                                     (EXIT
                                                      (VECTOR (QVELT |curve| 0)
                                                              (LIST |tRg| |xRg|
                                                                    |yRg|
                                                                    |zRg|)
                                                              |t| |p|))))
                                                   (#14#
                                                    |curve|)))))))))))))))))) 

(SDEFUN |PLOT3D;basicPlot|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         ($ |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|zRange| #1=(|Segment| (|DoubleFloat|))) (|yRange| #1#)
          (|xRange| #1#) (|p| (|List| (|Point| (|DoubleFloat|))))
          (|t| (|List| (|DoubleFloat|))) (|l| (|DoubleFloat|)) (#2=#:G880 NIL)
          (|i| NIL) (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|)))
         (SEQ (|PLOT3D;checkRange| |tRange| $)
              (LETT |l| (SPADCALL |tRange| (QREFELT $ 20))
                    . #3=(|PLOT3D;basicPlot|))
              (LETT |h| (SPADCALL |tRange| (QREFELT $ 21)) . #3#)
              (LETT |t| (SPADCALL |l| (QREFELT $ 65)) . #3#)
              (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 66)) . #3#)
              (LETT |s|
                    (|div_DF| (|sub_DF| |h| |l|)
                              (FLOAT (- (QREFELT $ 8) 1)
                                     MOST-POSITIVE-DOUBLE-FLOAT))
                    . #3#)
              (SEQ (LETT |i| 2 . #3#) (LETT #2# (- (QREFELT $ 8) 1) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |l| (|add_DF| |l| |s|) . #3#)
                        (LETT |t| (CONS |l| |t|) . #3#)
                        (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|) . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |t| (NREVERSE (CONS |h| |t|)) . #3#)
              (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)) . #3#)
              (LETT |xRange|
                    (SPADCALL (|PLOT3D;select| |p| (ELT $ 54) (ELT $ 55) $)
                              (|PLOT3D;select| |p| (ELT $ 54) (ELT $ 56) $)
                              (QREFELT $ 24))
                    . #3#)
              (LETT |yRange|
                    (SPADCALL (|PLOT3D;select| |p| (ELT $ 57) (ELT $ 55) $)
                              (|PLOT3D;select| |p| (ELT $ 57) (ELT $ 56) $)
                              (QREFELT $ 24))
                    . #3#)
              (LETT |zRange|
                    (SPADCALL (|PLOT3D;select| |p| (ELT $ 58) (ELT $ 55) $)
                              (|PLOT3D;select| |p| (ELT $ 58) (ELT $ 56) $)
                              (QREFELT $ 24))
                    . #3#)
              (EXIT
               (VECTOR |f| (LIST |tRange| |xRange| |yRange| |zRange|) |t|
                       |p|))))) 

(SDEFUN |PLOT3D;zoom;$3S$;27|
        ((|p| $) (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|))
         (|zRange| |Segment| (|DoubleFloat|)) ($ $))
        (VECTOR (LIST |xRange| |yRange| |zRange|) (QVELT |p| 1) (QVELT |p| 2)
                (QVELT |p| 3) (QVELT |p| 4))) 

(SDEFUN |PLOT3D;basicRefine|
        ((|curve| |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|)))))
         (|nRange| |Segment| (|DoubleFloat|))
         ($ |Record|
          (|:| |source|
               #1=(|Mapping| #2=(|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| #3=(|List| (|DoubleFloat|)))
          (|:| |points| #4=(|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|zRange| #5=(|Segment| (|DoubleFloat|))) (|yRange| #5#)
          (|xRange| #5#) (|p| #4#) (|t| #3#) (|pm| #2#) (|tm| (|DoubleFloat|))
          (|f| #1#) (|h| (|DoubleFloat|)) (|l| (|DoubleFloat|))
          (|tRange| (|Segment| (|DoubleFloat|))))
         (SEQ
          (LETT |tRange| (|SPADfirst| (QVELT |curve| 1))
                . #6=(|PLOT3D;basicRefine|))
          (LETT |curve|
                (VECTOR (QVELT |curve| 0) (QVELT |curve| 1) (QVELT |curve| 2)
                        (QVELT |curve| 3))
                . #6#)
          (LETT |t|
                (QSETVELT |curve| 2
                          (SPADCALL (QVELT |curve| 2) (QREFELT $ 68)))
                . #6#)
          (LETT |p|
                (QSETVELT |curve| 3
                          (SPADCALL (QVELT |curve| 3) (QREFELT $ 69)))
                . #6#)
          (LETT |l| (SPADCALL |nRange| (QREFELT $ 20)) . #6#)
          (LETT |h| (SPADCALL |nRange| (QREFELT $ 21)) . #6#)
          (LETT |f| (QVELT |curve| 0) . #6#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL (CDR |t|)) NIL)
                        ('T (|less_DF| (|SPADfirst| |t|) |h|))))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((|less_DF| (SPADCALL |t| (QREFELT $ 48)) |l|)
                   (SEQ (LETT |t| (CDR |t|) . #6#)
                        (EXIT (LETT |p| (CDR |p|) . #6#))))
                  ('T
                   (SEQ
                    (LETT |tm|
                          (|div_DF|
                           (|add_DF| (|SPADfirst| |t|)
                                     (SPADCALL |t| (QREFELT $ 48)))
                           (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                          . #6#)
                    (LETT |pm| (SPADCALL |tm| |f|) . #6#)
                    (SETELT $ 10 (+ (QREFELT $ 10) 1))
                    (SPADCALL |t| '|rest| (CONS |tm| (CDR |t|)) (QREFELT $ 50))
                    (LETT |t| (CDR (CDR |t|)) . #6#)
                    (SPADCALL |p| '|rest| (CONS |pm| (CDR |p|)) (QREFELT $ 52))
                    (EXIT (LETT |p| (CDR (CDR |p|)) . #6#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |t| (QVELT |curve| 2) . #6#) (LETT |p| (QVELT |curve| 3) . #6#)
          (LETT |xRange|
                (SPADCALL (|PLOT3D;select| |p| (ELT $ 54) (ELT $ 55) $)
                          (|PLOT3D;select| |p| (ELT $ 54) (ELT $ 56) $)
                          (QREFELT $ 24))
                . #6#)
          (LETT |yRange|
                (SPADCALL (|PLOT3D;select| |p| (ELT $ 57) (ELT $ 55) $)
                          (|PLOT3D;select| |p| (ELT $ 57) (ELT $ 56) $)
                          (QREFELT $ 24))
                . #6#)
          (LETT |zRange|
                (SPADCALL (|PLOT3D;select| |p| (ELT $ 58) (ELT $ 55) $)
                          (|PLOT3D;select| |p| (ELT $ 58) (ELT $ 56) $)
                          (QREFELT $ 24))
                . #6#)
          (EXIT
           (VECTOR (QVELT |curve| 0) (LIST |tRange| |xRange| |yRange| |zRange|)
                   |t| |p|))))) 

(SDEFUN |PLOT3D;refine;2$;29| ((|p| $) ($ $))
        (SPADCALL |p| (|PLOT3D;parametricRange| |p| $) (QREFELT $ 70))) 

(SDEFUN |PLOT3D;refine;$S$;30|
        ((|p| $) (|nRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|zRange| #1=(|Segment| (|DoubleFloat|))) (|yRange| #1#)
          (|xRange| #1#)
          (|curves|
           (|List|
            (|Record|
             (|:| |source|
                  (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
             (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
             (|:| |knots| (|List| (|DoubleFloat|)))
             (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
          (|scrres| (|Integer|)) (#2=#:G921 NIL) (|c| NIL) (#3=#:G920 NIL)
          (|tlimit| (|PositiveInteger|)) (#4=#:G919 NIL) (#5=#:G918 NIL)
          (|tRange| (|Segment| (|DoubleFloat|))))
         (SEQ (SETELT $ 10 0)
              (LETT |tRange| (|PLOT3D;parametricRange| |p| $)
                    . #6=(|PLOT3D;refine;$S$;30|))
              (LETT |nRange| (|PLOT3D;intersect| |tRange| |nRange| $) . #6#)
              (LETT |curves|
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |c| NIL . #6#) (LETT #4# (QVELT |p| 4) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (|PLOT3D;basicRefine| |c| |nRange| $)
                                        #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |xRange| (|PLOT3D;join| |curves| 1 $) . #6#)
              (LETT |yRange| (|PLOT3D;join| |curves| 2 $) . #6#)
              (LETT |zRange| (|PLOT3D;join| |curves| 3 $) . #6#)
              (LETT |scrres| (QVELT |p| 2) . #6#)
              (COND
               ((SPADCALL (QREFELT $ 36))
                (SEQ (LETT |tlimit| 8 . #6#)
                     (LETT |curves|
                           (PROGN
                            (LETT #3# NIL . #6#)
                            (SEQ (LETT |c| NIL . #6#) (LETT #2# |curves| . #6#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |c| (CAR #2#) . #6#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS
                                          (|PLOT3D;adaptivePlot| |c| |nRange|
                                           |xRange| |yRange| |zRange| |tlimit|
                                           (LETT |scrres|
                                                 (SPADCALL 2 |scrres|
                                                           (QREFELT $ 72))
                                                 . #6#)
                                           $)
                                          #3#)
                                         . #6#)))
                                 (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           . #6#)
                     (LETT |xRange| (|PLOT3D;join| |curves| 1 $) . #6#)
                     (LETT |yRange| (|PLOT3D;join| |curves| 2 $) . #6#)
                     (EXIT
                      (LETT |zRange| (|PLOT3D;join| |curves| 3 $) . #6#)))))
              (EXIT
               (VECTOR (QVELT |p| 0) (LIST |tRange| |xRange| |yRange| |zRange|)
                       |scrres| (QVELT |p| 3) |curves|))))) 

(SDEFUN |PLOT3D;plot;$S$;31|
        ((|p| $) (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|zRange| #1=(|Segment| (|DoubleFloat|))) (|yRange| #1#)
          (|xRange| #1#)
          (|curves|
           (|List|
            (|Record|
             (|:| |source|
                  (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
             (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
             (|:| |knots| (|List| (|DoubleFloat|)))
             (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
          (#2=#:G931 NIL) (|c| NIL) (#3=#:G930 NIL)
          (|tlimit| (|PositiveInteger|)) (#4=#:G929 NIL) (#5=#:G928 NIL))
         (SEQ (SETELT $ 10 0)
              (LETT |curves|
                    (PROGN
                     (LETT #5# NIL . #6=(|PLOT3D;plot;$S$;31|))
                     (SEQ (LETT |c| NIL . #6#) (LETT #4# (QVELT |p| 4) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (|PLOT3D;rangeRefine| |c| |tRange| $)
                                        #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |xRange| (|PLOT3D;join| |curves| 1 $) . #6#)
              (LETT |yRange| (|PLOT3D;join| |curves| 2 $) . #6#)
              (LETT |zRange| (|PLOT3D;join| |curves| 3 $) . #6#)
              (COND
               ((SPADCALL (QREFELT $ 36))
                (SEQ (LETT |tlimit| 8 . #6#)
                     (LETT |curves|
                           (PROGN
                            (LETT #3# NIL . #6#)
                            (SEQ (LETT |c| NIL . #6#) (LETT #2# |curves| . #6#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |c| (CAR #2#) . #6#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS
                                          (|PLOT3D;adaptivePlot| |c| |tRange|
                                           |xRange| |yRange| |zRange| |tlimit|
                                           (QVELT |p| 2) $)
                                          #3#)
                                         . #6#)))
                                 (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           . #6#)
                     (LETT |xRange| (|PLOT3D;join| |curves| 1 $) . #6#)
                     (LETT |yRange| (|PLOT3D;join| |curves| 2 $) . #6#)
                     (EXIT
                      (LETT |zRange| (|PLOT3D;join| |curves| 3 $) . #6#)))))
              (EXIT
               (VECTOR (LIST |xRange| |yRange| |zRange|)
                       (LIST |tRange| |xRange| |yRange| |zRange|) (QVELT |p| 2)
                       (QVELT |p| 3) |curves|))))) 

(SDEFUN |PLOT3D;pointPlot;MS$;32|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|p|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| #1=(|List| (|Segment| (|DoubleFloat|))))
            (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|))))))
          (|r| #1#))
         (SEQ
          (LETT |p| (|PLOT3D;basicPlot| |f| |tRange| $)
                . #2=(|PLOT3D;pointPlot;MS$;32|))
          (LETT |r| (QVELT |p| 1) . #2#) (SETELT $ 10 (QREFELT $ 8))
          (COND
           ((SPADCALL (QREFELT $ 36))
            (LETT |p|
                  (|PLOT3D;adaptivePlot| |p| (|SPADfirst| |r|)
                   (SPADCALL |r| (QREFELT $ 26)) (SPADCALL |r| (QREFELT $ 27))
                   (|PLOT3D;fourth| |r| $) 8 (QREFELT $ 11) $)
                  . #2#)))
          (EXIT (VECTOR (CDR |r|) |r| (QREFELT $ 11) NIL (LIST |p|)))))) 

(SDEFUN |PLOT3D;pointPlot;M4S$;33|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|))
         (|zRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |f| |tRange| (QREFELT $ 75))
                      |PLOT3D;pointPlot;M4S$;33|)
                (QSETVELT |p| 0
                          (LIST (|PLOT3D;checkRange| |xRange| $)
                                (|PLOT3D;checkRange| |yRange| $)
                                (|PLOT3D;checkRange| |zRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT3D;myTrap|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|f| |DoubleFloat|)
         ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ
                (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|))
                      . #1=(|PLOT3D;myTrap|))
                (COND ((QEQCAR |s| 1) (LETT |r| 0.0 . #1#))
                      ('T (LETT |r| (QCDR |s|) . #1#)))
                (EXIT |r|)))) 

(SDEFUN |PLOT3D;plot;4MS$;35|
        ((|f1| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|f2| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|f3| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|col| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|p|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| #1=(|List| (|Segment| (|DoubleFloat|))))
            (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|))))))
          (|r| #1#))
         (SEQ
          (LETT |p|
                (|PLOT3D;basicPlot|
                 (CONS #'|PLOT3D;plot;4MS$;35!0|
                       (VECTOR |col| |f3| |f2| $ |f1|))
                 |tRange| $)
                . #2=(|PLOT3D;plot;4MS$;35|))
          (LETT |r| (QVELT |p| 1) . #2#) (SETELT $ 10 (QREFELT $ 8))
          (COND
           ((SPADCALL (QREFELT $ 36))
            (LETT |p|
                  (|PLOT3D;adaptivePlot| |p| (|SPADfirst| |r|)
                   (SPADCALL |r| (QREFELT $ 26)) (SPADCALL |r| (QREFELT $ 27))
                   (|PLOT3D;fourth| |r| $) 8 (QREFELT $ 11) $)
                  . #2#)))
          (EXIT (VECTOR (CDR |r|) |r| (QREFELT $ 11) NIL (LIST |p|)))))) 

(SDEFUN |PLOT3D;plot;4MS$;35!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f1| $ |f2| |f3| |col|)
          (LETT |f1| (QREFELT $$ 4) . #1=(|PLOT3D;plot;4MS$;35|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |f2| (QREFELT $$ 2) . #1#)
          (LETT |f3| (QREFELT $$ 1) . #1#)
          (LETT |col| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|PLOT3D;point| (|PLOT3D;myTrap| |f1| |z1| $)
             (|PLOT3D;myTrap| |f2| |z1| $) (|PLOT3D;myTrap| |f3| |z1| $)
             (SPADCALL |z1| |col|) $))))) 

(SDEFUN |PLOT3D;plot;4M4S$;36|
        ((|f1| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|f2| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|f3| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|col| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|))
         (|zRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p|
                      (SPADCALL |f1| |f2| |f3| |col| |tRange| (QREFELT $ 78))
                      |PLOT3D;plot;4M4S$;36|)
                (QSETVELT |p| 0
                          (LIST (|PLOT3D;checkRange| |xRange| $)
                                (|PLOT3D;checkRange| |yRange| $)
                                (|PLOT3D;checkRange| |zRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT3D;coerce;$Of;37| ((|r| $) ($ |OutputForm|))
        (SPROG
         ((|f| (|List| (|OutputForm|))) (|l| (|List| #1=(|OutputForm|)))
          (#2=#:G976 NIL) (|p| NIL) (#3=#:G975 NIL) (|h| (|OutputForm|))
          (|zRange| #1#) (|yRange| #1#) (|xRange| #1#) (#4=#:G974 NIL)
          (|curve| NIL) (|tRange| (|OutputForm|)) (|tSymbol| #5=(|OutputForm|))
          (|zSymbol| #5#) (|ySymbol| #5#) (|xSymbol| #5#) (|spaces| #5#))
         (SEQ
          (LETT |spaces| (SPADCALL "   " (QREFELT $ 82))
                . #6=(|PLOT3D;coerce;$Of;37|))
          (LETT |xSymbol| (SPADCALL "x = " (QREFELT $ 82)) . #6#)
          (LETT |ySymbol| (SPADCALL "y = " (QREFELT $ 82)) . #6#)
          (LETT |zSymbol| (SPADCALL "z = " (QREFELT $ 82)) . #6#)
          (LETT |tSymbol| (SPADCALL "t = " (QREFELT $ 82)) . #6#)
          (LETT |tRange|
                (SPADCALL (|PLOT3D;parametricRange| |r| $) (QREFELT $ 83))
                . #6#)
          (LETT |f| NIL . #6#)
          (SEQ (LETT |curve| NIL . #6#) (LETT #4# (QVELT |r| 4) . #6#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |curve| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |xRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) 1 (QREFELT $ 84))
                                (QREFELT $ 83))
                      . #6#)
                (LETT |yRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) 2 (QREFELT $ 84))
                                (QREFELT $ 83))
                      . #6#)
                (LETT |zRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) 3 (QREFELT $ 84))
                                (QREFELT $ 83))
                      . #6#)
                (LETT |l|
                      (LIST |xSymbol| |xRange| |spaces| |ySymbol| |yRange|
                            |spaces| |zSymbol| |zRange|)
                      . #6#)
                (LETT |l|
                      (SPADCALL (LIST |tSymbol| |tRange| |spaces|) |l|
                                (QREFELT $ 86))
                      . #6#)
                (LETT |h| (SPADCALL |l| (QREFELT $ 88)) . #6#)
                (LETT |l|
                      (PROGN
                       (LETT #3# NIL . #6#)
                       (SEQ (LETT |p| NIL . #6#)
                            (LETT #2# (QVELT |curve| 3) . #6#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |p| (CAR #2#) . #6#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS (SPADCALL |p| (QREFELT $ 89)) #3#)
                                    . #6#)))
                            (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      . #6#)
                (EXIT
                 (LETT |f| (CONS (SPADCALL (CONS |h| |l|) (QREFELT $ 90)) |f|)
                       . #6#)))
               (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL "PLOT" (QREFELT $ 82)) (NREVERSE |f|)
                     (QREFELT $ 91)))))) 

(SDEFUN |PLOT3D;listBranches;$L;38|
        ((|plot| $) ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|outList| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (#1=#:G981 NIL) (|curve| NIL))
         (SEQ (LETT |outList| NIL . #2=(|PLOT3D;listBranches;$L;38|))
              (SEQ (LETT |curve| NIL . #2#) (LETT #1# (QVELT |plot| 4) . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |curve| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |outList| (CONS (QVELT |curve| 3) |outList|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |outList|)))) 

(DECLAIM (NOTINLINE |Plot3D;|)) 

(DEFUN |Plot3D| ()
  (SPROG NIL
         (PROG (#1=#:G983)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Plot3D|) . #2=(|Plot3D|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Plot3D|
                             (LIST (CONS NIL (CONS 1 (|Plot3D;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Plot3D|)))))))))) 

(DEFUN |Plot3D;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Plot3D|) . #1=(|Plot3D|))
          (LETT $ (GETREFV 95) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Plot3D| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record|
                     (|:| |display| (|List| (|Segment| (|DoubleFloat|))))
                     (|:| |bounds| (|List| (|Segment| (|DoubleFloat|))))
                     (|:| |screenres| (|Integer|))
                     (|:| |axisLabels| (|List| (|String|)))
                     (|:| |functions|
                          (|List|
                           (|Record|
                            (|:| |source|
                                 (|Mapping| (|Point| (|DoubleFloat|))
                                            (|DoubleFloat|)))
                            (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
                            (|:| |knots| (|List| (|DoubleFloat|)))
                            (|:| |points|
                                 (|List| (|Point| (|DoubleFloat|)))))))))
          (QSETREFV $ 7 'T)
          (QSETREFV $ 8 49)
          (QSETREFV $ 9 1000)
          (QSETREFV $ 10 0)
          (QSETREFV $ 11 500)
          (QSETREFV $ 14
                    (|cos_DF|
                     (SPADCALL (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)
                               (QREFELT $ 13))))
          (QSETREFV $ 15 NIL)
          $))) 

(MAKEPROP '|Plot3D| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| 'ADAPTIVE 'MINPOINTS 'MAXPOINTS
              'NUMFUNEVALS 'SCREENRES (|DoubleFloat|) (0 . |inv|) 'ANGLEBOUND
              'DEBUG (|List| 12) (|Point| 12) (5 . |point|) (|Segment| 12)
              (10 . |low|) (15 . |high|) (|Boolean|) (20 . >) (26 . SEGMENT)
              (|List| 19) (32 . |second|) (37 . |third|) (|Integer|)
              |PLOT3D;minPoints3D;I;8| |PLOT3D;setMinPoints3D;2I;9|
              |PLOT3D;maxPoints3D;I;10| (42 . >) |PLOT3D;setMaxPoints3D;2I;11|
              |PLOT3D;screenResolution3D;I;12|
              |PLOT3D;setScreenResolution3D;2I;13| |PLOT3D;adaptive3D?;B;14|
              |PLOT3D;setAdaptive3D;2B;15| |PLOT3D;numFunEvals3D;I;16|
              |PLOT3D;debug3D;2B;17| |PLOT3D;xRange;$S;18|
              |PLOT3D;yRange;$S;19| |PLOT3D;zRange;$S;20| |PLOT3D;tRange;$S;21|
              (|List| 16) |PLOT3D;tValues;$L;22| (48 . <=) (54 . ~=)
              (60 . |second|) '"rest" (65 . |setelt!|) (|List| 17)
              (72 . |setelt!|) (|PointPackage| 12) (79 . |xCoord|) (84 . |min|)
              (90 . |max|) (96 . |yCoord|) (101 . |zCoord|) (106 . |third|)
              (111 . |second|) (116 . |third|) (|PositiveInteger|) (121 . ^)
              (127 . |sqrt|) (132 . |list|) (137 . |list|)
              |PLOT3D;zoom;$3S$;27| (142 . |copy|) (147 . |copy|)
              |PLOT3D;refine;$S$;30| |PLOT3D;refine;2$;29| (152 . *)
              |PLOT3D;plot;$S$;31| (|Mapping| 17 12) |PLOT3D;pointPlot;MS$;32|
              |PLOT3D;pointPlot;M4S$;33| (|Mapping| 12 12)
              |PLOT3D;plot;4MS$;35| |PLOT3D;plot;4M4S$;36| (|String|)
              (|OutputForm|) (158 . |message|) (163 . |coerce|) (168 . |elt|)
              (|List| 81) (174 . |concat!|) (|List| $) (180 . |hconcat|)
              (185 . |coerce|) (190 . |vconcat|) (195 . |prefix|)
              |PLOT3D;coerce;$Of;37| (|List| 51) |PLOT3D;listBranches;$L;38|)
           '#(|zoom| 201 |zRange| 209 |yRange| 214 |xRange| 219 |tValues| 224
              |tRange| 229 |setScreenResolution3D| 234 |setMinPoints3D| 239
              |setMaxPoints3D| 244 |setAdaptive3D| 249 |screenResolution3D| 254
              |refine| 258 |pointPlot| 269 |plot| 284 |numFunEvals3D| 311
              |minPoints3D| 315 |maxPoints3D| 319 |listBranches| 323 |debug3D|
              328 |coerce| 333 |adaptive3D?| 338)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS
                        '#((|PlottableSpaceCurveCategory|) (|CoercibleTo| 81))
                        (|makeByteWordVec2| 94
                                            '(1 12 0 0 13 1 17 0 16 18 1 19 12
                                              0 20 1 19 12 0 21 2 12 22 0 0 23
                                              2 19 0 12 12 24 1 25 19 0 26 1 25
                                              19 0 27 2 28 22 0 0 32 2 12 22 0
                                              0 46 2 12 22 0 0 47 1 16 12 0 48
                                              3 16 0 0 49 0 50 3 51 0 0 49 0 52
                                              1 53 12 17 54 2 12 0 0 0 55 2 12
                                              0 0 0 56 1 53 12 17 57 1 53 12 17
                                              58 1 16 12 0 59 1 51 17 0 60 1 51
                                              17 0 61 2 12 0 0 62 63 1 12 0 0
                                              64 1 16 0 12 65 1 51 0 17 66 1 16
                                              0 0 68 1 51 0 0 69 2 28 0 62 0 72
                                              1 81 0 80 82 1 19 81 0 83 2 25 19
                                              0 28 84 2 85 0 0 0 86 1 81 0 87
                                              88 1 17 81 0 89 1 81 0 87 90 2 81
                                              0 0 87 91 4 0 0 0 19 19 19 67 1 0
                                              19 0 42 1 0 19 0 41 1 0 19 0 40 1
                                              0 44 0 45 1 0 19 0 43 1 0 28 28
                                              35 1 0 28 28 30 1 0 28 28 33 1 0
                                              22 22 37 0 0 28 34 1 0 0 0 71 2 0
                                              0 0 19 70 5 0 0 74 19 19 19 19 76
                                              2 0 0 74 19 75 2 0 0 0 19 73 5 0
                                              0 77 77 77 77 19 78 8 0 0 77 77
                                              77 77 19 19 19 19 79 0 0 28 38 0
                                              0 28 29 0 0 28 31 1 0 93 0 94 1 0
                                              22 22 39 1 0 81 0 92 0 0 22
                                              36)))))
           '|lookupComplete|)) 

(MAKEPROP '|Plot3D| 'NILADIC T) 
