
(SDEFUN |SINT;writeOMSingleInt| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ
         (COND
          ((|less_SI| |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT $ 8))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT $ 10))
                (SPADCALL |dev| (|minus_SI| |x|) (QREFELT $ 12))
                (EXIT (SPADCALL |dev| (QREFELT $ 13)))))
          ('T (SPADCALL |dev| |x| (QREFELT $ 12)))))) 

(SDEFUN |SINT;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))
             (|SINT;writeOMSingleInt| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 15))))))) 

(PUT '|SINT;reducedSystem;MM;3| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |SINT;reducedSystem;MM;3| ((|m| |Matrix| $) ($ |Matrix| (|Integer|)))
        |m|) 

(SDEFUN |SINT;coerce;$Of;4| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 22))) 

(PUT '|SINT;convert;$I;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;convert;$I;5| ((|x| $) ($ |Integer|)) |x|) 

(PUT '|SINT;convert;$S;6| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |SINT;convert;$S;6| ((|x| $) ($ |String|)) (STRINGIMAGE |x|)) 

(SDEFUN |SINT;*;I2$;7| ((|i| |Integer|) (|y| $) ($ $))
        (|mul_SI| (SPADCALL |i| (QREFELT $ 26)) |y|)) 

(PUT '|SINT;Zero;$;8| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |SINT;Zero;$;8| (($ $)) 0) 

(PUT '|SINT;One;$;9| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |SINT;One;$;9| (($ $)) 1) 

(PUT '|SINT;base;$;10| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |SINT;base;$;10| (($ $)) 2) 

(PUT '|SINT;max;$;11| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-FIXNUM)) 

(SDEFUN |SINT;max;$;11| (($ $)) MOST-POSITIVE-FIXNUM) 

(PUT '|SINT;min;$;12| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-FIXNUM)) 

(SDEFUN |SINT;min;$;12| (($ $)) MOST-NEGATIVE-FIXNUM) 

(PUT '|SINT;=;2$B;13| '|SPADreplace| '|eql_SI|) 

(SDEFUN |SINT;=;2$B;13| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_SI| |x| |y|)) 

(PUT '|SINT;~;2$;14| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;~;2$;14| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;not;2$;15| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;not;2$;15| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;/\\;3$;16| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;/\\;3$;16| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;\\/;3$;17| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;\\/;3$;17| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;Not;2$;18| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;Not;2$;18| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;And;3$;19| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;And;3$;19| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;Or;3$;20| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;Or;3$;20| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;xor;3$;21| '|SPADreplace| '|xor_SI|) 

(SDEFUN |SINT;xor;3$;21| ((|x| $) (|y| $) ($ $)) (|xor_SI| |x| |y|)) 

(PUT '|SINT;<;2$B;22| '|SPADreplace| '|less_SI|) 

(SDEFUN |SINT;<;2$B;22| ((|x| $) (|y| $) ($ |Boolean|)) (|less_SI| |x| |y|)) 

(PUT '|SINT;inc;2$;23| '|SPADreplace| '|inc_SI|) 

(SDEFUN |SINT;inc;2$;23| ((|x| $) ($ $)) (|inc_SI| |x|)) 

(PUT '|SINT;dec;2$;24| '|SPADreplace| '|dec_SI|) 

(SDEFUN |SINT;dec;2$;24| ((|x| $) ($ $)) (|dec_SI| |x|)) 

(PUT '|SINT;-;2$;25| '|SPADreplace| '|minus_SI|) 

(SDEFUN |SINT;-;2$;25| ((|x| $) ($ $)) (|minus_SI| |x|)) 

(PUT '|SINT;+;3$;26| '|SPADreplace| '|add_SI|) 

(SDEFUN |SINT;+;3$;26| ((|x| $) (|y| $) ($ $)) (|add_SI| |x| |y|)) 

(PUT '|SINT;-;3$;27| '|SPADreplace| '|sub_SI|) 

(SDEFUN |SINT;-;3$;27| ((|x| $) (|y| $) ($ $)) (|sub_SI| |x| |y|)) 

(PUT '|SINT;*;3$;28| '|SPADreplace| '|mul_SI|) 

(SDEFUN |SINT;*;3$;28| ((|x| $) (|y| $) ($ $)) (|mul_SI| |x| |y|)) 

(SDEFUN |SINT;^;$Nni$;29| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL (EXPT |x| |n|) (QREFELT $ 26))) 

(PUT '|SINT;quo;3$;30| '|SPADreplace| '|quo_SI|) 

(SDEFUN |SINT;quo;3$;30| ((|x| $) (|y| $) ($ $)) (|quo_SI| |x| |y|)) 

(PUT '|SINT;rem;3$;31| '|SPADreplace| '|rem_SI|) 

(SDEFUN |SINT;rem;3$;31| ((|x| $) (|y| $) ($ $)) (|rem_SI| |x| |y|)) 

(SDEFUN |SINT;divide;2$R;32|
        ((|x| $) (|y| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (CONS (|quo_SI| |x| |y|) (|rem_SI| |x| |y|))) 

(PUT '|SINT;gcd;3$;33| '|SPADreplace| 'GCD) 

(SDEFUN |SINT;gcd;3$;33| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(PUT '|SINT;abs;2$;34| '|SPADreplace| '|abs_SI|) 

(SDEFUN |SINT;abs;2$;34| ((|x| $) ($ $)) (|abs_SI| |x|)) 

(PUT '|SINT;odd?;$B;35| '|SPADreplace| '|odd?_SI|) 

(SDEFUN |SINT;odd?;$B;35| ((|x| $) ($ |Boolean|)) (|odd?_SI| |x|)) 

(PUT '|SINT;zero?;$B;36| '|SPADreplace| '|zero?_SI|) 

(SDEFUN |SINT;zero?;$B;36| ((|x| $) ($ |Boolean|)) (|zero?_SI| |x|)) 

(PUT '|SINT;one?;$B;37| '|SPADreplace| '(XLAM (|x|) (|eql_SI| |x| 1))) 

(SDEFUN |SINT;one?;$B;37| ((|x| $) ($ |Boolean|)) (|eql_SI| |x| 1)) 

(PUT '|SINT;max;3$;38| '|SPADreplace| '|max_SI|) 

(SDEFUN |SINT;max;3$;38| ((|x| $) (|y| $) ($ $)) (|max_SI| |x| |y|)) 

(PUT '|SINT;min;3$;39| '|SPADreplace| '|min_SI|) 

(SDEFUN |SINT;min;3$;39| ((|x| $) (|y| $) ($ $)) (|min_SI| |x| |y|)) 

(SDEFUN |SINT;hashUpdate!;Hs$Hs;40|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|SINT;length;2$;41| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |SINT;length;2$;41| ((|x| $) ($ $)) (INTEGER-LENGTH |x|)) 

(PUT '|SINT;shift;3$;42| '|SPADreplace| '|lshift_SI|) 

(SDEFUN |SINT;shift;3$;42| ((|x| $) (|n| $) ($ $)) (|lshift_SI| |x| |n|)) 

(PUT '|SINT;mulmod;4$;43| '|SPADreplace| '|mulmod_SI|) 

(SDEFUN |SINT;mulmod;4$;43| ((|a| $) (|b| $) (|p| $) ($ $))
        (|mulmod_SI| |a| |b| |p|)) 

(PUT '|SINT;addmod;4$;44| '|SPADreplace| '|addmod_SI|) 

(SDEFUN |SINT;addmod;4$;44| ((|a| $) (|b| $) (|p| $) ($ $))
        (|addmod_SI| |a| |b| |p|)) 

(PUT '|SINT;submod;4$;45| '|SPADreplace| '|submod_SI|) 

(SDEFUN |SINT;submod;4$;45| ((|a| $) (|b| $) (|p| $) ($ $))
        (|submod_SI| |a| |b| |p|)) 

(PUT '|SINT;negative?;$B;46| '|SPADreplace| '|negative?_SI|) 

(SDEFUN |SINT;negative?;$B;46| ((|x| $) ($ |Boolean|)) (|negative?_SI| |x|)) 

(PUT '|SINT;reducedSystem;MVR;47| '|SPADreplace| 'CONS) 

(SDEFUN |SINT;reducedSystem;MVR;47|
        ((|m| |Matrix| $) (|v| |Vector| $)
         ($ |Record| (|:| |mat| (|Matrix| #1=(|Integer|)))
          (|:| |vec| (|Vector| #1#))))
        (CONS |m| |v|)) 

(SDEFUN |SINT;positiveRemainder;3$;48| ((|x| $) (|n| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (LETT |r| (|rem_SI| |x| |n|) |SINT;positiveRemainder;3$;48|)
                (EXIT
                 (COND
                  ((|negative?_SI| |r|)
                   (COND ((|negative?_SI| |n|) (|sub_SI| |x| |n|))
                         (#1='T (|add_SI| |r| |n|))))
                  (#1# |r|)))))) 

(PUT '|SINT;qconvert;I$;49| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;qconvert;I$;49| ((|x| |Integer|) ($ $)) |x|) 

(SDEFUN |SINT;coerce;I$;50| ((|x| |Integer|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| MOST-POSITIVE-FIXNUM (QREFELT $ 75))
           (COND ((>= |x| MOST-NEGATIVE-FIXNUM) (EXIT |x|)))))
         (EXIT (|error| "integer too large to represent in a machine word")))) 

(PUT '|SINT;random;2$;51| '|SPADreplace| 'RANDOM) 

(SDEFUN |SINT;random;2$;51| ((|n| $) ($ $)) (RANDOM |n|)) 

(SDEFUN |SINT;unitNormal;$R;52|
        ((|x| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (COND ((|less_SI| |x| 0) (VECTOR -1 (|minus_SI| |x|) -1))
              ('T (VECTOR 1 |x| 1)))) 

(DECLAIM (NOTINLINE |SingleInteger;|)) 

(DEFUN |SingleInteger| ()
  (SPROG NIL
         (PROG (#1=#:G2546)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SingleInteger|)
                    . #2=(|SingleInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SingleInteger|
                             (LIST (CONS NIL (CONS 1 (|SingleInteger;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|SingleInteger|)))))))))) 

(DEFUN |SingleInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SingleInteger|) . #1=(|SingleInteger|))
          (LETT $ (GETREFV 100) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SingleInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SingleInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) |SINT;OMwrite;Omd$BV;2|
              (|Matrix| 11) (|Matrix| $) |SINT;reducedSystem;MM;3|
              (|OutputForm|) (33 . |coerce|) |SINT;coerce;$Of;4|
              |SINT;convert;$I;5| |SINT;convert;$S;6| (38 . |coerce|)
              |SINT;*;I2$;7|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;Zero;$;8|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;One;$;9|) $))
              |SINT;base;$;10| |SINT;max;$;11| |SINT;min;$;12| |SINT;=;2$B;13|
              |SINT;~;2$;14| |SINT;not;2$;15| |SINT;/\\;3$;16| |SINT;\\/;3$;17|
              |SINT;Not;2$;18| |SINT;And;3$;19| |SINT;Or;3$;20|
              |SINT;xor;3$;21| |SINT;<;2$B;22| |SINT;inc;2$;23|
              |SINT;dec;2$;24| |SINT;-;2$;25| |SINT;+;3$;26| |SINT;-;3$;27|
              |SINT;*;3$;28| (|NonNegativeInteger|) |SINT;^;$Nni$;29|
              |SINT;quo;3$;30| |SINT;rem;3$;31|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SINT;divide;2$R;32| |SINT;gcd;3$;33| |SINT;abs;2$;34|
              |SINT;odd?;$B;35| |SINT;zero?;$B;36| |SINT;one?;$B;37|
              |SINT;max;3$;38| |SINT;min;3$;39| (|HashState|)
              |SINT;hashUpdate!;Hs$Hs;40| |SINT;length;2$;41|
              |SINT;shift;3$;42| |SINT;mulmod;4$;43| |SINT;addmod;4$;44|
              |SINT;submod;4$;45| |SINT;negative?;$B;46|
              (|Record| (|:| |mat| 18) (|:| |vec| (|Vector| 11))) (|Vector| $)
              |SINT;reducedSystem;MVR;47| |SINT;positiveRemainder;3$;48|
              |SINT;qconvert;I$;49| (43 . <=) |SINT;coerce;I$;50|
              |SINT;random;2$;51|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |SINT;unitNormal;$R;52| (|Fraction| 11) (|Union| 80 '"failed")
              (|Union| $ '"failed") (|Float|) (|DoubleFloat|)
              (|PatternMatchResult| 11 $) (|Pattern| 11) (|InputForm|)
              (|Union| 11 '"failed") (|Union| 90 '"failed") (|List| $)
              (|Record| (|:| |coef| 90) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 92 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 49 ~ 55 |zero?| 60 |xor| 65 |unitNormal| 71 |unitCanonical| 76
              |unit?| 81 |symmetricRemainder| 86 |subtractIfCan| 92 |submod| 98
              |squareFreePart| 105 |squareFree| 110 |smaller?| 115 |sizeLess?|
              121 |sign| 127 |shift| 132 |sample| 138 |retractIfCan| 142
              |retract| 147 |rem| 152 |reducedSystem| 158 |recip| 169
              |rationalIfCan| 174 |rational?| 179 |rational| 184 |random| 189
              |quo| 194 |qconvert| 200 |principalIdeal| 205 |prime?| 210
              |powmod| 215 |positiveRemainder| 222 |positive?| 228
              |permutation| 233 |patternMatch| 239 |opposite?| 246 |one?| 252
              |odd?| 257 |not| 262 |nextItem| 267 |negative?| 272
              |multiEuclidean| 277 |mulmod| 283 |min| 290 |max| 300 |mask| 310
              |length| 315 |lcmCoef| 320 |lcm| 326 |latex| 337 |invmod| 342
              |init| 348 |inc| 352 |hashUpdate!| 357 |hash| 363 |gcdPolynomial|
              368 |gcd| 374 |factorial| 385 |factor| 390 |extendedEuclidean|
              395 |exquo| 408 |expressIdealMember| 414 |even?| 420
              |euclideanSize| 425 |divide| 430 |differentiate| 436 |dec| 447
              |copy| 452 |convert| 457 |coerce| 487 |characteristic| 507 |bit?|
              511 |binomial| 517 |base| 523 |associates?| 527 |annihilate?| 533
              |addmod| 539 |abs| 546 |_\|_| 551 ^ 555 |\\/| 567 |Zero| 573 T$
              577 |Or| 581 |One| 587 |OMwrite| 591 |Not| 615 D 620 |And| 631 >=
              637 > 643 = 649 <= 655 < 661 |/\\| 667 - 673 + 684 * 690)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL |Algebra&| NIL |DifferentialRing&| NIL NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL NIL |Rng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL NIL NIL NIL
                |OrderedSet&| |AbelianMonoid&| |Monoid&| NIL NIL NIL NIL NIL
                NIL |SemiGroup&| |AbelianSemiGroup&| NIL |SetCategory&| NIL NIL
                |OpenMath&| NIL NIL NIL NIL NIL NIL NIL NIL |RetractableTo&|
                NIL |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|Algebra| $$)
                 (|LinearlyExplicitOver| 11) (|DifferentialRing|)
                 (|CharacteristicZero|) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|Logic|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|BoundedDistributiveLattice|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|DistributiveLattice|) (|BoundedLattice|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|Lattice|) (|BoundedJoinSemilattice|)
                 (|BoundedMeetSemilattice|) (|OrderedSet|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|JoinSemilattice|) (|MeetSemilattice|)
                 (|StepThrough|) (|PatternMatchable| 11) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|RealConstant|)
                 (|SetCategory|) (|canonicalsClosed|) (|Canonical|)
                 (|OpenMath|) (|ConvertibleTo| 9) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 83)
                 (|ConvertibleTo| 84) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 86) (|ConvertibleTo| 87) (|RetractableTo| 11)
                 (|ConvertibleTo| 11) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 21))
              (|makeByteWordVec2| 99
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 11 21 0 22 1
                                    0 0 11 26 2 11 16 0 0 75 2 0 16 0 0 1 1 0 0
                                    0 34 1 0 16 0 58 2 0 0 0 0 41 1 0 78 0 79 1
                                    0 0 0 1 1 0 16 0 1 2 0 0 0 0 1 2 0 82 0 0 1
                                    3 0 0 0 0 0 68 1 0 0 0 1 1 0 95 0 1 2 0 16
                                    0 0 1 2 0 16 0 0 1 1 0 11 0 1 2 0 0 0 0 65
                                    0 0 0 1 1 0 88 0 1 1 0 11 0 1 2 0 0 0 0 52
                                    2 0 70 19 71 72 1 0 18 19 20 1 0 82 0 1 1 0
                                    81 0 1 1 0 16 0 1 1 0 80 0 1 1 0 0 0 77 2 0
                                    0 0 0 51 1 0 0 11 74 1 0 91 90 1 1 0 16 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 73 1 0 16 0 1 2 0 0
                                    0 0 1 3 0 85 0 86 85 1 2 0 16 0 0 1 1 0 16
                                    0 59 1 0 16 0 57 1 0 0 0 35 1 0 82 0 1 1 0
                                    16 0 69 2 0 89 90 0 1 3 0 0 0 0 0 66 0 0 0
                                    32 2 0 0 0 0 61 0 0 0 31 2 0 0 0 0 60 1 0 0
                                    0 1 1 0 0 0 64 2 0 97 0 0 1 2 0 0 0 0 1 1 0
                                    0 90 1 1 0 9 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0
                                    0 43 2 0 62 62 0 63 1 0 99 0 1 2 0 96 96 96
                                    1 2 0 0 0 0 55 1 0 0 90 1 1 0 0 0 1 1 0 95
                                    0 1 3 0 93 0 0 0 1 2 0 94 0 0 1 2 0 82 0 0
                                    1 2 0 89 90 0 1 1 0 16 0 1 1 0 49 0 1 2 0
                                    53 0 0 54 1 0 0 0 1 2 0 0 0 49 1 1 0 0 0 44
                                    1 0 0 0 1 1 0 9 0 25 1 0 83 0 1 1 0 84 0 1
                                    1 0 87 0 1 1 0 86 0 1 1 0 11 0 24 1 0 0 11
                                    76 1 0 0 0 1 1 0 0 11 76 1 0 21 0 23 0 0 49
                                    1 2 0 16 0 0 1 2 0 0 0 0 1 0 0 0 30 2 0 16
                                    0 0 1 2 0 16 0 0 1 3 0 0 0 0 0 67 1 0 0 0
                                    56 0 0 0 1 2 0 0 0 49 50 2 0 0 0 98 1 2 0 0
                                    0 0 37 0 0 0 28 0 0 0 1 2 0 0 0 0 40 0 0 0
                                    29 3 0 6 7 0 16 17 2 0 9 0 16 1 2 0 6 7 0 1
                                    1 0 9 0 1 1 0 0 0 38 1 0 0 0 1 2 0 0 0 49 1
                                    2 0 0 0 0 39 2 0 16 0 0 1 2 0 16 0 0 1 2 0
                                    16 0 0 33 2 0 16 0 0 1 2 0 16 0 0 42 2 0 0
                                    0 0 36 1 0 0 0 45 2 0 0 0 0 47 2 0 0 0 0 46
                                    2 0 0 11 0 27 2 0 0 0 0 48 2 0 0 49 0 1 2 0
                                    0 98 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SingleInteger| 'NILADIC T) 
