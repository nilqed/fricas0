
(SDEFUN |FNLA;dimension;Nni;1| (($ |NonNegativeInteger|))
        (QVSIZE (QREFELT $ 14))) 

(SDEFUN |FNLA;have| ((|i| |Integer|) (|j| |Integer|) ($ $))
        (SPROG
         ((|hi| (|Integer|)) (|lo| (|Integer|)) (|mid| (|Integer|))
          (|wt| (|Integer|)))
         (SEQ
          (LETT |wt|
                (+
                 (SPADCALL (SPADCALL (QREFELT $ 14) |i| (QREFELT $ 18)) 2
                           (QREFELT $ 19))
                 (SPADCALL (SPADCALL (QREFELT $ 14) |j| (QREFELT $ 18)) 2
                           (QREFELT $ 19)))
                . #1=(|FNLA;have|))
          (EXIT
           (COND
            ((SPADCALL |wt| (QREFELT $ 7) (QREFELT $ 21))
             (|spadConstant| $ 22))
            ('T
             (SEQ (LETT |lo| 1 . #1#)
                  (LETT |hi| (SPADCALL (QREFELT $ 15)) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL (- |hi| |lo|) 1 (QREFELT $ 21)))
                         (GO G191)))
                       (SEQ (LETT |mid| (QUOTIENT2 (+ |hi| |lo|) 2) . #1#)
                            (EXIT
                             (COND
                              ((<
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 14) |mid| (QREFELT $ 18))
                                 2 (QREFELT $ 19))
                                |wt|)
                               (LETT |lo| |mid| . #1#))
                              ('T (LETT |hi| |mid| . #1#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (SEQ G190
                       (COND
                        ((NULL
                          (<
                           (SPADCALL
                            (SPADCALL (QREFELT $ 14) |hi| (QREFELT $ 18)) 1
                            (QREFELT $ 19))
                           |i|))
                         (GO G191)))
                       (SEQ (EXIT (LETT |hi| (+ |hi| 1) . #1#))) NIL (GO G190)
                       G191 (EXIT NIL))
                  (SEQ G190
                       (COND
                        ((NULL
                          (<
                           (SPADCALL
                            (SPADCALL (QREFELT $ 14) |hi| (QREFELT $ 18)) 3
                            (QREFELT $ 19))
                           |j|))
                         (GO G191)))
                       (SEQ (EXIT (LETT |hi| (+ |hi| 1) . #1#))) NIL (GO G190)
                       G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL (|spadConstant| $ 25)
                             (SPADCALL |hi| (QREFELT $ 24))
                             (QREFELT $ 26)))))))))) 

(SDEFUN |FNLA;generator;Nni$;3| ((|i| |NonNegativeInteger|) ($ $))
        (COND
         ((SPADCALL |i| (SPADCALL (QREFELT $ 15)) (QREFELT $ 27))
          (|spadConstant| $ 28))
         ('T
          (SPADCALL (|spadConstant| $ 25) (SPADCALL |i| (QREFELT $ 24))
                    (QREFELT $ 26))))) 

(SDEFUN |FNLA;putIn| ((|i| |Integer|) ($ $))
        (SPADCALL (|spadConstant| $ 25) (SPADCALL |i| (QREFELT $ 24))
                  (QREFELT $ 26))) 

(SDEFUN |FNLA;brkt| ((|k| |Integer|) (|f| $) ($ $))
        (SPROG ((|dg| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |f| (|spadConstant| $ 22) (QREFELT $ 30))
                  (|spadConstant| $ 22))
                 (#1='T
                  (SEQ
                   (LETT |dg|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 31))
                                   (QREFELT $ 32))
                         |FNLA;brkt|)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |f| (QREFELT $ 33))
                                (|spadConstant| $ 22) (QREFELT $ 30))
                      (COND ((EQL |k| |dg|) (|spadConstant| $ 22))
                            ((SPADCALL |k| |dg| (QREFELT $ 21))
                             (SPADCALL
                              (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                                        (|FNLA;brkt| |dg| (|FNLA;putIn| |k| $)
                                         $)
                                        (QREFELT $ 35))
                              (QREFELT $ 36)))
                            (#1#
                             (COND
                              ((SPADCALL (QREFELT $ 6) |k| |dg|
                                         (SPADCALL
                                          (SPADCALL (QREFELT $ 14) |dg|
                                                    (QREFELT $ 18))
                                          1 (QREFELT $ 19))
                                         (QREFELT $ 37))
                               (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                                         (|FNLA;have| |k| |dg| $)
                                         (QREFELT $ 35)))
                              (#1#
                               (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                                         (SPADCALL
                                          (|FNLA;brkt|
                                           (SPADCALL
                                            (SPADCALL (QREFELT $ 14) |dg|
                                                      (QREFELT $ 18))
                                            1 (QREFELT $ 19))
                                           (|FNLA;brkt| |k|
                                            (|FNLA;putIn|
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 14) |dg|
                                                        (QREFELT $ 18))
                                              3 (QREFELT $ 19))
                                             $)
                                            $)
                                           $)
                                          (|FNLA;brkt|
                                           (SPADCALL
                                            (SPADCALL (QREFELT $ 14) |dg|
                                                      (QREFELT $ 18))
                                            3 (QREFELT $ 19))
                                           (|FNLA;brkt| |k|
                                            (|FNLA;putIn|
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 14) |dg|
                                                        (QREFELT $ 18))
                                              1 (QREFELT $ 19))
                                             $)
                                            $)
                                           $)
                                          (QREFELT $ 38))
                                         (QREFELT $ 35)))))))
                     (#1#
                      (SPADCALL
                       (|FNLA;brkt| |k|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                                  (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 26))
                        $)
                       (|FNLA;brkt| |k| (SPADCALL |f| (QREFELT $ 33)) $)
                       (QREFELT $ 39))))))))))) 

(SDEFUN |FNLA;*;3$;6| ((|f| $) (|g| $) ($ $))
        (COND
         ((SPADCALL (SPADCALL |f| (QREFELT $ 33)) (|spadConstant| $ 22)
                    (QREFELT $ 30))
          (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                    (|FNLA;brkt|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 32))
                     |g| $)
                    (QREFELT $ 35)))
         ('T
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                      (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 26))
            |g| (QREFELT $ 40))
           (SPADCALL (SPADCALL |f| (QREFELT $ 33)) |g| (QREFELT $ 40))
           (QREFELT $ 39))))) 

(SDEFUN |FNLA;Fac| ((|m| |Integer|) ($ |Commutator|))
        (COND
         ((EQL
           (SPADCALL (SPADCALL (QREFELT $ 14) |m| (QREFELT $ 18)) 1
                     (QREFELT $ 19))
           0)
          (SPADCALL |m| (QREFELT $ 42)))
         ('T
          (SPADCALL
           (|FNLA;Fac|
            (SPADCALL (SPADCALL (QREFELT $ 14) |m| (QREFELT $ 18)) 1
                      (QREFELT $ 19))
            $)
           (|FNLA;Fac|
            (SPADCALL (SPADCALL (QREFELT $ 14) |m| (QREFELT $ 18)) 3
                      (QREFELT $ 19))
            $)
           (QREFELT $ 43))))) 

(SDEFUN |FNLA;shallowE| ((|r| R) (|s| |OrdSetInts|) ($ |OutputForm|))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (SPADCALL |s| (QREFELT $ 32)) |FNLA;shallowE|)
                    (EXIT
                     (COND
                      ((SPADCALL |r| (|spadConstant| $ 25) (QREFELT $ 44))
                       (COND
                        ((SPADCALL |k| (QREFELT $ 6) (QREFELT $ 45))
                         (SPADCALL |s| (QREFELT $ 47)))
                        (#1='T
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT $ 14) |k| (QREFELT $ 18)) 1
                             (QREFELT $ 19))
                            (QREFELT $ 42))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT $ 14) |k| (QREFELT $ 18)) 3
                             (QREFELT $ 19))
                            (QREFELT $ 42))
                           (QREFELT $ 43))
                          (QREFELT $ 48)))))
                      ((SPADCALL |k| (QREFELT $ 6) (QREFELT $ 45))
                       (SPADCALL (SPADCALL |r| (QREFELT $ 49))
                                 (SPADCALL |s| (QREFELT $ 47)) (QREFELT $ 50)))
                      (#1#
                       (SPADCALL (SPADCALL |r| (QREFELT $ 49))
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 14) |k|
                                               (QREFELT $ 18))
                                     1 (QREFELT $ 19))
                                    (QREFELT $ 42))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 14) |k|
                                               (QREFELT $ 18))
                                     3 (QREFELT $ 19))
                                    (QREFELT $ 42))
                                   (QREFELT $ 43))
                                  (QREFELT $ 48))
                                 (QREFELT $ 50)))))))) 

(SDEFUN |FNLA;shallowExpand;$Of;9| ((|f| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |f| (|spadConstant| $ 22) (QREFELT $ 30))
          (SPADCALL 0 (QREFELT $ 51)))
         ((SPADCALL (SPADCALL |f| (QREFELT $ 33)) (|spadConstant| $ 22)
                    (QREFELT $ 30))
          (|FNLA;shallowE| (SPADCALL |f| (QREFELT $ 34))
           (SPADCALL |f| (QREFELT $ 31)) $))
         ('T
          (SPADCALL
           (|FNLA;shallowE| (SPADCALL |f| (QREFELT $ 34))
            (SPADCALL |f| (QREFELT $ 31)) $)
           (SPADCALL (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 52))
           (QREFELT $ 53))))) 

(SDEFUN |FNLA;deepExpand;$Of;10| ((|f| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |f| (|spadConstant| $ 22) (QREFELT $ 30))
          (SPADCALL 0 (QREFELT $ 51)))
         ((SPADCALL (SPADCALL |f| (QREFELT $ 33)) (|spadConstant| $ 22)
                    (QREFELT $ 30))
          (COND
           ((SPADCALL (SPADCALL |f| (QREFELT $ 34)) (|spadConstant| $ 25)
                      (QREFELT $ 44))
            (SPADCALL
             (|FNLA;Fac|
              (SPADCALL (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 32)) $)
             (QREFELT $ 48)))
           (#1='T
            (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 34)) (QREFELT $ 49))
                      (SPADCALL
                       (|FNLA;Fac|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 32))
                        $)
                       (QREFELT $ 48))
                      (QREFELT $ 50)))))
         ((SPADCALL (SPADCALL |f| (QREFELT $ 34)) (|spadConstant| $ 25)
                    (QREFELT $ 44))
          (SPADCALL
           (SPADCALL
            (|FNLA;Fac| (SPADCALL (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 32))
             $)
            (QREFELT $ 48))
           (SPADCALL (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 54))
           (QREFELT $ 53)))
         (#1#
          (SPADCALL
           (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 34)) (QREFELT $ 49))
                     (SPADCALL
                      (|FNLA;Fac|
                       (SPADCALL (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 32))
                       $)
                      (QREFELT $ 48))
                     (QREFELT $ 50))
           (SPADCALL (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 54))
           (QREFELT $ 53))))) 

(DECLAIM (NOTINLINE |FreeNilpotentLie;|)) 

(DEFUN |FreeNilpotentLie| (&REST #1=#:G746)
  (SPROG NIL
         (PROG (#2=#:G747)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FreeNilpotentLie|)
                                               '|domainEqualList|)
                    . #3=(|FreeNilpotentLie|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FreeNilpotentLie;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FreeNilpotentLie|)))))))))) 

(DEFUN |FreeNilpotentLie;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FreeNilpotentLie|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|FreeNilpotentLie| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 60) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FreeNilpotentLie|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (|FreeModule| |#3| (|OrdSetInts|)))
          (QSETREFV $ 14 (SPADCALL |#1| |#2| (QREFELT $ 13)))
          $))) 

(MAKEPROP '|FreeNilpotentLie| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 8 23) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Vector| 16)
              (|NonNegativeInteger|) (|HallBasis|) (0 . |basis|) '|coms|
              |FNLA;dimension;Nni;1| (|List| 17) (|Integer|) (6 . |elt|)
              (12 . |elt|) (|Boolean|) (18 . >) (24 . |Zero|) (|OrdSetInts|)
              (28 . |coerce|) (33 . |One|) (37 . |monomial|) (43 . >)
              (49 . |Zero|) |FNLA;generator;Nni$;3| (53 . =)
              (59 . |leadingSupport|) (64 . |value|) (69 . |reductum|)
              (74 . |leadingCoefficient|) (79 . *) (85 . -)
              (90 . |inHallBasis?|) (98 . -) (104 . +) |FNLA;*;3$;6|
              (|Commutator|) (110 . |mkcomm|) (115 . |mkcomm|) (121 . =)
              (127 . <=) (|OutputForm|) (133 . |coerce|) (138 . |coerce|)
              (143 . |coerce|) (148 . *) (154 . |coerce|)
              |FNLA;shallowExpand;$Of;9| (159 . +) |FNLA;deepExpand;$Of;10|
              (|PositiveInteger|) (|Union| $ '"failed") (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 165 |zero?| 171 |subtractIfCan| 176 |shallowExpand| 182
              |sample| 187 |rightPower| 191 |plenaryPower| 197 |opposite?| 203
              |leftPower| 209 |latex| 215 |hashUpdate!| 220 |hash| 226
              |generator| 231 |dimension| 236 |deepExpand| 240 |commutator| 245
              |coerce| 251 |associator| 256 |antiCommutator| 263 ^ 269 |Zero|
              275 = 279 - 285 + 296 * 302)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|NonAssociativeAlgebra&| |Module&| NIL
                     |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL
                     |NonAssociativeSemiRng&| |AbelianMonoid&|
                     |AbelianSemiGroup&| |Magma&| |SetCategory&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|NonAssociativeAlgebra| 8) (|Module| 8) (|BiModule| 8 8)
                      (|NonAssociativeRng|) (|RightModule| 8) (|LeftModule| 8)
                      (|AbelianGroup|) (|CancellationAbelianMonoid|)
                      (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|Magma|) (|SetCategory|)
                      (|BasicType|) (|CoercibleTo| 46))
                   (|makeByteWordVec2| 59
                                       '(2 12 10 11 11 13 2 10 16 0 17 18 2 16
                                         17 0 17 19 2 17 20 0 0 21 0 0 0 22 1
                                         23 0 17 24 0 8 0 25 2 5 0 8 23 26 2 11
                                         20 0 0 27 0 9 0 28 2 0 20 0 0 30 1 9
                                         23 0 31 1 23 17 0 32 1 9 0 0 33 1 9 8
                                         0 34 2 0 0 8 0 35 1 0 0 0 36 4 12 20
                                         17 17 17 17 37 2 0 0 0 0 38 2 0 0 0 0
                                         39 1 41 0 17 42 2 41 0 0 0 43 2 8 20 0
                                         0 44 2 17 20 0 0 45 1 23 46 0 47 1 41
                                         46 0 48 1 8 46 0 49 2 46 0 0 0 50 1 11
                                         46 0 51 2 46 0 0 0 53 2 0 20 0 0 1 1 0
                                         20 0 1 2 0 56 0 0 1 1 0 46 0 52 0 0 0
                                         1 2 0 0 0 55 1 2 0 0 0 55 1 2 0 20 0 0
                                         1 2 0 0 0 55 1 1 0 58 0 1 2 0 57 57 0
                                         1 1 0 59 0 1 1 0 0 11 29 0 0 11 15 1 0
                                         46 0 54 2 0 0 0 0 1 1 0 46 0 1 3 0 0 0
                                         0 0 1 2 0 0 0 0 1 2 0 0 0 55 1 0 0 0
                                         22 2 0 20 0 0 30 2 0 0 0 0 38 1 0 0 0
                                         36 2 0 0 0 0 39 2 0 0 0 8 1 2 0 0 8 0
                                         35 2 0 0 11 0 1 2 0 0 17 0 1 2 0 0 0 0
                                         40 2 0 0 55 0 1)))))
           '|lookupComplete|)) 
