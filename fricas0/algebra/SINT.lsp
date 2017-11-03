
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

(SDEFUN |SINT;coerce;$Of;3| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 19))) 

(PUT '|SINT;convert;$I;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;convert;$I;4| ((|x| $) ($ |Integer|)) |x|) 

(PUT '|SINT;convert;$S;5| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |SINT;convert;$S;5| ((|x| $) ($ |String|)) (STRINGIMAGE |x|)) 

(SDEFUN |SINT;*;I2$;6| ((|i| |Integer|) (|y| $) ($ $))
        (|mul_SI| (SPADCALL |i| (QREFELT $ 23)) |y|)) 

(PUT '|SINT;Zero;$;7| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |SINT;Zero;$;7| (($ $)) 0) 

(PUT '|SINT;One;$;8| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |SINT;One;$;8| (($ $)) 1) 

(PUT '|SINT;base;$;9| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |SINT;base;$;9| (($ $)) 2) 

(PUT '|SINT;max;$;10| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-FIXNUM)) 

(SDEFUN |SINT;max;$;10| (($ $)) MOST-POSITIVE-FIXNUM) 

(PUT '|SINT;min;$;11| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-FIXNUM)) 

(SDEFUN |SINT;min;$;11| (($ $)) MOST-NEGATIVE-FIXNUM) 

(PUT '|SINT;=;2$B;12| '|SPADreplace| '|eql_SI|) 

(SDEFUN |SINT;=;2$B;12| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_SI| |x| |y|)) 

(PUT '|SINT;~;2$;13| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;~;2$;13| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;not;2$;14| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;not;2$;14| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;/\\;3$;15| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;/\\;3$;15| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;\\/;3$;16| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;\\/;3$;16| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;Not;2$;17| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;Not;2$;17| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;And;3$;18| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;And;3$;18| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;Or;3$;19| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;Or;3$;19| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;xor;3$;20| '|SPADreplace| '|xor_SI|) 

(SDEFUN |SINT;xor;3$;20| ((|x| $) (|y| $) ($ $)) (|xor_SI| |x| |y|)) 

(PUT '|SINT;<;2$B;21| '|SPADreplace| '|less_SI|) 

(SDEFUN |SINT;<;2$B;21| ((|x| $) (|y| $) ($ |Boolean|)) (|less_SI| |x| |y|)) 

(PUT '|SINT;inc;2$;22| '|SPADreplace| '|inc_SI|) 

(SDEFUN |SINT;inc;2$;22| ((|x| $) ($ $)) (|inc_SI| |x|)) 

(PUT '|SINT;dec;2$;23| '|SPADreplace| '|dec_SI|) 

(SDEFUN |SINT;dec;2$;23| ((|x| $) ($ $)) (|dec_SI| |x|)) 

(PUT '|SINT;-;2$;24| '|SPADreplace| '|minus_SI|) 

(SDEFUN |SINT;-;2$;24| ((|x| $) ($ $)) (|minus_SI| |x|)) 

(PUT '|SINT;+;3$;25| '|SPADreplace| '|add_SI|) 

(SDEFUN |SINT;+;3$;25| ((|x| $) (|y| $) ($ $)) (|add_SI| |x| |y|)) 

(PUT '|SINT;-;3$;26| '|SPADreplace| '|sub_SI|) 

(SDEFUN |SINT;-;3$;26| ((|x| $) (|y| $) ($ $)) (|sub_SI| |x| |y|)) 

(PUT '|SINT;*;3$;27| '|SPADreplace| '|mul_SI|) 

(SDEFUN |SINT;*;3$;27| ((|x| $) (|y| $) ($ $)) (|mul_SI| |x| |y|)) 

(SDEFUN |SINT;^;$Nni$;28| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL (EXPT |x| |n|) (QREFELT $ 23))) 

(PUT '|SINT;quo;3$;29| '|SPADreplace| '|quo_SI|) 

(SDEFUN |SINT;quo;3$;29| ((|x| $) (|y| $) ($ $)) (|quo_SI| |x| |y|)) 

(PUT '|SINT;rem;3$;30| '|SPADreplace| '|rem_SI|) 

(SDEFUN |SINT;rem;3$;30| ((|x| $) (|y| $) ($ $)) (|rem_SI| |x| |y|)) 

(SDEFUN |SINT;divide;2$R;31|
        ((|x| $) (|y| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (CONS (|quo_SI| |x| |y|) (|rem_SI| |x| |y|))) 

(PUT '|SINT;gcd;3$;32| '|SPADreplace| 'GCD) 

(SDEFUN |SINT;gcd;3$;32| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(PUT '|SINT;abs;2$;33| '|SPADreplace| '|abs_SI|) 

(SDEFUN |SINT;abs;2$;33| ((|x| $) ($ $)) (|abs_SI| |x|)) 

(PUT '|SINT;odd?;$B;34| '|SPADreplace| '|odd?_SI|) 

(SDEFUN |SINT;odd?;$B;34| ((|x| $) ($ |Boolean|)) (|odd?_SI| |x|)) 

(PUT '|SINT;zero?;$B;35| '|SPADreplace| '|zero?_SI|) 

(SDEFUN |SINT;zero?;$B;35| ((|x| $) ($ |Boolean|)) (|zero?_SI| |x|)) 

(PUT '|SINT;one?;$B;36| '|SPADreplace| '(XLAM (|x|) (|eql_SI| |x| 1))) 

(SDEFUN |SINT;one?;$B;36| ((|x| $) ($ |Boolean|)) (|eql_SI| |x| 1)) 

(PUT '|SINT;max;3$;37| '|SPADreplace| '|max_SI|) 

(SDEFUN |SINT;max;3$;37| ((|x| $) (|y| $) ($ $)) (|max_SI| |x| |y|)) 

(PUT '|SINT;min;3$;38| '|SPADreplace| '|min_SI|) 

(SDEFUN |SINT;min;3$;38| ((|x| $) (|y| $) ($ $)) (|min_SI| |x| |y|)) 

(SDEFUN |SINT;hashUpdate!;Hs$Hs;39|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|SINT;length;2$;40| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |SINT;length;2$;40| ((|x| $) ($ $)) (INTEGER-LENGTH |x|)) 

(PUT '|SINT;shift;3$;41| '|SPADreplace| '|lshift_SI|) 

(SDEFUN |SINT;shift;3$;41| ((|x| $) (|n| $) ($ $)) (|lshift_SI| |x| |n|)) 

(PUT '|SINT;mulmod;4$;42| '|SPADreplace| '|mulmod_SI|) 

(SDEFUN |SINT;mulmod;4$;42| ((|a| $) (|b| $) (|p| $) ($ $))
        (|mulmod_SI| |a| |b| |p|)) 

(PUT '|SINT;addmod;4$;43| '|SPADreplace| '|addmod_SI|) 

(SDEFUN |SINT;addmod;4$;43| ((|a| $) (|b| $) (|p| $) ($ $))
        (|addmod_SI| |a| |b| |p|)) 

(PUT '|SINT;submod;4$;44| '|SPADreplace| '|submod_SI|) 

(SDEFUN |SINT;submod;4$;44| ((|a| $) (|b| $) (|p| $) ($ $))
        (|submod_SI| |a| |b| |p|)) 

(PUT '|SINT;negative?;$B;45| '|SPADreplace| '|negative?_SI|) 

(SDEFUN |SINT;negative?;$B;45| ((|x| $) ($ |Boolean|)) (|negative?_SI| |x|)) 

(SDEFUN |SINT;positiveRemainder;3$;46| ((|x| $) (|n| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (LETT |r| (|rem_SI| |x| |n|) |SINT;positiveRemainder;3$;46|)
                (EXIT
                 (COND
                  ((|negative?_SI| |r|)
                   (COND ((|negative?_SI| |n|) (|sub_SI| |x| |n|))
                         (#1='T (|add_SI| |r| |n|))))
                  (#1# |r|)))))) 

(PUT '|SINT;qconvert;I$;47| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;qconvert;I$;47| ((|x| |Integer|) ($ $)) |x|) 

(SDEFUN |SINT;coerce;I$;48| ((|x| |Integer|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| MOST-POSITIVE-FIXNUM (QREFELT $ 69))
           (COND ((>= |x| MOST-NEGATIVE-FIXNUM) (EXIT |x|)))))
         (EXIT (|error| "integer too large to represent in a machine word")))) 

(PUT '|SINT;random;2$;49| '|SPADreplace| 'RANDOM) 

(SDEFUN |SINT;random;2$;49| ((|n| $) ($ $)) (RANDOM |n|)) 

(SDEFUN |SINT;unitNormal;$R;50|
        ((|x| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (COND ((|less_SI| |x| 0) (VECTOR -1 (|minus_SI| |x|) -1))
              ('T (VECTOR 1 |x| 1)))) 

(DECLAIM (NOTINLINE |SingleInteger;|)) 

(DEFUN |SingleInteger| ()
  (SPROG NIL
         (PROG (#1=#:G2545)
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
          (LETT $ (GETREFV 94) . #1#)
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
              (|OutputForm|) (33 . |coerce|) |SINT;coerce;$Of;3|
              |SINT;convert;$I;4| |SINT;convert;$S;5| (38 . |coerce|)
              |SINT;*;I2$;6|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;Zero;$;7|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;One;$;8|) $))
              |SINT;base;$;9| |SINT;max;$;10| |SINT;min;$;11| |SINT;=;2$B;12|
              |SINT;~;2$;13| |SINT;not;2$;14| |SINT;/\\;3$;15| |SINT;\\/;3$;16|
              |SINT;Not;2$;17| |SINT;And;3$;18| |SINT;Or;3$;19|
              |SINT;xor;3$;20| |SINT;<;2$B;21| |SINT;inc;2$;22|
              |SINT;dec;2$;23| |SINT;-;2$;24| |SINT;+;3$;25| |SINT;-;3$;26|
              |SINT;*;3$;27| (|NonNegativeInteger|) |SINT;^;$Nni$;28|
              |SINT;quo;3$;29| |SINT;rem;3$;30|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SINT;divide;2$R;31| |SINT;gcd;3$;32| |SINT;abs;2$;33|
              |SINT;odd?;$B;34| |SINT;zero?;$B;35| |SINT;one?;$B;36|
              |SINT;max;3$;37| |SINT;min;3$;38| (|HashState|)
              |SINT;hashUpdate!;Hs$Hs;39| |SINT;length;2$;40|
              |SINT;shift;3$;41| |SINT;mulmod;4$;42| |SINT;addmod;4$;43|
              |SINT;submod;4$;44| |SINT;negative?;$B;45|
              |SINT;positiveRemainder;3$;46| |SINT;qconvert;I$;47| (43 . <=)
              |SINT;coerce;I$;48| |SINT;random;2$;49|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |SINT;unitNormal;$R;50| (|Fraction| 11) (|Union| 74 '"failed")
              (|DoubleFloat|) (|Union| $ '"failed") (|Float|) (|Pattern| 11)
              (|PatternMatchResult| 11 $) (|InputForm|) (|Union| 11 '"failed")
              (|Record| (|:| |coef| 84) (|:| |generator| $)) (|List| $)
              (|Union| 84 '"failed") (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 86 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 49 ~ 55 |zero?| 60 |xor| 65 |unitNormal| 71 |unitCanonical| 76
              |unit?| 81 |true| 86 |symmetricRemainder| 90 |subtractIfCan| 96
              |submod| 102 |squareFreePart| 109 |squareFree| 114 |smaller?| 119
              |sizeLess?| 125 |sign| 131 |shift| 136 |sample| 142 |rightRecip|
              146 |rightPower| 151 |retractIfCan| 163 |retract| 168 |rem| 173
              |recip| 179 |rationalIfCan| 184 |rational?| 189 |rational| 194
              |random| 199 |quo| 204 |qconvert| 210 |principalIdeal| 215
              |prime?| 220 |powmod| 225 |positiveRemainder| 232 |positive?| 238
              |permutation| 243 |patternMatch| 249 |opposite?| 256 |one?| 262
              |odd?| 267 |not| 272 |nextItem| 277 |negative?| 282
              |multiEuclidean| 287 |mulmod| 293 |min| 300 |max| 310 |mask| 320
              |length| 325 |leftRecip| 330 |leftPower| 335 |lcmCoef| 347 |lcm|
              353 |latex| 364 |invmod| 369 |init| 375 |inc| 379 |hashUpdate!|
              384 |hash| 390 |gcdPolynomial| 395 |gcd| 401 |false| 412
              |factorial| 416 |factor| 421 |extendedEuclidean| 426 |exquo| 439
              |expressIdealMember| 445 |even?| 451 |euclideanSize| 456 |divide|
              461 |differentiate| 467 |dec| 478 |copy| 483 |convert| 488
              |commutator| 518 |coerce| 524 |characteristic| 539 |bit?| 543
              |binomial| 549 |base| 555 |associator| 559 |associates?| 566
              |antiCommutator| 572 |annihilate?| 578 |addmod| 584 |abs| 591
              |_\|_| 596 ^ 600 |\\/| 612 |Zero| 618 T$ 622 |Or| 626 |One| 632
              |OMwrite| 636 |Not| 660 D 665 |And| 676 >= 682 > 688 = 694 <= 700
              < 706 |/\\| 712 - 718 + 729 * 735)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DifferentialRing&| NIL |EntireRing&|
                |Algebra&| NIL |Rng&| NIL |Module&| NIL NIL NIL
                |NonAssociativeRing&| |Logic&| NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |OrderedSet&| NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| NIL NIL NIL NIL NIL |Magma&|
                |AbelianSemiGroup&| NIL |SetCategory&| NIL NIL |OpenMath&| NIL
                NIL NIL NIL NIL NIL NIL NIL |RetractableTo&| NIL
                |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|DifferentialRing|) (|CharacteristicZero|) (|EntireRing|)
                 (|Algebra| $$) (|Ring|) (|Rng|) (|SemiRing|) (|Module| $$)
                 (|SemiRng|) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|Logic|)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|RightModule| $$)
                 (|BoundedDistributiveLattice|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|DistributiveLattice|) (|BoundedLattice|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|Lattice|) (|BoundedJoinSemilattice|)
                 (|BoundedMeetSemilattice|) (|OrderedSet|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|JoinSemilattice|) (|MeetSemilattice|) (|StepThrough|)
                 (|PatternMatchable| 11) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|RealConstant|) (|SetCategory|)
                 (|canonicalsClosed|) (|Canonical|) (|OpenMath|)
                 (|ConvertibleTo| 9) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 78)
                 (|ConvertibleTo| 76) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 79) (|ConvertibleTo| 81) (|RetractableTo| 11)
                 (|ConvertibleTo| 11) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 18))
              (|makeByteWordVec2| 93
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 11 18 0 19 1
                                    0 0 11 23 2 11 16 0 0 69 2 0 16 0 0 1 1 0 0
                                    0 31 1 0 16 0 55 2 0 0 0 0 38 1 0 72 0 73 1
                                    0 0 0 1 1 0 16 0 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    77 0 0 1 3 0 0 0 0 0 65 1 0 0 0 1 1 0 89 0
                                    1 2 0 16 0 0 1 2 0 16 0 0 1 1 0 11 0 1 2 0
                                    0 0 0 62 0 0 0 1 1 0 77 0 1 2 0 0 0 46 1 2
                                    0 0 0 92 1 1 0 82 0 1 1 0 11 0 1 2 0 0 0 0
                                    49 1 0 77 0 1 1 0 75 0 1 1 0 16 0 1 1 0 74
                                    0 1 1 0 0 0 71 2 0 0 0 0 48 1 0 0 11 68 1 0
                                    83 84 1 1 0 16 0 1 3 0 0 0 0 0 1 2 0 0 0 0
                                    67 1 0 16 0 1 2 0 0 0 0 1 3 0 80 0 79 80 1
                                    2 0 16 0 0 1 1 0 16 0 56 1 0 16 0 54 1 0 0
                                    0 32 1 0 77 0 1 1 0 16 0 66 2 0 85 84 0 1 3
                                    0 0 0 0 0 63 0 0 0 29 2 0 0 0 0 58 0 0 0 28
                                    2 0 0 0 0 57 1 0 0 0 1 1 0 0 0 61 1 0 77 0
                                    1 2 0 0 0 46 1 2 0 0 0 92 1 2 0 91 0 0 1 2
                                    0 0 0 0 1 1 0 0 84 1 1 0 9 0 1 2 0 0 0 0 1
                                    0 0 0 1 1 0 0 0 40 2 0 59 59 0 60 1 0 93 0
                                    1 2 0 90 90 90 1 2 0 0 0 0 52 1 0 0 84 1 0
                                    0 0 1 1 0 0 0 1 1 0 89 0 1 3 0 87 0 0 0 1 2
                                    0 88 0 0 1 2 0 77 0 0 1 2 0 85 84 0 1 1 0
                                    16 0 1 1 0 46 0 1 2 0 50 0 0 51 1 0 0 0 1 2
                                    0 0 0 46 1 1 0 0 0 41 1 0 0 0 1 1 0 9 0 22
                                    1 0 76 0 1 1 0 78 0 1 1 0 79 0 1 1 0 81 0 1
                                    1 0 11 0 21 2 0 0 0 0 1 1 0 0 11 70 1 0 0 0
                                    1 1 0 18 0 20 0 0 46 1 2 0 16 0 0 1 2 0 0 0
                                    0 1 0 0 0 27 3 0 0 0 0 0 1 2 0 16 0 0 1 2 0
                                    0 0 0 1 2 0 16 0 0 1 3 0 0 0 0 0 64 1 0 0 0
                                    53 0 0 0 1 2 0 0 0 46 47 2 0 0 0 92 1 2 0 0
                                    0 0 34 0 0 0 25 0 0 0 1 2 0 0 0 0 37 0 0 0
                                    26 2 0 6 7 0 1 3 0 6 7 0 16 17 1 0 9 0 1 2
                                    0 9 0 16 1 1 0 0 0 35 1 0 0 0 1 2 0 0 0 46
                                    1 2 0 0 0 0 36 2 0 16 0 0 1 2 0 16 0 0 1 2
                                    0 16 0 0 30 2 0 16 0 0 1 2 0 16 0 0 39 2 0
                                    0 0 0 33 1 0 0 0 42 2 0 0 0 0 44 2 0 0 0 0
                                    43 2 0 0 46 0 1 2 0 0 11 0 24 2 0 0 0 0 45
                                    2 0 0 92 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SingleInteger| 'NILADIC T) 
