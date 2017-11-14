
(PUT '|SEG;SEGMENT;2S$;1| '|SPADreplace| '(XLAM (|a| |b|) (VECTOR |a| |b| 1))) 

(SDEFUN |SEG;SEGMENT;2S$;1| ((|a| S) (|b| S) ($ $)) (VECTOR |a| |b| 1)) 

(PUT '|SEG;lo;$S;2| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 0))) 

(SDEFUN |SEG;lo;$S;2| ((|s| $) ($ S)) (QVELT |s| 0)) 

(PUT '|SEG;low;$S;3| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 0))) 

(SDEFUN |SEG;low;$S;3| ((|s| $) ($ S)) (QVELT |s| 0)) 

(PUT '|SEG;hi;$S;4| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 1))) 

(SDEFUN |SEG;hi;$S;4| ((|s| $) ($ S)) (QVELT |s| 1)) 

(PUT '|SEG;high;$S;5| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 1))) 

(SDEFUN |SEG;high;$S;5| ((|s| $) ($ S)) (QVELT |s| 1)) 

(PUT '|SEG;incr;$I;6| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 2))) 

(SDEFUN |SEG;incr;$I;6| ((|s| $) ($ |Integer|)) (QVELT |s| 2)) 

(PUT '|SEG;segment;2S$;7| '|SPADreplace| '(XLAM (|a| |b|) (VECTOR |a| |b| 1))) 

(SDEFUN |SEG;segment;2S$;7| ((|a| S) (|b| S) ($ $)) (VECTOR |a| |b| 1)) 

(SDEFUN |SEG;BY;$I$;8| ((|s| $) (|r| |Integer|) ($ $))
        (VECTOR (SPADCALL |s| (QREFELT $ 10)) (SPADCALL |s| (QREFELT $ 12))
                |r|)) 

(SDEFUN |SEG;=;2$B;9| ((|s1| $) (|s2| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QVELT |s1| 0) (QVELT |s2| 0) (QREFELT $ 18))
          (COND
           ((SPADCALL (QVELT |s1| 1) (QVELT |s2| 1) (QREFELT $ 18))
            (EQL (QVELT |s1| 2) (QVELT |s2| 2)))
           (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |SEG;coerce;$Of;10| ((|s| $) ($ |OutputForm|))
        (SPROG ((|seg| (|OutputForm|)))
               (SEQ
                (LETT |seg|
                      (SPADCALL (SPADCALL (QVELT |s| 0) (QREFELT $ 21))
                                (SPADCALL (QVELT |s| 1) (QREFELT $ 21))
                                (QREFELT $ 22))
                      |SEG;coerce;$Of;10|)
                (EXIT
                 (COND ((EQL (QVELT |s| 2) 1) |seg|)
                       ('T
                        (SPADCALL (SPADCALL " by " (QREFELT $ 24)) |seg|
                                  (SPADCALL (QVELT |s| 2) (QREFELT $ 25))
                                  (QREFELT $ 26)))))))) 

(PUT '|SEG;convert;S$;11| '|SPADreplace| '(XLAM (|a|) (VECTOR |a| |a| 1))) 

(SDEFUN |SEG;convert;S$;11| ((|a| S) ($ $)) (VECTOR |a| |a| 1)) 

(SDEFUN |SEG;convert;$If;12| ((|s| $) ($ |InputForm|))
        (SPROG ((|seg| (|InputForm|)))
               (SEQ
                (LETT |seg|
                      (SPADCALL 'SEGMENT
                                (LIST
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 10))
                                           (QREFELT $ 30))
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 12))
                                           (QREFELT $ 30)))
                                (QREFELT $ 34))
                      |SEG;convert;$If;12|)
                (EXIT
                 (COND ((EQL (SPADCALL |s| (QREFELT $ 14)) 1) |seg|)
                       ('T
                        (SPADCALL 'BY
                                  (LIST |seg|
                                        (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                                  (QREFELT $ 35)))
                                  (QREFELT $ 34)))))))) 

(SDEFUN |SEG;+;S2$;13| ((|i| S) (|s| $) ($ $))
        (VECTOR (SPADCALL |i| (SPADCALL |s| (QREFELT $ 10)) (QREFELT $ 37))
                (SPADCALL |i| (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 37))
                (SPADCALL |s| (QREFELT $ 14)))) 

(SDEFUN |SEG;+;$S$;14| ((|s| $) (|i| S) ($ $))
        (VECTOR (SPADCALL (SPADCALL |s| (QREFELT $ 10)) |i| (QREFELT $ 37))
                (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |i| (QREFELT $ 37))
                (SPADCALL |s| (QREFELT $ 14)))) 

(SDEFUN |SEG;-;$S$;15| ((|s| $) (|i| S) ($ $))
        (VECTOR (SPADCALL (SPADCALL |s| (QREFELT $ 10)) |i| (QREFELT $ 40))
                (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |i| (QREFELT $ 40))
                (SPADCALL |s| (QREFELT $ 14)))) 

(SDEFUN |SEG;expand;LL;16| ((|ls| |List| $) ($ |List| S))
        (SPROG
         ((|l| (S)) (|lr| (|List| S)) (|inc| (S)) (|h| (S)) (#1=#:G741 NIL)
          (|s| NIL))
         (SEQ (LETT |lr| NIL . #2=(|SEG;expand;LL;16|))
              (SEQ (LETT |s| NIL . #2#) (LETT #1# |ls| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |l| (SPADCALL |s| (QREFELT $ 10)) . #2#)
                        (LETT |h| (SPADCALL |s| (QREFELT $ 12)) . #2#)
                        (LETT |inc|
                              (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                        (QREFELT $ 42))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |inc| (QREFELT $ 43))
                           (|error|
                            "Cannot expand a segment with an increment of zero"))
                          ((SPADCALL |inc| (|spadConstant| $ 44)
                                     (QREFELT $ 45))
                           (SEQ G190
                                (COND
                                 ((NULL (SPADCALL |l| |h| (QREFELT $ 46)))
                                  (GO G191)))
                                (SEQ (LETT |lr| (CONS |l| |lr|) . #2#)
                                     (EXIT
                                      (LETT |l|
                                            (SPADCALL |l| |inc| (QREFELT $ 37))
                                            . #2#)))
                                NIL (GO G190) G191 (EXIT NIL)))
                          ('T
                           (SEQ G190
                                (COND
                                 ((NULL (SPADCALL |l| |h| (QREFELT $ 47)))
                                  (GO G191)))
                                (SEQ (LETT |lr| (CONS |l| |lr|) . #2#)
                                     (EXIT
                                      (LETT |l|
                                            (SPADCALL |l| |inc| (QREFELT $ 37))
                                            . #2#)))
                                NIL (GO G190) G191 (EXIT NIL))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |lr|))))) 

(SDEFUN |SEG;expand;$L;17| ((|s| $) ($ |List| S))
        (SPADCALL (LIST |s|) (QREFELT $ 50))) 

(SDEFUN |SEG;map;M$L;18| ((|f| |Mapping| S S) (|s| $) ($ |List| S))
        (SPROG ((|l| (S)) (|lr| (|List| S)) (|inc| (S)) (|h| (S)))
               (SEQ (LETT |lr| NIL . #1=(|SEG;map;M$L;18|))
                    (LETT |l| (SPADCALL |s| (QREFELT $ 10)) . #1#)
                    (LETT |h| (SPADCALL |s| (QREFELT $ 12)) . #1#)
                    (LETT |inc|
                          (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                    (QREFELT $ 42))
                          . #1#)
                    (COND
                     ((SPADCALL |inc| (|spadConstant| $ 44) (QREFELT $ 45))
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| |h| (QREFELT $ 46)))
                             (GO G191)))
                           (SEQ
                            (LETT |lr| (CONS (SPADCALL |l| |f|) |lr|) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |inc| (QREFELT $ 37))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL)))
                     ('T
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| |h| (QREFELT $ 47)))
                             (GO G191)))
                           (SEQ
                            (LETT |lr| (CONS (SPADCALL |l| |f|) |lr|) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |inc| (QREFELT $ 37))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))))
                    (EXIT (NREVERSE |lr|))))) 

(DECLAIM (NOTINLINE |Segment;|)) 

(DEFUN |Segment| (#1=#:G752)
  (SPROG NIL
         (PROG (#2=#:G753)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Segment|)
                                               '|domainEqualList|)
                    . #3=(|Segment|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Segment;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Segment|)))))))))) 

(DEFUN |Segment;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Segment|))
          (LETT |dv$| (LIST '|Segment| DV$1) . #1#)
          (LETT $ (GETREFV 56) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#1|
                                                             '(|OrderedRing|))
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|Segment| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |low| |#1|) (|:| |high| |#1|)
                              (|:| |incr| (|Integer|))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 19 (CONS (|dispatchFunction| |SEG;=;2$B;9|) $))
             (QSETREFV $ 27
                       (CONS (|dispatchFunction| |SEG;coerce;$Of;10|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 36
                       (CONS (|dispatchFunction| |SEG;convert;$If;12|) $)))))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 38 (CONS (|dispatchFunction| |SEG;+;S2$;13|) $))
             (QSETREFV $ 39 (CONS (|dispatchFunction| |SEG;+;$S$;14|) $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 41 (CONS (|dispatchFunction| |SEG;-;$S$;15|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 50 (CONS (|dispatchFunction| |SEG;expand;LL;16|) $))
             (QSETREFV $ 51 (CONS (|dispatchFunction| |SEG;expand;$L;17|) $))
             (QSETREFV $ 53 (CONS (|dispatchFunction| |SEG;map;M$L;18|) $)))))
          $))) 

(MAKEPROP '|Segment| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| |SEG;SEGMENT;2S$;1|
              |SEG;lo;$S;2| |SEG;low;$S;3| |SEG;hi;$S;4| |SEG;high;$S;5|
              (|Integer|) |SEG;incr;$I;6| |SEG;segment;2S$;7| |SEG;BY;$I$;8|
              (|Boolean|) (0 . =) (6 . =) (|OutputForm|) (12 . |coerce|)
              (17 . SEGMENT) (|String|) (23 . |message|) (28 . |coerce|)
              (33 . |infix|) (40 . |coerce|) |SEG;convert;S$;11| (|InputForm|)
              (45 . |convert|) (|Symbol|) (|List| 29)
              (|InputFormFunctions1| $$) (50 . |packageCall|) (56 . |convert|)
              (61 . |convert|) (66 . +) (72 . +) (78 . +) (84 . -) (90 . -)
              (96 . |coerce|) (101 . |zero?|) (106 . |Zero|) (110 . >)
              (116 . <=) (122 . >=) (|List| 6) (|List| $) (128 . |expand|)
              (133 . |expand|) (|Mapping| 6 6) (138 . |map|) (|HashState|)
              (|SingleInteger|))
           '#(~= 144 |segment| 150 |map| 156 |low| 162 |lo| 167 |latex| 172
              |incr| 177 |high| 182 |hi| 187 |hashUpdate!| 192 |hash| 198
              |expand| 203 |convert| 213 |coerce| 223 SEGMENT 228 BY 234 = 240
              - 246 + 252)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(2 0 3 0 1 3 3))
                 (CONS '#(NIL NIL |SetCategory&| NIL NIL |BasicType&| NIL)
                       (CONS
                        '#((|SegmentExpansionCategory| 6 (|List| 6))
                           (|SegmentCategory| 6) (|SetCategory|) (|Type|)
                           (|ConvertibleTo| 29) (|BasicType|)
                           (|CoercibleTo| 20))
                        (|makeByteWordVec2| 55
                                            '(2 6 17 0 0 18 2 0 17 0 0 19 1 6
                                              20 0 21 2 20 0 0 0 22 1 20 0 23
                                              24 1 13 20 0 25 3 20 0 0 0 0 26 1
                                              0 20 0 27 1 6 29 0 30 2 33 29 31
                                              32 34 1 29 0 13 35 1 0 29 0 36 2
                                              6 0 0 0 37 2 0 0 6 0 38 2 0 0 0 6
                                              39 2 6 0 0 0 40 2 0 0 0 6 41 1 6
                                              0 13 42 1 6 17 0 43 0 6 0 44 2 6
                                              17 0 0 45 2 6 17 0 0 46 2 6 17 0
                                              0 47 1 0 48 49 50 1 0 48 0 51 2 0
                                              48 52 0 53 2 3 17 0 0 1 2 0 0 6 6
                                              15 2 2 48 52 0 53 1 0 6 0 10 1 0
                                              6 0 9 1 3 23 0 1 1 0 13 0 14 1 0
                                              6 0 12 1 0 6 0 11 2 3 54 54 0 1 1
                                              3 55 0 1 1 2 48 0 51 1 2 48 49 50
                                              1 1 29 0 36 1 0 0 6 28 1 3 20 0
                                              27 2 0 0 6 6 8 2 0 0 0 13 16 2 3
                                              17 0 0 19 2 5 0 0 6 41 2 4 0 6 0
                                              38 2 4 0 0 6 39)))))
           '|lookupComplete|)) 
