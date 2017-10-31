
(SDEFUN |LNAGG-;indices;AL;1| ((|a| A) ($ |List| (|Integer|)))
        (SPROG ((#1=#:G714 NIL) (|i| NIL) (#2=#:G713 NIL))
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

(SDEFUN |LNAGG-;maxIndex;AI;6| ((|l| A) ($ |Integer|))
        (+ (- (SPADCALL |l| (QREFELT $ 23)) 1) (SPADCALL |l| (QREFELT $ 9)))) 

(SDEFUN |LNAGG-;position;SAI;7| ((|x| S) (|t| A) ($ |Integer|))
        (SPADCALL |x| |t| (SPADCALL |t| (QREFELT $ 9)) (QREFELT $ 25))) 

(SDEFUN |LNAGG-;leftTrim;ASA;8| ((|u| A) (|x| S) ($ A))
        (SPROG ((#1=#:G725 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |u| (QREFELT $ 10))
                      . #2=(|LNAGG-;leftTrim;ASA;8|))
                (SEQ (LETT |i| (SPADCALL |u| (QREFELT $ 9)) . #2#)
                     (LETT #1# |n| . #2#) G190
                     (COND
                      ((OR (> |i| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |u| |i| (QREFELT $ 27)) |x|
                                      (QREFELT $ 28))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |u| (SPADCALL |i| |n| (QREFELT $ 30))
                           (QREFELT $ 31)))))) 

(SDEFUN |LNAGG-;rightTrim;ASA;9| ((|u| A) (|x| S) ($ A))
        (SPROG ((#1=#:G729 NIL) (|j| NIL) (|mn| (|Integer|)))
               (SEQ
                (LETT |mn| (SPADCALL |u| (QREFELT $ 9))
                      . #2=(|LNAGG-;rightTrim;ASA;9|))
                (SEQ (LETT |j| (SPADCALL |u| (QREFELT $ 10)) . #2#)
                     (LETT #1# |mn| . #2#) G190
                     (COND
                      ((OR (< |j| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |u| |j| (QREFELT $ 27)) |x|
                                      (QREFELT $ 28))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |j| (+ |j| -1) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |u| (SPADCALL |mn| |j| (QREFELT $ 30))
                           (QREFELT $ 31)))))) 

(SDEFUN |LNAGG-;trim;ASA;10| ((|u| A) (|x| S) ($ A))
        (SPROG
         ((#1=#:G735 NIL) (|j| NIL) (#2=#:G734 NIL) (|i| NIL)
          (|mn| (|Integer|)) (|n| (|Integer|)))
         (SEQ
          (LETT |n| (SPADCALL |u| (QREFELT $ 10)) . #3=(|LNAGG-;trim;ASA;10|))
          (LETT |mn| (SPADCALL |u| (QREFELT $ 9)) . #3#)
          (SEQ (LETT |i| |mn| . #3#) (LETT #2# |n| . #3#) G190
               (COND
                ((OR (> |i| #2#)
                     (NULL
                      (SPADCALL (SPADCALL |u| |i| (QREFELT $ 27)) |x|
                                (QREFELT $ 28))))
                 (GO G191)))
               (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
               (EXIT NIL))
          (SEQ (LETT |j| |n| . #3#) (LETT #1# |i| . #3#) G190
               (COND
                ((OR (< |j| #1#)
                     (NULL
                      (SPADCALL (SPADCALL |u| |j| (QREFELT $ 27)) |x|
                                (QREFELT $ 28))))
                 (GO G191)))
               (SEQ (EXIT 0)) (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
               (EXIT NIL))
          (EXIT
           (SPADCALL |u| (SPADCALL |i| |j| (QREFELT $ 30)) (QREFELT $ 31)))))) 

(SDEFUN |LNAGG-;hashUpdate!;HsAHs;11|
        ((|s| |HashState|) (|x| A) ($ |HashState|))
        (SPROG ((#1=#:G739 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |x| (QREFELT $ 9))
                       . #2=(|LNAGG-;hashUpdate!;HsAHs;11|))
                 (LETT #1# (SPADCALL |x| (QREFELT $ 10)) . #2#) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |s|
                         (SPADCALL |s| (SPADCALL |x| |i| (QREFELT $ 35))
                                   (QREFELT $ 37))
                         . #2#)))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |LNAGG-;sorted?;AB;12| ((|l| A) ($ |Boolean|))
        (SPADCALL (CONS #'|LNAGG-;sorted?;AB;12!0| $) |l| (QREFELT $ 41))) 

(SDEFUN |LNAGG-;sorted?;AB;12!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (COND ((SPADCALL |x| |y| (QREFELT $ 39)) 'T)
              ('T (SPADCALL |x| |y| (QREFELT $ 28))))) 

(SDEFUN |LNAGG-;merge;3A;13| ((|x| A) (|y| A) ($ A))
        (SPADCALL (ELT $ 39) |x| |y| (QREFELT $ 43))) 

(SDEFUN |LNAGG-;sort;2A;14| ((|l| A) ($ A))
        (SPADCALL (ELT $ 39) |l| (QREFELT $ 45))) 

(SDEFUN |LNAGG-;reverse;2A;15| ((|x| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 47)) (QREFELT $ 48))) 

(SDEFUN |LNAGG-;sort;M2A;16| ((|f| |Mapping| (|Boolean|) S S) (|l| A) ($ A))
        (SPADCALL |f| (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 50))) 

(SDEFUN |LNAGG-;sort!;2A;17| ((|l| A) ($ A))
        (SPADCALL (ELT $ 39) |l| (QREFELT $ 50))) 

(DECLAIM (NOTINLINE |LinearAggregate&;|)) 

(DEFUN |LinearAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LinearAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LinearAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 55) . #1#)
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
             (QSETREFV $ 24
                       (CONS (|dispatchFunction| |LNAGG-;maxIndex;AI;6|) $))
             (COND
              ((|testBitVector| |pv$| 3)
               (PROGN
                (QSETREFV $ 26
                          (CONS (|dispatchFunction| |LNAGG-;position;SAI;7|)
                                $))
                (QSETREFV $ 32
                          (CONS (|dispatchFunction| |LNAGG-;leftTrim;ASA;8|)
                                $))
                (QSETREFV $ 33
                          (CONS (|dispatchFunction| |LNAGG-;rightTrim;ASA;9|)
                                $))
                (QSETREFV $ 34
                          (CONS (|dispatchFunction| |LNAGG-;trim;ASA;10|)
                                $)))))
             (COND
              ((|HasCategory| |#2| '(|SetCategory|))
               (QSETREFV $ 38
                         (CONS
                          (|dispatchFunction| |LNAGG-;hashUpdate!;HsAHs;11|)
                          $))))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 42
                          (CONS (|dispatchFunction| |LNAGG-;sorted?;AB;12|) $))
                (QSETREFV $ 44
                          (CONS (|dispatchFunction| |LNAGG-;merge;3A;13|) $))
                (QSETREFV $ 46
                          (CONS (|dispatchFunction| |LNAGG-;sort;2A;14|) $)))))
             (COND
              ((|testBitVector| |pv$| 5)
               (PROGN
                (QSETREFV $ 49
                          (CONS (|dispatchFunction| |LNAGG-;reverse;2A;15|) $))
                (QSETREFV $ 51
                          (CONS (|dispatchFunction| |LNAGG-;sort;M2A;16|) $))
                (COND
                 ((|testBitVector| |pv$| 1)
                  (QSETREFV $ 52
                            (CONS (|dispatchFunction| |LNAGG-;sort!;2A;17|)
                                  $))))))))))
          $))) 

(MAKEPROP '|LinearAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (|List| 8)
              |LNAGG-;indices;AL;1| (|Boolean|) (10 . <=) |LNAGG-;index?;IAB;2|
              (|NonNegativeInteger|) (16 . |new|) (22 . |concat|)
              |LNAGG-;concat;ASA;3| |LNAGG-;concat;S2A;4| (28 . |insert|)
              |LNAGG-;insert;SAIA;5| (35 . |#|) (40 . |maxIndex|)
              (45 . |position|) (52 . |position|) (58 . |elt|) (64 . =)
              (|UniversalSegment| 8) (70 . SEGMENT) (76 . |elt|)
              (82 . |leftTrim|) (88 . |rightTrim|) (94 . |trim|) (100 . |qelt|)
              (|HashState|) (106 . |hashUpdate!|) (112 . |hashUpdate!|)
              (118 . <) (|Mapping| 13 7 7) (124 . |sorted?|) (130 . |sorted?|)
              (135 . |merge|) (142 . |merge|) (148 . |sort|) (154 . |sort|)
              (159 . |copy|) (164 . |reverse!|) (169 . |reverse|)
              (174 . |sort!|) (180 . |sort|) (186 . |sort!|) (|Mapping| 13 7)
              (|List| $))
           '#(|trim| 191 |sorted?| 197 |sort!| 202 |sort| 207 |rightTrim| 218
              |reverse| 224 |position| 229 |merge| 235 |maxIndex| 241
              |leftTrim| 246 |insert| 252 |indices| 259 |index?| 264
              |hashUpdate!| 270 |concat| 276)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 52
                                                 '(1 6 8 0 9 1 6 8 0 10 2 8 13
                                                   0 0 14 2 6 0 16 7 17 2 6 0 0
                                                   0 18 3 6 0 0 0 8 21 1 6 16 0
                                                   23 1 0 8 0 24 3 6 8 7 0 8 25
                                                   2 0 8 7 0 26 2 6 7 0 8 27 2
                                                   7 13 0 0 28 2 29 0 8 8 30 2
                                                   6 0 0 29 31 2 0 0 0 7 32 2 0
                                                   0 0 7 33 2 0 0 0 7 34 2 6 7
                                                   0 8 35 2 7 36 36 0 37 2 0 36
                                                   36 0 38 2 7 13 0 0 39 2 6 13
                                                   40 0 41 1 0 13 0 42 3 6 0 40
                                                   0 0 43 2 0 0 0 0 44 2 6 0 40
                                                   0 45 1 0 0 0 46 1 6 0 0 47 1
                                                   6 0 0 48 1 0 0 0 49 2 6 0 40
                                                   0 50 2 0 0 40 0 51 1 0 0 0
                                                   52 2 0 0 0 7 34 1 0 13 0 42
                                                   1 0 0 0 52 1 0 0 0 46 2 0 0
                                                   40 0 51 2 0 0 0 7 33 1 0 0 0
                                                   49 2 0 8 7 0 26 2 0 0 0 0 44
                                                   1 0 8 0 24 2 0 0 0 7 32 3 0
                                                   0 7 0 8 22 1 0 11 0 12 2 0
                                                   13 8 0 15 2 0 36 36 0 38 2 0
                                                   0 7 0 20 2 0 0 0 7 19)))))
           '|lookupComplete|)) 
