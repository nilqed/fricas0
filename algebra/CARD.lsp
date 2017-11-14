
(PUT '|CARD;Zero;$;1| '|SPADreplace| '(XLAM NIL (CONS -1 0))) 

(SDEFUN |CARD;Zero;$;1| (($ $)) (CONS -1 0)) 

(PUT '|CARD;One;$;2| '|SPADreplace| '(XLAM NIL (CONS -1 1))) 

(SDEFUN |CARD;One;$;2| (($ $)) (CONS -1 1)) 

(PUT '|CARD;coerce;Nni$;3| '|SPADreplace| '(XLAM (|n|) (CONS -1 |n|))) 

(SDEFUN |CARD;coerce;Nni$;3| ((|n| |NonNegativeInteger|) ($ $)) (CONS -1 |n|)) 

(PUT '|CARD;Aleph;Nni$;4| '|SPADreplace| '(XLAM (|n|) (CONS |n| -1))) 

(SDEFUN |CARD;Aleph;Nni$;4| ((|n| |NonNegativeInteger|) ($ $)) (CONS |n| -1)) 

(SDEFUN |CARD;coerce;$Of;5| ((|x| $) ($ |OutputForm|))
        (COND ((EQL (QCAR |x|) -1) (SPADCALL (QCDR |x|) (QREFELT $ 21)))
              ('T
               (SPADCALL (QREFELT $ 19)
                         (LIST (SPADCALL (QCAR |x|) (QREFELT $ 21)))
                         (QREFELT $ 23))))) 

(SDEFUN |CARD;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 25)) NIL)
              ((SPADCALL |x| (QREFELT $ 26)) (EQL (QCDR |x|) (QCDR |y|)))
              ('T 'T))) 

(SDEFUN |CARD;<;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((< (QCAR |x|) (QCAR |y|)) 'T)
              ((OR (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 28))
                   (NULL (SPADCALL |x| (QREFELT $ 26))))
               NIL)
              ('T (< (QCDR |x|) (QCDR |y|))))) 

(SDEFUN |CARD;+;3$;8| ((|x| $) (|y| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 26))
           (COND
            ((SPADCALL |y| (QREFELT $ 26))
             (EXIT (CONS -1 (+ (QCDR |x|) (QCDR |y|))))))))
         (EXIT (SPADCALL |x| |y| (QREFELT $ 30))))) 

(SDEFUN |CARD;-;2$U;9| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL |x| |y| (QREFELT $ 29)) (CONS 1 "failed"))
              ((SPADCALL |x| (QREFELT $ 26))
               (CONS 0 (CONS -1 (- (QCDR |x|) (QCDR |y|)))))
              ((SPADCALL |x| |y| (QREFELT $ 32)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |CARD;*;3$;10| ((|x| $) (|y| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 26))
           (COND
            ((SPADCALL |y| (QREFELT $ 26))
             (EXIT (CONS -1 (* (QCDR |x|) (QCDR |y|))))))))
         (COND
          ((OR (SPADCALL |x| (|spadConstant| $ 12) (QREFELT $ 27))
               (SPADCALL |y| (|spadConstant| $ 12) (QREFELT $ 27)))
           (EXIT (|spadConstant| $ 12))))
         (EXIT (SPADCALL |x| |y| (QREFELT $ 30))))) 

(SDEFUN |CARD;*;Nni2$;11| ((|n| |NonNegativeInteger|) (|x| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 26))
          (CONS -1 (SPADCALL |n| (QCDR |x|) (QREFELT $ 36))))
         ((EQL |n| 0) (|spadConstant| $ 12)) ('T |x|))) 

(SDEFUN |CARD;^;3$;12| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G762 NIL))
               (COND
                ((SPADCALL |y| (|spadConstant| $ 12) (QREFELT $ 27))
                 (|spadConstant| $ 11))
                ((SPADCALL |y| (QREFELT $ 26))
                 (COND ((NULL (SPADCALL |x| (QREFELT $ 26))) |x|)
                       ('T
                        (CONS -1
                              (EXPT (QCDR |x|)
                                    (PROG1 (LETT #1# (QCDR |y|) |CARD;^;3$;12|)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#)))))))
                ((SPADCALL |x| (|spadConstant| $ 12) (QREFELT $ 27))
                 (|spadConstant| $ 12))
                ((SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 27))
                 (|spadConstant| $ 11))
                ((SPADCALL (QREFELT $ 10) (QREFELT $ 38))
                 (CONS (+ (MAX (- (QCAR |x|) 1) (QCAR |y|)) 1) -1))
                ('T
                 (|error|
                  "Transfinite exponentiation only implemented under GCH"))))) 

(SDEFUN |CARD;finite?;$B;13| ((|x| $) ($ |Boolean|)) (EQL (QCAR |x|) -1)) 

(SDEFUN |CARD;countable?;$B;14| ((|x| $) ($ |Boolean|)) (< (QCAR |x|) 1)) 

(SDEFUN |CARD;retract;$Nni;15| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G771 NIL))
               (COND
                ((SPADCALL |x| (QREFELT $ 26))
                 (PROG1 (LETT #1# (QCDR |x|) |CARD;retract;$Nni;15|)
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#)))
                ('T (|error| "Not finite"))))) 

(SDEFUN |CARD;retractIfCan;$U;16|
        ((|x| $) ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((#1=#:G777 NIL))
               (COND
                ((SPADCALL |x| (QREFELT $ 26))
                 (CONS 0
                       (PROG1 (LETT #1# (QCDR |x|) |CARD;retractIfCan;$U;16|)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))))
                ('T (CONS 1 "failed"))))) 

(SDEFUN |CARD;generalizedContinuumHypothesisAssumed?;B;17| (($ |Boolean|))
        (SPADCALL (QREFELT $ 10) (QREFELT $ 38))) 

(SDEFUN |CARD;generalizedContinuumHypothesisAssumed;2B;18|
        ((|b| |Boolean|) ($ |Boolean|))
        (SPADCALL (QREFELT $ 10) |b| (QREFELT $ 45))) 

(DECLAIM (NOTINLINE |CardinalNumber;|)) 

(DEFUN |CardinalNumber| ()
  (SPROG NIL
         (PROG (#1=#:G787)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CardinalNumber|)
                    . #2=(|CardinalNumber|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CardinalNumber|
                             (LIST (CONS NIL (CONS 1 (|CardinalNumber;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CardinalNumber|)))))))))) 

(DEFUN |CardinalNumber;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CardinalNumber|) . #1=(|CardinalNumber|))
          (LETT $ (GETREFV 51) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CardinalNumber| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |order| (|Integer|))
                              (|:| |ival| (|Integer|))))
          (QSETREFV $ 10 (SPADCALL NIL (QREFELT $ 9)))
          (QSETREFV $ 19 (SPADCALL '|Aleph| (QREFELT $ 18)))
          $))) 

(MAKEPROP '|CardinalNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (|Reference| 7)
              (0 . |ref|) '|GCHypothesis|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARD;One;$;2|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARD;Zero;$;1|) $))
              (|NonNegativeInteger|) |CARD;coerce;Nni$;3| |CARD;Aleph;Nni$;4|
              (|OutputForm|) (|Symbol|) (5 . |coerce|) '|ALEPHexpr| (|Integer|)
              (10 . |coerce|) (|List| $) (15 . |prefix|) |CARD;coerce;$Of;5|
              (21 . ~=) |CARD;finite?;$B;13| |CARD;=;2$B;6| (27 . >)
              |CARD;<;2$B;7| (33 . |max|) |CARD;+;3$;8| (39 . >)
              (|Union| $ '"failed") |CARD;-;2$U;9| |CARD;*;3$;10| (45 . *)
              |CARD;*;Nni2$;11| (51 . |elt|) |CARD;^;3$;12|
              |CARD;countable?;$B;14| |CARD;retract;$Nni;15|
              (|Union| 13 '"failed") |CARD;retractIfCan;$U;16|
              |CARD;generalizedContinuumHypothesisAssumed?;B;17|
              (56 . |setelt!|)
              |CARD;generalizedContinuumHypothesisAssumed;2B;18|
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 62 |zero?| 68 |smaller?| 73 |sample| 79 |rightRecip| 83
              |rightPower| 88 |retractIfCan| 100 |retract| 105 |recip| 110
              |opposite?| 115 |one?| 121 |min| 126 |max| 132 |leftRecip| 138
              |leftPower| 143 |latex| 155 |hashUpdate!| 160 |hash| 166
              |generalizedContinuumHypothesisAssumed?| 171
              |generalizedContinuumHypothesisAssumed| 175 |finite?| 180
              |countable?| 185 |coerce| 190 ^ 200 |Zero| 218 |One| 222 |Aleph|
              226 >= 231 > 237 = 243 <= 249 < 255 - 261 + 267 * 273)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |OrderedSet&| |MagmaWithUnit&| NIL |AbelianMonoid&|
                     NIL |Magma&| |AbelianSemiGroup&| |SetCategory&| NIL
                     |RetractableTo&| |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|Monoid|) (|OrderedSet|) (|MagmaWithUnit|) (|SemiGroup|)
                      (|AbelianMonoid|) (|Comparable|) (|Magma|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|CommutativeStar|)
                      (|RetractableTo| 13) (|BasicType|) (|PartialOrder|)
                      (|CoercibleTo| 16))
                   (|makeByteWordVec2| 50
                                       '(1 8 0 7 9 1 17 16 0 18 1 20 16 0 21 2
                                         16 0 0 22 23 2 20 7 0 0 25 2 20 7 0 0
                                         28 2 0 0 0 0 30 2 0 7 0 0 32 2 20 0 13
                                         0 36 1 8 7 0 38 2 8 7 0 7 45 2 0 7 0 0
                                         1 1 0 7 0 1 2 0 7 0 0 1 0 0 0 1 1 0 33
                                         0 1 2 0 0 0 47 1 2 0 0 0 13 1 1 0 42 0
                                         43 1 0 13 0 41 1 0 33 0 1 2 0 7 0 0 1
                                         1 0 7 0 1 2 0 0 0 0 1 2 0 0 0 0 30 1 0
                                         33 0 1 2 0 0 0 47 1 2 0 0 0 13 1 1 0
                                         48 0 1 2 0 50 50 0 1 1 0 49 0 1 0 0 7
                                         44 1 0 7 7 46 1 0 7 0 26 1 0 7 0 40 1
                                         0 0 13 14 1 0 16 0 24 2 0 0 0 0 39 2 0
                                         0 0 47 1 2 0 0 0 13 1 0 0 0 12 0 0 0
                                         11 1 0 0 13 15 2 0 7 0 0 1 2 0 7 0 0
                                         32 2 0 7 0 0 27 2 0 7 0 0 1 2 0 7 0 0
                                         29 2 0 33 0 0 34 2 0 0 0 0 31 2 0 0 0
                                         0 35 2 0 0 47 0 1 2 0 0 13 0 37)))))
           '|lookupComplete|)) 

(MAKEPROP '|CardinalNumber| 'NILADIC T) 
