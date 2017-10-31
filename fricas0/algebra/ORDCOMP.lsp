
(PUT '|ORDCOMP;coerce;R$;1| '|SPADreplace| '(XLAM (|r|) (CONS 0 |r|))) 

(SDEFUN |ORDCOMP;coerce;R$;1| ((|r| R) ($ $)) (CONS 0 |r|)) 

(SDEFUN |ORDCOMP;retract;$R;2| ((|x| $) ($ R))
        (COND ((QEQCAR |x| 0) (CDR |x|)) ('T (|error| "Not finite")))) 

(PUT '|ORDCOMP;finite?;$B;3| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 0))) 

(SDEFUN |ORDCOMP;finite?;$B;3| ((|x| $) ($ |Boolean|)) (QEQCAR |x| 0)) 

(PUT '|ORDCOMP;infinite?;$B;4| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 1))) 

(SDEFUN |ORDCOMP;infinite?;$B;4| ((|x| $) ($ |Boolean|)) (QEQCAR |x| 1)) 

(SDEFUN |ORDCOMP;plusInfinity;$;5| (($ $)) (CONS 1 'T)) 

(PUT '|ORDCOMP;minusInfinity;$;6| '|SPADreplace| '(XLAM NIL (CONS 1 NIL))) 

(SDEFUN |ORDCOMP;minusInfinity;$;6| (($ $)) (CONS 1 NIL)) 

(SDEFUN |ORDCOMP;retractIfCan;$U;7| ((|x| $) ($ |Union| R "failed"))
        (COND ((QEQCAR |x| 0) (CONS 0 (CDR |x|))) ('T (CONS 1 "failed")))) 

(SDEFUN |ORDCOMP;coerce;$Of;8| ((|x| $) ($ |OutputForm|))
        (SPROG ((|e| (|OutputForm|)))
               (SEQ
                (COND ((QEQCAR |x| 0) (SPADCALL (CDR |x|) (QREFELT $ 18)))
                      (#1='T
                       (SEQ
                        (LETT |e| (SPADCALL '|infinity| (QREFELT $ 20))
                              |ORDCOMP;coerce;$Of;8|)
                        (EXIT
                         (COND
                          ((CDR |x|)
                           (SPADCALL (SPADCALL (QREFELT $ 21)) |e|
                                     (QREFELT $ 22)))
                          (#1# (SPADCALL |e| (QREFELT $ 23))))))))))) 

(SDEFUN |ORDCOMP;whatInfinity;$Si;9| ((|x| $) ($ |SingleInteger|))
        (COND ((QEQCAR |x| 0) 0) ((CDR |x|) 1) ('T -1))) 

(SDEFUN |ORDCOMP;=;2$B;10| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((QEQCAR |x| 1)
          (COND
           ((QEQCAR |y| 1)
            (NULL (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 27))))
           (#1='T NIL)))
         ((QEQCAR |y| 1) NIL)
         (#1# (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 28))))) 

(SDEFUN |ORDCOMP;Zero;$;11| (($ $)) (CONS 0 (|spadConstant| $ 30))) 

(SDEFUN |ORDCOMP;*;I2$;12| ((|n| |Integer|) (|x| $) ($ $))
        (COND
         ((QEQCAR |x| 1)
          (COND ((SPADCALL |n| 0 (QREFELT $ 33)) |x|)
                ((< |n| 0) (CONS 1 (NULL (CDR |x|))))
                (#1='T (|error| "Undefined product"))))
         (#1# (CONS 0 (SPADCALL |n| (CDR |x|) (QREFELT $ 34)))))) 

(SDEFUN |ORDCOMP;-;2$;13| ((|x| $) ($ $))
        (COND ((QEQCAR |x| 1) (CONS 1 (NULL (CDR |x|))))
              ('T (CONS 0 (SPADCALL (CDR |x|) (QREFELT $ 36)))))) 

(SDEFUN |ORDCOMP;+;3$;14| ((|x| $) (|y| $) ($ $))
        (COND
         ((QEQCAR |x| 1)
          (COND
           ((OR (QEQCAR |y| 0)
                (NULL (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 27))))
            |x|)
           ('T (|error| "Undefined sum"))))
         ((QEQCAR |y| 1) |y|)
         ('T (CONS 0 (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 38)))))) 

(SDEFUN |ORDCOMP;One;$;15| (($ $)) (CONS 0 (|spadConstant| $ 40))) 

(SDEFUN |ORDCOMP;characteristic;Nni;16| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 43))) 

(SDEFUN |ORDCOMP;fininf| ((|b| |Boolean|) (|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 30) (QREFELT $ 45)) (CONS 1 |b|))
         ((SPADCALL |r| (|spadConstant| $ 30) (QREFELT $ 46))
          (CONS 1 (NULL |b|)))
         ('T (|error| "Undefined product")))) 

(SDEFUN |ORDCOMP;*;3$;18| ((|x| $) (|y| $) ($ $))
        (COND
         ((QEQCAR |x| 1)
          (COND
           ((QEQCAR |y| 1)
            (COND
             ((SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 27))
              (SPADCALL (QREFELT $ 14)))
             (#1='T (SPADCALL (QREFELT $ 13)))))
           (#1# (|ORDCOMP;fininf| (CDR |x|) (CDR |y|) $))))
         ((QEQCAR |y| 1) (|ORDCOMP;fininf| (CDR |y|) (CDR |x|) $))
         (#1# (CONS 0 (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 47)))))) 

(SDEFUN |ORDCOMP;recip;$U;19| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND ((QEQCAR |x| 1) (CONS 0 (|spadConstant| $ 31)))
                      (#2='T
                       (SEQ
                        (LETT |u| (SPADCALL (CDR |x|) (QREFELT $ 50))
                              |ORDCOMP;recip;$U;19|)
                        (EXIT
                         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                               (#2# (CONS 0 (CONS 0 (QCDR |u|)))))))))))) 

(SDEFUN |ORDCOMP;<;2$B;20| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((QEQCAR |x| 1)
          (COND
           ((QEQCAR |y| 1)
            (COND ((SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 27)) (CDR |y|))
                  (#1='T NIL)))
           (#1# (NULL (CDR |x|)))))
         ((QEQCAR |y| 1) (CDR |y|))
         (#1# (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 46))))) 

(SDEFUN |ORDCOMP;rational?;$B;21| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 11))) 

(SDEFUN |ORDCOMP;rational;$F;22| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 55))) 

(SDEFUN |ORDCOMP;rationalIfCan;$U;23|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 16))
                      |ORDCOMP;rationalIfCan;$U;23|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 55))))))))) 

(DECLAIM (NOTINLINE |OrderedCompletion;|)) 

(DEFUN |OrderedCompletion| (#1=#:G790)
  (SPROG NIL
         (PROG (#2=#:G791)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OrderedCompletion|)
                                               '|domainEqualList|)
                    . #3=(|OrderedCompletion|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|OrderedCompletion;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OrderedCompletion|)))))))))) 

(DEFUN |OrderedCompletion;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G789 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|OrderedCompletion|))
          (LETT |dv$| (LIST '|OrderedCompletion| DV$1) . #2#)
          (LETT $ (GETREFV 63) . #2#)
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
          (|haddProp| |$ConstructorCache| '|OrderedCompletion| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Union| (|:| |fin| |#1|) (|:| |inf| (|Boolean|))))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 31
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ORDCOMP;Zero;$;11|) $
                                   31)))
             (QSETREFV $ 35 (CONS (|dispatchFunction| |ORDCOMP;*;I2$;12|) $))
             (QSETREFV $ 37 (CONS (|dispatchFunction| |ORDCOMP;-;2$;13|) $))
             (QSETREFV $ 39 (CONS (|dispatchFunction| |ORDCOMP;+;3$;14|) $)))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 41
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |ORDCOMP;One;$;15|) $
                                   41)))
             (QSETREFV $ 44
                       (CONS
                        (|dispatchFunction| |ORDCOMP;characteristic;Nni;16|)
                        $))
             (QSETREFV $ 48 (CONS (|dispatchFunction| |ORDCOMP;*;3$;18|) $))
             (QSETREFV $ 51
                       (CONS (|dispatchFunction| |ORDCOMP;recip;$U;19|) $))
             (QSETREFV $ 52
                       (CONS (|dispatchFunction| |ORDCOMP;<;2$B;20|) $)))))
          (COND
           ((|testBitVector| |pv$| 7)
            (PROGN
             (QSETREFV $ 53
                       (CONS (|dispatchFunction| |ORDCOMP;rational?;$B;21|) $))
             (QSETREFV $ 56
                       (CONS (|dispatchFunction| |ORDCOMP;rational;$F;22|) $))
             (QSETREFV $ 58
                       (CONS (|dispatchFunction| |ORDCOMP;rationalIfCan;$U;23|)
                             $)))))
          $))) 

(MAKEPROP '|OrderedCompletion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |ORDCOMP;coerce;R$;1| |ORDCOMP;retract;$R;2| (|Boolean|)
              |ORDCOMP;finite?;$B;3| |ORDCOMP;infinite?;$B;4|
              |ORDCOMP;plusInfinity;$;5| |ORDCOMP;minusInfinity;$;6|
              (|Union| 6 '"failed") |ORDCOMP;retractIfCan;$U;7| (|OutputForm|)
              (0 . |coerce|) (|Symbol|) (5 . |coerce|) (10 . |empty|) (14 . +)
              (20 . -) |ORDCOMP;coerce;$Of;8| (|SingleInteger|)
              |ORDCOMP;whatInfinity;$Si;9| (25 . |xor|) (31 . =)
              |ORDCOMP;=;2$B;10| (37 . |Zero|) (41 . |Zero|) (|Integer|)
              (45 . >) (51 . *) (57 . *) (63 . -) (68 . -) (73 . +) (79 . +)
              (85 . |One|) (89 . |One|) (|NonNegativeInteger|)
              (93 . |characteristic|) (97 . |characteristic|) (101 . >)
              (107 . <) (113 . *) (119 . *) (|Union| $ '"failed")
              (125 . |recip|) (130 . |recip|) (135 . <) (141 . |rational?|)
              (|Fraction| 32) (146 . |rational|) (151 . |rational|)
              (|Union| 54 '"failed") (156 . |rationalIfCan|)
              (|PositiveInteger|) (|Union| 32 '"failed") (|HashState|)
              (|String|))
           '#(~= 161 |zero?| 167 |whatInfinity| 172 |subtractIfCan| 177
              |smaller?| 183 |sign| 189 |sample| 194 |retractIfCan| 198
              |retract| 213 |recip| 228 |rationalIfCan| 233 |rational?| 238
              |rational| 243 |positive?| 248 |plusInfinity| 253 |opposite?| 257
              |one?| 263 |negative?| 268 |minusInfinity| 273 |min| 277 |max|
              283 |latex| 289 |infinite?| 294 |hashUpdate!| 299 |hash| 305
              |finite?| 310 |coerce| 315 |characteristic| 335 |annihilate?| 339
              |abs| 345 ^ 350 |Zero| 362 |One| 366 >= 370 > 376 = 382 <= 388 <
              394 - 400 + 411 * 417)
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
                 (|BasicType|) (|RetractableTo| 6) (|CoercibleTo| 17)
                 (|RetractableTo| 54) (|RetractableTo| 32) (|PartialOrder|)
                 (|unitsKnown|))
              (|makeByteWordVec2| 62
                                  '(1 6 17 0 18 1 19 17 0 20 0 17 0 21 2 17 0 0
                                    0 22 1 17 0 0 23 2 10 0 0 0 27 2 6 10 0 0
                                    28 0 6 0 30 0 0 0 31 2 32 10 0 0 33 2 6 0
                                    32 0 34 2 0 0 32 0 35 1 6 0 0 36 1 0 0 0 37
                                    2 6 0 0 0 38 2 0 0 0 0 39 0 6 0 40 0 0 0 41
                                    0 6 42 43 0 0 42 44 2 6 10 0 0 45 2 6 10 0
                                    0 46 2 6 0 0 0 47 2 0 0 0 0 48 1 6 49 0 50
                                    1 0 49 0 51 2 0 10 0 0 52 1 0 10 0 53 1 6
                                    54 0 55 1 0 54 0 56 1 0 57 0 58 2 0 10 0 0
                                    1 1 4 10 0 1 1 0 25 0 26 2 4 49 0 0 1 2 3
                                    10 0 0 1 1 3 32 0 1 0 4 0 1 1 1 57 0 1 1 2
                                    60 0 1 1 0 15 0 16 1 1 54 0 1 1 2 32 0 1 1
                                    0 6 0 9 1 3 49 0 51 1 7 57 0 58 1 7 10 0 53
                                    1 7 54 0 56 1 3 10 0 1 0 0 0 13 2 4 10 0 0
                                    1 1 3 10 0 1 1 3 10 0 1 0 0 0 14 2 3 0 0 0
                                    1 2 3 0 0 0 1 1 0 62 0 1 1 0 10 0 12 2 0 61
                                    61 0 1 1 0 25 0 1 1 0 10 0 11 1 6 0 32 1 1
                                    1 0 54 1 1 0 0 6 8 1 0 17 0 24 0 3 42 44 2
                                    3 10 0 0 1 1 3 0 0 1 2 3 0 0 59 1 2 3 0 0
                                    42 1 0 4 0 31 0 3 0 41 2 3 10 0 0 1 2 3 10
                                    0 0 1 2 0 10 0 0 29 2 3 10 0 0 1 2 3 10 0 0
                                    52 2 4 0 0 0 1 1 4 0 0 37 2 4 0 0 0 39 2 4
                                    0 32 0 35 2 4 0 42 0 1 2 4 0 59 0 1 2 3 0 0
                                    0 48)))))
           '|lookupComplete|)) 
