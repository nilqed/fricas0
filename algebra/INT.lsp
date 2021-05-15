
(SDEFUN |INT;writeOMInt| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ
         (COND
          ((< |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT $ 8))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT $ 10))
                (SPADCALL |dev| (- |x|) (QREFELT $ 12))
                (EXIT (SPADCALL |dev| (QREFELT $ 13)))))
          ('T (SPADCALL |dev| |x| (QREFELT $ 12)))))) 

(SDEFUN |INT;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))
             (|INT;writeOMInt| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 15))))))) 

(PUT '|INT;zero?;$B;3| '|SPADreplace| 'ZEROP) 

(SDEFUN |INT;zero?;$B;3| ((|x| $) ($ |Boolean|)) (ZEROP |x|)) 

(PUT '|INT;one?;$B;4| '|SPADreplace| '(XLAM (|x|) (EQL |x| 1))) 

(SDEFUN |INT;one?;$B;4| ((|x| $) ($ |Boolean|)) (EQL |x| 1)) 

(PUT '|INT;Zero;$;5| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INT;Zero;$;5| (($ $)) 0) 

(PUT '|INT;One;$;6| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |INT;One;$;6| (($ $)) 1) 

(PUT '|INT;base;$;7| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |INT;base;$;7| (($ $)) 2) 

(PUT '|INT;copy;2$;8| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;copy;2$;8| ((|x| $) ($ $)) |x|) 

(PUT '|INT;inc;2$;9| '|SPADreplace| '(XLAM (|x|) (+ |x| 1))) 

(SDEFUN |INT;inc;2$;9| ((|x| $) ($ $)) (+ |x| 1)) 

(PUT '|INT;dec;2$;10| '|SPADreplace| '(XLAM (|x|) (- |x| 1))) 

(SDEFUN |INT;dec;2$;10| ((|x| $) ($ $)) (- |x| 1)) 

(SDEFUN |INT;hashUpdate!;Hs$Hs;11|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|INT;negative?;$B;12| '|SPADreplace| 'MINUSP) 

(SDEFUN |INT;negative?;$B;12| ((|x| $) ($ |Boolean|)) (MINUSP |x|)) 

(PUT '|INT;positive?;$B;13| '|SPADreplace| 'PLUSP) 

(SDEFUN |INT;positive?;$B;13| ((|x| $) ($ |Boolean|)) (PLUSP |x|)) 

(SDEFUN |INT;coerce;$Of;14| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 31))) 

(PUT '|INT;coerce;2$;15| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;coerce;2$;15| ((|m| |Integer|) ($ $)) |m|) 

(PUT '|INT;convert;2$;16| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;convert;2$;16| ((|x| $) ($ |Integer|)) |x|) 

(PUT '|INT;length;2$;17| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |INT;length;2$;17| ((|a| $) ($ $)) (INTEGER-LENGTH |a|)) 

(SDEFUN |INT;addmod;4$;18| ((|a| $) (|b| $) (|p| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (+ |a| |b|))
                    (EXIT (COND ((>= |c| |p|) (- |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;submod;4$;19| ((|a| $) (|b| $) (|p| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (- |a| |b|))
                    (EXIT (COND ((< |c| 0) (+ |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;mulmod;4$;20| ((|a| $) (|b| $) (|p| $) ($ $))
        (REM (* |a| |b|) |p|)) 

(SDEFUN |INT;convert;$F;21| ((|x| $) ($ |Float|)) (SPADCALL |x| (QREFELT $ 40))) 

(PUT '|INT;convert;$Df;22| '|SPADreplace|
     '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |INT;convert;$Df;22| ((|x| $) ($ |DoubleFloat|))
        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |INT;convert;$If;23| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 45))) 

(PUT '|INT;convert;$S;24| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |INT;convert;$S;24| ((|x| $) ($ |String|)) (STRINGIMAGE |x|)) 

(SDEFUN |INT;latex;$S;25| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| (STRINGIMAGE |x|))
                    (COND ((<= 0 |x|) (COND ((< |x| 10) (EXIT |s|)))))
                    (EXIT (STRCONC "{" (STRCONC |s| "}")))))) 

(SDEFUN |INT;positiveRemainder;3$;26| ((|a| $) (|b| $) ($ $))
        (SPROG ((|r| ($)))
               (COND
                ((MINUSP (LETT |r| (REM |a| |b|)))
                 (COND ((MINUSP |b|) (- |r| |b|)) (#1='T (+ |r| |b|))))
                (#1# |r|)))) 

(PUT '|INT;reducedSystem;2M;27| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;reducedSystem;2M;27| ((|m| |Matrix| $) ($ |Matrix| (|Integer|)))
        |m|) 

(PUT '|INT;reducedSystem;MVR;28| '|SPADreplace| 'CONS) 

(SDEFUN |INT;reducedSystem;MVR;28|
        ((|m| |Matrix| $) (|vec| |Vector| $)
         ($ |Record| (|:| |mat| (|Matrix| (|Integer|)))
          (|:| |vec| (|Vector| (|Integer|)))))
        (CONS |m| |vec|)) 

(PUT '|INT;abs;2$;29| '|SPADreplace| 'ABS) 

(SDEFUN |INT;abs;2$;29| ((|x| $) ($ $)) (ABS |x|)) 

(PUT '|INT;random;2$;30| '|SPADreplace| 'RANDOM) 

(SDEFUN |INT;random;2$;30| ((|x| $) ($ $)) (RANDOM |x|)) 

(PUT '|INT;=;2$B;31| '|SPADreplace| 'EQL) 

(SDEFUN |INT;=;2$B;31| ((|x| $) (|y| $) ($ |Boolean|)) (EQL |x| |y|)) 

(PUT '|INT;<;2$B;32| '|SPADreplace| '<) 

(SDEFUN |INT;<;2$B;32| ((|x| $) (|y| $) ($ |Boolean|)) (< |x| |y|)) 

(PUT '|INT;>;2$B;33| '|SPADreplace| '>) 

(SDEFUN |INT;>;2$B;33| ((|x| $) (|y| $) ($ |Boolean|)) (> |x| |y|)) 

(PUT '|INT;>=;2$B;34| '|SPADreplace| '>=) 

(SDEFUN |INT;>=;2$B;34| ((|x| $) (|y| $) ($ |Boolean|)) (>= |x| |y|)) 

(PUT '|INT;<=;2$B;35| '|SPADreplace| '<=) 

(SDEFUN |INT;<=;2$B;35| ((|x| $) (|y| $) ($ |Boolean|)) (<= |x| |y|)) 

(PUT '|INT;-;2$;36| '|SPADreplace| '-) 

(SDEFUN |INT;-;2$;36| ((|x| $) ($ $)) (- |x|)) 

(PUT '|INT;+;3$;37| '|SPADreplace| '+) 

(SDEFUN |INT;+;3$;37| ((|x| $) (|y| $) ($ $)) (+ |x| |y|)) 

(PUT '|INT;-;3$;38| '|SPADreplace| '-) 

(SDEFUN |INT;-;3$;38| ((|x| $) (|y| $) ($ $)) (- |x| |y|)) 

(PUT '|INT;*;3$;39| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;39| ((|x| $) (|y| $) ($ $)) (* |x| |y|)) 

(PUT '|INT;*;3$;40| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;40| ((|m| |Integer|) (|y| $) ($ $)) (* |m| |y|)) 

(PUT '|INT;*;Pi2$;41| '|SPADreplace| '*) 

(SDEFUN |INT;*;Pi2$;41| ((|m| |PositiveInteger|) (|y| $) ($ $)) (* |m| |y|)) 

(PUT '|INT;*;Nni2$;42| '|SPADreplace| '*) 

(SDEFUN |INT;*;Nni2$;42| ((|m| |NonNegativeInteger|) (|y| $) ($ $)) (* |m| |y|)) 

(PUT '|INT;^;$Nni$;43| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;$Nni$;43| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (EXPT |x| |n|)) 

(PUT '|INT;^;$Pi$;44| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;$Pi$;44| ((|x| $) (|n| |PositiveInteger|) ($ $)) (EXPT |x| |n|)) 

(PUT '|INT;odd?;$B;45| '|SPADreplace| 'ODDP) 

(SDEFUN |INT;odd?;$B;45| ((|x| $) ($ |Boolean|)) (ODDP |x|)) 

(PUT '|INT;even?;$B;46| '|SPADreplace| 'EVENP) 

(SDEFUN |INT;even?;$B;46| ((|x| $) ($ |Boolean|)) (EVENP |x|)) 

(PUT '|INT;max;3$;47| '|SPADreplace| 'MAX) 

(SDEFUN |INT;max;3$;47| ((|x| $) (|y| $) ($ $)) (MAX |x| |y|)) 

(PUT '|INT;min;3$;48| '|SPADreplace| 'MIN) 

(SDEFUN |INT;min;3$;48| ((|x| $) (|y| $) ($ $)) (MIN |x| |y|)) 

(PUT '|INT;divide;2$R;49| '|SPADreplace| 'DIVIDE2) 

(SDEFUN |INT;divide;2$R;49|
        ((|x| $) (|y| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (DIVIDE2 |x| |y|)) 

(PUT '|INT;quo;3$;50| '|SPADreplace| 'QUOTIENT2) 

(SDEFUN |INT;quo;3$;50| ((|x| $) (|y| $) ($ $)) (QUOTIENT2 |x| |y|)) 

(PUT '|INT;rem;3$;51| '|SPADreplace| 'REM) 

(SDEFUN |INT;rem;3$;51| ((|x| $) (|y| $) ($ $)) (REM |x| |y|)) 

(PUT '|INT;shift;3$;52| '|SPADreplace| 'ASH) 

(SDEFUN |INT;shift;3$;52| ((|x| $) (|y| $) ($ $)) (ASH |x| |y|)) 

(SDEFUN |INT;exquo;2$U;53| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG ((|z| (|SExpression|)))
               (SEQ
                (COND ((ZEROP |y|) (CONS 1 "failed"))
                      (#1='T
                       (SEQ (LETT |z| (INTEXQUO |x| |y|))
                            (EXIT
                             (COND ((SPADCALL |z| (QREFELT $ 84)) (CONS 0 |z|))
                                   (#1# (CONS 1 "failed")))))))))) 

(SDEFUN |INT;recip;$U;54| ((|x| $) ($ |Union| $ "failed"))
        (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(PUT '|INT;gcd;3$;55| '|SPADreplace| 'GCD) 

(SDEFUN |INT;gcd;3$;55| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(SDEFUN |INT;unitNormal;$R;56|
        ((|x| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(PUT '|INT;unitCanonical;2$;57| '|SPADreplace| 'ABS) 

(SDEFUN |INT;unitCanonical;2$;57| ((|x| $) ($ $)) (ABS |x|)) 

(SDEFUN |INT;solveLinearPolynomialEquation;LSupU;58|
        ((|lp| |List| #1=(|SparseUnivariatePolynomial| $)) (|p| . #1#)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| $)) "failed"))
        (SPADCALL |lp| |p| (QREFELT $ 96))) 

(SDEFUN |INT;squareFreePolynomial;SupF;59|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 104))) 

(SDEFUN |INT;factorPolynomial;SupF;60|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG ((#1=#:G1592 NIL) (|pp| (|SparseUnivariatePolynomial| $)))
               (SEQ (LETT |pp| (SPADCALL |p| (QREFELT $ 107)))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |pp| (QREFELT $ 108))
                            (SPADCALL |p| (QREFELT $ 108)))
                       (SPADCALL |p| (QREFELT $ 110)))
                      ('T
                       (SPADCALL (SPADCALL |pp| (QREFELT $ 110))
                                 (SPADCALL (ELT $ 111)
                                           (SPADCALL
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL
                                                       (SPADCALL |p|
                                                                 (QREFELT $
                                                                          108))
                                                       (SPADCALL |pp|
                                                                 (QREFELT $
                                                                          108))
                                                       (QREFELT $ 86)))
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0) $
                                                              (|Union| $
                                                                       "failed")
                                                              #1#))
                                            (QREFELT $ 113))
                                           (QREFELT $ 117))
                                 (QREFELT $ 118)))))))) 

(SDEFUN |INT;factorSquareFreePolynomial;SupF;61|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 120))) 

(SDEFUN |INT;gcdPolynomial;3Sup;62|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 122)) (SPADCALL |q| (QREFELT $ 123)))
              ((SPADCALL |q| (QREFELT $ 122)) (SPADCALL |p| (QREFELT $ 123)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT $ 126))))) 

(SDEFUN |INT;opposite?;2$B;63| ((|x| $) (|y| $) ($ |Boolean|))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2$B;64| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(SDEFUN |INT;powmod;4$;65| ((|x| $) (|n| $) (|p| $) ($ $))
        (SPROG ((|z| ($)) (#1=#:G1611 NIL) (|y| ($)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((MINUSP |x|) (LETT |x| (SPADCALL |x| |p| (QREFELT $ 49)))))
                  (EXIT
                   (COND ((ZEROP |x|) 0) ((ZEROP |n|) 1)
                         ('T
                          (SEQ (LETT |y| 1) (LETT |z| |x|)
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (COND
                                       ((ODDP |n|)
                                        (LETT |y|
                                              (SPADCALL |y| |z| |p|
                                                        (QREFELT $ 38)))))
                                      (EXIT
                                       (COND
                                        ((ZEROP (LETT |n| (ASH |n| -1)))
                                         (PROGN
                                          (LETT #1# |y|)
                                          (GO #2=#:G1610)))
                                        ('T
                                         (LETT |z|
                                               (SPADCALL |z| |z| |p|
                                                         (QREFELT $ 38)))))))
                                     NIL (GO G190) G191 (EXIT NIL)))))))))
                #2# (EXIT #1#)))) 

(SDEFUN |INT;symmetricRemainder;3$;66| ((|x| $) (|n| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ (LETT |r| (REM |x| |n|))
                    (EXIT
                     (COND ((EQL |r| 0) 0)
                           (#1='T
                            (SEQ (COND ((< |n| 0) (LETT |n| (- |n|))))
                                 (EXIT
                                  (COND
                                   ((> |r| 0)
                                    (COND ((> (* 2 |r|) |n|) (- |r| |n|))
                                          (#1# |r|)))
                                   ((<= (+ (* 2 |r|) |n|) 0) (+ |r| |n|))
                                   (#1# |r|)))))))))) 

(DECLAIM (NOTINLINE |Integer;|)) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G1637)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Integer|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Integer|
                             (LIST (CONS NIL (CONS 1 (|Integer;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Integer|)))))))))) 

(DEFUN |Integer;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Integer|))
          (LETT $ (GETREFV 146))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|CharacteristicNonZero|))
               (|augmentPredVector| $ 1))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 66
                    (QSETREFV $ 67
                              (CONS (|dispatchFunction| |INT;*;3$;40|) $)))
          $))) 

(MAKEPROP '|Integer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) |INT;OMwrite;Omd$BV;2|
              |INT;zero?;$B;3| |INT;one?;$B;4|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;Zero;$;5|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;One;$;6|) $))
              |INT;base;$;7| |INT;copy;2$;8| |INT;inc;2$;9| |INT;dec;2$;10|
              (|HashState|) |INT;hashUpdate!;Hs$Hs;11| |INT;negative?;$B;12|
              |INT;positive?;$B;13| (|OutputForm|) (33 . |outputForm|)
              |INT;coerce;$Of;14| |INT;coerce;2$;15| |INT;convert;2$;16|
              |INT;length;2$;17| |INT;addmod;4$;18| |INT;submod;4$;19|
              |INT;mulmod;4$;20| (|Float|) (38 . |coerce|) |INT;convert;$F;21|
              (|DoubleFloat|) |INT;convert;$Df;22| (|InputForm|)
              (43 . |convert|) |INT;convert;$If;23| |INT;convert;$S;24|
              |INT;latex;$S;25| |INT;positiveRemainder;3$;26| (|Matrix| 11)
              (|Matrix| $) |INT;reducedSystem;2M;27|
              (|Record| (|:| |mat| 50) (|:| |vec| (|Vector| 11))) (|Vector| $)
              |INT;reducedSystem;MVR;28| |INT;abs;2$;29| |INT;random;2$;30|
              |INT;=;2$B;31| |INT;<;2$B;32| |INT;>;2$B;33| |INT;>=;2$B;34|
              |INT;<=;2$B;35| |INT;-;2$;36| |INT;+;3$;37| |INT;-;3$;38| NIL NIL
              (|PositiveInteger|) |INT;*;Pi2$;41| (|NonNegativeInteger|)
              |INT;*;Nni2$;42| |INT;^;$Nni$;43| |INT;^;$Pi$;44|
              |INT;odd?;$B;45| |INT;even?;$B;46| |INT;max;3$;47|
              |INT;min;3$;48| (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |INT;divide;2$R;49| |INT;quo;3$;50| |INT;rem;3$;51|
              |INT;shift;3$;52| (|SExpression|) (48 . |integer?|)
              (|Union| $ '"failed") |INT;exquo;2$U;53| |INT;recip;$U;54|
              |INT;gcd;3$;55|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |INT;unitNormal;$R;56| |INT;unitCanonical;2$;57|
              (|Union| 93 '"failed") (|List| 94)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (53 . |solveLinearPolynomialEquation|) (|Union| 98 '"failed")
              (|List| 99) (|SparseUnivariatePolynomial| $)
              |INT;solveLinearPolynomialEquation;LSupU;58| (|Factored| 102)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 102) (59 . |squareFree|)
              (|Factored| 99) |INT;squareFreePolynomial;SupF;59|
              (64 . |primitivePart|) (69 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 102) (74 . |factor|) (79 . |coerce|)
              (|Factored| $) (84 . |factor|) (|Mapping| 102 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 102) (89 . |map|) (95 . |mergeFactors|)
              |INT;factorPolynomial;SupF;60| (101 . |factorSquareFree|)
              |INT;factorSquareFreePolynomial;SupF;61| (106 . |zero?|)
              (111 . |unitCanonical|) (|List| 102) (|HeuGcd| 102) (116 . |gcd|)
              |INT;gcdPolynomial;3Sup;62| |INT;opposite?;2$B;63|
              |INT;annihilate?;2$B;64| |INT;powmod;4$;65|
              |INT;symmetricRemainder;3$;66| (|Union| 54 '"failed")
              (|Fraction| 11) (|Union| 133 '"failed")
              (|PatternMatchResult| 11 $) (|Pattern| 11) (|Union| 11 '"failed")
              (|Union| 139 '"failed") (|List| $)
              (|Record| (|:| |coef| 139) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 142 '"failed")
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SingleInteger|))
           '#(~= 121 |zero?| 127 |unitNormal| 132 |unitCanonical| 137 |unit?|
              142 |symmetricRemainder| 147 |subtractIfCan| 153 |submod| 159
              |squareFreePolynomial| 166 |squareFreePart| 171 |squareFree| 176
              |solveLinearPolynomialEquation| 181 |smaller?| 187 |sizeLess?|
              193 |sign| 199 |shift| 204 |sample| 210 |rightRecip| 214
              |rightPower| 219 |retractIfCan| 231 |retract| 236 |rem| 241
              |reducedSystem| 247 |recip| 258 |rationalIfCan| 263 |rational?|
              268 |rational| 273 |random| 278 |quo| 283 |principalIdeal| 289
              |prime?| 294 |powmod| 299 |positiveRemainder| 306 |positive?| 312
              |permutation| 317 |patternMatch| 323 |opposite?| 330 |one?| 336
              |odd?| 341 |nextItem| 346 |negative?| 351 |multiEuclidean| 356
              |mulmod| 362 |min| 369 |max| 375 |mask| 381 |length| 386
              |leftRecip| 391 |leftPower| 396 |lcmCoef| 408 |lcm| 414 |latex|
              425 |invmod| 430 |init| 436 |inc| 440 |hashUpdate!| 445 |hash|
              451 |gcdPolynomial| 456 |gcd| 462 |factorial| 473
              |factorSquareFreePolynomial| 478 |factorPolynomial| 483 |factor|
              488 |extendedEuclidean| 493 |exquo| 506 |expressIdealMember| 512
              |even?| 518 |euclideanSize| 523 |divide| 528 |differentiate| 534
              |dec| 545 |copy| 550 |convert| 555 |conditionP| 585 |commutator|
              590 |coerce| 596 |charthRoot| 611 |characteristic| 616 |bit?| 620
              |binomial| 626 |base| 632 |associator| 636 |associates?| 643
              |antiCommutator| 649 |annihilate?| 655 |addmod| 661 |abs| 668 ^
              673 |Zero| 685 |One| 689 |OMwrite| 693 D 717 >= 728 > 734 = 740
              <= 746 < 752 - 758 + 769 * 775)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |PolynomialFactorizationExplicit&|
                |EuclideanDomain&| |UniqueFactorizationDomain&| NIL NIL
                |GcdDomain&| NIL |OrderedRing&| NIL NIL NIL |DifferentialRing&|
                NIL |EntireRing&| |Algebra&| NIL |Rng&| NIL |Module&| NIL NIL
                NIL |NonAssociativeRing&| NIL NIL |NonAssociativeRng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL NIL |Magma&| |AbelianSemiGroup&| NIL NIL |SetCategory&| NIL
                NIL |OpenMath&| NIL NIL NIL NIL NIL NIL NIL NIL
                |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|OrderedIntegralDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|OrderedRing|)
                 (|CommutativeRing|) (|LeftOreRing|)
                 (|LinearlyExplicitOver| 11) (|DifferentialRing|)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| $$) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| $$) (|SemiRng|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|StepThrough|)
                 (|PatternMatchable| 11) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|RealConstant|) (|CommutativeStar|)
                 (|SetCategory|) (|canonicalsClosed|) (|Canonical|)
                 (|OpenMath|) (|ConvertibleTo| 9) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 39)
                 (|ConvertibleTo| 42) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 136) (|ConvertibleTo| 44)
                 (|RetractableTo| 11) (|ConvertibleTo| 11) (|PartialOrder|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 30))
              (|makeByteWordVec2| 145
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 30 0 11 31 1
                                    39 0 11 40 1 44 0 11 45 1 83 16 0 84 2 95
                                    92 93 94 96 1 103 101 102 104 1 102 0 0 107
                                    1 102 2 0 108 1 109 101 102 110 1 102 0 2
                                    111 1 0 112 0 113 2 116 101 114 115 117 2
                                    101 0 0 0 118 1 109 101 102 120 1 102 16 0
                                    122 1 102 0 0 123 1 125 102 124 126 2 0 16
                                    0 0 1 1 0 16 0 18 1 0 89 0 90 1 0 0 0 91 1
                                    0 16 0 1 2 0 0 0 0 131 2 0 85 0 0 1 3 0 0 0
                                    0 0 37 1 0 105 99 106 1 0 0 0 1 1 0 112 0 1
                                    2 0 97 98 99 100 2 0 16 0 0 1 2 0 16 0 0 1
                                    1 0 11 0 1 2 0 0 0 0 82 0 0 0 1 1 0 85 0 1
                                    2 0 0 0 70 1 2 0 0 0 68 1 1 0 137 0 1 1 0
                                    11 0 1 2 0 0 0 0 81 2 0 53 51 54 55 1 0 50
                                    51 52 1 0 85 0 87 1 0 134 0 1 1 0 16 0 1 1
                                    0 133 0 1 1 0 0 0 57 2 0 0 0 0 80 1 0 140
                                    139 1 1 0 16 0 1 3 0 0 0 0 0 130 2 0 0 0 0
                                    49 1 0 16 0 29 2 0 0 0 0 1 3 0 135 0 136
                                    135 1 2 0 16 0 0 128 1 0 16 0 19 1 0 16 0
                                    74 1 0 85 0 1 1 0 16 0 28 2 0 138 139 0 1 3
                                    0 0 0 0 0 38 2 0 0 0 0 77 2 0 0 0 0 76 1 0
                                    0 0 1 1 0 0 0 35 1 0 85 0 1 2 0 0 0 70 1 2
                                    0 0 0 68 1 2 0 144 0 0 1 1 0 0 139 1 2 0 0
                                    0 0 1 1 0 9 0 48 2 0 0 0 0 1 0 0 0 1 1 0 0
                                    0 24 2 0 26 26 0 27 1 0 145 0 1 2 0 99 99
                                    99 127 1 0 0 139 1 2 0 0 0 0 88 1 0 0 0 1 1
                                    0 105 99 121 1 0 105 99 119 1 0 112 0 113 2
                                    0 141 0 0 1 3 0 143 0 0 0 1 2 0 85 0 0 86 2
                                    0 138 139 0 1 1 0 16 0 75 1 0 70 0 1 2 0 78
                                    0 0 79 1 0 0 0 1 2 0 0 0 70 1 1 0 0 0 25 1
                                    0 0 0 23 1 0 9 0 47 1 0 39 0 41 1 0 42 0 43
                                    1 0 44 0 46 1 0 136 0 1 1 0 11 0 34 1 1 132
                                    51 1 2 0 0 0 0 1 1 0 0 11 33 1 0 0 0 1 1 0
                                    30 0 32 1 1 85 0 1 0 0 70 1 2 0 16 0 0 1 2
                                    0 0 0 0 1 0 0 0 22 3 0 0 0 0 0 1 2 0 16 0 0
                                    1 2 0 0 0 0 1 2 0 16 0 0 129 3 0 0 0 0 0 36
                                    1 0 0 0 56 2 0 0 0 70 72 2 0 0 0 68 73 0 0
                                    0 20 0 0 0 21 3 0 6 7 0 16 17 2 0 9 0 16 1
                                    2 0 6 7 0 1 1 0 9 0 1 1 0 0 0 1 2 0 0 0 70
                                    1 2 0 16 0 0 61 2 0 16 0 0 60 2 0 16 0 0 58
                                    2 0 16 0 0 62 2 0 16 0 0 59 2 0 0 0 0 65 1
                                    0 0 0 63 2 0 0 0 0 64 2 0 0 70 0 71 2 0 0
                                    11 0 67 2 0 0 0 0 66 2 0 0 68 0 69)))))
           '|lookupComplete|)) 

(MAKEPROP '|Integer| 'NILADIC T) 
