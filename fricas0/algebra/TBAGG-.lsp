
(SDEFUN |TBAGG-;table;S;1| (($ S)) (SPADCALL (QREFELT $ 9))) 

(SDEFUN |TBAGG-;table;LS;2|
        ((|l| |List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))) ($ S))
        (SPADCALL |l| (QREFELT $ 13))) 

(SDEFUN |TBAGG-;insert!;R2S;3|
        ((|p| |Record| (|:| |key| |Key|) (|:| |entry| |Entry|)) (|t| S) ($ S))
        (SEQ (SPADCALL |t| (QCAR |p|) (QCDR |p|) (QREFELT $ 15)) (EXIT |t|))) 

(SDEFUN |TBAGG-;indices;SL;4| ((|t| S) ($ |List| |Key|))
        (SPADCALL |t| (QREFELT $ 18))) 

(SDEFUN |TBAGG-;coerce;SOf;5| ((|t| S) ($ |OutputForm|))
        (SPROG ((#1=#:G724 NIL) (|k| NIL) (#2=#:G723 NIL))
               (SEQ
                (SPADCALL "table"
                          (PROGN
                           (LETT #2# NIL . #3=(|TBAGG-;coerce;SOf;5|))
                           (SEQ (LETT |k| NIL . #3#)
                                (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 21))
                                          (SPADCALL
                                           (SPADCALL |t| |k| (QREFELT $ 22))
                                           (QREFELT $ 23))
                                          (QREFELT $ 24))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 26))))) 

(SDEFUN |TBAGG-;elt;SKeyEntry;6| ((|t| S) (|k| |Key|) ($ |Entry|))
        (SPROG ((|r| (|Union| |Entry| "failed")))
               (SEQ
                (LETT |r| (SPADCALL |k| |t| (QREFELT $ 29))
                      |TBAGG-;elt;SKeyEntry;6|)
                (EXIT
                 (COND ((QEQCAR |r| 0) (QCDR |r|))
                       ('T (|error| "key not in table"))))))) 

(SDEFUN |TBAGG-;elt;SKey2Entry;7|
        ((|t| S) (|k| |Key|) (|e| |Entry|) ($ |Entry|))
        (SPROG ((|r| (|Union| |Entry| "failed")))
               (SEQ
                (LETT |r| (SPADCALL |k| |t| (QREFELT $ 29))
                      |TBAGG-;elt;SKey2Entry;7|)
                (EXIT (COND ((QEQCAR |r| 0) (QCDR |r|)) ('T |e|)))))) 

(SDEFUN |TBAGG-;map!;M2S;8| ((|f| |Mapping| |Entry| |Entry|) (|t| S) ($ S))
        (SPROG ((#1=#:G739 NIL) (|k| NIL))
               (SEQ
                (SEQ (LETT |k| NIL . #2=(|TBAGG-;map!;M2S;8|))
                     (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |t| |k|
                                 (SPADCALL (SPADCALL |t| |k| (QREFELT $ 22))
                                           |f|)
                                 (QREFELT $ 15))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |t|)))) 

(SDEFUN |TBAGG-;map;M3S;9|
        ((|f| |Mapping| |Entry| |Entry| |Entry|) (|s| S) (|t| S) ($ S))
        (SPROG ((#1=#:G744 NIL) (|k| NIL) (|z| (S)))
               (SEQ
                (LETT |z| (SPADCALL (QREFELT $ 34)) . #2=(|TBAGG-;map;M3S;9|))
                (SEQ (LETT |k| NIL . #2#)
                     (LETT #1# (SPADCALL |s| (QREFELT $ 18)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |k| |t| (QREFELT $ 36))
                         (SPADCALL |z| |k|
                                   (SPADCALL (SPADCALL |s| |k| (QREFELT $ 22))
                                             (SPADCALL |t| |k| (QREFELT $ 22))
                                             |f|)
                                   (QREFELT $ 15))))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |TBAGG-;parts;SL;10|
        ((|t| S) ($ |List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
        (SPROG ((#1=#:G749 NIL) (|k| NIL) (#2=#:G748 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|TBAGG-;parts;SL;10|))
                 (SEQ (LETT |k| NIL . #3#)
                      (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS |k| (SPADCALL |t| |k| (QREFELT $ 22)))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |TBAGG-;parts;SL;11| ((|t| S) ($ |List| |Entry|))
        (SPROG ((#1=#:G753 NIL) (|k| NIL) (#2=#:G752 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|TBAGG-;parts;SL;11|))
                 (SEQ (LETT |k| NIL . #3#)
                      (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |t| |k| (QREFELT $ 22)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |TBAGG-;entries;SL;12| ((|t| S) ($ |List| |Entry|))
        (SPADCALL |t| (QREFELT $ 42))) 

(SDEFUN |TBAGG-;=;2SB;13| ((|s| S) (|t| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G765 NIL) (#2=#:G766 NIL) (|e| (|Union| |Entry| "failed"))
          (#3=#:G767 NIL) (|k| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |s| |t| (QREFELT $ 44)) 'T)
                 ((SPADCALL (SPADCALL |s| (QREFELT $ 46))
                            (SPADCALL |t| (QREFELT $ 46)) (QREFELT $ 48))
                  NIL)
                 ('T
                  (SEQ
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| NIL . #4=(|TBAGG-;=;2SB;13|))
                          (LETT #3# (SPADCALL |s| (QREFELT $ 18)) . #4#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |e| (SPADCALL |k| |t| (QREFELT $ 29)) . #4#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |e| 1)
                                  (SPADCALL (QCDR |e|)
                                            (SPADCALL |s| |k| (QREFELT $ 22))
                                            (QREFELT $ 49)))
                              (PROGN
                               (LETT #1#
                                     (PROGN
                                      (LETT #2# NIL . #4#)
                                      (GO #5=#:G764))
                                     . #4#)
                               (GO #6=#:G760))))))
                          (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                          (EXIT NIL)))
                    #6# (EXIT #1#))
                   (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |TBAGG-;map;M2S;14|
        ((|f| |Mapping| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))
          (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
         (|t| S) ($ S))
        (SPROG
         ((|ke| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
          (#1=#:G774 NIL) (|k| NIL) (|z| (S)))
         (SEQ (LETT |z| (SPADCALL (QREFELT $ 34)) . #2=(|TBAGG-;map;M2S;14|))
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ke|
                          (SPADCALL
                           (CONS |k| (SPADCALL |t| |k| (QREFELT $ 22))) |f|)
                          . #2#)
                    (EXIT
                     (SPADCALL |z| (QCAR |ke|) (QCDR |ke|) (QREFELT $ 15))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |TBAGG-;map!;M2S;15|
        ((|f| |Mapping| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))
          (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
         (|t| S) ($ S))
        (SPROG
         ((#1=#:G784 NIL) (|ke| NIL)
          (|lke| (|List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
          (#2=#:G777 NIL) (#3=#:G783 NIL) (|k| NIL))
         (SEQ (LETT |lke| NIL . #4=(|TBAGG-;map!;M2S;15|))
              (SEQ (LETT |k| NIL . #4#)
                   (LETT #3# (SPADCALL |t| (QREFELT $ 18)) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |lke|
                           (CONS
                            (SPADCALL
                             (CONS |k|
                                   (PROG2
                                       (LETT #2#
                                             (SPADCALL |k| |t| (QREFELT $ 53))
                                             . #4#)
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (QREFELT $ 8)
                                                     (|Union| (QREFELT $ 8)
                                                              "failed")
                                                     #2#)))
                             |f|)
                            |lke|)
                           . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |ke| NIL . #4#) (LETT #1# |lke| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ke| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |t| (QCAR |ke|) (QCDR |ke|) (QREFELT $ 15))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |t|)))) 

(SDEFUN |TBAGG-;inspect;SR;16|
        ((|t| S) ($ |Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
        (SPROG ((|ks| (|List| |Key|)))
               (SEQ
                (LETT |ks| (SPADCALL |t| (QREFELT $ 18))
                      |TBAGG-;inspect;SR;16|)
                (EXIT
                 (COND
                  ((NULL |ks|)
                   (|error| "Cannot extract from an empty aggregate"))
                  ('T
                   (CONS (|SPADfirst| |ks|)
                         (SPADCALL |t| (|SPADfirst| |ks|) (QREFELT $ 22))))))))) 

(SDEFUN |TBAGG-;find;MSU;17|
        ((|f| |Mapping| (|Boolean|)
          (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
         (|t| S)
         ($ |Union| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))
          "failed"))
        (SPROG ((#1=#:G804 NIL) (#2=#:G805 NIL) (|ke| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |ke| NIL . #3=(|TBAGG-;find;MSU;17|))
                       (LETT #2# (SPADCALL |t| (QREFELT $ 56)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |ke| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |ke| |f|)
                           (PROGN
                            (LETT #1# (CONS 0 |ke|) . #3#)
                            (GO #4=#:G803))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 1 "failed"))))
                #4# (EXIT #1#)))) 

(SDEFUN |TBAGG-;index?;KeySB;18| ((|k| |Key|) (|t| S) ($ |Boolean|))
        (QEQCAR (SPADCALL |k| |t| (QREFELT $ 29)) 0)) 

(SDEFUN |TBAGG-;remove!;R2S;19|
        ((|x| |Record| (|:| |key| |Key|) (|:| |entry| |Entry|)) (|t| S) ($ S))
        (SEQ
         (COND
          ((SPADCALL |x| |t| (QREFELT $ 61))
           (SPADCALL (QCAR |x|) |t| (QREFELT $ 53))))
         (EXIT |t|))) 

(SDEFUN |TBAGG-;extract!;SR;20|
        ((|t| S) ($ |Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
        (SPROG ((|k| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
               (SEQ
                (LETT |k| (SPADCALL |t| (QREFELT $ 63))
                      |TBAGG-;extract!;SR;20|)
                (SPADCALL (QCAR |k|) |t| (QREFELT $ 53)) (EXIT |k|)))) 

(SDEFUN |TBAGG-;any?;MSB;21|
        ((|f| |Mapping| (|Boolean|) |Entry|) (|t| S) ($ |Boolean|))
        (SPROG ((#1=#:G824 NIL) (#2=#:G825 NIL) (|k| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |k| NIL . #3=(|TBAGG-;any?;MSB;21|))
                       (LETT #2# (SPADCALL |t| (QREFELT $ 18)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |t| |k| (QREFELT $ 22)) |f|)
                           (PROGN (LETT #1# 'T . #3#) (GO #4=#:G823))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |TBAGG-;every?;MSB;22|
        ((|f| |Mapping| (|Boolean|) |Entry|) (|t| S) ($ |Boolean|))
        (SPROG ((#1=#:G830 NIL) (#2=#:G831 NIL) (|k| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |k| NIL . #3=(|TBAGG-;every?;MSB;22|))
                       (LETT #2# (SPADCALL |t| (QREFELT $ 18)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |t| |k| (QREFELT $ 22)) |f|))
                           (PROGN (LETT #1# NIL . #3#) (GO #4=#:G829))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |TBAGG-;count;MSNni;23|
        ((|f| |Mapping| (|Boolean|) |Entry|) (|t| S) ($ |NonNegativeInteger|))
        (SPROG ((|tally| (|NonNegativeInteger|)) (#1=#:G835 NIL) (|k| NIL))
               (SEQ (LETT |tally| 0 . #2=(|TBAGG-;count;MSNni;23|))
                    (SEQ (LETT |k| NIL . #2#)
                         (LETT #1# (SPADCALL |t| (QREFELT $ 18)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |t| |k| (QREFELT $ 22)) |f|)
                             (LETT |tally| (+ |tally| 1) . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |tally|)))) 

(DECLAIM (NOTINLINE |TableAggregate&;|)) 

(DEFUN |TableAggregate&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TableAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|TableAggregate&| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 69) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
            (COND
             ((|HasCategory| |#3| '(|CoercibleTo| (|OutputForm|)))
              (QSETREFV $ 27
                        (CONS (|dispatchFunction| |TBAGG-;coerce;SOf;5|)
                              $))))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (PROGN
             (QSETREFV $ 39 (CONS (|dispatchFunction| |TBAGG-;parts;SL;10|) $))
             (QSETREFV $ 41 (CONS (|dispatchFunction| |TBAGG-;parts;SL;11|) $))
             (QSETREFV $ 43
                       (CONS (|dispatchFunction| |TBAGG-;entries;SL;12|) $))
             (COND
              ((|HasCategory| |#3| '(|BasicType|))
               (QSETREFV $ 50
                         (CONS (|dispatchFunction| |TBAGG-;=;2SB;13|) $))))
             (QSETREFV $ 52 (CONS (|dispatchFunction| |TBAGG-;map;M2S;14|) $))
             (COND
              ((|HasCategory| |#3| '(|BasicType|))
               (QSETREFV $ 54
                         (CONS (|dispatchFunction| |TBAGG-;map!;M2S;15|) $))))
             (QSETREFV $ 55
                       (CONS (|dispatchFunction| |TBAGG-;inspect;SR;16|) $))
             (QSETREFV $ 59 (CONS (|dispatchFunction| |TBAGG-;find;MSU;17|) $))
             (QSETREFV $ 60
                       (CONS (|dispatchFunction| |TBAGG-;index?;KeySB;18|) $))
             (COND
              ((|HasCategory| |#3| '(|BasicType|))
               (QSETREFV $ 62
                         (CONS (|dispatchFunction| |TBAGG-;remove!;R2S;19|)
                               $))))
             (QSETREFV $ 64
                       (CONS (|dispatchFunction| |TBAGG-;extract!;SR;20|) $))
             (QSETREFV $ 66 (CONS (|dispatchFunction| |TBAGG-;any?;MSB;21|) $))
             (QSETREFV $ 67
                       (CONS (|dispatchFunction| |TBAGG-;every?;MSB;22|) $))
             (QSETREFV $ 68
                       (CONS (|dispatchFunction| |TBAGG-;count;MSNni;23|)
                             $)))))
          $))) 

(MAKEPROP '|TableAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |empty|) |TBAGG-;table;S;1|
              (|Record| (|:| |key| 7) (|:| |entry| 8)) (|List| 11)
              (4 . |dictionary|) |TBAGG-;table;LS;2| (9 . |setelt!|)
              |TBAGG-;insert!;R2S;3| (|List| 7) (16 . |keys|)
              |TBAGG-;indices;SL;4| (|OutputForm|) (21 . |coerce|) (26 . |elt|)
              (32 . |coerce|) (37 . =) (|List| $) (43 . |prefix|)
              (49 . |coerce|) (|Union| 8 '"failed") (54 . |search|)
              |TBAGG-;elt;SKeyEntry;6| |TBAGG-;elt;SKey2Entry;7|
              (|Mapping| 8 8) |TBAGG-;map!;M2S;8| (60 . |table|) (|Boolean|)
              (64 . |key?|) (|Mapping| 8 8 8) |TBAGG-;map;M3S;9| (70 . |parts|)
              (|List| 8) (75 . |parts|) (80 . |parts|) (85 . |entries|)
              (90 . |eq?|) (|NonNegativeInteger|) (96 . |#|) (|Integer|)
              (101 . ~=) (107 . ~=) (113 . =) (|Mapping| 11 11) (119 . |map|)
              (125 . |remove!|) (131 . |map!|) (137 . |inspect|)
              (142 . |parts|) (|Union| 11 '"failed") (|Mapping| 35 11)
              (147 . |find|) (153 . |index?|) (159 . |member?|)
              (165 . |remove!|) (171 . |inspect|) (176 . |extract!|)
              (|Mapping| 35 8) (181 . |any?|) (187 . |every?|) (193 . |count|))
           '#(|table| 199 |remove!| 208 |parts| 214 |map!| 224 |map| 236
              |inspect| 249 |insert!| 254 |indices| 260 |index?| 265 |find| 271
              |extract!| 277 |every?| 282 |entries| 288 |elt| 293 |count| 306
              |coerce| 312 |any?| 317 = 323)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 68
                                                 '(0 6 0 9 1 6 0 12 13 3 6 8 0
                                                   7 8 15 1 6 17 0 18 1 7 20 0
                                                   21 2 6 8 0 7 22 1 8 20 0 23
                                                   2 20 0 0 0 24 2 20 0 0 25 26
                                                   1 0 20 0 27 2 6 28 7 0 29 0
                                                   6 0 34 2 6 35 7 0 36 1 0 12
                                                   0 39 1 0 40 0 41 1 6 40 0 42
                                                   1 0 40 0 43 2 6 35 0 0 44 1
                                                   6 45 0 46 2 47 35 0 0 48 2 8
                                                   35 0 0 49 2 0 35 0 0 50 2 0
                                                   0 51 0 52 2 6 28 7 0 53 2 0
                                                   0 51 0 54 1 0 11 0 55 1 6 12
                                                   0 56 2 0 57 58 0 59 2 0 35 7
                                                   0 60 2 6 35 11 0 61 2 0 0 11
                                                   0 62 1 6 11 0 63 1 0 11 0 64
                                                   2 0 35 65 0 66 2 0 35 65 0
                                                   67 2 0 45 65 0 68 0 0 0 10 1
                                                   0 0 12 14 2 0 0 11 0 62 1 0
                                                   40 0 41 1 0 12 0 39 2 0 0 32
                                                   0 33 2 0 0 51 0 54 3 0 0 37
                                                   0 0 38 2 0 0 51 0 52 1 0 11
                                                   0 55 2 0 0 11 0 16 1 0 17 0
                                                   19 2 0 35 7 0 60 2 0 57 58 0
                                                   59 1 0 11 0 64 2 0 35 65 0
                                                   67 1 0 40 0 43 3 0 8 0 7 8
                                                   31 2 0 8 0 7 30 2 0 45 65 0
                                                   68 1 0 20 0 27 2 0 35 65 0
                                                   66 2 0 35 0 0 50)))))
           '|lookupComplete|)) 
