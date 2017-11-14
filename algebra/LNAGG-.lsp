
(SDEFUN |LNAGG-;indices;AL;1| ((|a| A) ($ |List| (|Integer|)))
        (SPROG ((#1=#:G717 NIL) (|i| NIL) (#2=#:G716 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|LNAGG-;indices;AL;1|))
                 (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)) . #3#)
                      (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #3#) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #3#)))
                      (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LNAGG-;index?;IAB;2| ((|i| |Integer|) (|a| A) ($ |Boolean|))
        (COND
         ((>= |i| (SPADCALL |a| (QREFELT $ 9)))
          (SPADCALL |i| (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 14)))
         ('T NIL))) 

(SDEFUN |LNAGG-;concat;ASA;3| ((|a| A) (|x| S) ($ A))
        (SPADCALL |a| (SPADCALL 1 |x| (QREFELT $ 17)) (QREFELT $ 18))) 

(SDEFUN |LNAGG-;concat;S2A;4| ((|x| S) (|y| A) ($ A))
        (SPADCALL (SPADCALL 1 |x| (QREFELT $ 17)) |y| (QREFELT $ 18))) 

(SDEFUN |LNAGG-;insert;SAIA;5| ((|x| S) (|a| A) (|i| |Integer|) ($ A))
        (SPADCALL (SPADCALL 1 |x| (QREFELT $ 17)) |a| |i| (QREFELT $ 21))) 

(SDEFUN |LNAGG-;first;ANniA;6| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPADCALL |x|
                  (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                            (SPADCALL 0 (- |n| 1) (QREFELT $ 24))
                            (QREFELT $ 25))
                  (QREFELT $ 26))) 

(SDEFUN |LNAGG-;maxIndex;AI;7| ((|l| A) ($ |Integer|))
        (+ (- (SPADCALL |l| (QREFELT $ 28)) 1) (SPADCALL |l| (QREFELT $ 9)))) 

(SDEFUN |LNAGG-;position;SAI;8| ((|x| S) (|t| A) ($ |Integer|))
        (SPADCALL |x| |t| (SPADCALL |t| (QREFELT $ 9)) (QREFELT $ 30))) 

(SDEFUN |LNAGG-;leftTrim;ASA;9| ((|u| A) (|x| S) ($ A))
        (SPROG ((#1=#:G729 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |u| (QREFELT $ 10))
                      . #2=(|LNAGG-;leftTrim;ASA;9|))
                (SEQ (LETT |i| (SPADCALL |u| (QREFELT $ 9)) . #2#)
                     (LETT #1# |n| . #2#) G190
                     (COND
                      ((OR (> |i| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |u| |i| (QREFELT $ 32)) |x|
                                      (QREFELT $ 33))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |u| (SPADCALL |i| |n| (QREFELT $ 24))
                           (QREFELT $ 26)))))) 

(SDEFUN |LNAGG-;rightTrim;ASA;10| ((|u| A) (|x| S) ($ A))
        (SPROG ((#1=#:G733 NIL) (|j| NIL) (|mn| (|Integer|)))
               (SEQ
                (LETT |mn| (SPADCALL |u| (QREFELT $ 9))
                      . #2=(|LNAGG-;rightTrim;ASA;10|))
                (SEQ (LETT |j| (SPADCALL |u| (QREFELT $ 10)) . #2#)
                     (LETT #1# |mn| . #2#) G190
                     (COND
                      ((OR (< |j| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |u| |j| (QREFELT $ 32)) |x|
                                      (QREFELT $ 33))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |j| (+ |j| -1) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |u| (SPADCALL |mn| |j| (QREFELT $ 24))
                           (QREFELT $ 26)))))) 

(SDEFUN |LNAGG-;trim;ASA;11| ((|u| A) (|x| S) ($ A))
        (SPROG
         ((#1=#:G739 NIL) (|j| NIL) (#2=#:G738 NIL) (|i| NIL)
          (|mn| (|Integer|)) (|n| (|Integer|)))
         (SEQ
          (LETT |n| (SPADCALL |u| (QREFELT $ 10)) . #3=(|LNAGG-;trim;ASA;11|))
          (LETT |mn| (SPADCALL |u| (QREFELT $ 9)) . #3#)
          (SEQ (LETT |i| |mn| . #3#) (LETT #2# |n| . #3#) G190
               (COND
                ((OR (> |i| #2#)
                     (NULL
                      (SPADCALL (SPADCALL |u| |i| (QREFELT $ 32)) |x|
                                (QREFELT $ 33))))
                 (GO G191)))
               (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
               (EXIT NIL))
          (SEQ (LETT |j| |n| . #3#) (LETT #1# |i| . #3#) G190
               (COND
                ((OR (< |j| #1#)
                     (NULL
                      (SPADCALL (SPADCALL |u| |j| (QREFELT $ 32)) |x|
                                (QREFELT $ 33))))
                 (GO G191)))
               (SEQ (EXIT 0)) (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
               (EXIT NIL))
          (EXIT
           (SPADCALL |u| (SPADCALL |i| |j| (QREFELT $ 24)) (QREFELT $ 26)))))) 

(SDEFUN |LNAGG-;hashUpdate!;HsAHs;12|
        ((|s| |HashState|) (|x| A) ($ |HashState|))
        (SPROG ((#1=#:G743 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |x| (QREFELT $ 9))
                       . #2=(|LNAGG-;hashUpdate!;HsAHs;12|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 10)) . #2#) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |s|
                         (SPADCALL |s| (SPADCALL |x| |i| (QREFELT $ 37))
                                   (QREFELT $ 39))
                         . #2#)))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |LNAGG-;sorted?;AB;13| ((|l| A) ($ |Boolean|))
        (SPADCALL (ELT $ 41) |l| (QREFELT $ 43))) 

(SDEFUN |LNAGG-;merge;3A;14| ((|x| A) (|y| A) ($ A))
        (SPADCALL (ELT $ 45) |x| |y| (QREFELT $ 46))) 

(SDEFUN |LNAGG-;sort;2A;15| ((|l| A) ($ A))
        (SPADCALL (ELT $ 45) |l| (QREFELT $ 48))) 

(SDEFUN |LNAGG-;reverse;2A;16| ((|x| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 51))) 

(SDEFUN |LNAGG-;sort;M2A;17| ((|f| |Mapping| (|Boolean|) S S) (|l| A) ($ A))
        (SPADCALL |f| (SPADCALL |l| (QREFELT $ 50)) (QREFELT $ 53))) 

(SDEFUN |LNAGG-;sort!;2A;18| ((|l| A) ($ A))
        (SPADCALL (ELT $ 45) |l| (QREFELT $ 53))) 

(DECLAIM (NOTINLINE |LinearAggregate&;|)) 

(DEFUN |LinearAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LinearAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LinearAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 58) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#2|
                                                             '(|Comparable|))
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))
                                              (|HasCategory| |#1|
                                                             '(|finiteAggregate|))
                                              (|HasCategory| |#1|
                                                             '(|shallowlyMutable|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 29
                       (CONS (|dispatchFunction| |LNAGG-;maxIndex;AI;7|) $))
             (COND
              ((|testBitVector| |pv$| 3)
               (PROGN
                (QSETREFV $ 31
                          (CONS (|dispatchFunction| |LNAGG-;position;SAI;8|)
                                $))
                (QSETREFV $ 34
                          (CONS (|dispatchFunction| |LNAGG-;leftTrim;ASA;9|)
                                $))
                (QSETREFV $ 35
                          (CONS (|dispatchFunction| |LNAGG-;rightTrim;ASA;10|)
                                $))
                (QSETREFV $ 36
                          (CONS (|dispatchFunction| |LNAGG-;trim;ASA;11|)
                                $)))))
             (COND
              ((|HasCategory| |#2| '(|SetCategory|))
               (QSETREFV $ 40
                         (CONS
                          (|dispatchFunction| |LNAGG-;hashUpdate!;HsAHs;12|)
                          $))))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 44
                          (CONS (|dispatchFunction| |LNAGG-;sorted?;AB;13|) $))
                (QSETREFV $ 47
                          (CONS (|dispatchFunction| |LNAGG-;merge;3A;14|) $))
                (QSETREFV $ 49
                          (CONS (|dispatchFunction| |LNAGG-;sort;2A;15|) $)))))
             (COND
              ((|testBitVector| |pv$| 5)
               (PROGN
                (QSETREFV $ 52
                          (CONS (|dispatchFunction| |LNAGG-;reverse;2A;16|) $))
                (QSETREFV $ 54
                          (CONS (|dispatchFunction| |LNAGG-;sort;M2A;17|) $))
                (COND
                 ((|testBitVector| |pv$| 1)
                  (QSETREFV $ 55
                            (CONS (|dispatchFunction| |LNAGG-;sort!;2A;18|)
                                  $))))))))))
          $))) 

(MAKEPROP '|LinearAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (|List| 8)
              |LNAGG-;indices;AL;1| (|Boolean|) (10 . <=) |LNAGG-;index?;IAB;2|
              (|NonNegativeInteger|) (16 . |new|) (22 . |concat|)
              |LNAGG-;concat;ASA;3| |LNAGG-;concat;S2A;4| (28 . |insert|)
              |LNAGG-;insert;SAIA;5| (|UniversalSegment| 8) (35 . SEGMENT)
              (41 . +) (47 . |elt|) |LNAGG-;first;ANniA;6| (53 . |#|)
              (58 . |maxIndex|) (63 . |position|) (70 . |position|)
              (76 . |elt|) (82 . =) (88 . |leftTrim|) (94 . |rightTrim|)
              (100 . |trim|) (106 . |qelt|) (|HashState|) (112 . |hashUpdate!|)
              (118 . |hashUpdate!|) (124 . <=) (|Mapping| 13 7 7)
              (130 . |sorted?|) (136 . |sorted?|) (141 . <) (147 . |merge|)
              (154 . |merge|) (160 . |sort|) (166 . |sort|) (171 . |copy|)
              (176 . |reverse!|) (181 . |reverse|) (186 . |sort!|)
              (192 . |sort|) (198 . |sort!|) (|Mapping| 13 7) (|List| $))
           '#(|trim| 203 |sorted?| 209 |sort!| 214 |sort| 219 |rightTrim| 230
              |reverse| 236 |position| 241 |merge| 247 |maxIndex| 253
              |leftTrim| 258 |insert| 264 |indices| 271 |index?| 276
              |hashUpdate!| 282 |first| 288 |concat| 294)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(1 6 8 0 9 1 6 8 0 10 2 8 13
                                                   0 0 14 2 6 0 16 7 17 2 6 0 0
                                                   0 18 3 6 0 0 0 8 21 2 23 0 8
                                                   8 24 2 23 0 8 0 25 2 6 0 0
                                                   23 26 1 6 16 0 28 1 0 8 0 29
                                                   3 6 8 7 0 8 30 2 0 8 7 0 31
                                                   2 6 7 0 8 32 2 7 13 0 0 33 2
                                                   0 0 0 7 34 2 0 0 0 7 35 2 0
                                                   0 0 7 36 2 6 7 0 8 37 2 7 38
                                                   38 0 39 2 0 38 38 0 40 2 7
                                                   13 0 0 41 2 6 13 42 0 43 1 0
                                                   13 0 44 2 7 13 0 0 45 3 6 0
                                                   42 0 0 46 2 0 0 0 0 47 2 6 0
                                                   42 0 48 1 0 0 0 49 1 6 0 0
                                                   50 1 6 0 0 51 1 0 0 0 52 2 6
                                                   0 42 0 53 2 0 0 42 0 54 1 0
                                                   0 0 55 2 0 0 0 7 36 1 0 13 0
                                                   44 1 0 0 0 55 1 0 0 0 49 2 0
                                                   0 42 0 54 2 0 0 0 7 35 1 0 0
                                                   0 52 2 0 8 7 0 31 2 0 0 0 0
                                                   47 1 0 8 0 29 2 0 0 0 7 34 3
                                                   0 0 7 0 8 22 1 0 11 0 12 2 0
                                                   13 8 0 15 2 0 38 38 0 40 2 0
                                                   0 0 16 27 2 0 0 0 7 19 2 0 0
                                                   7 0 20)))))
           '|lookupComplete|)) 
