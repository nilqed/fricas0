
(SDEFUN |ACPLOT;NFtoSF| ((|x| |Float|) ($ |DoubleFloat|))
        (|add_DF| 0.0 (SPADCALL |x| (QREFELT $ 22)))) 

(SDEFUN |ACPLOT;makePt|
        ((|xx| |DoubleFloat|) (|yy| . #1=(|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |xx| |yy|) |ACPLOT;makePt|)
                         (QREFELT $ 25)))) 

(SDEFUN |ACPLOT;swapCoords|
        ((|pt| |Point| (|DoubleFloat|)) ($ |Point| (|DoubleFloat|)))
        (|ACPLOT;makePt| (SPADCALL |pt| (QREFELT $ 27))
         (SPADCALL |pt| (QREFELT $ 28)) $)) 

(SDEFUN |ACPLOT;samePlottedPt?|
        ((|p0| |Point| (|DoubleFloat|)) (|p1| |Point| (|DoubleFloat|))
         ($ |Boolean|))
        (SPROG
         ((|y1| #1=(|DoubleFloat|)) (|x1| #2=(|DoubleFloat|)) (|y0| #1#)
          (|x0| #2#))
         (SEQ
          (LETT |x0| (SPADCALL |p0| (QREFELT $ 28))
                . #3=(|ACPLOT;samePlottedPt?|))
          (LETT |y0| (SPADCALL |p0| (QREFELT $ 27)) . #3#)
          (LETT |x1| (SPADCALL |p1| (QREFELT $ 28)) . #3#)
          (LETT |y1| (SPADCALL |p1| (QREFELT $ 27)) . #3#)
          (EXIT
           (COND
            ((|less_DF| (|abs_DF| (|sub_DF| |x1| |x0|)) (QREFELT $ 15))
             (|less_DF| (|abs_DF| (|sub_DF| |y1| |y0|)) (QREFELT $ 15)))
            ('T NIL)))))) 

(SDEFUN |ACPLOT;findPtOnList|
        ((|pt| |Point| (|DoubleFloat|))
         (|pointList| |List| (|Point| (|DoubleFloat|)))
         ($ |Union| (|Point| (|DoubleFloat|)) "failed"))
        (SPROG ((#1=#:G789 NIL) (#2=#:G790 NIL) (#3=#:G791 NIL) (|point| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |point| NIL . #4=(|ACPLOT;findPtOnList|))
                         (LETT #3# |pointList| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |point| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|ACPLOT;samePlottedPt?| |pt| |point| $)
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (CONS 0 |point|) . #4#)
                                     (GO #5=#:G788))
                                    . #4#)
                              (GO #6=#:G786))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (CONS 1 "failed"))))
                #5# (EXIT #2#)))) 

(PUT '|ACPLOT;makeCorners| '|SPADreplace| 'VECTOR) 

(SDEFUN |ACPLOT;makeCorners|
        ((|xMinSF| |DoubleFloat|) (|xMaxSF| |DoubleFloat|)
         (|yMinSF| |DoubleFloat|) (|yMaxSF| |DoubleFloat|)
         ($ |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|))))
        (VECTOR |xMinSF| |xMaxSF| |yMinSF| |yMaxSF|)) 

(PUT '|ACPLOT;getXMin| '|SPADreplace| '(XLAM (|corners|) (QVELT |corners| 0))) 

(SDEFUN |ACPLOT;getXMin|
        ((|corners| |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|)))
         ($ |DoubleFloat|))
        (QVELT |corners| 0)) 

(PUT '|ACPLOT;getXMax| '|SPADreplace| '(XLAM (|corners|) (QVELT |corners| 1))) 

(SDEFUN |ACPLOT;getXMax|
        ((|corners| |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|)))
         ($ |DoubleFloat|))
        (QVELT |corners| 1)) 

(PUT '|ACPLOT;getYMin| '|SPADreplace| '(XLAM (|corners|) (QVELT |corners| 2))) 

(SDEFUN |ACPLOT;getYMin|
        ((|corners| |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|)))
         ($ |DoubleFloat|))
        (QVELT |corners| 2)) 

(PUT '|ACPLOT;getYMax| '|SPADreplace| '(XLAM (|corners|) (QVELT |corners| 3))) 

(SDEFUN |ACPLOT;getYMax|
        ((|corners| |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|)))
         ($ |DoubleFloat|))
        (QVELT |corners| 3)) 

(SDEFUN |ACPLOT;SFPolyToUPoly|
        ((|p| |Polynomial| (|DoubleFloat|))
         ($ |SparseUnivariatePolynomial| (|DoubleFloat|)))
        (COND ((SPADCALL |p| (QREFELT $ 31)) (|spadConstant| $ 33))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| (QREFELT $ 34))
                          (SPADCALL |p| (QREFELT $ 36)) (QREFELT $ 37))
                (|ACPLOT;SFPolyToUPoly| (SPADCALL |p| (QREFELT $ 38)) $)
                (QREFELT $ 39))))) 

(SDEFUN |ACPLOT;RNPolyToUPoly|
        ((|p| |Polynomial| (|Fraction| (|Integer|)))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (COND ((SPADCALL |p| (QREFELT $ 41)) (|spadConstant| $ 43))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| (QREFELT $ 45))
                          (SPADCALL |p| (QREFELT $ 46)) (QREFELT $ 47))
                (|ACPLOT;RNPolyToUPoly| (SPADCALL |p| (QREFELT $ 48)) $)
                (QREFELT $ 49))))) 

(SDEFUN |ACPLOT;coerceCoefsToSFs|
        ((|p| |Polynomial| (|Integer|)) ($ |Polynomial| (|DoubleFloat|)))
        (SPADCALL (ELT $ 50) |p| (QREFELT $ 54))) 

(SDEFUN |ACPLOT;coerceCoefsToRNs|
        ((|p| |Polynomial| (|Integer|))
         ($ |Polynomial| (|Fraction| (|Integer|))))
        (SPADCALL (ELT $ 55) |p| (QREFELT $ 58))) 

(SDEFUN |ACPLOT;RNtoSF| ((|r| |Fraction| (|Integer|)) ($ |DoubleFloat|))
        (SPADCALL |r| (QREFELT $ 59))) 

(SDEFUN |ACPLOT;RNtoNF| ((|r| |Fraction| (|Integer|)) ($ |Float|))
        (SPADCALL |r| (QREFELT $ 60))) 

(SDEFUN |ACPLOT;SFtoNF| ((|x| |DoubleFloat|) ($ |Float|))
        (SPADCALL |x| (QREFELT $ 61))) 

(SDEFUN |ACPLOT;listPtsOnHorizBdry|
        ((|pRN| |Polynomial| (|Fraction| (|Integer|))) (|y| |Symbol|)
         (|y0| |Fraction| (|Integer|)) (|xMinNF| |Float|) (|xMaxNF| |Float|)
         ($ |List| (|Point| (|DoubleFloat|))))
        (SPROG
         ((|pointList| (|List| (|Point| (|DoubleFloat|)))) (#1=#:G824 NIL)
          (|root| NIL) (|roots| (|List| (|Float|)))
          (|f| (|Polynomial| (|Fraction| (|Integer|))))
          (|ySF| (|DoubleFloat|)))
         (SEQ (LETT |pointList| NIL . #2=(|ACPLOT;listPtsOnHorizBdry|))
              (LETT |ySF| (|ACPLOT;RNtoSF| |y0| $) . #2#)
              (LETT |f| (SPADCALL |pRN| |y| |y0| (QREFELT $ 63)) . #2#)
              (LETT |roots| (SPADCALL |f| (QREFELT $ 12) (QREFELT $ 66)) . #2#)
              (SEQ (LETT |root| NIL . #2#) (LETT #1# |roots| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |root| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |xMinNF| |root| (QREFELT $ 67))
                       (COND
                        ((SPADCALL |root| |xMaxNF| (QREFELT $ 67))
                         (LETT |pointList|
                               (CONS
                                (|ACPLOT;makePt| (|ACPLOT;NFtoSF| |root| $)
                                 |ySF| $)
                                |pointList|)
                               . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |pointList|)))) 

(SDEFUN |ACPLOT;listPtsOnVertBdry|
        ((|pRN| |Polynomial| (|Fraction| (|Integer|))) (|x| |Symbol|)
         (|x0| |Fraction| (|Integer|)) (|yMinNF| |Float|) (|yMaxNF| |Float|)
         ($ |List| (|Point| (|DoubleFloat|))))
        (SPROG
         ((|pointList| (|List| (|Point| (|DoubleFloat|)))) (#1=#:G828 NIL)
          (|root| NIL) (|roots| (|List| (|Float|)))
          (|f| (|Polynomial| (|Fraction| (|Integer|))))
          (|xSF| (|DoubleFloat|)))
         (SEQ (LETT |pointList| NIL . #2=(|ACPLOT;listPtsOnVertBdry|))
              (LETT |xSF| (|ACPLOT;RNtoSF| |x0| $) . #2#)
              (LETT |f| (SPADCALL |pRN| |x| |x0| (QREFELT $ 63)) . #2#)
              (LETT |roots| (SPADCALL |f| (QREFELT $ 12) (QREFELT $ 66)) . #2#)
              (SEQ (LETT |root| NIL . #2#) (LETT #1# |roots| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |root| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |yMinNF| |root| (QREFELT $ 68))
                       (COND
                        ((SPADCALL |root| |yMaxNF| (QREFELT $ 68))
                         (LETT |pointList|
                               (CONS
                                (|ACPLOT;makePt| |xSF|
                                 (|ACPLOT;NFtoSF| |root| $) $)
                                |pointList|)
                               . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |pointList|)))) 

(SDEFUN |ACPLOT;listPtsInRect|
        ((|points| |List| (|List| (|Float|))) (|xMin| |Float|) (|xMax| |Float|)
         (|yMin| |Float|) (|yMax| |Float|)
         ($ |List| (|Point| (|DoubleFloat|))))
        (SPROG
         ((|pointList| (|List| (|Point| (|DoubleFloat|)))) (|yy| (|Float|))
          (|xx| (|Float|)) (#1=#:G839 NIL) (|point| NIL))
         (SEQ (LETT |pointList| NIL . #2=(|ACPLOT;listPtsInRect|))
              (SEQ (LETT |point| NIL . #2#) (LETT #1# |points| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |point| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |xx| (|SPADfirst| |point|) . #2#)
                        (LETT |yy| (SPADCALL |point| (QREFELT $ 69)) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |xMin| |xx| (QREFELT $ 68))
                           (COND
                            ((SPADCALL |xx| |xMax| (QREFELT $ 68))
                             (COND
                              ((SPADCALL |yMin| |yy| (QREFELT $ 68))
                               (COND
                                ((SPADCALL |yy| |yMax| (QREFELT $ 68))
                                 (LETT |pointList|
                                       (CONS
                                        (|ACPLOT;makePt|
                                         (|ACPLOT;NFtoSF| |xx| $)
                                         (|ACPLOT;NFtoSF| |yy| $) $)
                                        |pointList|)
                                       . #2#)))))))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |pointList|)))) 

(SDEFUN |ACPLOT;ptsSuchThat?|
        ((|points| |List| (|List| (|Float|)))
         (|pred| |Mapping| (|Boolean|) (|List| (|Float|))) ($ |Boolean|))
        (SPROG ((#1=#:G844 NIL) (#2=#:G845 NIL) (|point| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |point| NIL . #3=(|ACPLOT;ptsSuchThat?|))
                       (LETT #2# |points| . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |point| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |point| |pred|)
                           (PROGN (LETT #1# 'T . #3#) (GO #4=#:G843))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |ACPLOT;inRect?|
        ((|point| |List| (|Float|)) (|xMinNF| |Float|) (|xMaxNF| |Float|)
         (|yMinNF| |Float|) (|yMaxNF| |Float|) ($ |Boolean|))
        (SPROG ((|yy| (|Float|)) (|xx| (|Float|)))
               (SEQ (LETT |xx| (|SPADfirst| |point|) . #1=(|ACPLOT;inRect?|))
                    (LETT |yy| (SPADCALL |point| (QREFELT $ 69)) . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |xMinNF| |xx| (QREFELT $ 68))
                       (COND
                        ((SPADCALL |xx| |xMaxNF| (QREFELT $ 68))
                         (COND
                          ((SPADCALL |yMinNF| |yy| (QREFELT $ 68))
                           (SPADCALL |yy| |yMaxNF| (QREFELT $ 68)))
                          (#2='T NIL)))
                        (#2# NIL)))
                      (#2# NIL)))))) 

(SDEFUN |ACPLOT;onHorzSeg?|
        ((|point| |List| (|Float|)) (|xMinNF| |Float|) (|xMaxNF| |Float|)
         (|yNF| |Float|) ($ |Boolean|))
        (SPROG ((|yy| (|Float|)) (|xx| (|Float|)))
               (SEQ
                (LETT |xx| (|SPADfirst| |point|) . #1=(|ACPLOT;onHorzSeg?|))
                (LETT |yy| (SPADCALL |point| (QREFELT $ 69)) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |yy| |yNF| (QREFELT $ 70))
                   (COND
                    ((SPADCALL |xMinNF| |xx| (QREFELT $ 68))
                     (SPADCALL |xx| |xMaxNF| (QREFELT $ 68)))
                    (#2='T NIL)))
                  (#2# NIL)))))) 

(SDEFUN |ACPLOT;onVertSeg?|
        ((|point| |List| (|Float|)) (|yMinNF| |Float|) (|yMaxNF| |Float|)
         (|xNF| |Float|) ($ |Boolean|))
        (SPROG ((|yy| (|Float|)) (|xx| (|Float|)))
               (SEQ
                (LETT |xx| (|SPADfirst| |point|) . #1=(|ACPLOT;onVertSeg?|))
                (LETT |yy| (SPADCALL |point| (QREFELT $ 69)) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |xx| |xNF| (QREFELT $ 70))
                   (COND
                    ((SPADCALL |yMinNF| |yy| (QREFELT $ 68))
                     (SPADCALL |yy| |yMaxNF| (QREFELT $ 68)))
                    (#2='T NIL)))
                  (#2# NIL)))))) 

(SDEFUN |ACPLOT;newX|
        ((|vtanPts| |List| (|List| (|Float|)))
         (|singPts| |List| (|List| (|Float|))) (|yMinNF| |Float|)
         (|yMaxNF| |Float|) (|xNF| |Float|) (|xRN| |Fraction| (|Integer|))
         (|horizInc| |Fraction| (|Integer|)) ($ |Fraction| (|Integer|)))
        (SPROG
         ((|goo| (|Mapping| (|Boolean|) (|List| (|Float|))))
          (|foo| (|Mapping| (|Boolean|) (|List| (|Float|))))
          (|xLftNF| (|Float|)) (|xRtNF| (|Float|)) (|xNewNF| (|Float|)))
         (SEQ
          (LETT |xNewNF|
                (SPADCALL |xNF| (|ACPLOT;RNtoNF| |horizInc| $) (QREFELT $ 71))
                . #1=(|ACPLOT;newX|))
          (LETT |xRtNF| (SPADCALL |xNF| |xNewNF| (QREFELT $ 72)) . #1#)
          (LETT |xLftNF| (SPADCALL |xNF| |xNewNF| (QREFELT $ 73)) . #1#)
          (LETT |foo|
                (CONS #'|ACPLOT;newX!0|
                      (VECTOR $ |yMaxNF| |yMinNF| |xRtNF| |xLftNF|))
                . #1#)
          (EXIT
           (COND
            ((|ACPLOT;ptsSuchThat?| |singPts| |foo| $)
             (|ACPLOT;newX| |vtanPts| |singPts| |yMinNF| |yMaxNF| |xNF| |xRN|
              (SPADCALL |horizInc| (SPADCALL 2 (QREFELT $ 55)) (QREFELT $ 74))
              $))
            (#2='T
             (SEQ
              (LETT |goo|
                    (CONS #'|ACPLOT;newX!1|
                          (VECTOR $ |xNewNF| |yMaxNF| |yMinNF|))
                    . #1#)
              (EXIT
               (COND
                ((|ACPLOT;ptsSuchThat?| |vtanPts| |goo| $)
                 (|ACPLOT;newX| |vtanPts| |singPts| |yMinNF| |yMaxNF| |xNF|
                  |xRN|
                  (SPADCALL |horizInc| (SPADCALL 2 (QREFELT $ 55))
                            (QREFELT $ 74))
                  $))
                (#2# (SPADCALL |xRN| |horizInc| (QREFELT $ 75)))))))))))) 

(SDEFUN |ACPLOT;newX!1| ((|x| NIL) ($$ NIL))
        (PROG (|yMinNF| |yMaxNF| |xNewNF| $)
          (LETT |yMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;newX|))
          (LETT |yMaxNF| (QREFELT $$ 2) . #1#)
          (LETT |xNewNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|ACPLOT;onVertSeg?| |x| |yMinNF| |yMaxNF| |xNewNF| $))))) 

(SDEFUN |ACPLOT;newX!0| ((|x| NIL) ($$ NIL))
        (PROG (|xLftNF| |xRtNF| |yMinNF| |yMaxNF| $)
          (LETT |xLftNF| (QREFELT $$ 4) . #1=(|ACPLOT;newX|))
          (LETT |xRtNF| (QREFELT $$ 3) . #1#)
          (LETT |yMinNF| (QREFELT $$ 2) . #1#)
          (LETT |yMaxNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|ACPLOT;inRect?| |x| |xLftNF| |xRtNF| |yMinNF| |yMaxNF| $))))) 

(SDEFUN |ACPLOT;newY|
        ((|htanPts| |List| (|List| (|Float|)))
         (|singPts| |List| (|List| (|Float|))) (|xMinNF| |Float|)
         (|xMaxNF| |Float|) (|yNF| |Float|) (|yRN| |Fraction| (|Integer|))
         (|vertInc| |Fraction| (|Integer|)) ($ |Fraction| (|Integer|)))
        (SPROG
         ((|goo| (|Mapping| (|Boolean|) (|List| (|Float|))))
          (|foo| (|Mapping| (|Boolean|) (|List| (|Float|))))
          (|yBotNF| (|Float|)) (|yTopNF| (|Float|)) (|yNewNF| (|Float|)))
         (SEQ
          (LETT |yNewNF|
                (SPADCALL |yNF| (|ACPLOT;RNtoNF| |vertInc| $) (QREFELT $ 71))
                . #1=(|ACPLOT;newY|))
          (LETT |yTopNF| (SPADCALL |yNF| |yNewNF| (QREFELT $ 72)) . #1#)
          (LETT |yBotNF| (SPADCALL |yNF| |yNewNF| (QREFELT $ 73)) . #1#)
          (LETT |foo|
                (CONS #'|ACPLOT;newY!0|
                      (VECTOR $ |yTopNF| |yBotNF| |xMaxNF| |xMinNF|))
                . #1#)
          (EXIT
           (COND
            ((|ACPLOT;ptsSuchThat?| |singPts| |foo| $)
             (|ACPLOT;newY| |htanPts| |singPts| |xMinNF| |xMaxNF| |yNF| |yRN|
              (SPADCALL |vertInc| (SPADCALL 2 (QREFELT $ 55)) (QREFELT $ 74))
              $))
            (#2='T
             (SEQ
              (LETT |goo|
                    (CONS #'|ACPLOT;newY!1|
                          (VECTOR $ |yNewNF| |xMaxNF| |xMinNF|))
                    . #1#)
              (EXIT
               (COND
                ((|ACPLOT;ptsSuchThat?| |htanPts| |goo| $)
                 (|ACPLOT;newY| |htanPts| |singPts| |xMinNF| |xMaxNF| |yNF|
                  |yRN|
                  (SPADCALL |vertInc| (SPADCALL 2 (QREFELT $ 55))
                            (QREFELT $ 74))
                  $))
                (#2# (SPADCALL |yRN| |vertInc| (QREFELT $ 75)))))))))))) 

(SDEFUN |ACPLOT;newY!1| ((|x| NIL) ($$ NIL))
        (PROG (|xMinNF| |xMaxNF| |yNewNF| $)
          (LETT |xMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;newY|))
          (LETT |xMaxNF| (QREFELT $$ 2) . #1#)
          (LETT |yNewNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|ACPLOT;onHorzSeg?| |x| |xMinNF| |xMaxNF| |yNewNF| $))))) 

(SDEFUN |ACPLOT;newY!0| ((|x| NIL) ($$ NIL))
        (PROG (|xMinNF| |xMaxNF| |yBotNF| |yTopNF| $)
          (LETT |xMinNF| (QREFELT $$ 4) . #1=(|ACPLOT;newY|))
          (LETT |xMaxNF| (QREFELT $$ 3) . #1#)
          (LETT |yBotNF| (QREFELT $$ 2) . #1#)
          (LETT |yTopNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|ACPLOT;inRect?| |x| |xMinNF| |xMaxNF| |yBotNF| |yTopNF| $))))) 

(SDEFUN |ACPLOT;makeSketch;P2S2S$;27|
        ((|p| |Polynomial| (|Integer|)) (|x| |Symbol|) (|y| |Symbol|)
         (|xRange| |Segment| (|Fraction| (|Integer|)))
         (|yRange| |Segment| (|Fraction| (|Integer|))) ($ $))
        (SPROG
         ((|varList| (|List| (|Symbol|))) (|yMax| #1=(|Fraction| (|Integer|)))
          (|yMin| #2=(|Fraction| (|Integer|))) (|xMax| #1#) (|xMin| #2#))
         (SEQ
          (LETT |xMin| (SPADCALL |xRange| (QREFELT $ 77))
                . #3=(|ACPLOT;makeSketch;P2S2S$;27|))
          (LETT |xMax| (SPADCALL |xRange| (QREFELT $ 78)) . #3#)
          (LETT |yMin| (SPADCALL |yRange| (QREFELT $ 77)) . #3#)
          (LETT |yMax| (SPADCALL |yRange| (QREFELT $ 78)) . #3#)
          (EXIT
           (COND
            ((SPADCALL |xMax| |xMin| (QREFELT $ 79))
             (|error| "makeSketch: bad range for first variable"))
            ((SPADCALL |yMax| |yMin| (QREFELT $ 79))
             (|error| "makeSketch: bad range for second variable"))
            (#4='T
             (SEQ (LETT |varList| (SPADCALL |p| (QREFELT $ 81)) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |varList|) 2 (QREFELT $ 82))
                     (|error|
                      "makeSketch: polynomial in more than 2 variables"))
                    ((EQL (LENGTH |varList|) 0)
                     (|error| "makeSketch: constant polynomial"))
                    ((EQL (LENGTH |varList|) 1)
                     (SEQ
                      (COND
                       ((NULL (SPADCALL |x| |varList| (QREFELT $ 83)))
                        (COND
                         ((NULL (SPADCALL |y| |varList| (QREFELT $ 83)))
                          (EXIT (|error| "makeSketch: bad variables"))))))
                      (EXIT
                       (|ACPLOT;makeOneVarSketch| |p| |x| |y| |xMin| |xMax|
                        |yMin| |yMax| (|SPADfirst| |varList|) $))))
                    (#4#
                     (SEQ
                      (COND
                       ((SPADCALL |x| |varList| (QREFELT $ 83))
                        (COND
                         ((NULL (SPADCALL |y| |varList| (QREFELT $ 83)))
                          (EXIT (|error| #5="makeSketch: bad variables")))))
                       (#4# (EXIT (|error| #5#))))
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |p| (QREFELT $ 84)) 1)
                         (|ACPLOT;makeLineSketch| |p| |x| |y| |xMin| |xMax|
                          |yMin| |yMax| $))
                        ((EQL (SPADCALL |p| |y| (QREFELT $ 85)) 1)
                         (|ACPLOT;makeRatFcnSketch| |p| |x| |y| |xMin| |xMax|
                          |yMin| |yMax| |y| $))
                        ((EQL (SPADCALL |p| |x| (QREFELT $ 85)) 1)
                         (|ACPLOT;makeRatFcnSketch| |p| |x| |y| |xMin| |xMax|
                          |yMin| |yMax| |x| $))
                        (#4#
                         (|ACPLOT;makeGeneralSketch| |p| |x| |y| |xMin| |xMax|
                          |yMin| |yMax| $))))))))))))))) 

(SDEFUN |ACPLOT;makeOneVarSketch|
        ((|p| |Polynomial| (|Integer|)) (|x| |Symbol|) (|y| |Symbol|)
         (|xMin| |Fraction| (|Integer|)) (|xMax| |Fraction| (|Integer|))
         (|yMin| |Fraction| (|Integer|)) (|yMax| |Fraction| (|Integer|))
         (|var| |Symbol|) ($ $))
        (SPROG
         ((|bran| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|branch| (|List| #1=(|Point| (|DoubleFloat|))))
          (|lf| (|List| (|Point| (|DoubleFloat|)))) (|pt2| #1#)
          (|rt| (|List| (|Point| (|DoubleFloat|)))) (|pt1| #1#) (#2=#:G902 NIL)
          (|rootSF| NIL) (|xMaxSF| #3=(|DoubleFloat|)) (|xMinSF| #3#)
          (|bt| (|List| (|Point| (|DoubleFloat|))))
          (|tp| (|List| (|Point| (|DoubleFloat|)))) (#4=#:G901 NIL)
          (|yMaxSF| #3#) (|yMinSF| #3#)
          (|sketchRoots| (|List| (|DoubleFloat|))) (#5=#:G900 NIL) (|root| NIL)
          (|roots| (|List| (|Float|)))
          (|vtans| (|List| (|Point| (|DoubleFloat|))))
          (|htans| (|List| (|Point| (|DoubleFloat|)))) (|maxVal| #6=(|Float|))
          (|minVal| #6#))
         (SEQ
          (COND
           ((EQUAL |var| |x|)
            (SEQ
             (LETT |minVal| (|ACPLOT;RNtoNF| |xMin| $)
                   . #7=(|ACPLOT;makeOneVarSketch|))
             (EXIT (LETT |maxVal| (|ACPLOT;RNtoNF| |xMax| $) . #7#))))
           (#8='T
            (SEQ (LETT |minVal| (|ACPLOT;RNtoNF| |yMin| $) . #7#)
                 (EXIT (LETT |maxVal| (|ACPLOT;RNtoNF| |yMax| $) . #7#)))))
          (LETT |lf| NIL . #7#) (LETT |rt| NIL . #7#) (LETT |bt| NIL . #7#)
          (LETT |tp| NIL . #7#) (LETT |htans| NIL . #7#)
          (LETT |vtans| NIL . #7#) (LETT |bran| NIL . #7#)
          (LETT |roots| (SPADCALL |p| (QREFELT $ 12) (QREFELT $ 87)) . #7#)
          (LETT |sketchRoots| NIL . #7#)
          (SEQ (LETT |root| NIL . #7#) (LETT #5# |roots| . #7#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |root| (CAR #5#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |minVal| |root| (QREFELT $ 68))
                   (COND
                    ((SPADCALL |root| |maxVal| (QREFELT $ 68))
                     (LETT |sketchRoots|
                           (CONS (|ACPLOT;NFtoSF| |root| $) |sketchRoots|)
                           . #7#)))))))
               (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL |sketchRoots|)
             (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                     (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans| |bran|))
            (#8#
             (SEQ
              (COND
               ((EQUAL |var| |x|)
                (SEQ (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #7#)
                     (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #7#)
                     (EXIT
                      (SEQ (LETT |rootSF| NIL . #7#)
                           (LETT #4# |sketchRoots| . #7#) G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |rootSF| (CAR #4#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |tp|
                                  (CONS
                                   (LETT |pt1|
                                         (|ACPLOT;makePt| |rootSF| |yMaxSF| $)
                                         . #7#)
                                   |tp|)
                                  . #7#)
                            (LETT |bt|
                                  (CONS
                                   (LETT |pt2|
                                         (|ACPLOT;makePt| |rootSF| |yMinSF| $)
                                         . #7#)
                                   |bt|)
                                  . #7#)
                            (LETT |branch| (LIST |pt1| |pt2|) . #7#)
                            (EXIT (LETT |bran| (CONS |branch| |bran|) . #7#)))
                           (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                           (EXIT NIL)))))
               (#8#
                (SEQ (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #7#)
                     (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #7#)
                     (EXIT
                      (SEQ (LETT |rootSF| NIL . #7#)
                           (LETT #2# |sketchRoots| . #7#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |rootSF| (CAR #2#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |rt|
                                  (CONS
                                   (LETT |pt1|
                                         (|ACPLOT;makePt| |xMaxSF| |rootSF| $)
                                         . #7#)
                                   |rt|)
                                  . #7#)
                            (LETT |lf|
                                  (CONS
                                   (LETT |pt2|
                                         (|ACPLOT;makePt| |xMinSF| |rootSF| $)
                                         . #7#)
                                   |lf|)
                                  . #7#)
                            (LETT |branch| (LIST |pt1| |pt2|) . #7#)
                            (EXIT (LETT |bran| (CONS |branch| |bran|) . #7#)))
                           (LETT #2# (CDR #2#) . #7#) (GO G190) G191
                           (EXIT NIL))))))
              (EXIT
               (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                       (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans|
                       |bran|))))))))) 

(SDEFUN |ACPLOT;makeLineSketch|
        ((|p| |Polynomial| (|Integer|)) (|x| |Symbol|) (|y| |Symbol|)
         (|xMin| |Fraction| (|Integer|)) (|xMax| |Fraction| (|Integer|))
         (|yMin| |Fraction| (|Integer|)) (|yMax| |Fraction| (|Integer|)) ($ $))
        (SPROG
         ((|bran| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|branch| (|List| (|Point| (|DoubleFloat|))))
          (|rt| (|List| (|Point| (|DoubleFloat|))))
          (|pt| (|Point| (|DoubleFloat|)))
          (|lf| (|List| (|Point| (|DoubleFloat|))))
          (|tp| (|List| (|Point| (|DoubleFloat|))))
          (|bt| (|List| (|Point| (|DoubleFloat|))))
          (|yRight| #1=(|DoubleFloat|)) (|yLeft| #1#) (|xTop| #1#)
          (|xBottom| #1#) (|vtans| (|List| (|Point| (|DoubleFloat|))))
          (|htans| (|List| (|Point| (|DoubleFloat|)))) (|c| (|DoubleFloat|))
          (|b| (|DoubleFloat|)) (|a| (|DoubleFloat|))
          (|yMaxSF| #2=(|DoubleFloat|)) (|yMinSF| #2#) (|xMaxSF| #2#)
          (|xMinSF| #2#))
         (SEQ
          (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $)
                . #3=(|ACPLOT;makeLineSketch|))
          (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #3#)
          (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #3#)
          (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #3#)
          (LETT |a|
                (FLOAT
                 (SPADCALL (SPADCALL |p| |x| 1 (QREFELT $ 88)) (QREFELT $ 89))
                 MOST-POSITIVE-DOUBLE-FLOAT)
                . #3#)
          (LETT |b|
                (FLOAT
                 (SPADCALL (SPADCALL |p| |y| 1 (QREFELT $ 88)) (QREFELT $ 89))
                 MOST-POSITIVE-DOUBLE-FLOAT)
                . #3#)
          (LETT |c|
                (FLOAT
                 (SPADCALL
                  (SPADCALL (SPADCALL |p| |x| 0 (QREFELT $ 88)) |y| 0
                            (QREFELT $ 88))
                  (QREFELT $ 89))
                 MOST-POSITIVE-DOUBLE-FLOAT)
                . #3#)
          (LETT |lf| NIL . #3#) (LETT |rt| NIL . #3#) (LETT |bt| NIL . #3#)
          (LETT |tp| NIL . #3#) (LETT |htans| NIL . #3#)
          (LETT |vtans| NIL . #3#) (LETT |branch| NIL . #3#)
          (LETT |bran| NIL . #3#)
          (LETT |xBottom|
                (|div_DF| (|sub_DF| (|minus_DF| (|mul_DF| |b| |yMinSF|)) |c|)
                          |a|)
                . #3#)
          (LETT |xTop|
                (|div_DF| (|sub_DF| (|minus_DF| (|mul_DF| |b| |yMaxSF|)) |c|)
                          |a|)
                . #3#)
          (LETT |yLeft|
                (|div_DF| (|sub_DF| (|minus_DF| (|mul_DF| |a| |xMinSF|)) |c|)
                          |b|)
                . #3#)
          (LETT |yRight|
                (|div_DF| (|sub_DF| (|minus_DF| (|mul_DF| |a| |xMaxSF|)) |c|)
                          |b|)
                . #3#)
          (COND
           ((|less_DF| |xMinSF| |xBottom|)
            (COND
             ((|less_DF| |xBottom| |xMaxSF|)
              (SEQ
               (LETT |bt|
                     (CONS
                      (LETT |pt| (|ACPLOT;makePt| |xBottom| |yMinSF| $) . #3#)
                      |bt|)
                     . #3#)
               (EXIT (LETT |branch| (CONS |pt| |branch|) . #3#)))))))
          (COND
           ((|less_DF| |xMinSF| |xTop|)
            (COND
             ((|less_DF| |xTop| |xMaxSF|)
              (SEQ
               (LETT |tp|
                     (CONS
                      (LETT |pt| (|ACPLOT;makePt| |xTop| |yMaxSF| $) . #3#)
                      |tp|)
                     . #3#)
               (EXIT (LETT |branch| (CONS |pt| |branch|) . #3#)))))))
          (COND
           ((SPADCALL |yMinSF| |yLeft| (QREFELT $ 90))
            (COND
             ((SPADCALL |yLeft| |yMaxSF| (QREFELT $ 90))
              (SEQ
               (LETT |lf|
                     (CONS
                      (LETT |pt| (|ACPLOT;makePt| |xMinSF| |yLeft| $) . #3#)
                      |lf|)
                     . #3#)
               (EXIT (LETT |branch| (CONS |pt| |branch|) . #3#)))))))
          (COND
           ((SPADCALL |yMinSF| |yRight| (QREFELT $ 90))
            (COND
             ((SPADCALL |yRight| |yMaxSF| (QREFELT $ 90))
              (SEQ
               (LETT |rt|
                     (CONS
                      (LETT |pt| (|ACPLOT;makePt| |xMaxSF| |yRight| $) . #3#)
                      |rt|)
                     . #3#)
               (EXIT (LETT |branch| (CONS |pt| |branch|) . #3#)))))))
          (LETT |bran| (CONS |branch| |bran|) . #3#)
          (EXIT
           (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                   (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans| |bran|))))) 

(SDEFUN |ACPLOT;singValBetween?|
        ((|xCurrent| |DoubleFloat|) (|xNext| |DoubleFloat|)
         (|xSingList| |List| (|DoubleFloat|)) ($ |Boolean|))
        (SPROG ((#1=#:G913 NIL) (#2=#:G914 NIL) (#3=#:G915 NIL) (|xVal| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |xVal| NIL . #4=(|ACPLOT;singValBetween?|))
                         (LETT #3# |xSingList| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |xVal| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|less_DF| |xCurrent| |xVal|)
                             (COND
                              ((|less_DF| |xVal| |xNext|)
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# 'T . #4#)
                                       (GO #5=#:G912))
                                      . #4#)
                                (GO #6=#:G910))))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |ACPLOT;segmentInfo|
        ((|f| |Mapping| #1=(|DoubleFloat|) (|DoubleFloat|))
         (|lo| |DoubleFloat|) (|hi| |DoubleFloat|)
         (|botList| |List| (|DoubleFloat|)) (|topList| |List| (|DoubleFloat|))
         (|singList| |List| (|DoubleFloat|)) (|minSF| |DoubleFloat|)
         (|maxSF| |DoubleFloat|)
         ($ |Record| (|:| |seg| (|Segment| (|DoubleFloat|)))
          (|:| |left| (|DoubleFloat|))
          (|:| |lowerVals| (|List| (|DoubleFloat|)))
          (|:| |upperVals| (|List| (|DoubleFloat|)))))
        (SPROG
         ((#2=#:G939 NIL) (|val| #1#) (|nextFrom| #3=(|String|))
          (|nxt| #4=(|DoubleFloat|)) (|top| #4#) (|bot| #4#)
          (|currentFrom| #3#) (|current| #4#))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (COND
                  ((NULL |topList|)
                   (COND
                    ((NULL |botList|)
                     (PROGN
                      (LETT #2#
                            (VECTOR (SPADCALL |lo| |hi| (QREFELT $ 92)) |hi|
                                    NIL NIL)
                            . #5=(|ACPLOT;segmentInfo|))
                      (GO #6=#:G938)))
                    ('T
                     (SEQ (LETT |current| (|SPADfirst| |botList|) . #5#)
                          (LETT |botList| (CDR |botList|) . #5#)
                          (EXIT (LETT |currentFrom| (QREFELT $ 19) . #5#))))))
                  ((NULL |botList|)
                   (SEQ (LETT |current| (|SPADfirst| |topList|) . #5#)
                        (LETT |topList| (CDR |topList|) . #5#)
                        (EXIT (LETT |currentFrom| (QREFELT $ 20) . #5#))))
                  ('T
                   (SEQ (LETT |bot| (|SPADfirst| |botList|) . #5#)
                        (LETT |top| (|SPADfirst| |topList|) . #5#)
                        (EXIT
                         (COND
                          ((|less_DF| |bot| |top|)
                           (SEQ (LETT |current| |bot| . #5#)
                                (LETT |botList| (CDR |botList|) . #5#)
                                (EXIT
                                 (LETT |currentFrom| (QREFELT $ 19) . #5#))))
                          ('T
                           (SEQ (LETT |current| |top| . #5#)
                                (LETT |topList| (CDR |topList|) . #5#)
                                (EXIT
                                 (LETT |currentFrom| (QREFELT $ 20)
                                       . #5#)))))))))
                 (COND
                  ((NULL |topList|)
                   (COND
                    ((NULL |botList|)
                     (PROGN
                      (LETT #2#
                            (VECTOR (SPADCALL |lo| |hi| (QREFELT $ 92)) |hi|
                                    NIL NIL)
                            . #5#)
                      (GO #6#)))
                    ('T
                     (SEQ (LETT |nxt| (|SPADfirst| |botList|) . #5#)
                          (LETT |botList| (CDR |botList|) . #5#)
                          (EXIT (LETT |nextFrom| (QREFELT $ 19) . #5#))))))
                  ((NULL |botList|)
                   (SEQ (LETT |nxt| (|SPADfirst| |topList|) . #5#)
                        (LETT |topList| (CDR |topList|) . #5#)
                        (EXIT (LETT |nextFrom| (QREFELT $ 20) . #5#))))
                  ('T
                   (SEQ (LETT |bot| (|SPADfirst| |botList|) . #5#)
                        (LETT |top| (|SPADfirst| |topList|) . #5#)
                        (EXIT
                         (COND
                          ((|less_DF| |bot| |top|)
                           (SEQ (LETT |nxt| |bot| . #5#)
                                (LETT |botList| (CDR |botList|) . #5#)
                                (EXIT (LETT |nextFrom| (QREFELT $ 19) . #5#))))
                          ('T
                           (SEQ (LETT |nxt| |top| . #5#)
                                (LETT |topList| (CDR |topList|) . #5#)
                                (EXIT
                                 (LETT |nextFrom| (QREFELT $ 20) . #5#)))))))))
                 (EXIT
                  (COND
                   ((EQUAL |currentFrom| |nextFrom|)
                    (COND
                     ((|ACPLOT;singValBetween?| |current| |nxt| |singList| $)
                      (PROGN
                       (LETT #2#
                             (VECTOR (SPADCALL |lo| |current| (QREFELT $ 92))
                                     |nxt| |botList| |topList|)
                             . #5#)
                       (GO #6#)))
                     ('T
                      (SEQ
                       (LETT |val|
                             (SPADCALL
                              (|div_DF| (|sub_DF| |nxt| |current|)
                                        (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                              |f|)
                             . #5#)
                       (EXIT
                        (COND
                         ((OR (SPADCALL |val| |minSF| (QREFELT $ 90))
                              (SPADCALL |val| |maxSF| (QREFELT $ 93)))
                          (PROGN
                           (LETT #2#
                                 (VECTOR
                                  (SPADCALL |lo| |current| (QREFELT $ 92))
                                  |nxt| |botList| |topList|)
                                 . #5#)
                           (GO #6#)))))))))
                   ((|ACPLOT;singValBetween?| |current| |nxt| |singList| $)
                    (PROGN
                     (LETT #2#
                           (VECTOR (SPADCALL |lo| |current| (QREFELT $ 92))
                                   |nxt| |botList| |topList|)
                           . #5#)
                     (GO #6#))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #6# (EXIT #2#)))) 

(SDEFUN |ACPLOT;makeRatFcnSketch|
        ((|p| |Polynomial| (|Integer|)) (|x| |Symbol|) (|y| |Symbol|)
         (|xMin| . #1=(|Fraction| (|Integer|)))
         (|xMax| . #2=(|Fraction| (|Integer|)))
         (|yMin| . #3=(|Fraction| (|Integer|)))
         (|yMax| . #4=(|Fraction| (|Integer|))) (|depVar| |Symbol|) ($ $))
        (SPROG
         ((|bran| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|curve| (|List| (|Point| (|DoubleFloat|)))) (|RFPlot| (|Plot|))
          (#5=#:G1021 NIL) (|segment| NIL) (#6=#:G1012 NIL)
          (|topList| (|List| (|DoubleFloat|)))
          (|botList| (|List| (|DoubleFloat|))) (|lo| #7=(|DoubleFloat|))
          (|segList| (|List| (|Segment| (|DoubleFloat|))))
          (|segInfo|
           (|Record| (|:| |seg| (|Segment| (|DoubleFloat|)))
                     (|:| |left| (|DoubleFloat|))
                     (|:| |lowerVals| (|List| (|DoubleFloat|)))
                     (|:| |upperVals| (|List| (|DoubleFloat|)))))
          (|maxSF| #7#) (|minSF| #7#) (|hi| (|DoubleFloat|))
          (|top| #8=(|DoubleFloat|)) (|bot| #8#) (#9=#:G1013 NIL)
          (|tp| (|List| (|Point| (|DoubleFloat|)))) (#10=#:G1020 NIL)
          (|val| NIL) (|bt| (|List| (|Point| (|DoubleFloat|))))
          (#11=#:G1019 NIL) (|rt| (|List| (|Point| (|DoubleFloat|))))
          (|lf| (|List| (|Point| (|DoubleFloat|)))) (#12=#:G1018 NIL)
          (#13=#:G1017 NIL) (|rightVal| #14=(|DoubleFloat|)) (|leftVal| #14#)
          (|denUPolyRN|
           (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|outList| (|List| (|DoubleFloat|))) (#15=#:G1016 NIL) (|root| NIL)
          (|roots| (|List| (|Float|))) (#16=#:G1015 NIL)
          (|singList| (|List| (|DoubleFloat|))) (#17=#:G1014 NIL)
          (|vtans| #18=(|List| (|Point| (|DoubleFloat|)))) (|htans| #18#)
          (|vtanPts| #19=(|List| (|List| (|Float|)))) (|htanPts| #19#)
          (|depVarMaxSF| #7#) (|depVarMinSF| #7#) (|depVarMax| #2#)
          (|depVarMin| #1#) (|indVarMaxSF| #7#) (|indVarMinSF| #7#)
          (|indVarMaxNF| #20=(|Float|)) (|indVarMinNF| #20#) (|indVarMax| #4#)
          (|indVarMin| #3#) (|f| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
          (|denUPolySF| #21=(|SparseUnivariatePolynomial| (|DoubleFloat|)))
          (|numUPolySF| #21#) (|den| (|Polynomial| (|Integer|)))
          (|num| (|Polynomial| (|Integer|))) (|yMaxNF| #20#) (|yMinNF| #20#)
          (|xMaxNF| #20#) (|xMinNF| #20#) (|yMaxSF| #7#) (|yMinSF| #7#)
          (|xMaxSF| #7#) (|xMinSF| #7#)
          (|pRN| (|Polynomial| (|Fraction| (|Integer|))))
          (|dpdy| #22=(|Polynomial| (|Integer|))) (|dpdx| #22#)
          (|factoredP| (|Factored| (|Polynomial| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |factoredP| (SPADCALL |p| (QREFELT $ 95))
                  . #23=(|ACPLOT;makeRatFcnSketch|))
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |factoredP| (QREFELT $ 96)) 1
                         (QREFELT $ 82))
               (|error| "reducible polynomial"))
              (#24='T
               (SEQ (LETT |dpdx| (SPADCALL |p| |x| (QREFELT $ 97)) . #23#)
                    (LETT |dpdy| (SPADCALL |p| |y| (QREFELT $ 97)) . #23#)
                    (LETT |pRN| (|ACPLOT;coerceCoefsToRNs| |p| $) . #23#)
                    (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #23#)
                    (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #23#)
                    (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #23#)
                    (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #23#)
                    (LETT |xMinNF| (|ACPLOT;RNtoNF| |xMin| $) . #23#)
                    (LETT |xMaxNF| (|ACPLOT;RNtoNF| |xMax| $) . #23#)
                    (LETT |yMinNF| (|ACPLOT;RNtoNF| |yMin| $) . #23#)
                    (LETT |yMaxNF| (|ACPLOT;RNtoNF| |yMax| $) . #23#)
                    (LETT |num|
                          (SPADCALL (SPADCALL |p| |depVar| 0 (QREFELT $ 88))
                                    (QREFELT $ 98))
                          . #23#)
                    (LETT |den| (SPADCALL |p| |depVar| 1 (QREFELT $ 88))
                          . #23#)
                    (LETT |numUPolySF|
                          (|ACPLOT;SFPolyToUPoly|
                           (|ACPLOT;coerceCoefsToSFs| |num| $) $)
                          . #23#)
                    (LETT |denUPolySF|
                          (|ACPLOT;SFPolyToUPoly|
                           (|ACPLOT;coerceCoefsToSFs| |den| $) $)
                          . #23#)
                    (LETT |f|
                          (CONS #'|ACPLOT;makeRatFcnSketch!0|
                                (VECTOR |denUPolySF| $ |numUPolySF|))
                          . #23#)
                    (COND
                     ((EQUAL |depVar| |x|)
                      (SEQ (LETT |indVarMin| |yMin| . #23#)
                           (LETT |indVarMax| |yMax| . #23#)
                           (LETT |indVarMinNF| |yMinNF| . #23#)
                           (LETT |indVarMaxNF| |yMaxNF| . #23#)
                           (LETT |indVarMinSF| |yMinSF| . #23#)
                           (LETT |indVarMaxSF| |yMaxSF| . #23#)
                           (LETT |depVarMin| |xMin| . #23#)
                           (LETT |depVarMax| |xMax| . #23#)
                           (LETT |depVarMinSF| |xMinSF| . #23#)
                           (EXIT (LETT |depVarMaxSF| |xMaxSF| . #23#))))
                     (#24#
                      (SEQ (LETT |indVarMin| |xMin| . #23#)
                           (LETT |indVarMax| |xMax| . #23#)
                           (LETT |indVarMinNF| |xMinNF| . #23#)
                           (LETT |indVarMaxNF| |xMaxNF| . #23#)
                           (LETT |indVarMinSF| |xMinSF| . #23#)
                           (LETT |indVarMaxSF| |xMaxSF| . #23#)
                           (LETT |depVarMin| |yMin| . #23#)
                           (LETT |depVarMax| |yMax| . #23#)
                           (LETT |depVarMinSF| |yMinSF| . #23#)
                           (EXIT (LETT |depVarMaxSF| |yMaxSF| . #23#)))))
                    (LETT |htanPts|
                          (SPADCALL (LIST |p| |dpdx|) (LIST |x| |y|)
                                    (QREFELT $ 12) (QREFELT $ 103))
                          . #23#)
                    (LETT |vtanPts|
                          (SPADCALL (LIST |p| |dpdy|) (LIST |x| |y|)
                                    (QREFELT $ 12) (QREFELT $ 103))
                          . #23#)
                    (LETT |htans|
                          (|ACPLOT;listPtsInRect| |htanPts| |xMinNF| |xMaxNF|
                           |yMinNF| |yMaxNF| $)
                          . #23#)
                    (LETT |vtans|
                          (|ACPLOT;listPtsInRect| |vtanPts| |xMinNF| |xMaxNF|
                           |yMinNF| |yMaxNF| $)
                          . #23#)
                    (LETT |lf| NIL . #23#) (LETT |rt| NIL . #23#)
                    (LETT |bt| NIL . #23#) (LETT |tp| NIL . #23#)
                    (LETT |singList|
                          (SEQ
                           (LETT |roots|
                                 (SPADCALL |den| (QREFELT $ 12) (QREFELT $ 87))
                                 . #23#)
                           (LETT |outList| NIL . #23#)
                           (SEQ (LETT |root| NIL . #23#)
                                (LETT #17# |roots| . #23#) G190
                                (COND
                                 ((OR (ATOM #17#)
                                      (PROGN
                                       (LETT |root| (CAR #17#) . #23#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |indVarMinNF| |root|
                                              (QREFELT $ 67))
                                    (COND
                                     ((SPADCALL |root| |indVarMaxNF|
                                                (QREFELT $ 67))
                                      (LETT |outList|
                                            (CONS (|ACPLOT;NFtoSF| |root| $)
                                                  |outList|)
                                            . #23#)))))))
                                (LETT #17# (CDR #17#) . #23#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL (ELT $ 104) |outList| (QREFELT $ 106))))
                          . #23#)
                    (LETT |topList|
                          (SEQ
                           (LETT |roots|
                                 (SPADCALL
                                  (SPADCALL |pRN| |depVar| |depVarMax|
                                            (QREFELT $ 63))
                                  (QREFELT $ 12) (QREFELT $ 66))
                                 . #23#)
                           (LETT |outList| NIL . #23#)
                           (SEQ (LETT |root| NIL . #23#)
                                (LETT #16# |roots| . #23#) G190
                                (COND
                                 ((OR (ATOM #16#)
                                      (PROGN
                                       (LETT |root| (CAR #16#) . #23#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |indVarMinNF| |root|
                                              (QREFELT $ 67))
                                    (COND
                                     ((SPADCALL |root| |indVarMaxNF|
                                                (QREFELT $ 67))
                                      (LETT |outList|
                                            (CONS (|ACPLOT;NFtoSF| |root| $)
                                                  |outList|)
                                            . #23#)))))))
                                (LETT #16# (CDR #16#) . #23#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL (ELT $ 104) |outList| (QREFELT $ 106))))
                          . #23#)
                    (LETT |botList|
                          (SEQ
                           (LETT |roots|
                                 (SPADCALL
                                  (SPADCALL |pRN| |depVar| |depVarMin|
                                            (QREFELT $ 63))
                                  (QREFELT $ 12) (QREFELT $ 66))
                                 . #23#)
                           (LETT |outList| NIL . #23#)
                           (SEQ (LETT |root| NIL . #23#)
                                (LETT #15# |roots| . #23#) G190
                                (COND
                                 ((OR (ATOM #15#)
                                      (PROGN
                                       (LETT |root| (CAR #15#) . #23#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |indVarMinNF| |root|
                                              (QREFELT $ 67))
                                    (COND
                                     ((SPADCALL |root| |indVarMaxNF|
                                                (QREFELT $ 67))
                                      (LETT |outList|
                                            (CONS (|ACPLOT;NFtoSF| |root| $)
                                                  |outList|)
                                            . #23#)))))))
                                (LETT #15# (CDR #15#) . #23#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL (ELT $ 104) |outList| (QREFELT $ 106))))
                          . #23#)
                    (LETT |denUPolyRN|
                          (|ACPLOT;RNPolyToUPoly|
                           (|ACPLOT;coerceCoefsToRNs| |den| $) $)
                          . #23#)
                    (COND
                     ((SPADCALL
                       (SPADCALL |denUPolyRN| |indVarMin| (QREFELT $ 107))
                       (|spadConstant| $ 108) (QREFELT $ 109))
                      (LETT |leftVal|
                            (|sub_DF| |depVarMinSF|
                                      (|add_DF| (|abs_DF| |depVarMinSF|) 1.0))
                            . #23#))
                     (#24#
                      (LETT |leftVal| (SPADCALL |indVarMinSF| |f|) . #23#)))
                    (COND
                     ((SPADCALL
                       (SPADCALL |denUPolyRN| |indVarMax| (QREFELT $ 107))
                       (|spadConstant| $ 108) (QREFELT $ 109))
                      (LETT |rightVal|
                            (|sub_DF| |depVarMinSF|
                                      (|add_DF| (|abs_DF| |depVarMinSF|) 1.0))
                            . #23#))
                     (#24#
                      (LETT |rightVal| (SPADCALL |indVarMaxSF| |f|) . #23#)))
                    (COND
                     ((EQUAL |depVar| |x|)
                      (SEQ
                       (COND
                        ((|less_DF| |xMinSF| |leftVal|)
                         (COND
                          ((|less_DF| |leftVal| |xMaxSF|)
                           (LETT |bt|
                                 (CONS (|ACPLOT;makePt| |leftVal| |yMinSF| $)
                                       |bt|)
                                 . #23#)))))
                       (COND
                        ((|less_DF| |xMinSF| |rightVal|)
                         (COND
                          ((|less_DF| |rightVal| |xMaxSF|)
                           (LETT |tp|
                                 (CONS (|ACPLOT;makePt| |rightVal| |yMaxSF| $)
                                       |tp|)
                                 . #23#)))))
                       (SEQ (LETT |val| NIL . #23#)
                            (LETT #13# |botList| . #23#) G190
                            (COND
                             ((OR (ATOM #13#)
                                  (PROGN (LETT |val| (CAR #13#) . #23#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |lf|
                                    (CONS (|ACPLOT;makePt| |xMinSF| |val| $)
                                          |lf|)
                                    . #23#)))
                            (LETT #13# (CDR #13#) . #23#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |val| NIL . #23#)
                             (LETT #12# |topList| . #23#) G190
                             (COND
                              ((OR (ATOM #12#)
                                   (PROGN (LETT |val| (CAR #12#) . #23#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |rt|
                                     (CONS (|ACPLOT;makePt| |xMaxSF| |val| $)
                                           |rt|)
                                     . #23#)))
                             (LETT #12# (CDR #12#) . #23#) (GO G190) G191
                             (EXIT NIL)))))
                     (#24#
                      (SEQ
                       (COND
                        ((|less_DF| |yMinSF| |leftVal|)
                         (COND
                          ((|less_DF| |leftVal| |yMaxSF|)
                           (LETT |lf|
                                 (CONS (|ACPLOT;makePt| |xMinSF| |leftVal| $)
                                       |lf|)
                                 . #23#)))))
                       (COND
                        ((|less_DF| |yMinSF| |rightVal|)
                         (COND
                          ((|less_DF| |rightVal| |yMaxSF|)
                           (LETT |rt|
                                 (CONS (|ACPLOT;makePt| |xMaxSF| |rightVal| $)
                                       |rt|)
                                 . #23#)))))
                       (SEQ (LETT |val| NIL . #23#)
                            (LETT #11# |botList| . #23#) G190
                            (COND
                             ((OR (ATOM #11#)
                                  (PROGN (LETT |val| (CAR #11#) . #23#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |bt|
                                    (CONS (|ACPLOT;makePt| |val| |yMinSF| $)
                                          |bt|)
                                    . #23#)))
                            (LETT #11# (CDR #11#) . #23#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |val| NIL . #23#)
                             (LETT #10# |topList| . #23#) G190
                             (COND
                              ((OR (ATOM #10#)
                                   (PROGN (LETT |val| (CAR #10#) . #23#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |tp|
                                     (CONS (|ACPLOT;makePt| |val| |yMaxSF| $)
                                           |tp|)
                                     . #23#)))
                             (LETT #10# (CDR #10#) . #23#) (GO G190) G191
                             (EXIT NIL))))))
                    (LETT |bran| NIL . #23#)
                    (COND
                     ((|less_DF| |depVarMinSF| |leftVal|)
                      (COND
                       ((|less_DF| |leftVal| |depVarMaxSF|)
                        (LETT |lo| |indVarMinSF| . #23#))
                       ((NULL |topList|)
                        (COND
                         ((NULL |botList|)
                          (PROGN
                           (LETT #9#
                                 (VECTOR |p| |x| |y| |xMin| |xMax| |yMin|
                                         |yMax| (VECTOR |lf| |rt| |bt| |tp|)
                                         |htans| |vtans| |bran|)
                                 . #23#)
                           (GO #25=#:G1011)))
                         (#24#
                          (SEQ (LETT |lo| (|SPADfirst| |botList|) . #23#)
                               (EXIT
                                (LETT |botList| (CDR |botList|) . #23#))))))
                       ((NULL |botList|)
                        (SEQ (LETT |lo| (|SPADfirst| |topList|) . #23#)
                             (EXIT (LETT |topList| (CDR |topList|) . #23#))))
                       (#24#
                        (SEQ (LETT |bot| (|SPADfirst| |botList|) . #23#)
                             (LETT |top| (|SPADfirst| |topList|) . #23#)
                             (EXIT
                              (COND
                               ((|less_DF| |bot| |top|)
                                (SEQ (LETT |lo| |bot| . #23#)
                                     (EXIT
                                      (LETT |botList| (CDR |botList|)
                                            . #23#))))
                               (#24#
                                (SEQ (LETT |lo| |top| . #23#)
                                     (EXIT
                                      (LETT |topList| (CDR |topList|)
                                            . #23#))))))))))
                     ((NULL |topList|)
                      (COND
                       ((NULL |botList|)
                        (PROGN
                         (LETT #9#
                               (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                                       (VECTOR |lf| |rt| |bt| |tp|) |htans|
                                       |vtans| |bran|)
                               . #23#)
                         (GO #25#)))
                       (#24#
                        (SEQ (LETT |lo| (|SPADfirst| |botList|) . #23#)
                             (EXIT (LETT |botList| (CDR |botList|) . #23#))))))
                     ((NULL |botList|)
                      (SEQ (LETT |lo| (|SPADfirst| |topList|) . #23#)
                           (EXIT (LETT |topList| (CDR |topList|) . #23#))))
                     (#24#
                      (SEQ (LETT |bot| (|SPADfirst| |botList|) . #23#)
                           (LETT |top| (|SPADfirst| |topList|) . #23#)
                           (EXIT
                            (COND
                             ((|less_DF| |bot| |top|)
                              (SEQ (LETT |lo| |bot| . #23#)
                                   (EXIT
                                    (LETT |botList| (CDR |botList|) . #23#))))
                             (#24#
                              (SEQ (LETT |lo| |top| . #23#)
                                   (EXIT
                                    (LETT |topList| (CDR |topList|)
                                          . #23#)))))))))
                    (LETT |hi| 0.0 . #23#)
                    (COND
                     ((|less_DF| |depVarMinSF| |rightVal|)
                      (COND
                       ((|less_DF| |rightVal| |depVarMaxSF|)
                        (LETT |hi| |indVarMaxSF| . #23#))
                       ((NULL |topList|)
                        (COND
                         ((NULL |botList|)
                          (|error| #26="makeRatFcnSketch: plot domain"))
                         (#24#
                          (SEQ
                           (LETT |hi| (SPADCALL |botList| (QREFELT $ 110))
                                 . #23#)
                           (EXIT
                            (LETT |botList|
                                  (SPADCALL |hi| |botList| (QREFELT $ 111))
                                  . #23#))))))
                       ((NULL |botList|)
                        (SEQ
                         (LETT |hi| (SPADCALL |topList| (QREFELT $ 110))
                               . #23#)
                         (EXIT
                          (LETT |topList|
                                (SPADCALL |hi| |topList| (QREFELT $ 111))
                                . #23#))))
                       (#24#
                        (SEQ
                         (LETT |bot| (SPADCALL |botList| (QREFELT $ 110))
                               . #23#)
                         (LETT |top| (SPADCALL |topList| (QREFELT $ 110))
                               . #23#)
                         (EXIT
                          (COND
                           ((SPADCALL |bot| |top| (QREFELT $ 112))
                            (SEQ (LETT |hi| |bot| . #23#)
                                 (EXIT
                                  (LETT |botList|
                                        (SPADCALL |hi| |botList|
                                                  (QREFELT $ 111))
                                        . #23#))))
                           (#24#
                            (SEQ (LETT |hi| |top| . #23#)
                                 (EXIT
                                  (LETT |topList|
                                        (SPADCALL |hi| |topList|
                                                  (QREFELT $ 111))
                                        . #23#))))))))))
                     ((NULL |topList|)
                      (COND ((NULL |botList|) (|error| #26#))
                            (#24#
                             (SEQ
                              (LETT |hi| (SPADCALL |botList| (QREFELT $ 110))
                                    . #23#)
                              (EXIT
                               (LETT |botList|
                                     (SPADCALL |hi| |botList| (QREFELT $ 111))
                                     . #23#))))))
                     ((NULL |botList|)
                      (SEQ
                       (LETT |hi| (SPADCALL |topList| (QREFELT $ 110)) . #23#)
                       (EXIT
                        (LETT |topList|
                              (SPADCALL |hi| |topList| (QREFELT $ 111))
                              . #23#))))
                     (#24#
                      (SEQ
                       (LETT |bot| (SPADCALL |botList| (QREFELT $ 110)) . #23#)
                       (LETT |top| (SPADCALL |topList| (QREFELT $ 110)) . #23#)
                       (EXIT
                        (COND
                         ((SPADCALL |bot| |top| (QREFELT $ 112))
                          (SEQ (LETT |hi| |bot| . #23#)
                               (EXIT
                                (LETT |botList|
                                      (SPADCALL |hi| |botList| (QREFELT $ 111))
                                      . #23#))))
                         (#24#
                          (SEQ (LETT |hi| |top| . #23#)
                               (EXIT
                                (LETT |topList|
                                      (SPADCALL |hi| |topList| (QREFELT $ 111))
                                      . #23#)))))))))
                    (COND
                     ((EQUAL |depVar| |x|)
                      (SEQ (LETT |minSF| |xMinSF| . #23#)
                           (EXIT (LETT |maxSF| |xMaxSF| . #23#))))
                     (#24#
                      (SEQ (LETT |minSF| |yMinSF| . #23#)
                           (EXIT (LETT |maxSF| |yMaxSF| . #23#)))))
                    (LETT |segList| NIL . #23#)
                    (SEQ
                     (EXIT
                      (SEQ G190 NIL
                           (SEQ
                            (LETT |segInfo|
                                  (|ACPLOT;segmentInfo| |f| |lo| |hi| |botList|
                                   |topList| |singList| |minSF| |maxSF| $)
                                  . #23#)
                            (LETT |segList|
                                  (CONS (QVELT |segInfo| 0) |segList|) . #23#)
                            (LETT |lo| (QVELT |segInfo| 1) . #23#)
                            (LETT |botList| (QVELT |segInfo| 2) . #23#)
                            (LETT |topList| (QVELT |segInfo| 3) . #23#)
                            (EXIT
                             (COND
                              ((|eql_DF| |lo| |hi|)
                               (PROGN
                                (LETT #6# |$NoValue| . #23#)
                                (GO #27=#:G1004))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #27# (EXIT #6#))
                    (SEQ (LETT |segment| NIL . #23#)
                         (LETT #5# |segList| . #23#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |segment| (CAR #5#) . #23#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |RFPlot|
                                (SPADCALL |f| |segment| (QREFELT $ 115))
                                . #23#)
                          (LETT |curve|
                                (|SPADfirst|
                                 (SPADCALL |RFPlot| (QREFELT $ 117)))
                                . #23#)
                          (EXIT
                           (COND
                            ((EQUAL |depVar| |y|)
                             (LETT |bran| (CONS |curve| |bran|) . #23#))
                            ('T
                             (LETT |bran|
                                   (CONS
                                    (SPADCALL
                                     (CONS (|function| |ACPLOT;swapCoords|) $)
                                     |curve| (QREFELT $ 120))
                                    |bran|)
                                   . #23#)))))
                         (LETT #5# (CDR #5#) . #23#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                             (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans|
                             |bran|))))))))
          #25# (EXIT #9#)))) 

(SDEFUN |ACPLOT;makeRatFcnSketch!0| ((|s| NIL) ($$ NIL))
        (PROG (|numUPolySF| $ |denUPolySF|)
          (LETT |numUPolySF| (QREFELT $$ 2) . #1=(|ACPLOT;makeRatFcnSketch|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |denUPolySF| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |numUPolySF| |s| (QREFELT $ 99))
                      (SPADCALL |denUPolySF| |s| (QREFELT $ 99))
                      (QREFELT $ 100)))))) 

(SDEFUN |ACPLOT;makeGeneralSketch|
        ((|pol| |Polynomial| (|Integer|)) (|x| |Symbol|) (|y| |Symbol|)
         (|xMin| |Fraction| (|Integer|)) (|xMax| |Fraction| (|Integer|))
         (|yMin| |Fraction| (|Integer|)) (|yMax| |Fraction| (|Integer|)) ($ $))
        (SPROG
         ((|bran| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|bdPts|
           (|Record| (|:| |left| (|List| (|Point| (|DoubleFloat|))))
                     (|:| |right| (|List| (|Point| (|DoubleFloat|))))
                     (|:| |bottom| (|List| (|Point| (|DoubleFloat|))))
                     (|:| |top| (|List| (|Point| (|DoubleFloat|))))))
          (|tp| #1=(|List| (|Point| (|DoubleFloat|)))) (|bt| #1#)
          (|rt| #2=(|List| (|Point| (|DoubleFloat|)))) (|lf| #2#)
          (|pRN| (|Polynomial| (|Fraction| (|Integer|))))
          (|bound| (|PositiveInteger|)) (|err| #3=(|DoubleFloat|))
          (|delta| #3#) (|dpdySF| #4=(|Polynomial| (|DoubleFloat|)))
          (|dpdxSF| #4#) (|pSF| #4#)
          (|corners|
           (|Record| (|:| |minXVal| (|DoubleFloat|))
                     (|:| |maxXVal| (|DoubleFloat|))
                     (|:| |minYVal| (|DoubleFloat|))
                     (|:| |maxYVal| (|DoubleFloat|))))
          (|yMaxSF| #5=(|DoubleFloat|)) (|yMinSF| #5#) (|xMaxSF| #5#)
          (|xMinSF| #5#) (|crits| (|List| (|Point| (|DoubleFloat|))))
          (|vtans| #6=(|List| (|Point| (|DoubleFloat|)))) (|htans| #6#)
          (|yMaxNF| #7=(|Float|))
          (|foo| (|Mapping| (|Boolean|) (|List| (|Float|)))) (|yMinNF| #7#)
          (|xMaxNF| #7#) (|xMinNF| #7#) (|vInc| #8=(|Fraction| (|Integer|)))
          (|hInc| #8#) (|critPts| (|List| (|List| (|Float|))))
          (|vtanPts| #9=(|List| (|List| (|Float|)))) (|htanPts| #9#)
          (|singPts| #9#) (|dpdy| #10=(|Polynomial| (|Integer|))) (|dpdx| #10#)
          (|p| (|Polynomial| (|Integer|)))
          (|factoredPol| (|Factored| (|Polynomial| (|Integer|)))))
         (SEQ
          (LETT |factoredPol| (SPADCALL |pol| (QREFELT $ 95))
                . #11=(|ACPLOT;makeGeneralSketch|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |factoredPol| (QREFELT $ 96)) 1
                       (QREFELT $ 82))
             (|error| "reducible polynomial"))
            (#12='T
             (SEQ (LETT |p| (SPADCALL |factoredPol| 1 (QREFELT $ 121)) . #11#)
                  (LETT |dpdx| (SPADCALL |p| |x| (QREFELT $ 97)) . #11#)
                  (LETT |dpdy| (SPADCALL |p| |y| (QREFELT $ 97)) . #11#)
                  (LETT |xMinNF| (|ACPLOT;RNtoNF| |xMin| $) . #11#)
                  (LETT |xMaxNF| (|ACPLOT;RNtoNF| |xMax| $) . #11#)
                  (LETT |yMinNF| (|ACPLOT;RNtoNF| |yMin| $) . #11#)
                  (LETT |yMaxNF| (|ACPLOT;RNtoNF| |yMax| $) . #11#)
                  (LETT |singPts|
                        (SPADCALL (LIST |p| |dpdx| |dpdy|) (LIST |x| |y|)
                                  (QREFELT $ 12) (QREFELT $ 103))
                        . #11#)
                  (LETT |foo|
                        (CONS #'|ACPLOT;makeGeneralSketch!0|
                              (VECTOR $ |yMaxNF| |yMinNF| |xMaxNF| |xMinNF|))
                        . #11#)
                  (EXIT
                   (COND
                    ((|ACPLOT;ptsSuchThat?| |singPts| |foo| $)
                     (|error| "singular pts in region of sketch"))
                    (#12#
                     (SEQ
                      (LETT |htanPts|
                            (SPADCALL (LIST |p| |dpdx|) (LIST |x| |y|)
                                      (QREFELT $ 12) (QREFELT $ 103))
                            . #11#)
                      (LETT |vtanPts|
                            (SPADCALL (LIST |p| |dpdy|) (LIST |x| |y|)
                                      (QREFELT $ 12) (QREFELT $ 103))
                            . #11#)
                      (LETT |critPts|
                            (SPADCALL |htanPts| |vtanPts| (QREFELT $ 122))
                            . #11#)
                      (LETT |hInc|
                            (SPADCALL (SPADCALL 1 20 (QREFELT $ 123))
                                      (SPADCALL |xMax| |xMin| (QREFELT $ 124))
                                      (QREFELT $ 125))
                            . #11#)
                      (LETT |vInc|
                            (SPADCALL (SPADCALL 1 20 (QREFELT $ 123))
                                      (SPADCALL |yMax| |yMin| (QREFELT $ 124))
                                      (QREFELT $ 125))
                            . #11#)
                      (LETT |foo|
                            (CONS #'|ACPLOT;makeGeneralSketch!1|
                                  (VECTOR $ |xMinNF| |yMaxNF| |yMinNF|))
                            . #11#)
                      (COND
                       ((|ACPLOT;ptsSuchThat?| |critPts| |foo| $)
                        (SEQ
                         (LETT |xMin|
                               (|ACPLOT;newX| |critPts| |singPts| |yMinNF|
                                |yMaxNF| |xMinNF| |xMin|
                                (SPADCALL |hInc| (QREFELT $ 126)) $)
                               . #11#)
                         (EXIT
                          (LETT |xMinNF| (|ACPLOT;RNtoNF| |xMin| $) . #11#)))))
                      (LETT |foo|
                            (CONS #'|ACPLOT;makeGeneralSketch!2|
                                  (VECTOR $ |xMaxNF| |yMaxNF| |yMinNF|))
                            . #11#)
                      (COND
                       ((|ACPLOT;ptsSuchThat?| |critPts| |foo| $)
                        (SEQ
                         (LETT |xMax|
                               (|ACPLOT;newX| |critPts| |singPts| |yMinNF|
                                |yMaxNF| |xMaxNF| |xMax| |hInc| $)
                               . #11#)
                         (EXIT
                          (LETT |xMaxNF| (|ACPLOT;RNtoNF| |xMax| $) . #11#)))))
                      (LETT |foo|
                            (CONS #'|ACPLOT;makeGeneralSketch!3|
                                  (VECTOR $ |yMinNF| |xMaxNF| |xMinNF|))
                            . #11#)
                      (COND
                       ((|ACPLOT;ptsSuchThat?| |critPts| |foo| $)
                        (SEQ
                         (LETT |yMin|
                               (|ACPLOT;newY| |critPts| |singPts| |xMinNF|
                                |xMaxNF| |yMinNF| |yMin|
                                (SPADCALL |vInc| (QREFELT $ 126)) $)
                               . #11#)
                         (EXIT
                          (LETT |yMinNF| (|ACPLOT;RNtoNF| |yMin| $) . #11#)))))
                      (LETT |foo|
                            (CONS #'|ACPLOT;makeGeneralSketch!4|
                                  (VECTOR $ |yMaxNF| |xMaxNF| |xMinNF|))
                            . #11#)
                      (COND
                       ((|ACPLOT;ptsSuchThat?| |critPts| |foo| $)
                        (SEQ
                         (LETT |yMax|
                               (|ACPLOT;newY| |critPts| |singPts| |xMinNF|
                                |xMaxNF| |yMaxNF| |yMax| |vInc| $)
                               . #11#)
                         (EXIT
                          (LETT |yMaxNF| (|ACPLOT;RNtoNF| |yMax| $) . #11#)))))
                      (LETT |htans|
                            (|ACPLOT;listPtsInRect| |htanPts| |xMinNF| |xMaxNF|
                             |yMinNF| |yMaxNF| $)
                            . #11#)
                      (LETT |vtans|
                            (|ACPLOT;listPtsInRect| |vtanPts| |xMinNF| |xMaxNF|
                             |yMinNF| |yMaxNF| $)
                            . #11#)
                      (LETT |crits| (SPADCALL |htans| |vtans| (QREFELT $ 127))
                            . #11#)
                      (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #11#)
                      (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #11#)
                      (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #11#)
                      (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #11#)
                      (LETT |corners|
                            (|ACPLOT;makeCorners| |xMinSF| |xMaxSF| |yMinSF|
                             |yMaxSF| $)
                            . #11#)
                      (LETT |pSF| (|ACPLOT;coerceCoefsToSFs| |p| $) . #11#)
                      (LETT |dpdxSF| (|ACPLOT;coerceCoefsToSFs| |dpdx| $)
                            . #11#)
                      (LETT |dpdySF| (|ACPLOT;coerceCoefsToSFs| |dpdy| $)
                            . #11#)
                      (LETT |delta|
                            (|min_DF|
                             (|div_DF_I| (|sub_DF| |xMaxSF| |xMinSF|) 25)
                             (|div_DF_I| (|sub_DF| |yMaxSF| |yMinSF|) 25))
                            . #11#)
                      (LETT |err|
                            (|min_DF| (|div_DF_I| |delta| 100)
                                      (|div_DF_I| (QREFELT $ 15) 100))
                            . #11#)
                      (LETT |bound| 10 . #11#)
                      (LETT |pRN| (|ACPLOT;coerceCoefsToRNs| |p| $) . #11#)
                      (LETT |lf|
                            (|ACPLOT;listPtsOnVertBdry| |pRN| |x| |xMin|
                             |yMinNF| |yMaxNF| $)
                            . #11#)
                      (LETT |rt|
                            (|ACPLOT;listPtsOnVertBdry| |pRN| |x| |xMax|
                             |yMinNF| |yMaxNF| $)
                            . #11#)
                      (LETT |bt|
                            (|ACPLOT;listPtsOnHorizBdry| |pRN| |y| |yMin|
                             |xMinNF| |xMaxNF| $)
                            . #11#)
                      (LETT |tp|
                            (|ACPLOT;listPtsOnHorizBdry| |pRN| |y| |yMax|
                             |xMinNF| |xMaxNF| $)
                            . #11#)
                      (LETT |bdPts| (VECTOR |lf| |rt| |bt| |tp|) . #11#)
                      (LETT |bran|
                            (|ACPLOT;traceBranches| |pSF| |dpdxSF| |dpdySF| |x|
                             |y| |corners| |delta| |err| |bound| |crits|
                             |bdPts| $)
                            . #11#)
                      (EXIT
                       (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax| |bdPts|
                               |htans| |vtans| |bran|))))))))))))) 

(SDEFUN |ACPLOT;makeGeneralSketch!4| ((|s| NIL) ($$ NIL))
        (PROG (|xMinNF| |xMaxNF| |yMaxNF| $)
          (LETT |xMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;makeGeneralSketch|))
          (LETT |xMaxNF| (QREFELT $$ 2) . #1#)
          (LETT |yMaxNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|ACPLOT;onHorzSeg?| |s| |xMinNF| |xMaxNF| |yMaxNF| $))))) 

(SDEFUN |ACPLOT;makeGeneralSketch!3| ((|s| NIL) ($$ NIL))
        (PROG (|xMinNF| |xMaxNF| |yMinNF| $)
          (LETT |xMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;makeGeneralSketch|))
          (LETT |xMaxNF| (QREFELT $$ 2) . #1#)
          (LETT |yMinNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|ACPLOT;onHorzSeg?| |s| |xMinNF| |xMaxNF| |yMinNF| $))))) 

(SDEFUN |ACPLOT;makeGeneralSketch!2| ((|s| NIL) ($$ NIL))
        (PROG (|yMinNF| |yMaxNF| |xMaxNF| $)
          (LETT |yMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;makeGeneralSketch|))
          (LETT |yMaxNF| (QREFELT $$ 2) . #1#)
          (LETT |xMaxNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|ACPLOT;onVertSeg?| |s| |yMinNF| |yMaxNF| |xMaxNF| $))))) 

(SDEFUN |ACPLOT;makeGeneralSketch!1| ((|s| NIL) ($$ NIL))
        (PROG (|yMinNF| |yMaxNF| |xMinNF| $)
          (LETT |yMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;makeGeneralSketch|))
          (LETT |yMaxNF| (QREFELT $$ 2) . #1#)
          (LETT |xMinNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|ACPLOT;onVertSeg?| |s| |yMinNF| |yMaxNF| |xMinNF| $))))) 

(SDEFUN |ACPLOT;makeGeneralSketch!0| ((|s| NIL) ($$ NIL))
        (PROG (|xMinNF| |xMaxNF| |yMinNF| |yMaxNF| $)
          (LETT |xMinNF| (QREFELT $$ 4) . #1=(|ACPLOT;makeGeneralSketch|))
          (LETT |xMaxNF| (QREFELT $$ 3) . #1#)
          (LETT |yMinNF| (QREFELT $$ 2) . #1#)
          (LETT |yMaxNF| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|ACPLOT;inRect?| |s| |xMinNF| |xMaxNF| |yMinNF| |yMaxNF| $))))) 

(SDEFUN |ACPLOT;refine;$Df$;34|
        ((|plot| $) (|stepFraction| |DoubleFloat|) ($ $))
        (SPROG
         ((|vtans| (|List| (|Point| (|DoubleFloat|))))
          (|htans| (|List| (|Point| (|DoubleFloat|))))
          (|bran| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|bdPts|
           (|Record| (|:| |left| (|List| (|Point| (|DoubleFloat|))))
                     (|:| |right| (|List| (|Point| (|DoubleFloat|))))
                     (|:| |bottom| (|List| (|Point| (|DoubleFloat|))))
                     (|:| |top| (|List| (|Point| (|DoubleFloat|))))))
          (|crits| (|List| (|Point| (|DoubleFloat|))))
          (|bound| (|PositiveInteger|)) (|err| (|DoubleFloat|))
          (|delta| (|DoubleFloat|))
          (|dpdySF| #1=(|Polynomial| (|DoubleFloat|))) (|dpdxSF| #1#)
          (|pSF| #1#)
          (|corners|
           (|Record| (|:| |minXVal| (|DoubleFloat|))
                     (|:| |maxXVal| (|DoubleFloat|))
                     (|:| |minYVal| (|DoubleFloat|))
                     (|:| |maxYVal| (|DoubleFloat|))))
          (|yMaxSF| #2=(|DoubleFloat|)) (|yMinSF| #2#) (|xMaxSF| #2#)
          (|xMinSF| #2#) (|yMax| (|Fraction| (|Integer|)))
          (|yMin| (|Fraction| (|Integer|))) (|xMax| (|Fraction| (|Integer|)))
          (|xMin| (|Fraction| (|Integer|)))
          (|dpdy| #3=(|Polynomial| (|Integer|))) (|dpdx| #3#) (|y| (|Symbol|))
          (|x| (|Symbol|)) (|p| (|Polynomial| (|Integer|))))
         (SEQ (LETT |p| (QVELT |plot| 0) . #4=(|ACPLOT;refine;$Df$;34|))
              (LETT |x| (QVELT |plot| 1) . #4#)
              (LETT |y| (QVELT |plot| 2) . #4#)
              (LETT |dpdx| (SPADCALL |p| |x| (QREFELT $ 97)) . #4#)
              (LETT |dpdy| (SPADCALL |p| |y| (QREFELT $ 97)) . #4#)
              (LETT |pSF| (|ACPLOT;coerceCoefsToSFs| |p| $) . #4#)
              (LETT |dpdxSF| (|ACPLOT;coerceCoefsToSFs| |dpdx| $) . #4#)
              (LETT |dpdySF| (|ACPLOT;coerceCoefsToSFs| |dpdy| $) . #4#)
              (LETT |xMin| (QVELT |plot| 3) . #4#)
              (LETT |xMax| (QVELT |plot| 4) . #4#)
              (LETT |yMin| (QVELT |plot| 5) . #4#)
              (LETT |yMax| (QVELT |plot| 6) . #4#)
              (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #4#)
              (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #4#)
              (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #4#)
              (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #4#)
              (LETT |corners|
                    (|ACPLOT;makeCorners| |xMinSF| |xMaxSF| |yMinSF| |yMaxSF|
                     $)
                    . #4#)
              (LETT |pSF| (|ACPLOT;coerceCoefsToSFs| |p| $) . #4#)
              (LETT |dpdxSF| (|ACPLOT;coerceCoefsToSFs| |dpdx| $) . #4#)
              (LETT |dpdySF| (|ACPLOT;coerceCoefsToSFs| |dpdy| $) . #4#)
              (LETT |delta|
                    (|mul_DF| |stepFraction|
                              (|min_DF|
                               (|div_DF_I| (|sub_DF| |xMaxSF| |xMinSF|) 25)
                               (|div_DF_I| (|sub_DF| |yMaxSF| |yMinSF|) 25)))
                    . #4#)
              (LETT |err|
                    (|min_DF| (|div_DF_I| |delta| 100)
                              (|div_DF_I| (QREFELT $ 15) 100))
                    . #4#)
              (LETT |bound| 10 . #4#)
              (LETT |crits|
                    (SPADCALL (QVELT |plot| 8) (QVELT |plot| 9)
                              (QREFELT $ 127))
                    . #4#)
              (LETT |bdPts| (QVELT |plot| 7) . #4#)
              (LETT |bran|
                    (|ACPLOT;traceBranches| |pSF| |dpdxSF| |dpdySF| |x| |y|
                     |corners| |delta| |err| |bound| |crits| |bdPts| $)
                    . #4#)
              (LETT |htans| (QVELT |plot| 8) . #4#)
              (LETT |vtans| (QVELT |plot| 9) . #4#)
              (EXIT
               (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax| |bdPts| |htans|
                       |vtans| |bran|))))) 

(SDEFUN |ACPLOT;traceBranches|
        ((|pSF| |Polynomial| (|DoubleFloat|))
         (|dpdxSF| |Polynomial| (|DoubleFloat|))
         (|dpdySF| |Polynomial| (|DoubleFloat|)) (|x| |Symbol|) (|y| |Symbol|)
         (|corners| |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|)))
         (|delta| |DoubleFloat|) (|err| |DoubleFloat|)
         (|bound| |PositiveInteger|) (|crits| |List| (|Point| (|DoubleFloat|)))
         (|bdPts| |Record| (|:| |left| #1=(|List| (|Point| (|DoubleFloat|))))
          (|:| |right| #2=(|List| (|Point| (|DoubleFloat|))))
          (|:| |bottom| #3=(|List| (|Point| (|DoubleFloat|))))
          (|:| |top| #4=(|List| (|Point| (|DoubleFloat|)))))
         ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|bran| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|segInfo| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|pt| (|Point| (|DoubleFloat|)))
          (|bdry| (|List| (|Point| (|DoubleFloat|))))
          (|p0| (|Point| (|DoubleFloat|))) (|bt| #3#) (|tp| #4#) (|rt| #2#)
          (|lf| #1#))
         (SEQ (LETT |lf| (QVELT |bdPts| 0) . #5=(|ACPLOT;traceBranches|))
              (LETT |rt| (QVELT |bdPts| 1) . #5#)
              (LETT |tp| (QVELT |bdPts| 3) . #5#)
              (LETT |bt| (QVELT |bdPts| 2) . #5#)
              (LETT |bdry|
                    (SPADCALL (SPADCALL |lf| |rt| (QREFELT $ 127))
                              (SPADCALL |bt| |tp| (QREFELT $ 127))
                              (QREFELT $ 127))
                    . #5#)
              (LETT |bran| NIL . #5#)
              (SEQ G190 (COND ((NULL (NULL (NULL |bdry|))) (GO G191)))
                   (SEQ (LETT |pt| (|SPADfirst| |bdry|) . #5#)
                        (LETT |p0|
                              (|ACPLOT;dummyFirstPt| |pt| |dpdxSF| |dpdySF| |x|
                               |y| |lf| |rt| |bt| |tp| $)
                              . #5#)
                        (LETT |segInfo|
                              (|ACPLOT;listPtsOnSegment| |pSF| |dpdxSF|
                               |dpdySF| |x| |y| |p0| |pt| |corners| |delta|
                               |err| |bound| |crits| |bdry| $)
                              . #5#)
                        (LETT |bran| (CONS (|SPADfirst| |segInfo|) |bran|)
                              . #5#)
                        (LETT |crits| (SPADCALL |segInfo| (QREFELT $ 129))
                              . #5#)
                        (EXIT
                         (LETT |bdry| (SPADCALL |segInfo| (QREFELT $ 130))
                               . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (SEQ G190 (COND ((NULL (NULL (NULL |crits|))) (GO G191)))
                   (SEQ (LETT |pt| (|SPADfirst| |crits|) . #5#)
                        (LETT |segInfo|
                              (|ACPLOT;listPtsOnLoop| |pSF| |dpdxSF| |dpdySF|
                               |x| |y| |pt| |corners| |delta| |err| |bound|
                               |crits| |bdry| $)
                              . #5#)
                        (LETT |bran| (CONS (|SPADfirst| |segInfo|) |bran|)
                              . #5#)
                        (EXIT
                         (LETT |crits| (SPADCALL |segInfo| (QREFELT $ 129))
                               . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |bran|)))) 

(SDEFUN |ACPLOT;dummyFirstPt|
        ((|p1| |Point| (|DoubleFloat|)) (|dpdxSF| |Polynomial| (|DoubleFloat|))
         (|dpdySF| |Polynomial| (|DoubleFloat|)) (|x| |Symbol|) (|y| |Symbol|)
         (|lf| |List| (|Point| (|DoubleFloat|)))
         (|rt| |List| (|Point| (|DoubleFloat|)))
         (|bt| |List| (|Point| (|DoubleFloat|)))
         (|tp| |List| (|Point| (|DoubleFloat|))) ($ |Point| (|DoubleFloat|)))
        (SPROG
         ((|py| #1=(|DoubleFloat|)) (|px| #1#) (|one| (|DoubleFloat|))
          (|zero| (|DoubleFloat|)) (|y1| (|DoubleFloat|))
          (|x1| (|DoubleFloat|)))
         (SEQ
          (LETT |x1| (SPADCALL |p1| (QREFELT $ 28))
                . #2=(|ACPLOT;dummyFirstPt|))
          (LETT |y1| (SPADCALL |p1| (QREFELT $ 27)) . #2#)
          (LETT |zero| 0.0 . #2#) (LETT |one| 1.0 . #2#)
          (LETT |px|
                (SPADCALL
                 (SPADCALL |dpdxSF| (LIST |x| |y|) (LIST |x1| |y1|)
                           (QREFELT $ 131))
                 (QREFELT $ 132))
                . #2#)
          (LETT |py|
                (SPADCALL
                 (SPADCALL |dpdySF| (LIST |x| |y|) (LIST |x1| |y1|)
                           (QREFELT $ 131))
                 (QREFELT $ 132))
                . #2#)
          (EXIT
           (COND
            ((|less_DF| (|mul_DF| |px| |py|) |zero|)
             (COND
              ((OR (SPADCALL |p1| |lf| (QREFELT $ 133))
                   (SPADCALL |p1| |bt| (QREFELT $ 133)))
               (|ACPLOT;makePt| (|sub_DF| |x1| |one|) (|sub_DF| |y1| |one|) $))
              (#3='T
               (|ACPLOT;makePt| (|add_DF| |x1| |one|) (|add_DF| |y1| |one|)
                $))))
            ((OR (SPADCALL |p1| |lf| (QREFELT $ 133))
                 (SPADCALL |p1| |tp| (QREFELT $ 133)))
             (|ACPLOT;makePt| (|sub_DF| |x1| |one|) (|add_DF| |y1| |one|) $))
            (#3#
             (|ACPLOT;makePt| (|add_DF| |x1| |one|) (|sub_DF| |y1| |one|)
              $))))))) 

(SDEFUN |ACPLOT;listPtsOnSegment|
        ((|pSF| |Polynomial| (|DoubleFloat|))
         (|dpdxSF| |Polynomial| (|DoubleFloat|))
         (|dpdySF| |Polynomial| (|DoubleFloat|)) (|x| |Symbol|) (|y| |Symbol|)
         (|p0| |Point| (|DoubleFloat|)) (|p1| . #1=(|Point| (|DoubleFloat|)))
         (|corners| |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|)))
         (|delta| |DoubleFloat|) (|err| |DoubleFloat|)
         (|bound| |PositiveInteger|) (|crits| |List| (|Point| (|DoubleFloat|)))
         (|bdry| |List| (|Point| (|DoubleFloat|)))
         ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|pointList| (|List| #1#)) (#2=#:G1081 NIL)
          (|p2| #3=(|Point| (|DoubleFloat|)))
          (|ptInfo| (|Record| (|:| |newPt| #3#) (|:| |type| (|String|))))
          (|pt1| (|Point| (|DoubleFloat|))) (|pt0| (|Point| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |bdry| (SPADCALL |p1| |bdry| (QREFELT $ 134))
                  . #4=(|ACPLOT;listPtsOnSegment|))
            (LETT |pointList| (LIST |p1|) . #4#)
            (LETT |ptInfo|
                  (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x| |y| |p0|
                   |p1| |corners| |delta| |err| |bound| |crits| |bdry| $)
                  . #4#)
            (LETT |p2| (QCAR |ptInfo|) . #4#)
            (EXIT
             (COND
              ((EQUAL (QCDR |ptInfo|) (QREFELT $ 17))
               (SEQ (LETT |bdry| (SPADCALL |p2| |bdry| (QREFELT $ 134)) . #4#)
                    (LETT |pointList| (CONS |p2| |pointList|) . #4#)
                    (EXIT (LIST |pointList| |crits| |bdry|))))
              ('T
               (SEQ
                (COND
                 ((EQUAL (QCDR |ptInfo|) (QREFELT $ 18))
                  (LETT |crits| (SPADCALL |p2| |crits| (QREFELT $ 134))
                        . #4#)))
                (LETT |pointList| (CONS |p2| |pointList|) . #4#)
                (SEQ G190 NIL
                     (SEQ
                      (LETT |pt0| (SPADCALL |pointList| (QREFELT $ 135)) . #4#)
                      (LETT |pt1| (|SPADfirst| |pointList|) . #4#)
                      (LETT |ptInfo|
                            (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x|
                             |y| |pt0| |pt1| |corners| |delta| |err| |bound|
                             |crits| |bdry| $)
                            . #4#)
                      (LETT |p2| (QCAR |ptInfo|) . #4#)
                      (EXIT
                       (COND
                        ((EQUAL (QCDR |ptInfo|) (QREFELT $ 17))
                         (SEQ
                          (LETT |bdry| (SPADCALL |p2| |bdry| (QREFELT $ 134))
                                . #4#)
                          (LETT |pointList| (CONS |p2| |pointList|) . #4#)
                          (EXIT
                           (PROGN
                            (LETT #2# (LIST |pointList| |crits| |bdry|) . #4#)
                            (GO #5=#:G1080)))))
                        ('T
                         (SEQ
                          (COND
                           ((EQUAL (QCDR |ptInfo|) (QREFELT $ 18))
                            (LETT |crits|
                                  (SPADCALL |p2| |crits| (QREFELT $ 134))
                                  . #4#)))
                          (EXIT
                           (LETT |pointList| (CONS |p2| |pointList|)
                                 . #4#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LIST |pointList| |crits| |bdry|))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |ACPLOT;listPtsOnLoop|
        ((|pSF| |Polynomial| (|DoubleFloat|))
         (|dpdxSF| |Polynomial| (|DoubleFloat|))
         (|dpdySF| |Polynomial| (|DoubleFloat|)) (|x| |Symbol|) (|y| |Symbol|)
         (|p1| . #1=(|Point| (|DoubleFloat|)))
         (|corners| |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|)))
         (|delta| |DoubleFloat|) (|err| |DoubleFloat|)
         (|bound| |PositiveInteger|) (|crits| |List| (|Point| (|DoubleFloat|)))
         (|bdry| |List| (|Point| (|DoubleFloat|)))
         ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|pointList| (|List| #1#)) (#2=#:G1095 NIL)
          (|p2| #3=(|Point| (|DoubleFloat|)))
          (|ptInfo| (|Record| (|:| |newPt| #3#) (|:| |type| (|String|))))
          (|pt1| (|Point| (|DoubleFloat|))) (|pt0| (|Point| (|DoubleFloat|)))
          (|p0| (|Point| (|DoubleFloat|))) (|py| #4=(|DoubleFloat|)) (|px| #4#)
          (|y1| (|DoubleFloat|)) (|x1| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x1| (SPADCALL |p1| (QREFELT $ 28))
                  . #5=(|ACPLOT;listPtsOnLoop|))
            (LETT |y1| (SPADCALL |p1| (QREFELT $ 27)) . #5#)
            (LETT |px|
                  (SPADCALL
                   (SPADCALL |dpdxSF| (LIST |x| |y|) (LIST |x1| |y1|)
                             (QREFELT $ 131))
                   (QREFELT $ 132))
                  . #5#)
            (LETT |py|
                  (SPADCALL
                   (SPADCALL |dpdySF| (LIST |x| |y|) (LIST |x1| |y1|)
                             (QREFELT $ 131))
                   (QREFELT $ 132))
                  . #5#)
            (LETT |p0|
                  (|ACPLOT;makePt| (|sub_DF| |x1| 1.0) (|sub_DF| |y1| 1.0) $)
                  . #5#)
            (LETT |pointList| (LIST |p1|) . #5#)
            (LETT |ptInfo|
                  (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x| |y| |p0|
                   |p1| |corners| |delta| |err| |bound| |crits| |bdry| $)
                  . #5#)
            (LETT |p2| (QCAR |ptInfo|) . #5#)
            (EXIT
             (COND
              ((EQUAL (QCDR |ptInfo|) (QREFELT $ 17))
               (|error| "boundary reached while on loop"))
              (#6='T
               (SEQ
                (COND
                 ((EQUAL (QCDR |ptInfo|) (QREFELT $ 18))
                  (COND
                   ((SPADCALL |p1| |p2| (QREFELT $ 136))
                    (|error| "first and second points on loop are identical"))
                   (#6#
                    (LETT |crits| (SPADCALL |p2| |crits| (QREFELT $ 134))
                          . #5#)))))
                (LETT |pointList| (CONS |p2| |pointList|) . #5#)
                (SEQ G190 NIL
                     (SEQ
                      (LETT |pt0| (SPADCALL |pointList| (QREFELT $ 135)) . #5#)
                      (LETT |pt1| (|SPADfirst| |pointList|) . #5#)
                      (LETT |ptInfo|
                            (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x|
                             |y| |pt0| |pt1| |corners| |delta| |err| |bound|
                             |crits| |bdry| $)
                            . #5#)
                      (LETT |p2| (QCAR |ptInfo|) . #5#)
                      (EXIT
                       (COND
                        ((EQUAL (QCDR |ptInfo|) (QREFELT $ 17))
                         (|error| "boundary reached while on loop"))
                        ('T
                         (SEQ
                          (COND
                           ((EQUAL (QCDR |ptInfo|) (QREFELT $ 18))
                            (SEQ
                             (LETT |crits|
                                   (SPADCALL |p2| |crits| (QREFELT $ 134))
                                   . #5#)
                             (EXIT
                              (COND
                               ((SPADCALL |p1| |p2| (QREFELT $ 136))
                                (SEQ
                                 (LETT |pointList| (CONS |p2| |pointList|)
                                       . #5#)
                                 (EXIT
                                  (PROGN
                                   (LETT #2# (LIST |pointList| |crits| |bdry|)
                                         . #5#)
                                   (GO #7=#:G1094))))))))))
                          (EXIT
                           (LETT |pointList| (CONS |p2| |pointList|)
                                 . #5#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LIST |pointList| |crits| |bdry|))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |ACPLOT;computeNextPt|
        ((|pSF| |Polynomial| (|DoubleFloat|))
         (|dpdxSF| |Polynomial| (|DoubleFloat|))
         (|dpdySF| |Polynomial| (|DoubleFloat|)) (|x| . #1=(|Symbol|))
         (|y| |Symbol|) (|p0| |Point| (|DoubleFloat|))
         (|p1| |Point| (|DoubleFloat|))
         (|corners| |Record| (|:| |minXVal| (|DoubleFloat|))
          (|:| |maxXVal| (|DoubleFloat|)) (|:| |minYVal| (|DoubleFloat|))
          (|:| |maxYVal| (|DoubleFloat|)))
         (|delta| |DoubleFloat|) (|err| |DoubleFloat|)
         (|bound| |PositiveInteger|) (|crits| |List| (|Point| (|DoubleFloat|)))
         (|bdry| |List| (|Point| (|DoubleFloat|)))
         ($ |Record| (|:| |newPt| (|Point| (|DoubleFloat|)))
          (|:| |type| (|String|))))
        (SPROG
         ((|critPt| #2=(|Union| (|Point| (|DoubleFloat|)) #3="failed"))
          (|bdryPt| #2#) (|pt| #4=(|Point| (|DoubleFloat|)))
          (|x2| #5=(|DoubleFloat|)) (#6=#:G1157 NIL)
          (|x2New| #7=(|Union| (|DoubleFloat|) "failed"))
          (|f| (|SparseUnivariatePolynomial| (|DoubleFloat|)))
          (|y2| (|DoubleFloat|)) (|y2New| #7#) (|y2Approx| #5#)
          (|x2Approx| #5#) (|lookingFor| (|String|)) (|incVar| #1#)
          (#8=#:G1122 NIL) (|critPt2| #2#) (|critPt1| #2#) (|pt2| #4#)
          (|pt1| #4#) (|x2Temp| #5#) (|y2Temp| #5#) (|yHi| #5#)
          (|yLo| #9=(|DoubleFloat|))
          (|yPointList| (|List| (|Point| (|DoubleFloat|)))) (|xHi| #5#)
          (|xLo| #10=(|DoubleFloat|))
          (|xPointList| (|List| (|Point| (|DoubleFloat|)))) (|yy| #9#)
          (|xx| #10#) (#11=#:G1158 NIL) (|y2Approxx| #5#) (|x2Approxx| #5#)
          (|deltaY| #12=(|DoubleFloat|)) (|incVar0| #1#) (|deltaX| #12#)
          (|py| #13=(|DoubleFloat|)) (|px| #13#) (|y1| #9#) (|x1| #10#)
          (|y0| #9#) (|x0| #10#) (|yMaxSF| (|DoubleFloat|))
          (|yMinSF| (|DoubleFloat|)) (|xMaxSF| (|DoubleFloat|))
          (|xMinSF| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xMinSF| (|ACPLOT;getXMin| |corners| $)
                  . #14=(|ACPLOT;computeNextPt|))
            (LETT |xMaxSF| (|ACPLOT;getXMax| |corners| $) . #14#)
            (LETT |yMinSF| (|ACPLOT;getYMin| |corners| $) . #14#)
            (LETT |yMaxSF| (|ACPLOT;getYMax| |corners| $) . #14#)
            (LETT |x0| (SPADCALL |p0| (QREFELT $ 28)) . #14#)
            (LETT |y0| (SPADCALL |p0| (QREFELT $ 27)) . #14#)
            (LETT |x1| (SPADCALL |p1| (QREFELT $ 28)) . #14#)
            (LETT |y1| (SPADCALL |p1| (QREFELT $ 27)) . #14#)
            (LETT |px|
                  (SPADCALL
                   (SPADCALL |dpdxSF| (LIST |x| |y|) (LIST |x1| |y1|)
                             (QREFELT $ 131))
                   (QREFELT $ 132))
                  . #14#)
            (LETT |py|
                  (SPADCALL
                   (SPADCALL |dpdySF| (LIST |x| |y|) (LIST |x1| |y1|)
                             (QREFELT $ 131))
                   (QREFELT $ 132))
                  . #14#)
            (COND
             ((SPADCALL (|abs_DF| |py|) (|abs_DF| |px|) (QREFELT $ 112))
              (SEQ (LETT |incVar0| (LETT |incVar| |x| . #14#) . #14#)
                   (LETT |deltaX|
                         (COND ((SPADCALL |x1| |x0| (QREFELT $ 112)) |delta|)
                               (#15='T (|minus_DF| |delta|)))
                         . #14#)
                   (LETT |x2Approx| (|add_DF| |x1| |deltaX|) . #14#)
                   (EXIT
                    (LETT |y2Approx|
                          (|add_DF| |y1|
                                    (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                              |deltaX|))
                          . #14#))))
             (#15#
              (SEQ (LETT |incVar0| (LETT |incVar| |y| . #14#) . #14#)
                   (LETT |deltaY|
                         (COND ((SPADCALL |y1| |y0| (QREFELT $ 112)) |delta|)
                               (#15# (|minus_DF| |delta|)))
                         . #14#)
                   (LETT |x2Approx|
                         (|add_DF| |x1|
                                   (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                             |deltaY|))
                         . #14#)
                   (EXIT (LETT |y2Approx| (|add_DF| |y1| |deltaY|) . #14#)))))
            (LETT |lookingFor| (QREFELT $ 16) . #14#)
            (COND
             ((SPADCALL |x2Approx| |xMaxSF| (QREFELT $ 93))
              (SEQ (LETT |incVar| |x| . #14#)
                   (LETT |lookingFor| (QREFELT $ 17) . #14#)
                   (LETT |x2Approx| |xMaxSF| . #14#)
                   (EXIT
                    (LETT |y2Approx|
                          (|add_DF| |y1|
                                    (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                              (|sub_DF| |x2Approx| |x1|)))
                          . #14#))))
             ((SPADCALL |x2Approx| |xMinSF| (QREFELT $ 90))
              (SEQ (LETT |incVar| |x| . #14#)
                   (LETT |lookingFor| (QREFELT $ 17) . #14#)
                   (LETT |x2Approx| |xMinSF| . #14#)
                   (EXIT
                    (LETT |y2Approx|
                          (|add_DF| |y1|
                                    (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                              (|sub_DF| |x2Approx| |x1|)))
                          . #14#)))))
            (COND
             ((SPADCALL |y2Approx| |yMaxSF| (QREFELT $ 93))
              (SEQ (LETT |incVar| |y| . #14#)
                   (LETT |lookingFor| (QREFELT $ 17) . #14#)
                   (LETT |y2Approx| |yMaxSF| . #14#)
                   (EXIT
                    (LETT |x2Approx|
                          (|add_DF| |x1|
                                    (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                              (|sub_DF| |y2Approx| |y1|)))
                          . #14#))))
             ((SPADCALL |y2Approx| |yMinSF| (QREFELT $ 90))
              (SEQ (LETT |incVar| |y| . #14#)
                   (LETT |lookingFor| (QREFELT $ 17) . #14#)
                   (LETT |y2Approx| |yMinSF| . #14#)
                   (EXIT
                    (LETT |x2Approx|
                          (|add_DF| |x1|
                                    (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                              (|sub_DF| |y2Approx| |y1|)))
                          . #14#)))))
            (COND
             ((|less_DF| |x1| |x2Approx|)
              (SEQ (LETT |xLo| |x1| . #14#)
                   (EXIT (LETT |xHi| |x2Approx| . #14#))))
             (#15#
              (SEQ (LETT |xLo| |x2Approx| . #14#)
                   (EXIT (LETT |xHi| |x1| . #14#)))))
            (COND
             ((|less_DF| |y1| |y2Approx|)
              (SEQ (LETT |yLo| |y1| . #14#)
                   (EXIT (LETT |yHi| |y2Approx| . #14#))))
             (#15#
              (SEQ (LETT |yLo| |y2Approx| . #14#)
                   (EXIT (LETT |yHi| |y1| . #14#)))))
            (LETT |x2Approxx| |x2Approx| . #14#)
            (LETT |y2Approxx| |y2Approx| . #14#) (LETT |xPointList| NIL . #14#)
            (LETT |yPointList| NIL . #14#)
            (SEQ (LETT |pt| NIL . #14#) (LETT #11# |crits| . #14#) G190
                 (COND
                  ((OR (ATOM #11#) (PROGN (LETT |pt| (CAR #11#) . #14#) NIL))
                   (GO G191)))
                 (SEQ (LETT |xx| (SPADCALL |pt| (QREFELT $ 28)) . #14#)
                      (LETT |yy| (SPADCALL |pt| (QREFELT $ 27)) . #14#)
                      (COND
                       ((|eql_DF| |xx| |x2Approx|)
                        (COND
                         ((NULL (|eql_DF| |xx| |x1|))
                          (COND
                           ((|less_DF|
                             (|min_DF| (|abs_DF| (|sub_DF| |yy| |yLo|))
                                       (|abs_DF| (|sub_DF| |yy| |yHi|)))
                             |delta|)
                            (LETT |xPointList| (CONS |pt| |xPointList|)
                                  . #14#)))))))
                      (COND
                       ((|less_DF| |xLo| |xx|)
                        (COND
                         ((|less_DF| |xx| |xHi|)
                          (COND
                           ((|less_DF|
                             (|min_DF| (|abs_DF| (|sub_DF| |yy| |yLo|))
                                       (|abs_DF| (|sub_DF| |yy| |yHi|)))
                             |delta|)
                            (SEQ (LETT |xPointList| (CONS |pt| NIL) . #14#)
                                 (LETT |x2Approx| |xx| . #14#)
                                 (EXIT
                                  (COND
                                   ((|less_DF| |xx| |x1|)
                                    (LETT |xLo| |xx| . #14#))
                                   ('T (LETT |xHi| |xx| . #14#)))))))))))
                      (COND
                       ((|eql_DF| |yy| |y2Approx|)
                        (COND
                         ((NULL (|eql_DF| |yy| |y1|))
                          (LETT |yPointList| (CONS |pt| |yPointList|)
                                . #14#)))))
                      (EXIT
                       (COND
                        ((|less_DF| |yLo| |yy|)
                         (COND
                          ((|less_DF| |yy| |yHi|)
                           (COND
                            ((|less_DF|
                              (|min_DF| (|abs_DF| (|sub_DF| |xx| |xLo|))
                                        (|abs_DF| (|sub_DF| |xx| |xHi|)))
                              |delta|)
                             (SEQ (LETT |yPointList| (CONS |pt| NIL) . #14#)
                                  (LETT |y2Approx| |yy| . #14#)
                                  (EXIT
                                   (COND
                                    ((|less_DF| |yy| |y1|)
                                     (LETT |yLo| |yy| . #14#))
                                    ('T (LETT |yHi| |yy| . #14#)))))))))))))
                 (LETT #11# (CDR #11#) . #14#) (GO G190) G191 (EXIT NIL))
            (COND
             ((NULL (NULL |xPointList|))
              (COND
               ((NULL (NULL |yPointList|))
                (COND
                 ((SPADCALL |xPointList| |yPointList| (QREFELT $ 137))
                  (SEQ (LETT |incVar| |incVar0| . #14#)
                       (COND
                        ((EQUAL |incVar| |x|)
                         (LETT |y2Approx|
                               (|add_DF| |y1|
                                         (|mul_DF|
                                          (|minus_DF| (|div_DF| |px| |py|))
                                          (|sub_DF| |x2Approx| |x1|)))
                               . #14#))
                        (#15#
                         (LETT |x2Approx|
                               (|add_DF| |x1|
                                         (|mul_DF|
                                          (|minus_DF| (|div_DF| |py| |px|))
                                          (|sub_DF| |y2Approx| |y1|)))
                               . #14#)))
                       (EXIT (LETT |lookingFor| (QREFELT $ 18) . #14#))))
                 ((EQUAL |incVar0| |x|)
                  (SEQ
                   (LETT |x2Temp|
                         (|add_DF| |x1|
                                   (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                             (|sub_DF| |y2Approx| |y1|)))
                         . #14#)
                   (LETT |f|
                         (|ACPLOT;SFPolyToUPoly|
                          (SPADCALL |pSF| |y| |y2Approx| (QREFELT $ 138)) $)
                         . #14#)
                   (LETT |x2New|
                         (|ACPLOT;newtonApprox| |f| |x2Temp| |err| |bound| $)
                         . #14#)
                   (EXIT
                    (COND
                     ((QEQCAR |x2New| 1)
                      (SEQ
                       (LETT |y2Approx|
                             (|add_DF| |y1|
                                       (|mul_DF|
                                        (|minus_DF| (|div_DF| |px| |py|))
                                        (|sub_DF| |x2Approx| |x1|)))
                             . #14#)
                       (LETT |incVar| |x| . #14#)
                       (EXIT (LETT |lookingFor| (QREFELT $ 18) . #14#))))
                     (#15#
                      (SEQ
                       (LETT |y2Temp|
                             (|add_DF| |y1|
                                       (|mul_DF|
                                        (|minus_DF| (|div_DF| |px| |py|))
                                        (|sub_DF| |x2Approx| |x1|)))
                             . #14#)
                       (LETT |f|
                             (|ACPLOT;SFPolyToUPoly|
                              (SPADCALL |pSF| |x| |x2Approx| (QREFELT $ 138))
                              $)
                             . #14#)
                       (LETT |y2New|
                             (|ACPLOT;newtonApprox| |f| |y2Temp| |err| |bound|
                              $)
                             . #14#)
                       (EXIT
                        (COND
                         ((QEQCAR |y2New| 1)
                          (PROGN
                           (LETT #6#
                                 (|ACPLOT;computeNextPt| |pSF| |dpdxSF|
                                  |dpdySF| |x| |y| |p0| |p1| |corners|
                                  (|abs_DF|
                                   (|div_DF_I| (|sub_DF| |x2Approx| |x1|) 2))
                                  |err| |bound| |crits| |bdry| $)
                                 . #14#)
                           (GO #16=#:G1156)))
                         (#15#
                          (SEQ
                           (LETT |pt1|
                                 (|ACPLOT;makePt| |x2Approx| (QCDR |y2New|) $)
                                 . #14#)
                           (LETT |pt2|
                                 (|ACPLOT;makePt| (QCDR |x2New|) |y2Approx| $)
                                 . #14#)
                           (LETT |critPt1|
                                 (|ACPLOT;findPtOnList| |pt1| |crits| $)
                                 . #14#)
                           (LETT |critPt2|
                                 (|ACPLOT;findPtOnList| |pt2| |crits| $)
                                 . #14#)
                           (COND
                            ((QEQCAR |critPt1| 1)
                             (COND
                              ((QEQCAR |critPt2| 1)
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (|abs_DF| (|sub_DF| |x2Approx| |x1|))
                                   (|abs_DF| (|sub_DF| |x2Temp| |x1|))
                                   (QREFELT $ 112))
                                  (PROGN
                                   (LETT #6# (CONS |pt1| (QREFELT $ 16))
                                         . #14#)
                                   (GO #16#)))
                                 (#15#
                                  (PROGN
                                   (LETT #6# (CONS |pt2| (QREFELT $ 16))
                                         . #14#)
                                   (GO #16#)))))))))
                           (EXIT
                            (COND
                             ((QEQCAR |critPt1| 1)
                              (PROGN
                               (LETT #6#
                                     (CONS
                                      (PROG2 (LETT #8# |critPt2| . #14#)
                                          (QCDR #8#)
                                        (|check_union2| (QEQCAR #8# 0)
                                                        (|Point|
                                                         (|DoubleFloat|))
                                                        (|Union|
                                                         (|Point|
                                                          (|DoubleFloat|))
                                                         #3#)
                                                        #8#))
                                      (QREFELT $ 18))
                                     . #14#)
                               (GO #16#)))
                             ((QEQCAR |critPt2| 1)
                              (PROGN
                               (LETT #6# (CONS (QCDR |critPt1|) (QREFELT $ 18))
                                     . #14#)
                               (GO #16#)))
                             (#15#
                              (COND
                               ((SPADCALL (|abs_DF| (|sub_DF| |x2Approx| |x1|))
                                          (|abs_DF| (|sub_DF| |x2Temp| |x1|))
                                          (QREFELT $ 112))
                                (PROGN
                                 (LETT #6#
                                       (CONS (QCDR |critPt2|) (QREFELT $ 18))
                                       . #14#)
                                 (GO #16#)))
                               (#15#
                                (PROGN
                                 (LETT #6#
                                       (CONS (QCDR |critPt1|) (QREFELT $ 18))
                                       . #14#)
                                 (GO #16#)))))))))))))))))
                 (#15#
                  (SEQ
                   (LETT |y2Temp|
                         (|add_DF| |y1|
                                   (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                             (|sub_DF| |x2Approx| |x1|)))
                         . #14#)
                   (LETT |f|
                         (|ACPLOT;SFPolyToUPoly|
                          (SPADCALL |pSF| |x| |x2Approx| (QREFELT $ 138)) $)
                         . #14#)
                   (LETT |y2New|
                         (|ACPLOT;newtonApprox| |f| |y2Temp| |err| |bound| $)
                         . #14#)
                   (EXIT
                    (COND
                     ((QEQCAR |y2New| 1)
                      (SEQ
                       (LETT |x2Approx|
                             (|add_DF| |x1|
                                       (|mul_DF|
                                        (|minus_DF| (|div_DF| |py| |px|))
                                        (|sub_DF| |y2Approx| |y1|)))
                             . #14#)
                       (LETT |incVar| |y| . #14#)
                       (EXIT (LETT |lookingFor| (QREFELT $ 18) . #14#))))
                     (#15#
                      (SEQ
                       (LETT |x2Temp|
                             (|add_DF| |x1|
                                       (|mul_DF|
                                        (|minus_DF| (|div_DF| |py| |px|))
                                        (|sub_DF| |y2Approx| |y1|)))
                             . #14#)
                       (LETT |f|
                             (|ACPLOT;SFPolyToUPoly|
                              (SPADCALL |pSF| |y| |y2Approx| (QREFELT $ 138))
                              $)
                             . #14#)
                       (LETT |x2New|
                             (|ACPLOT;newtonApprox| |f| |x2Temp| |err| |bound|
                              $)
                             . #14#)
                       (EXIT
                        (COND
                         ((QEQCAR |x2New| 1)
                          (PROGN
                           (LETT #6#
                                 (|ACPLOT;computeNextPt| |pSF| |dpdxSF|
                                  |dpdySF| |x| |y| |p0| |p1| |corners|
                                  (|abs_DF|
                                   (|div_DF_I| (|sub_DF| |y2Approx| |y1|) 2))
                                  |err| |bound| |crits| |bdry| $)
                                 . #14#)
                           (GO #16#)))
                         (#15#
                          (SEQ
                           (LETT |pt1|
                                 (|ACPLOT;makePt| |x2Approx| (QCDR |y2New|) $)
                                 . #14#)
                           (LETT |pt2|
                                 (|ACPLOT;makePt| (QCDR |x2New|) |y2Approx| $)
                                 . #14#)
                           (LETT |critPt1|
                                 (|ACPLOT;findPtOnList| |pt1| |crits| $)
                                 . #14#)
                           (LETT |critPt2|
                                 (|ACPLOT;findPtOnList| |pt2| |crits| $)
                                 . #14#)
                           (COND
                            ((QEQCAR |critPt1| 1)
                             (COND
                              ((QEQCAR |critPt2| 1)
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (|abs_DF| (|sub_DF| |y2Approx| |y1|))
                                   (|abs_DF| (|sub_DF| |y2Temp| |y1|))
                                   (QREFELT $ 112))
                                  (PROGN
                                   (LETT #6# (CONS |pt2| (QREFELT $ 16))
                                         . #14#)
                                   (GO #16#)))
                                 (#15#
                                  (PROGN
                                   (LETT #6# (CONS |pt1| (QREFELT $ 16))
                                         . #14#)
                                   (GO #16#)))))))))
                           (EXIT
                            (COND
                             ((QEQCAR |critPt1| 1)
                              (PROGN
                               (LETT #6#
                                     (CONS
                                      (PROG2 (LETT #8# |critPt2| . #14#)
                                          (QCDR #8#)
                                        (|check_union2| (QEQCAR #8# 0)
                                                        (|Point|
                                                         (|DoubleFloat|))
                                                        (|Union|
                                                         (|Point|
                                                          (|DoubleFloat|))
                                                         #3#)
                                                        #8#))
                                      (QREFELT $ 18))
                                     . #14#)
                               (GO #16#)))
                             ((QEQCAR |critPt2| 1)
                              (PROGN
                               (LETT #6# (CONS (QCDR |critPt1|) (QREFELT $ 18))
                                     . #14#)
                               (GO #16#)))
                             (#15#
                              (COND
                               ((SPADCALL (|abs_DF| (|sub_DF| |y2Approx| |y1|))
                                          (|abs_DF| (|sub_DF| |y2Temp| |y1|))
                                          (QREFELT $ 112))
                                (PROGN
                                 (LETT #6#
                                       (CONS (QCDR |critPt1|) (QREFELT $ 18))
                                       . #14#)
                                 (GO #16#)))
                               (#15#
                                (PROGN
                                 (LETT #6#
                                       (CONS (QCDR |critPt2|) (QREFELT $ 18))
                                       . #14#)
                                 (GO #16#))))))))))))))))))))))
            (COND
             ((NULL (NULL |xPointList|))
              (COND
               ((NULL |yPointList|)
                (SEQ
                 (LETT |y2Approx|
                       (|add_DF| |y1|
                                 (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                           (|sub_DF| |x2Approx| |x1|)))
                       . #14#)
                 (EXIT
                  (COND
                   ((EQUAL |incVar0| |x|)
                    (SEQ (LETT |incVar| |x| . #14#)
                         (EXIT (LETT |lookingFor| (QREFELT $ 18) . #14#))))
                   (#15#
                    (SEQ
                     (LETT |f|
                           (|ACPLOT;SFPolyToUPoly|
                            (SPADCALL |pSF| |x| |x2Approx| (QREFELT $ 138)) $)
                           . #14#)
                     (LETT |y2New|
                           (|ACPLOT;newtonApprox| |f| |y2Approx| |err| |bound|
                            $)
                           . #14#)
                     (EXIT
                      (COND
                       ((QEQCAR |y2New| 1)
                        (SEQ (LETT |x2Approx| |x2Approxx| . #14#)
                             (EXIT (LETT |y2Approx| |y2Approxx| . #14#))))
                       (#15#
                        (SEQ
                         (LETT |pt|
                               (|ACPLOT;makePt| |x2Approx| (QCDR |y2New|) $)
                               . #14#)
                         (LETT |critPt| (|ACPLOT;findPtOnList| |pt| |crits| $)
                               . #14#)
                         (EXIT
                          (COND
                           ((QEQCAR |critPt| 1)
                            (PROGN
                             (LETT #6# (CONS |pt| (QREFELT $ 16)) . #14#)
                             (GO #16#)))
                           (#15#
                            (PROGN
                             (LETT #6# (CONS (QCDR |critPt|) (QREFELT $ 18))
                                   . #14#)
                             (GO #16#))))))))))))))))))
            (COND
             ((NULL |xPointList|)
              (COND
               ((NULL (NULL |yPointList|))
                (SEQ
                 (LETT |x2Approx|
                       (|add_DF| |x1|
                                 (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                           (|sub_DF| |y2Approx| |y1|)))
                       . #14#)
                 (EXIT
                  (COND
                   ((EQUAL |incVar0| |y|)
                    (SEQ (LETT |incVar| |y| . #14#)
                         (EXIT (LETT |lookingFor| (QREFELT $ 18) . #14#))))
                   (#15#
                    (SEQ
                     (LETT |f|
                           (|ACPLOT;SFPolyToUPoly|
                            (SPADCALL |pSF| |y| |y2Approx| (QREFELT $ 138)) $)
                           . #14#)
                     (LETT |x2New|
                           (|ACPLOT;newtonApprox| |f| |x2Approx| |err| |bound|
                            $)
                           . #14#)
                     (EXIT
                      (COND
                       ((QEQCAR |x2New| 1)
                        (SEQ (LETT |x2Approx| |x2Approxx| . #14#)
                             (EXIT (LETT |y2Approx| |y2Approxx| . #14#))))
                       (#15#
                        (SEQ
                         (LETT |pt|
                               (|ACPLOT;makePt| (QCDR |x2New|) |y2Approx| $)
                               . #14#)
                         (LETT |critPt| (|ACPLOT;findPtOnList| |pt| |crits| $)
                               . #14#)
                         (EXIT
                          (COND
                           ((QEQCAR |critPt| 1)
                            (PROGN
                             (LETT #6# (CONS |pt| (QREFELT $ 16)) . #14#)
                             (GO #16#)))
                           (#15#
                            (PROGN
                             (LETT #6# (CONS (QCDR |critPt|) (QREFELT $ 18))
                                   . #14#)
                             (GO #16#))))))))))))))))))
            (COND
             ((EQUAL |incVar| |x|)
              (SEQ (LETT |x2| |x2Approx| . #14#)
                   (LETT |f|
                         (|ACPLOT;SFPolyToUPoly|
                          (SPADCALL |pSF| |x| |x2| (QREFELT $ 138)) $)
                         . #14#)
                   (LETT |y2New|
                         (|ACPLOT;newtonApprox| |f| |y2Approx| |err| |bound| $)
                         . #14#)
                   (EXIT
                    (COND
                     ((QEQCAR |y2New| 1)
                      (PROGN
                       (LETT #6#
                             (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF|
                              |x| |y| |p0| |p1| |corners|
                              (|abs_DF| (|div_DF_I| (|sub_DF| |x2| |x1|) 2))
                              |err| |bound| |crits| |bdry| $)
                             . #14#)
                       (GO #16#)))
                     (#15# (LETT |y2| (QCDR |y2New|) . #14#))))))
             (#15#
              (SEQ (LETT |y2| |y2Approx| . #14#)
                   (LETT |f|
                         (|ACPLOT;SFPolyToUPoly|
                          (SPADCALL |pSF| |y| |y2| (QREFELT $ 138)) $)
                         . #14#)
                   (LETT |x2New|
                         (|ACPLOT;newtonApprox| |f| |x2Approx| |err| |bound| $)
                         . #14#)
                   (EXIT
                    (COND
                     ((QEQCAR |x2New| 1)
                      (PROGN
                       (LETT #6#
                             (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF|
                              |x| |y| |p0| |p1| |corners|
                              (|abs_DF| (|div_DF_I| (|sub_DF| |y2| |y1|) 2))
                              |err| |bound| |crits| |bdry| $)
                             . #14#)
                       (GO #16#)))
                     (#15# (LETT |x2| (QCDR |x2New|) . #14#)))))))
            (LETT |pt| (|ACPLOT;makePt| |x2| |y2| $) . #14#)
            (EXIT
             (COND
              ((EQUAL |lookingFor| (QREFELT $ 16)) (CONS |pt| |lookingFor|))
              ((EQUAL |lookingFor| (QREFELT $ 17))
               (SEQ
                (LETT |bdryPt| (|ACPLOT;findPtOnList| |pt| |bdry| $) . #14#)
                (EXIT
                 (COND
                  ((QEQCAR |bdryPt| 1)
                   (|error| "couldn't find boundary point"))
                  (#15# (CONS (QCDR |bdryPt|) (QREFELT $ 17)))))))
              (#15#
               (SEQ
                (LETT |critPt| (|ACPLOT;findPtOnList| |pt| |crits| $) . #14#)
                (EXIT
                 (COND ((QEQCAR |critPt| 1) (CONS |pt| (QREFELT $ 16)))
                       (#15# (CONS (QCDR |critPt|) (QREFELT $ 18)))))))))))
          #16# (EXIT #6#)))) 

(SDEFUN |ACPLOT;newtonApprox|
        ((|f| |SparseUnivariatePolynomial| (|DoubleFloat|))
         (|a0| . #1=(|DoubleFloat|)) (|err| |DoubleFloat|)
         (|bound| |PositiveInteger|) ($ |Union| (|DoubleFloat|) "failed"))
        (SPROG
         ((|i| (|PositiveInteger|)) (|newApprox| (|DoubleFloat|))
          (|oldApprox| #1#) (#2=#:G1166 NIL)
          (|Df| (|SparseUnivariatePolynomial| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |Df| (SPADCALL |f| (QREFELT $ 139))
                  . #3=(|ACPLOT;newtonApprox|))
            (LETT |oldApprox| |a0| . #3#)
            (LETT |newApprox|
                  (|sub_DF| |a0|
                            (|div_DF| (SPADCALL |f| |a0| (QREFELT $ 99))
                                      (SPADCALL |Df| |a0| (QREFELT $ 99))))
                  . #3#)
            (LETT |i| 1 . #3#)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL (|abs_DF| (|sub_DF| |newApprox| |oldApprox|))
                              |err| (QREFELT $ 112)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL |i| |bound|)
                     (PROGN
                      (LETT #2# (CONS 1 "failed") . #3#)
                      (GO #4=#:G1165)))
                    ('T
                     (SEQ (LETT |oldApprox| |newApprox| . #3#)
                          (LETT |newApprox|
                                (|sub_DF| |oldApprox|
                                          (|div_DF|
                                           (SPADCALL |f| |oldApprox|
                                                     (QREFELT $ 99))
                                           (SPADCALL |Df| |oldApprox|
                                                     (QREFELT $ 99))))
                                . #3#)
                          (EXIT (LETT |i| (+ |i| 1) . #3#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |newApprox|))))
          #4# (EXIT #2#)))) 

(PUT '|ACPLOT;listBranches;$L;41| '|SPADreplace|
     '(XLAM (|acplot|) (QVELT |acplot| 10))) 

(SDEFUN |ACPLOT;listBranches;$L;41|
        ((|acplot| $) ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (QVELT |acplot| 10)) 

(SDEFUN |ACPLOT;coerce;$Of;42| ((|acplot| $) ($ |OutputForm|))
        (SPROG
         ((|ff| (|OutputForm|)) (|f| (|List| (|OutputForm|)))
          (|ll| (|List| (|OutputForm|))) (#1=#:G1175 NIL) (|p| NIL)
          (#2=#:G1174 NIL) (#3=#:G1173 NIL) (|branch| NIL)
          (|l| (|List| #4=(|OutputForm|))) (|les| #5=(|OutputForm|))
          (|com| #5#) (|zip| #5#) (|yHi| #4#) (|yLo| (|OutputForm|))
          (|xHi| (|OutputForm|)) (|xLo| (|OutputForm|)) (|yy| (|OutputForm|))
          (|xx| (|OutputForm|)) (|pp| (|OutputForm|)))
         (SEQ
          (LETT |pp| (SPADCALL (QVELT |acplot| 0) (QREFELT $ 142))
                . #6=(|ACPLOT;coerce;$Of;42|))
          (LETT |xx| (SPADCALL (QVELT |acplot| 1) (QREFELT $ 143)) . #6#)
          (LETT |yy| (SPADCALL (QVELT |acplot| 2) (QREFELT $ 143)) . #6#)
          (LETT |xLo| (SPADCALL (QVELT |acplot| 3) (QREFELT $ 144)) . #6#)
          (LETT |xHi| (SPADCALL (QVELT |acplot| 4) (QREFELT $ 144)) . #6#)
          (LETT |yLo| (SPADCALL (QVELT |acplot| 5) (QREFELT $ 144)) . #6#)
          (LETT |yHi| (SPADCALL (QVELT |acplot| 6) (QREFELT $ 144)) . #6#)
          (LETT |zip| (SPADCALL " = 0" (QREFELT $ 146)) . #6#)
          (LETT |com| (SPADCALL ",   " (QREFELT $ 146)) . #6#)
          (LETT |les| (SPADCALL " <= " (QREFELT $ 146)) . #6#)
          (LETT |l|
                (LIST |pp| |zip| |com| |xLo| |les| |xx| |les| |xHi| |com| |yLo|
                      |les| |yy| |les| |yHi|)
                . #6#)
          (LETT |f| NIL . #6#)
          (SEQ (LETT |branch| NIL . #6#) (LETT #3# (QVELT |acplot| 10) . #6#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |branch| (CAR #3#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |ll|
                      (PROGN
                       (LETT #2# NIL . #6#)
                       (SEQ (LETT |p| NIL . #6#) (LETT #1# |branch| . #6#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |p| (CAR #1#) . #6#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |p| (QREFELT $ 147)) #2#)
                                    . #6#)))
                            (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #6#)
                (EXIT
                 (LETT |f| (CONS (SPADCALL |ll| (QREFELT $ 149)) |f|) . #6#)))
               (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |ff|
                (SPADCALL (SPADCALL |l| (QREFELT $ 150))
                          (SPADCALL |f| (QREFELT $ 149)) (QREFELT $ 151))
                . #6#)
          (EXIT
           (SPADCALL (SPADCALL "ACPLOT" (QREFELT $ 146)) |ff|
                     (QREFELT $ 151)))))) 

(DECLAIM (NOTINLINE |PlaneAlgebraicCurvePlot;|)) 

(DEFUN |PlaneAlgebraicCurvePlot| ()
  (SPROG NIL
         (PROG (#1=#:G1177)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|PlaneAlgebraicCurvePlot|)
                    . #2=(|PlaneAlgebraicCurvePlot|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|PlaneAlgebraicCurvePlot|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|PlaneAlgebraicCurvePlot;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|PlaneAlgebraicCurvePlot|)))))))))) 

(DEFUN |PlaneAlgebraicCurvePlot;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PlaneAlgebraicCurvePlot|)
                . #1=(|PlaneAlgebraicCurvePlot|))
          (LETT $ (GETREFV 153) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PlaneAlgebraicCurvePlot| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |poly| (|Polynomial| (|Integer|)))
                              (|:| |xVar| (|Symbol|)) (|:| |yVar| (|Symbol|))
                              (|:| |minXVal| (|Fraction| (|Integer|)))
                              (|:| |maxXVal| (|Fraction| (|Integer|)))
                              (|:| |minYVal| (|Fraction| (|Integer|)))
                              (|:| |maxYVal| (|Fraction| (|Integer|)))
                              (|:| |bdryPts|
                                   (|Record|
                                    (|:| |left|
                                         (|List| (|Point| (|DoubleFloat|))))
                                    (|:| |right|
                                         (|List| (|Point| (|DoubleFloat|))))
                                    (|:| |bottom|
                                         (|List| (|Point| (|DoubleFloat|))))
                                    (|:| |top|
                                         (|List| (|Point| (|DoubleFloat|))))))
                              (|:| |hTanPts|
                                   (|List| (|Point| (|DoubleFloat|))))
                              (|:| |vTanPts|
                                   (|List| (|Point| (|DoubleFloat|))))
                              (|:| |branches|
                                   (|List|
                                    (|List| (|Point| (|DoubleFloat|)))))))
          (QSETREFV $ 12 (SPADCALL 1 -6 10 (QREFELT $ 11)))
          (QSETREFV $ 15 (SPADCALL 1 -3 10 (QREFELT $ 14)))
          (QSETREFV $ 16 "nothing in particular")
          (QSETREFV $ 17 "boundary point")
          (QSETREFV $ 18 "critical point")
          (QSETREFV $ 19 "bottom")
          (QSETREFV $ 20 "top")
          $))) 

(MAKEPROP '|PlaneAlgebraicCurvePlot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Float|) (0 . |One|) (|Integer|)
              (|PositiveInteger|) (4 . |float|) 'EPSILON (|DoubleFloat|)
              (11 . |float|) 'PLOTERR 'NADA 'BDRY 'CRIT 'BOTTOM 'TOP
              (18 . |Zero|) (22 . |convert|) (|List| 13) (|Point| 13)
              (27 . |point|) (|PointPackage| 13) (32 . |yCoord|)
              (37 . |xCoord|) (|Boolean|) (|Polynomial| 13) (42 . |zero?|)
              (|SparseUnivariatePolynomial| 13) (47 . |Zero|)
              (51 . |leadingCoefficient|) (|NonNegativeInteger|)
              (56 . |totalDegree|) (61 . |monomial|) (67 . |reductum|) (72 . +)
              (|Polynomial| 44) (78 . |zero?|)
              (|SparseUnivariatePolynomial| 44) (83 . |Zero|) (|Fraction| 9)
              (87 . |leadingCoefficient|) (92 . |totalDegree|)
              (97 . |monomial|) (103 . |reductum|) (108 . +) (114 . |coerce|)
              (|Mapping| 13 9) (|Polynomial| 9) (|PolynomialFunctions2| 9 13)
              (119 . |map|) (125 . |coerce|) (|Mapping| 44 9)
              (|PolynomialFunctions2| 9 44) (130 . |map|) (136 . |coerce|)
              (141 . |coerce|) (146 . |convert|) (|Symbol|) (151 . |eval|)
              (|List| 7) (|RealSolvePackage|) (158 . |solve|) (164 . <)
              (170 . <=) (176 . |second|) (181 . =) (187 . +) (193 . |max|)
              (199 . |min|) (205 . /) (211 . +) (|Segment| 44) (217 . |low|)
              (222 . |high|) (227 . <=) (|List| 62) (233 . |variables|)
              (238 . >) (244 . |member?|) (250 . |totalDegree|)
              (255 . |degree|) |ACPLOT;makeSketch;P2S2S$;27| (261 . |solve|)
              (267 . |coefficient|) (274 . |ground|) (279 . <=) (|Segment| 13)
              (285 . |segment|) (291 . >=) (|Factored| 52) (297 . |coerce|)
              (302 . |numberOfFactors|) (307 . |differentiate|) (313 . -)
              (318 . |elt|) (324 . /) (|List| 64) (|List| 52)
              (330 . |realSolve|) (337 . <) (|Mapping| 29 13 13) (343 . |sort|)
              (349 . |elt|) (355 . |Zero|) (359 . =) (365 . |last|)
              (370 . |remove|) (376 . >) (|Mapping| 13 13) (|Plot|)
              (382 . |plot|) (|List| 119) (388 . |listBranches|)
              (|Mapping| 24 24) (|List| 24) (393 . |map|) (399 . |nthFactor|)
              (405 . |append|) (411 . /) (417 . -) (423 . *) (429 . -)
              (434 . |append|) |ACPLOT;refine;$Df$;34| (440 . |second|)
              (445 . |third|) (450 . |eval|) (457 . |ground|) (462 . |member?|)
              (468 . |remove|) (474 . |second|) (479 . =) (485 . =)
              (491 . |eval|) (498 . |differentiate|)
              |ACPLOT;listBranches;$L;41| (|OutputForm|) (503 . |coerce|)
              (508 . |coerce|) (513 . |coerce|) (|String|) (518 . |message|)
              (523 . |coerce|) (|List| $) (528 . |vconcat|) (533 . |hconcat|)
              (538 . |vconcat|) |ACPLOT;coerce;$Of;42|)
           '#(|yRange| 544 |xRange| 549 |refine| 554 |makeSketch| 560
              |listBranches| 569 |coerce| 574)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS
                        '#((|PlottablePlaneCurveCategory|) (|CoercibleTo| 141))
                        (|makeByteWordVec2| 152
                                            '(0 7 0 8 3 7 0 9 9 10 11 3 13 0 9
                                              9 10 14 0 7 0 21 1 7 13 0 22 1 24
                                              0 23 25 1 26 13 24 27 1 26 13 24
                                              28 1 30 29 0 31 0 32 0 33 1 30 13
                                              0 34 1 30 35 0 36 2 32 0 13 35 37
                                              1 30 0 0 38 2 32 0 0 0 39 1 40 29
                                              0 41 0 42 0 43 1 40 44 0 45 1 40
                                              35 0 46 2 42 0 44 35 47 1 40 0 0
                                              48 2 42 0 0 0 49 1 13 0 9 50 2 53
                                              30 51 52 54 1 44 0 9 55 2 57 40
                                              56 52 58 1 13 0 44 59 1 7 0 44 60
                                              1 7 0 13 61 3 40 0 0 62 44 63 2
                                              65 64 40 7 66 2 7 29 0 0 67 2 7
                                              29 0 0 68 1 64 7 0 69 2 7 29 0 0
                                              70 2 7 0 0 0 71 2 7 0 0 0 72 2 7
                                              0 0 0 73 2 44 0 0 0 74 2 44 0 0 0
                                              75 1 76 44 0 77 1 76 44 0 78 2 44
                                              29 0 0 79 1 52 80 0 81 2 35 29 0
                                              0 82 2 80 29 62 0 83 1 52 35 0 84
                                              2 52 35 0 62 85 2 65 64 52 7 87 3
                                              52 0 0 62 35 88 1 52 9 0 89 2 13
                                              29 0 0 90 2 91 0 13 13 92 2 13 29
                                              0 0 93 1 94 0 52 95 1 94 35 0 96
                                              2 52 0 0 62 97 1 52 0 0 98 2 32
                                              13 0 13 99 2 13 0 0 0 100 3 65
                                              101 102 80 7 103 2 62 29 0 0 104
                                              2 23 0 105 0 106 2 42 44 0 44 107
                                              0 44 0 108 2 44 29 0 0 109 1 23
                                              13 0 110 2 23 0 13 0 111 2 13 29
                                              0 0 112 2 114 0 113 91 115 1 114
                                              116 0 117 2 119 0 118 0 120 2 94
                                              52 0 9 121 2 101 0 0 0 122 2 44 0
                                              9 9 123 2 44 0 0 0 124 2 44 0 0
                                              44 125 1 44 0 0 126 2 119 0 0 0
                                              127 1 116 119 0 129 1 116 119 0
                                              130 3 30 0 0 80 23 131 1 30 13 0
                                              132 2 119 29 24 0 133 2 119 0 24
                                              0 134 1 119 24 0 135 2 24 29 0 0
                                              136 2 119 29 0 0 137 3 30 0 0 62
                                              13 138 1 32 0 0 139 1 52 141 0
                                              142 1 62 141 0 143 1 44 141 0 144
                                              1 141 0 145 146 1 24 141 0 147 1
                                              141 0 148 149 1 141 0 148 150 2
                                              141 0 0 0 151 1 0 91 0 1 1 0 91 0
                                              1 2 0 0 0 13 128 5 0 0 52 62 62
                                              76 76 86 1 0 116 0 140 1 0 141 0
                                              152)))))
           '|lookupComplete|)) 

(MAKEPROP '|PlaneAlgebraicCurvePlot| 'NILADIC T) 
