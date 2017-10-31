
(SDEFUN |STAGG-;explicitlyFinite?;AB;1| ((|x| A) ($ |Boolean|))
        (NULL (SPADCALL |x| (QREFELT $ 9)))) 

(SDEFUN |STAGG-;possiblyInfinite?;AB;2| ((|x| A) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 9))) 

(SDEFUN |STAGG-;first;ANniA;3| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G724 NIL) (|i| NIL) (#2=#:G723 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|STAGG-;first;ANniA;3|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (|STAGG-;c2| |x|
                                 (LETT |x| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                                 $)
                                #2#)
                               . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 14))))) 

(SDEFUN |STAGG-;c2| ((|x| A) (|r| A) ($ S))
        (COND ((SPADCALL |x| (QREFELT $ 17)) (|error| "Index out of range"))
              ('T (SPADCALL |x| (QREFELT $ 18))))) 

(SDEFUN |STAGG-;elt;AIS;5| ((|x| A) (|i| |Integer|) ($ S))
        (SPROG ((#1=#:G728 NIL))
               (SEQ
                (LETT |i| (- |i| (SPADCALL |x| (QREFELT $ 20)))
                      . #2=(|STAGG-;elt;AIS;5|))
                (COND
                 ((OR (< |i| 0)
                      (SPADCALL
                       (LETT |x|
                             (SPADCALL |x|
                                       (PROG1 (LETT #1# |i| . #2#)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                       (QREFELT $ 21))
                             . #2#)
                       (QREFELT $ 17)))
                  (EXIT (|error| "index out of range"))))
                (EXIT (SPADCALL |x| (QREFELT $ 18)))))) 

(SDEFUN |STAGG-;elt;AUsA;6|
        ((|x| A) (|i| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((#1=#:G737 NIL) (#2=#:G736 NIL) (|h| #3=(|Integer|)) (#4=#:G733 NIL)
          (|l| #3#))
         (SEQ
          (LETT |l|
                (- (SPADCALL |i| (QREFELT $ 24)) (SPADCALL |x| (QREFELT $ 20)))
                . #5=(|STAGG-;elt;AUsA;6|))
          (EXIT
           (COND ((< |l| 0) (|error| "index out of range"))
                 ((NULL (SPADCALL |i| (QREFELT $ 25)))
                  (SPADCALL
                   (SPADCALL |x|
                             (PROG1 (LETT #4# |l| . #5#)
                               (|check_subtype2| (>= #4# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #4#))
                             (QREFELT $ 21))
                   (QREFELT $ 26)))
                 ('T
                  (SEQ
                   (LETT |h|
                         (- (SPADCALL |i| (QREFELT $ 27))
                            (SPADCALL |x| (QREFELT $ 20)))
                         . #5#)
                   (EXIT
                    (COND ((< |h| |l|) (SPADCALL (QREFELT $ 28)))
                          ('T
                           (SPADCALL
                            (SPADCALL |x|
                                      (PROG1 (LETT #2# |l| . #5#)
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                      (QREFELT $ 21))
                            (PROG1 (LETT #1# (+ (- |h| |l|) 1) . #5#)
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 29)))))))))))) 

(SDEFUN |STAGG-;concat;3A;7| ((|x| A) (|y| A) ($ A))
        (SPADCALL (SPADCALL |x| (QREFELT $ 26)) |y| (QREFELT $ 31))) 

(SDEFUN |STAGG-;concat;LA;8| ((|l| |List| A) ($ A))
        (SPROG ((|res| (A)) (#1=#:G750 NIL) (|x| NIL) (|l1| (|List| A)))
               (SEQ
                (COND ((NULL |l|) (SPADCALL (QREFELT $ 28)))
                      ('T
                       (SEQ
                        (LETT |l1| (REVERSE |l|) . #2=(|STAGG-;concat;LA;8|))
                        (LETT |res| (SPADCALL (QREFELT $ 28)) . #2#)
                        (SEQ (LETT |x| NIL . #2#) (LETT #1# |l1| . #2#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res|
                                     (SPADCALL (SPADCALL |x| (QREFELT $ 26))
                                               |res| (QREFELT $ 31))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |STAGG-;fill!;ASA;9| ((|x| A) (|s| S) ($ A))
        (SPROG ((|y| (A)))
               (SEQ (LETT |y| |x| . #1=(|STAGG-;fill!;ASA;9|))
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |y| (QREFELT $ 17))))
                           (GO G191)))
                         (SEQ (SPADCALL |y| |s| (QREFELT $ 35))
                              (EXIT
                               (LETT |y| (SPADCALL |y| (QREFELT $ 12)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |STAGG-;setelt!;AI2S;10| ((|x| A) (|i| |Integer|) (|s| S) ($ S))
        (SPROG ((#1=#:G757 NIL))
               (SEQ
                (LETT |i| (- |i| (SPADCALL |x| (QREFELT $ 20)))
                      . #2=(|STAGG-;setelt!;AI2S;10|))
                (COND
                 ((OR (< |i| 0)
                      (SPADCALL
                       (LETT |x|
                             (SPADCALL |x|
                                       (PROG1 (LETT #1# |i| . #2#)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                       (QREFELT $ 21))
                             . #2#)
                       (QREFELT $ 17)))
                  (EXIT (|error| "index out of range"))))
                (EXIT (SPADCALL |x| |s| (QREFELT $ 35)))))) 

(SDEFUN |STAGG-;setelt!;AUs2S;11|
        ((|x| A) (|i| |UniversalSegment| (|Integer|)) (|s| S) ($ S))
        (SPROG
         ((|y| (A)) (|z| (A)) (#1=#:G764 NIL) (#2=#:G763 NIL) (|h| (|Integer|))
          (|l| (|Integer|)))
         (SEQ
          (LETT |l|
                (- (SPADCALL |i| (QREFELT $ 24)) (SPADCALL |x| (QREFELT $ 20)))
                . #3=(|STAGG-;setelt!;AUs2S;11|))
          (EXIT
           (COND ((< |l| 0) (|error| "index out of range"))
                 (#4='T
                  (SEQ
                   (LETT |h|
                         (COND
                          ((SPADCALL |i| (QREFELT $ 25))
                           (- (SPADCALL |i| (QREFELT $ 27))
                              (SPADCALL |x| (QREFELT $ 20))))
                          (#4# (SPADCALL |x| (QREFELT $ 38))))
                         . #3#)
                   (EXIT
                    (COND ((< |h| |l|) |s|)
                          (#4#
                           (SEQ
                            (LETT |y|
                                  (SPADCALL |x|
                                            (PROG1 (LETT #2# |l| . #3#)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            (QREFELT $ 21))
                                  . #3#)
                            (LETT |z|
                                  (SPADCALL |y|
                                            (PROG1
                                                (LETT #1# (+ (- |h| |l|) 1)
                                                      . #3#)
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 21))
                                  . #3#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL (SPADCALL |y| |z| (QREFELT $ 39))))
                                   (GO G191)))
                                 (SEQ (SPADCALL |y| |s| (QREFELT $ 35))
                                      (EXIT
                                       (LETT |y| (SPADCALL |y| (QREFELT $ 12))
                                             . #3#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |s|)))))))))))) 

(SDEFUN |STAGG-;concat!;3A;12| ((|x| A) (|y| A) ($ A))
        (SEQ
         (COND ((SPADCALL |x| (QREFELT $ 17)) |y|)
               ('T
                (SEQ
                 (SPADCALL (SPADCALL |x| (QREFELT $ 41)) |y| (QREFELT $ 42))
                 (EXIT |x|)))))) 

(DECLAIM (NOTINLINE |StreamAggregate&;|)) 

(DEFUN |StreamAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|StreamAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|StreamAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 48) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|shallowlyMutable|))
            (PROGN
             (QSETREFV $ 32 (CONS (|dispatchFunction| |STAGG-;concat;3A;7|) $))
             (QSETREFV $ 34 (CONS (|dispatchFunction| |STAGG-;concat;LA;8|) $))
             (QSETREFV $ 36 (CONS (|dispatchFunction| |STAGG-;fill!;ASA;9|) $))
             (QSETREFV $ 37
                       (CONS (|dispatchFunction| |STAGG-;setelt!;AI2S;10|) $))
             (QSETREFV $ 40
                       (CONS (|dispatchFunction| |STAGG-;setelt!;AUs2S;11|) $))
             (QSETREFV $ 43
                       (CONS (|dispatchFunction| |STAGG-;concat!;3A;12|) $)))))
          $))) 

(MAKEPROP '|StreamAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |cyclic?|) |STAGG-;explicitlyFinite?;AB;1|
              |STAGG-;possiblyInfinite?;AB;2| (5 . |rest|) (|List| 7)
              (10 . |construct|) (|NonNegativeInteger|) |STAGG-;first;ANniA;3|
              (15 . |empty?|) (20 . |first|) (|Integer|) (25 . |minIndex|)
              (30 . |rest|) |STAGG-;elt;AIS;5| (|UniversalSegment| 19)
              (36 . |lo|) (41 . |hasHi|) (46 . |copy|) (51 . |hi|)
              (56 . |empty|) (60 . |first|) |STAGG-;elt;AUsA;6|
              (66 . |concat!|) (72 . |concat|) (|List| $) (78 . |concat|)
              (83 . |setfirst!|) (89 . |fill!|) (95 . |setelt!|)
              (102 . |maxIndex|) (107 . |eq?|) (113 . |setelt!|) (120 . |tail|)
              (125 . |setrest!|) (131 . |concat!|) '"rest" '"last" '"first"
              '"value")
           '#(|setelt!| 137 |possiblyInfinite?| 151 |first| 156 |fill!| 162
              |explicitlyFinite?| 168 |elt| 173 |concat!| 185 |concat| 191)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(1 6 8 0 9 1 6 0 0 12 1 6 0
                                                   13 14 1 6 8 0 17 1 6 7 0 18
                                                   1 6 19 0 20 2 6 0 0 15 21 1
                                                   23 19 0 24 1 23 8 0 25 1 6 0
                                                   0 26 1 23 19 0 27 0 6 0 28 2
                                                   6 0 0 15 29 2 6 0 0 0 31 2 0
                                                   0 0 0 32 1 0 0 33 34 2 6 7 0
                                                   7 35 2 0 0 0 7 36 3 0 7 0 19
                                                   7 37 1 6 19 0 38 2 6 8 0 0
                                                   39 3 0 7 0 23 7 40 1 6 0 0
                                                   41 2 6 0 0 0 42 2 0 0 0 0 43
                                                   3 0 7 0 19 7 37 3 0 7 0 23 7
                                                   40 1 0 8 0 11 2 0 0 0 15 16
                                                   2 0 0 0 7 36 1 0 8 0 10 2 0
                                                   7 0 19 22 2 0 0 0 23 30 2 0
                                                   0 0 0 43 1 0 0 33 34 2 0 0 0
                                                   0 32)))))
           '|lookupComplete|)) 
