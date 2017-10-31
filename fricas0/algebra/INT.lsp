
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

(SDEFUN |INT;coerce;$Of;13| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 30))) 

(PUT '|INT;coerce;2$;14| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;coerce;2$;14| ((|m| |Integer|) ($ $)) |m|) 

(PUT '|INT;convert;2$;15| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;convert;2$;15| ((|x| $) ($ |Integer|)) |x|) 

(PUT '|INT;length;2$;16| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |INT;length;2$;16| ((|a| $) ($ $)) (INTEGER-LENGTH |a|)) 

(SDEFUN |INT;addmod;4$;17| ((|a| $) (|b| $) (|p| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (+ |a| |b|) |INT;addmod;4$;17|)
                    (EXIT (COND ((>= |c| |p|) (- |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;submod;4$;18| ((|a| $) (|b| $) (|p| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (- |a| |b|) |INT;submod;4$;18|)
                    (EXIT (COND ((< |c| 0) (+ |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;mulmod;4$;19| ((|a| $) (|b| $) (|p| $) ($ $))
        (REM (* |a| |b|) |p|)) 

(SDEFUN |INT;convert;$F;20| ((|x| $) ($ |Float|)) (SPADCALL |x| (QREFELT $ 39))) 

(PUT '|INT;convert;$Df;21| '|SPADreplace|
     '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |INT;convert;$Df;21| ((|x| $) ($ |DoubleFloat|))
        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |INT;convert;$If;22| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 44))) 

(PUT '|INT;convert;$S;23| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |INT;convert;$S;23| ((|x| $) ($ |String|)) (STRINGIMAGE |x|)) 

(SDEFUN |INT;latex;$S;24| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| (STRINGIMAGE |x|) |INT;latex;$S;24|)
                    (COND ((< -1 |x|) (COND ((< |x| 10) (EXIT |s|)))))
                    (EXIT (STRCONC "{" (STRCONC |s| "}")))))) 

(SDEFUN |INT;positiveRemainder;3$;25| ((|a| $) (|b| $) ($ $))
        (SPROG ((|r| ($)))
               (COND
                ((MINUSP
                  (LETT |r| (REM |a| |b|) |INT;positiveRemainder;3$;25|))
                 (COND ((MINUSP |b|) (- |r| |b|)) (#1='T (+ |r| |b|))))
                (#1# |r|)))) 

(PUT '|INT;reducedSystem;2M;26| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;reducedSystem;2M;26| ((|m| |Matrix| $) ($ |Matrix| (|Integer|)))
        |m|) 

(PUT '|INT;reducedSystem;MVR;27| '|SPADreplace| 'CONS) 

(SDEFUN |INT;reducedSystem;MVR;27|
        ((|m| |Matrix| $) (|vec| |Vector| $)
         ($ |Record| (|:| |mat| (|Matrix| (|Integer|)))
          (|:| |vec| (|Vector| (|Integer|)))))
        (CONS |m| |vec|)) 

(PUT '|INT;abs;2$;28| '|SPADreplace| 'ABS) 

(SDEFUN |INT;abs;2$;28| ((|x| $) ($ $)) (ABS |x|)) 

(PUT '|INT;random;2$;29| '|SPADreplace| 'RANDOM) 

(SDEFUN |INT;random;2$;29| ((|x| $) ($ $)) (RANDOM |x|)) 

(PUT '|INT;=;2$B;30| '|SPADreplace| 'EQL) 

(SDEFUN |INT;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|)) (EQL |x| |y|)) 

(PUT '|INT;<;2$B;31| '|SPADreplace| '<) 

(SDEFUN |INT;<;2$B;31| ((|x| $) (|y| $) ($ |Boolean|)) (< |x| |y|)) 

(PUT '|INT;>=;2$B;32| '|SPADreplace| '>=) 

(SDEFUN |INT;>=;2$B;32| ((|x| $) (|y| $) ($ |Boolean|)) (>= |x| |y|)) 

(PUT '|INT;-;2$;33| '|SPADreplace| '-) 

(SDEFUN |INT;-;2$;33| ((|x| $) ($ $)) (- |x|)) 

(PUT '|INT;+;3$;34| '|SPADreplace| '+) 

(SDEFUN |INT;+;3$;34| ((|x| $) (|y| $) ($ $)) (+ |x| |y|)) 

(PUT '|INT;-;3$;35| '|SPADreplace| '-) 

(SDEFUN |INT;-;3$;35| ((|x| $) (|y| $) ($ $)) (- |x| |y|)) 

(PUT '|INT;*;3$;36| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;36| ((|x| $) (|y| $) ($ $)) (* |x| |y|)) 

(PUT '|INT;*;3$;37| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;37| ((|m| |Integer|) (|y| $) ($ $)) (* |m| |y|)) 

(PUT '|INT;^;$Nni$;38| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;$Nni$;38| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (EXPT |x| |n|)) 

(PUT '|INT;odd?;$B;39| '|SPADreplace| 'ODDP) 

(SDEFUN |INT;odd?;$B;39| ((|x| $) ($ |Boolean|)) (ODDP |x|)) 

(PUT '|INT;max;3$;40| '|SPADreplace| 'MAX) 

(SDEFUN |INT;max;3$;40| ((|x| $) (|y| $) ($ $)) (MAX |x| |y|)) 

(PUT '|INT;min;3$;41| '|SPADreplace| 'MIN) 

(SDEFUN |INT;min;3$;41| ((|x| $) (|y| $) ($ $)) (MIN |x| |y|)) 

(PUT '|INT;divide;2$R;42| '|SPADreplace| 'DIVIDE2) 

(SDEFUN |INT;divide;2$R;42|
        ((|x| $) (|y| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (DIVIDE2 |x| |y|)) 

(PUT '|INT;quo;3$;43| '|SPADreplace| 'QUOTIENT2) 

(SDEFUN |INT;quo;3$;43| ((|x| $) (|y| $) ($ $)) (QUOTIENT2 |x| |y|)) 

(PUT '|INT;rem;3$;44| '|SPADreplace| 'REM) 

(SDEFUN |INT;rem;3$;44| ((|x| $) (|y| $) ($ $)) (REM |x| |y|)) 

(PUT '|INT;shift;3$;45| '|SPADreplace| 'ASH) 

(SDEFUN |INT;shift;3$;45| ((|x| $) (|y| $) ($ $)) (ASH |x| |y|)) 

(SDEFUN |INT;exquo;2$U;46| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG ((|z| (|SExpression|)))
               (SEQ
                (COND ((ZEROP |y|) (CONS 1 "failed"))
                      (#1='T
                       (SEQ (LETT |z| (INTEXQUO |x| |y|) |INT;exquo;2$U;46|)
                            (EXIT
                             (COND ((SPADCALL |z| (QREFELT $ 76)) (CONS 0 |z|))
                                   (#1# (CONS 1 "failed")))))))))) 

(SDEFUN |INT;recip;$U;47| ((|x| $) ($ |Union| $ "failed"))
        (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(PUT '|INT;gcd;3$;48| '|SPADreplace| 'GCD) 

(SDEFUN |INT;gcd;3$;48| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(SDEFUN |INT;unitNormal;$R;49|
        ((|x| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(PUT '|INT;unitCanonical;2$;50| '|SPADreplace| 'ABS) 

(SDEFUN |INT;unitCanonical;2$;50| ((|x| $) ($ $)) (ABS |x|)) 

(SDEFUN |INT;solveLinearPolynomialEquation;LSupU;51|
        ((|lp| |List| #1=(|SparseUnivariatePolynomial| $)) (|p| . #1#)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| $)) "failed"))
        (SPADCALL |lp| |p| (QREFELT $ 88))) 

(SDEFUN |INT;squareFreePolynomial;SupF;52|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 96))) 

(SDEFUN |INT;factorPolynomial;SupF;53|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG ((#1=#:G2152 NIL) (|pp| (|SparseUnivariatePolynomial| $)))
               (SEQ
                (LETT |pp| (SPADCALL |p| (QREFELT $ 99))
                      . #2=(|INT;factorPolynomial;SupF;53|))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |pp| (QREFELT $ 100))
                        (SPADCALL |p| (QREFELT $ 100)))
                   (SPADCALL |p| (QREFELT $ 102)))
                  ('T
                   (SPADCALL (SPADCALL |pp| (QREFELT $ 102))
                             (SPADCALL (ELT $ 103)
                                       (SPADCALL
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL
                                                   (SPADCALL |p|
                                                             (QREFELT $ 100))
                                                   (SPADCALL |pp|
                                                             (QREFELT $ 100))
                                                   (QREFELT $ 78))
                                                  . #2#)
                                            (QCDR #1#)
                                          (|check_union2| (QEQCAR #1# 0) $
                                                          (|Union| $ "failed")
                                                          #1#))
                                        (QREFELT $ 105))
                                       (QREFELT $ 109))
                             (QREFELT $ 111)))))))) 

(SDEFUN |INT;factorSquareFreePolynomial;SupF;54|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 113))) 

(SDEFUN |INT;gcdPolynomial;3Sup;55|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 115)) (SPADCALL |q| (QREFELT $ 116)))
              ((SPADCALL |q| (QREFELT $ 115)) (SPADCALL |p| (QREFELT $ 116)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT $ 119))))) 

(SDEFUN |INT;opposite?;2$B;56| ((|x| $) (|y| $) ($ |Boolean|))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2$B;57| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(DECLAIM (NOTINLINE |Integer;|)) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G2183)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Integer|) . #2=(|Integer|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Integer|
                             (LIST (CONS NIL (CONS 1 (|Integer;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Integer|)))))))))) 

(DEFUN |Integer;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Integer|) . #1=(|Integer|))
          (LETT $ (GETREFV 138) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|CharacteristicNonZero|))
               (|augmentPredVector| $ 1))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 64
                    (QSETREFV $ 63
                              (CONS (|dispatchFunction| |INT;*;3$;37|) $)))
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
              (|OutputForm|) (33 . |outputForm|) |INT;coerce;$Of;13|
              |INT;coerce;2$;14| |INT;convert;2$;15| |INT;length;2$;16|
              |INT;addmod;4$;17| |INT;submod;4$;18| |INT;mulmod;4$;19|
              (|Float|) (38 . |coerce|) |INT;convert;$F;20| (|DoubleFloat|)
              |INT;convert;$Df;21| (|InputForm|) (43 . |convert|)
              |INT;convert;$If;22| |INT;convert;$S;23| |INT;latex;$S;24|
              |INT;positiveRemainder;3$;25| (|Matrix| 11) (|Matrix| $)
              |INT;reducedSystem;2M;26|
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 11))) (|Vector| $)
              |INT;reducedSystem;MVR;27| |INT;abs;2$;28| |INT;random;2$;29|
              |INT;=;2$B;30| |INT;<;2$B;31| |INT;>=;2$B;32| |INT;-;2$;33|
              |INT;+;3$;34| |INT;-;3$;35| NIL NIL (|NonNegativeInteger|)
              |INT;^;$Nni$;38| |INT;odd?;$B;39| |INT;max;3$;40| |INT;min;3$;41|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |INT;divide;2$R;42| |INT;quo;3$;43| |INT;rem;3$;44|
              |INT;shift;3$;45| (|SExpression|) (48 . |integer?|)
              (|Union| $ '"failed") |INT;exquo;2$U;46| |INT;recip;$U;47|
              |INT;gcd;3$;48|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |INT;unitNormal;$R;49| |INT;unitCanonical;2$;50|
              (|Union| 85 '"failed") (|List| 86)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (53 . |solveLinearPolynomialEquation|) (|Union| 90 '"failed")
              (|List| 91) (|SparseUnivariatePolynomial| $)
              |INT;solveLinearPolynomialEquation;LSupU;51| (|Factored| 94)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 94) (59 . |squareFree|)
              (|Factored| 91) |INT;squareFreePolynomial;SupF;52|
              (64 . |primitivePart|) (69 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 94) (74 . |factor|) (79 . |coerce|)
              (|Factored| $) (84 . |factor|) (|Mapping| 94 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 94) (89 . |map|)
              (|FactoredFunctionUtilities| 94) (95 . |mergeFactors|)
              |INT;factorPolynomial;SupF;53| (101 . |factorSquareFree|)
              |INT;factorSquareFreePolynomial;SupF;54| (106 . |zero?|)
              (111 . |unitCanonical|) (|List| 94) (|HeuGcd| 94) (116 . |gcd|)
              |INT;gcdPolynomial;3Sup;55| |INT;opposite?;2$B;56|
              |INT;annihilate?;2$B;57| (|Union| 53 '"failed")
              (|Union| 125 '"failed") (|Fraction| 11)
              (|PatternMatchResult| 11 $) (|Pattern| 11) (|Union| 11 '"failed")
              (|Record| (|:| |coef| 130) (|:| |generator| $)) (|List| $)
              (|Union| 130 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 133 '"failed")
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 121 |zero?| 127 |unitNormal| 132 |unitCanonical| 137 |unit?|
              142 |symmetricRemainder| 147 |subtractIfCan| 153 |submod| 159
              |squareFreePolynomial| 166 |squareFreePart| 171 |squareFree| 176
              |solveLinearPolynomialEquation| 181 |smaller?| 187 |sizeLess?|
              193 |sign| 199 |shift| 204 |sample| 210 |retractIfCan| 214
              |retract| 219 |rem| 224 |reducedSystem| 230 |recip| 241
              |rationalIfCan| 246 |rational?| 251 |rational| 256 |random| 261
              |quo| 266 |principalIdeal| 272 |prime?| 277 |powmod| 282
              |positiveRemainder| 289 |positive?| 295 |permutation| 300
              |patternMatch| 306 |opposite?| 313 |one?| 319 |odd?| 324
              |nextItem| 329 |negative?| 334 |multiEuclidean| 339 |mulmod| 345
              |min| 352 |max| 358 |mask| 364 |length| 369 |lcmCoef| 374 |lcm|
              380 |latex| 391 |invmod| 396 |init| 402 |inc| 406 |hashUpdate!|
              411 |hash| 417 |gcdPolynomial| 422 |gcd| 428 |factorial| 439
              |factorSquareFreePolynomial| 444 |factorPolynomial| 449 |factor|
              454 |extendedEuclidean| 459 |exquo| 472 |expressIdealMember| 478
              |even?| 484 |euclideanSize| 489 |divide| 494 |differentiate| 500
              |dec| 511 |copy| 516 |convert| 521 |conditionP| 551 |coerce| 556
              |charthRoot| 576 |characteristic| 581 |bit?| 585 |binomial| 591
              |base| 597 |associates?| 601 |annihilate?| 607 |addmod| 613 |abs|
              620 ^ 625 |Zero| 637 |One| 641 |OMwrite| 645 D 669 >= 680 > 686 =
              692 <= 698 < 704 - 710 + 721 * 727)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |PolynomialFactorizationExplicit&|
                |EuclideanDomain&| |UniqueFactorizationDomain&| NIL NIL
                |GcdDomain&| NIL |OrderedRing&| NIL |Algebra&| NIL
                |DifferentialRing&| NIL NIL |EntireRing&| |Module&| NIL NIL
                |Ring&| NIL NIL |Rng&| NIL NIL |AbelianGroup&| NIL NIL NIL
                |OrderedSet&| |AbelianMonoid&| |Monoid&| NIL NIL NIL NIL
                |SemiGroup&| |AbelianSemiGroup&| NIL |SetCategory&| NIL NIL
                |OpenMath&| NIL NIL NIL NIL NIL NIL NIL NIL |RetractableTo&|
                NIL |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|OrderedIntegralDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|OrderedRing|)
                 (|LeftOreRing|) (|Algebra| $$) (|LinearlyExplicitOver| 11)
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 11)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|OpenMath|) (|ConvertibleTo| 9)
                 (|multiplicativeValuation|) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 38) (|ConvertibleTo| 41)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 127)
                 (|ConvertibleTo| 43) (|RetractableTo| 11) (|ConvertibleTo| 11)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 29))
              (|makeByteWordVec2| 137
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 29 0 11 30 1
                                    38 0 11 39 1 43 0 11 44 1 75 16 0 76 2 87
                                    84 85 86 88 1 95 93 94 96 1 94 0 0 99 1 94
                                    2 0 100 1 101 93 94 102 1 94 0 2 103 1 0
                                    104 0 105 2 108 93 106 107 109 2 110 93 93
                                    93 111 1 101 93 94 113 1 94 16 0 115 1 94 0
                                    0 116 1 118 94 117 119 2 0 16 0 0 1 1 0 16
                                    0 18 1 0 81 0 82 1 0 0 0 83 1 0 16 0 1 2 0
                                    0 0 0 1 2 0 77 0 0 1 3 0 0 0 0 0 36 1 0 97
                                    91 98 1 0 0 0 1 1 0 104 0 1 2 0 89 90 91 92
                                    2 0 16 0 0 1 2 0 16 0 0 1 1 0 11 0 1 2 0 0
                                    0 0 74 0 0 0 1 1 0 128 0 1 1 0 11 0 1 2 0 0
                                    0 0 73 1 0 49 50 51 2 0 52 50 53 54 1 0 77
                                    0 79 1 0 124 0 1 1 0 16 0 1 1 0 125 0 1 1 0
                                    0 0 56 2 0 0 0 0 72 1 0 129 130 1 1 0 16 0
                                    1 3 0 0 0 0 0 1 2 0 0 0 0 48 1 0 16 0 1 2 0
                                    0 0 0 1 3 0 126 0 127 126 1 2 0 16 0 0 121
                                    1 0 16 0 19 1 0 16 0 67 1 0 77 0 1 1 0 16 0
                                    28 2 0 131 130 0 1 3 0 0 0 0 0 37 2 0 0 0 0
                                    69 2 0 0 0 0 68 1 0 0 0 1 1 0 0 0 34 2 0
                                    135 0 0 1 2 0 0 0 0 1 1 0 0 130 1 1 0 9 0
                                    47 2 0 0 0 0 1 0 0 0 1 1 0 0 0 24 2 0 26 26
                                    0 27 1 0 137 0 1 2 0 91 91 91 120 2 0 0 0 0
                                    80 1 0 0 130 1 1 0 0 0 1 1 0 97 91 114 1 0
                                    97 91 112 1 0 104 0 105 2 0 132 0 0 1 3 0
                                    134 0 0 0 1 2 0 77 0 0 78 2 0 131 130 0 1 1
                                    0 16 0 1 1 0 65 0 1 2 0 70 0 0 71 1 0 0 0 1
                                    2 0 0 0 65 1 1 0 0 0 25 1 0 0 0 23 1 0 9 0
                                    46 1 0 41 0 42 1 0 38 0 40 1 0 43 0 45 1 0
                                    127 0 1 1 0 11 0 33 1 1 123 50 1 1 0 0 11
                                    32 1 0 0 0 1 1 0 0 11 32 1 0 29 0 31 1 1 77
                                    0 1 0 0 65 1 2 0 16 0 0 1 2 0 0 0 0 1 0 0 0
                                    22 2 0 16 0 0 1 2 0 16 0 0 122 3 0 0 0 0 0
                                    35 1 0 0 0 55 2 0 0 0 65 66 2 0 0 0 136 1 0
                                    0 0 20 0 0 0 21 3 0 6 7 0 16 17 2 0 6 7 0 1
                                    1 0 9 0 1 2 0 9 0 16 1 1 0 0 0 1 2 0 0 0 65
                                    1 2 0 16 0 0 59 2 0 16 0 0 1 2 0 16 0 0 57
                                    2 0 16 0 0 1 2 0 16 0 0 58 2 0 0 0 0 62 1 0
                                    0 0 60 2 0 0 0 0 61 2 0 0 0 0 63 2 0 0 11 0
                                    64 2 0 0 65 0 1 2 0 0 136 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Integer| 'NILADIC T) 
