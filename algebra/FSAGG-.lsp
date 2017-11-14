
(SDEFUN |FSAGG-;<=;2AB;1| ((|s| A) (|t| A) ($ |Boolean|))
        (SPADCALL |s| (SPADCALL |s| |t| (QREFELT $ 8)) (QREFELT $ 10))) 

(SDEFUN |FSAGG-;<;2AB;2| ((|s| A) (|t| A) ($ |Boolean|))
        (COND
         ((< (SPADCALL |s| (QREFELT $ 13)) (SPADCALL |t| (QREFELT $ 13)))
          (SPADCALL |s| |t| (QREFELT $ 14)))
         ('T NIL))) 

(SDEFUN |FSAGG-;=;2AB;3| ((|s| A) (|t| A) ($ |Boolean|))
        (COND
         ((EQL (SPADCALL |s| (QREFELT $ 13)) (SPADCALL |t| (QREFELT $ 13)))
          (SPADCALL (SPADCALL |s| |t| (QREFELT $ 16)) (QREFELT $ 17)))
         ('T NIL))) 

(SDEFUN |FSAGG-;set;LA;4| ((|l| |List| S) ($ A)) (SPADCALL |l| (QREFELT $ 20))) 

(SDEFUN |FSAGG-;cardinality;ANni;5| ((|s| A) ($ |NonNegativeInteger|))
        (SPADCALL |s| (QREFELT $ 13))) 

(SDEFUN |FSAGG-;construct;LA;6| ((|l| |List| S) ($ A))
        (SPROG ((#1=#:G726 NIL) (|x| NIL) (|s| (A)))
               (SEQ
                (LETT |s| (SPADCALL (QREFELT $ 23))
                      . #2=(|FSAGG-;construct;LA;6|))
                (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |x| |s| (QREFELT $ 24))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |FSAGG-;count;SANni;7| ((|x| S) (|s| A) ($ |NonNegativeInteger|))
        (COND ((SPADCALL |x| |s| (QREFELT $ 26)) 1) ('T 0))) 

(SDEFUN |FSAGG-;subset?;2AB;8| ((|s| A) (|t| A) ($ |Boolean|))
        (SPROG NIL
               (COND
                ((SPADCALL (SPADCALL |s| (QREFELT $ 13))
                           (SPADCALL |t| (QREFELT $ 13)) (QREFELT $ 28))
                 (SPADCALL (CONS #'|FSAGG-;subset?;2AB;8!0| (VECTOR $ |t|))
                           (SPADCALL |s| (QREFELT $ 29)) (QREFELT $ 31)))
                ('T NIL)))) 

(SDEFUN |FSAGG-;subset?;2AB;8!0| ((|x| NIL) ($$ NIL))
        (PROG (|t| $)
          (LETT |t| (QREFELT $$ 1) . #1=(|FSAGG-;subset?;2AB;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |t| (QREFELT $ 26)))))) 

(SDEFUN |FSAGG-;coerce;AOf;9| ((|s| A) ($ |OutputForm|))
        (SPROG ((#1=#:G740 NIL) (|x| NIL) (#2=#:G739 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|FSAGG-;coerce;AOf;9|))
                  (SEQ (LETT |x| NIL . #3#)
                       (LETT #1# (SPADCALL |s| (QREFELT $ 29)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 34)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 36))))) 

(SDEFUN |FSAGG-;intersect;3A;10| ((|s| A) (|t| A) ($ A))
        (SPROG ((#1=#:G744 NIL) (|x| NIL) (|i| (A)))
               (SEQ
                (LETT |i| (SPADCALL (QREFELT $ 23))
                      . #2=(|FSAGG-;intersect;3A;10|))
                (SEQ (LETT |x| NIL . #2#)
                     (LETT #1# (SPADCALL |s| (QREFELT $ 29)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |t| (QREFELT $ 26))
                         (SPADCALL |x| |i| (QREFELT $ 24))))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |i|)))) 

(SDEFUN |FSAGG-;difference;3A;11| ((|s| A) (|t| A) ($ A))
        (SPROG ((#1=#:G748 NIL) (|x| NIL) (|m| (A)))
               (SEQ
                (LETT |m| (SPADCALL |s| (QREFELT $ 39))
                      . #2=(|FSAGG-;difference;3A;11|))
                (SEQ (LETT |x| NIL . #2#)
                     (LETT #1# (SPADCALL |t| (QREFELT $ 29)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |x| |m| (QREFELT $ 40))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FSAGG-;symmetricDifference;3A;12| ((|s| A) (|t| A) ($ A))
        (SPROG ((#1=#:G753 NIL) (|x| NIL) (|d| (A)))
               (SEQ
                (LETT |d| (SPADCALL |s| (QREFELT $ 39))
                      . #2=(|FSAGG-;symmetricDifference;3A;12|))
                (SEQ (LETT |x| NIL . #2#)
                     (LETT #1# (SPADCALL |t| (QREFELT $ 29)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |s| (QREFELT $ 26))
                         (SPADCALL |x| |d| (QREFELT $ 40)))
                        ('T (SPADCALL |x| |d| (QREFELT $ 24))))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |d|)))) 

(SDEFUN |FSAGG-;union;3A;13| ((|s| A) (|t| A) ($ A))
        (SPROG ((#1=#:G757 NIL) (|x| NIL) (|u| (A)))
               (SEQ
                (LETT |u| (SPADCALL |s| (QREFELT $ 39))
                      . #2=(|FSAGG-;union;3A;13|))
                (SEQ (LETT |x| NIL . #2#)
                     (LETT #1# (SPADCALL |t| (QREFELT $ 29)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |x| |u| (QREFELT $ 24))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |u|)))) 

(SDEFUN |FSAGG-;universe;A;14| (($ A))
        (SPROG ((#1=#:G762 NIL) (#2=#:G766 NIL) (|i| NIL) (#3=#:G765 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|FSAGG-;universe;A;14|))
                  (SEQ (LETT |i| 1 . #4#)
                       (LETT #2# (SPADCALL (QREFELT $ 44)) . #4#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS
                                (SPADCALL
                                 (PROG1 (LETT #1# |i| . #4#)
                                   (|check_subtype2| (> #1# 0)
                                                     '(|PositiveInteger|)
                                                     '(|NonNegativeInteger|)
                                                     #1#))
                                 (QREFELT $ 46))
                                #3#)
                               . #4#)))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 47))))) 

(SDEFUN |FSAGG-;complement;2A;15| ((|s| A) ($ A))
        (SPADCALL (SPADCALL (QREFELT $ 49)) |s| (QREFELT $ 16))) 

(SDEFUN |FSAGG-;size;Nni;16| (($ |NonNegativeInteger|))
        (EXPT 2 (SPADCALL (QREFELT $ 44)))) 

(SDEFUN |FSAGG-;index;PiA;17| ((|i| |PositiveInteger|) ($ A))
        (SPROG ((#1=#:G770 NIL) (#2=#:G774 NIL) (|j| NIL) (#3=#:G773 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|FSAGG-;index;PiA;17|))
                  (SEQ (LETT |j| 1 . #4#)
                       (LETT #2# (SPADCALL (QREFELT $ 44)) . #4#) G190
                       (COND ((|greater_SI| |j| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (- |i| 1) (- |j| 1) (QREFELT $ 53))
                           (LETT #3#
                                 (CONS
                                  (SPADCALL
                                   (PROG1 (LETT #1# |j| . #4#)
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                   (QREFELT $ 46))
                                  #3#)
                                 . #4#)))))
                       (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 47))))) 

(SDEFUN |FSAGG-;lookup;APi;18| ((|s| A) ($ |PositiveInteger|))
        (SPROG
         ((|n| (|PositiveInteger|)) (#1=#:G776 NIL) (#2=#:G780 NIL) (|x| NIL))
         (SEQ (LETT |n| 1 . #3=(|FSAGG-;lookup;APi;18|))
              (SEQ (LETT |x| NIL . #3#)
                   (LETT #2# (SPADCALL |s| (QREFELT $ 29)) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |n|
                           (+ |n|
                              (EXPT 2
                                    (PROG1
                                        (LETT #1#
                                              (- (SPADCALL |x| (QREFELT $ 55))
                                                 1)
                                              . #3#)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |n|)))) 

(SDEFUN |FSAGG-;max;AS;19| ((|s| A) ($ S))
        (SPROG ((|l| (|List| S)))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |s| (QREFELT $ 29)) |FSAGG-;max;AS;19|))
                 (|error| "Empty set"))
                ('T (SPADCALL (ELT $ 57) |l| (QREFELT $ 59)))))) 

(SDEFUN |FSAGG-;min;AS;20| ((|s| A) ($ S))
        (SPROG ((|l| (|List| S)))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |s| (QREFELT $ 29)) |FSAGG-;min;AS;20|))
                 (|error| "Empty set"))
                ('T (SPADCALL (ELT $ 61) |l| (QREFELT $ 59)))))) 

(SDEFUN |FSAGG-;smaller?;2AB;21| ((|s1| A) (|s2| A) ($ |Boolean|))
        (SPROG ((|ls2| #1=(|List| S)) (|ls1| #1#))
               (SEQ
                (LETT |ls1|
                      (SPADCALL (ELT $ 63) (SPADCALL |s1| (QREFELT $ 29))
                                (QREFELT $ 65))
                      . #2=(|FSAGG-;smaller?;2AB;21|))
                (LETT |ls2|
                      (SPADCALL (ELT $ 63) (SPADCALL |s2| (QREFELT $ 29))
                                (QREFELT $ 65))
                      . #2#)
                (EXIT (SPADCALL |ls1| |ls2| (QREFELT $ 66)))))) 

(DECLAIM (NOTINLINE |FiniteSetAggregate&;|)) 

(DEFUN |FiniteSetAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteSetAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteSetAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 68) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|Comparable|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#2|
                                                             '(|Finite|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 48
                       (CONS (|dispatchFunction| |FSAGG-;universe;A;14|) $))
             (QSETREFV $ 50
                       (CONS (|dispatchFunction| |FSAGG-;complement;2A;15|) $))
             (QSETREFV $ 51 (CONS (|dispatchFunction| |FSAGG-;size;Nni;16|) $))
             (QSETREFV $ 54
                       (CONS (|dispatchFunction| |FSAGG-;index;PiA;17|) $))
             (QSETREFV $ 56
                       (CONS (|dispatchFunction| |FSAGG-;lookup;APi;18|) $)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 60 (CONS (|dispatchFunction| |FSAGG-;max;AS;19|) $))
             (QSETREFV $ 62
                       (CONS (|dispatchFunction| |FSAGG-;min;AS;20|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 67
                      (CONS (|dispatchFunction| |FSAGG-;smaller?;2AB;21|) $))))
          $))) 

(MAKEPROP '|FiniteSetAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |intersect|) (|Boolean|) (6 . =) |FSAGG-;<=;2AB;1|
              (|NonNegativeInteger|) (12 . |#|) (17 . <=) |FSAGG-;<;2AB;2|
              (23 . |difference|) (29 . |empty?|) |FSAGG-;=;2AB;3| (|List| 7)
              (34 . |construct|) |FSAGG-;set;LA;4| |FSAGG-;cardinality;ANni;5|
              (39 . |set|) (43 . |insert!|) |FSAGG-;construct;LA;6|
              (49 . |member?|) |FSAGG-;count;SANni;7| (55 . <=) (61 . |parts|)
              (|Mapping| 9 7) (66 . |every?|) |FSAGG-;subset?;2AB;8|
              (|OutputForm|) (72 . |coerce|) (|List| $) (77 . |brace|)
              |FSAGG-;coerce;AOf;9| |FSAGG-;intersect;3A;10| (82 . |copy|)
              (87 . |remove!|) |FSAGG-;difference;3A;11|
              |FSAGG-;symmetricDifference;3A;12| |FSAGG-;union;3A;13|
              (93 . |size|) (|PositiveInteger|) (97 . |index|) (102 . |set|)
              (107 . |universe|) (111 . |universe|) (115 . |complement|)
              (120 . |size|) (|Integer|) (124 . |bit?|) (130 . |index|)
              (135 . |lookup|) (140 . |lookup|) (145 . |max|) (|Mapping| 7 7 7)
              (151 . |reduce|) (157 . |max|) (162 . |min|) (168 . |min|)
              (173 . |smaller?|) (|Mapping| 9 7 7) (179 . |sort|)
              (185 . |smaller?|) (191 . |smaller?|))
           '#(|universe| 197 |union| 201 |symmetricDifference| 207 |subset?|
              213 |smaller?| 219 |size| 225 |set| 229 |min| 234 |max| 239
              |lookup| 244 |intersect| 249 |index| 255 |difference| 260 |count|
              266 |construct| 272 |complement| 277 |coerce| 282 |cardinality|
              287 = 292 <= 298 < 304)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 67
                                                 '(2 6 0 0 0 8 2 6 9 0 0 10 1 6
                                                   12 0 13 2 6 9 0 0 14 2 6 0 0
                                                   0 16 1 6 9 0 17 1 6 0 19 20
                                                   0 6 0 23 2 6 0 7 0 24 2 6 9
                                                   7 0 26 2 12 9 0 0 28 1 6 19
                                                   0 29 2 19 9 30 0 31 1 7 33 0
                                                   34 1 33 0 35 36 1 6 0 0 39 2
                                                   6 0 7 0 40 0 7 12 44 1 7 0
                                                   45 46 1 6 0 19 47 0 0 0 48 0
                                                   6 0 49 1 0 0 0 50 0 0 12 51
                                                   2 52 9 0 0 53 1 0 0 45 54 1
                                                   7 45 0 55 1 0 45 0 56 2 7 0
                                                   0 0 57 2 19 7 58 0 59 1 0 7
                                                   0 60 2 7 0 0 0 61 1 0 7 0 62
                                                   2 7 9 0 0 63 2 19 0 64 0 65
                                                   2 19 9 0 0 66 2 0 9 0 0 67 0
                                                   0 0 48 2 0 0 0 0 43 2 0 0 0
                                                   0 42 2 0 9 0 0 32 2 0 9 0 0
                                                   67 0 0 12 51 1 0 0 19 21 1 0
                                                   7 0 62 1 0 7 0 60 1 0 45 0
                                                   56 2 0 0 0 0 38 1 0 0 45 54
                                                   2 0 0 0 0 41 2 0 12 7 0 27 1
                                                   0 0 19 25 1 0 0 0 50 1 0 33
                                                   0 37 1 0 12 0 22 2 0 9 0 0
                                                   18 2 0 9 0 0 11 2 0 9 0 0
                                                   15)))))
           '|lookupComplete|)) 
