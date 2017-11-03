
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

(SDEFUN |ORDCOMP;-;2$;11| ((|x| $) ($ $))
        (COND ((QEQCAR |x| 1) (CONS 1 (NULL (CDR |x|))))
              ('T (CONS 0 (SPADCALL (CDR |x|) (QREFELT $ 30)))))) 

(SDEFUN |ORDCOMP;+;3$;12| ((|x| $) (|y| $) ($ $))
        (COND
         ((QEQCAR |x| 1)
          (COND
           ((OR (QEQCAR |y| 0)
                (NULL (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 27))))
            |x|)
           ('T (|error| "Undefined sum"))))
         ((QEQCAR |y| 1) |y|)
         ('T (CONS 0 (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 32)))))) 

(SDEFUN |ORDCOMP;<;2$B;13| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((QEQCAR |x| 1)
          (COND
           ((QEQCAR |y| 1)
            (COND ((SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 27)) (CDR |y|))
                  (#1='T NIL)))
           (#1# (NULL (CDR |x|)))))
         ((QEQCAR |y| 1) (CDR |y|))
         (#1# (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 34))))) 

(SDEFUN |ORDCOMP;rational?;$B;14| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 11))) 

(SDEFUN |ORDCOMP;rational;$F;15| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 38))) 

(SDEFUN |ORDCOMP;rationalIfCan;$U;16|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 16))
                      |ORDCOMP;rationalIfCan;$U;16|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 38))))))))) 

(DECLAIM (NOTINLINE |OrderedCompletion;|)) 

(DEFUN |OrderedCompletion| (#1=#:G771)
  (SPROG NIL
         (PROG (#2=#:G772)
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
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|OrderedCompletion|))
          (LETT |dv$| (LIST '|OrderedCompletion| DV$1) . #1#)
          (LETT $ (GETREFV 46) . #1#)
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
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|OrderedCompletion| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Union| (|:| |fin| |#1|) (|:| |inf| (|Boolean|))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 31 (CONS (|dispatchFunction| |ORDCOMP;-;2$;11|) $))))
          (COND
           ((|testBitVector| |pv$| 4)
            (QSETREFV $ 33 (CONS (|dispatchFunction| |ORDCOMP;+;3$;12|) $))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 35 (CONS (|dispatchFunction| |ORDCOMP;<;2$B;13|) $))))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV $ 36
                       (CONS (|dispatchFunction| |ORDCOMP;rational?;$B;14|) $))
             (QSETREFV $ 39
                       (CONS (|dispatchFunction| |ORDCOMP;rational;$F;15|) $))
             (QSETREFV $ 41
                       (CONS (|dispatchFunction| |ORDCOMP;rationalIfCan;$U;16|)
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
              |ORDCOMP;=;2$B;10| (37 . -) (42 . -) (47 . +) (53 . +) (59 . <)
              (65 . <) (71 . |rational?|) (|Fraction| 42) (76 . |rational|)
              (81 . |rational|) (|Union| 37 '"failed") (86 . |rationalIfCan|)
              (|Integer|) (|Union| 42 '"failed") (|HashState|) (|String|))
           '#(~= 91 |whatInfinity| 97 |smaller?| 102 |retractIfCan| 108
              |retract| 123 |rationalIfCan| 138 |rational?| 143 |rational| 148
              |plusInfinity| 153 |minusInfinity| 157 |min| 161 |max| 167
              |latex| 173 |infinite?| 178 |hashUpdate!| 183 |hash| 189
              |finite?| 194 |coerce| 199 >= 219 > 225 = 231 <= 237 < 243 - 249
              + 254)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(3 3 0 0 0 0 0 1 2 3))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |FullyRetractableTo&|
                     |BasicType&| |RetractableTo&| NIL |RetractableTo&|
                     |RetractableTo&| |PartialOrder&|)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|FullyRetractableTo| 6) (|BasicType|)
                      (|RetractableTo| 6) (|CoercibleTo| 17)
                      (|RetractableTo| 37) (|RetractableTo| 42)
                      (|PartialOrder|))
                   (|makeByteWordVec2| 45
                                       '(1 6 17 0 18 1 19 17 0 20 0 17 0 21 2
                                         17 0 0 0 22 1 17 0 0 23 2 10 0 0 0 27
                                         2 6 10 0 0 28 1 6 0 0 30 1 0 0 0 31 2
                                         6 0 0 0 32 2 0 0 0 0 33 2 6 10 0 0 34
                                         2 0 10 0 0 35 1 0 10 0 36 1 6 37 0 38
                                         1 0 37 0 39 1 0 40 0 41 2 0 10 0 0 1 1
                                         0 25 0 26 2 3 10 0 0 1 1 1 40 0 1 1 2
                                         43 0 1 1 0 15 0 16 1 1 37 0 1 1 2 42 0
                                         1 1 0 6 0 9 1 6 40 0 41 1 6 10 0 36 1
                                         6 37 0 39 0 0 0 13 0 0 0 14 2 3 0 0 0
                                         1 2 3 0 0 0 1 1 0 45 0 1 1 0 10 0 12 2
                                         0 44 44 0 1 1 0 25 0 1 1 0 10 0 11 1 1
                                         0 37 1 1 2 0 42 1 1 0 0 6 8 1 0 17 0
                                         24 2 3 10 0 0 1 2 3 10 0 0 1 2 0 10 0
                                         0 29 2 3 10 0 0 1 2 3 10 0 0 35 1 5 0
                                         0 31 2 4 0 0 0 33)))))
           '|lookupComplete|)) 
