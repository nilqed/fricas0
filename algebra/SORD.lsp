
(SDEFUN |SORD;Zero;$;1| (($ $)) (|spadConstant| $ 7)) 

(SDEFUN |SORD;One;$;2| (($ $)) (|spadConstant| $ 9)) 

(SDEFUN |SORD;omega;$;3| (($ $))
        (SPADCALL 1 (|spadConstant| $ 10) (QREFELT $ 12))) 

(SDEFUN |SORD;omegapower;2$;4| ((|p| $) ($ $)) (SPADCALL 1 |p| (QREFELT $ 12))) 

(SDEFUN |SORD;zero?;$B;5| ((|p| $) ($ |Boolean|)) (SPADCALL |p| (QREFELT $ 16))) 

(SDEFUN |SORD;one?;$B;6| ((|p| $) ($ |Boolean|))
        (SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 18))) 

(SDEFUN |SORD;=;2$B;7| ((|p1| $) (|p2| $) ($ |Boolean|))
        (SPADCALL |p1| |p2| (QREFELT $ 18))) 

(SDEFUN |SORD;hashUpdate!;Hs$Hs;8|
        ((|hs| . #1=(|HashState|)) (|p| $) ($ . #1#))
        (COND
         ((SPADCALL |p| (QREFELT $ 17))
          (HASHSTATEUPDATE |hs| (SPADCALL 6672 (QREFELT $ 23))))
         ('T (SPADCALL |hs| |p| (QREFELT $ 25))))) 

(SDEFUN |SORD;coerce;Nni$;9| ((|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |n| (|spadConstant| $ 8) (QREFELT $ 12))) 

(SDEFUN |SORD;retractIfCan;$U;10|
        ((|x| $) ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPADCALL |x| (QREFELT $ 29))) 

(SDEFUN |SORD;<;2$B;11| ((|o1| $) (|o2| $) ($ |Boolean|))
        (SPROG ((|p2| (|Rep|)) (|p1| (|Rep|)))
               (SEQ (LETT |p1| |o1| . #1=(|SORD;<;2$B;11|))
                    (LETT |p2| |o2| . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |p1| (QREFELT $ 31))
                       (COND
                        ((SPADCALL |p2| (QREFELT $ 31))
                         (< (SPADCALL |p1| (QREFELT $ 32))
                            (SPADCALL |p2| (QREFELT $ 32))))
                        (#2='T 'T)))
                      ((SPADCALL |p2| (QREFELT $ 31)) NIL)
                      (#2# (SPADCALL |p1| |p2| (QREFELT $ 33)))))))) 

(SDEFUN |SORD;+;3$;12| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 35))) 

(SDEFUN |SORD;*;3$;13| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 37))) 

(SDEFUN |SORD;subtractIfCan;2$U;14| ((|o1| $) (|o2| $) ($ |Union| $ "failed"))
        (SPADCALL |o1| |o2| (QREFELT $ 40))) 

(SDEFUN |SORD;ordinalAdd;3$;15| ((|o1| $) (|o2| $) ($ $))
        (SPROG
         ((|p2| (|Rep|)) (#1=#:G742 NIL) (|t| NIL) (|p1| (|Rep|))
          (|lt| (|List| |Rep|)) (|e| ($)))
         (SEQ (LETT |p1| |o1| . #2=(|SORD;ordinalAdd;3$;15|))
              (LETT |p2| |o2| . #2#)
              (LETT |e| (SPADCALL |p2| (QREFELT $ 42)) . #2#)
              (EXIT
               (COND
                ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 20))
                 (SPADCALL |p1| |p2| (QREFELT $ 36)))
                ('T
                 (SEQ (LETT |lt| NIL . #2#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |p1| (QREFELT $ 42)) |e|
                                        (QREFELT $ 43)))
                             (GO G191)))
                           (SEQ
                            (LETT |lt|
                                  (CONS (SPADCALL |p1| (QREFELT $ 44)) |lt|)
                                  . #2#)
                            (EXIT
                             (LETT |p1| (SPADCALL |p1| (QREFELT $ 45)) . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (SEQ (LETT |t| NIL . #2#) (LETT #1# |lt| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |p2| (SPADCALL |t| |p2| (QREFELT $ 36))
                                   . #2#)))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |p2|)))))))) 

(SDEFUN |SORD;integerPart;$Nni;16| ((|o| $) ($ |NonNegativeInteger|))
        (SPROG ((|p| (|Rep|)))
               (SEQ (LETT |p| |o| . #1=(|SORD;integerPart;$Nni;16|))
                    (SEQ G190
                         (COND
                          ((NULL (NOT (SPADCALL |p| (QREFELT $ 31))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 45)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |p| (QREFELT $ 32)))))) 

(SDEFUN |SORD;limitPart;2$;17| ((|o| $) ($ $))
        (SPROG ((#1=#:G747 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL |o|
                                   (SPADCALL (SPADCALL |o| (QREFELT $ 47))
                                             (QREFELT $ 27))
                                   (QREFELT $ 41))
                         |SORD;limitPart;2$;17|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) $ (|Union| $ "failed") #1#)))) 

(SDEFUN |SORD;ordinalMul;3$;18| ((|o1| $) (|o2| $) ($ $))
        (SPROG ((|lo| ($)) (|hi| ($)) (|e| ($)))
               (SEQ
                (LETT |e| (SPADCALL |o1| (QREFELT $ 42))
                      . #1=(|SORD;ordinalMul;3$;18|))
                (LETT |hi|
                      (COND
                       ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 49))
                        (SPADCALL
                         (CONS #'|SORD;ordinalMul;3$;18!0| (VECTOR $ |e|))
                         (SPADCALL |o2| (QREFELT $ 48)) (QREFELT $ 51)))
                       ('T (SPADCALL |o2| (QREFELT $ 48))))
                      . #1#)
                (LETT |lo|
                      (SPADCALL |o1| (SPADCALL |o2| (QREFELT $ 47))
                                (QREFELT $ 52))
                      . #1#)
                (EXIT (SPADCALL |hi| |lo| (QREFELT $ 36)))))) 

(SDEFUN |SORD;ordinalMul;3$;18!0| ((|x| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1) . #1=(|SORD;ordinalMul;3$;18|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |e| |x| (QREFELT $ 46)))))) 

(SDEFUN |SORD;sub_one| ((|o| $) ($ $))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |o| (QREFELT $ 31))
                  (SEQ (LETT |n| (SPADCALL |o| (QREFELT $ 32)) |SORD;sub_one|)
                       (EXIT
                        (COND
                         ((EQL |n| 0)
                          (|error| "sub_one applied to zero ordinal"))
                         (#1='T (SPADCALL (- |n| 1) (QREFELT $ 27)))))))
                 (#1# |o|))))) 

(SDEFUN |SORD;infinite_power| ((|o1| $) (|o2| $) ($ $))
        (SPROG ((|e1| ($)))
               (SEQ
                (COND
                 ((SPADCALL |o1| (|spadConstant| $ 8) (QREFELT $ 20))
                  (|spadConstant| $ 8))
                 ((SPADCALL |o1| (|spadConstant| $ 10) (QREFELT $ 20))
                  (|spadConstant| $ 10))
                 (#1='T
                  (SEQ
                   (LETT |e1| (SPADCALL |o1| (QREFELT $ 42))
                         |SORD;infinite_power|)
                   (EXIT
                    (COND
                     ((SPADCALL |e1| (|spadConstant| $ 8) (QREFELT $ 49))
                      (SPADCALL (SPADCALL |e1| |o2| (QREFELT $ 53))
                                (QREFELT $ 14)))
                     (#1#
                      (SPADCALL
                       (SPADCALL (CONS (|function| |SORD;sub_one|) $) |o2|
                                 (QREFELT $ 51))
                       (QREFELT $ 14))))))))))) 

(SDEFUN |SORD;finite_ordinal_power| ((|o| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|n1| (|NonNegativeInteger|)) (|e| ($)))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 10)) ((EQL |n| 1) |o|)
                      (#1='T
                       (SEQ
                        (LETT |e| (SPADCALL |o| (QREFELT $ 42))
                              . #2=(|SORD;finite_ordinal_power|))
                        (EXIT
                         (COND
                          ((SPADCALL |e| (|spadConstant| $ 8) (QREFELT $ 20))
                           (SPADCALL (EXPT (SPADCALL |o| (QREFELT $ 54)) |n|)
                                     (QREFELT $ 27)))
                          (#1#
                           (SEQ (LETT |n1| (- |n| 1) . #2#)
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |e| |n1| (QREFELT $ 52))
                                            (QREFELT $ 14))
                                  |o| (QREFELT $ 53))))))))))))) 

(SDEFUN |SORD;ordinalPower;3$;22| ((|o1| $) (|o2| $) ($ $))
        (SPADCALL (|SORD;infinite_power| |o1| (SPADCALL |o2| (QREFELT $ 48)) $)
                  (|SORD;finite_ordinal_power| |o1|
                   (SPADCALL |o2| (QREFELT $ 47)) $)
                  (QREFELT $ 53))) 

(SDEFUN |SORD;^;3$;23| ((|o1| $) (|o2| $) ($ $))
        (SPADCALL (|SORD;infinite_power| |o1| (SPADCALL |o2| (QREFELT $ 48)) $)
                  (SPADCALL |o1| (SPADCALL |o2| (QREFELT $ 47)) (QREFELT $ 56))
                  (QREFELT $ 38))) 

(SDEFUN |SORD;coerce;$Of;24| ((|o| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|l1| #1=(|OutputForm|))
          (|mon| #2=(|OutputForm|)) (|co| #1#) (|p| (|Rep|)) (|e| ($))
          (|c| (|NonNegativeInteger|)) (|v| #2#))
         (SEQ (LETT |p| |o| . #3=(|SORD;coerce;$Of;24|))
              (EXIT
               (COND
                ((SPADCALL |p| (QREFELT $ 31))
                 (SPADCALL (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 59)))
                ('T
                 (SEQ (LETT |l| NIL . #3#)
                      (LETT |v| (SPADCALL "omega" (QREFELT $ 61)) . #3#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |p| (|spadConstant| $ 7)
                                        (QREFELT $ 62)))
                             (GO G191)))
                           (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 63)) . #3#)
                                (LETT |e| (SPADCALL |p| (QREFELT $ 42)) . #3#)
                                (LETT |p| (SPADCALL |p| (QREFELT $ 45)) . #3#)
                                (LETT |co| (SPADCALL |c| (QREFELT $ 59)) . #3#)
                                (LETT |l1|
                                      (COND
                                       ((SPADCALL |e| (|spadConstant| $ 8)
                                                  (QREFELT $ 20))
                                        |co|)
                                       ('T
                                        (SEQ
                                         (COND
                                          ((SPADCALL |e| (|spadConstant| $ 10)
                                                     (QREFELT $ 20))
                                           (LETT |mon| |v| . #3#))
                                          ('T
                                           (LETT |mon|
                                                 (SPADCALL |v|
                                                           (SPADCALL |e|
                                                                     (QREFELT $
                                                                              64))
                                                           (QREFELT $ 65))
                                                 . #3#)))
                                         (EXIT
                                          (COND ((EQL |c| 1) |mon|)
                                                ('T
                                                 (SPADCALL |co| |mon|
                                                           (QREFELT $
                                                                    66))))))))
                                      . #3#)
                                (EXIT (LETT |l| (CONS |l1| |l|) . #3#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |l| (NREVERSE |l|) . #3#)
                      (EXIT (SPADCALL (ELT $ 67) |l| (QREFELT $ 70)))))))))) 

(DECLAIM (NOTINLINE |SmallOrdinal;|)) 

(DEFUN |SmallOrdinal| ()
  (SPROG NIL
         (PROG (#1=#:G777)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SmallOrdinal|)
                    . #2=(|SmallOrdinal|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SmallOrdinal|
                             (LIST (CONS NIL (CONS 1 (|SmallOrdinal;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|SmallOrdinal|)))))))))) 

(DEFUN |SmallOrdinal;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SmallOrdinal|) . #1=(|SmallOrdinal|))
          (LETT $ (GETREFV 72) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SmallOrdinal| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|AbelianGroup|)) (|augmentPredVector| $ 1))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|PolynomialRing| (|NonNegativeInteger|) $))
          $))) 

(MAKEPROP '|SmallOrdinal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SORD;Zero;$;1|) $))
              (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SORD;One;$;2|) $))
              (|NonNegativeInteger|) (8 . |monomial|) |SORD;omega;$;3|
              |SORD;omegapower;2$;4| (|Boolean|) (14 . |zero?|)
              |SORD;zero?;$B;5| (19 . =) |SORD;one?;$B;6| |SORD;=;2$B;7|
              (|Integer|) (|SingleInteger|) (25 . |coerce|) (|HashState|)
              (30 . |hashUpdate!|) |SORD;hashUpdate!;Hs$Hs;8|
              |SORD;coerce;Nni$;9| (|Union| 11 '"failed") (36 . |retractIfCan|)
              |SORD;retractIfCan;$U;10| (41 . |ground?|) (46 . |ground|)
              (51 . |smaller?|) |SORD;<;2$B;11| (57 . +) |SORD;+;3$;12|
              (63 . *) |SORD;*;3$;13| (|Union| $ '"failed")
              (69 . |subtractIfCan|) |SORD;subtractIfCan;2$U;14|
              (75 . |degree|) (80 . >=) (86 . |leadingMonomial|)
              (91 . |reductum|) |SORD;ordinalAdd;3$;15|
              |SORD;integerPart;$Nni;16| |SORD;limitPart;2$;17| (96 . >)
              (|Mapping| $$ $$) (102 . |mapExponents|) (108 . *)
              |SORD;ordinalMul;3$;18| (114 . |retract|)
              |SORD;ordinalPower;3$;22| (119 . ^) |SORD;^;3$;23| (|OutputForm|)
              (125 . |coerce|) (|String|) (130 . |message|) (135 . ~=)
              (141 . |leadingCoefficient|) |SORD;coerce;$Of;24| (146 . ^)
              (152 . *) (158 . +) (|Mapping| 58 58 58) (|List| 58)
              (164 . |reduce|) (|PositiveInteger|))
           '#(~= 170 |zero?| 176 |subtractIfCan| 181 |smaller?| 187 |sample|
              193 |rightRecip| 197 |rightPower| 202 |retractIfCan| 214
              |retract| 219 |recip| 224 |ordinalPower| 229 |ordinalMul| 235
              |ordinalAdd| 241 |opposite?| 247 |one?| 253 |omegapower| 258
              |omega| 263 |min| 267 |max| 273 |limitPart| 279 |leftRecip| 284
              |leftPower| 289 |latex| 301 |integerPart| 306 |hashUpdate!| 311
              |hash| 317 |coerce| 322 |antiCommutator| 332 ^ 338 |Zero| 356
              |One| 360 >= 364 > 370 = 376 <= 382 < 388 - 394 + 405 * 411)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                NIL |Magma&| |AbelianSemiGroup&| |SetCategory&|
                |RetractableTo&| |BasicType&| |PartialOrder&| NIL)
             (CONS
              '#((|SemiRing|) (|SemiRng|) (|BiModule| $$ $$) (|RightModule| $$)
                 (|LeftModule| $$) (|OrderedAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|Monoid|) (|NonAssociativeSemiRing|) (|OrderedSet|)
                 (|AbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|RetractableTo| 11)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 58))
              (|makeByteWordVec2| 71
                                  '(0 6 0 7 0 6 0 9 2 6 0 11 2 12 1 6 15 0 16 2
                                    6 15 0 0 18 1 22 0 21 23 2 6 24 24 0 25 1 6
                                    28 0 29 1 6 15 0 31 1 6 11 0 32 2 6 15 0 0
                                    33 2 6 0 0 0 35 2 6 0 0 0 37 2 6 39 0 0 40
                                    1 6 2 0 42 2 0 15 0 0 43 1 6 0 0 44 1 6 0 0
                                    45 2 0 15 0 0 49 2 6 0 50 0 51 2 6 0 0 11
                                    52 1 0 11 0 54 2 0 0 0 11 56 1 11 58 0 59 1
                                    58 0 60 61 2 0 15 0 0 62 1 6 11 0 63 2 58 0
                                    0 0 65 2 58 0 0 0 66 2 58 0 0 0 67 2 69 58
                                    68 0 70 2 0 15 0 0 62 1 0 15 0 17 2 0 39 0
                                    0 41 2 0 15 0 0 1 0 0 0 1 1 0 39 0 1 2 0 0
                                    0 71 1 2 0 0 0 11 1 1 0 28 0 30 1 0 11 0 54
                                    1 0 39 0 1 2 0 0 0 0 55 2 0 0 0 0 53 2 0 0
                                    0 0 46 2 0 15 0 0 1 1 0 15 0 19 1 0 0 0 14
                                    0 0 0 13 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 48
                                    1 0 39 0 1 2 0 0 0 71 1 2 0 0 0 11 1 1 0 60
                                    0 1 1 0 11 0 47 2 0 24 24 0 26 1 0 22 0 1 1
                                    0 0 11 27 1 0 58 0 64 2 0 0 0 0 1 2 0 0 0 0
                                    57 2 0 0 0 71 1 2 0 0 0 11 56 0 0 0 8 0 0 0
                                    10 2 0 15 0 0 43 2 0 15 0 0 49 2 0 15 0 0
                                    20 2 0 15 0 0 1 2 0 15 0 0 34 2 1 0 0 0 1 1
                                    1 0 0 1 2 0 0 0 0 36 2 1 0 21 0 1 2 0 0 0 0
                                    38 2 0 0 11 0 1 2 0 0 71 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SmallOrdinal| 'NILADIC T) 
