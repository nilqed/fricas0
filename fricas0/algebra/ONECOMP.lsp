
(PUT '|ONECOMP;coerce;R$;1| '|SPADreplace| '(XLAM (|r|) (CONS 0 |r|))) 

(SDEFUN |ONECOMP;coerce;R$;1| ((|r| R) ($ $)) (CONS 0 |r|)) 

(SDEFUN |ONECOMP;retract;$R;2| ((|x| $) ($ R))
        (COND ((QEQCAR |x| 0) (QCDR |x|)) ('T (|error| "Not finite")))) 

(PUT '|ONECOMP;finite?;$B;3| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 0))) 

(SDEFUN |ONECOMP;finite?;$B;3| ((|x| $) ($ |Boolean|)) (QEQCAR |x| 0)) 

(PUT '|ONECOMP;infinite?;$B;4| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 1))) 

(SDEFUN |ONECOMP;infinite?;$B;4| ((|x| $) ($ |Boolean|)) (QEQCAR |x| 1)) 

(PUT '|ONECOMP;infinity;$;5| '|SPADreplace| '(XLAM NIL (CONS 1 "infinity"))) 

(SDEFUN |ONECOMP;infinity;$;5| (($ $)) (CONS 1 "infinity")) 

(SDEFUN |ONECOMP;retractIfCan;$U;6| ((|x| $) ($ |Union| R "failed"))
        (COND ((QEQCAR |x| 0) (CONS 0 (QCDR |x|))) ('T (CONS 1 "failed")))) 

(SDEFUN |ONECOMP;coerce;$Of;7| ((|x| $) ($ |OutputForm|))
        (COND ((QEQCAR |x| 1) (SPADCALL '|infinity| (QREFELT $ 18)))
              ('T (SPADCALL (QCDR |x|) (QREFELT $ 19))))) 

(SDEFUN |ONECOMP;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((QEQCAR |x| 1) (QEQCAR |y| 1)) ((QEQCAR |y| 1) NIL)
              ('T (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 21))))) 

(SDEFUN |ONECOMP;Zero;$;9| (($ $)) (CONS 0 (|spadConstant| $ 23))) 

(SDEFUN |ONECOMP;*;I2$;10| ((|n| |Integer|) (|x| $) ($ $))
        (COND
         ((QEQCAR |x| 1)
          (COND ((ZEROP |n|) (|error| "Undefined product"))
                (#1='T (SPADCALL (QREFELT $ 13)))))
         (#1# (CONS 0 (SPADCALL |n| (QCDR |x|) (QREFELT $ 26)))))) 

(SDEFUN |ONECOMP;-;2$;11| ((|x| $) ($ $))
        (COND ((QEQCAR |x| 1) (|error| "Undefined inverse"))
              ('T (CONS 0 (SPADCALL (QCDR |x|) (QREFELT $ 28)))))) 

(SDEFUN |ONECOMP;+;3$;12| ((|x| $) (|y| $) ($ $))
        (COND ((QEQCAR |x| 1) |x|) ((QEQCAR |y| 1) |y|)
              ('T (CONS 0 (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 30)))))) 

(SDEFUN |ONECOMP;One;$;13| (($ $)) (CONS 0 (|spadConstant| $ 32))) 

(SDEFUN |ONECOMP;characteristic;Nni;14| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 35))) 

(SDEFUN |ONECOMP;fininf| ((|r| R) ($ $))
        (COND ((SPADCALL |r| (QREFELT $ 37)) (|error| "Undefined product"))
              ('T (SPADCALL (QREFELT $ 13))))) 

(SDEFUN |ONECOMP;*;3$;16| ((|x| $) (|y| $) ($ $))
        (COND
         ((QEQCAR |x| 1)
          (COND ((QEQCAR |y| 1) |y|) (#1='T (|ONECOMP;fininf| (QCDR |y|) $))))
         ((QEQCAR |y| 1) (|ONECOMP;fininf| (QCDR |x|) $))
         (#1# (CONS 0 (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 38)))))) 

(SDEFUN |ONECOMP;recip;$U;17| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND ((QEQCAR |x| 1) (CONS 0 (|spadConstant| $ 24)))
                      ((SPADCALL (QCDR |x|) (QREFELT $ 37))
                       (CONS 0 (SPADCALL (QREFELT $ 13))))
                      (#2='T
                       (SEQ
                        (LETT |u| (SPADCALL (QCDR |x|) (QREFELT $ 41))
                              |ONECOMP;recip;$U;17|)
                        (EXIT
                         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                               (#2# (CONS 0 (CONS 0 (QCDR |u|)))))))))))) 

(SDEFUN |ONECOMP;<;2$B;18| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((QEQCAR |x| 1) NIL) ((QEQCAR |y| 1) 'T)
              ('T (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 43))))) 

(SDEFUN |ONECOMP;rational?;$B;19| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 11))) 

(SDEFUN |ONECOMP;rational;$F;20| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (CONS 0 (SPADCALL |x| (QREFELT $ 9))) (QREFELT $ 47))) 

(SDEFUN |ONECOMP;rationalIfCan;$U;21|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 15))
                      |ONECOMP;rationalIfCan;$U;21|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 48))))))))) 

(DECLAIM (NOTINLINE |OnePointCompletion;|)) 

(DEFUN |OnePointCompletion| (#1=#:G770)
  (SPROG NIL
         (PROG (#2=#:G771)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OnePointCompletion|)
                                               '|domainEqualList|)
                    . #3=(|OnePointCompletion|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|OnePointCompletion;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OnePointCompletion|)))))))))) 

(DEFUN |OnePointCompletion;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G769 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|OnePointCompletion|))
          (LETT |dv$| (LIST '|OnePointCompletion| DV$1) . #2#)
          (LETT $ (GETREFV 56) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|OrderedRing|))
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|AbelianGroup|))
                                                    . #2#)
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|OrderedRing|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|OrderedRing|)))
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|OnePointCompletion| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Union| |#1| "infinity"))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 24
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ONECOMP;Zero;$;9|) $
                                   24)))
             (QSETREFV $ 27 (CONS (|dispatchFunction| |ONECOMP;*;I2$;10|) $))
             (QSETREFV $ 29 (CONS (|dispatchFunction| |ONECOMP;-;2$;11|) $))
             (QSETREFV $ 31 (CONS (|dispatchFunction| |ONECOMP;+;3$;12|) $)))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 33
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ONECOMP;One;$;13|) $
                                   33)))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction| |ONECOMP;characteristic;Nni;14|)
                        $))
             (QSETREFV $ 39 (CONS (|dispatchFunction| |ONECOMP;*;3$;16|) $))
             (QSETREFV $ 42
                       (CONS (|dispatchFunction| |ONECOMP;recip;$U;17|) $))
             (QSETREFV $ 44
                       (CONS (|dispatchFunction| |ONECOMP;<;2$B;18|) $)))))
          (COND
           ((|testBitVector| |pv$| 7)
            (PROGN
             (QSETREFV $ 45
                       (CONS (|dispatchFunction| |ONECOMP;rational?;$B;19|) $))
             (QSETREFV $ 47
                       (CONS (|dispatchFunction| |ONECOMP;rational;$F;20|) $))
             (QSETREFV $ 50
                       (CONS (|dispatchFunction| |ONECOMP;rationalIfCan;$U;21|)
                             $)))))
          $))) 

(MAKEPROP '|OnePointCompletion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |ONECOMP;coerce;R$;1| |ONECOMP;retract;$R;2| (|Boolean|)
              |ONECOMP;finite?;$B;3| |ONECOMP;infinite?;$B;4|
              |ONECOMP;infinity;$;5| (|Union| 6 '"failed")
              |ONECOMP;retractIfCan;$U;6| (|OutputForm|) (|Symbol|)
              (0 . |coerce|) (5 . |coerce|) |ONECOMP;coerce;$Of;7| (10 . =)
              |ONECOMP;=;2$B;8| (16 . |Zero|) (20 . |Zero|) (|Integer|)
              (24 . *) (30 . *) (36 . -) (41 . -) (46 . +) (52 . +)
              (58 . |One|) (62 . |One|) (|NonNegativeInteger|)
              (66 . |characteristic|) (70 . |characteristic|) (74 . |zero?|)
              (79 . *) (85 . *) (|Union| $ '"failed") (91 . |recip|)
              (96 . |recip|) (101 . <) (107 . <) (113 . |rational?|)
              (|Fraction| 25) (118 . |rational|) (123 . |rational|)
              (|Union| 46 '"failed") (128 . |rationalIfCan|)
              (|PositiveInteger|) (|Union| 25 '"failed") (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 133 |zero?| 139 |subtractIfCan| 144 |smaller?| 150 |sign| 156
              |sample| 161 |retractIfCan| 165 |retract| 180 |recip| 195
              |rationalIfCan| 200 |rational?| 205 |rational| 210 |positive?|
              215 |opposite?| 220 |one?| 226 |negative?| 231 |min| 236 |max|
              242 |latex| 248 |infinity| 253 |infinite?| 257 |hashUpdate!| 262
              |hash| 268 |finite?| 273 |coerce| 278 |characteristic| 298
              |annihilate?| 302 |abs| 308 ^ 313 |Zero| 325 |One| 329 >= 333 >
              339 = 345 <= 351 < 357 - 363 + 374 * 380)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(3 3 3 3 3 3 3 3 5 3 3 5 3 3 3 5 3 3 5 0 0 0 0
                                  0 1 2 3 3))
            (CONS
             '#(|OrderedRing&| NIL NIL |Ring&| NIL NIL |Rng&| NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| NIL |Monoid&|
                |AbelianMonoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |SetCategory&| |FullyRetractableTo&| |BasicType&|
                |RetractableTo&| NIL |RetractableTo&| |RetractableTo&|
                |PartialOrder&| NIL)
             (CONS
              '#((|OrderedRing|) (|CharacteristicZero|) (|OrderedAbelianGroup|)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedSet|) (|SemiRng|)
                 (|Monoid|) (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|FullyRetractableTo| 6)
                 (|BasicType|) (|RetractableTo| 6) (|CoercibleTo| 16)
                 (|RetractableTo| 46) (|RetractableTo| 25) (|PartialOrder|)
                 (|unitsKnown|))
              (|makeByteWordVec2| 55
                                  '(1 17 16 0 18 1 6 16 0 19 2 6 10 0 0 21 0 6
                                    0 23 0 0 0 24 2 6 0 25 0 26 2 0 0 25 0 27 1
                                    6 0 0 28 1 0 0 0 29 2 6 0 0 0 30 2 0 0 0 0
                                    31 0 6 0 32 0 0 0 33 0 6 34 35 0 0 34 36 1
                                    6 10 0 37 2 6 0 0 0 38 2 0 0 0 0 39 1 6 40
                                    0 41 1 0 40 0 42 2 6 10 0 0 43 2 0 10 0 0
                                    44 1 0 10 0 45 1 0 46 0 47 1 6 46 0 48 1 0
                                    49 0 50 2 0 10 0 0 1 1 4 10 0 1 2 4 40 0 0
                                    1 2 3 10 0 0 1 1 3 25 0 1 0 4 0 1 1 1 49 0
                                    1 1 2 52 0 1 1 0 14 0 15 1 1 46 0 1 1 2 25
                                    0 1 1 0 6 0 9 1 3 40 0 42 1 7 49 0 50 1 7
                                    10 0 45 1 7 46 0 47 1 3 10 0 1 2 4 10 0 0 1
                                    1 3 10 0 1 1 3 10 0 1 2 3 0 0 0 1 2 3 0 0 0
                                    1 1 0 54 0 1 0 0 0 13 1 0 10 0 12 2 0 53 53
                                    0 1 1 0 55 0 1 1 0 10 0 11 1 6 0 25 1 1 1 0
                                    46 1 1 0 0 6 8 1 0 16 0 20 0 3 34 36 2 3 10
                                    0 0 1 1 3 0 0 1 2 3 0 0 51 1 2 3 0 0 34 1 0
                                    4 0 24 0 3 0 33 2 3 10 0 0 1 2 3 10 0 0 1 2
                                    0 10 0 0 22 2 3 10 0 0 1 2 3 10 0 0 44 2 4
                                    0 0 0 1 1 4 0 0 29 2 4 0 0 0 31 2 4 0 25 0
                                    27 2 4 0 34 0 1 2 4 0 51 0 1 2 3 0 0 0
                                    39)))))
           '|lookupComplete|)) 
