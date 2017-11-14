
(SDEFUN |BBTREE;leaf?;$B;1| ((|x| $) ($ |Boolean|))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 9))
              (NULL (SPADCALL (SPADCALL |x| (QREFELT $ 10)) (QREFELT $ 9))))
          NIL)
         ('T (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 9))))) 

(SDEFUN |BBTREE;setleaves!;$L$;2| ((|t| $) (|u| |List| S) ($ $))
        (SPROG
         ((|acc| (|List| S)) (#1=#:G729 NIL) (|i| NIL)
          (|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |u|) . #2=(|BBTREE;setleaves!;$L$;2|))
              (EXIT
               (COND
                ((EQL |n| 0)
                 (COND ((SPADCALL |t| (QREFELT $ 9)) |t|)
                       (#3='T
                        (|error|
                         "the tree and list must have the same number of elements"))))
                ((EQL |n| 1)
                 (SEQ (SPADCALL |t| (|SPADfirst| |u|) (QREFELT $ 13))
                      (EXIT |t|)))
                (#3#
                 (SEQ (LETT |m| (QUOTIENT2 |n| 2) . #2#) (LETT |acc| NIL . #2#)
                      (SEQ (LETT |i| 1 . #2#) (LETT #1# |m| . #2#) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (LETT |acc| (CONS (|SPADfirst| |u|) |acc|) . #2#)
                            (EXIT (LETT |u| (CDR |u|) . #2#)))
                           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (SPADCALL (SPADCALL |t| (QREFELT $ 10)) (NREVERSE |acc|)
                                (QREFELT $ 15))
                      (SPADCALL (SPADCALL |t| (QREFELT $ 11)) |u|
                                (QREFELT $ 15))
                      (EXIT |t|)))))))) 

(SDEFUN |BBTREE;balancedBinaryTree;NniS$;3|
        ((|n| |NonNegativeInteger|) (|val| S) ($ $))
        (SPROG ((|m| (|NonNegativeInteger|)))
               (SEQ
                (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 16)))
                      ((EQL |n| 1)
                       (SPADCALL (SPADCALL (QREFELT $ 16)) |val|
                                 (SPADCALL (QREFELT $ 16)) (QREFELT $ 17)))
                      ('T
                       (SEQ
                        (LETT |m| (QUOTIENT2 |n| 2)
                              |BBTREE;balancedBinaryTree;NniS$;3|)
                        (EXIT
                         (SPADCALL (SPADCALL |m| |val| (QREFELT $ 19)) |val|
                                   (SPADCALL (- |n| |m|) |val| (QREFELT $ 19))
                                   (QREFELT $ 17))))))))) 

(SDEFUN |BBTREE;mapUp!;$MS;4| ((|x| $) (|fn| |Mapping| S S S) ($ S))
        (COND
         ((SPADCALL |x| (QREFELT $ 9))
          (|error| "mapUp! called on a null tree"))
         ((SPADCALL |x| (QREFELT $ 12)) (SPADCALL |x| '|value| (QREFELT $ 21)))
         ('T
          (SPADCALL |x| '|value|
                    (SPADCALL
                     (SPADCALL (SPADCALL |x| '|left| (QREFELT $ 23)) |fn|
                               (QREFELT $ 25))
                     (SPADCALL (SPADCALL |x| '|right| (QREFELT $ 27)) |fn|
                               (QREFELT $ 25))
                     |fn|)
                    (QREFELT $ 28))))) 

(SDEFUN |BBTREE;mapUp!;2$M$;5|
        ((|x| $) (|y| $) (|fn| |Mapping| S S S S S) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 9))
           (|error| "mapUp! is called on a null tree"))
          ((SPADCALL |x| (QREFELT $ 12))
           (COND ((SPADCALL |y| (QREFELT $ 12)) |x|)
                 (#1='T (|error| "balanced binary trees are incompatible"))))
          ((SPADCALL |y| (QREFELT $ 12))
           (|error| "balanced binary trees are incompatible"))
          (#1#
           (SEQ
            (SPADCALL (SPADCALL |x| '|left| (QREFELT $ 23))
                      (SPADCALL |y| '|left| (QREFELT $ 23)) |fn|
                      (QREFELT $ 30))
            (SPADCALL (SPADCALL |x| '|right| (QREFELT $ 27))
                      (SPADCALL |y| '|right| (QREFELT $ 27)) |fn|
                      (QREFELT $ 30))
            (SPADCALL |x| '|value|
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| '|left| (QREFELT $ 23)) '|value|
                                 (QREFELT $ 21))
                       (SPADCALL (SPADCALL |x| '|right| (QREFELT $ 27))
                                 '|value| (QREFELT $ 21))
                       (SPADCALL (SPADCALL |y| '|left| (QREFELT $ 23)) '|value|
                                 (QREFELT $ 21))
                       (SPADCALL (SPADCALL |y| '|right| (QREFELT $ 27))
                                 '|value| (QREFELT $ 21))
                       |fn|)
                      (QREFELT $ 28))
            (EXIT |x|)))))) 

(SDEFUN |BBTREE;mapDown!;$SM$;6| ((|x| $) (|p| S) (|fn| |Mapping| S S S) ($ $))
        (SEQ
         (COND ((SPADCALL |x| (QREFELT $ 9)) |x|)
               ('T
                (SEQ
                 (SPADCALL |x| '|value|
                           (SPADCALL |p| (SPADCALL |x| '|value| (QREFELT $ 21))
                                     |fn|)
                           (QREFELT $ 28))
                 (SPADCALL (SPADCALL |x| '|left| (QREFELT $ 23))
                           (SPADCALL |x| '|value| (QREFELT $ 21)) |fn|
                           (QREFELT $ 31))
                 (SPADCALL (SPADCALL |x| '|right| (QREFELT $ 27))
                           (SPADCALL |x| '|value| (QREFELT $ 21)) |fn|
                           (QREFELT $ 31))
                 (EXIT |x|)))))) 

(SDEFUN |BBTREE;mapDown!;$SM$;7|
        ((|x| $) (|p| S) (|fn| |Mapping| (|List| S) S S S) ($ $))
        (SPROG ((|u| (|List| S)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 9)) |x|)
                      (#1='T
                       (SEQ (SPADCALL |x| '|value| |p| (QREFELT $ 28))
                            (EXIT
                             (COND ((SPADCALL |x| (QREFELT $ 12)) |x|)
                                   (#1#
                                    (SEQ
                                     (LETT |u|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |x| '|left|
                                                       (QREFELT $ 23))
                                             '|value| (QREFELT $ 21))
                                            (SPADCALL
                                             (SPADCALL |x| '|right|
                                                       (QREFELT $ 27))
                                             '|value| (QREFELT $ 21))
                                            |p| |fn|)
                                           |BBTREE;mapDown!;$SM$;7|)
                                     (SPADCALL
                                      (SPADCALL |x| '|left| (QREFELT $ 23))
                                      (SPADCALL |u| 1 (QREFELT $ 33)) |fn|
                                      (QREFELT $ 35))
                                     (SPADCALL
                                      (SPADCALL |x| '|right| (QREFELT $ 27))
                                      (SPADCALL |u| 2 (QREFELT $ 33)) |fn|
                                      (QREFELT $ 35))
                                     (EXIT |x|))))))))))) 

(DECLAIM (NOTINLINE |BalancedBinaryTree;|)) 

(DEFUN |BalancedBinaryTree| (#1=#:G787)
  (SPROG NIL
         (PROG (#2=#:G788)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|BalancedBinaryTree|)
                                               '|domainEqualList|)
                    . #3=(|BalancedBinaryTree|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|BalancedBinaryTree;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BalancedBinaryTree|)))))))))) 

(DEFUN |BalancedBinaryTree;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G784 NIL) (#2=#:G785 NIL) (#3=#:G786 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|BalancedBinaryTree|))
    (LETT |dv$| (LIST '|BalancedBinaryTree| DV$1) . #4#)
    (LETT $ (GETREFV 48) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #4#)
                                        (OR #2# #3#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #3#))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|BalancedBinaryTree| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 64))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 128))
    (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
         (|augmentPredVector| $ 256))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 512))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|BinaryTree| |#1|))
    $))) 

(MAKEPROP '|BalancedBinaryTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|BinaryTree| 6) (|local| |#1|) '|Rep|
              (|Boolean|) (0 . |empty?|) (5 . |left|) (10 . |right|)
              |BBTREE;leaf?;$B;1| (15 . |setvalue!|) (|List| 6)
              |BBTREE;setleaves!;$L$;2| (21 . |empty|) (25 . |node|)
              (|NonNegativeInteger|) |BBTREE;balancedBinaryTree;NniS$;3|
              '|value| (32 . |elt|) '|left| (38 . |elt|) (|Mapping| 6 6 6)
              |BBTREE;mapUp!;$MS;4| '|right| (44 . |elt|) (50 . |setelt!|)
              (|Mapping| 6 6 6 6 6) |BBTREE;mapUp!;2$M$;5|
              |BBTREE;mapDown!;$SM$;6| (|Integer|) (57 . |elt|)
              (|Mapping| 14 6 6 6) |BBTREE;mapDown!;$SM$;7| (|List| 37)
              (|Equation| 6) (|Mapping| 8 6) '"right" '"left" '"value"
              (|List| $) (|Mapping| 6 6) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|String|))
           '#(~= 63 |value| 69 |size?| 74 |setvalue!| 80 |setright!| 86
              |setleft!| 92 |setleaves!| 98 |setelt!| 104 |setchildren!| 125
              |sample| 131 |right| 135 |parts| 140 |nodes| 145 |node?| 150
              |node| 156 |more?| 163 |members| 169 |member?| 174 |mapUp!| 180
              |mapDown!| 193 |map!| 207 |map| 213 |less?| 219 |left| 225
              |leaves| 230 |leaf?| 235 |latex| 240 |hashUpdate!| 245 |hash| 251
              |every?| 256 |eval| 262 |eq?| 288 |empty?| 294 |empty| 299 |elt|
              303 |distance| 321 |cyclic?| 327 |count| 332 |copy| 344 |coerce|
              349 |children| 354 |child?| 359 |balancedBinaryTree| 365 |any?|
              371 = 377 |#| 383)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(|BinaryTreeCategory&| |BinaryRecursiveAggregate&|
                     |RecursiveAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|BinaryTreeCategory| 6) (|BinaryRecursiveAggregate| 6)
                      (|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Aggregate|) (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 44))
                   (|makeByteWordVec2| 47
                                       '(1 0 8 0 9 1 0 0 0 10 1 0 0 0 11 2 0 6
                                         0 6 13 0 0 0 16 3 0 0 0 6 0 17 2 0 6 0
                                         20 21 2 0 0 0 22 23 2 0 0 0 26 27 3 0
                                         6 0 20 6 28 2 14 6 0 32 33 2 9 8 0 0 1
                                         1 0 6 0 1 2 0 8 0 18 1 2 10 6 0 6 13 2
                                         10 0 0 0 1 2 10 0 0 0 1 2 0 0 0 14 15
                                         3 10 0 0 39 0 1 3 10 0 0 40 0 1 3 10 6
                                         0 41 6 1 2 10 0 0 42 1 0 0 0 1 1 0 0 0
                                         11 1 7 14 0 1 1 0 42 0 1 2 3 8 0 0 1 3
                                         0 0 0 6 0 17 2 0 8 0 18 1 1 7 14 0 1 2
                                         8 8 6 0 1 3 0 0 0 0 29 30 2 0 6 0 24
                                         25 3 0 0 0 6 34 35 3 0 0 0 6 24 31 2
                                         10 0 43 0 1 2 0 0 43 0 1 2 0 8 0 18 1
                                         1 0 0 0 10 1 0 14 0 1 1 0 8 0 12 1 1
                                         47 0 1 2 1 45 45 0 1 1 1 46 0 1 2 7 8
                                         38 0 1 3 2 0 0 14 14 1 3 2 0 0 6 6 1 2
                                         2 0 0 36 1 2 2 0 0 37 1 2 0 8 0 0 1 1
                                         0 8 0 9 0 0 0 16 2 0 0 0 39 1 2 0 0 0
                                         40 1 2 0 6 0 41 1 2 0 32 0 0 1 1 0 8 0
                                         1 2 8 18 6 0 1 2 7 18 38 0 1 1 0 0 0 1
                                         1 5 44 0 1 1 0 42 0 1 2 3 8 0 0 1 2 0
                                         0 18 6 19 2 7 8 38 0 1 2 9 8 0 0 1 1 7
                                         18 0 1)))))
           '|lookupComplete|)) 
