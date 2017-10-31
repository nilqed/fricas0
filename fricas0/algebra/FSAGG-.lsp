
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

(SDEFUN |FSAGG-;brace;LA;4| ((|l| |List| S) ($ A))
        (SPADCALL |l| (QREFELT $ 20))) 

(SDEFUN |FSAGG-;set;LA;5| ((|l| |List| S) ($ A)) (SPADCALL |l| (QREFELT $ 20))) 

(SDEFUN |FSAGG-;cardinality;ANni;6| ((|s| A) ($ |NonNegativeInteger|))
        (SPADCALL |s| (QREFELT $ 13))) 

(SDEFUN |FSAGG-;construct;LA;7| ((|l| |List| S) ($ A))
        (SPROG ((#1=#:G725 NIL) (|x| NIL) (|s| (A)))
               (SEQ
                (LETT |s| (SPADCALL (QREFELT $ 24))
                      . #2=(|FSAGG-;construct;LA;7|))
                (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |x| |s| (QREFELT $ 25))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |FSAGG-;count;SANni;8| ((|x| S) (|s| A) ($ |NonNegativeInteger|))
        (COND ((SPADCALL |x| |s| (QREFELT $ 27)) 1) ('T 0))) 

(SDEFUN |FSAGG-;subset?;2AB;9| ((|s| A) (|t| A) ($ |Boolean|))
        (SPROG NIL
               (COND
                ((SPADCALL (SPADCALL |s| (QREFELT $ 13))
                           (SPADCALL |t| (QREFELT $ 13)) (QREFELT $ 29))
                 (SPADCALL (CONS #'|FSAGG-;subset?;2AB;9!0| (VECTOR $ |t|))
                           (SPADCALL |s| (QREFELT $ 30)) (QREFELT $ 32)))
                ('T NIL)))) 

(SDEFUN |FSAGG-;subset?;2AB;9!0| ((|x| NIL) ($$ NIL))
        (PROG (|t| $)
          (LETT |t| (QREFELT $$ 1) . #1=(|FSAGG-;subset?;2AB;9|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |t| (QREFELT $ 27)))))) 

(SDEFUN |FSAGG-;coerce;AOf;10| ((|s| A) ($ |OutputForm|))
        (SPROG ((#1=#:G739 NIL) (|x| NIL) (#2=#:G738 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|FSAGG-;coerce;AOf;10|))
                  (SEQ (LETT |x| NIL . #3#)
                       (LETT #1# (SPADCALL |s| (QREFELT $ 30)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 35)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 37))))) 

(SDEFUN |FSAGG-;intersect;3A;11| ((|s| A) (|t| A) ($ A))
        (SPROG ((#1=#:G743 NIL) (|x| NIL) (|i| (A)))
               (SEQ
                (LETT |i| (SPADCALL (QREFELT $ 24))
                      . #2=(|FSAGG-;intersect;3A;11|))
                (SEQ (LETT |x| NIL . #2#)
                     (LETT #1# (SPADCALL |s| (QREFELT $ 30)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |t| (QREFELT $ 27))
                         (SPADCALL |x| |i| (QREFELT $ 25))))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |i|)))) 

(SDEFUN |FSAGG-;difference;3A;12| ((|s| A) (|t| A) ($ A))
        (SPROG ((#1=#:G747 NIL) (|x| NIL) (|m| (A)))
               (SEQ
                (LETT |m| (SPADCALL |s| (QREFELT $ 40))
                      . #2=(|FSAGG-;difference;3A;12|))
                (SEQ (LETT |x| NIL . #2#)
                     (LETT #1# (SPADCALL |t| (QREFELT $ 30)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |x| |m| (QREFELT $ 41))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FSAGG-;symmetricDifference;3A;13| ((|s| A) (|t| A) ($ A))
        (SPROG ((#1=#:G752 NIL) (|x| NIL) (|d| (A)))
               (SEQ
                (LETT |d| (SPADCALL |s| (QREFELT $ 40))
                      . #2=(|FSAGG-;symmetricDifference;3A;13|))
                (SEQ (LETT |x| NIL . #2#)
                     (LETT #1# (SPADCALL |t| (QREFELT $ 30)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |s| (QREFELT $ 27))
                         (SPADCALL |x| |d| (QREFELT $ 41)))
                        ('T (SPADCALL |x| |d| (QREFELT $ 25))))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |d|)))) 

(SDEFUN |FSAGG-;union;3A;14| ((|s| A) (|t| A) ($ A))
        (SPROG ((#1=#:G756 NIL) (|x| NIL) (|u| (A)))
               (SEQ
                (LETT |u| (SPADCALL |s| (QREFELT $ 40))
                      . #2=(|FSAGG-;union;3A;14|))
                (SEQ (LETT |x| NIL . #2#)
                     (LETT #1# (SPADCALL |t| (QREFELT $ 30)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |x| |u| (QREFELT $ 25))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |u|)))) 

(SDEFUN |FSAGG-;universe;A;15| (($ A))
        (SPROG ((#1=#:G759 NIL) (#2=#:G763 NIL) (|i| NIL) (#3=#:G762 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|FSAGG-;universe;A;15|))
                  (SEQ (LETT |i| 1 . #4#)
                       (LETT #2# (SPADCALL (QREFELT $ 45)) . #4#) G190
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
                                 (QREFELT $ 47))
                                #3#)
                               . #4#)))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 48))))) 

(SDEFUN |FSAGG-;complement;2A;16| ((|s| A) ($ A))
        (SPADCALL (SPADCALL (QREFELT $ 50)) |s| (QREFELT $ 16))) 

(SDEFUN |FSAGG-;size;Nni;17| (($ |NonNegativeInteger|))
        (EXPT 2 (SPADCALL (QREFELT $ 45)))) 

(SDEFUN |FSAGG-;index;PiA;18| ((|i| |PositiveInteger|) ($ A))
        (SPROG ((#1=#:G767 NIL) (#2=#:G771 NIL) (|j| NIL) (#3=#:G770 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|FSAGG-;index;PiA;18|))
                  (SEQ (LETT |j| 1 . #4#)
                       (LETT #2# (SPADCALL (QREFELT $ 45)) . #4#) G190
                       (COND ((|greater_SI| |j| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (- |i| 1) (- |j| 1) (QREFELT $ 54))
                           (LETT #3#
                                 (CONS
                                  (SPADCALL
                                   (PROG1 (LETT #1# |j| . #4#)
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                   (QREFELT $ 47))
                                  #3#)
                                 . #4#)))))
                       (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 48))))) 

(SDEFUN |FSAGG-;lookup;APi;19| ((|s| A) ($ |PositiveInteger|))
        (SPROG
         ((|n| (|PositiveInteger|)) (#1=#:G773 NIL) (#2=#:G777 NIL) (|x| NIL))
         (SEQ (LETT |n| 1 . #3=(|FSAGG-;lookup;APi;19|))
              (SEQ (LETT |x| NIL . #3#)
                   (LETT #2# (SPADCALL |s| (QREFELT $ 30)) . #3#) G190
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
                                              (- (SPADCALL |x| (QREFELT $ 56))
                                                 1)
                                              . #3#)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |n|)))) 

(SDEFUN |FSAGG-;max;AS;20| ((|s| A) ($ S))
        (SPROG ((|l| (|List| S)))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |s| (QREFELT $ 30)) |FSAGG-;max;AS;20|))
                 (|error| "Empty set"))
                ('T (SPADCALL (ELT $ 58) |l| (QREFELT $ 60)))))) 

(SDEFUN |FSAGG-;min;AS;21| ((|s| A) ($ S))
        (SPROG ((|l| (|List| S)))
               (COND
                ((NULL
                  (LETT |l| (SPADCALL |s| (QREFELT $ 30)) |FSAGG-;min;AS;21|))
                 (|error| "Empty set"))
                ('T (SPADCALL (ELT $ 62) |l| (QREFELT $ 60)))))) 

(SDEFUN |FSAGG-;smaller?;2AB;22| ((|s1| A) (|s2| A) ($ |Boolean|))
        (SPROG ((|ls2| #1=(|List| S)) (|ls1| #1#))
               (SEQ
                (LETT |ls1|
                      (SPADCALL (ELT $ 64) (SPADCALL |s1| (QREFELT $ 30))
                                (QREFELT $ 66))
                      . #2=(|FSAGG-;smaller?;2AB;22|))
                (LETT |ls2|
                      (SPADCALL (ELT $ 64) (SPADCALL |s2| (QREFELT $ 30))
                                (QREFELT $ 66))
                      . #2#)
                (EXIT (SPADCALL |ls1| |ls2| (QREFELT $ 67)))))) 

(DECLAIM (NOTINLINE |FiniteSetAggregate&;|)) 

(DEFUN |FiniteSetAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteSetAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteSetAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 69) . #1#)
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
             (QSETREFV $ 49
                       (CONS (|dispatchFunction| |FSAGG-;universe;A;15|) $))
             (QSETREFV $ 51
                       (CONS (|dispatchFunction| |FSAGG-;complement;2A;16|) $))
             (QSETREFV $ 52 (CONS (|dispatchFunction| |FSAGG-;size;Nni;17|) $))
             (QSETREFV $ 55
                       (CONS (|dispatchFunction| |FSAGG-;index;PiA;18|) $))
             (QSETREFV $ 57
                       (CONS (|dispatchFunction| |FSAGG-;lookup;APi;19|) $)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 61 (CONS (|dispatchFunction| |FSAGG-;max;AS;20|) $))
             (QSETREFV $ 63
                       (CONS (|dispatchFunction| |FSAGG-;min;AS;21|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 68
                      (CONS (|dispatchFunction| |FSAGG-;smaller?;2AB;22|) $))))
          $))) 

(MAKEPROP '|FiniteSetAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |intersect|) (|Boolean|) (6 . =) |FSAGG-;<=;2AB;1|
              (|NonNegativeInteger|) (12 . |#|) (17 . <=) |FSAGG-;<;2AB;2|
              (23 . |difference|) (29 . |empty?|) |FSAGG-;=;2AB;3| (|List| 7)
              (34 . |construct|) |FSAGG-;brace;LA;4| |FSAGG-;set;LA;5|
              |FSAGG-;cardinality;ANni;6| (39 . |set|) (43 . |insert!|)
              |FSAGG-;construct;LA;7| (49 . |member?|) |FSAGG-;count;SANni;8|
              (55 . <=) (61 . |parts|) (|Mapping| 9 7) (66 . |every?|)
              |FSAGG-;subset?;2AB;9| (|OutputForm|) (72 . |coerce|) (|List| $)
              (77 . |brace|) |FSAGG-;coerce;AOf;10| |FSAGG-;intersect;3A;11|
              (82 . |copy|) (87 . |remove!|) |FSAGG-;difference;3A;12|
              |FSAGG-;symmetricDifference;3A;13| |FSAGG-;union;3A;14|
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
              287 |brace| 292 = 297 <= 303 < 309)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 68
                                                 '(2 6 0 0 0 8 2 6 9 0 0 10 1 6
                                                   12 0 13 2 6 9 0 0 14 2 6 0 0
                                                   0 16 1 6 9 0 17 1 6 0 19 20
                                                   0 6 0 24 2 6 0 7 0 25 2 6 9
                                                   7 0 27 2 12 9 0 0 29 1 6 19
                                                   0 30 2 19 9 31 0 32 1 7 34 0
                                                   35 1 34 0 36 37 1 6 0 0 40 2
                                                   6 0 7 0 41 0 7 12 45 1 7 0
                                                   46 47 1 6 0 19 48 0 0 0 49 0
                                                   6 0 50 1 0 0 0 51 0 0 12 52
                                                   2 53 9 0 0 54 1 0 0 46 55 1
                                                   7 46 0 56 1 0 46 0 57 2 7 0
                                                   0 0 58 2 19 7 59 0 60 1 0 7
                                                   0 61 2 7 0 0 0 62 1 0 7 0 63
                                                   2 7 9 0 0 64 2 19 0 65 0 66
                                                   2 19 9 0 0 67 2 0 9 0 0 68 0
                                                   0 0 49 2 0 0 0 0 44 2 0 0 0
                                                   0 43 2 0 9 0 0 33 2 0 9 0 0
                                                   68 0 0 12 52 1 0 0 19 22 1 0
                                                   7 0 63 1 0 7 0 61 1 0 46 0
                                                   57 2 0 0 0 0 39 1 0 0 46 55
                                                   2 0 0 0 0 42 2 0 12 7 0 28 1
                                                   0 0 19 26 1 0 0 0 51 1 0 34
                                                   0 38 1 0 12 0 23 1 0 0 19 21
                                                   2 0 9 0 0 18 2 0 9 0 0 11 2
                                                   0 9 0 0 15)))))
           '|lookupComplete|)) 
