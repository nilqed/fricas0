
(SDEFUN |LMDICT;coerce;$Of;1| ((|s| $) ($ |OutputForm|))
        (SPROG ((#1=#:G715 NIL) (|x| NIL) (#2=#:G714 NIL))
               (SEQ
                (SPADCALL (SPADCALL "dictionary" (QREFELT $ 10))
                          (PROGN
                           (LETT #2# NIL . #3=(|LMDICT;coerce;$Of;1|))
                           (SEQ (LETT |x| NIL . #3#)
                                (LETT #1# (SPADCALL |s| (QREFELT $ 12)) . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |x| (QREFELT $ 13))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 15))))) 

(SDEFUN |LMDICT;#;$Nni;2| ((|s| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |s| (QREFELT $ 12)))) 

(SDEFUN |LMDICT;copy;2$;3| ((|s| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 19))
                  (QREFELT $ 20))) 

(SDEFUN |LMDICT;empty?;$B;4| ((|s| $) ($ |Boolean|))
        (NULL (SPADCALL |s| (QREFELT $ 12)))) 

(SDEFUN |LMDICT;dictionary;$;5| (($ $)) (SPADCALL NIL (QREFELT $ 20))) 

(SDEFUN |LMDICT;empty;$;6| (($ $)) (SPADCALL NIL (QREFELT $ 25))) 

(SDEFUN |LMDICT;dictionary;L$;7| ((|ls| |List| S) ($ $))
        (SPROG ((#1=#:G733 NIL) (|x| NIL) (|lmd| ($)))
               (SEQ
                (COND ((NULL |ls|) (SPADCALL (QREFELT $ 26)))
                      ('T
                       (SEQ
                        (LETT |lmd| (SPADCALL (QREFELT $ 26))
                              . #2=(|LMDICT;dictionary;L$;7|))
                        (SEQ (LETT |x| NIL . #2#) (LETT #1# |ls| . #2#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |x| |lmd| (QREFELT $ 27))))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |lmd|))))))) 

(SDEFUN |LMDICT;convert;$If;8| ((|lmd| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|dictionary| (QREFELT $ 30))
               (SPADCALL (SPADCALL |lmd| (QREFELT $ 12)) (QREFELT $ 31)))
         (QREFELT $ 32))) 

(SDEFUN |LMDICT;map;M2$;9| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 35))
                  (QREFELT $ 20))) 

(SDEFUN |LMDICT;map!;M2$;10| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 37))
                  (QREFELT $ 20))) 

(SDEFUN |LMDICT;parts;$L;11| ((|s| $) ($ |List| S))
        (SPADCALL |s| (QREFELT $ 39))) 

(SDEFUN |LMDICT;sub| ((|x| S) (|y| S) (|z| S) ($ S))
        (COND ((SPADCALL |z| |x| (QREFELT $ 40)) |y|) ('T |z|))) 

(SDEFUN |LMDICT;insert!;S$Nni$;13|
        ((|x| S) (|s| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G749 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #2=(|LMDICT;insert!;S$Nni$;13|))
                     (LETT #1# |n| . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (SPADCALL |x| |s| (QREFELT $ 27))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |LMDICT;substitute;2S2$;14| ((|x| S) (|y| S) (|s| $) ($ $))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|LMDICT;substitute;2S2$;14!0| (VECTOR $ |y| |x|))
                 (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 35))
                (QREFELT $ 20)))) 

(SDEFUN |LMDICT;substitute;2S2$;14!0| ((|z1| NIL) ($$ NIL))
        (PROG (|x| |y| $)
          (LETT |x| (QREFELT $$ 2) . #1=(|LMDICT;substitute;2S2$;14|))
          (LETT |y| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|LMDICT;sub| |x| |y| |z1| $))))) 

(SDEFUN |LMDICT;removeDuplicates!;2$;15| ((|s| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 43))
                  (QREFELT $ 20))) 

(SDEFUN |LMDICT;inspect;$S;16| ((|s| $) ($ S))
        (COND ((SPADCALL |s| (QREFELT $ 23)) (|error| "empty dictionary"))
              ('T (|SPADfirst| (SPADCALL |s| (QREFELT $ 12)))))) 

(SDEFUN |LMDICT;extract!;$S;17| ((|s| $) ($ S))
        (SPROG ((|x| (S)) (|p| (|List| S)))
               (SEQ
                (COND
                 ((SPADCALL |s| (QREFELT $ 23)) (|error| "empty dictionary"))
                 ('T
                  (SEQ
                   (LETT |x|
                         (|SPADfirst|
                          (LETT |p| (SPADCALL |s| (QREFELT $ 12))
                                . #1=(|LMDICT;extract!;$S;17|)))
                         . #1#)
                   (SPADCALL |s| (CDR |p|) (QREFELT $ 46)) (EXIT |x|))))))) 

(SDEFUN |LMDICT;duplicates?;$B;18| ((|s| $) ($ |Boolean|))
        (SPROG ((|q| (|List| S)) (|p| (|List| S)) (#1=#:G765 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (LETT |p| (SPADCALL |s| (QREFELT $ 12))
                          . #2=(|LMDICT;duplicates?;$B;18|)))
                   NIL)
                  ('T
                   (SEQ (LETT |q| (CDR |p|) . #2#)
                        (SEQ G190 (COND ((NULL (NULL (NULL |q|))) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (|SPADfirst| |p|) (|SPADfirst| |q|)
                                           (QREFELT $ 40))
                                 (PROGN (LETT #1# 'T . #2#) (GO #3=#:G764)))
                                ('T
                                 (SEQ (LETT |p| |q| . #2#)
                                      (EXIT (LETT |q| (CDR |q|) . #2#)))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT NIL)))))
                #3# (EXIT #1#)))) 

(SDEFUN |LMDICT;remove!;M2$;19| ((|p| |Mapping| (|Boolean|) S) (|lmd| $) ($ $))
        (SPROG ((#1=#:G770 NIL) (|x| NIL))
               (SEQ
                (SEQ (LETT |x| NIL . #2=(|LMDICT;remove!;M2$;19|))
                     (LETT #1#
                           (SPADCALL (SPADCALL |lmd| (QREFELT $ 12))
                                     (QREFELT $ 49))
                           . #2#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |p|)
                         (SPADCALL |x| |lmd| (QREFELT $ 50))))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |lmd|)))) 

(SDEFUN |LMDICT;select!;M2$;20| ((|p| |Mapping| (|Boolean|) S) (|lmd| $) ($ $))
        (SPADCALL (CONS #'|LMDICT;select!;M2$;20!0| |p|) |lmd| (QREFELT $ 52))) 

(SDEFUN |LMDICT;select!;M2$;20!0| ((|z1| NIL) (|p| NIL))
        (NULL (SPADCALL |z1| |p|))) 

(SDEFUN |LMDICT;duplicates;$L;21|
        ((|lmd| $)
         ($ |List|
          (|Record| (|:| |entry| S) (|:| |count| (|NonNegativeInteger|)))))
        (SPROG
         ((|ld|
           (|List|
            (|Record| (|:| |entry| S) (|:| |count| (|NonNegativeInteger|)))))
          (|n| (|NonNegativeInteger|)) (#1=#:G784 NIL) (|x| NIL))
         (SEQ (LETT |ld| NIL . #2=(|LMDICT;duplicates;$L;21|))
              (SEQ (LETT |x| NIL . #2#)
                   (LETT #1#
                         (SPADCALL (SPADCALL |lmd| (QREFELT $ 12))
                                   (QREFELT $ 49))
                         . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |n| (SPADCALL |x| |lmd| (QREFELT $ 54)) . #2#) 1
                        (QREFELT $ 55))
                       (LETT |ld| (CONS (CONS |x| |n|) |ld|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ld|)))) 

(SDEFUN |LMDICT;=;2$B;22| ((|s| $) (|t| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 12)) (SPADCALL |t| (QREFELT $ 12))
                  (QREFELT $ 59))) 

(SDEFUN |LMDICT;remove!;S2$;23| ((|x| S) (|s| $) ($ $))
        (SPROG ((|q| (|List| S)) (|p| (|List| S)))
               (SEQ
                (LETT |p| (SPADCALL |s| (QREFELT $ 39))
                      . #1=(|LMDICT;remove!;S2$;23|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |p|) NIL)
                              ('T
                               (SPADCALL |x| (|SPADfirst| |p|)
                                         (QREFELT $ 40)))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |p| (CDR |p|) . #1#))) NIL (GO G190) G191
                     (EXIT NIL))
                (SPADCALL |s| |p| (QREFELT $ 46))
                (EXIT
                 (COND ((NULL |p|) |s|)
                       ('T
                        (SEQ (LETT |q| (CDR |p|) . #1#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND ((NULL |q|) NIL)
                                           ('T
                                            (SPADCALL |x| (|SPADfirst| |q|)
                                                      (QREFELT $ 61)))))
                                    (GO G191)))
                                  (SEQ (LETT |p| |q| . #1#)
                                       (EXIT (LETT |q| (CDR |q|) . #1#)))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND ((NULL |q|) NIL)
                                           ('T
                                            (SPADCALL |x| (|SPADfirst| |q|)
                                                      (QREFELT $ 40)))))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT |q| (CDR |q|) . #1#))) NIL
                                  (GO G190) G191 (EXIT NIL))
                             (SPADCALL |p| '|rest| |q| (QREFELT $ 63))
                             (EXIT |s|)))))))) 

(SDEFUN |LMDICT;insert!;S2$;24| ((|x| S) (|s| $) ($ $))
        (SPROG ((|q| (|List| S)) (|p| (|List| S)))
               (SEQ
                (LETT |p| (SPADCALL |s| (QREFELT $ 39))
                      . #1=(|LMDICT;insert!;S2$;24|))
                (COND
                 ((OR (NULL |p|)
                      (SPADCALL |x| (|SPADfirst| |p|) (QREFELT $ 64)))
                  (EXIT
                   (SEQ (SPADCALL |s| (CONS |x| |p|) (QREFELT $ 46))
                        (EXIT |s|)))))
                (LETT |q| (CDR |p|) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |q|) NIL)
                              ('T
                               (SPADCALL |x| (|SPADfirst| |q|)
                                         (QREFELT $ 61)))))
                       (GO G191)))
                     (SEQ (LETT |p| |q| . #1#)
                          (EXIT (LETT |q| (CDR |q|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (SPADCALL |p| '|rest| (CONS |x| |q|) (QREFELT $ 63))
                (EXIT |s|)))) 

(SDEFUN |LMDICT;remove!;S2$;25| ((|x| S) (|s| $) ($ $))
        (SEQ
         (SPADCALL |s|
                   (SPADCALL |x| (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 65))
                   (QREFELT $ 46))
         (EXIT |s|))) 

(SDEFUN |LMDICT;=;2$B;26| ((|s| $) (|t| $) ($ |Boolean|))
        (SPROG ((#1=#:G812 NIL) (|x| (S)) (|a| ($)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |a| (SPADCALL |s| (QREFELT $ 21))
                        . #2=(|LMDICT;=;2$B;26|))
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |a| (QREFELT $ 23))))
                         (GO G191)))
                       (SEQ (LETT |x| (SPADCALL |a| (QREFELT $ 45)) . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |x| |s| (QREFELT $ 54))
                                         (SPADCALL |x| |t| (QREFELT $ 54))
                                         (QREFELT $ 66))
                               (PROGN (LETT #1# NIL . #2#) (GO #3=#:G811)))
                              ('T (SPADCALL |x| |a| (QREFELT $ 50))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |LMDICT;insert!;S2$;27| ((|x| S) (|s| $) ($ $))
        (SPROG ((|p| (|List| S)) (#1=#:G819 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |p| (SPADCALL |s| (QREFELT $ 39))
                        . #2=(|LMDICT;insert!;S2$;27|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |p|))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| (|SPADfirst| |p|) (QREFELT $ 40))
                           (SEQ
                            (SPADCALL |p| '|rest| (CONS |x| (CDR |p|))
                                      (QREFELT $ 63))
                            (EXIT
                             (PROGN (LETT #1# |s| . #2#) (GO #3=#:G818)))))
                          ('T (LETT |p| (CDR |p|) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (SPADCALL |s| (CONS |x| (SPADCALL |s| (QREFELT $ 39)))
                            (QREFELT $ 46))
                  (EXIT |s|)))
                #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |ListMultiDictionary;|)) 

(DEFUN |ListMultiDictionary| (#1=#:G829)
  (SPROG NIL
         (PROG (#2=#:G830)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ListMultiDictionary|)
                                               '|domainEqualList|)
                    . #3=(|ListMultiDictionary|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ListMultiDictionary;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ListMultiDictionary|)))))))))) 

(DEFUN |ListMultiDictionary;| (|#1|)
  (SPROG
   ((#1=#:G828 NIL) (#2=#:G827 NIL) (|pv$| NIL) (#3=#:G824 NIL) (#4=#:G825 NIL)
    (#5=#:G826 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|ListMultiDictionary|))
    (LETT |dv$| (LIST '|ListMultiDictionary| DV$1) . #6#)
    (LETT $ (GETREFV 73) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #6#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #5#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #6#)
                                        (OR #4# #5#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #6#)
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #5#))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|ListMultiDictionary| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 128))
    (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)) . #6#)
         (|augmentPredVector| $ 256))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #6#)
     (|augmentPredVector| $ 512))
    (AND (OR #1# #5#) (|augmentPredVector| $ 1024))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Reference| (|List| |#1|)))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 33 (CONS (|dispatchFunction| |LMDICT;convert;$If;8|) $))))
    (COND
     ((|HasCategory| |#1| '(|OrderedSet|))
      (PROGN
       (QSETREFV $ 60 (CONS (|dispatchFunction| |LMDICT;=;2$B;22|) $))
       (QSETREFV $ 50 (CONS (|dispatchFunction| |LMDICT;remove!;S2$;23|) $))
       (QSETREFV $ 27 (CONS (|dispatchFunction| |LMDICT;insert!;S2$;24|) $))))
     ('T
      (PROGN
       (QSETREFV $ 50 (CONS (|dispatchFunction| |LMDICT;remove!;S2$;25|) $))
       (QSETREFV $ 60 (CONS (|dispatchFunction| |LMDICT;=;2$B;26|) $))
       (QSETREFV $ 27 (CONS (|dispatchFunction| |LMDICT;insert!;S2$;27|) $)))))
    $))) 

(MAKEPROP '|ListMultiDictionary| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|String|)
              (|OutputForm|) (0 . |message|) (|List| 6) |LMDICT;parts;$L;11|
              (5 . |coerce|) (|List| $) (10 . |prefix|) |LMDICT;coerce;$Of;1|
              (|NonNegativeInteger|) |LMDICT;#;$Nni;2| (16 . |copy|)
              |LMDICT;dictionary;L$;7| |LMDICT;copy;2$;3| (|Boolean|)
              |LMDICT;empty?;$B;4| |LMDICT;dictionary;$;5| (21 . |ref|)
              |LMDICT;empty;$;6| (26 . |insert!|) (|Symbol|) (|InputForm|)
              (32 . |convert|) (37 . |convert|) (42 . |convert|)
              (47 . |convert|) (|Mapping| 6 6) (52 . |map|) |LMDICT;map;M2$;9|
              (58 . |map!|) |LMDICT;map!;M2$;10| (64 . |deref|) (69 . =)
              |LMDICT;insert!;S$Nni$;13| |LMDICT;substitute;2S2$;14|
              (75 . |removeDuplicates!|) |LMDICT;removeDuplicates!;2$;15|
              |LMDICT;inspect;$S;16| (80 . |setref|) |LMDICT;extract!;$S;17|
              |LMDICT;duplicates?;$B;18| (86 . |removeDuplicates|)
              (91 . |remove!|) (|Mapping| 22 6) |LMDICT;remove!;M2$;19|
              |LMDICT;select!;M2$;20| (97 . |count|) (103 . >)
              (|Record| (|:| |entry| 6) (|:| |count| 17)) (|List| 56)
              |LMDICT;duplicates;$L;21| (109 . =) (115 . =) (121 . >) '"rest"
              (127 . |setelt!|) (134 . <) (140 . |remove!|) (146 . ~=)
              (|Mapping| 6 6 6) (|Equation| 6) (|List| 68) (|HashState|)
              (|SingleInteger|) (|Union| 6 '"failed"))
           '#(~= 152 |substitute| 158 |size?| 165 |select!| 171 |select| 177
              |sample| 183 |removeDuplicates!| 187 |removeDuplicates| 192
              |remove!| 197 |remove| 209 |reduce| 221 |parts| 242 |more?| 247
              |members| 253 |member?| 258 |map!| 264 |map| 270 |less?| 276
              |latex| 282 |inspect| 287 |insert!| 292 |hashUpdate!| 305 |hash|
              311 |find| 316 |extract!| 322 |every?| 327 |eval| 333 |eq?| 359
              |empty?| 365 |empty| 370 |duplicates?| 374 |duplicates| 379
              |dictionary| 384 |count| 393 |copy| 405 |convert| 410 |construct|
              415 |coerce| 420 |any?| 425 = 431 |#| 437)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 0 0 0 2 1 0 0 0 2 5 7 3))
                 (CONS
                  '#(NIL |DictionaryOperations&| |BagAggregate&| |Collection&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL NIL)
                  (CONS
                   '#((|MultiDictionary| 6) (|DictionaryOperations| 6)
                      (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 9) (|ConvertibleTo| 29))
                   (|makeByteWordVec2| 72
                                       '(1 9 0 8 10 1 6 9 0 13 2 9 0 0 14 15 1
                                         11 0 0 19 1 7 0 11 25 2 0 0 6 0 27 1
                                         29 0 28 30 1 11 29 0 31 1 29 0 14 32 1
                                         0 29 0 33 2 11 0 34 0 35 2 11 0 34 0
                                         37 1 7 11 0 39 2 6 22 0 0 40 1 11 0 0
                                         43 2 7 11 0 11 46 1 11 0 0 49 2 0 0 6
                                         0 50 2 0 17 6 0 54 2 17 22 0 0 55 2 11
                                         22 0 0 59 2 0 22 0 0 60 2 6 22 0 0 61
                                         3 11 0 0 62 0 63 2 6 22 0 0 64 2 11 0
                                         6 0 65 2 17 22 0 0 66 2 11 22 0 0 1 3
                                         0 0 6 6 0 42 2 0 22 0 17 1 2 9 0 51 0
                                         53 2 9 0 51 0 1 0 0 0 1 1 0 0 0 44 1
                                         10 0 0 1 2 10 0 6 0 50 2 9 0 51 0 52 2
                                         10 0 6 0 1 2 9 0 51 0 1 4 10 6 67 0 6
                                         6 1 2 9 6 67 0 1 3 9 6 67 0 6 1 1 9 11
                                         0 12 2 0 22 0 17 1 1 9 11 0 1 2 10 22
                                         6 0 1 2 8 0 34 0 38 2 0 0 34 0 36 2 0
                                         22 0 17 1 1 1 8 0 1 1 0 6 0 45 3 0 0 6
                                         0 17 41 2 0 0 6 0 27 2 1 70 70 0 1 1 1
                                         71 0 1 2 0 72 51 0 1 1 0 6 0 47 2 9 22
                                         51 0 1 3 2 0 0 6 6 1 3 2 0 0 11 11 1 2
                                         2 0 0 68 1 2 2 0 0 69 1 2 0 22 0 0 1 1
                                         0 22 0 23 0 0 0 26 1 0 22 0 48 1 0 57
                                         0 58 1 0 0 11 20 0 0 0 24 2 10 17 6 0
                                         54 2 9 17 51 0 1 1 0 0 0 21 1 3 29 0
                                         33 1 0 0 11 1 1 6 9 0 16 2 9 22 51 0 1
                                         2 11 22 0 0 60 1 9 17 0 18)))))
           '|lookupComplete|)) 
