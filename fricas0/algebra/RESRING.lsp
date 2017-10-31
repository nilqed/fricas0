
(SDEFUN |RESRING;Zero;$;1| (($ $)) (|spadConstant| $ 20)) 

(SDEFUN |RESRING;One;$;2| (($ $)) (|spadConstant| $ 22)) 

(SDEFUN |RESRING;reduce;FPol$;3| ((|f| |FPol|) ($ $))
        (SPADCALL |f| (QREFELT $ 15) (QREFELT $ 24))) 

(SDEFUN |RESRING;coerce;FPol$;4| ((|f| |FPol|) ($ $))
        (SPADCALL |f| (QREFELT $ 15) (QREFELT $ 24))) 

(PUT '|RESRING;lift;$FPol;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |RESRING;lift;$FPol;5| ((|x| $) ($ |FPol|)) |x|) 

(SDEFUN |RESRING;+;3$;6| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 28))) 

(SDEFUN |RESRING;-;2$;7| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 30))) 

(SDEFUN |RESRING;*;3$;8| ((|x| $) (|y| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |x| |y| (QREFELT $ 32)) (QREFELT $ 27))
                  (QREFELT $ 15) (QREFELT $ 24))) 

(SDEFUN |RESRING;*;I2$;9| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 35))) 

(SDEFUN |RESRING;*;F2$;10| ((|a| F) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 37))) 

(SDEFUN |RESRING;=;2$B;11| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 39))) 

(SDEFUN |RESRING;characteristic;Nni;12| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 42))) 

(SDEFUN |RESRING;coerce;$Of;13| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 45))) 

(DECLAIM (NOTINLINE |ResidueRing;|)) 

(DEFUN |ResidueRing| (&REST #1=#:G718)
  (SPROG NIL
         (PROG (#2=#:G719)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ResidueRing|)
                                               '|domainEqualList|)
                    . #3=(|ResidueRing|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ResidueRing;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ResidueRing|)))))))))) 

(DEFUN |ResidueRing;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|ResidueRing|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|ResidueRing| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 52) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|ResidueRing|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 |#4|)
    (QSETREFV $ 15 (SPADCALL |#5| (QREFELT $ 14)))
    (QSETREFV $ 19
              (SPADCALL (QREFELT $ 15) (LIST (|spadConstant| $ 16))
                        (QREFELT $ 18)))
    (COND ((QREFELT $ 19) (|error| "the residue ring is the zero ring")))
    $))) 

(MAKEPROP '|ResidueRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) '|Rep| (|List| 9)
              (|GroebnerPackage| 6 7 8 9) (0 . |groebner|) '|relations|
              (5 . |One|) (|Boolean|) (9 . =) '#:G690 (15 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |RESRING;Zero;$;1|) $))
              (19 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |RESRING;One;$;2|) $))
              (23 . |normalForm|) |RESRING;reduce;FPol$;3|
              |RESRING;coerce;FPol$;4| |RESRING;lift;$FPol;5| (29 . +)
              |RESRING;+;3$;6| (35 . -) |RESRING;-;2$;7| (40 . *)
              |RESRING;*;3$;8| (|Integer|) (46 . *) |RESRING;*;I2$;9| (52 . *)
              |RESRING;*;F2$;10| (58 . =) |RESRING;=;2$B;11|
              (|NonNegativeInteger|) (64 . |characteristic|)
              |RESRING;characteristic;Nni;12| (|OutputForm|) (68 . |coerce|)
              |RESRING;coerce;$Of;13| (|Union| $ '"failed") (|PositiveInteger|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 73 |zero?| 79 |subtractIfCan| 84 |sample| 90 |reduce| 94
              |recip| 99 |opposite?| 104 |one?| 110 |lift| 115 |latex| 120
              |hashUpdate!| 125 |hash| 131 |coerce| 136 |characteristic| 156
              |annihilate?| 160 ^ 166 |Zero| 178 |One| 182 = 186 - 192 + 203 *
              209)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(|Algebra&| NIL |Module&| NIL |Ring&| NIL NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|Algebra| 6) (|CommutativeRing|) (|Module| 6)
                 (|BiModule| 6 6) (|Ring|) (|BiModule| $$ $$) (|RightModule| 6)
                 (|LeftModule| 6) (|Rng|) (|RightModule| $$) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 44))
              (|makeByteWordVec2| 51
                                  '(1 13 12 12 14 0 9 0 16 2 12 17 0 0 18 0 11
                                    0 20 0 11 0 22 2 13 9 9 12 24 2 11 0 0 0 28
                                    1 11 0 0 30 2 11 0 0 0 32 2 11 0 34 0 35 2
                                    11 0 6 0 37 2 11 17 0 0 39 0 6 41 42 1 11
                                    44 0 45 2 0 17 0 0 1 1 0 17 0 1 2 0 47 0 0
                                    1 0 0 0 1 1 0 0 9 25 1 0 47 0 1 2 0 17 0 0
                                    1 1 0 17 0 1 1 0 9 0 27 1 0 50 0 1 2 0 49
                                    49 0 1 1 0 51 0 1 1 0 0 9 26 1 0 0 6 1 1 0
                                    0 34 1 1 0 44 0 46 0 0 41 43 2 0 17 0 0 1 2
                                    0 0 0 41 1 2 0 0 0 48 1 0 0 0 21 0 0 0 23 2
                                    0 17 0 0 40 1 0 0 0 31 2 0 0 0 0 1 2 0 0 0
                                    0 29 2 0 0 0 6 1 2 0 0 6 0 38 2 0 0 34 0 36
                                    2 0 0 0 0 33 2 0 0 41 0 1 2 0 0 48 0 1)))))
           '|lookupComplete|)) 
