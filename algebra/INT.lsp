
(SDEFUN |INT;writeOMInt| ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (SEQ
         (COND
          ((< |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT % 8))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT % 10))
                (SPADCALL |dev| (- |x|) (QREFELT % 12))
                (EXIT (SPADCALL |dev| (QREFELT % 13)))))
          ('T (SPADCALL |dev| |x| (QREFELT % 12)))))) 

(SDEFUN |INT;OMwrite;Omd%BV;2|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 14))))
             (|INT;writeOMInt| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 15))))))) 

(PUT '|INT;zero?;%B;3| '|SPADreplace| 'ZEROP) 

(SDEFUN |INT;zero?;%B;3| ((|x| (%)) (% (|Boolean|))) (ZEROP |x|)) 

(PUT '|INT;one?;%B;4| '|SPADreplace| '(XLAM (|x|) (EQL |x| 1))) 

(SDEFUN |INT;one?;%B;4| ((|x| (%)) (% (|Boolean|))) (EQL |x| 1)) 

(PUT '|INT;Zero;%;5| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INT;Zero;%;5| ((% (%))) 0) 

(PUT '|INT;One;%;6| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |INT;One;%;6| ((% (%))) 1) 

(PUT '|INT;base;%;7| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |INT;base;%;7| ((% (%))) 2) 

(PUT '|INT;copy;2%;8| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;copy;2%;8| ((|x| (%)) (% (%))) |x|) 

(PUT '|INT;inc;2%;9| '|SPADreplace| '(XLAM (|x|) (+ |x| 1))) 

(SDEFUN |INT;inc;2%;9| ((|x| (%)) (% (%))) (+ |x| 1)) 

(PUT '|INT;dec;2%;10| '|SPADreplace| '(XLAM (|x|) (- |x| 1))) 

(SDEFUN |INT;dec;2%;10| ((|x| (%)) (% (%))) (- |x| 1)) 

(SDEFUN |INT;hashUpdate!;Hs%Hs;11| ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|INT;negative?;%B;12| '|SPADreplace| 'MINUSP) 

(SDEFUN |INT;negative?;%B;12| ((|x| (%)) (% (|Boolean|))) (MINUSP |x|)) 

(PUT '|INT;positive?;%B;13| '|SPADreplace| 'PLUSP) 

(SDEFUN |INT;positive?;%B;13| ((|x| (%)) (% (|Boolean|))) (PLUSP |x|)) 

(SDEFUN |INT;coerce;%Of;14| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 31))) 

(PUT '|INT;coerce;2%;15| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;coerce;2%;15| ((|m| (|Integer|)) (% (%))) |m|) 

(PUT '|INT;convert;2%;16| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;convert;2%;16| ((|x| (%)) (% (|Integer|))) |x|) 

(PUT '|INT;length;2%;17| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |INT;length;2%;17| ((|a| (%)) (% (%))) (INTEGER-LENGTH |a|)) 

(SDEFUN |INT;addmod;4%;18| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (+ |a| |b|))
                    (EXIT (COND ((>= |c| |p|) (- |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;submod;4%;19| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (- |a| |b|))
                    (EXIT (COND ((< |c| 0) (+ |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;mulmod;4%;20| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (REM (* |a| |b|) |p|)) 

(SDEFUN |INT;convert;%F;21| ((|x| (%)) (% (|Float|)))
        (SPADCALL |x| (QREFELT % 40))) 

(PUT '|INT;convert;%Df;22| '|SPADreplace|
     '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |INT;convert;%Df;22| ((|x| (%)) (% (|DoubleFloat|)))
        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |INT;convert;%If;23| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 45))) 

(PUT '|INT;convert;%S;24| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |INT;convert;%S;24| ((|x| (%)) (% (|String|))) (STRINGIMAGE |x|)) 

(SDEFUN |INT;positiveRemainder;3%;25| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((|r| (%)))
               (COND
                ((MINUSP (LETT |r| (REM |a| |b|)))
                 (COND ((MINUSP |b|) (- |r| |b|)) (#1='T (+ |r| |b|))))
                (#1# |r|)))) 

(PUT '|INT;reducedSystem;2M;26| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;reducedSystem;2M;26|
        ((|m| (|Matrix| %)) (% (|Matrix| (|Integer|)))) |m|) 

(PUT '|INT;reducedSystem;MVR;27| '|SPADreplace| 'CONS) 

(SDEFUN |INT;reducedSystem;MVR;27|
        ((|m| (|Matrix| %)) (|vec| (|Vector| %))
         (%
          (|Record| (|:| |mat| (|Matrix| (|Integer|)))
                    (|:| |vec| (|Vector| (|Integer|))))))
        (CONS |m| |vec|)) 

(PUT '|INT;abs;2%;28| '|SPADreplace| 'ABS) 

(SDEFUN |INT;abs;2%;28| ((|x| (%)) (% (%))) (ABS |x|)) 

(PUT '|INT;random;2%;29| '|SPADreplace| 'RANDOM) 

(SDEFUN |INT;random;2%;29| ((|x| (%)) (% (%))) (RANDOM |x|)) 

(PUT '|INT;seedRandom;V;30| '|SPADreplace| 'SEEDRANDOM) 

(SDEFUN |INT;seedRandom;V;30| ((% (|Void|))) (SEEDRANDOM)) 

(PUT '|INT;=;2%B;31| '|SPADreplace| 'EQL) 

(SDEFUN |INT;=;2%B;31| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (EQL |x| |y|)) 

(PUT '|INT;<;2%B;32| '|SPADreplace| '<) 

(SDEFUN |INT;<;2%B;32| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (< |x| |y|)) 

(PUT '|INT;>;2%B;33| '|SPADreplace| '>) 

(SDEFUN |INT;>;2%B;33| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (> |x| |y|)) 

(PUT '|INT;>=;2%B;34| '|SPADreplace| '>=) 

(SDEFUN |INT;>=;2%B;34| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (>= |x| |y|)) 

(PUT '|INT;<=;2%B;35| '|SPADreplace| '<=) 

(SDEFUN |INT;<=;2%B;35| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (<= |x| |y|)) 

(PUT '|INT;-;2%;36| '|SPADreplace| '-) 

(SDEFUN |INT;-;2%;36| ((|x| (%)) (% (%))) (- |x|)) 

(PUT '|INT;+;3%;37| '|SPADreplace| '+) 

(SDEFUN |INT;+;3%;37| ((|x| (%)) (|y| (%)) (% (%))) (+ |x| |y|)) 

(PUT '|INT;-;3%;38| '|SPADreplace| '-) 

(SDEFUN |INT;-;3%;38| ((|x| (%)) (|y| (%)) (% (%))) (- |x| |y|)) 

(PUT '|INT;*;3%;39| '|SPADreplace| '*) 

(SDEFUN |INT;*;3%;39| ((|x| (%)) (|y| (%)) (% (%))) (* |x| |y|)) 

(PUT '|INT;*;Pi2%;40| '|SPADreplace| '*) 

(SDEFUN |INT;*;Pi2%;40| ((|m| (|PositiveInteger|)) (|y| (%)) (% (%)))
        (* |m| |y|)) 

(PUT '|INT;*;Nni2%;41| '|SPADreplace| '*) 

(SDEFUN |INT;*;Nni2%;41| ((|m| (|NonNegativeInteger|)) (|y| (%)) (% (%)))
        (* |m| |y|)) 

(PUT '|INT;^;%Nni%;42| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;%Nni%;42| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (EXPT |x| |n|)) 

(PUT '|INT;^;%Pi%;43| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;%Pi%;43| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (EXPT |x| |n|)) 

(PUT '|INT;odd?;%B;44| '|SPADreplace| 'ODDP) 

(SDEFUN |INT;odd?;%B;44| ((|x| (%)) (% (|Boolean|))) (ODDP |x|)) 

(PUT '|INT;even?;%B;45| '|SPADreplace| 'EVENP) 

(SDEFUN |INT;even?;%B;45| ((|x| (%)) (% (|Boolean|))) (EVENP |x|)) 

(PUT '|INT;max;3%;46| '|SPADreplace| 'MAX) 

(SDEFUN |INT;max;3%;46| ((|x| (%)) (|y| (%)) (% (%))) (MAX |x| |y|)) 

(PUT '|INT;min;3%;47| '|SPADreplace| 'MIN) 

(SDEFUN |INT;min;3%;47| ((|x| (%)) (|y| (%)) (% (%))) (MIN |x| |y|)) 

(PUT '|INT;divide;2%R;48| '|SPADreplace| 'DIVIDE2) 

(SDEFUN |INT;divide;2%R;48|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (DIVIDE2 |x| |y|)) 

(PUT '|INT;quo;3%;49| '|SPADreplace| 'QUOTIENT2) 

(SDEFUN |INT;quo;3%;49| ((|x| (%)) (|y| (%)) (% (%))) (QUOTIENT2 |x| |y|)) 

(PUT '|INT;rem;3%;50| '|SPADreplace| 'REM) 

(SDEFUN |INT;rem;3%;50| ((|x| (%)) (|y| (%)) (% (%))) (REM |x| |y|)) 

(PUT '|INT;shift;3%;51| '|SPADreplace| 'ASH) 

(SDEFUN |INT;shift;3%;51| ((|x| (%)) (|y| (%)) (% (%))) (ASH |x| |y|)) 

(SDEFUN |INT;exquo;2%U;52| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|z| (|SExpression|)))
               (SEQ
                (COND ((ZEROP |y|) (CONS 1 "failed"))
                      (#1='T
                       (SEQ (LETT |z| (INTEXQUO |x| |y|))
                            (EXIT
                             (COND ((SPADCALL |z| (QREFELT % 83)) (CONS 0 |z|))
                                   (#1# (CONS 1 "failed")))))))))) 

(SDEFUN |INT;recip;%U;53| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(PUT '|INT;gcd;3%;54| '|SPADreplace| 'GCD) 

(SDEFUN |INT;gcd;3%;54| ((|x| (%)) (|y| (%)) (% (%))) (GCD |x| |y|)) 

(SDEFUN |INT;unitNormal;%R;55|
        ((|x| (%))
         (% (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
        (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(PUT '|INT;unitCanonical;2%;56| '|SPADreplace| 'ABS) 

(SDEFUN |INT;unitCanonical;2%;56| ((|x| (%)) (% (%))) (ABS |x|)) 

(SDEFUN |INT;solveLinearPolynomialEquation;LSupU;57|
        ((|lp| (|List| #1=(|SparseUnivariatePolynomial| %))) (|p| #1#)
         (% (|Union| (|List| (|SparseUnivariatePolynomial| %)) "failed")))
        (SPADCALL |lp| |p| (QREFELT % 95))) 

(SDEFUN |INT;squareFreePolynomial;SupF;58|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |p| (QREFELT % 103))) 

(SDEFUN |INT;factorPolynomial;SupF;59|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPROG ((#1=#:G1250 NIL) (|pp| (|SparseUnivariatePolynomial| %)))
               (SEQ (LETT |pp| (SPADCALL |p| (QREFELT % 106)))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |pp| (QREFELT % 107))
                            (SPADCALL |p| (QREFELT % 107)))
                       (SPADCALL |p| (QREFELT % 109)))
                      ('T
                       (SPADCALL (SPADCALL |pp| (QREFELT % 109))
                                 (SPADCALL (ELT % 110)
                                           (SPADCALL
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL
                                                       (SPADCALL |p|
                                                                 (QREFELT %
                                                                          107))
                                                       (SPADCALL |pp|
                                                                 (QREFELT %
                                                                          107))
                                                       (QREFELT % 85)))
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0) %
                                                              (|Union| %
                                                                       "failed")
                                                              #1#))
                                            (QREFELT % 112))
                                           (QREFELT % 116))
                                 (QREFELT % 117)))))))) 

(SDEFUN |INT;factorSquareFreePolynomial;SupF;60|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |p| (QREFELT % 119))) 

(SDEFUN |INT;gcdPolynomial;3Sup;61|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (COND ((SPADCALL |p| (QREFELT % 121)) (SPADCALL |q| (QREFELT % 122)))
              ((SPADCALL |q| (QREFELT % 121)) (SPADCALL |p| (QREFELT % 122)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT % 125))))) 

(SDEFUN |INT;opposite?;2%B;62| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2%B;63| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(SDEFUN |INT;powmod;4%;64| ((|x| (%)) (|n| (%)) (|p| (%)) (% (%)))
        (SPROG ((|z| (%)) (#1=#:G1270 NIL) (|y| (%)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((MINUSP |x|) (LETT |x| (SPADCALL |x| |p| (QREFELT % 48)))))
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
                                                        (QREFELT % 38)))))
                                      (EXIT
                                       (COND
                                        ((ZEROP (LETT |n| (ASH |n| -1)))
                                         (PROGN
                                          (LETT #1# |y|)
                                          (GO #2=#:G1269)))
                                        ('T
                                         (LETT |z|
                                               (SPADCALL |z| |z| |p|
                                                         (QREFELT % 38)))))))
                                     NIL (GO G190) G191 (EXIT NIL)))))))))
                #2# (EXIT #1#)))) 

(SDEFUN |INT;symmetricRemainder;3%;65| ((|x| (%)) (|n| (%)) (% (%)))
        (SPROG ((|r| (%)))
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

(DEFUN |Integer;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Integer|))
          (LETT % (GETREFV 145))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G1296)
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

(MAKEPROP '|Integer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) |INT;OMwrite;Omd%BV;2|
              |INT;zero?;%B;3| |INT;one?;%B;4|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;Zero;%;5|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;One;%;6|) %))
              |INT;base;%;7| |INT;copy;2%;8| |INT;inc;2%;9| |INT;dec;2%;10|
              (|HashState|) |INT;hashUpdate!;Hs%Hs;11| |INT;negative?;%B;12|
              |INT;positive?;%B;13| (|OutputForm|) (33 . |outputForm|)
              |INT;coerce;%Of;14| |INT;coerce;2%;15| |INT;convert;2%;16|
              |INT;length;2%;17| |INT;addmod;4%;18| |INT;submod;4%;19|
              |INT;mulmod;4%;20| (|Float|) (38 . |coerce|) |INT;convert;%F;21|
              (|DoubleFloat|) |INT;convert;%Df;22| (|InputForm|)
              (43 . |convert|) |INT;convert;%If;23| |INT;convert;%S;24|
              |INT;positiveRemainder;3%;25| (|Matrix| 11) (|Matrix| %)
              |INT;reducedSystem;2M;26|
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 11))) (|Vector| %)
              |INT;reducedSystem;MVR;27| |INT;abs;2%;28| |INT;random;2%;29|
              |INT;seedRandom;V;30| |INT;=;2%B;31| |INT;<;2%B;32|
              |INT;>;2%B;33| |INT;>=;2%B;34| |INT;<=;2%B;35| |INT;-;2%;36|
              |INT;+;3%;37| |INT;-;3%;38| |INT;*;3%;39| (|PositiveInteger|)
              |INT;*;Pi2%;40| (|NonNegativeInteger|) |INT;*;Nni2%;41|
              |INT;^;%Nni%;42| |INT;^;%Pi%;43| |INT;odd?;%B;44|
              |INT;even?;%B;45| |INT;max;3%;46| |INT;min;3%;47|
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |INT;divide;2%R;48| |INT;quo;3%;49| |INT;rem;3%;50|
              |INT;shift;3%;51| (|SExpression|) (48 . |integer?|)
              (|Union| % '"failed") |INT;exquo;2%U;52| |INT;recip;%U;53|
              |INT;gcd;3%;54|
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              |INT;unitNormal;%R;55| |INT;unitCanonical;2%;56|
              (|Union| 92 '"failed") (|List| 93)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (53 . |solveLinearPolynomialEquation|) (|Union| 97 '"failed")
              (|List| 98) (|SparseUnivariatePolynomial| %)
              |INT;solveLinearPolynomialEquation;LSupU;57| (|Factored| 101)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 101) (59 . |squareFree|)
              (|Factored| 98) |INT;squareFreePolynomial;SupF;58|
              (64 . |primitivePart|) (69 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 101) (74 . |factor|) (79 . |coerce|)
              (|Factored| %) (84 . |factor|) (|Mapping| 101 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 101) (89 . |map|) (95 . |mergeFactors|)
              |INT;factorPolynomial;SupF;59| (101 . |factorSquareFree|)
              |INT;factorSquareFreePolynomial;SupF;60| (106 . |zero?|)
              (111 . |unitCanonical|) (|List| 101) (|HeuGcd| 101) (116 . |gcd|)
              |INT;gcdPolynomial;3Sup;61| |INT;opposite?;2%B;62|
              |INT;annihilate?;2%B;63| |INT;powmod;4%;64|
              |INT;symmetricRemainder;3%;65|
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 133 '#1="failed") (|Union| 132 '#1#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef| 132) (|:| |generator| %))
              (|Union| 11 '"failed") (|PatternMatchResult| 11 %) (|Pattern| 11)
              (|Union| 142 '"failed") (|Fraction| 11) (|SingleInteger|)
              (|Union| 53 '"failed"))
           '#(~= 121 |zero?| 127 |unitNormal| 132 |unitCanonical| 137 |unit?|
              142 |symmetricRemainder| 147 |subtractIfCan| 153 |submod| 159
              |squareFreePolynomial| 166 |squareFreePart| 171 |squareFree| 176
              |solveLinearPolynomialEquation| 181 |smaller?| 187 |sizeLess?|
              193 |sign| 199 |shift| 204 |seedRandom| 210 |sample| 214
              |rightRecip| 218 |rightPower| 223 |retractIfCan| 235 |retract|
              240 |rem| 245 |reducedSystem| 251 |recip| 262 |rationalIfCan| 267
              |rational?| 272 |rational| 277 |random| 282 |quo| 287
              |principalIdeal| 293 |prime?| 298 |powmod| 303
              |positiveRemainder| 310 |positive?| 316 |plenaryPower| 321
              |permutation| 327 |patternMatch| 333 |opposite?| 340 |one?| 346
              |odd?| 351 |nextItem| 356 |negative?| 361 |multiEuclidean| 366
              |mulmod| 372 |min| 379 |max| 385 |mask| 391 |length| 396
              |leftRecip| 401 |leftPower| 406 |lcmCoef| 418 |lcm| 424 |latex|
              435 |invmod| 440 |init| 446 |inc| 450 |hashUpdate!| 455 |hash|
              461 |gcdPolynomial| 466 |gcd| 472 |factorial| 483
              |factorSquareFreePolynomial| 488 |factorPolynomial| 493 |factor|
              498 |extendedEuclidean| 503 |exquo| 516 |expressIdealMember| 522
              |even?| 528 |euclideanSize| 533 |divide| 538 |differentiate| 544
              |dec| 555 |copy| 560 |convert| 565 |conditionP| 595 |commutator|
              600 |coerce| 606 |charthRoot| 621 |characteristic| 626 |bit?| 630
              |binomial| 636 |base| 642 |associator| 646 |associates?| 653
              |antiCommutator| 659 |annihilate?| 665 |addmod| 671 |abs| 678 ^
              683 |Zero| 695 |One| 699 |OMwrite| 703 D 727 >= 738 > 744 = 750
              <= 756 < 762 - 768 + 779 * 785)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL NIL NIL
                |OrderedRing&| |Algebra&| |EntireRing&| NIL |DifferentialRing&|
                NIL NIL |Rng&| |NonAssociativeAlgebra&| NIL |Module&|
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL |OrderedSet&|
                |AbelianSemiGroup&| |Magma&| NIL NIL NIL |SetCategory&| NIL
                |RetractableTo&| NIL |Hashable&| NIL |BasicType&| NIL NIL NIL
                |PartialOrder&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |OpenMath&| NIL NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|OrderedRing|) (|Algebra| $$)
                 (|EntireRing|) (|CharacteristicZero|) (|DifferentialRing|)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRng|) (|Module| $$) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|OrderedAbelianGroup|)
                 (|LinearlyExplicitOver| 11) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 11)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|PatternMatchable| 11) (|StepThrough|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 11) (|RealConstant|)
                 (|Hashable|) (|CoercibleTo| 30) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|PartialOrder|)
                 (|ConvertibleTo| 11) (|CoercibleFrom| 11) (|ConvertibleTo| 44)
                 (|ConvertibleTo| 140) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 42) (|ConvertibleTo| 39)
                 (|canonicalUnitNormal|) (|multiplicativeValuation|)
                 (|ConvertibleTo| 9) (|OpenMath|) (|Canonical|)
                 (|canonicalsClosed|))
              (|makeByteWordVec2| 144
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 30 0 11 31 1
                                    39 0 11 40 1 44 0 11 45 1 82 16 0 83 2 94
                                    91 92 93 95 1 102 100 101 103 1 101 0 0 106
                                    1 101 2 0 107 1 108 100 101 109 1 101 0 2
                                    110 1 0 111 0 112 2 115 100 113 114 116 2
                                    100 0 0 0 117 1 108 100 101 119 1 101 16 0
                                    121 1 101 0 0 122 1 124 101 123 125 2 0 16
                                    0 0 1 1 0 16 0 18 1 0 88 0 89 1 0 0 0 90 1
                                    0 16 0 1 2 0 0 0 0 130 2 0 84 0 0 1 3 0 0 0
                                    0 0 37 1 0 104 98 105 1 0 0 0 1 1 0 111 0 1
                                    2 0 96 97 98 99 2 0 16 0 0 1 2 0 16 0 0 1 1
                                    0 11 0 1 2 0 0 0 0 81 0 0 6 57 0 0 0 1 1 0
                                    84 0 1 2 0 0 0 67 1 2 0 0 0 69 1 1 0 138 0
                                    1 1 0 11 0 1 2 0 0 0 0 80 1 0 49 50 51 2 0
                                    52 50 53 54 1 0 84 0 86 1 0 141 0 1 1 0 16
                                    0 1 1 0 142 0 1 1 0 0 0 56 2 0 0 0 0 79 1 0
                                    137 132 1 1 0 16 0 1 3 0 0 0 0 0 129 2 0 0
                                    0 0 48 1 0 16 0 29 2 0 0 0 67 1 2 0 0 0 0 1
                                    3 0 139 0 140 139 1 2 0 16 0 0 127 1 0 16 0
                                    19 1 0 16 0 73 1 0 84 0 1 1 0 16 0 28 2 0
                                    135 132 0 1 3 0 0 0 0 0 38 2 0 0 0 0 76 2 0
                                    0 0 0 75 1 0 0 0 1 1 0 0 0 35 1 0 84 0 1 2
                                    0 0 0 67 1 2 0 0 0 69 1 2 0 131 0 0 1 2 0 0
                                    0 0 1 1 0 0 132 1 1 0 9 0 1 2 0 0 0 0 1 0 0
                                    0 1 1 0 0 0 24 2 0 26 26 0 27 1 0 143 0 1 2
                                    0 98 98 98 126 2 0 0 0 0 87 1 0 0 132 1 1 0
                                    0 0 1 1 0 104 98 120 1 0 104 98 118 1 0 111
                                    0 112 3 0 134 0 0 0 1 2 0 136 0 0 1 2 0 84
                                    0 0 85 2 0 135 132 0 1 1 0 16 0 74 1 0 69 0
                                    1 2 0 77 0 0 78 2 0 0 0 69 1 1 0 0 0 1 1 0
                                    0 0 25 1 0 0 0 23 1 0 11 0 34 1 0 44 0 46 1
                                    0 140 0 1 1 0 39 0 41 1 0 42 0 43 1 0 9 0
                                    47 1 1 144 50 1 2 0 0 0 0 1 1 0 30 0 32 1 0
                                    0 11 33 1 0 0 0 1 1 1 84 0 1 0 0 69 1 2 0
                                    16 0 0 1 2 0 0 0 0 1 0 0 0 22 3 0 0 0 0 0 1
                                    2 0 16 0 0 1 2 0 0 0 0 1 2 0 16 0 0 128 3 0
                                    0 0 0 0 36 1 0 0 0 55 2 0 0 0 67 72 2 0 0 0
                                    69 71 0 0 0 20 0 0 0 21 2 0 9 0 16 1 1 0 9
                                    0 1 3 0 6 7 0 16 17 2 0 6 7 0 1 2 0 0 0 69
                                    1 1 0 0 0 1 2 0 16 0 0 61 2 0 16 0 0 60 2 0
                                    16 0 0 58 2 0 16 0 0 62 2 0 16 0 0 59 1 0 0
                                    0 63 2 0 0 0 0 65 2 0 0 0 0 64 2 0 0 67 0
                                    68 2 0 0 0 0 66 2 0 0 11 0 1 2 0 0 69 0 70
                                    2 0 0 0 11 1)))))
           '|lookupComplete|)) 
