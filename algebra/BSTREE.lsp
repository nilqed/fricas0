
(SDEFUN |BSTREE;binarySearchTree;L$;1| ((|u| |List| S) ($ $))
        (SPROG ((#1=#:G712 NIL) (|x| NIL) (|tree| ($)))
               (SEQ
                (COND ((NULL |u|) (SPADCALL (QREFELT $ 8)))
                      ('T
                       (SEQ
                        (LETT |tree| (SPADCALL (|SPADfirst| |u|) (QREFELT $ 9))
                              . #2=(|BSTREE;binarySearchTree;L$;1|))
                        (SEQ (LETT |x| NIL . #2#) (LETT #1# (CDR |u|) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |x| |tree| (QREFELT $ 10))))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |tree|))))))) 

(SDEFUN |BSTREE;insert!;S2$;2| ((|x| S) (|t| $) ($ $))
        (SEQ
         (COND ((SPADCALL |t| (QREFELT $ 14)) (SPADCALL |x| (QREFELT $ 9)))
               ((SPADCALL |x| (SPADCALL |t| (QREFELT $ 15)) (QREFELT $ 16))
                (SEQ
                 (SPADCALL |t|
                           (SPADCALL |x| (SPADCALL |t| (QREFELT $ 17))
                                     (QREFELT $ 10))
                           (QREFELT $ 18))
                 (EXIT |t|)))
               ('T
                (SEQ
                 (SPADCALL |t|
                           (SPADCALL |x| (SPADCALL |t| (QREFELT $ 19))
                                     (QREFELT $ 10))
                           (QREFELT $ 20))
                 (EXIT |t|)))))) 

(SDEFUN |BSTREE;split;S$R;3|
        ((|x| S) (|t| $) ($ |Record| (|:| |less| $) (|:| |greater| $)))
        (SPROG ((|a| (|Record| (|:| |less| $) (|:| |greater| $))))
               (SEQ
                (COND
                 ((SPADCALL |t| (QREFELT $ 14))
                  (CONS (SPADCALL (QREFELT $ 8)) (SPADCALL (QREFELT $ 8))))
                 ((SPADCALL |x| (SPADCALL |t| (QREFELT $ 15)) (QREFELT $ 21))
                  (SEQ
                   (LETT |a|
                         (SPADCALL |x| (SPADCALL |t| (QREFELT $ 17))
                                   (QREFELT $ 23))
                         . #1=(|BSTREE;split;S$R;3|))
                   (EXIT
                    (CONS
                     (SPADCALL (SPADCALL |t| (QREFELT $ 19))
                               (SPADCALL |t| (QREFELT $ 15)) (QCAR |a|)
                               (QREFELT $ 24))
                     (QCDR |a|)))))
                 ('T
                  (SEQ
                   (LETT |a|
                         (SPADCALL |x| (SPADCALL |t| (QREFELT $ 19))
                                   (QREFELT $ 23))
                         . #1#)
                   (EXIT
                    (CONS (QCAR |a|)
                          (SPADCALL (QCDR |a|) (SPADCALL |t| (QREFELT $ 15))
                                    (SPADCALL |t| (QREFELT $ 17))
                                    (QREFELT $ 24)))))))))) 

(SDEFUN |BSTREE;insertRoot!;S2$;4| ((|x| S) (|t| $) ($ $))
        (SPROG ((|a| (|Record| (|:| |less| $) (|:| |greater| $))))
               (SEQ
                (LETT |a| (SPADCALL |x| |t| (QREFELT $ 23))
                      |BSTREE;insertRoot!;S2$;4|)
                (EXIT (SPADCALL (QCAR |a|) |x| (QCDR |a|) (QREFELT $ 24)))))) 

(DECLAIM (NOTINLINE |BinarySearchTree;|)) 

(DEFUN |BinarySearchTree| (#1=#:G735)
  (SPROG NIL
         (PROG (#2=#:G736)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|BinarySearchTree|)
                                               '|domainEqualList|)
                    . #3=(|BinarySearchTree|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|BinarySearchTree;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BinarySearchTree|)))))))))) 

(DEFUN |BinarySearchTree;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G732 NIL) (#2=#:G733 NIL) (#3=#:G734 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|BinarySearchTree|))
    (LETT |dv$| (LIST '|BinarySearchTree| DV$1) . #4#)
    (LETT $ (GETREFV 40) . #4#)
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
    (|haddProp| |$ConstructorCache| '|BinarySearchTree| (LIST DV$1) (CONS 1 $))
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

(MAKEPROP '|BinarySearchTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|BinaryTree| 6) (|local| |#1|) '|Rep|
              (0 . |empty|) (4 . |binaryTree|) |BSTREE;insert!;S2$;2|
              (|List| 6) |BSTREE;binarySearchTree;L$;1| (|Boolean|)
              (9 . |empty?|) (14 . |value|) (19 . >=) (25 . |right|)
              (30 . |setright!|) (36 . |left|) (41 . |setleft!|) (47 . >)
              (|Record| (|:| |less| $) (|:| |greater| $)) |BSTREE;split;S$R;3|
              (53 . |node|) |BSTREE;insertRoot!;S2$;4| (|NonNegativeInteger|)
              (|List| 28) (|Equation| 6) (|Mapping| 13 6) '"right" '"left"
              (|List| $) '"value" (|Mapping| 6 6) (|OutputForm|)
              (|SingleInteger|) (|HashState|) (|String|) (|Integer|))
           '#(~= 60 |value| 66 |split| 71 |size?| 77 |setvalue!| 83 |setright!|
              89 |setleft!| 95 |setelt!| 101 |setchildren!| 122 |sample| 128
              |right| 132 |parts| 137 |nodes| 142 |node?| 147 |node| 153
              |more?| 160 |members| 166 |member?| 171 |map!| 177 |map| 183
              |less?| 189 |left| 195 |leaves| 200 |leaf?| 205 |latex| 210
              |insertRoot!| 215 |insert!| 221 |hashUpdate!| 227 |hash| 233
              |every?| 238 |eval| 244 |eq?| 270 |empty?| 276 |empty| 281 |elt|
              285 |distance| 303 |cyclic?| 309 |count| 314 |copy| 326 |coerce|
              331 |children| 336 |child?| 341 |binarySearchTree| 347 |any?| 352
              = 358 |#| 364)
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
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 35))
                   (|makeByteWordVec2| 39
                                       '(0 0 0 8 1 7 0 6 9 1 0 13 0 14 1 0 6 0
                                         15 2 6 13 0 0 16 1 0 0 0 17 2 0 0 0 0
                                         18 1 0 0 0 19 2 0 0 0 0 20 2 6 13 0 0
                                         21 3 0 0 0 6 0 24 2 9 13 0 0 1 1 0 6 0
                                         15 2 0 22 6 0 23 2 0 13 0 26 1 2 10 6
                                         0 6 1 2 10 0 0 0 18 2 10 0 0 0 20 3 10
                                         0 0 30 0 1 3 10 0 0 31 0 1 3 10 6 0 33
                                         6 1 2 10 0 0 32 1 0 0 0 1 1 0 0 0 17 1
                                         7 11 0 1 1 0 32 0 1 2 3 13 0 0 1 3 0 0
                                         0 6 0 24 2 0 13 0 26 1 1 7 11 0 1 2 8
                                         13 6 0 1 2 10 0 34 0 1 2 0 0 34 0 1 2
                                         0 13 0 26 1 1 0 0 0 19 1 0 11 0 1 1 0
                                         13 0 1 1 1 38 0 1 2 0 0 6 0 25 2 0 0 6
                                         0 10 2 1 37 37 0 1 1 1 36 0 1 2 7 13
                                         29 0 1 3 2 0 0 11 11 1 3 2 0 0 6 6 1 2
                                         2 0 0 27 1 2 2 0 0 28 1 2 0 13 0 0 1 1
                                         0 13 0 14 0 0 0 8 2 0 0 0 30 1 2 0 0 0
                                         31 1 2 0 6 0 33 1 2 0 39 0 0 1 1 0 13
                                         0 1 2 8 26 6 0 1 2 7 26 29 0 1 1 0 0 0
                                         1 1 5 35 0 1 1 0 32 0 1 2 3 13 0 0 1 1
                                         0 0 11 12 2 7 13 29 0 1 2 9 13 0 0 1 1
                                         7 26 0 1)))))
           '|lookupComplete|)) 
