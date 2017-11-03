
(SDEFUN |PLOT;Fnan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 17))) 

(SDEFUN |PLOT;Pnan?| ((|x| |Point| (|DoubleFloat|)) ($ |Boolean|))
        (SPADCALL (CONS (|function| |PLOT;Fnan?|) $) |x| (QREFELT $ 20))) 

(SDEFUN |PLOT;listBranches;$L;3|
        ((|plot| $) ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|outList| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|newl| (|List| (|Point| (|DoubleFloat|)))) (#1=#:G746 NIL) (|p| NIL)
          (#2=#:G745 NIL) (|curve| NIL))
         (SEQ (LETT |outList| NIL . #3=(|PLOT;listBranches;$L;3|))
              (SEQ (LETT |curve| NIL . #3#) (LETT #2# (QVELT |plot| 4) . #3#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |curve| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |newl| NIL . #3#)
                        (SEQ (LETT |p| NIL . #3#)
                             (LETT #1# (QVELT |curve| 3) . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|PLOT;Pnan?| |p| $)
                                 (COND
                                  ((NULL (NULL |newl|))
                                   (SEQ
                                    (LETT |outList|
                                          (CONS
                                           (LETT |newl| (NREVERSE |newl|)
                                                 . #3#)
                                           |outList|)
                                          . #3#)
                                    (EXIT (LETT |newl| NIL . #3#))))))
                                ('T (LETT |newl| (CONS |p| |newl|) . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL (NULL |newl|))
                           (LETT |outList|
                                 (CONS (LETT |newl| (NREVERSE |newl|) . #3#)
                                       |outList|)
                                 . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |outList|)))) 

(SDEFUN |PLOT;checkRange|
        ((|r| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (COND
         ((SPADCALL (SPADCALL |r| (QREFELT $ 24)) (SPADCALL |r| (QREFELT $ 25))
                    (QREFELT $ 26))
          (|error| "ranges cannot be negative"))
         ('T |r|))) 

(SDEFUN |PLOT;intersect|
        ((|s| |Segment| (|DoubleFloat|)) (|t| |Segment| (|DoubleFloat|))
         ($ |Segment| (|DoubleFloat|)))
        (|PLOT;checkRange|
         (SPADCALL
          (|max_DF| (SPADCALL |s| (QREFELT $ 24))
                    (SPADCALL |t| (QREFELT $ 24)))
          (|min_DF| (SPADCALL |s| (QREFELT $ 25))
                    (SPADCALL |t| (QREFELT $ 25)))
          (QREFELT $ 27))
         $)) 

(SDEFUN |PLOT;union|
        ((|s| |Segment| (|DoubleFloat|)) (|t| |Segment| (|DoubleFloat|))
         ($ |Segment| (|DoubleFloat|)))
        (SPADCALL
         (|min_DF| (SPADCALL |s| (QREFELT $ 24)) (SPADCALL |t| (QREFELT $ 24)))
         (|max_DF| (SPADCALL |s| (QREFELT $ 25)) (SPADCALL |t| (QREFELT $ 25)))
         (QREFELT $ 27))) 

(SDEFUN |PLOT;join|
        ((|l| |List|
          (|Record|
           (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
           (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
           (|:| |knots| (|List| (|DoubleFloat|)))
           (|:| |points| (|List| (|Point| (|DoubleFloat|))))))
         (|i| |Integer|) ($ |Segment| (|DoubleFloat|)))
        (SPROG
         ((|u| (|Segment| (|DoubleFloat|))) (#1=#:G757 NIL) (|r| NIL)
          (|rr|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
            (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ (LETT |rr| (|SPADfirst| |l|) . #2=(|PLOT;join|))
              (LETT |u|
                    (COND ((EQL |i| 0) (|SPADfirst| (QVELT |rr| 1)))
                          ((EQL |i| 1)
                           (SPADCALL (QVELT |rr| 1) (QREFELT $ 29)))
                          ('T (SPADCALL (QVELT |rr| 1) (QREFELT $ 30))))
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
                             (|PLOT;union| |u| (|SPADfirst| (QVELT |r| 1)) $)
                             . #2#))
                      ((EQL |i| 1)
                       (LETT |u|
                             (|PLOT;union| |u|
                              (SPADCALL (QVELT |r| 1) (QREFELT $ 29)) $)
                             . #2#))
                      ('T
                       (LETT |u|
                             (|PLOT;union| |u|
                              (SPADCALL (QVELT |r| 1) (QREFELT $ 30)) $)
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |u|)))) 

(SDEFUN |PLOT;parametricRange| ((|r| $) ($ |Segment| (|DoubleFloat|)))
        (|SPADfirst| (QVELT |r| 2))) 

(SDEFUN |PLOT;minPoints;I;9| (($ |Integer|)) (QREFELT $ 8)) 

(SDEFUN |PLOT;setMinPoints;2I;10| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
             (COND ((< (QREFELT $ 9) |n|) (SETELT $ 9 |n|)))
             (EXIT (SETELT $ 8 |n|)))) 

(SDEFUN |PLOT;maxPoints;I;11| (($ |Integer|)) (QREFELT $ 9)) 

(SDEFUN |PLOT;setMaxPoints;2I;12| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
             (COND
              ((SPADCALL (QREFELT $ 8) |n| (QREFELT $ 35)) (SETELT $ 8 |n|)))
             (EXIT (SETELT $ 9 |n|)))) 

(SDEFUN |PLOT;screenResolution;I;13| (($ |Integer|)) (QREFELT $ 11)) 

(SDEFUN |PLOT;setScreenResolution;2I;14| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 2) (|error| "buy a new terminal")))
             (EXIT (SETELT $ 11 |n|)))) 

(SDEFUN |PLOT;adaptive?;B;15| (($ |Boolean|)) (QREFELT $ 7)) 

(SDEFUN |PLOT;setAdaptive;2B;16| ((|b| |Boolean|) ($ |Boolean|))
        (SETELT $ 7 |b|)) 

(PUT '|PLOT;parametric?;$B;17| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 0))) 

(SDEFUN |PLOT;parametric?;$B;17| ((|p| $) ($ |Boolean|)) (QVELT |p| 0)) 

(SDEFUN |PLOT;numFunEvals;I;18| (($ |Integer|)) (QREFELT $ 10)) 

(SDEFUN |PLOT;debug;2B;19| ((|b| |Boolean|) ($ |Boolean|)) (SETELT $ 15 |b|)) 

(SDEFUN |PLOT;xRange;$S;20| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (SPADCALL (QVELT |plot| 2) (QREFELT $ 29))) 

(SDEFUN |PLOT;yRange;$S;21| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (SPADCALL (QVELT |plot| 2) (QREFELT $ 30))) 

(SDEFUN |PLOT;tRange;$S;22| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (|SPADfirst| (QVELT |plot| 2))) 

(SDEFUN |PLOT;select|
        ((|l| |List| (|Point| (|DoubleFloat|)))
         (|f| |Mapping| #1=(|DoubleFloat|) (|Point| (|DoubleFloat|)))
         (|g| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         ($ |DoubleFloat|))
        (SPROG ((|m| #1#) (|n| #1#) (#2=#:G781 NIL) (|p| NIL))
               (SEQ
                (LETT |m| (SPADCALL (|SPADfirst| |l|) |f|)
                      . #3=(|PLOT;select|))
                (COND ((|PLOT;Fnan?| |m| $) (LETT |m| 0.0 . #3#)))
                (SEQ (LETT |p| NIL . #3#) (LETT #2# (CDR |l|) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| |m| . #3#)
                          (LETT |m| (SPADCALL |m| (SPADCALL |p| |f|) |g|)
                                . #3#)
                          (EXIT
                           (COND ((|PLOT;Fnan?| |m| $) (LETT |m| |n| . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |PLOT;rangeRefine|
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
         ((|yRange| #4=(|Segment| (|DoubleFloat|))) (|xRange| #4#) (|p| #3#)
          (|t| #2#) (#5=#:G819 NIL) (|i| NIL) (|d| #6=(|DoubleFloat|))
          (|n| (|Integer|)) (|q| (|List| (|Point| (|DoubleFloat|))))
          (|c| (|List| (|DoubleFloat|))) (|s| #6#) (#7=#:G818 NIL) (|f| #1#)
          (|h| (|DoubleFloat|)) (|l| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (|PLOT;checkRange| |nRange| $)
                (LETT |l| (SPADCALL |nRange| (QREFELT $ 24))
                      . #8=(|PLOT;rangeRefine|))
                (LETT |h| (SPADCALL |nRange| (QREFELT $ 25)) . #8#)
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
                                         (QREFELT $ 47)))))
                       (GO G191)))
                     (SEQ (LETT |c| (CONS (|SPADfirst| |t|) |c|) . #8#)
                          (LETT |q| (CONS (|SPADfirst| |p|) |q|) . #8#)
                          (LETT |t| (CDR |t|) . #8#)
                          (EXIT (LETT |p| (CDR |p|) . #8#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((NULL |c|)
                  (PROGN
                   (LETT #7# (|PLOT;basicPlot| |f| |nRange| $) . #8#)
                   (GO #9=#:G817))))
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
                                 (FLOAT (SPADCALL (QREFELT $ 32))
                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                 1.0))
                      . #8#)
                (COND
                 ((SPADCALL (|SPADfirst| |t|) |l| (QREFELT $ 17))
                  (SEQ (LETT |t| (LETT |c| (CONS |l| |c|) . #8#) . #8#)
                       (LETT |p| (LETT |q| (CONS (SPADCALL |l| |f|) |p|) . #8#)
                             . #8#)
                       (EXIT (SETELT $ 10 (+ (QREFELT $ 10) 1))))))
                (SEQ G190 (COND ((NULL (NULL (NULL (CDR |t|)))) (GO G191)))
                     (SEQ
                      (LETT |n|
                            (TRUNCATE
                             (|div_DF|
                              (|sub_DF| (SPADCALL |t| (QREFELT $ 49))
                                        (|SPADfirst| |t|))
                              |s|))
                            . #8#)
                      (LETT |d|
                            (|div_DF|
                             (|sub_DF| (SPADCALL |t| (QREFELT $ 49))
                                       (|SPADfirst| |t|))
                             (FLOAT (+ |n| 1) MOST-POSITIVE-DOUBLE-FLOAT))
                            . #8#)
                      (SEQ (LETT |i| 1 . #8#) (LETT #5# |n| . #8#) G190
                           (COND ((|greater_SI| |i| #5#) (GO G191)))
                           (SEQ
                            (SPADCALL |t| '|rest|
                                      (CONS (|add_DF| (|SPADfirst| |t|) |d|)
                                            (CDR |t|))
                                      (QREFELT $ 51))
                            (SPADCALL |p| '|rest|
                                      (CONS
                                       (SPADCALL (SPADCALL |t| (QREFELT $ 49))
                                                 |f|)
                                       (CDR |p|))
                                      (QREFELT $ 53))
                            (SETELT $ 10 (+ (QREFELT $ 10) 1))
                            (LETT |t| (CDR |t|) . #8#)
                            (EXIT (LETT |p| (CDR |p|) . #8#)))
                           (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |t| (CDR |t|) . #8#)
                      (EXIT (LETT |p| (CDR |p|) . #8#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |xRange|
                      (SPADCALL (|PLOT;select| |q| (ELT $ 55) (ELT $ 56) $)
                                (|PLOT;select| |q| (ELT $ 55) (ELT $ 57) $)
                                (QREFELT $ 27))
                      . #8#)
                (LETT |yRange|
                      (SPADCALL (|PLOT;select| |q| (ELT $ 58) (ELT $ 56) $)
                                (|PLOT;select| |q| (ELT $ 58) (ELT $ 57) $)
                                (QREFELT $ 27))
                      . #8#)
                (EXIT (VECTOR |f| (LIST |nRange| |xRange| |yRange|) |c| |q|))))
          #9# (EXIT #7#)))) 

(SDEFUN |PLOT;adaptivePlot|
        ((|curve| |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|)))))
         (|tRange| |Segment| (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) (|pixelfraction| |Integer|)
         ($ |Record|
          (|:| |source|
               #1=(|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| #2=(|List| (|DoubleFloat|)))
          (|:| |points| #3=(|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|p| #3#) (|t| #2#) (|tj| #4=(|DoubleFloat|)) (|n| (|Integer|))
          (#5=#:G859 NIL) (|sp| #6=(|List| (|Point| (|DoubleFloat|))))
          (|st| #7=(|List| (|DoubleFloat|))) (|dp| (|DoubleFloat|))
          (|s2| #8=(|DoubleFloat|)) (|s1| #8#) (|b2| #4#) (|a2| #4#) (|b1| #4#)
          (|a1| #4#) (|y2| #9=(|DoubleFloat|)) (|x2| #10=(|DoubleFloat|))
          (|y1| #9#) (|x1| #10#) (|y0| #9#) (|x0| #10#) (|t2| (|DoubleFloat|))
          (|t1| (|DoubleFloat|)) (|t0| (|DoubleFloat|)) (|headerp| #6#)
          (|headert| #7#) (|tLimit| #4#) (|maxLength| #4#) (|minLength| #4#)
          (|f| #1#) (|tDiff| #11=(|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|l| (|DoubleFloat|)) (|yDiff| #11#) (|xDiff| #11#))
         (SEQ
          (LETT |xDiff|
                (|sub_DF| (SPADCALL |xRange| (QREFELT $ 25))
                          (SPADCALL |xRange| (QREFELT $ 24)))
                . #12=(|PLOT;adaptivePlot|))
          (LETT |yDiff|
                (|sub_DF| (SPADCALL |yRange| (QREFELT $ 25))
                          (SPADCALL |yRange| (QREFELT $ 24)))
                . #12#)
          (COND
           ((OR (|eql_DF| |xDiff| 0.0) (|eql_DF| |yDiff| 0.0)) (EXIT |curve|)))
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 24)) . #12#)
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 25)) . #12#)
          (LETT |tDiff| (|sub_DF| |h| |l|) . #12#)
          (EXIT
           (COND ((|eql_DF| |tDiff| 0.0) |curve|)
                 (#13='T
                  (SEQ (LETT |t| (QVELT |curve| 2) . #12#)
                       (EXIT
                        (COND ((< (LENGTH |t|) 3) |curve|)
                              (#13#
                               (SEQ (LETT |p| (QVELT |curve| 3) . #12#)
                                    (LETT |f| (QVELT |curve| 0) . #12#)
                                    (LETT |minLength|
                                          (|div_DF|
                                           (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)
                                           (FLOAT 500
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #12#)
                                    (LETT |maxLength|
                                          (|div_DF| 1.0
                                                    (FLOAT 6
                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #12#)
                                    (LETT |tLimit|
                                          (|div_DF| |tDiff|
                                                    (FLOAT
                                                     (* |pixelfraction| 500)
                                                     MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #12#)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND ((NULL |t|) NIL)
                                                  ('T
                                                   (|less_DF| (|SPADfirst| |t|)
                                                              |l|))))
                                           (GO G191)))
                                         (SEQ (LETT |t| (CDR |t|) . #12#)
                                              (EXIT
                                               (LETT |p| (CDR |p|) . #12#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND ((< (LENGTH |t|) 3) |curve|)
                                           (#13#
                                            (SEQ (LETT |headert| |t| . #12#)
                                                 (LETT |headerp| |p| . #12#)
                                                 (LETT |st| |headert| . #12#)
                                                 (LETT |sp| |headerp| . #12#)
                                                 (LETT |n| 0 . #12#)
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
                                                               . #12#)
                                                         (LETT |t1|
                                                               (SPADCALL |st|
                                                                         (QREFELT
                                                                          $
                                                                          49))
                                                               . #12#)
                                                         (LETT |t2|
                                                               (SPADCALL |st|
                                                                         (QREFELT
                                                                          $
                                                                          59))
                                                               . #12#)
                                                         (COND
                                                          ((SPADCALL |t2| |h|
                                                                     (QREFELT $
                                                                              26))
                                                           (PROGN
                                                            (LETT #5#
                                                                  |$NoValue|
                                                                  . #12#)
                                                            (GO #14=#:G839))))
                                                         (EXIT
                                                          (COND
                                                           ((|less_DF|
                                                             (|sub_DF| |t2|
                                                                       |t0|)
                                                             |tLimit|)
                                                            (SEQ
                                                             (LETT |st|
                                                                   (CDR |st|)
                                                                   . #12#)
                                                             (EXIT
                                                              (LETT |sp|
                                                                    (CDR |sp|)
                                                                    . #12#))))
                                                           ('T
                                                            (SEQ
                                                             (LETT |x0|
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |sp|)
                                                                    (QREFELT $
                                                                             55))
                                                                   . #12#)
                                                             (LETT |y0|
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |sp|)
                                                                    (QREFELT $
                                                                             58))
                                                                   . #12#)
                                                             (LETT |x1|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              60))
                                                                    (QREFELT $
                                                                             55))
                                                                   . #12#)
                                                             (LETT |y1|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              60))
                                                                    (QREFELT $
                                                                             58))
                                                                   . #12#)
                                                             (LETT |x2|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              61))
                                                                    (QREFELT $
                                                                             55))
                                                                   . #12#)
                                                             (LETT |y2|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              61))
                                                                    (QREFELT $
                                                                             58))
                                                                   . #12#)
                                                             (LETT |a1|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |x1| |x0|)
                                                                    |xDiff|)
                                                                   . #12#)
                                                             (LETT |b1|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |y1| |y0|)
                                                                    |yDiff|)
                                                                   . #12#)
                                                             (LETT |a2|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |x2| |x1|)
                                                                    |xDiff|)
                                                                   . #12#)
                                                             (LETT |b2|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |y2| |y1|)
                                                                    |yDiff|)
                                                                   . #12#)
                                                             (LETT |s1|
                                                                   (SPADCALL
                                                                    (|add_DF|
                                                                     (SPADCALL
                                                                      |a1| 2
                                                                      (QREFELT
                                                                       $ 63))
                                                                     (SPADCALL
                                                                      |b1| 2
                                                                      (QREFELT
                                                                       $ 63)))
                                                                    (QREFELT $
                                                                             64))
                                                                   . #12#)
                                                             (LETT |s2|
                                                                   (SPADCALL
                                                                    (|add_DF|
                                                                     (SPADCALL
                                                                      |a2| 2
                                                                      (QREFELT
                                                                       $ 63))
                                                                     (SPADCALL
                                                                      |b2| 2
                                                                      (QREFELT
                                                                       $ 63)))
                                                                    (QREFELT $
                                                                             64))
                                                                   . #12#)
                                                             (LETT |dp|
                                                                   (|add_DF|
                                                                    (|mul_DF|
                                                                     |a1| |a2|)
                                                                    (|mul_DF|
                                                                     |b1|
                                                                     |b2|))
                                                                   . #12#)
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
                                                                           . #12#)
                                                                     (EXIT
                                                                      (LETT
                                                                       |sp|
                                                                       (CDR
                                                                        |sp|)
                                                                       . #12#)))))
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
                                                                        $ 26)))
                                                                     (EXIT
                                                                      (SEQ
                                                                       (LETT
                                                                        |st|
                                                                        (CDR
                                                                         |st|)
                                                                        . #12#)
                                                                       (EXIT
                                                                        (LETT
                                                                         |sp|
                                                                         (CDR
                                                                          |sp|)
                                                                         . #12#)))))))
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
                                                                       $ 26))
                                                                     (EXIT
                                                                      (SEQ
                                                                       (LETT
                                                                        |st|
                                                                        (CDR
                                                                         |st|)
                                                                        . #12#)
                                                                       (EXIT
                                                                        (LETT
                                                                         |sp|
                                                                         (CDR
                                                                          |sp|)
                                                                         . #12#))))))))))))
                                                             (COND
                                                              ((SPADCALL |n|
                                                                         (QREFELT
                                                                          $ 9)
                                                                         (QREFELT
                                                                          $
                                                                          35))
                                                               (PROGN
                                                                (LETT #5#
                                                                      |$NoValue|
                                                                      . #12#)
                                                                (GO #14#)))
                                                              ('T
                                                               (LETT |n|
                                                                     (+ |n| 1)
                                                                     . #12#)))
                                                             (LETT |t| |st|
                                                                   . #12#)
                                                             (LETT |p| |sp|
                                                                   . #12#)
                                                             (LETT |tj|
                                                                   (|div_DF|
                                                                    (|add_DF|
                                                                     |t0| |t1|)
                                                                    (FLOAT 2
                                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                                                   . #12#)
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
                                                                   . #12#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #12#)
                                                             (LETT |t|
                                                                   (CDR |t|)
                                                                   . #12#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #12#)
                                                             (LETT |tj|
                                                                   (|div_DF|
                                                                    (|add_DF|
                                                                     |t1| |t2|)
                                                                    (FLOAT 2
                                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                                                   . #12#)
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
                                                  #14# (EXIT #5#))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |n| 0
                                                              (QREFELT $ 35))
                                                    (SEQ
                                                     (SETELT $ 10
                                                             (+ (QREFELT $ 10)
                                                                |n|))
                                                     (LETT |t|
                                                           (QVELT |curve| 2)
                                                           . #12#)
                                                     (LETT |p|
                                                           (QVELT |curve| 3)
                                                           . #12#)
                                                     (LETT |xRange|
                                                           (SPADCALL
                                                            (|PLOT;select| |p|
                                                             (ELT $ 55)
                                                             (ELT $ 56) $)
                                                            (|PLOT;select| |p|
                                                             (ELT $ 55)
                                                             (ELT $ 57) $)
                                                            (QREFELT $ 27))
                                                           . #12#)
                                                     (LETT |yRange|
                                                           (SPADCALL
                                                            (|PLOT;select| |p|
                                                             (ELT $ 58)
                                                             (ELT $ 56) $)
                                                            (|PLOT;select| |p|
                                                             (ELT $ 58)
                                                             (ELT $ 57) $)
                                                            (QREFELT $ 27))
                                                           . #12#)
                                                     (EXIT
                                                      (VECTOR (QVELT |curve| 0)
                                                              (LIST |tRange|
                                                                    |xRange|
                                                                    |yRange|)
                                                              |t| |p|))))
                                                   (#13#
                                                    |curve|)))))))))))))))))) 

(SDEFUN |PLOT;basicPlot|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         ($ |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|yRange| #1=(|Segment| (|DoubleFloat|))) (|xRange| #1#)
          (|p| (|List| (|Point| (|DoubleFloat|))))
          (|t| (|List| (|DoubleFloat|))) (|l| (|DoubleFloat|)) (#2=#:G878 NIL)
          (|i| NIL) (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|)))
         (SEQ (|PLOT;checkRange| |tRange| $)
              (LETT |l| (SPADCALL |tRange| (QREFELT $ 24))
                    . #3=(|PLOT;basicPlot|))
              (LETT |h| (SPADCALL |tRange| (QREFELT $ 25)) . #3#)
              (LETT |t| (SPADCALL |l| (QREFELT $ 65)) . #3#)
              (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 66)) . #3#)
              (LETT |s|
                    (|div_DF| (|sub_DF| |h| |l|)
                              (FLOAT (- (SPADCALL (QREFELT $ 32)) 1)
                                     MOST-POSITIVE-DOUBLE-FLOAT))
                    . #3#)
              (SEQ (LETT |i| 2 . #3#)
                   (LETT #2# (- (SPADCALL (QREFELT $ 32)) 1) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |l| (|add_DF| |l| |s|) . #3#)
                        (LETT |t| (CONS |l| |t|) . #3#)
                        (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|) . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |t| (NREVERSE (CONS |h| |t|)) . #3#)
              (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)) . #3#)
              (LETT |xRange|
                    (SPADCALL (|PLOT;select| |p| (ELT $ 55) (ELT $ 56) $)
                              (|PLOT;select| |p| (ELT $ 55) (ELT $ 57) $)
                              (QREFELT $ 27))
                    . #3#)
              (LETT |yRange|
                    (SPADCALL (|PLOT;select| |p| (ELT $ 58) (ELT $ 56) $)
                              (|PLOT;select| |p| (ELT $ 58) (ELT $ 57) $)
                              (QREFELT $ 27))
                    . #3#)
              (EXIT (VECTOR |f| (LIST |tRange| |xRange| |yRange|) |t| |p|))))) 

(SDEFUN |PLOT;zoom;$S$;27| ((|p| $) (|xRange| |Segment| (|DoubleFloat|)) ($ $))
        (VECTOR (QVELT |p| 0)
                (LIST |xRange| (SPADCALL (QVELT |p| 1) (QREFELT $ 30)))
                (QVELT |p| 2) (QVELT |p| 3) (QVELT |p| 4))) 

(SDEFUN |PLOT;zoom;$2S$;28|
        ((|p| $) (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (VECTOR (QVELT |p| 0) (LIST |xRange| |yRange|) (QVELT |p| 2)
                (QVELT |p| 3) (QVELT |p| 4))) 

(SDEFUN |PLOT;basicRefine|
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
         ((|yRange| #5=(|Segment| (|DoubleFloat|))) (|xRange| #5#) (|p| #4#)
          (|t| #3#) (|pm| #2#) (|tm| (|DoubleFloat|)) (|f| #1#)
          (|h| (|DoubleFloat|)) (|l| (|DoubleFloat|))
          (|tRange| (|Segment| (|DoubleFloat|))))
         (SEQ
          (LETT |tRange| (|SPADfirst| (QVELT |curve| 1))
                . #6=(|PLOT;basicRefine|))
          (LETT |curve|
                (VECTOR (QVELT |curve| 0) (QVELT |curve| 1) (QVELT |curve| 2)
                        (QVELT |curve| 3))
                . #6#)
          (LETT |t|
                (QSETVELT |curve| 2
                          (SPADCALL (QVELT |curve| 2) (QREFELT $ 69)))
                . #6#)
          (LETT |p|
                (QSETVELT |curve| 3
                          (SPADCALL (QVELT |curve| 3) (QREFELT $ 70)))
                . #6#)
          (LETT |l| (SPADCALL |nRange| (QREFELT $ 24)) . #6#)
          (LETT |h| (SPADCALL |nRange| (QREFELT $ 25)) . #6#)
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
                  ((|less_DF| (SPADCALL |t| (QREFELT $ 49)) |l|)
                   (SEQ (LETT |t| (CDR |t|) . #6#)
                        (EXIT (LETT |p| (CDR |p|) . #6#))))
                  ('T
                   (SEQ
                    (LETT |tm|
                          (|div_DF|
                           (|add_DF| (|SPADfirst| |t|)
                                     (SPADCALL |t| (QREFELT $ 49)))
                           (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                          . #6#)
                    (LETT |pm| (SPADCALL |tm| |f|) . #6#)
                    (SETELT $ 10 (+ (QREFELT $ 10) 1))
                    (SPADCALL |t| '|rest| (CONS |tm| (CDR |t|)) (QREFELT $ 51))
                    (LETT |t| (CDR (CDR |t|)) . #6#)
                    (SPADCALL |p| '|rest| (CONS |pm| (CDR |p|)) (QREFELT $ 53))
                    (EXIT (LETT |p| (CDR (CDR |p|)) . #6#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |t| (QVELT |curve| 2) . #6#) (LETT |p| (QVELT |curve| 3) . #6#)
          (LETT |xRange|
                (SPADCALL (|PLOT;select| |p| (ELT $ 55) (ELT $ 56) $)
                          (|PLOT;select| |p| (ELT $ 55) (ELT $ 57) $)
                          (QREFELT $ 27))
                . #6#)
          (LETT |yRange|
                (SPADCALL (|PLOT;select| |p| (ELT $ 58) (ELT $ 56) $)
                          (|PLOT;select| |p| (ELT $ 58) (ELT $ 57) $)
                          (QREFELT $ 27))
                . #6#)
          (EXIT
           (VECTOR (QVELT |curve| 0) (LIST |tRange| |xRange| |yRange|) |t|
                   |p|))))) 

(SDEFUN |PLOT;refine;2$;30| ((|p| $) ($ $))
        (SPADCALL |p| (|PLOT;parametricRange| |p| $) (QREFELT $ 71))) 

(SDEFUN |PLOT;refine;$S$;31|
        ((|p| $) (|nRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|yRange| #1=(|Segment| (|DoubleFloat|))) (|xRange| #1#)
          (|curves|
           (|List|
            (|Record|
             (|:| |source|
                  (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
             (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
             (|:| |knots| (|List| (|DoubleFloat|)))
             (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
          (#2=#:G916 NIL) (|c| NIL) (#3=#:G915 NIL)
          (|tlimit| (|PositiveInteger|)) (#4=#:G914 NIL) (#5=#:G913 NIL)
          (|tRange| (|Segment| (|DoubleFloat|))))
         (SEQ (SETELT $ 10 0)
              (LETT |tRange| (|PLOT;parametricRange| |p| $)
                    . #6=(|PLOT;refine;$S$;31|))
              (LETT |nRange| (|PLOT;intersect| |tRange| |nRange| $) . #6#)
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
                                  (CONS (|PLOT;basicRefine| |c| |nRange| $)
                                        #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |xRange| (|PLOT;join| |curves| 1 $) . #6#)
              (LETT |yRange| (|PLOT;join| |curves| 2 $) . #6#)
              (COND
               ((SPADCALL (QREFELT $ 39))
                (SEQ
                 (LETT |tlimit| (COND ((SPADCALL |p| (QREFELT $ 41)) 8) ('T 1))
                       . #6#)
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
                                      (|PLOT;adaptivePlot| |c| |nRange|
                                       |xRange| |yRange| |tlimit| $)
                                      #3#)
                                     . #6#)))
                             (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       . #6#)
                 (LETT |xRange| (|PLOT;join| |curves| 1 $) . #6#)
                 (EXIT (LETT |yRange| (|PLOT;join| |curves| 2 $) . #6#)))))
              (EXIT
               (VECTOR (QVELT |p| 0) (QVELT |p| 1)
                       (LIST |tRange| |xRange| |yRange|) (QVELT |p| 3)
                       |curves|))))) 

(SDEFUN |PLOT;plot;$S$;32| ((|p| $) (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|yRange| #1=(|Segment| (|DoubleFloat|))) (|xRange| #1#)
          (|curves|
           (|List|
            (|Record|
             (|:| |source|
                  (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
             (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
             (|:| |knots| (|List| (|DoubleFloat|)))
             (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
          (#2=#:G927 NIL) (|c| NIL) (#3=#:G926 NIL)
          (|tlimit| (|PositiveInteger|)) (#4=#:G925 NIL) (#5=#:G924 NIL))
         (SEQ (SETELT $ 10 0)
              (LETT |curves|
                    (PROGN
                     (LETT #5# NIL . #6=(|PLOT;plot;$S$;32|))
                     (SEQ (LETT |c| NIL . #6#) (LETT #4# (QVELT |p| 4) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (|PLOT;rangeRefine| |c| |tRange| $)
                                        #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |xRange| (|PLOT;join| |curves| 1 $) . #6#)
              (LETT |yRange| (|PLOT;join| |curves| 2 $) . #6#)
              (COND
               ((SPADCALL (QREFELT $ 39))
                (SEQ
                 (LETT |tlimit| (COND ((SPADCALL |p| (QREFELT $ 41)) 8) ('T 1))
                       . #6#)
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
                                      (|PLOT;adaptivePlot| |c| |tRange|
                                       |xRange| |yRange| |tlimit| $)
                                      #3#)
                                     . #6#)))
                             (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       . #6#)
                 (LETT |xRange| (|PLOT;join| |curves| 1 $) . #6#)
                 (EXIT (LETT |yRange| (|PLOT;join| |curves| 2 $) . #6#)))))
              (EXIT
               (VECTOR (QVELT |p| 0) (LIST |xRange| |yRange|)
                       (LIST |tRange| |xRange| |yRange|) (QVELT |p| 3)
                       |curves|))))) 

(SDEFUN |PLOT;pt|
        ((|xx| |DoubleFloat|) (|yy| . #1=(|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |xx| |yy|) |PLOT;pt|) (QREFELT $ 74)))) 

(SDEFUN |PLOT;myTrap|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|f| |DoubleFloat|)
         ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ
                (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|))
                      . #1=(|PLOT;myTrap|))
                (EXIT
                 (COND ((QEQCAR |s| 1) 0.0)
                       (#2='T
                        (SEQ (LETT |r| (QCDR |s|) . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                          (QREFELT $ 26))
                                MOST-POSITIVE-DOUBLE-FLOAT)
                               ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                MOST-NEGATIVE-DOUBLE-FLOAT)
                               (#2# |r|)))))))))) 

(SDEFUN |PLOT;plot;MS$;35|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|r| #1=(|List| (|Segment| (|DoubleFloat|))))
          (|p|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| #1#) (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ
          (LETT |p|
                (|PLOT;basicPlot| (CONS #'|PLOT;plot;MS$;35!0| (VECTOR $ |f|))
                 |xRange| $)
                . #2=(|PLOT;plot;MS$;35|))
          (LETT |r| (QVELT |p| 1) . #2#)
          (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
          (COND
           ((SPADCALL (QREFELT $ 39))
            (SEQ
             (LETT |p|
                   (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                    (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30))
                    1 $)
                   . #2#)
             (EXIT (LETT |r| (QVELT |p| 1) . #2#)))))
          (EXIT (VECTOR NIL (CDR |r|) |r| NIL (LIST |p|)))))) 

(SDEFUN |PLOT;plot;MS$;35!0| ((|u1| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plot;MS$;35|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PLOT;pt| |u1| (|PLOT;myTrap| |f| |u1| $) $))))) 

(SDEFUN |PLOT;plot;M2S$;36|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |f| |xRange| (QREFELT $ 76))
                      |PLOT;plot;M2S$;36|)
                (QSETVELT |p| 1 (LIST |xRange| (|PLOT;checkRange| |yRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT;plot;2MS$;37|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|g| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|r| #1=(|List| (|Segment| (|DoubleFloat|))))
          (|p|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| #1#) (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ
          (LETT |p|
                (|PLOT;basicPlot|
                 (CONS #'|PLOT;plot;2MS$;37!0| (VECTOR |g| $ |f|)) |tRange| $)
                . #2=(|PLOT;plot;2MS$;37|))
          (LETT |r| (QVELT |p| 1) . #2#)
          (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
          (COND
           ((SPADCALL (QREFELT $ 39))
            (SEQ
             (LETT |p|
                   (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                    (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30))
                    8 $)
                   . #2#)
             (EXIT (LETT |r| (QVELT |p| 1) . #2#)))))
          (EXIT (VECTOR 'T (CDR |r|) |r| NIL (LIST |p|)))))) 

(SDEFUN |PLOT;plot;2MS$;37!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| $ |g|)
          (LETT |f| (QREFELT $$ 2) . #1=(|PLOT;plot;2MS$;37|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |g| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|PLOT;pt| (|PLOT;myTrap| |f| |z1| $) (|PLOT;myTrap| |g| |z1| $)
             $))))) 

(SDEFUN |PLOT;plot;2M3S$;38|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|g| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |f| |g| |tRange| (QREFELT $ 78))
                      |PLOT;plot;2M3S$;38|)
                (QSETVELT |p| 1
                          (LIST (|PLOT;checkRange| |xRange| $)
                                (|PLOT;checkRange| |yRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT;pointPlot;MS$;39|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|r| #1=(|List| (|Segment| (|DoubleFloat|))))
          (|p|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| #1#) (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ
          (LETT |p| (|PLOT;basicPlot| |f| |tRange| $)
                . #2=(|PLOT;pointPlot;MS$;39|))
          (LETT |r| (QVELT |p| 1) . #2#)
          (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
          (COND
           ((SPADCALL (QREFELT $ 39))
            (SEQ
             (LETT |p|
                   (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                    (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30))
                    8 $)
                   . #2#)
             (EXIT (LETT |r| (QVELT |p| 1) . #2#)))))
          (EXIT (VECTOR 'T (CDR |r|) |r| NIL (LIST |p|)))))) 

(SDEFUN |PLOT;pointPlot;M3S$;40|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |f| |tRange| (QREFELT $ 81))
                      |PLOT;pointPlot;M3S$;40|)
                (QSETVELT |p| 1
                          (LIST (|PLOT;checkRange| |xRange| $)
                                (|PLOT;checkRange| |yRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT;plot;LS$;41|
        ((|l| |List| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|xRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|yRange| (|Segment| (|DoubleFloat|)))
          (|t|
           (|List|
            (|Record|
             (|:| |source|
                  (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
             (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
             (|:| |knots| (|List| (|DoubleFloat|)))
             (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
          (#1=#:G982 NIL) (|f| NIL) (#2=#:G983 NIL) (|p| NIL) (#3=#:G981 NIL)
          (#4=#:G980 NIL) (#5=#:G979 NIL))
         (SEQ (COND ((NULL |l|) (|error| "empty list of functions")))
              (LETT |t|
                    (PROGN
                     (LETT #5# NIL . #6=(|PLOT;plot;LS$;41|))
                     (SEQ (LETT |f| NIL . #6#) (LETT #4# |l| . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (|PLOT;basicPlot|
                                    (CONS #'|PLOT;plot;LS$;41!0|
                                          (VECTOR $ |f|))
                                    |xRange| $)
                                   #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |yRange| (|PLOT;join| |t| 2 $) . #6#)
              (SETELT $ 10
                      (SPADCALL (LENGTH |l|) (SPADCALL (QREFELT $ 32))
                                (QREFELT $ 84)))
              (COND
               ((SPADCALL (QREFELT $ 39))
                (SEQ
                 (LETT |t|
                       (PROGN
                        (LETT #3# NIL . #6#)
                        (SEQ (LETT |p| NIL . #6#) (LETT #2# |t| . #6#)
                             (LETT |f| NIL . #6#) (LETT #1# |l| . #6#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |f| (CAR #1#) . #6#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |p| (CAR #2#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS
                                      (|PLOT;adaptivePlot| |p| |xRange|
                                       |xRange| |yRange| 1 $)
                                      #3#)
                                     . #6#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #6#))
                                   . #6#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #6#)
                 (EXIT (LETT |yRange| (|PLOT;join| |t| 2 $) . #6#)))))
              (EXIT
               (VECTOR NIL (LIST |xRange| |yRange|)
                       (LIST |xRange| |xRange| |yRange|) NIL |t|))))) 

(SDEFUN |PLOT;plot;LS$;41!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plot;LS$;41|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PLOT;pt| |z1| (|PLOT;myTrap| |f| |z1| $) $))))) 

(SDEFUN |PLOT;plot;L2S$;42|
        ((|l| |List| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |l| |xRange| (QREFELT $ 86))
                      |PLOT;plot;L2S$;42|)
                (QSETVELT |p| 1 (LIST |xRange| (|PLOT;checkRange| |yRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT;plotPolar;MS$;43|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|thetaRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|PLOT;plotPolar;MS$;43!0| (VECTOR $ |f|))
                         (CONS #'|PLOT;plotPolar;MS$;43!1| (VECTOR $ |f|))
                         |thetaRange| (QREFELT $ 78)))) 

(SDEFUN |PLOT;plotPolar;MS$;43!1| ((|v1| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plotPolar;MS$;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |v1| |f|) (SPADCALL |v1| (QREFELT $ 90))
                      (QREFELT $ 89)))))) 

(SDEFUN |PLOT;plotPolar;MS$;43!0| ((|u1| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plotPolar;MS$;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |u1| |f|) (SPADCALL |u1| (QREFELT $ 88))
                      (QREFELT $ 89)))))) 

(SDEFUN |PLOT;plotPolar;M$;44|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) ($ $))
        (SPADCALL |f|
                  (SPADCALL 0.0
                            (SPADCALL 2 (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                                      (QREFELT $ 92))
                            (QREFELT $ 93))
                  (QREFELT $ 91))) 

(SDEFUN |PLOT;coerce;$Of;45| ((|r| $) ($ |OutputForm|))
        (SPROG
         ((|f| (|List| (|OutputForm|))) (|l| (|List| #1=(|OutputForm|)))
          (#2=#:G1003 NIL) (|p| NIL) (#3=#:G1002 NIL) (|h| (|OutputForm|))
          (|yRange| #1#) (|xRange| (|OutputForm|)) (#4=#:G1001 NIL)
          (|curve| NIL) (|tRange| (|OutputForm|))
          (|plotSymbol| #5=(|OutputForm|)) (|tSymbol| #5#) (|ySymbol| #5#)
          (|xSymbol| #5#) (|spaces| #5#))
         (SEQ
          (LETT |spaces| (SPADCALL "   " (QREFELT $ 97))
                . #6=(|PLOT;coerce;$Of;45|))
          (LETT |xSymbol| (SPADCALL "x = " (QREFELT $ 97)) . #6#)
          (LETT |ySymbol| (SPADCALL "y = " (QREFELT $ 97)) . #6#)
          (LETT |tSymbol| (SPADCALL "t = " (QREFELT $ 97)) . #6#)
          (LETT |plotSymbol| (SPADCALL "PLOT" (QREFELT $ 97)) . #6#)
          (LETT |tRange|
                (SPADCALL (|PLOT;parametricRange| |r| $) (QREFELT $ 98)) . #6#)
          (LETT |f| NIL . #6#)
          (SEQ (LETT |curve| NIL . #6#) (LETT #4# (QVELT |r| 4) . #6#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |curve| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |xRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) (QREFELT $ 29))
                                (QREFELT $ 98))
                      . #6#)
                (LETT |yRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) (QREFELT $ 30))
                                (QREFELT $ 98))
                      . #6#)
                (LETT |l| (LIST |xSymbol| |xRange| |spaces| |ySymbol| |yRange|)
                      . #6#)
                (COND
                 ((SPADCALL |r| (QREFELT $ 41))
                  (LETT |l|
                        (SPADCALL (LIST |tSymbol| |tRange| |spaces|) |l|
                                  (QREFELT $ 100))
                        . #6#)))
                (LETT |h| (SPADCALL |l| (QREFELT $ 102)) . #6#)
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
                                    (CONS (SPADCALL |p| (QREFELT $ 103)) #3#)
                                    . #6#)))
                            (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      . #6#)
                (EXIT
                 (LETT |f| (CONS (SPADCALL (CONS |h| |l|) (QREFELT $ 104)) |f|)
                       . #6#)))
               (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |plotSymbol| (NREVERSE |f|) (QREFELT $ 105)))))) 

(DECLAIM (NOTINLINE |Plot;|)) 

(DEFUN |Plot| ()
  (SPROG NIL
         (PROG (#1=#:G1005)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Plot|) . #2=(|Plot|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Plot|
                             (LIST (CONS NIL (CONS 1 (|Plot;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Plot|)))))))))) 

(DEFUN |Plot;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Plot|) . #1=(|Plot|))
          (LETT $ (GETREFV 107) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Plot| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |parametric| (|Boolean|))
                              (|:| |display|
                                   (|List| (|Segment| (|DoubleFloat|))))
                              (|:| |bounds|
                                   (|List| (|Segment| (|DoubleFloat|))))
                              (|:| |axisLabels| (|List| (|String|)))
                              (|:| |functions|
                                   (|List|
                                    (|Record|
                                     (|:| |source|
                                          (|Mapping| (|Point| (|DoubleFloat|))
                                                     (|DoubleFloat|)))
                                     (|:| |ranges|
                                          (|List| (|Segment| (|DoubleFloat|))))
                                     (|:| |knots| (|List| (|DoubleFloat|)))
                                     (|:| |points|
                                          (|List|
                                           (|Point| (|DoubleFloat|)))))))))
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

(MAKEPROP '|Plot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| 'ADAPTIVE 'MINPOINTS 'MAXPOINTS
              'NUMFUNEVALS 'SCREENRES (|DoubleFloat|) (0 . |inv|) 'ANGLEBOUND
              'DEBUG (|Boolean|) (5 . ~=) (|Mapping| 16 12) (|Point| 12)
              (11 . |any?|) (|List| 52) |PLOT;listBranches;$L;3| (|Segment| 12)
              (17 . |low|) (22 . |high|) (27 . >) (33 . SEGMENT) (|List| 23)
              (39 . |second|) (44 . |third|) (|Integer|) |PLOT;minPoints;I;9|
              |PLOT;setMinPoints;2I;10| |PLOT;maxPoints;I;11| (49 . >)
              |PLOT;setMaxPoints;2I;12| |PLOT;screenResolution;I;13|
              |PLOT;setScreenResolution;2I;14| |PLOT;adaptive?;B;15|
              |PLOT;setAdaptive;2B;16| |PLOT;parametric?;$B;17|
              |PLOT;numFunEvals;I;18| |PLOT;debug;2B;19| |PLOT;xRange;$S;20|
              |PLOT;yRange;$S;21| |PLOT;tRange;$S;22| (55 . <=) (|List| 12)
              (61 . |second|) '"rest" (66 . |setelt!|) (|List| 19)
              (73 . |setelt!|) (|PointPackage| 12) (80 . |xCoord|) (85 . |min|)
              (91 . |max|) (97 . |yCoord|) (102 . |third|) (107 . |second|)
              (112 . |third|) (|PositiveInteger|) (117 . ^) (123 . |sqrt|)
              (128 . |list|) (133 . |list|) |PLOT;zoom;$S$;27|
              |PLOT;zoom;$2S$;28| (138 . |copy|) (143 . |copy|)
              |PLOT;refine;$S$;31| |PLOT;refine;2$;30| |PLOT;plot;$S$;32|
              (148 . |point|) (|Mapping| 12 12) |PLOT;plot;MS$;35|
              |PLOT;plot;M2S$;36| |PLOT;plot;2MS$;37| |PLOT;plot;2M3S$;38|
              (|Mapping| 19 12) |PLOT;pointPlot;MS$;39|
              |PLOT;pointPlot;M3S$;40| (|NonNegativeInteger|) (153 . *)
              (|List| 75) |PLOT;plot;LS$;41| |PLOT;plot;L2S$;42| (159 . |cos|)
              (164 . *) (170 . |sin|) |PLOT;plotPolar;MS$;43| (175 . *)
              (181 . |segment|) |PLOT;plotPolar;M$;44| (|String|)
              (|OutputForm|) (187 . |message|) (192 . |coerce|) (|List| 96)
              (197 . |concat!|) (|List| $) (203 . |hconcat|) (208 . |coerce|)
              (213 . |vconcat|) (218 . |prefix|) |PLOT;coerce;$Of;45|)
           '#(|zoom| 224 |yRange| 237 |xRange| 242 |tRange| 247
              |setScreenResolution| 252 |setMinPoints| 257 |setMaxPoints| 262
              |setAdaptive| 267 |screenResolution| 272 |refine| 276 |pointPlot|
              287 |plotPolar| 301 |plot| 312 |parametric?| 360 |numFunEvals|
              365 |minPoints| 369 |maxPoints| 373 |listBranches| 377 |debug|
              382 |coerce| 387 |adaptive?| 392)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS
                        '#((|PlottablePlaneCurveCategory|) (|CoercibleTo| 96))
                        (|makeByteWordVec2| 106
                                            '(1 12 0 0 13 2 12 16 0 0 17 2 19
                                              16 18 0 20 1 23 12 0 24 1 23 12 0
                                              25 2 12 16 0 0 26 2 23 0 12 12 27
                                              1 28 23 0 29 1 28 23 0 30 2 31 16
                                              0 0 35 2 12 16 0 0 47 1 48 12 0
                                              49 3 48 0 0 50 0 51 3 52 0 0 50 0
                                              53 1 54 12 19 55 2 12 0 0 0 56 2
                                              12 0 0 0 57 1 54 12 19 58 1 48 12
                                              0 59 1 52 19 0 60 1 52 19 0 61 2
                                              12 0 0 62 63 1 12 0 0 64 1 48 0
                                              12 65 1 52 0 19 66 1 48 0 0 69 1
                                              52 0 0 70 1 19 0 48 74 2 31 0 83
                                              0 84 1 12 0 0 88 2 12 0 0 0 89 1
                                              12 0 0 90 2 12 0 62 0 92 2 23 0
                                              12 12 93 1 96 0 95 97 1 23 96 0
                                              98 2 99 0 0 0 100 1 96 0 101 102
                                              1 19 96 0 103 1 96 0 101 104 2 96
                                              0 0 101 105 2 0 0 0 23 67 3 0 0 0
                                              23 23 68 1 0 23 0 45 1 0 23 0 44
                                              1 0 23 0 46 1 0 31 31 38 1 0 31
                                              31 33 1 0 31 31 36 1 0 16 16 40 0
                                              0 31 37 2 0 0 0 23 71 1 0 0 0 72
                                              2 0 0 80 23 81 4 0 0 80 23 23 23
                                              82 2 0 0 75 23 91 1 0 0 75 94 2 0
                                              0 0 23 73 3 0 0 75 75 23 78 5 0 0
                                              75 75 23 23 23 79 2 0 0 85 23 86
                                              3 0 0 85 23 23 87 2 0 0 75 23 76
                                              3 0 0 75 23 23 77 1 0 16 0 41 0 0
                                              31 42 0 0 31 32 0 0 31 34 1 0 21
                                              0 22 1 0 16 16 43 1 0 96 0 106 0
                                              0 16 39)))))
           '|lookupComplete|)) 

(MAKEPROP '|Plot| 'NILADIC T) 
