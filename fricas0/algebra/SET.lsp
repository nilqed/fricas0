
(SDEFUN |SET;#;$Nni;1| ((|s| $) ($ |NonNegativeInteger|))
        (SPADCALL |s| (QREFELT $ 9))) 

(SDEFUN |SET;set;$;2| (($ $)) (SPADCALL (QREFELT $ 11))) 

(SDEFUN |SET;empty;$;3| (($ $)) (SPADCALL (QREFELT $ 13))) 

(SDEFUN |SET;copy;2$;4| ((|s| $) ($ $)) (SPADCALL |s| (QREFELT $ 14))) 

(SDEFUN |SET;parts;$L;5| ((|s| $) ($ |List| S)) (SPADCALL |s| (QREFELT $ 17))) 

(SDEFUN |SET;inspect;$S;6| ((|s| $) ($ S))
        (COND ((SPADCALL |s| (QREFELT $ 20)) (|error| "Empty set"))
              ('T (SPADCALL |s| (SPADCALL |s| (QREFELT $ 22)) (QREFELT $ 23))))) 

(SDEFUN |SET;extract!;$S;7| ((|s| $) ($ S))
        (SPROG ((|x| (S)))
               (SEQ
                (LETT |x| (SPADCALL |s| (QREFELT $ 24)) |SET;extract!;$S;7|)
                (SPADCALL |s| (SPADCALL |s| (QREFELT $ 22)) (QREFELT $ 25))
                (EXIT |x|)))) 

(SDEFUN |SET;find;M$U;8|
        ((|f| |Mapping| (|Boolean|) S) (|s| $) ($ |Union| S "failed"))
        (SPADCALL |f| |s| (QREFELT $ 29))) 

(SDEFUN |SET;map;M2$;9| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL |f| (SPADCALL |s| (QREFELT $ 15)) (QREFELT $ 32))) 

(SDEFUN |SET;reduce;M$S;10| ((|f| |Mapping| S S S) (|s| $) ($ S))
        (SPADCALL |f| |s| (QREFELT $ 35))) 

(SDEFUN |SET;reduce;M$2S;11| ((|f| |Mapping| S S S) (|s| $) (|x| S) ($ S))
        (SPADCALL |f| |s| |x| (QREFELT $ 37))) 

(SDEFUN |SET;reduce;M$3S;12|
        ((|f| |Mapping| S S S) (|s| $) (|x| S) (|y| S) ($ S))
        (SPADCALL |f| |s| |x| |y| (QREFELT $ 39))) 

(SDEFUN |SET;convert;$If;13| ((|x| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|set| (QREFELT $ 43))
               (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 44)))
         (QREFELT $ 46))) 

(SDEFUN |SET;=;2$B;14| ((|s| $) (|t| $) ($ |Boolean|))
        (SPADCALL |s| |t| (QREFELT $ 48))) 

(SDEFUN |SET;max;$S;15| ((|s| $) ($ S)) (SPADCALL |s| (QREFELT $ 24))) 

(SDEFUN |SET;min;$S;16| ((|s| $) ($ S))
        (COND ((SPADCALL |s| (QREFELT $ 20)) (|error| "Empty set"))
              ('T (SPADCALL |s| (SPADCALL |s| (QREFELT $ 51)) (QREFELT $ 23))))) 

(SDEFUN |SET;map!;M2$;17| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SEQ (SPADCALL |f| |s| (QREFELT $ 53)) (SPADCALL |s| (QREFELT $ 54))
             (EXIT (SPADCALL |s| (QREFELT $ 55))))) 

(SDEFUN |SET;construct;L$;18| ((|l| |List| S) ($ $))
        (SPROG
         ((|i| NIL) (#1=#:G763 NIL) (|x| NIL) (|a| ($))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((ZEROP (LETT |n| (LENGTH |l|) . #2=(|SET;construct;L$;18|)))
            (SPADCALL (QREFELT $ 11)))
           ('T
            (SEQ
             (LETT |a| (SPADCALL |n| (|SPADfirst| |l|) (QREFELT $ 56)) . #2#)
             (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#)
                  (LETT |i| (SPADCALL |a| (QREFELT $ 51)) . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (SPADCALL |a| |i| |x| (QREFELT $ 57))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#) . #2#)) . #2#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL (SPADCALL |a| (QREFELT $ 54)) (QREFELT $ 55))))))))) 

(SDEFUN |SET;insert!;S2$;19| ((|x| S) (|s| $) ($ $))
        (SPROG ((|k| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (+ (SPADCALL |s| (QREFELT $ 22)) 1)
                      . #1=(|SET;insert!;S2$;19|))
                (LETT |k| (SPADCALL |s| (QREFELT $ 51)) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((< |k| |n|)
                          (SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 23))
                                    (QREFELT $ 59)))
                         ('T NIL)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |k| (+ |k| 1) . #1#))) NIL (GO G190) G191
                     (EXIT NIL))
                (COND
                 ((< |k| |n|)
                  (COND
                   ((SPADCALL (SPADCALL |s| |k| (QREFELT $ 23)) |x|
                              (QREFELT $ 60))
                    (EXIT |s|)))))
                (EXIT (SPADCALL |x| |s| |k| (QREFELT $ 61)))))) 

(SDEFUN |SET;member?;S$B;20| ((|x| S) (|s| $) ($ |Boolean|))
        (SPROG ((|t| (|Integer|)) (|b| (|Integer|)) (|m| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |s| (QREFELT $ 20)) NIL)
                      ('T
                       (SEQ
                        (LETT |t| (SPADCALL |s| (QREFELT $ 22))
                              . #1=(|SET;member?;S$B;20|))
                        (LETT |b| (SPADCALL |s| (QREFELT $ 51)) . #1#)
                        (SEQ G190 (COND ((NULL (< |b| |t|)) (GO G191)))
                             (SEQ (LETT |m| (QUOTIENT2 (+ |b| |t|) 2) . #1#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |x|
                                               (SPADCALL |s| |m|
                                                         (QREFELT $ 23))
                                               (QREFELT $ 59))
                                     (LETT |b| (+ |m| 1) . #1#))
                                    ('T (LETT |t| |m| . #1#)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |x| (SPADCALL |s| |t| (QREFELT $ 23))
                                   (QREFELT $ 60))))))))) 

(SDEFUN |SET;remove!;S2$;21| ((|x| S) (|s| $) ($ $))
        (SPROG ((|k| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (+ (SPADCALL |s| (QREFELT $ 22)) 1)
                      . #1=(|SET;remove!;S2$;21|))
                (LETT |k| (SPADCALL |s| (QREFELT $ 51)) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((< |k| |n|)
                          (SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 23))
                                    (QREFELT $ 59)))
                         ('T NIL)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |k| (+ |k| 1) . #1#))) NIL (GO G190) G191
                     (EXIT NIL))
                (COND
                 ((< |k| |n|)
                  (COND
                   ((SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 23))
                              (QREFELT $ 60))
                    (EXIT (SPADCALL |s| |k| (QREFELT $ 25)))))))
                (EXIT |s|)))) 

(SDEFUN |SET;intersect;3$;22| ((|s| $) (|t| $) ($ $))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| #1#) (|r| ($)) (|n| #2=(|Integer|))
          (|m| #2#))
         (SEQ
          (LETT |m| (SPADCALL |s| (QREFELT $ 22)) . #3=(|SET;intersect;3$;22|))
          (LETT |n| (SPADCALL |t| (QREFELT $ 22)) . #3#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 51)) . #3#)
          (LETT |j| (SPADCALL |t| (QREFELT $ 51)) . #3#)
          (LETT |r| (SPADCALL (QREFELT $ 11)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 65))
                    (SPADCALL |j| |n| (QREFELT $ 65)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                             (SPADCALL |t| |j| (QREFELT $ 23)) (QREFELT $ 60))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 23))
                              (QREFELT $ 66))
                    (LETT |i| (+ |i| 1) . #3#)
                    (EXIT (LETT |j| (+ |j| 1) . #3#))))
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                             (SPADCALL |t| |j| (QREFELT $ 23)) (QREFELT $ 67))
                   (LETT |i| (+ |i| 1) . #3#))
                  ('T (LETT |j| (+ |j| 1) . #3#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |SET;difference;3$;23| ((|s| $) (|t| $) ($ $))
        (SPROG
         ((|i| #1=(|Integer|)) (|j| #1#) (|r| ($)) (|n| #2=(|Integer|))
          (|m| #2#))
         (SEQ
          (LETT |m| (SPADCALL |s| (QREFELT $ 22))
                . #3=(|SET;difference;3$;23|))
          (LETT |n| (SPADCALL |t| (QREFELT $ 22)) . #3#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 51)) . #3#)
          (LETT |j| (SPADCALL |t| (QREFELT $ 51)) . #3#)
          (LETT |r| (SPADCALL (QREFELT $ 11)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 65))
                    (SPADCALL |j| |n| (QREFELT $ 65)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                             (SPADCALL |t| |j| (QREFELT $ 23)) (QREFELT $ 60))
                   (SEQ (LETT |i| (+ |i| 1) . #3#)
                        (EXIT (LETT |j| (+ |j| 1) . #3#))))
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                             (SPADCALL |t| |j| (QREFELT $ 23)) (QREFELT $ 67))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 23))
                              (QREFELT $ 66))
                    (EXIT (LETT |i| (+ |i| 1) . #3#))))
                  ('T (LETT |j| (+ |j| 1) . #3#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190 (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 65))) (GO G191)))
               (SEQ
                (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 23)) (QREFELT $ 66))
                (EXIT (LETT |i| (+ |i| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |SET;symmetricDifference;3$;24| ((|s| $) (|t| $) ($ $))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| #1#) (|r| ($)) (|n| #2=(|Integer|))
          (|m| #2#))
         (SEQ
          (LETT |m| (SPADCALL |s| (QREFELT $ 22))
                . #3=(|SET;symmetricDifference;3$;24|))
          (LETT |n| (SPADCALL |t| (QREFELT $ 22)) . #3#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 51)) . #3#)
          (LETT |j| (SPADCALL |t| (QREFELT $ 51)) . #3#)
          (LETT |r| (SPADCALL (QREFELT $ 11)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 65))
                    (SPADCALL |j| |n| (QREFELT $ 65)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                             (SPADCALL |t| |j| (QREFELT $ 23)) (QREFELT $ 67))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 23))
                              (QREFELT $ 66))
                    (EXIT (LETT |i| (+ |i| 1) . #3#))))
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                             (SPADCALL |t| |j| (QREFELT $ 23)) (QREFELT $ 59))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 23))
                              (QREFELT $ 66))
                    (EXIT (LETT |j| (+ |j| 1) . #3#))))
                  ('T
                   (SEQ (LETT |i| (+ |i| 1) . #3#)
                        (EXIT (LETT |j| (+ |j| 1) . #3#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190 (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 65))) (GO G191)))
               (SEQ
                (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 23)) (QREFELT $ 66))
                (EXIT (LETT |i| (+ |i| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190 (COND ((NULL (SPADCALL |j| |n| (QREFELT $ 65))) (GO G191)))
               (SEQ
                (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 23)) (QREFELT $ 66))
                (EXIT (LETT |j| (+ |j| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |SET;subset?;2$B;25| ((|s| $) (|t| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G811 NIL) (|j| #2=(|Integer|)) (|i| #2#) (|n| #3=(|Integer|))
          (|m| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m| (SPADCALL |s| (QREFELT $ 22))
                  . #4=(|SET;subset?;2$B;25|))
            (LETT |n| (SPADCALL |t| (QREFELT $ 22)) . #4#)
            (EXIT
             (COND ((SPADCALL |m| |n| (QREFELT $ 71)) NIL)
                   ('T
                    (SEQ (LETT |i| (SPADCALL |s| (QREFELT $ 51)) . #4#)
                         (LETT |j| (SPADCALL |t| (QREFELT $ 51)) . #4#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  ((SPADCALL |i| |m| (QREFELT $ 65))
                                   (SPADCALL |j| |n| (QREFELT $ 65)))
                                  ('T NIL)))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                                            (SPADCALL |t| |j| (QREFELT $ 23))
                                            (QREFELT $ 60))
                                  (SEQ (LETT |i| (+ |i| 1) . #4#)
                                       (EXIT (LETT |j| (+ |j| 1) . #4#))))
                                 ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                                            (SPADCALL |t| |j| (QREFELT $ 23))
                                            (QREFELT $ 59))
                                  (LETT |j| (+ |j| 1) . #4#))
                                 ('T
                                  (PROGN
                                   (LETT #1# NIL . #4#)
                                   (GO #5=#:G810))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (SPADCALL |i| |m| (QREFELT $ 71)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |SET;union;3$;26| ((|s| $) (|t| $) ($ $))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| #1#) (|r| ($)) (|n| #2=(|Integer|))
          (|m| #2#))
         (SEQ (LETT |m| (SPADCALL |s| (QREFELT $ 22)) . #3=(|SET;union;3$;26|))
              (LETT |n| (SPADCALL |t| (QREFELT $ 22)) . #3#)
              (LETT |i| (SPADCALL |s| (QREFELT $ 51)) . #3#)
              (LETT |j| (SPADCALL |t| (QREFELT $ 51)) . #3#)
              (LETT |r| (SPADCALL (QREFELT $ 11)) . #3#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |i| |m| (QREFELT $ 65))
                        (SPADCALL |j| |n| (QREFELT $ 65)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                                 (SPADCALL |t| |j| (QREFELT $ 23))
                                 (QREFELT $ 60))
                       (SEQ
                        (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 23))
                                  (QREFELT $ 66))
                        (LETT |i| (+ |i| 1) . #3#)
                        (EXIT (LETT |j| (+ |j| 1) . #3#))))
                      ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 23))
                                 (SPADCALL |t| |j| (QREFELT $ 23))
                                 (QREFELT $ 67))
                       (SEQ
                        (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 23))
                                  (QREFELT $ 66))
                        (EXIT (LETT |i| (+ |i| 1) . #3#))))
                      ('T
                       (SEQ
                        (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 23))
                                  (QREFELT $ 66))
                        (EXIT (LETT |j| (+ |j| 1) . #3#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (SEQ G190
                   (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 65))) (GO G191)))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 23))
                              (QREFELT $ 66))
                    (EXIT (LETT |i| (+ |i| 1) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (SEQ G190
                   (COND ((NULL (SPADCALL |j| |n| (QREFELT $ 65))) (GO G191)))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 23))
                              (QREFELT $ 66))
                    (EXIT (LETT |j| (+ |j| 1) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |SET;insert!;S2$;27| ((|x| S) (|s| $) ($ $))
        (SPROG ((#1=#:G828 NIL) (#2=#:G829 NIL) (#3=#:G830 NIL) (|k| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |k| (SPADCALL |s| (QREFELT $ 51))
                           . #4=(|SET;insert!;S2$;27|))
                     (LETT #3# (SPADCALL |s| (QREFELT $ 22)) . #4#) G190
                     (COND ((> |k| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |s| |k| (QREFELT $ 23)) |x|
                                   (QREFELT $ 60))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# |s| . #4#) (GO #5=#:G827))
                                . #4#)
                          (GO #6=#:G825))))))
                     (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT
                   (SPADCALL |x| |s| (+ (SPADCALL |s| (QREFELT $ 22)) 1)
                             (QREFELT $ 61)))))
                #5# (EXIT #2#)))) 

(SDEFUN |SET;remove!;S2$;28| ((|x| S) (|s| $) ($ $))
        (SPROG ((|k| (|Integer|)) (#1=#:G835 NIL) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |n| (+ (SPADCALL |s| (QREFELT $ 22)) 1)
                        . #2=(|SET;remove!;S2$;28|))
                  (LETT |k| (SPADCALL |s| (QREFELT $ 51)) . #2#)
                  (SEQ G190 (COND ((NULL (< |k| |n|)) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 23))
                                     (QREFELT $ 60))
                           (PROGN
                            (LETT #1# (SPADCALL |s| |k| (QREFELT $ 25)) . #2#)
                            (GO #3=#:G834)))
                          ('T (LETT |k| (+ |k| 1) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |s|)))
                #3# (EXIT #1#)))) 

(SDEFUN |SET;map!;M2$;29| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SEQ (SPADCALL |f| |s| (QREFELT $ 53))
             (EXIT (SPADCALL |s| (QREFELT $ 74))))) 

(DECLAIM (NOTINLINE |Set;|)) 

(DEFUN |Set| (#1=#:G842)
  (SPROG NIL
         (PROG (#2=#:G843)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Set|)
                                               '|domainEqualList|)
                    . #3=(|Set|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Set;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Set|)))))))))) 

(DEFUN |Set;| (|#1|)
  (SPROG ((#1=#:G841 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|Set|))
          (LETT |dv$| (LIST '|Set| DV$1) . #2#)
          (LETT $ (GETREFV 82) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#1|
                                                             '(|Comparable|))
                                              (|HasCategory| |#1| '(|Finite|))
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               (|HasCategory| |#1|
                                                              '(|SetCategory|)))
                                              (OR
                                               (AND
                                                (|HasCategory| |#1|
                                                               (LIST
                                                                '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                                (|HasCategory| |#1|
                                                               '(|Comparable|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               (LIST
                                                                '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                                (|HasCategory| |#1|
                                                               '(|Finite|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               (LIST
                                                                '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))))
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|Set| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|shallowlyMutable|))
               (|augmentPredVector| $ 128))
          (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #2#)
               (|augmentPredVector| $ 256))
          (AND (|HasCategory| |#1| '(|BasicType|)) #1#
               (|augmentPredVector| $ 512))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|FlexibleArray| |#1|))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 47
                      (CONS (|dispatchFunction| |SET;convert;$If;13|) $))))
          (COND
           ((|testBitVector| |pv$| 7)
            (PROGN
             (QSETREFV $ 49 (CONS (|dispatchFunction| |SET;=;2$B;14|) $))
             (QSETREFV $ 50 (CONS (|dispatchFunction| |SET;max;$S;15|) $))
             (QSETREFV $ 52 (CONS (|dispatchFunction| |SET;min;$S;16|) $))
             (QSETREFV $ 32 (CONS (|dispatchFunction| |SET;map!;M2$;17|) $))
             (QSETREFV $ 58
                       (CONS (|dispatchFunction| |SET;construct;L$;18|) $))
             (QSETREFV $ 62 (CONS (|dispatchFunction| |SET;insert!;S2$;19|) $))
             (QSETREFV $ 63 (CONS (|dispatchFunction| |SET;member?;S$B;20|) $))
             (QSETREFV $ 64 (CONS (|dispatchFunction| |SET;remove!;S2$;21|) $))
             (QSETREFV $ 68
                       (CONS (|dispatchFunction| |SET;intersect;3$;22|) $))
             (QSETREFV $ 69
                       (CONS (|dispatchFunction| |SET;difference;3$;23|) $))
             (QSETREFV $ 70
                       (CONS
                        (|dispatchFunction| |SET;symmetricDifference;3$;24|)
                        $))
             (QSETREFV $ 72 (CONS (|dispatchFunction| |SET;subset?;2$B;25|) $))
             (QSETREFV $ 73 (CONS (|dispatchFunction| |SET;union;3$;26|) $))))
           ('T
            (PROGN
             (QSETREFV $ 62 (CONS (|dispatchFunction| |SET;insert!;S2$;27|) $))
             (QSETREFV $ 64 (CONS (|dispatchFunction| |SET;remove!;S2$;28|) $))
             (QSETREFV $ 32 (CONS (|dispatchFunction| |SET;map!;M2$;29|) $)))))
          $))) 

(MAKEPROP '|Set| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |#|) |SET;#;$Nni;1| |SET;empty;$;3|
              |SET;set;$;2| (5 . |empty|) (9 . |copy|) |SET;copy;2$;4|
              (|List| 6) (14 . |parts|) |SET;parts;$L;5| (|Boolean|)
              (19 . |empty?|) (|Integer|) (24 . |maxIndex|) (29 . |elt|)
              |SET;inspect;$S;6| (35 . |delete!|) |SET;extract!;$S;7|
              (|Union| 6 '"failed") (|Mapping| 19 6) (41 . |find|)
              |SET;find;M$U;8| (|Mapping| 6 6) (47 . |map!|) |SET;map;M2$;9|
              (|Mapping| 6 6 6) (53 . |reduce|) |SET;reduce;M$S;10|
              (59 . |reduce|) |SET;reduce;M$2S;11| (66 . |reduce|)
              |SET;reduce;M$3S;12| (|Symbol|) (|InputForm|) (74 . |convert|)
              (79 . |convert|) (|List| $) (84 . |convert|) (89 . |convert|)
              (94 . =) (100 . =) (106 . |max|) (111 . |minIndex|) (116 . |min|)
              (121 . |map!|) (127 . |sort!|) (132 . |removeRepeats!|)
              (137 . |new|) (143 . |setelt!|) (150 . |construct|) (155 . >)
              (161 . =) (167 . |insert!|) (174 . |insert!|) (180 . |member?|)
              (186 . |remove!|) (192 . <=) (198 . |concat!|) (204 . <)
              (210 . |intersect|) (216 . |difference|)
              (222 . |symmetricDifference|) (228 . >) (234 . |subset?|)
              (240 . |union|) (246 . |removeDuplicates!|) (|List| 76)
              (|Equation| 6) (|PositiveInteger|) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|String|))
           '#(~= 251 |universe| 257 |union| 261 |symmetricDifference| 279
              |subset?| 285 |smaller?| 291 |size?| 297 |size| 303 |set| 307
              |select!| 316 |select| 322 |sample| 328 |removeDuplicates| 332
              |remove!| 337 |remove| 349 |reduce| 361 |random| 382 |parts| 386
              |more?| 391 |min| 397 |members| 402 |member?| 407 |max| 413
              |map!| 418 |map| 424 |lookup| 430 |less?| 435 |latex| 441
              |intersect| 446 |inspect| 452 |insert!| 457 |index| 463
              |hashUpdate!| 468 |hash| 474 |find| 479 |extract!| 485 |every?|
              490 |eval| 496 |eq?| 522 |enumerate| 528 |empty?| 532 |empty| 537
              |difference| 541 |dictionary| 553 |count| 562 |copy| 574
              |convert| 579 |construct| 584 |complement| 589 |coerce| 594
              |cardinality| 599 |any?| 604 >= 610 > 616 = 622 <= 628 < 634 |#|
              640)
           'NIL
           (CONS
            (|makeByteWordVec2| 5 '(0 0 0 0 0 0 3 0 2 0 0 5 0 0 0 0 0 0 5 1))
            (CONS
             '#(|FiniteSetAggregate&| |Dictionary&| |DictionaryOperations&|
                |BagAggregate&| |SetAggregate&| |Collection&| |Finite&|
                |HomogeneousAggregate&| NIL |Aggregate&| |SetCategory&|
                |Evalable&| NIL NIL |PartialOrder&| |BasicType&| NIL NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|FiniteSetAggregate| 6) (|Dictionary| 6)
                 (|DictionaryOperations| 6) (|BagAggregate| 6)
                 (|SetAggregate| 6) (|Collection| 6) (|Finite|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|SetCategory|) (|Evalable| 6) (|Type|) (|finiteAggregate|)
                 (|PartialOrder|) (|BasicType|) (|CoercibleTo| 78)
                 (|shallowlyMutable|) (|InnerEvalable| 6 6)
                 (|ConvertibleTo| 42))
              (|makeByteWordVec2| 81
                                  '(1 7 8 0 9 0 7 0 13 1 7 0 0 14 1 7 16 0 17 1
                                    0 19 0 20 1 7 21 0 22 2 7 6 0 21 23 2 7 0 0
                                    21 25 2 7 27 28 0 29 2 0 0 31 0 32 2 7 6 34
                                    0 35 3 7 6 34 0 6 37 4 7 6 34 0 6 6 39 1 42
                                    0 41 43 1 16 42 0 44 1 42 0 45 46 1 0 42 0
                                    47 2 7 19 0 0 48 2 0 19 0 0 49 1 0 6 0 50 1
                                    7 21 0 51 1 0 6 0 52 2 7 0 31 0 53 1 7 0 0
                                    54 1 7 0 0 55 2 7 0 8 6 56 3 7 6 0 21 6 57
                                    1 0 0 16 58 2 6 19 0 0 59 2 6 19 0 0 60 3 7
                                    0 6 0 21 61 2 0 0 6 0 62 2 0 19 6 0 63 2 0
                                    0 6 0 64 2 21 19 0 0 65 2 7 0 0 6 66 2 6 19
                                    0 0 67 2 0 0 0 0 68 2 0 0 0 0 69 2 0 0 0 0
                                    70 2 21 19 0 0 71 2 0 19 0 0 72 2 0 0 0 0
                                    73 1 7 0 0 74 2 0 19 0 0 1 0 3 0 1 2 0 0 0
                                    0 73 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 0 0 70 2
                                    0 19 0 0 72 2 2 19 0 0 1 2 0 19 0 8 1 0 3 8
                                    1 0 0 0 12 1 0 0 16 1 2 9 0 28 0 1 2 9 0 28
                                    0 1 0 0 0 1 1 10 0 0 1 2 10 0 6 0 64 2 9 0
                                    28 0 1 2 10 0 6 0 1 2 9 0 28 0 1 4 10 6 34
                                    0 6 6 40 3 9 6 34 0 6 38 2 9 6 34 0 36 0 3
                                    0 1 1 9 16 0 18 2 0 19 0 8 1 1 7 6 0 52 1 9
                                    16 0 1 2 10 19 6 0 63 1 7 6 0 50 2 8 0 31 0
                                    32 2 0 0 31 0 33 1 3 77 0 1 2 0 19 0 8 1 1
                                    0 81 0 1 2 0 0 0 0 68 1 0 6 0 24 2 0 0 6 0
                                    62 1 3 0 77 1 2 0 79 79 0 1 1 0 80 0 1 2 0
                                    27 28 0 30 1 0 6 0 26 2 9 19 28 0 1 3 4 0 0
                                    16 16 1 3 4 0 0 6 6 1 2 4 0 0 75 1 2 4 0 0
                                    76 1 2 0 19 0 0 1 0 3 45 1 1 0 19 0 20 0 0
                                    0 11 2 0 0 0 0 69 2 0 0 0 6 1 0 0 0 1 1 0 0
                                    16 1 2 10 8 6 0 1 2 9 8 28 0 1 1 0 0 0 15 1
                                    1 42 0 47 1 0 0 16 58 1 3 0 0 1 1 0 78 0 1
                                    1 0 8 0 1 2 9 19 28 0 1 2 0 19 0 0 1 2 0 19
                                    0 0 1 2 0 19 0 0 49 2 0 19 0 0 1 2 0 19 0 0
                                    1 1 9 8 0 10)))))
           '|lookupComplete|)) 
