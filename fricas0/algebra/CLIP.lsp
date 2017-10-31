
(SDEFUN |CLIP;Fnan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 8))) 

(SDEFUN |CLIP;Pnan?| ((|p| |Point| (|DoubleFloat|)) ($ |Boolean|))
        (SPADCALL (CONS (|function| |CLIP;Fnan?|) $) |p| (QREFELT $ 11))) 

(SDEFUN |CLIP;iClipParametric|
        ((|pointLists| |List| (|List| (|Point| (|DoubleFloat|))))
         (|fraction| |Fraction| (|Integer|)) (|scale| |Fraction| (|Integer|))
         ($ |Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|:| |xValues| (|Segment| (|DoubleFloat|)))
          (|:| |yValues| (|Segment| (|DoubleFloat|)))))
        (SPROG
         ((|yseg| #1=(|Segment| (|DoubleFloat|))) (|xseg| #1#)
          (|yMax| #2=(|DoubleFloat|)) (|xMax| #3=(|DoubleFloat|)) (|yMin| #2#)
          (|xMin| #3#) (|ys| #4=(|List| (|DoubleFloat|))) (|xs| #4#)
          (|newclip|
           (|Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
                     (|:| |xValues| (|Segment| (|DoubleFloat|)))
                     (|:| |yValues| (|Segment| (|DoubleFloat|)))))
          (|denn| #5=(|Integer|)) (|numm| #6=(|Integer|))
          (|single_eps| (|DoubleFloat|)) (|yDiff| #7=(|DoubleFloat|))
          (|xDiff| #7#) (#8=#:G783 NIL) (|k| NIL) (#9=#:G784 NIL) (|pt| NIL)
          (|firstPt| (|Point| (|DoubleFloat|))) (|lastN| (|Integer|))
          (|clipNum| (|Integer|)) (|den| #5#) (|num| #6#)
          (|n| (|NonNegativeInteger|))
          (|sortedList| (|List| (|Point| (|DoubleFloat|)))))
         (SEQ
          (COND
           ((OR (SPADCALL |fraction| (|spadConstant| $ 13) (QREFELT $ 14))
                (SPADCALL |fraction| (|spadConstant| $ 15) (QREFELT $ 16)))
            (|error| "clipDraw: fraction should be between 0 and 1"))
           ('T
            (COND
             ((NULL |pointLists|)
              (VECTOR NIL (SPADCALL 0.0 0.0 (QREFELT $ 18))
                      (SPADCALL 0.0 0.0 (QREFELT $ 18))))
             (#10='T
              (SEQ
               (LETT |sortedList|
                     (SPADCALL (CONS #'|CLIP;iClipParametric!0| $)
                               (SPADCALL (CONS #'|CLIP;iClipParametric!1| $)
                                         (SPADCALL |pointLists| (QREFELT $ 22))
                                         (QREFELT $ 24))
                               (QREFELT $ 26))
                     . #11=(|CLIP;iClipParametric|))
               (EXIT
                (COND
                 ((NULL |sortedList|)
                  (VECTOR NIL (SPADCALL 0.0 0.0 (QREFELT $ 18))
                          (SPADCALL 0.0 0.0 (QREFELT $ 18))))
                 (#10#
                  (SEQ (LETT |n| (LENGTH |sortedList|) . #11#)
                       (LETT |num| (SPADCALL |fraction| (QREFELT $ 28)) . #11#)
                       (LETT |den| (SPADCALL |fraction| (QREFELT $ 29)) . #11#)
                       (LETT |clipNum|
                             (QUOTIENT2 (SPADCALL |n| |num| (QREFELT $ 31))
                                        |den|)
                             . #11#)
                       (LETT |lastN| (- (- |n| 1) |clipNum|) . #11#)
                       (LETT |firstPt| (|SPADfirst| |sortedList|) . #11#)
                       (LETT |xMin| (SPADCALL |firstPt| (QREFELT $ 33)) . #11#)
                       (LETT |xMax| (SPADCALL |firstPt| (QREFELT $ 33)) . #11#)
                       (LETT |yMin| (SPADCALL |firstPt| (QREFELT $ 34)) . #11#)
                       (LETT |yMax| (SPADCALL |firstPt| (QREFELT $ 34)) . #11#)
                       (SEQ (LETT |pt| NIL . #11#)
                            (LETT #9# (CDR |sortedList|) . #11#)
                            (LETT |k| 0 . #11#) (LETT #8# |lastN| . #11#) G190
                            (COND
                             ((OR (|greater_SI| |k| #8#) (ATOM #9#)
                                  (PROGN (LETT |pt| (CAR #9#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |xMin|
                                   (|min_DF| |xMin|
                                             (SPADCALL |pt| (QREFELT $ 33)))
                                   . #11#)
                             (LETT |xMax|
                                   (|max_DF| |xMax|
                                             (SPADCALL |pt| (QREFELT $ 33)))
                                   . #11#)
                             (LETT |yMin|
                                   (|min_DF| |yMin|
                                             (SPADCALL |pt| (QREFELT $ 34)))
                                   . #11#)
                             (EXIT
                              (LETT |yMax|
                                    (|max_DF| |yMax|
                                              (SPADCALL |pt| (QREFELT $ 34)))
                                    . #11#)))
                            (LETT |k|
                                  (PROG1 (|inc_SI| |k|)
                                    (LETT #9# (CDR #9#) . #11#))
                                  . #11#)
                            (GO G190) G191 (EXIT NIL))
                       (LETT |xDiff| (|sub_DF| |xMax| |xMin|) . #11#)
                       (LETT |yDiff| (|sub_DF| |yMax| |yMin|) . #11#)
                       (EXIT
                        (COND
                         ((|eql_DF| |xDiff| 0.0)
                          (COND
                           ((|eql_DF| |yDiff| 0.0)
                            (VECTOR |pointLists|
                                    (SPADCALL (|sub_DF| |xMin| 1.0)
                                              (|add_DF| |xMax| 1.0)
                                              (QREFELT $ 18))
                                    (SPADCALL (|sub_DF| |yMin| 1.0)
                                              (|add_DF| |yMax| 1.0)
                                              (QREFELT $ 18))))
                           (#10#
                            (VECTOR |pointLists|
                                    (SPADCALL (|sub_DF| |xMin| 1.0)
                                              (|add_DF| |xMax| 1.0)
                                              (QREFELT $ 18))
                                    (SPADCALL |yMin| |yMax| (QREFELT $ 18))))))
                         (#10#
                          (SEQ
                           (LETT |single_eps|
                                 (|expt_DF_I|
                                  (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 37))
                                            (QREFELT $ 38))
                                  -19)
                                 . #11#)
                           (COND
                            ((|less_DF| |yDiff| |single_eps|)
                             (SEQ
                              (LETT |yMin|
                                    (COND
                                     ((|less_DF| (|abs_DF| |yMin|) 1.0)
                                      (|sub_DF| |yMin| |single_eps|))
                                     ((|less_DF| |yMin| 0.0)
                                      (|mul_DF| |yMin|
                                                (|add_DF| 1.0 |single_eps|)))
                                     (#10#
                                      (|mul_DF| |yMin|
                                                (|sub_DF| 1.0 |single_eps|))))
                                    . #11#)
                              (EXIT
                               (LETT |yMax|
                                     (COND
                                      ((|less_DF| (|abs_DF| |yMax|) 1.0)
                                       (|add_DF| |yMax| |single_eps|))
                                      ((|less_DF| |yMax| 0.0)
                                       (|mul_DF| |yMax|
                                                 (|sub_DF| 1.0 |single_eps|)))
                                      (#10#
                                       (|mul_DF| |yMax|
                                                 (|add_DF| 1.0 |single_eps|))))
                                     . #11#)))))
                           (LETT |numm| (SPADCALL |scale| (QREFELT $ 28))
                                 . #11#)
                           (LETT |denn| (SPADCALL |scale| (QREFELT $ 29))
                                 . #11#)
                           (LETT |xMin|
                                 (|sub_DF| |xMin|
                                           (|div_DF|
                                            (|mul_DF|
                                             (FLOAT |numm|
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |xDiff|)
                                            (FLOAT |denn|
                                                   MOST-POSITIVE-DOUBLE-FLOAT)))
                                 . #11#)
                           (LETT |xMax|
                                 (|add_DF| |xMax|
                                           (|div_DF|
                                            (|mul_DF|
                                             (FLOAT |numm|
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |xDiff|)
                                            (FLOAT |denn|
                                                   MOST-POSITIVE-DOUBLE-FLOAT)))
                                 . #11#)
                           (LETT |yMin|
                                 (|sub_DF| |yMin|
                                           (|div_DF|
                                            (|mul_DF|
                                             (FLOAT |numm|
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |yDiff|)
                                            (FLOAT |denn|
                                                   MOST-POSITIVE-DOUBLE-FLOAT)))
                                 . #11#)
                           (LETT |yMax|
                                 (|add_DF| |yMax|
                                           (|div_DF|
                                            (|mul_DF|
                                             (FLOAT |numm|
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |yDiff|)
                                            (FLOAT |denn|
                                                   MOST-POSITIVE-DOUBLE-FLOAT)))
                                 . #11#)
                           (LETT |newclip|
                                 (SPADCALL |pointLists| |xMin| |xMax| |yMin|
                                           |yMax| (QREFELT $ 41))
                                 . #11#)
                           (EXIT
                            (COND
                             ((SPADCALL (LENGTH (QVELT |newclip| 0))
                                        (LENGTH |pointLists|) (QREFELT $ 42))
                              |newclip|)
                             (#10#
                              (SEQ
                               (LETT |xs|
                                     (SPADCALL (ELT $ 33) |sortedList|
                                               (QREFELT $ 46))
                                     . #11#)
                               (LETT |ys|
                                     (SPADCALL (ELT $ 34) |sortedList|
                                               (QREFELT $ 46))
                                     . #11#)
                               (LETT |xMin|
                                     (SPADCALL (ELT $ 47) |xs| (QREFELT $ 49))
                                     . #11#)
                               (LETT |yMin|
                                     (SPADCALL (ELT $ 47) |ys| (QREFELT $ 49))
                                     . #11#)
                               (LETT |xMax|
                                     (SPADCALL (ELT $ 50) |xs| (QREFELT $ 49))
                                     . #11#)
                               (LETT |yMax|
                                     (SPADCALL (ELT $ 50) |ys| (QREFELT $ 49))
                                     . #11#)
                               (LETT |xseg|
                                     (SPADCALL |xMin| |xMax| (QREFELT $ 51))
                                     . #11#)
                               (LETT |yseg|
                                     (SPADCALL |yMin| |yMax| (QREFELT $ 51))
                                     . #11#)
                               (EXIT
                                (VECTOR |pointLists| |xseg|
                                        |yseg|)))))))))))))))))))))) 

(SDEFUN |CLIP;iClipParametric!1| ((|z| NIL) ($ NIL))
        (NULL (|CLIP;Pnan?| |z| $))) 

(SDEFUN |CLIP;iClipParametric!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (|CLIP;norm| |x| $) (|CLIP;norm| |y| $) (QREFELT $ 19))) 

(SDEFUN |CLIP;point|
        ((|xx| |DoubleFloat|) (|yy| . #1=(|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |xx| |yy|) |CLIP;point|)
                         (QREFELT $ 52)))) 

(SDEFUN |CLIP;intersectWithHorizLine|
        ((|x1| |DoubleFloat|) (|y1| |DoubleFloat|) (|x2| |DoubleFloat|)
         (|y2| |DoubleFloat|) (|yy| |DoubleFloat|) ($ |Point| (|DoubleFloat|)))
        (COND ((|eql_DF| |x1| |x2|) (|CLIP;point| |x1| |yy| $))
              ('T
               (|CLIP;point|
                (|add_DF| |x1|
                          (|div_DF|
                           (|mul_DF| (|sub_DF| |x2| |x1|) (|sub_DF| |yy| |y1|))
                           (|sub_DF| |y2| |y1|)))
                |yy| $)))) 

(SDEFUN |CLIP;intersectWithVertLine|
        ((|x1| |DoubleFloat|) (|y1| |DoubleFloat|) (|x2| |DoubleFloat|)
         (|y2| |DoubleFloat|) (|xx| |DoubleFloat|) ($ |Point| (|DoubleFloat|)))
        (COND ((|eql_DF| |y1| |y2|) (|CLIP;point| |xx| |y1| $))
              ('T
               (|CLIP;point| |xx|
                (|add_DF| |y1|
                          (|div_DF|
                           (|mul_DF| (|sub_DF| |y2| |y1|) (|sub_DF| |xx| |x1|))
                           (|sub_DF| |x2| |x1|)))
                $)))) 

(SDEFUN |CLIP;intersectWithBdry|
        ((|xMin| |DoubleFloat|) (|xMax| |DoubleFloat|) (|yMin| |DoubleFloat|)
         (|yMax| |DoubleFloat|) (|pt1| |Point| (|DoubleFloat|))
         (|pt2| |Point| (|DoubleFloat|)) ($ |Point| (|DoubleFloat|)))
        (SPROG
         ((|y2| #1=(|DoubleFloat|)) (|x2| #2=(|DoubleFloat|)) (|y1| #1#)
          (|x1| #2#))
         (SEQ
          (LETT |x1| (SPADCALL |pt1| (QREFELT $ 33))
                . #3=(|CLIP;intersectWithBdry|))
          (LETT |y1| (SPADCALL |pt1| (QREFELT $ 34)) . #3#)
          (LETT |x2| (SPADCALL |pt2| (QREFELT $ 33)) . #3#)
          (LETT |y2| (SPADCALL |pt2| (QREFELT $ 34)) . #3#)
          (COND
           ((SPADCALL |y2| |yMax| (QREFELT $ 53))
            (SEQ
             (LETT |pt2|
                   (|CLIP;intersectWithHorizLine| |x1| |y1| |x2| |y2| |yMax| $)
                   . #3#)
             (LETT |x2| (SPADCALL |pt2| (QREFELT $ 33)) . #3#)
             (EXIT (LETT |y2| (SPADCALL |pt2| (QREFELT $ 34)) . #3#)))))
          (COND
           ((|less_DF| |y2| |yMin|)
            (SEQ
             (LETT |pt2|
                   (|CLIP;intersectWithHorizLine| |x1| |y1| |x2| |y2| |yMin| $)
                   . #3#)
             (LETT |x2| (SPADCALL |pt2| (QREFELT $ 33)) . #3#)
             (EXIT (LETT |y2| (SPADCALL |pt2| (QREFELT $ 34)) . #3#)))))
          (COND
           ((SPADCALL |x2| |xMax| (QREFELT $ 53))
            (SEQ
             (LETT |pt2|
                   (|CLIP;intersectWithVertLine| |x1| |y1| |x2| |y2| |xMax| $)
                   . #3#)
             (LETT |x2| (SPADCALL |pt2| (QREFELT $ 33)) . #3#)
             (EXIT (LETT |y2| (SPADCALL |pt2| (QREFELT $ 34)) . #3#)))))
          (COND
           ((|less_DF| |x2| |xMin|)
            (LETT |pt2|
                  (|CLIP;intersectWithVertLine| |x1| |y1| |x2| |y2| |xMin| $)
                  . #3#)))
          (EXIT |pt2|)))) 

(SDEFUN |CLIP;discardAndSplit|
        ((|pointList| |List| (|Point| (|DoubleFloat|)))
         (|pred| |Mapping| (|Boolean|) (|Point| (|DoubleFloat|)))
         (|xMin| |DoubleFloat|) (|xMax| |DoubleFloat|) (|yMin| |DoubleFloat|)
         (|yMax| |DoubleFloat|) ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|list| (|List| (|Point| (|DoubleFloat|)))) (|lastPt?| (|Boolean|))
          (|lastPt| (|Point| (|DoubleFloat|)))
          (|ans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|bdryPt| (|Point| (|DoubleFloat|)))
          (|pt| (|Point| (|DoubleFloat|))))
         (SEQ (LETT |ans| NIL . #1=(|CLIP;discardAndSplit|))
              (LETT |list| NIL . #1#) (LETT |lastPt?| NIL . #1#)
              (LETT |lastPt| (|CLIP;point| 0.0 0.0 $) . #1#)
              (SEQ G190 (COND ((NULL (NULL (NULL |pointList|))) (GO G191)))
                   (SEQ (LETT |pt| (|SPADfirst| |pointList|) . #1#)
                        (LETT |pointList| (CDR |pointList|) . #1#)
                        (EXIT
                         (COND
                          ((SPADCALL |pt| |pred|)
                           (SEQ
                            (COND
                             ((NULL |list|)
                              (COND
                               (|lastPt?|
                                (LETT |bdryPt|
                                      (|CLIP;intersectWithBdry| |xMin| |xMax|
                                       |yMin| |yMax| |pt| |lastPt| $)
                                      . #1#)))))
                            (EXIT (LETT |list| (CONS |pt| |list|) . #1#))))
                          ('T
                           (SEQ
                            (COND
                             ((NULL (NULL |list|))
                              (SEQ
                               (LETT |bdryPt|
                                     (|CLIP;intersectWithBdry| |xMin| |xMax|
                                      |yMin| |yMax| (|SPADfirst| |list|) |pt|
                                      $)
                                     . #1#)
                               (EXIT (LETT |ans| (CONS |list| |ans|) . #1#)))))
                            (LETT |lastPt| |pt| . #1#)
                            (LETT |lastPt?| 'T . #1#)
                            (EXIT (LETT |list| NIL . #1#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((NULL |list|) |ans|)
                     ('T (NREVERSE (CONS (NREVERSE |list|) |ans|)))))))) 

(SDEFUN |CLIP;clip;P2FR;9|
        ((|plot| |Plot|) (|fraction| |Fraction| (|Integer|))
         (|scale| |Fraction| (|Integer|))
         ($ |Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|:| |xValues| (|Segment| (|DoubleFloat|)))
          (|:| |yValues| (|Segment| (|DoubleFloat|)))))
        (SPROG
         ((|yMax| #1=(|DoubleFloat|)) (|yMin| #1#) (#2=#:G825 NIL) (|pt| NIL)
          (#3=#:G824 NIL) (|list| NIL)
          (|lists| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|xMax| (|DoubleFloat|)) (|xMin| (|DoubleFloat|))
          (|denn| #4=(|Integer|)) (|numm| #5=(|Integer|))
          (|yDiff| (|DoubleFloat|)) (|clipNum| (|Integer|)) (|den| #4#)
          (|num| #5#) (|n| (|NonNegativeInteger|))
          (|sortedList| (|List| (|Point| (|DoubleFloat|))))
          (|pointList| (|List| (|Point| (|DoubleFloat|))))
          (|pointLists| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|xVals| (|Segment| (|DoubleFloat|))))
         (SEQ
          (COND
           ((OR (SPADCALL |fraction| (|spadConstant| $ 13) (QREFELT $ 14))
                (SPADCALL |fraction| (SPADCALL 1 2 (QREFELT $ 54))
                          (QREFELT $ 16)))
            (|error| "clipDraw: fraction should be between 0 and 1/2"))
           ('T
            (SEQ
             (LETT |xVals| (SPADCALL |plot| (QREFELT $ 56))
                   . #6=(|CLIP;clip;P2FR;9|))
             (EXIT
              (COND
               ((NULL
                 (LETT |pointLists| (SPADCALL |plot| (QREFELT $ 57)) . #6#))
                (VECTOR NIL |xVals| (SPADCALL 0.0 0.0 (QREFELT $ 18))))
               ((SPADCALL
                 (LETT |pointLists| (SPADCALL |plot| (QREFELT $ 57)) . #6#) 1
                 (QREFELT $ 58))
                (|error| "clipDraw: plot has more than one branch"))
               ((NULL (LETT |pointList| (|SPADfirst| |pointLists|) . #6#))
                (VECTOR NIL |xVals| (SPADCALL 0.0 0.0 (QREFELT $ 18))))
               (#7='T
                (SEQ
                 (LETT |sortedList|
                       (SPADCALL (CONS #'|CLIP;clip;P2FR;9!0| $) |pointList|
                                 (QREFELT $ 26))
                       . #6#)
                 (LETT |n| (LENGTH |sortedList|) . #6#)
                 (LETT |num| (SPADCALL |fraction| (QREFELT $ 28)) . #6#)
                 (LETT |den| (SPADCALL |fraction| (QREFELT $ 29)) . #6#)
                 (LETT |clipNum|
                       (QUOTIENT2 (SPADCALL |n| |num| (QREFELT $ 31)) |den|)
                       . #6#)
                 (LETT |yMin|
                       (SPADCALL
                        (SPADCALL |sortedList| |clipNum| (QREFELT $ 59))
                        (QREFELT $ 34))
                       . #6#)
                 (LETT |yMax|
                       (SPADCALL
                        (SPADCALL |sortedList| (- (- |n| 1) |clipNum|)
                                  (QREFELT $ 59))
                        (QREFELT $ 34))
                       . #6#)
                 (COND ((|CLIP;Fnan?| |yMin| $) (LETT |yMin| 0.0 . #6#)))
                 (COND ((|CLIP;Fnan?| |yMax| $) (LETT |yMax| 0.0 . #6#)))
                 (LETT |yDiff| (|sub_DF| |yMax| |yMin|) . #6#)
                 (EXIT
                  (COND
                   ((|eql_DF| |yDiff| 0.0)
                    (VECTOR |pointLists| (SPADCALL |plot| (QREFELT $ 56))
                            (SPADCALL (|sub_DF| |yMin| 1.0)
                                      (|add_DF| |yMax| 1.0) (QREFELT $ 18))))
                   (#7#
                    (SEQ (LETT |numm| (SPADCALL |scale| (QREFELT $ 28)) . #6#)
                         (LETT |denn| (SPADCALL |scale| (QREFELT $ 29)) . #6#)
                         (LETT |xMin| (SPADCALL |xVals| (QREFELT $ 60)) . #6#)
                         (LETT |xMax| (SPADCALL |xVals| (QREFELT $ 61)) . #6#)
                         (LETT |yMin|
                               (|sub_DF| |yMin|
                                         (|div_DF|
                                          (|mul_DF|
                                           (FLOAT |numm|
                                                  MOST-POSITIVE-DOUBLE-FLOAT)
                                           |yDiff|)
                                          (FLOAT |denn|
                                                 MOST-POSITIVE-DOUBLE-FLOAT)))
                               . #6#)
                         (LETT |yMax|
                               (|add_DF| |yMax|
                                         (|div_DF|
                                          (|mul_DF|
                                           (FLOAT |numm|
                                                  MOST-POSITIVE-DOUBLE-FLOAT)
                                           |yDiff|)
                                          (FLOAT |denn|
                                                 MOST-POSITIVE-DOUBLE-FLOAT)))
                               . #6#)
                         (LETT |lists|
                               (|CLIP;discardAndSplit| |pointList|
                                (CONS #'|CLIP;clip;P2FR;9!1|
                                      (VECTOR |yMin| |yMax| $))
                                |xMin| |xMax| |yMin| |yMax| $)
                               . #6#)
                         (LETT |yMin|
                               (SPADCALL
                                (SPADCALL |sortedList| |clipNum|
                                          (QREFELT $ 59))
                                (QREFELT $ 34))
                               . #6#)
                         (LETT |yMax|
                               (SPADCALL
                                (SPADCALL |sortedList| (- (- |n| 1) |clipNum|)
                                          (QREFELT $ 59))
                                (QREFELT $ 34))
                               . #6#)
                         (COND
                          ((|CLIP;Fnan?| |yMin| $) (LETT |yMin| 0.0 . #6#)))
                         (COND
                          ((|CLIP;Fnan?| |yMax| $) (LETT |yMax| 0.0 . #6#)))
                         (SEQ (LETT |list| NIL . #6#) (LETT #3# |lists| . #6#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |list| (CAR #3#) . #6#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |pt| NIL . #6#)
                                     (LETT #2# |list| . #6#) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |pt| (CAR #2#) . #6#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (|CLIP;Fnan?|
                                           (SPADCALL |pt| (QREFELT $ 34)) $))
                                         (SEQ
                                          (LETT |yMin|
                                                (|min_DF| |yMin|
                                                          (SPADCALL |pt|
                                                                    (QREFELT $
                                                                             34)))
                                                . #6#)
                                          (EXIT
                                           (LETT |yMax|
                                                 (|max_DF| |yMax|
                                                           (SPADCALL |pt|
                                                                     (QREFELT $
                                                                              34)))
                                                 . #6#)))))))
                                     (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (VECTOR |lists| |xVals|
                                  (SPADCALL |yMin| |yMax|
                                            (QREFELT $ 18)))))))))))))))))) 

(SDEFUN |CLIP;clip;P2FR;9!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |yMax| |yMin|)
          (LETT $ (QREFELT $$ 2) . #1=(|CLIP;clip;P2FR;9|))
          (LETT |yMax| (QREFELT $$ 1) . #1#)
          (LETT |yMin| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT $ 34)) |yMax| (QREFELT $ 19))
              (SPADCALL (SPADCALL |x| (QREFELT $ 34)) |yMin| (QREFELT $ 53)))
             ('T NIL)))))) 

(SDEFUN |CLIP;clip;P2FR;9!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 34)) (SPADCALL |y| (QREFELT $ 34))
                  (QREFELT $ 19))) 

(SDEFUN |CLIP;clip;PR;10|
        ((|plot| |Plot|)
         ($ |Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|:| |xValues| (|Segment| (|DoubleFloat|)))
          (|:| |yValues| (|Segment| (|DoubleFloat|)))))
        (SPADCALL |plot| (SPADCALL 1 4 (QREFELT $ 54))
                  (SPADCALL 5 1 (QREFELT $ 54)) (QREFELT $ 62))) 

(SDEFUN |CLIP;norm| ((|pt| |Point| (|DoubleFloat|)) ($ |DoubleFloat|))
        (SPROG
         ((|r| (|DoubleFloat|)) (|y| (|DoubleFloat|)) (|x| (|DoubleFloat|)))
         (SEQ (LETT |x| (SPADCALL |pt| (QREFELT $ 33)) . #1=(|CLIP;norm|))
              (LETT |y| (SPADCALL |pt| (QREFELT $ 34)) . #1#)
              (COND
               ((|CLIP;Fnan?| |x| $)
                (COND ((|CLIP;Fnan?| |y| $) (LETT |r| 0.0 . #1#))
                      (#2='T
                       (LETT |r| (SPADCALL |y| 2 (QREFELT $ 64)) . #1#))))
               ((|CLIP;Fnan?| |y| $)
                (LETT |r| (SPADCALL |x| 2 (QREFELT $ 64)) . #1#))
               (#2#
                (LETT |r|
                      (|add_DF| (SPADCALL |x| 2 (QREFELT $ 64))
                                (SPADCALL |y| 2 (QREFELT $ 64)))
                      . #1#)))
              (EXIT |r|)))) 

(SDEFUN |CLIP;findPt|
        ((|lists| |List| (|List| (|Point| (|DoubleFloat|))))
         ($ |Union| (|Point| (|DoubleFloat|)) "failed"))
        (SPROG
         ((#1=#:G843 NIL) (#2=#:G842 NIL) (#3=#:G844 NIL) (#4=#:G846 NIL)
          (|p| NIL) (#5=#:G845 NIL) (|list| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |list| NIL . #6=(|CLIP;findPt|))
                   (LETT #5# |lists| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |list| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL |list|))
                       (PROGN
                        (LETT #1#
                              (SEQ
                               (EXIT
                                (SEQ (LETT |p| NIL . #6#)
                                     (LETT #4# |list| . #6#) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN
                                            (LETT |p| (CAR #4#) . #6#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((NULL (|CLIP;Pnan?| |p| $))
                                         (PROGN
                                          (LETT #2#
                                                (PROGN
                                                 (LETT #3# (CONS 0 |p|) . #6#)
                                                 (GO #7=#:G841))
                                                . #6#)
                                          (GO #8=#:G837))))))
                                     (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                     (EXIT NIL)))
                               #8# (EXIT #2#))
                              . #6#)
                        (GO #9=#:G839))))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL)))
             #9# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
          #7# (EXIT #3#)))) 

(SDEFUN |CLIP;clipWithRanges;L4DfR;13|
        ((|pointLists| |List| (|List| (|Point| (|DoubleFloat|))))
         (|xMin| |DoubleFloat|) (|xMax| |DoubleFloat|) (|yMin| |DoubleFloat|)
         (|yMax| |DoubleFloat|)
         ($ |Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|:| |xValues| (|Segment| (|DoubleFloat|)))
          (|:| |yValues| (|Segment| (|DoubleFloat|)))))
        (SPROG
         ((#1=#:G881 NIL) (|pt| (|Union| (|Point| (|DoubleFloat|)) "failed"))
          (#2=#:G880 NIL) (|list| NIL) (|firstPt| (|Point| (|DoubleFloat|)))
          (|lists| (|List| (|List| (|Point| (|DoubleFloat|))))) (#3=#:G879 NIL)
          (|pointList| NIL))
         (SEQ (LETT |lists| NIL . #4=(|CLIP;clipWithRanges;L4DfR;13|))
              (SEQ (LETT |pointList| NIL . #4#) (LETT #3# |pointLists| . #4#)
                   G190
                   (COND
                    ((OR (ATOM #3#)
                         (PROGN (LETT |pointList| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |lists|
                           (SPADCALL |lists|
                                     (|CLIP;discardAndSplit| |pointList|
                                      (CONS #'|CLIP;clipWithRanges;L4DfR;13!0|
                                            (VECTOR |yMin| |yMax| |xMin| |xMax|
                                                    $))
                                      |xMin| |xMax| |yMin| |yMax| $)
                                     (QREFELT $ 67))
                           . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |pt| (|CLIP;findPt| |lists| $) . #4#)
              (EXIT
               (COND
                ((QEQCAR |pt| 1)
                 (VECTOR NIL (SPADCALL 0.0 0.0 (QREFELT $ 18))
                         (SPADCALL 0.0 0.0 (QREFELT $ 18))))
                ('T
                 (SEQ (LETT |firstPt| (QCDR |pt|) . #4#)
                      (LETT |xMin| (SPADCALL |firstPt| (QREFELT $ 33)) . #4#)
                      (LETT |xMax| (SPADCALL |firstPt| (QREFELT $ 33)) . #4#)
                      (LETT |yMin| (SPADCALL |firstPt| (QREFELT $ 34)) . #4#)
                      (LETT |yMax| (SPADCALL |firstPt| (QREFELT $ 34)) . #4#)
                      (SEQ (LETT |list| NIL . #4#) (LETT #2# |lists| . #4#)
                           G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |list| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |pt| NIL . #4#) (LETT #1# |list| . #4#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |pt| (CAR #1#) . #4#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((NULL (|CLIP;Pnan?| |pt| $))
                                      (SEQ
                                       (LETT |xMin|
                                             (|min_DF| |xMin|
                                                       (SPADCALL |pt|
                                                                 (QREFELT $
                                                                          33)))
                                             . #4#)
                                       (LETT |xMax|
                                             (|max_DF| |xMax|
                                                       (SPADCALL |pt|
                                                                 (QREFELT $
                                                                          33)))
                                             . #4#)
                                       (LETT |yMin|
                                             (|min_DF| |yMin|
                                                       (SPADCALL |pt|
                                                                 (QREFELT $
                                                                          34)))
                                             . #4#)
                                       (EXIT
                                        (LETT |yMax|
                                              (|max_DF| |yMax|
                                                        (SPADCALL |pt|
                                                                  (QREFELT $
                                                                           34)))
                                              . #4#)))))))
                                  (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (VECTOR |lists| (SPADCALL |xMin| |xMax| (QREFELT $ 18))
                               (SPADCALL |yMin| |yMax| (QREFELT $ 18))))))))))) 

(SDEFUN |CLIP;clipWithRanges;L4DfR;13!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |xMax| |xMin| |yMax| |yMin|)
          (LETT $ (QREFELT $$ 4) . #1=(|CLIP;clipWithRanges;L4DfR;13|))
          (LETT |xMax| (QREFELT $$ 3) . #1#)
          (LETT |xMin| (QREFELT $$ 2) . #1#)
          (LETT |yMax| (QREFELT $$ 1) . #1#)
          (LETT |yMin| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT $ 33)) |xMax| (QREFELT $ 65))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT $ 33)) |xMin| (QREFELT $ 66))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 34)) |yMax|
                            (QREFELT $ 65))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 34)) |yMin|
                            (QREFELT $ 66)))
                 ('T NIL)))
               ('T NIL)))
             ('T NIL)))))) 

(SDEFUN |CLIP;clipParametric;P2FR;14|
        ((|plot| |Plot|) (|fraction| |Fraction| (|Integer|))
         (|scale| |Fraction| (|Integer|))
         ($ |Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|:| |xValues| (|Segment| (|DoubleFloat|)))
          (|:| |yValues| (|Segment| (|DoubleFloat|)))))
        (|CLIP;iClipParametric| (SPADCALL |plot| (QREFELT $ 57)) |fraction|
         |scale| $)) 

(SDEFUN |CLIP;clipParametric;PR;15|
        ((|plot| |Plot|)
         ($ |Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|:| |xValues| (|Segment| (|DoubleFloat|)))
          (|:| |yValues| (|Segment| (|DoubleFloat|)))))
        (SPADCALL |plot| (SPADCALL 1 2 (QREFELT $ 54))
                  (SPADCALL 5 1 (QREFELT $ 54)) (QREFELT $ 68))) 

(SDEFUN |CLIP;clip;LR;16|
        ((|l| |List| (|Point| (|DoubleFloat|)))
         ($ |Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|:| |xValues| (|Segment| (|DoubleFloat|)))
          (|:| |yValues| (|Segment| (|DoubleFloat|)))))
        (|CLIP;iClipParametric| (SPADCALL |l| (QREFELT $ 70))
         (SPADCALL 1 2 (QREFELT $ 54)) (SPADCALL 5 1 (QREFELT $ 54)) $)) 

(SDEFUN |CLIP;clip;LR;17|
        ((|l| |List| (|List| (|Point| (|DoubleFloat|))))
         ($ |Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|:| |xValues| (|Segment| (|DoubleFloat|)))
          (|:| |yValues| (|Segment| (|DoubleFloat|)))))
        (|CLIP;iClipParametric| |l| (SPADCALL 1 2 (QREFELT $ 54))
         (SPADCALL 5 1 (QREFELT $ 54)) $)) 

(DECLAIM (NOTINLINE |TwoDimensionalPlotClipping;|)) 

(DEFUN |TwoDimensionalPlotClipping| ()
  (SPROG NIL
         (PROG (#1=#:G891)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|TwoDimensionalPlotClipping|)
                    . #2=(|TwoDimensionalPlotClipping|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TwoDimensionalPlotClipping|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|TwoDimensionalPlotClipping;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|TwoDimensionalPlotClipping|)))))))))) 

(DEFUN |TwoDimensionalPlotClipping;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TwoDimensionalPlotClipping|)
                . #1=(|TwoDimensionalPlotClipping|))
          (LETT $ (GETREFV 73) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TwoDimensionalPlotClipping| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TwoDimensionalPlotClipping| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|DoubleFloat|) (0 . ~=)
              (|Mapping| 6 7) (|Point| 7) (6 . |any?|) (|Fraction| 27)
              (12 . |Zero|) (16 . <) (22 . |One|) (26 . >) (|Segment| 7)
              (32 . |segment|) (38 . <) (|List| $) (|List| 10) (44 . |concat|)
              (|Mapping| 6 10) (49 . |select|) (|Mapping| 6 10 10)
              (55 . |sort|) (|Integer|) (61 . |numer|) (66 . |denom|)
              (|NonNegativeInteger|) (71 . *) (|PointPackage| 7)
              (77 . |xCoord|) (82 . |yCoord|) (|PositiveInteger|) (|Float|)
              (87 . |float|) (94 . |coerce|)
              (|Record| (|:| |brans| 40) (|:| |xValues| 17) (|:| |yValues| 17))
              (|List| 21) |CLIP;clipWithRanges;L4DfR;13| (99 . >) (|List| 7)
              (|Mapping| 7 10) (|ListFunctions2| 10 7) (105 . |map|)
              (111 . |min|) (|Mapping| 7 7 7) (117 . |reduce|) (123 . |max|)
              (129 . SEGMENT) (135 . |point|) (140 . >) (146 . /) (|Plot|)
              (152 . |xRange|) (157 . |listBranches|) (162 . |more?|)
              (168 . |elt|) (174 . |lo|) (179 . |hi|) |CLIP;clip;P2FR;9|
              |CLIP;clip;PR;10| (184 . ^) (190 . <=) (196 . >=)
              (202 . |concat|) |CLIP;clipParametric;P2FR;14|
              |CLIP;clipParametric;PR;15| (208 . |list|) |CLIP;clip;LR;16|
              |CLIP;clip;LR;17|)
           '#(|clipWithRanges| 213 |clipParametric| 222 |clip| 234) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 72
                                                 '(2 7 6 0 0 8 2 10 6 9 0 11 0
                                                   12 0 13 2 12 6 0 0 14 0 12 0
                                                   15 2 12 6 0 0 16 2 17 0 7 7
                                                   18 2 7 6 0 0 19 1 21 0 20 22
                                                   2 21 0 23 0 24 2 21 0 25 0
                                                   26 1 12 27 0 28 1 12 27 0 29
                                                   2 27 0 30 0 31 1 32 7 10 33
                                                   1 32 7 10 34 3 36 0 27 27 35
                                                   37 1 36 7 0 38 2 30 6 0 0 42
                                                   2 45 43 44 21 46 2 7 0 0 0
                                                   47 2 43 7 48 0 49 2 7 0 0 0
                                                   50 2 17 0 7 7 51 1 10 0 43
                                                   52 2 7 6 0 0 53 2 12 0 27 27
                                                   54 1 55 17 0 56 1 55 40 0 57
                                                   2 40 6 0 30 58 2 21 10 0 27
                                                   59 1 17 7 0 60 1 17 7 0 61 2
                                                   7 0 0 35 64 2 7 6 0 0 65 2 7
                                                   6 0 0 66 2 40 0 0 0 67 1 40
                                                   0 21 70 5 0 39 40 7 7 7 7 41
                                                   1 0 39 55 69 3 0 39 55 12 12
                                                   68 1 0 39 55 63 3 0 39 55 12
                                                   12 62 1 0 39 40 72 1 0 39 21
                                                   71)))))
           '|lookupComplete|)) 

(MAKEPROP '|TwoDimensionalPlotClipping| 'NILADIC T) 
