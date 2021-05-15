
(SDEFUN |STAGG-;explicitlyFinite?;AB;1| ((|x| A) ($ |Boolean|))
        (NULL (SPADCALL |x| (QREFELT $ 9)))) 

(SDEFUN |STAGG-;possiblyInfinite?;AB;2| ((|x| A) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 9))) 

(SDEFUN |STAGG-;elt;AIS;3| ((|x| A) (|i| |Integer|) ($ S))
        (SPROG ((#1=#:G398 NIL))
               (SEQ (LETT |i| (- |i| (SPADCALL |x| (QREFELT $ 13))))
                    (COND
                     ((OR (< |i| 0)
                          (SPADCALL
                           (LETT |x|
                                 (SPADCALL |x|
                                           (PROG1 (LETT #1# |i|)
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT $ 15)))
                           (QREFELT $ 16)))
                      (EXIT (|error| "index out of range"))))
                    (EXIT (SPADCALL |x| (QREFELT $ 17)))))) 

(SDEFUN |STAGG-;elt;AUsA;4|
        ((|x| A) (|i| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((#1=#:G407 NIL) (#2=#:G406 NIL) (|h| #3=(|Integer|)) (#4=#:G403 NIL)
          (|l| #3#))
         (SEQ
          (LETT |l|
                (- (SPADCALL |i| (QREFELT $ 20))
                   (SPADCALL |x| (QREFELT $ 13))))
          (EXIT
           (COND ((< |l| 0) (|error| "index out of range"))
                 ((NULL (SPADCALL |i| (QREFELT $ 21)))
                  (SPADCALL
                   (SPADCALL |x|
                             (PROG1 (LETT #4# |l|)
                               (|check_subtype2| (>= #4# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #4#))
                             (QREFELT $ 15))
                   (QREFELT $ 22)))
                 ('T
                  (SEQ
                   (LETT |h|
                         (- (SPADCALL |i| (QREFELT $ 23))
                            (SPADCALL |x| (QREFELT $ 13))))
                   (EXIT
                    (COND ((< |h| |l|) (SPADCALL (QREFELT $ 24)))
                          ('T
                           (SPADCALL
                            (SPADCALL |x|
                                      (PROG1 (LETT #2# |l|)
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                      (QREFELT $ 15))
                            (PROG1 (LETT #1# (+ (- |h| |l|) 1))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 25)))))))))))) 

(SDEFUN |STAGG-;concat;3A;5| ((|x| A) (|y| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 22)) |y| (QREFELT $ 27))) 

(SDEFUN |STAGG-;concat;LA;6| ((|l| |List| A) ($ A))
        (SPROG ((|res| (A)) (#1=#:G416 NIL) (|x| NIL) (|l1| (|List| A)))
               (SEQ
                (COND ((NULL |l|) (SPADCALL (QREFELT $ 24)))
                      ('T
                       (SEQ (LETT |l1| (REVERSE |l|))
                            (LETT |res| (SPADCALL (QREFELT $ 24)))
                            (SEQ (LETT |x| NIL) (LETT #1# |l1|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT $ 22)) |res|
                                          (QREFELT $ 27)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |res|))))))) 

(SDEFUN |STAGG-;fill!;ASA;7| ((|x| A) (|s| S) ($ A))
        (SPROG ((|y| (A)))
               (SEQ (LETT |y| |x|)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |y| (QREFELT $ 16))))
                           (GO G191)))
                         (SEQ (SPADCALL |y| |s| (QREFELT $ 31))
                              (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 32)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |STAGG-;setelt!;AI2S;8| ((|x| A) (|i| |Integer|) (|s| S) ($ S))
        (SPROG ((#1=#:G423 NIL))
               (SEQ (LETT |i| (- |i| (SPADCALL |x| (QREFELT $ 13))))
                    (COND
                     ((OR (< |i| 0)
                          (SPADCALL
                           (LETT |x|
                                 (SPADCALL |x|
                                           (PROG1 (LETT #1# |i|)
                                             (|check_subtype2| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                           (QREFELT $ 15)))
                           (QREFELT $ 16)))
                      (EXIT (|error| "index out of range"))))
                    (EXIT (SPADCALL |x| |s| (QREFELT $ 31)))))) 

(SDEFUN |STAGG-;setelt!;AUs2S;9|
        ((|x| A) (|i| |UniversalSegment| (|Integer|)) (|s| S) ($ S))
        (SPROG
         ((|y| (A)) (|z| (A)) (#1=#:G430 NIL) (#2=#:G429 NIL) (|h| (|Integer|))
          (|l| (|Integer|)))
         (SEQ
          (LETT |l|
                (- (SPADCALL |i| (QREFELT $ 20))
                   (SPADCALL |x| (QREFELT $ 13))))
          (EXIT
           (COND ((< |l| 0) (|error| "index out of range"))
                 (#3='T
                  (SEQ
                   (LETT |h|
                         (COND
                          ((SPADCALL |i| (QREFELT $ 21))
                           (- (SPADCALL |i| (QREFELT $ 23))
                              (SPADCALL |x| (QREFELT $ 13))))
                          (#3# (SPADCALL |x| (QREFELT $ 35)))))
                   (EXIT
                    (COND ((< |h| |l|) |s|)
                          (#3#
                           (SEQ
                            (LETT |y|
                                  (SPADCALL |x|
                                            (PROG1 (LETT #2# |l|)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            (QREFELT $ 15)))
                            (LETT |z|
                                  (SPADCALL |y|
                                            (PROG1 (LETT #1# (+ (- |h| |l|) 1))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 15)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL (SPADCALL |y| |z| (QREFELT $ 36))))
                                   (GO G191)))
                                 (SEQ (SPADCALL |y| |s| (QREFELT $ 31))
                                      (EXIT
                                       (LETT |y|
                                             (SPADCALL |y| (QREFELT $ 32)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |s|)))))))))))) 

(SDEFUN |STAGG-;concat!;3A;10| ((|x| A) (|y| A) ($ A))
        (SEQ
         (COND ((SPADCALL |x| (QREFELT $ 16)) |y|)
               ('T
                (SEQ
                 (SPADCALL (SPADCALL |x| (QREFELT $ 38)) |y| (QREFELT $ 39))
                 (EXIT |x|)))))) 

(DECLAIM (NOTINLINE |StreamAggregate&;|)) 

(DEFUN |StreamAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|StreamAggregate&| DV$1 DV$2))
          (LETT $ (GETREFV 45))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|shallowlyMutable|))
            (PROGN
             (QSETREFV $ 28 (CONS (|dispatchFunction| |STAGG-;concat;3A;5|) $))
             (QSETREFV $ 30 (CONS (|dispatchFunction| |STAGG-;concat;LA;6|) $))
             (QSETREFV $ 33 (CONS (|dispatchFunction| |STAGG-;fill!;ASA;7|) $))
             (QSETREFV $ 34
                       (CONS (|dispatchFunction| |STAGG-;setelt!;AI2S;8|) $))
             (QSETREFV $ 37
                       (CONS (|dispatchFunction| |STAGG-;setelt!;AUs2S;9|) $))
             (QSETREFV $ 40
                       (CONS (|dispatchFunction| |STAGG-;concat!;3A;10|) $)))))
          $))) 

(MAKEPROP '|StreamAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |cyclic?|) |STAGG-;explicitlyFinite?;AB;1|
              |STAGG-;possiblyInfinite?;AB;2| (|Integer|) (5 . |minIndex|)
              (|NonNegativeInteger|) (10 . |rest|) (16 . |empty?|)
              (21 . |first|) |STAGG-;elt;AIS;3| (|UniversalSegment| 12)
              (26 . |low|) (31 . |hasHi|) (36 . |copy|) (41 . |high|)
              (46 . |empty|) (50 . |first|) |STAGG-;elt;AUsA;4|
              (56 . |concat!|) (62 . |concat|) (|List| $) (68 . |concat|)
              (73 . |setfirst!|) (79 . |rest|) (84 . |fill!|) (90 . |setelt!|)
              (97 . |maxIndex|) (102 . |eq?|) (108 . |setelt!|) (115 . |tail|)
              (120 . |setrest!|) (126 . |concat!|) '#1="last" '#2="rest"
              '#3="first" '#4="value")
           '#(|setelt!| 132 |possiblyInfinite?| 146 |fill!| 151
              |explicitlyFinite?| 157 |elt| 162 |concat!| 174 |concat| 180)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|possiblyInfinite?| ((|Boolean|) |#1|)) T)
                              '((|explicitlyFinite?| ((|Boolean|) |#1|)) T)
                              '((|setelt!| (|#2| |#1| (|Integer|) |#2|)) T)
                              '((|elt| (|#2| |#1| (|Integer|) |#2|)) T)
                              '((|elt| (|#2| |#1| (|Integer|))) T)
                              '((|fill!| (|#1| |#1| |#2|)) T)
                              '((|elt|
                                 (|#1| |#1| (|UniversalSegment| (|Integer|))))
                                T)
                              '((|concat| (|#1| |#1| |#2|)) T)
                              '((|concat| (|#1| (|List| |#1|))) T)
                              '((|setelt!|
                                 (|#2| |#1| (|UniversalSegment| (|Integer|))
                                  |#2|))
                                T)
                              '((|setelt!| (|#2| |#1| #1# |#2|)) T)
                              '((|setelt!| (|#1| |#1| #2# |#1|)) T)
                              '((|setelt!| (|#2| |#1| #3# |#2|)) T)
                              '((|concat!| (|#1| (|List| |#1|))) T)
                              '((|concat!| (|#1| |#1| |#2|)) T)
                              '((|concat!| (|#1| |#1| |#1|)) T)
                              '((|elt| (|#2| |#1| #1#)) T)
                              '((|elt| (|#1| |#1| #2#)) T)
                              '((|elt| (|#2| |#1| #3#)) T)
                              '((|concat| (|#1| |#2| |#1|)) T)
                              '((|concat| (|#1| |#1| |#1|)) T)
                              '((|setelt!| (|#2| |#1| #4# |#2|)) T)
                              '((|elt| (|#2| |#1| #4#)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 40
                                            '(1 6 8 0 9 1 6 12 0 13 2 6 0 0 14
                                              15 1 6 8 0 16 1 6 7 0 17 1 19 12
                                              0 20 1 19 8 0 21 1 6 0 0 22 1 19
                                              12 0 23 0 6 0 24 2 6 0 0 14 25 2
                                              6 0 0 0 27 2 0 0 0 0 28 1 0 0 29
                                              30 2 6 7 0 7 31 1 6 0 0 32 2 0 0
                                              0 7 33 3 0 7 0 12 7 34 1 6 12 0
                                              35 2 6 8 0 0 36 3 0 7 0 19 7 37 1
                                              6 0 0 38 2 6 0 0 0 39 2 0 0 0 0
                                              40 3 0 7 0 12 7 34 3 0 7 0 19 7
                                              37 1 0 8 0 11 2 0 0 0 7 33 1 0 8
                                              0 10 2 0 7 0 12 18 2 0 0 0 19 26
                                              2 0 0 0 0 40 1 0 0 29 30 2 0 0 0
                                              0 28)))))
           '|lookupComplete|)) 
