
(SDEFUN |ZMOD;size;Nni;1| (($ |NonNegativeInteger|)) (QREFELT $ 6)) 

(SDEFUN |ZMOD;characteristic;Nni;2| (($ |NonNegativeInteger|)) (QREFELT $ 6)) 

(SDEFUN |ZMOD;lookup;$Pi;3| ((|x| $) ($ |PositiveInteger|))
        (SPROG ((#1=#:G701 NIL))
               (COND ((SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 6))
                     ('T
                      (PROG1
                          (LETT #1# (SPADCALL |x| (QREFELT $ 13))
                                |ZMOD;lookup;$Pi;3|)
                        (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                          '(|Integer|) #1#)))))) 

(SDEFUN |ZMOD;bloodyCompiler| ((|n| |Integer|) ($ $))
        (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 22))) 

(PUT '|ZMOD;convert;$I;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |ZMOD;convert;$I;5| ((|x| $) ($ |Integer|)) |x|) 

(SDEFUN |ZMOD;coerce;$Of;6| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 24))) 

(SDEFUN |ZMOD;coerce;I$;7| ((|n| |Integer|) ($ $))
        (|ZMOD;bloodyCompiler| |n| $)) 

(PUT '|ZMOD;Zero;$;8| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |ZMOD;Zero;$;8| (($ $)) 0) 

(PUT '|ZMOD;One;$;9| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |ZMOD;One;$;9| (($ $)) 1) 

(PUT '|ZMOD;init;$;10| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |ZMOD;init;$;10| (($ $)) 0) 

(SDEFUN |ZMOD;nextItem;$U;11| ((|n| $) ($ |Union| $ "failed"))
        (SPROG ((|m| ($)))
               (SEQ
                (LETT |m| (SPADCALL |n| (|spadConstant| $ 28) (QREFELT $ 30))
                      |ZMOD;nextItem;$U;11|)
                (EXIT
                 (COND
                  ((SPADCALL |m| (|spadConstant| $ 27) (QREFELT $ 31))
                   (CONS 1 "failed"))
                  ('T (CONS 0 |m|))))))) 

(PUT '|ZMOD;=;2$B;12| '|SPADreplace| '|eql_SI|) 

(SDEFUN |ZMOD;=;2$B;12| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_SI| |x| |y|)) 

(SDEFUN |ZMOD;*;3$;13| ((|x| $) (|y| $) ($ $))
        (|mulmod_SI| |x| |y| (QREFELT $ 21))) 

(SDEFUN |ZMOD;*;I2$;14| ((|n| |Integer|) (|x| $) ($ $))
        (|mulmod_SI| (|ZMOD;bloodyCompiler| |n| $) |x| (QREFELT $ 21))) 

(SDEFUN |ZMOD;+;3$;15| ((|x| $) (|y| $) ($ $))
        (|addmod_SI| |x| |y| (QREFELT $ 21))) 

(SDEFUN |ZMOD;-;3$;16| ((|x| $) (|y| $) ($ $))
        (|submod_SI| |x| |y| (QREFELT $ 21))) 

(SDEFUN |ZMOD;random;$;17| (($ $)) (RANDOM (QREFELT $ 21))) 

(SDEFUN |ZMOD;index;Pi$;18| ((|a| |PositiveInteger|) ($ $))
        (SPADCALL (SPADCALL |a| (QREFELT $ 26)) (QREFELT $ 21) (QREFELT $ 38))) 

(SDEFUN |ZMOD;-;2$;19| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 27))
              ('T (|sub_SI| (QREFELT $ 21) |x|)))) 

(SDEFUN |ZMOD;^;$Nni$;20| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND
         ((< |n| (QREFELT $ 6))
          (SPADCALL |x| (SPADCALL |n| (QREFELT $ 26)) (QREFELT $ 21)
                    (QREFELT $ 41)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (QREFELT $ 13)) |n| (QREFELT $ 6)
                     (QREFELT $ 42))
           (QREFELT $ 26))))) 

(SDEFUN |ZMOD;recip;$U;21| ((|x| $) ($ |Union| $ "failed"))
        (SPROG
         ((|g| ($)) (|c2| ($)) (|c1| ($))
          (|#G24|
           (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))))
         (SEQ
          (PROGN
           (LETT |#G24| (SPADCALL |x| (QREFELT $ 21) (QREFELT $ 45))
                 . #1=(|ZMOD;recip;$U;21|))
           (LETT |c1| (QVELT |#G24| 0) . #1#)
           (LETT |c2| (QVELT |#G24| 1) . #1#)
           (LETT |g| (QVELT |#G24| 2) . #1#)
           |#G24|)
          (EXIT
           (COND
            ((SPADCALL |g| (|spadConstant| $ 28) (QREFELT $ 31))
             (CONS 0 (SPADCALL |c1| (QREFELT $ 21) (QREFELT $ 38))))
            ('T (CONS 1 "failed"))))))) 

(PUT '|ZMOD;hashUpdate!;Hs$Hs;22| '|SPADreplace| 'HASHSTATEUPDATE) 

(SDEFUN |ZMOD;hashUpdate!;Hs$Hs;22|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| |s|)) 

(PUT '|ZMOD;convert;$I;23| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |ZMOD;convert;$I;23| ((|x| $) ($ |Integer|)) |x|) 

(SDEFUN |ZMOD;coerce;I$;24| ((|n| |Integer|) ($ $))
        (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 38))) 

(SDEFUN |ZMOD;coerce;$Of;25| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 24))) 

(PUT '|ZMOD;Zero;$;26| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |ZMOD;Zero;$;26| (($ $)) 0) 

(PUT '|ZMOD;One;$;27| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |ZMOD;One;$;27| (($ $)) 1) 

(PUT '|ZMOD;init;$;28| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |ZMOD;init;$;28| (($ $)) 0) 

(SDEFUN |ZMOD;nextItem;$U;29| ((|n| $) ($ |Union| $ "failed"))
        (SPROG ((|m| ($)))
               (SEQ
                (LETT |m| (SPADCALL |n| (|spadConstant| $ 28) (QREFELT $ 30))
                      |ZMOD;nextItem;$U;29|)
                (EXIT
                 (COND
                  ((SPADCALL |m| (|spadConstant| $ 27) (QREFELT $ 31))
                   (CONS 1 "failed"))
                  ('T (CONS 0 |m|))))))) 

(PUT '|ZMOD;=;2$B;30| '|SPADreplace| 'EQL) 

(SDEFUN |ZMOD;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|)) (EQL |x| |y|)) 

(SDEFUN |ZMOD;*;3$;31| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 6) (QREFELT $ 49))) 

(SDEFUN |ZMOD;*;I2$;32| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 38)) |x| (QREFELT $ 6)
                  (QREFELT $ 49))) 

(SDEFUN |ZMOD;+;3$;33| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 6) (QREFELT $ 50))) 

(SDEFUN |ZMOD;-;3$;34| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 6) (QREFELT $ 51))) 

(SDEFUN |ZMOD;random;$;35| (($ $)) (RANDOM (QREFELT $ 6))) 

(SDEFUN |ZMOD;index;Pi$;36| ((|a| |PositiveInteger|) ($ $))
        (SPADCALL |a| (QREFELT $ 6) (QREFELT $ 38))) 

(SDEFUN |ZMOD;-;2$;37| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 27))
              ('T (- (QREFELT $ 6) |x|)))) 

(SDEFUN |ZMOD;^;$Nni$;38| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 6) (QREFELT $ 41))) 

(SDEFUN |ZMOD;recip;$U;39| ((|x| $) ($ |Union| $ "failed"))
        (SPROG
         ((|g| ($)) (|c2| ($)) (|c1| ($))
          (|#G46|
           (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))))
         (SEQ
          (PROGN
           (LETT |#G46| (SPADCALL |x| (QREFELT $ 6) (QREFELT $ 45))
                 . #1=(|ZMOD;recip;$U;39|))
           (LETT |c1| (QVELT |#G46| 0) . #1#)
           (LETT |c2| (QVELT |#G46| 1) . #1#)
           (LETT |g| (QVELT |#G46| 2) . #1#)
           |#G46|)
          (EXIT
           (COND
            ((SPADCALL |g| (|spadConstant| $ 28) (QREFELT $ 31))
             (CONS 0 (SPADCALL |c1| (QREFELT $ 6) (QREFELT $ 38))))
            ('T (CONS 1 "failed"))))))) 

(SDEFUN |ZMOD;hashUpdate!;Hs$Hs;40|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(DECLAIM (NOTINLINE |IntegerMod;|)) 

(DEFUN |IntegerMod| (#1=#:G770)
  (SPROG NIL
         (PROG (#2=#:G771)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IntegerMod|)
                                               '|domainEqualList|)
                    . #3=(|IntegerMod|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IntegerMod;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IntegerMod|)))))))))) 

(DEFUN |IntegerMod;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegerMod|))
          (LETT |dv$| (LIST '|IntegerMod| DV$1) . #1#)
          (LETT $ (GETREFV 55) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IntegerMod| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 17 (SPADCALL |#1| MOST-POSITIVE-FIXNUM (QREFELT $ 16)))
          (COND
           ((QREFELT $ 17)
            (PROGN
             (QSETREFV $ 18 (|SingleInteger|))
             (QSETREFV $ 21 (SPADCALL |#1| (QREFELT $ 20)))
             NIL
             (QSETREFV $ 13 (CONS (|dispatchFunction| |ZMOD;convert;$I;5|) $))
             (QSETREFV $ 25 (CONS (|dispatchFunction| |ZMOD;coerce;$Of;6|) $))
             (QSETREFV $ 26 (CONS (|dispatchFunction| |ZMOD;coerce;I$;7|) $))
             (QSETREFV $ 27
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;Zero;$;8|) $ 27)))
             (QSETREFV $ 28
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;One;$;9|) $ 28)))
             (QSETREFV $ 29
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;init;$;10|) $
                                   29)))
             (QSETREFV $ 33
                       (CONS (|dispatchFunction| |ZMOD;nextItem;$U;11|) $))
             (QSETREFV $ 31 (CONS (|dispatchFunction| |ZMOD;=;2$B;12|) $))
             (QSETREFV $ 34 (CONS (|dispatchFunction| |ZMOD;*;3$;13|) $))
             (QSETREFV $ 35 (CONS (|dispatchFunction| |ZMOD;*;I2$;14|) $))
             (QSETREFV $ 30 (CONS (|dispatchFunction| |ZMOD;+;3$;15|) $))
             (QSETREFV $ 36 (CONS (|dispatchFunction| |ZMOD;-;3$;16|) $))
             (QSETREFV $ 37 (CONS (|dispatchFunction| |ZMOD;random;$;17|) $))
             (QSETREFV $ 39 (CONS (|dispatchFunction| |ZMOD;index;Pi$;18|) $))
             (QSETREFV $ 40 (CONS (|dispatchFunction| |ZMOD;-;2$;19|) $))
             (QSETREFV $ 43 (CONS (|dispatchFunction| |ZMOD;^;$Nni$;20|) $))
             (QSETREFV $ 46 (CONS (|dispatchFunction| |ZMOD;recip;$U;21|) $))
             (QSETREFV $ 48
                       (CONS (|dispatchFunction| |ZMOD;hashUpdate!;Hs$Hs;22|)
                             $))))
           ('T
            (PROGN
             (SETELT $ 18 (|Integer|))
             (QSETREFV $ 13 (CONS (|dispatchFunction| |ZMOD;convert;$I;23|) $))
             (QSETREFV $ 26 (CONS (|dispatchFunction| |ZMOD;coerce;I$;24|) $))
             (QSETREFV $ 25 (CONS (|dispatchFunction| |ZMOD;coerce;$Of;25|) $))
             (QSETREFV $ 27
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;Zero;$;26|) $
                                   27)))
             (QSETREFV $ 28
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;One;$;27|) $ 28)))
             (QSETREFV $ 29
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ZMOD;init;$;28|) $
                                   29)))
             (QSETREFV $ 33
                       (CONS (|dispatchFunction| |ZMOD;nextItem;$U;29|) $))
             (QSETREFV $ 31 (CONS (|dispatchFunction| |ZMOD;=;2$B;30|) $))
             (QSETREFV $ 34 (CONS (|dispatchFunction| |ZMOD;*;3$;31|) $))
             (QSETREFV $ 35 (CONS (|dispatchFunction| |ZMOD;*;I2$;32|) $))
             (QSETREFV $ 30 (CONS (|dispatchFunction| |ZMOD;+;3$;33|) $))
             (QSETREFV $ 36 (CONS (|dispatchFunction| |ZMOD;-;3$;34|) $))
             (QSETREFV $ 37 (CONS (|dispatchFunction| |ZMOD;random;$;35|) $))
             (QSETREFV $ 39 (CONS (|dispatchFunction| |ZMOD;index;Pi$;36|) $))
             (QSETREFV $ 40 (CONS (|dispatchFunction| |ZMOD;-;2$;37|) $))
             (QSETREFV $ 43 (CONS (|dispatchFunction| |ZMOD;^;$Nni$;38|) $))
             (QSETREFV $ 46 (CONS (|dispatchFunction| |ZMOD;recip;$U;39|) $))
             (QSETREFV $ 48
                       (CONS (|dispatchFunction| |ZMOD;hashUpdate!;Hs$Hs;40|)
                             $)))))
          $))) 

(MAKEPROP '|IntegerMod| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |ZMOD;size;Nni;1| |ZMOD;characteristic;Nni;2| (|Boolean|)
              (0 . |zero?|) (|Integer|) (5 . |convert|) (|PositiveInteger|)
              |ZMOD;lookup;$Pi;3| (10 . <=) '#:G693 '|Rep| (|SingleInteger|)
              (16 . |coerce|) '|q| (21 . |positiveRemainder|) (|OutputForm|)
              (27 . |coerce|) (32 . |coerce|) (37 . |coerce|) (42 . |Zero|)
              (46 . |One|) (50 . |init|) (54 . +) (60 . =)
              (|Union| $ '"failed") (66 . |nextItem|) (71 . *) (77 . *)
              (83 . -) (89 . |random|) (93 . |positiveRemainder|)
              (99 . |index|) (104 . -) (109 . |powmod|) (116 . |powmod|)
              (123 . ^)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (129 . |extendedEuclidean|) (135 . |recip|) (|HashState|)
              (140 . |hashUpdate!|) (146 . |mulmod|) (153 . |addmod|)
              (160 . |submod|) (|InputForm|) (|List| $) (|String|))
           '#(~= 167 |zero?| 173 |subtractIfCan| 178 |smaller?| 184 |size| 190
              |sample| 194 |rightRecip| 198 |rightPower| 203 |recip| 215
              |random| 220 |opposite?| 224 |one?| 230 |nextItem| 235 |lookup|
              240 |leftRecip| 245 |leftPower| 250 |latex| 262 |init| 267
              |index| 271 |hashUpdate!| 276 |hash| 282 |enumerate| 287
              |convert| 291 |commutator| 301 |coerce| 307 |characteristic| 322
              |associator| 326 |antiCommutator| 333 |annihilate?| 339 ^ 345
              |Zero| 357 |One| 361 = 365 - 371 + 382 * 388)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL |Algebra&| NIL |Rng&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL |NonAssociativeRng&| NIL
                |AbelianGroup&| NIL NIL NIL |Finite&| NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| NIL NIL |Magma&|
                |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|CommutativeRing|) (|Algebra| $$) (|Ring|) (|Rng|)
                 (|SemiRing|) (|Module| $$) (|SemiRng|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|Finite|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|StepThrough|)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|) (|SetCategory|)
                 (|ConvertibleTo| 12) (|ConvertibleTo| 52) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 23))
              (|makeByteWordVec2| 54
                                  '(1 0 10 0 11 1 0 12 0 13 2 12 10 0 0 16 1 19
                                    0 12 20 2 12 0 0 0 22 1 18 23 0 24 1 0 23 0
                                    25 1 0 0 12 26 0 0 0 27 0 0 0 28 0 0 0 29 2
                                    0 0 0 0 30 2 0 10 0 0 31 1 0 32 0 33 2 0 0
                                    0 0 34 2 0 0 12 0 35 2 0 0 0 0 36 0 0 0 37
                                    2 18 0 0 0 38 1 0 0 14 39 1 0 0 0 40 3 18 0
                                    0 0 0 41 3 12 0 0 0 0 42 2 0 0 0 7 43 2 18
                                    44 0 0 45 1 0 32 0 46 2 0 47 47 0 48 3 18 0
                                    0 0 0 49 3 18 0 0 0 0 50 3 18 0 0 0 0 51 2
                                    0 10 0 0 1 1 0 10 0 11 2 0 32 0 0 1 2 0 10
                                    0 0 1 0 0 7 8 0 0 0 1 1 0 32 0 1 2 0 0 0 7
                                    1 2 0 0 0 14 1 1 0 32 0 46 0 0 0 37 2 0 10
                                    0 0 1 1 0 10 0 1 1 0 32 0 33 1 0 14 0 15 1
                                    0 32 0 1 2 0 0 0 7 1 2 0 0 0 14 1 1 0 54 0
                                    1 0 0 0 29 1 0 0 14 39 2 0 47 47 0 48 1 0
                                    19 0 1 0 0 53 1 1 0 12 0 13 1 0 52 0 1 2 0
                                    0 0 0 1 1 0 0 0 1 1 0 0 12 26 1 0 23 0 25 0
                                    0 7 9 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 10 0 0
                                    1 2 0 0 0 7 43 2 0 0 0 14 1 0 0 0 27 0 0 0
                                    28 2 0 10 0 0 31 1 0 0 0 40 2 0 0 0 0 36 2
                                    0 0 0 0 30 2 0 0 7 0 1 2 0 0 12 0 35 2 0 0
                                    0 0 34 2 0 0 14 0 1)))))
           '|lookupComplete|)) 
