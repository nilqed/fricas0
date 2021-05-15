
(SDEFUN |LSAGG-;sort!;M2A;1| ((|f| |Mapping| (|Boolean|) S S) (|l| A) ($ A))
        (|LSAGG-;mergeSort| |f| |l| (SPADCALL |l| (QREFELT $ 9)) $)) 

(SDEFUN |LSAGG-;list;SA;2| ((|x| S) ($ A))
        (SPADCALL |x| (SPADCALL (QREFELT $ 12)) (QREFELT $ 13))) 

(SDEFUN |LSAGG-;reduce;MAS;3| ((|f| |Mapping| S S S) (|x| A) ($ S))
        (COND
         ((SPADCALL |x| (QREFELT $ 16))
          (|error| "reducing over an empty list needs the 3 argument form"))
         ('T
          (SPADCALL |f| (SPADCALL |x| (QREFELT $ 17))
                    (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 20))))) 

(SDEFUN |LSAGG-;merge;M3A;4|
        ((|f| |Mapping| (|Boolean|) S S) (|p| A) (|q| A) ($ A))
        (SPADCALL |f| (SPADCALL |p| (QREFELT $ 22))
                  (SPADCALL |q| (QREFELT $ 22)) (QREFELT $ 23))) 

(SDEFUN |LSAGG-;select!;M2A;5| ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ A))
        (SPROG ((|z| (A)) (|y| (A)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                              ('T
                               (NULL
                                (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                          |f|)))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17))))) NIL
                     (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |x| (QREFELT $ 16)) |x|)
                       ('T
                        (SEQ (LETT |y| |x|)
                             (LETT |z| (SPADCALL |y| (QREFELT $ 17)))
                             (SEQ G190
                                  (COND
                                   ((NULL (NULL (SPADCALL |z| (QREFELT $ 16))))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |z| (QREFELT $ 18))
                                                |f|)
                                      (SEQ (LETT |y| |z|)
                                           (EXIT
                                            (LETT |z|
                                                  (SPADCALL |z|
                                                            (QREFELT $ 17))))))
                                     ('T
                                      (SEQ
                                       (LETT |z| (SPADCALL |z| (QREFELT $ 17)))
                                       (EXIT
                                        (SPADCALL |y| |z| (QREFELT $ 25))))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT |x|)))))))) 

(SDEFUN |LSAGG-;merge!;M3A;6|
        ((|f| |Mapping| (|Boolean|) S S) (|p| A) (|q| A) ($ A))
        (SPROG ((|t| (A)) (|r| (A)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 16)) |q|)
                      ((SPADCALL |q| (QREFELT $ 16)) |p|)
                      ((SPADCALL |p| |q| (QREFELT $ 28))
                       (|error| "cannot merge a list into itself"))
                      (#1='T
                       (SEQ
                        (COND
                         ((SPADCALL (SPADCALL |p| (QREFELT $ 18))
                                    (SPADCALL |q| (QREFELT $ 18)) |f|)
                          (SEQ (LETT |r| (LETT |t| |p|))
                               (EXIT
                                (LETT |p| (SPADCALL |p| (QREFELT $ 17))))))
                         (#1#
                          (SEQ (LETT |r| (LETT |t| |q|))
                               (EXIT
                                (LETT |q| (SPADCALL |q| (QREFELT $ 17)))))))
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((SPADCALL |p| (QREFELT $ 16)) NIL)
                                      ('T
                                       (NULL (SPADCALL |q| (QREFELT $ 16))))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |p| (QREFELT $ 18))
                                           (SPADCALL |q| (QREFELT $ 18)) |f|)
                                 (SEQ (SPADCALL |t| |p| (QREFELT $ 25))
                                      (LETT |t| |p|)
                                      (EXIT
                                       (LETT |p|
                                             (SPADCALL |p| (QREFELT $ 17))))))
                                ('T
                                 (SEQ (SPADCALL |t| |q| (QREFELT $ 25))
                                      (LETT |t| |q|)
                                      (EXIT
                                       (LETT |q|
                                             (SPADCALL |q|
                                                       (QREFELT $ 17)))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (SPADCALL |t|
                                  (COND ((SPADCALL |p| (QREFELT $ 16)) |q|)
                                        (#1# |p|))
                                  (QREFELT $ 25))
                        (EXIT |r|))))))) 

(SDEFUN |LSAGG-;insert!;SAIA;7| ((|s| S) (|x| A) (|i| |Integer|) ($ A))
        (SPROG ((|z| (A)) (|y| (A)) (#1=#:G477 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 31)))
                    (EXIT
                     (COND ((< |i| |m|) (|error| "index out of range"))
                           ((EQL |i| |m|) (SPADCALL |s| |x| (QREFELT $ 13)))
                           ('T
                            (SEQ
                             (LETT |y|
                                   (SPADCALL |x|
                                             (PROG1
                                                 (LETT #1# (- (- |i| 1) |m|))
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 32)))
                             (LETT |z| (SPADCALL |y| (QREFELT $ 17)))
                             (SPADCALL |y| (SPADCALL |s| |z| (QREFELT $ 13))
                                       (QREFELT $ 25))
                             (EXIT |x|)))))))) 

(SDEFUN |LSAGG-;insert!;2AIA;8| ((|w| A) (|x| A) (|i| |Integer|) ($ A))
        (SPROG ((|z| (A)) (|y| (A)) (#1=#:G481 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 31)))
                    (EXIT
                     (COND ((< |i| |m|) (|error| "index out of range"))
                           ((EQL |i| |m|) (SPADCALL |w| |x| (QREFELT $ 34)))
                           ('T
                            (SEQ
                             (LETT |y|
                                   (SPADCALL |x|
                                             (PROG1
                                                 (LETT #1# (- (- |i| 1) |m|))
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 32)))
                             (LETT |z| (SPADCALL |y| (QREFELT $ 17)))
                             (SPADCALL |y| |w| (QREFELT $ 25))
                             (SPADCALL |y| |z| (QREFELT $ 34)) (EXIT |x|)))))))) 

(SDEFUN |LSAGG-;remove!;M2A;9| ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ A))
        (SPROG ((|q| (A)) (|p| (A)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                              ('T
                               (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |f|))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17))))) NIL
                     (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |x| (QREFELT $ 16)) |x|)
                       ('T
                        (SEQ (LETT |p| |x|)
                             (LETT |q| (SPADCALL |x| (QREFELT $ 17)))
                             (SEQ G190
                                  (COND
                                   ((NULL (NULL (SPADCALL |q| (QREFELT $ 16))))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |q| (QREFELT $ 18))
                                                |f|)
                                      (LETT |q|
                                            (SPADCALL |p|
                                                      (SPADCALL |q|
                                                                (QREFELT $ 17))
                                                      (QREFELT $ 25))))
                                     ('T
                                      (SEQ (LETT |p| |q|)
                                           (EXIT
                                            (LETT |q|
                                                  (SPADCALL |q|
                                                            (QREFELT $
                                                                     17)))))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT |x|)))))))) 

(SDEFUN |LSAGG-;delete!;AIA;10| ((|x| A) (|i| |Integer|) ($ A))
        (SPROG ((|y| (A)) (#1=#:G494 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 31)))
                    (EXIT
                     (COND ((< |i| |m|) (|error| "index out of range"))
                           ((EQL |i| |m|) (SPADCALL |x| (QREFELT $ 17)))
                           ('T
                            (SEQ
                             (LETT |y|
                                   (SPADCALL |x|
                                             (PROG1
                                                 (LETT #1# (- (- |i| 1) |m|))
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 32)))
                             (SPADCALL |y| (SPADCALL |y| 2 (QREFELT $ 32))
                                       (QREFELT $ 25))
                             (EXIT |x|)))))))) 

(SDEFUN |LSAGG-;delete!;AUsA;11|
        ((|x| A) (|i| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((#1=#:G501 NIL) (|t| (A)) (#2=#:G500 NIL) (#3=#:G499 NIL)
          (|h| (|Integer|)) (|m| (|Integer|)) (|l| (|Integer|)))
         (SEQ (LETT |l| (SPADCALL |i| (QREFELT $ 39)))
              (LETT |m| (SPADCALL |x| (QREFELT $ 31)))
              (EXIT
               (COND ((< |l| |m|) (|error| "index out of range"))
                     (#4='T
                      (SEQ
                       (LETT |h|
                             (COND
                              ((SPADCALL |i| (QREFELT $ 40))
                               (SPADCALL |i| (QREFELT $ 41)))
                              (#4# (SPADCALL |x| (QREFELT $ 42)))))
                       (EXIT
                        (COND ((< |h| |l|) |x|)
                              ((EQL |l| |m|)
                               (SPADCALL |x|
                                         (PROG1 (LETT #3# (- (+ |h| 1) |m|))
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         (QREFELT $ 32)))
                              (#4#
                               (SEQ
                                (LETT |t|
                                      (SPADCALL |x|
                                                (PROG1
                                                    (LETT #2#
                                                          (- (- |l| 1) |m|))
                                                  (|check_subtype2| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #2#))
                                                (QREFELT $ 32)))
                                (SPADCALL |t|
                                          (SPADCALL |t|
                                                    (PROG1
                                                        (LETT #1#
                                                              (+ (- |h| |l|)
                                                                 2))
                                                      (|check_subtype2|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                                    (QREFELT $ 32))
                                          (QREFELT $ 25))
                                (EXIT |x|)))))))))))) 

(SDEFUN |LSAGG-;find;MAU;12|
        ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ |Union| S "failed"))
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                       ('T
                        (NULL (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |f|)))))
                (GO G191)))
              (SEQ (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17))))) NIL
              (GO G190) G191 (EXIT NIL))
         (EXIT
          (COND ((SPADCALL |x| (QREFELT $ 16)) (CONS 1 "failed"))
                ('T (CONS 0 (SPADCALL |x| (QREFELT $ 18)))))))) 

(SDEFUN |LSAGG-;position;MAI;13|
        ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ |Integer|))
        (SPROG ((|k| NIL))
               (SEQ
                (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 31))) G190
                     (COND
                      ((NULL
                        (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                              ('T
                               (NULL
                                (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                          |f|)))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT $ 16))
                   (- (SPADCALL |x| (QREFELT $ 31)) 1))
                  ('T |k|)))))) 

(SDEFUN |LSAGG-;mergeSort|
        ((|f| |Mapping| (|Boolean|) S S) (|p| A) (|n| |Integer|) ($ A))
        (SPROG ((|q| (A)) (|l| (|NonNegativeInteger|)) (#1=#:G523 NIL))
               (SEQ
                (COND
                 ((EQL |n| 2)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |p| (QREFELT $ 17)) (QREFELT $ 18))
                     (SPADCALL |p| (QREFELT $ 18)) |f|)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 47)))))))
                (EXIT
                 (COND ((< |n| 3) |p|)
                       ('T
                        (SEQ
                         (LETT |l|
                               (PROG1 (LETT #1# (QUOTIENT2 |n| 2))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#)))
                         (LETT |q| (SPADCALL |p| |l| (QREFELT $ 48)))
                         (LETT |p| (|LSAGG-;mergeSort| |f| |p| |l| $))
                         (LETT |q| (|LSAGG-;mergeSort| |f| |q| (- |n| |l|) $))
                         (EXIT (SPADCALL |f| |p| |q| (QREFELT $ 23)))))))))) 

(SDEFUN |LSAGG-;sorted?;MAB;15|
        ((|f| |Mapping| (|Boolean|) S S) (|l| A) ($ |Boolean|))
        (SPROG ((|p| (A)) (#1=#:G540 NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |l| (QREFELT $ 16)) 'T)
                       ('T
                        (SEQ (LETT |p| (SPADCALL |l| (QREFELT $ 17)))
                             (SEQ G190
                                  (COND
                                   ((NULL (NULL (SPADCALL |p| (QREFELT $ 16))))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (SPADCALL (SPADCALL |l| (QREFELT $ 18))
                                                 (SPADCALL |p| (QREFELT $ 18))
                                                 |f|))
                                      (PROGN (LETT #1# NIL) (GO #2=#:G539)))
                                     ('T
                                      (LETT |p|
                                            (SPADCALL (LETT |l| |p|)
                                                      (QREFELT $ 17)))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT 'T)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LSAGG-;reduce;MA2S;16| ((|f| |Mapping| S S S) (|x| A) (|i| S) ($ S))
        (SPROG ((|r| (S)))
               (SEQ (LETT |r| |i|)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |x| (QREFELT $ 16))))
                           (GO G191)))
                         (SEQ
                          (LETT |r|
                                (SPADCALL |r| (SPADCALL |x| (QREFELT $ 18))
                                          |f|))
                          (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |LSAGG-;reduce;MA3S;17|
        ((|f| |Mapping| S S S) (|x| A) (|i| S) (|a| S) ($ S))
        (SPROG ((|r| (S)))
               (SEQ (LETT |r| |i|)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                                  ('T (SPADCALL |r| |a| (QREFELT $ 51)))))
                           (GO G191)))
                         (SEQ
                          (LETT |r|
                                (SPADCALL |r| (SPADCALL |x| (QREFELT $ 18))
                                          |f|))
                          (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |LSAGG-;new;NniSA;18| ((|n| |NonNegativeInteger|) (|s| S) ($ A))
        (SPROG ((|l| (A)) (#1=#:G554 NIL) (|k| NIL))
               (SEQ (LETT |l| (SPADCALL (QREFELT $ 12)))
                    (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT (LETT |l| (SPADCALL |s| |l| (QREFELT $ 13)))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |LSAGG-;map;M3A;19| ((|f| |Mapping| S S S) (|x| A) (|y| A) ($ A))
        (SPROG ((|z| (A)))
               (SEQ (LETT |z| (SPADCALL (QREFELT $ 12)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                                  ('T (NULL (SPADCALL |y| (QREFELT $ 16))))))
                           (GO G191)))
                         (SEQ
                          (LETT |z|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                           (SPADCALL |y| (QREFELT $ 18)) |f|)
                                 |z| (QREFELT $ 13)))
                          (LETT |x| (SPADCALL |x| (QREFELT $ 17)))
                          (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 17)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |z| (QREFELT $ 47)))))) 

(SDEFUN |LSAGG-;reverse!;2A;20| ((|x| A) ($ A))
        (SPROG ((|y| (A)) (|z| (A)))
               (SEQ
                (COND
                 ((OR (SPADCALL |x| (QREFELT $ 16))
                      (SPADCALL (LETT |y| (SPADCALL |x| (QREFELT $ 17)))
                                (QREFELT $ 16)))
                  |x|)
                 ('T
                  (SEQ (SPADCALL |x| (SPADCALL (QREFELT $ 12)) (QREFELT $ 25))
                       (SEQ G190
                            (COND
                             ((NULL (NULL (SPADCALL |y| (QREFELT $ 16))))
                              (GO G191)))
                            (SEQ (LETT |z| (SPADCALL |y| (QREFELT $ 17)))
                                 (SPADCALL |y| |x| (QREFELT $ 25))
                                 (LETT |x| |y|) (EXIT (LETT |y| |z|)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |x|))))))) 

(SDEFUN |LSAGG-;copy;2A;21| ((|x| A) ($ A))
        (SPROG ((|y| (A)) (|k| NIL))
               (SEQ (LETT |y| (SPADCALL (QREFELT $ 12)))
                    (SEQ (LETT |k| 0) G190
                         (COND
                          ((NULL (NULL (SPADCALL |x| (QREFELT $ 16))))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((EQL |k| 1000)
                            (COND
                             ((SPADCALL |x| (QREFELT $ 56))
                              (EXIT (|error| "cyclic list"))))))
                          (LETT |y|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 18)) |y|
                                          (QREFELT $ 13)))
                          (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |y| (QREFELT $ 47)))))) 

(SDEFUN |LSAGG-;copyInto!;2AIA;22| ((|y| A) (|x| A) (|s| |Integer|) ($ A))
        (SPROG ((|z| (A)) (#1=#:G574 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (SPADCALL |y| (QREFELT $ 31)))
                    (EXIT
                     (COND ((< |s| |m|) (|error| "index out of range"))
                           ('T
                            (SEQ
                             (LETT |z|
                                   (SPADCALL |y|
                                             (PROG1 (LETT #1# (- |s| |m|))
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 32)))
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND ((SPADCALL |z| (QREFELT $ 16)) NIL)
                                           ('T
                                            (NULL
                                             (SPADCALL |x| (QREFELT $ 16))))))
                                    (GO G191)))
                                  (SEQ
                                   (SPADCALL |z| (SPADCALL |x| (QREFELT $ 18))
                                             (QREFELT $ 58))
                                   (LETT |x| (SPADCALL |x| (QREFELT $ 17)))
                                   (EXIT
                                    (LETT |z| (SPADCALL |z| (QREFELT $ 17)))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT |y|)))))))) 

(SDEFUN |LSAGG-;position;SA2I;23|
        ((|w| S) (|x| A) (|s| |Integer|) ($ |Integer|))
        (SPROG ((|k| NIL) (#1=#:G582 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 31)))
                    (EXIT
                     (COND ((< |s| |m|) (|error| "index out of range"))
                           (#2='T
                            (SEQ
                             (LETT |x|
                                   (SPADCALL |x|
                                             (PROG1 (LETT #1# (- |s| |m|))
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 32)))
                             (SEQ (LETT |k| |s|) G190
                                  (COND
                                   ((NULL
                                     (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                                           ('T
                                            (SPADCALL |w|
                                                      (SPADCALL |x|
                                                                (QREFELT $ 18))
                                                      (QREFELT $ 51)))))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                                  (LETT |k| (+ |k| 1)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (COND
                               ((SPADCALL |x| (QREFELT $ 16))
                                (- (SPADCALL |x| (QREFELT $ 31)) 1))
                               (#2# |k|)))))))))) 

(SDEFUN |LSAGG-;removeDuplicates!;2A;24| ((|l| A) ($ A))
        (SPROG ((|p| (A)))
               (SEQ (LETT |p| |l|)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |p| (QREFELT $ 16))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |p|
                                 (SPADCALL |p|
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT $ 18))
                                            (SPADCALL |p| (QREFELT $ 17))
                                            (QREFELT $ 61))
                                           (QREFELT $ 25)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |LSAGG-;<;2AB;25| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G600 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                                ('T (NULL (SPADCALL |y| (QREFELT $ 16))))))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                     (SPADCALL |y| (QREFELT $ 18))
                                     (QREFELT $ 51))
                           (PROGN
                            (LETT #1#
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                            (SPADCALL |y| (QREFELT $ 18))
                                            (QREFELT $ 63)))
                            (GO #2=#:G599)))
                          ('T
                           (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 17)))
                                (EXIT
                                 (LETT |y| (SPADCALL |y| (QREFELT $ 17)))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 16))
                     (NULL (SPADCALL |y| (QREFELT $ 16))))
                    ('T NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LSAGG-;smaller?;2AB;26| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G609 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |x| (QREFELT $ 16)) NIL)
                                ('T (NULL (SPADCALL |y| (QREFELT $ 16))))))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                     (SPADCALL |y| (QREFELT $ 18))
                                     (QREFELT $ 51))
                           (PROGN
                            (LETT #1#
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                            (SPADCALL |y| (QREFELT $ 18))
                                            (QREFELT $ 65)))
                            (GO #2=#:G608)))
                          ('T
                           (SEQ (LETT |x| (SPADCALL |x| (QREFELT $ 17)))
                                (EXIT
                                 (LETT |y| (SPADCALL |y| (QREFELT $ 17)))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 16))
                     (NULL (SPADCALL |y| (QREFELT $ 16))))
                    ('T NIL)))))
                #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |ListAggregate&;|)) 

(DEFUN |ListAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ListAggregate&| DV$1 DV$2))
          (LETT $ (GETREFV 68))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|BasicType|))
            (QSETREFV $ 52
                      (CONS (|dispatchFunction| |LSAGG-;reduce;MA3S;17|) $))))
          (COND
           ((|HasCategory| |#2| '(|BasicType|))
            (PROGN
             (QSETREFV $ 60
                       (CONS (|dispatchFunction| |LSAGG-;position;SA2I;23|) $))
             (QSETREFV $ 62
                       (CONS
                        (|dispatchFunction| |LSAGG-;removeDuplicates!;2A;24|)
                        $)))))
          (COND
           ((|HasCategory| |#2| '(|OrderedSet|))
            (QSETREFV $ 64 (CONS (|dispatchFunction| |LSAGG-;<;2AB;25|) $))))
          (COND
           ((|HasCategory| |#2| '(|Comparable|))
            (QSETREFV $ 66
                      (CONS (|dispatchFunction| |LSAGG-;smaller?;2AB;26|) $))))
          $))) 

(MAKEPROP '|ListAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |#|) (|Mapping| 15 7 7)
              |LSAGG-;sort!;M2A;1| (5 . |empty|) (9 . |concat|)
              |LSAGG-;list;SA;2| (|Boolean|) (15 . |empty?|) (20 . |rest|)
              (25 . |first|) (|Mapping| 7 7 7) (30 . |reduce|)
              |LSAGG-;reduce;MAS;3| (37 . |copy|) (42 . |merge!|)
              |LSAGG-;merge;M3A;4| (49 . |setrest!|) (|Mapping| 15 7)
              |LSAGG-;select!;M2A;5| (55 . |eq?|) |LSAGG-;merge!;M3A;6|
              (|Integer|) (61 . |minIndex|) (66 . |rest|)
              |LSAGG-;insert!;SAIA;7| (72 . |concat!|) |LSAGG-;insert!;2AIA;8|
              |LSAGG-;remove!;M2A;9| |LSAGG-;delete!;AIA;10|
              (|UniversalSegment| 30) (78 . |low|) (83 . |hasHi|) (88 . |high|)
              (93 . |maxIndex|) |LSAGG-;delete!;AUsA;11|
              (|Union| 7 '#1="failed") |LSAGG-;find;MAU;12|
              |LSAGG-;position;MAI;13| (98 . |reverse!|) (103 . |split!|)
              |LSAGG-;sorted?;MAB;15| |LSAGG-;reduce;MA2S;16| (109 . ~=)
              (115 . |reduce|) |LSAGG-;new;NniSA;18| |LSAGG-;map;M3A;19|
              |LSAGG-;reverse!;2A;20| (123 . |cyclic?|) |LSAGG-;copy;2A;21|
              (128 . |setfirst!|) |LSAGG-;copyInto!;2AIA;22| (134 . |position|)
              (141 . |remove!|) (147 . |removeDuplicates!|) (152 . <) (158 . <)
              (164 . |smaller?|) (170 . |smaller?|) (|Mapping| 7 7))
           '#(|sorted?| 176 |sort!| 182 |smaller?| 188 |select!| 194 |reverse!|
              200 |removeDuplicates!| 205 |remove!| 210 |reduce| 216 |position|
              237 |new| 250 |merge!| 256 |merge| 263 |map| 270 |list| 277
              |insert!| 282 |find| 296 |delete!| 302 |copyInto!| 314 |copy| 321
              < 326)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|list| (|#1| |#2|)) T)
                                   '((|delete!| (|#1| |#1| (|Integer|))) T)
                                   '((|delete!|
                                      (|#1| |#1|
                                       (|UniversalSegment| (|Integer|))))
                                     T)
                                   '((|remove!|
                                      (|#1| (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|insert!| (|#1| |#2| |#1| (|Integer|)))
                                     T)
                                   '((|insert!| (|#1| |#1| |#1| (|Integer|)))
                                     T)
                                   '((|merge!|
                                      (|#1| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1| |#1|))
                                     T)
                                   '((|select!|
                                      (|#1| (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|remove!| (|#1| |#2| |#1|)) T)
                                   '((|removeDuplicates!| (|#1| |#1|)) T)
                                   '((|merge!| (|#1| |#1| |#1|)) T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#2| |#2|))
                                     T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#2|))
                                     T)
                                   '((|reduce|
                                      (|#2| (|Mapping| |#2| |#2| |#2|) |#1|))
                                     T)
                                   '((|find|
                                      ((|Union| |#2| #1#)
                                       (|Mapping| (|Boolean|) |#2|) |#1|))
                                     T)
                                   '((|new| (|#1| (|NonNegativeInteger|) |#2|))
                                     T)
                                   '((|map|
                                      (|#1| (|Mapping| |#2| |#2| |#2|) |#1|
                                       |#1|))
                                     T)
                                   '((|merge|
                                      (|#1| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1| |#1|))
                                     T)
                                   '((|sorted?|
                                      ((|Boolean|)
                                       (|Mapping| (|Boolean|) |#2| |#2|) |#1|))
                                     T)
                                   '((|position|
                                      ((|Integer|) (|Mapping| (|Boolean|) |#2|)
                                       |#1|))
                                     T)
                                   '((|position| ((|Integer|) |#2| |#1|)) T)
                                   '((|position|
                                      ((|Integer|) |#2| |#1| (|Integer|)))
                                     T)
                                   '((|merge| (|#1| |#1| |#1|)) T)
                                   '((|sorted?| ((|Boolean|) |#1|)) T)
                                   '((|copyInto!| (|#1| |#1| |#1| (|Integer|)))
                                     T)
                                   '((|reverse!| (|#1| |#1|)) T)
                                   '((|sort!|
                                      (|#1| (|Mapping| (|Boolean|) |#2| |#2|)
                                       |#1|))
                                     T)
                                   '((|sort!| (|#1| |#1|)) T)
                                   '((< ((|Boolean|) |#1| |#1|)) T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|map| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|copy| (|#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 66
                                            '(1 6 8 0 9 0 6 0 12 2 6 0 7 0 13 1
                                              6 15 0 16 1 6 0 0 17 1 6 7 0 18 3
                                              6 7 19 0 7 20 1 6 0 0 22 3 6 0 10
                                              0 0 23 2 6 0 0 0 25 2 6 15 0 0 28
                                              1 6 30 0 31 2 6 0 0 8 32 2 6 0 0
                                              0 34 1 38 30 0 39 1 38 15 0 40 1
                                              38 30 0 41 1 6 30 0 42 1 6 0 0 47
                                              2 6 0 0 8 48 2 7 15 0 0 51 4 0 7
                                              19 0 7 7 52 1 6 15 0 56 2 6 7 0 7
                                              58 3 0 30 7 0 30 60 2 6 0 7 0 61
                                              1 0 0 0 62 2 7 15 0 0 63 2 0 15 0
                                              0 64 2 7 15 0 0 65 2 0 15 0 0 66
                                              2 0 15 10 0 49 2 0 0 10 0 11 2 0
                                              15 0 0 66 2 0 0 26 0 27 1 0 0 0
                                              55 1 0 0 0 62 2 0 0 26 0 36 4 0 7
                                              19 0 7 7 52 2 0 7 19 0 21 3 0 7
                                              19 0 7 50 2 0 30 26 0 46 3 0 30 7
                                              0 30 60 2 0 0 8 7 53 3 0 0 10 0 0
                                              29 3 0 0 10 0 0 24 3 0 0 19 0 0
                                              54 1 0 0 7 14 3 0 0 0 0 30 35 3 0
                                              0 7 0 30 33 2 0 44 26 0 45 2 0 0
                                              0 30 37 2 0 0 0 38 43 3 0 0 0 0
                                              30 59 1 0 0 0 57 2 0 15 0 0
                                              64)))))
           '|lookupComplete|)) 
