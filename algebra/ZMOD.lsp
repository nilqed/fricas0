
(SDEFUN |ZMOD;size;Nni;1| ((% (|NonNegativeInteger|))) (QREFELT % 6)) 

(SDEFUN |ZMOD;characteristic;Nni;2| ((% (|NonNegativeInteger|))) (QREFELT % 6)) 

(SDEFUN |ZMOD;lookup;%Pi;3| ((|x| (%)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G6 NIL))
               (COND ((SPADCALL |x| (QREFELT % 11)) (QREFELT % 6))
                     ('T
                      (PROG1 (LETT #1# (SPADCALL |x| (QREFELT % 13)))
                        (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                          '(|Integer|) #1#)))))) 

(SDEFUN |ZMOD;bloodyCompiler| ((|n| (|Integer|)) (% (%)))
        (SPADCALL |n| (QREFELT % 6) (QREFELT % 21))) 

(PUT '|ZMOD;convert;%I;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |ZMOD;convert;%I;5| ((|x| (%)) (% (|Integer|))) |x|) 

(SDEFUN |ZMOD;coerce;%Of;6| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 23))) 

(SDEFUN |ZMOD;coerce;I%;7| ((|n| (|Integer|)) (% (%)))
        (|ZMOD;bloodyCompiler| |n| %)) 

(PUT '|ZMOD;Zero;%;8| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |ZMOD;Zero;%;8| ((% (%))) 0) 

(PUT '|ZMOD;One;%;9| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |ZMOD;One;%;9| ((% (%))) 1) 

(PUT '|ZMOD;init;%;10| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |ZMOD;init;%;10| ((% (%))) 0) 

(SDEFUN |ZMOD;nextItem;%U;11| ((|n| (%)) (% (|Union| % "failed")))
        (SPROG ((|m| (%)))
               (SEQ
                (LETT |m| (SPADCALL |n| (|spadConstant| % 27) (QREFELT % 29)))
                (EXIT
                 (COND
                  ((SPADCALL |m| (|spadConstant| % 26) (QREFELT % 30))
                   (CONS 1 "failed"))
                  ('T (CONS 0 |m|))))))) 

(PUT '|ZMOD;=;2%B;12| '|SPADreplace| '|eql_SI|) 

(SDEFUN |ZMOD;=;2%B;12| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (|eql_SI| |x| |y|)) 

(SDEFUN |ZMOD;*;3%;13| ((|x| (%)) (|y| (%)) (% (%)))
        (|mulmod_SI| |x| |y| (QREFELT % 20))) 

(SDEFUN |ZMOD;*;I2%;14| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (|mulmod_SI| (|ZMOD;bloodyCompiler| |n| %) |x| (QREFELT % 20))) 

(SDEFUN |ZMOD;+;3%;15| ((|x| (%)) (|y| (%)) (% (%)))
        (|addmod_SI| |x| |y| (QREFELT % 20))) 

(SDEFUN |ZMOD;-;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (|submod_SI| |x| |y| (QREFELT % 20))) 

(SDEFUN |ZMOD;random;%;17| ((% (%))) (RANDOM (QREFELT % 20))) 

(SDEFUN |ZMOD;index;Pi%;18| ((|a| (|PositiveInteger|)) (% (%)))
        (SPADCALL (SPADCALL |a| (QREFELT % 25)) (QREFELT % 20) (QREFELT % 37))) 

(SDEFUN |ZMOD;-;2%;19| ((|x| (%)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 11)) (|spadConstant| % 26))
              ('T (|sub_SI| (QREFELT % 20) |x|)))) 

(SDEFUN |ZMOD;^;%Nni%;20| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND
         ((< |n| (QREFELT % 6))
          (SPADCALL |x| (SPADCALL |n| (QREFELT % 25)) (QREFELT % 20)
                    (QREFELT % 40)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (QREFELT % 13)) |n| (QREFELT % 6)
                     (QREFELT % 41))
           (QREFELT % 25))))) 

(SDEFUN |ZMOD;recip;%U;21| ((|x| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|g| (%)) (|c2| (%)) (|c1| (%))
          (|#G24|
           (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))))
         (SEQ
          (PROGN
           (LETT |#G24| (SPADCALL |x| (QREFELT % 20) (QREFELT % 44)))
           (LETT |c1| (QVELT |#G24| 0))
           (LETT |c2| (QVELT |#G24| 1))
           (LETT |g| (QVELT |#G24| 2))
           |#G24|)
          (EXIT
           (COND
            ((SPADCALL |g| (|spadConstant| % 27) (QREFELT % 30))
             (CONS 0 (SPADCALL |c1| (QREFELT % 20) (QREFELT % 37))))
            ('T (CONS 1 "failed"))))))) 

(PUT '|ZMOD;hashUpdate!;Hs%Hs;22| '|SPADreplace| 'HASHSTATEUPDATE) 

(SDEFUN |ZMOD;hashUpdate!;Hs%Hs;22| ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| |s|)) 

(PUT '|ZMOD;smaller?;2%B;23| '|SPADreplace| '|less_SI|) 

(SDEFUN |ZMOD;smaller?;2%B;23| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (|less_SI| |x| |y|)) 

(PUT '|ZMOD;convert;%I;24| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |ZMOD;convert;%I;24| ((|x| (%)) (% (|Integer|))) |x|) 

(SDEFUN |ZMOD;coerce;I%;25| ((|n| (|Integer|)) (% (%)))
        (SPADCALL |n| (QREFELT % 6) (QREFELT % 37))) 

(SDEFUN |ZMOD;coerce;%Of;26| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 23))) 

(PUT '|ZMOD;Zero;%;27| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |ZMOD;Zero;%;27| ((% (%))) 0) 

(PUT '|ZMOD;One;%;28| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |ZMOD;One;%;28| ((% (%))) 1) 

(PUT '|ZMOD;init;%;29| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |ZMOD;init;%;29| ((% (%))) 0) 

(SDEFUN |ZMOD;nextItem;%U;30| ((|n| (%)) (% (|Union| % "failed")))
        (SPROG ((|m| (%)))
               (SEQ
                (LETT |m| (SPADCALL |n| (|spadConstant| % 27) (QREFELT % 29)))
                (EXIT
                 (COND
                  ((SPADCALL |m| (|spadConstant| % 26) (QREFELT % 30))
                   (CONS 1 "failed"))
                  ('T (CONS 0 |m|))))))) 

(PUT '|ZMOD;=;2%B;31| '|SPADreplace| 'EQL) 

(SDEFUN |ZMOD;=;2%B;31| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (EQL |x| |y|)) 

(SDEFUN |ZMOD;*;3%;32| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 6) (QREFELT % 49))) 

(SDEFUN |ZMOD;*;I2%;33| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |n| (QREFELT % 6) (QREFELT % 37)) |x| (QREFELT % 6)
                  (QREFELT % 49))) 

(SDEFUN |ZMOD;+;3%;34| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 6) (QREFELT % 50))) 

(SDEFUN |ZMOD;-;3%;35| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 6) (QREFELT % 51))) 

(SDEFUN |ZMOD;random;%;36| ((% (%))) (RANDOM (QREFELT % 6))) 

(SDEFUN |ZMOD;index;Pi%;37| ((|a| (|PositiveInteger|)) (% (%)))
        (SPADCALL |a| (QREFELT % 6) (QREFELT % 37))) 

(SDEFUN |ZMOD;-;2%;38| ((|x| (%)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 11)) (|spadConstant| % 26))
              ('T (- (QREFELT % 6) |x|)))) 

(SDEFUN |ZMOD;^;%Nni%;39| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 6) (QREFELT % 40))) 

(SDEFUN |ZMOD;recip;%U;40| ((|x| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|g| (%)) (|c2| (%)) (|c1| (%))
          (|#G48|
           (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))))
         (SEQ
          (PROGN
           (LETT |#G48| (SPADCALL |x| (QREFELT % 6) (QREFELT % 44)))
           (LETT |c1| (QVELT |#G48| 0))
           (LETT |c2| (QVELT |#G48| 1))
           (LETT |g| (QVELT |#G48| 2))
           |#G48|)
          (EXIT
           (COND
            ((SPADCALL |g| (|spadConstant| % 27) (QREFELT % 30))
             (CONS 0 (SPADCALL |c1| (QREFELT % 6) (QREFELT % 37))))
            ('T (CONS 1 "failed"))))))) 

(SDEFUN |ZMOD;hashUpdate!;Hs%Hs;41| ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|ZMOD;smaller?;2%B;42| '|SPADreplace| '<) 

(SDEFUN |ZMOD;smaller?;2%B;42| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (< |x| |y|)) 

(DECLAIM (NOTINLINE |IntegerMod;|)) 

(DEFUN |IntegerMod;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|IntegerMod| DV$1))
          (LETT % (GETREFV 55))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IntegerMod| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 16 (<= |#1| (ASH MOST-POSITIVE-FIXNUM -1)))
          (COND
           ((QREFELT % 16)
            (PROGN
             (QSETREFV % 17 (|SingleInteger|))
             (QSETREFV % 20 (SPADCALL |#1| (QREFELT % 19)))
             NIL
             (QSETREFV % 13 (CONS (|dispatchFunction| |ZMOD;convert;%I;5|) %))
             (QSETREFV % 24 (CONS (|dispatchFunction| |ZMOD;coerce;%Of;6|) %))
             (QSETREFV % 25 (CONS (|dispatchFunction| |ZMOD;coerce;I%;7|) %))
             (QSETREFV % 26
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;Zero;%;8|) % 26)))
             (QSETREFV % 27
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;One;%;9|) % 27)))
             (QSETREFV % 28
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;init;%;10|) %
                                   28)))
             (QSETREFV % 32
                       (CONS (|dispatchFunction| |ZMOD;nextItem;%U;11|) %))
             (QSETREFV % 30 (CONS (|dispatchFunction| |ZMOD;=;2%B;12|) %))
             (QSETREFV % 33 (CONS (|dispatchFunction| |ZMOD;*;3%;13|) %))
             (QSETREFV % 34 (CONS (|dispatchFunction| |ZMOD;*;I2%;14|) %))
             (QSETREFV % 29 (CONS (|dispatchFunction| |ZMOD;+;3%;15|) %))
             (QSETREFV % 35 (CONS (|dispatchFunction| |ZMOD;-;3%;16|) %))
             (QSETREFV % 36 (CONS (|dispatchFunction| |ZMOD;random;%;17|) %))
             (QSETREFV % 38 (CONS (|dispatchFunction| |ZMOD;index;Pi%;18|) %))
             (QSETREFV % 39 (CONS (|dispatchFunction| |ZMOD;-;2%;19|) %))
             (QSETREFV % 42 (CONS (|dispatchFunction| |ZMOD;^;%Nni%;20|) %))
             (QSETREFV % 45 (CONS (|dispatchFunction| |ZMOD;recip;%U;21|) %))
             (QSETREFV % 47
                       (CONS (|dispatchFunction| |ZMOD;hashUpdate!;Hs%Hs;22|)
                             %))
             (QSETREFV % 48
                       (CONS (|dispatchFunction| |ZMOD;smaller?;2%B;23|) %))))
           ('T
            (PROGN
             (SETELT % 17 (|Integer|))
             (QSETREFV % 13 (CONS (|dispatchFunction| |ZMOD;convert;%I;24|) %))
             (QSETREFV % 25 (CONS (|dispatchFunction| |ZMOD;coerce;I%;25|) %))
             (QSETREFV % 24 (CONS (|dispatchFunction| |ZMOD;coerce;%Of;26|) %))
             (QSETREFV % 26
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;Zero;%;27|) %
                                   26)))
             (QSETREFV % 27
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;One;%;28|) % 27)))
             (QSETREFV % 28
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;init;%;29|) %
                                   28)))
             (QSETREFV % 32
                       (CONS (|dispatchFunction| |ZMOD;nextItem;%U;30|) %))
             (QSETREFV % 30 (CONS (|dispatchFunction| |ZMOD;=;2%B;31|) %))
             (QSETREFV % 33 (CONS (|dispatchFunction| |ZMOD;*;3%;32|) %))
             (QSETREFV % 34 (CONS (|dispatchFunction| |ZMOD;*;I2%;33|) %))
             (QSETREFV % 29 (CONS (|dispatchFunction| |ZMOD;+;3%;34|) %))
             (QSETREFV % 35 (CONS (|dispatchFunction| |ZMOD;-;3%;35|) %))
             (QSETREFV % 36 (CONS (|dispatchFunction| |ZMOD;random;%;36|) %))
             (QSETREFV % 38 (CONS (|dispatchFunction| |ZMOD;index;Pi%;37|) %))
             (QSETREFV % 39 (CONS (|dispatchFunction| |ZMOD;-;2%;38|) %))
             (QSETREFV % 42 (CONS (|dispatchFunction| |ZMOD;^;%Nni%;39|) %))
             (QSETREFV % 45 (CONS (|dispatchFunction| |ZMOD;recip;%U;40|) %))
             (QSETREFV % 47
                       (CONS (|dispatchFunction| |ZMOD;hashUpdate!;Hs%Hs;41|)
                             %))
             (QSETREFV % 48
                       (CONS (|dispatchFunction| |ZMOD;smaller?;2%B;42|) %)))))
          %))) 

(DEFUN |IntegerMod| (#1=#:G71)
  (SPROG NIL
         (PROG (#2=#:G72)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IntegerMod|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IntegerMod;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IntegerMod|)))))))))) 

(MAKEPROP '|IntegerMod| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |ZMOD;size;Nni;1| |ZMOD;characteristic;Nni;2| (|Boolean|)
              (0 . |zero?|) (|Integer|) (5 . |convert|) (|PositiveInteger|)
              |ZMOD;lookup;%Pi;3| '#:G3 '|Rep| (|SingleInteger|)
              (10 . |coerce|) '|q| (15 . |positiveRemainder|) (|OutputForm|)
              (21 . |coerce|) (26 . |coerce|) (31 . |coerce|) (36 . |Zero|)
              (40 . |One|) (44 . |init|) (48 . +) (54 . =)
              (|Union| % '"failed") (60 . |nextItem|) (65 . *) (71 . *)
              (77 . -) (83 . |random|) (87 . |positiveRemainder|)
              (93 . |index|) (98 . -) (103 . |powmod|) (110 . |powmod|)
              (117 . ^)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (123 . |extendedEuclidean|) (129 . |recip|) (|HashState|)
              (134 . |hashUpdate!|) (140 . |smaller?|) (146 . |mulmod|)
              (153 . |addmod|) (160 . |submod|) (|String|) (|List| %)
              (|InputForm|))
           '#(~= 167 |zero?| 173 |subtractIfCan| 178 |smaller?| 184 |size| 190
              |sample| 194 |rightRecip| 198 |rightPower| 203 |recip| 215
              |random| 220 |plenaryPower| 224 |opposite?| 230 |one?| 236
              |nextItem| 241 |lookup| 246 |leftRecip| 251 |leftPower| 256
              |latex| 268 |init| 273 |index| 277 |hashUpdate!| 282 |hash| 288
              |enumerate| 293 |convert| 297 |commutator| 307 |coerce| 313
              |characteristic| 328 |associator| 332 |antiCommutator| 339
              |annihilate?| 345 ^ 351 |Zero| 363 |One| 367 = 371 - 377 + 388 *
              394)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL |Algebra&| NIL NIL |Rng&| |NonAssociativeAlgebra&| NIL
                |Module&| |NonAssociativeRing&| NIL NIL |NonAssociativeRng&|
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL |Finite&|
                |AbelianSemiGroup&| |Magma&| NIL NIL |SetCategory&| NIL
                |Hashable&| NIL |BasicType&| NIL NIL NIL NIL)
             (CONS
              '#((|CommutativeRing|) (|Algebra| $$) (|Ring|) (|SemiRing|)
                 (|Rng|) (|NonAssociativeAlgebra| $$) (|SemiRng|) (|Module| $$)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|Finite|)
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|) (|StepThrough|)
                 (|SetCategory|) (|CommutativeStar|) (|Hashable|)
                 (|CoercibleTo| 22) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|ConvertibleTo| 54) (|ConvertibleTo| 12))
              (|makeByteWordVec2| 54
                                  '(1 0 10 0 11 1 0 12 0 13 1 18 0 12 19 2 12 0
                                    0 0 21 1 17 22 0 23 1 0 22 0 24 1 0 0 12 25
                                    0 0 0 26 0 0 0 27 0 0 0 28 2 0 0 0 0 29 2 0
                                    10 0 0 30 1 0 31 0 32 2 0 0 0 0 33 2 0 0 12
                                    0 34 2 0 0 0 0 35 0 0 0 36 2 17 0 0 0 37 1
                                    0 0 14 38 1 0 0 0 39 3 17 0 0 0 0 40 3 12 0
                                    0 0 0 41 2 0 0 0 7 42 2 17 43 0 0 44 1 0 31
                                    0 45 2 0 46 46 0 47 2 0 10 0 0 48 3 17 0 0
                                    0 0 49 3 17 0 0 0 0 50 3 17 0 0 0 0 51 2 0
                                    10 0 0 1 1 0 10 0 11 2 0 31 0 0 1 2 0 10 0
                                    0 48 0 0 7 8 0 0 0 1 1 0 31 0 1 2 0 0 0 14
                                    1 2 0 0 0 7 1 1 0 31 0 45 0 0 0 36 2 0 0 0
                                    14 1 2 0 10 0 0 1 1 0 10 0 1 1 0 31 0 32 1
                                    0 14 0 15 1 0 31 0 1 2 0 0 0 14 1 2 0 0 0 7
                                    1 1 0 52 0 1 0 0 0 28 1 0 0 14 38 2 0 46 46
                                    0 47 1 0 18 0 1 0 0 53 1 1 0 54 0 1 1 0 12
                                    0 13 2 0 0 0 0 1 1 0 22 0 24 1 0 0 12 25 1
                                    0 0 0 1 0 0 7 9 3 0 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 10 0 0 1 2 0 0 0 14 1 2 0 0 0 7 42 0 0 0
                                    26 0 0 0 27 2 0 10 0 0 30 1 0 0 0 39 2 0 0
                                    0 0 35 2 0 0 0 0 29 2 0 0 14 0 1 2 0 0 0 0
                                    33 2 0 0 12 0 34 2 0 0 7 0 1)))))
           '|lookupComplete|)) 
