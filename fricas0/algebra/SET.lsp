
(SDEFUN |SET;#;$Nni;1| ((|s| $) ($ |NonNegativeInteger|))
        (SPADCALL |s| (QREFELT $ 9))) 

(SDEFUN |SET;brace;$;2| (($ $)) (SPADCALL (QREFELT $ 11))) 

(SDEFUN |SET;set;$;3| (($ $)) (SPADCALL (QREFELT $ 11))) 

(SDEFUN |SET;empty;$;4| (($ $)) (SPADCALL (QREFELT $ 14))) 

(SDEFUN |SET;copy;2$;5| ((|s| $) ($ $)) (SPADCALL |s| (QREFELT $ 15))) 

(SDEFUN |SET;parts;$L;6| ((|s| $) ($ |List| S)) (SPADCALL |s| (QREFELT $ 18))) 

(SDEFUN |SET;inspect;$S;7| ((|s| $) ($ S))
        (COND ((SPADCALL |s| (QREFELT $ 21)) (|error| "Empty set"))
              ('T (SPADCALL |s| (SPADCALL |s| (QREFELT $ 23)) (QREFELT $ 24))))) 

(SDEFUN |SET;extract!;$S;8| ((|s| $) ($ S))
        (SPROG ((|x| (S)))
               (SEQ
                (LETT |x| (SPADCALL |s| (QREFELT $ 25)) |SET;extract!;$S;8|)
                (SPADCALL |s| (SPADCALL |s| (QREFELT $ 23)) (QREFELT $ 26))
                (EXIT |x|)))) 

(SDEFUN |SET;find;M$U;9|
        ((|f| |Mapping| (|Boolean|) S) (|s| $) ($ |Union| S "failed"))
        (SPADCALL |f| |s| (QREFELT $ 30))) 

(SDEFUN |SET;map;M2$;10| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL |f| (SPADCALL |s| (QREFELT $ 16)) (QREFELT $ 33))) 

(SDEFUN |SET;reduce;M$S;11| ((|f| |Mapping| S S S) (|s| $) ($ S))
        (SPADCALL |f| |s| (QREFELT $ 36))) 

(SDEFUN |SET;reduce;M$2S;12| ((|f| |Mapping| S S S) (|s| $) (|x| S) ($ S))
        (SPADCALL |f| |s| |x| (QREFELT $ 38))) 

(SDEFUN |SET;reduce;M$3S;13|
        ((|f| |Mapping| S S S) (|s| $) (|x| S) (|y| S) ($ S))
        (SPADCALL |f| |s| |x| |y| (QREFELT $ 40))) 

(SDEFUN |SET;convert;$If;14| ((|x| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|set| (QREFELT $ 44))
               (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 45)))
         (QREFELT $ 47))) 

(SDEFUN |SET;=;2$B;15| ((|s| $) (|t| $) ($ |Boolean|))
        (SPADCALL |s| |t| (QREFELT $ 49))) 

(SDEFUN |SET;max;$S;16| ((|s| $) ($ S)) (SPADCALL |s| (QREFELT $ 25))) 

(SDEFUN |SET;min;$S;17| ((|s| $) ($ S))
        (COND ((SPADCALL |s| (QREFELT $ 21)) (|error| "Empty set"))
              ('T (SPADCALL |s| (SPADCALL |s| (QREFELT $ 52)) (QREFELT $ 24))))) 

(SDEFUN |SET;map!;M2$;18| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SEQ (SPADCALL |f| |s| (QREFELT $ 54)) (SPADCALL |s| (QREFELT $ 55))
             (EXIT (SPADCALL |s| (QREFELT $ 56))))) 

(SDEFUN |SET;construct;L$;19| ((|l| |List| S) ($ $))
        (SPROG
         ((|i| NIL) (#1=#:G760 NIL) (|x| NIL) (|a| ($))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((ZEROP (LETT |n| (LENGTH |l|) . #2=(|SET;construct;L$;19|)))
            (SPADCALL (QREFELT $ 11)))
           ('T
            (SEQ
             (LETT |a| (SPADCALL |n| (|SPADfirst| |l|) (QREFELT $ 57)) . #2#)
             (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#)
                  (LETT |i| (SPADCALL |a| (QREFELT $ 52)) . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (SPADCALL |a| |i| |x| (QREFELT $ 58))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#) . #2#)) . #2#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL (SPADCALL |a| (QREFELT $ 55)) (QREFELT $ 56))))))))) 

(SDEFUN |SET;insert!;S2$;20| ((|x| S) (|s| $) ($ $))
        (SPROG ((|k| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (+ (SPADCALL |s| (QREFELT $ 23)) 1)
                      . #1=(|SET;insert!;S2$;20|))
                (LETT |k| (SPADCALL |s| (QREFELT $ 52)) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((< |k| |n|)
                          (SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 24))
                                    (QREFELT $ 60)))
                         ('T NIL)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |k| (+ |k| 1) . #1#))) NIL (GO G190) G191
                     (EXIT NIL))
                (COND
                 ((< |k| |n|)
                  (COND
                   ((SPADCALL (SPADCALL |s| |k| (QREFELT $ 24)) |x|
                              (QREFELT $ 61))
                    (EXIT |s|)))))
                (EXIT (SPADCALL |x| |s| |k| (QREFELT $ 62)))))) 

(SDEFUN |SET;member?;S$B;21| ((|x| S) (|s| $) ($ |Boolean|))
        (SPROG ((|t| (|Integer|)) (|b| (|Integer|)) (|m| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |s| (QREFELT $ 21)) NIL)
                      ('T
                       (SEQ
                        (LETT |t| (SPADCALL |s| (QREFELT $ 23))
                              . #1=(|SET;member?;S$B;21|))
                        (LETT |b| (SPADCALL |s| (QREFELT $ 52)) . #1#)
                        (SEQ G190 (COND ((NULL (< |b| |t|)) (GO G191)))
                             (SEQ (LETT |m| (QUOTIENT2 (+ |b| |t|) 2) . #1#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |x|
                                               (SPADCALL |s| |m|
                                                         (QREFELT $ 24))
                                               (QREFELT $ 60))
                                     (LETT |b| (+ |m| 1) . #1#))
                                    ('T (LETT |t| |m| . #1#)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |x| (SPADCALL |s| |t| (QREFELT $ 24))
                                   (QREFELT $ 61))))))))) 

(SDEFUN |SET;remove!;S2$;22| ((|x| S) (|s| $) ($ $))
        (SPROG ((|k| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (+ (SPADCALL |s| (QREFELT $ 23)) 1)
                      . #1=(|SET;remove!;S2$;22|))
                (LETT |k| (SPADCALL |s| (QREFELT $ 52)) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((< |k| |n|)
                          (SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 24))
                                    (QREFELT $ 60)))
                         ('T NIL)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |k| (+ |k| 1) . #1#))) NIL (GO G190) G191
                     (EXIT NIL))
                (COND
                 ((< |k| |n|)
                  (COND
                   ((SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 24))
                              (QREFELT $ 61))
                    (EXIT (SPADCALL |s| |k| (QREFELT $ 26)))))))
                (EXIT |s|)))) 

(SDEFUN |SET;intersect;3$;23| ((|s| $) (|t| $) ($ $))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| #1#) (|r| ($)) (|n| #2=(|Integer|))
          (|m| #2#))
         (SEQ
          (LETT |m| (SPADCALL |s| (QREFELT $ 23)) . #3=(|SET;intersect;3$;23|))
          (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #3#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #3#)
          (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #3#)
          (LETT |r| (SPADCALL (QREFELT $ 11)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 66))
                    (SPADCALL |j| |n| (QREFELT $ 66)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 61))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (LETT |i| (+ |i| 1) . #3#)
                    (EXIT (LETT |j| (+ |j| 1) . #3#))))
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 68))
                   (LETT |i| (+ |i| 1) . #3#))
                  ('T (LETT |j| (+ |j| 1) . #3#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |SET;difference;3$;24| ((|s| $) (|t| $) ($ $))
        (SPROG
         ((|i| #1=(|Integer|)) (|j| #1#) (|r| ($)) (|n| #2=(|Integer|))
          (|m| #2#))
         (SEQ
          (LETT |m| (SPADCALL |s| (QREFELT $ 23))
                . #3=(|SET;difference;3$;24|))
          (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #3#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #3#)
          (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #3#)
          (LETT |r| (SPADCALL (QREFELT $ 11)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 66))
                    (SPADCALL |j| |n| (QREFELT $ 66)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 61))
                   (SEQ (LETT |i| (+ |i| 1) . #3#)
                        (EXIT (LETT |j| (+ |j| 1) . #3#))))
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 68))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (EXIT (LETT |i| (+ |i| 1) . #3#))))
                  ('T (LETT |j| (+ |j| 1) . #3#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190 (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 66))) (GO G191)))
               (SEQ
                (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |i| (+ |i| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |SET;symmetricDifference;3$;25| ((|s| $) (|t| $) ($ $))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| #1#) (|r| ($)) (|n| #2=(|Integer|))
          (|m| #2#))
         (SEQ
          (LETT |m| (SPADCALL |s| (QREFELT $ 23))
                . #3=(|SET;symmetricDifference;3$;25|))
          (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #3#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #3#)
          (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #3#)
          (LETT |r| (SPADCALL (QREFELT $ 11)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 66))
                    (SPADCALL |j| |n| (QREFELT $ 66)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 68))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (EXIT (LETT |i| (+ |i| 1) . #3#))))
                  ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                             (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 60))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (EXIT (LETT |j| (+ |j| 1) . #3#))))
                  ('T
                   (SEQ (LETT |i| (+ |i| 1) . #3#)
                        (EXIT (LETT |j| (+ |j| 1) . #3#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190 (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 66))) (GO G191)))
               (SEQ
                (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |i| (+ |i| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190 (COND ((NULL (SPADCALL |j| |n| (QREFELT $ 66))) (GO G191)))
               (SEQ
                (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 24)) (QREFELT $ 67))
                (EXIT (LETT |j| (+ |j| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |SET;subset?;2$B;26| ((|s| $) (|t| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G808 NIL) (|j| #2=(|Integer|)) (|i| #2#) (|n| #3=(|Integer|))
          (|m| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m| (SPADCALL |s| (QREFELT $ 23))
                  . #4=(|SET;subset?;2$B;26|))
            (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #4#)
            (EXIT
             (COND ((SPADCALL |m| |n| (QREFELT $ 72)) NIL)
                   ('T
                    (SEQ (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #4#)
                         (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #4#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  ((SPADCALL |i| |m| (QREFELT $ 66))
                                   (SPADCALL |j| |n| (QREFELT $ 66)))
                                  ('T NIL)))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                                            (SPADCALL |t| |j| (QREFELT $ 24))
                                            (QREFELT $ 61))
                                  (SEQ (LETT |i| (+ |i| 1) . #4#)
                                       (EXIT (LETT |j| (+ |j| 1) . #4#))))
                                 ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                                            (SPADCALL |t| |j| (QREFELT $ 24))
                                            (QREFELT $ 60))
                                  (LETT |j| (+ |j| 1) . #4#))
                                 ('T
                                  (PROGN
                                   (LETT #1# NIL . #4#)
                                   (GO #5=#:G807))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (SPADCALL |i| |m| (QREFELT $ 72)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |SET;union;3$;27| ((|s| $) (|t| $) ($ $))
        (SPROG
         ((|j| #1=(|Integer|)) (|i| #1#) (|r| ($)) (|n| #2=(|Integer|))
          (|m| #2#))
         (SEQ (LETT |m| (SPADCALL |s| (QREFELT $ 23)) . #3=(|SET;union;3$;27|))
              (LETT |n| (SPADCALL |t| (QREFELT $ 23)) . #3#)
              (LETT |i| (SPADCALL |s| (QREFELT $ 52)) . #3#)
              (LETT |j| (SPADCALL |t| (QREFELT $ 52)) . #3#)
              (LETT |r| (SPADCALL (QREFELT $ 11)) . #3#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |i| |m| (QREFELT $ 66))
                        (SPADCALL |j| |n| (QREFELT $ 66)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                                 (SPADCALL |t| |j| (QREFELT $ 24))
                                 (QREFELT $ 61))
                       (SEQ
                        (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                                  (QREFELT $ 67))
                        (LETT |i| (+ |i| 1) . #3#)
                        (EXIT (LETT |j| (+ |j| 1) . #3#))))
                      ((SPADCALL (SPADCALL |s| |i| (QREFELT $ 24))
                                 (SPADCALL |t| |j| (QREFELT $ 24))
                                 (QREFELT $ 68))
                       (SEQ
                        (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                                  (QREFELT $ 67))
                        (EXIT (LETT |i| (+ |i| 1) . #3#))))
                      ('T
                       (SEQ
                        (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 24))
                                  (QREFELT $ 67))
                        (EXIT (LETT |j| (+ |j| 1) . #3#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (SEQ G190
                   (COND ((NULL (SPADCALL |i| |m| (QREFELT $ 66))) (GO G191)))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |s| |i| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (EXIT (LETT |i| (+ |i| 1) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (SEQ G190
                   (COND ((NULL (SPADCALL |j| |n| (QREFELT $ 66))) (GO G191)))
                   (SEQ
                    (SPADCALL |r| (SPADCALL |t| |j| (QREFELT $ 24))
                              (QREFELT $ 67))
                    (EXIT (LETT |j| (+ |j| 1) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |SET;insert!;S2$;28| ((|x| S) (|s| $) ($ $))
        (SPROG ((#1=#:G825 NIL) (#2=#:G826 NIL) (#3=#:G827 NIL) (|k| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |k| (SPADCALL |s| (QREFELT $ 52))
                           . #4=(|SET;insert!;S2$;28|))
                     (LETT #3# (SPADCALL |s| (QREFELT $ 23)) . #4#) G190
                     (COND ((> |k| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |s| |k| (QREFELT $ 24)) |x|
                                   (QREFELT $ 61))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# |s| . #4#) (GO #5=#:G824))
                                . #4#)
                          (GO #6=#:G822))))))
                     (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT
                   (SPADCALL |x| |s| (+ (SPADCALL |s| (QREFELT $ 23)) 1)
                             (QREFELT $ 62)))))
                #5# (EXIT #2#)))) 

(SDEFUN |SET;remove!;S2$;29| ((|x| S) (|s| $) ($ $))
        (SPROG ((|k| (|Integer|)) (#1=#:G832 NIL) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |n| (+ (SPADCALL |s| (QREFELT $ 23)) 1)
                        . #2=(|SET;remove!;S2$;29|))
                  (LETT |k| (SPADCALL |s| (QREFELT $ 52)) . #2#)
                  (SEQ G190 (COND ((NULL (< |k| |n|)) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| (SPADCALL |s| |k| (QREFELT $ 24))
                                     (QREFELT $ 61))
                           (PROGN
                            (LETT #1# (SPADCALL |s| |k| (QREFELT $ 26)) . #2#)
                            (GO #3=#:G831)))
                          ('T (LETT |k| (+ |k| 1) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |s|)))
                #3# (EXIT #1#)))) 

(SDEFUN |SET;map!;M2$;30| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SEQ (SPADCALL |f| |s| (QREFELT $ 54))
             (EXIT (SPADCALL |s| (QREFELT $ 75))))) 

(DECLAIM (NOTINLINE |Set;|)) 

(DEFUN |Set| (#1=#:G838)
  (SPROG NIL
         (PROG (#2=#:G839)
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
  (SPROG ((#1=#:G837 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|Set|))
          (LETT |dv$| (LIST '|Set| DV$1) . #2#)
          (LETT $ (GETREFV 83) . #2#)
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
            (QSETREFV $ 48
                      (CONS (|dispatchFunction| |SET;convert;$If;14|) $))))
          (COND
           ((|testBitVector| |pv$| 7)
            (PROGN
             (QSETREFV $ 50 (CONS (|dispatchFunction| |SET;=;2$B;15|) $))
             (QSETREFV $ 51 (CONS (|dispatchFunction| |SET;max;$S;16|) $))
             (QSETREFV $ 53 (CONS (|dispatchFunction| |SET;min;$S;17|) $))
             (QSETREFV $ 33 (CONS (|dispatchFunction| |SET;map!;M2$;18|) $))
             (QSETREFV $ 59
                       (CONS (|dispatchFunction| |SET;construct;L$;19|) $))
             (QSETREFV $ 63 (CONS (|dispatchFunction| |SET;insert!;S2$;20|) $))
             (QSETREFV $ 64 (CONS (|dispatchFunction| |SET;member?;S$B;21|) $))
             (QSETREFV $ 65 (CONS (|dispatchFunction| |SET;remove!;S2$;22|) $))
             (QSETREFV $ 69
                       (CONS (|dispatchFunction| |SET;intersect;3$;23|) $))
             (QSETREFV $ 70
                       (CONS (|dispatchFunction| |SET;difference;3$;24|) $))
             (QSETREFV $ 71
                       (CONS
                        (|dispatchFunction| |SET;symmetricDifference;3$;25|)
                        $))
             (QSETREFV $ 73 (CONS (|dispatchFunction| |SET;subset?;2$B;26|) $))
             (QSETREFV $ 74 (CONS (|dispatchFunction| |SET;union;3$;27|) $))))
           ('T
            (PROGN
             (QSETREFV $ 63 (CONS (|dispatchFunction| |SET;insert!;S2$;28|) $))
             (QSETREFV $ 65 (CONS (|dispatchFunction| |SET;remove!;S2$;29|) $))
             (QSETREFV $ 33 (CONS (|dispatchFunction| |SET;map!;M2$;30|) $)))))
          $))) 

(MAKEPROP '|Set| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |#|) |SET;#;$Nni;1| |SET;empty;$;4|
              |SET;brace;$;2| |SET;set;$;3| (5 . |empty|) (9 . |copy|)
              |SET;copy;2$;5| (|List| 6) (14 . |parts|) |SET;parts;$L;6|
              (|Boolean|) (19 . |empty?|) (|Integer|) (24 . |maxIndex|)
              (29 . |elt|) |SET;inspect;$S;7| (35 . |delete!|)
              |SET;extract!;$S;8| (|Union| 6 '"failed") (|Mapping| 20 6)
              (41 . |find|) |SET;find;M$U;9| (|Mapping| 6 6) (47 . |map!|)
              |SET;map;M2$;10| (|Mapping| 6 6 6) (53 . |reduce|)
              |SET;reduce;M$S;11| (59 . |reduce|) |SET;reduce;M$2S;12|
              (66 . |reduce|) |SET;reduce;M$3S;13| (|Symbol|) (|InputForm|)
              (74 . |convert|) (79 . |convert|) (|List| $) (84 . |convert|)
              (89 . |convert|) (94 . =) (100 . =) (106 . |max|)
              (111 . |minIndex|) (116 . |min|) (121 . |map!|) (127 . |sort!|)
              (132 . |removeRepeats!|) (137 . |new|) (143 . |setelt!|)
              (150 . |construct|) (155 . >) (161 . =) (167 . |insert!|)
              (174 . |insert!|) (180 . |member?|) (186 . |remove!|) (192 . <=)
              (198 . |concat!|) (204 . <) (210 . |intersect|)
              (216 . |difference|) (222 . |symmetricDifference|) (228 . >)
              (234 . |subset?|) (240 . |union|) (246 . |removeDuplicates!|)
              (|Equation| 6) (|List| 76) (|PositiveInteger|) (|OutputForm|)
              (|SingleInteger|) (|String|) (|HashState|))
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
              |cardinality| 599 |brace| 604 |any?| 613 >= 619 > 625 = 631 <=
              637 < 643 |#| 649)
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
                 (|PartialOrder|) (|BasicType|) (|CoercibleTo| 79)
                 (|shallowlyMutable|) (|InnerEvalable| 6 6)
                 (|ConvertibleTo| 43))
              (|makeByteWordVec2| 82
                                  '(1 7 8 0 9 0 7 0 14 1 7 0 0 15 1 7 17 0 18 1
                                    0 20 0 21 1 7 22 0 23 2 7 6 0 22 24 2 7 0 0
                                    22 26 2 7 28 29 0 30 2 0 0 32 0 33 2 7 6 35
                                    0 36 3 7 6 35 0 6 38 4 7 6 35 0 6 6 40 1 43
                                    0 42 44 1 17 43 0 45 1 43 0 46 47 1 0 43 0
                                    48 2 7 20 0 0 49 2 0 20 0 0 50 1 0 6 0 51 1
                                    7 22 0 52 1 0 6 0 53 2 7 0 32 0 54 1 7 0 0
                                    55 1 7 0 0 56 2 7 0 8 6 57 3 7 6 0 22 6 58
                                    1 0 0 17 59 2 6 20 0 0 60 2 6 20 0 0 61 3 7
                                    0 6 0 22 62 2 0 0 6 0 63 2 0 20 6 0 64 2 0
                                    0 6 0 65 2 22 20 0 0 66 2 7 0 0 6 67 2 6 20
                                    0 0 68 2 0 0 0 0 69 2 0 0 0 0 70 2 0 0 0 0
                                    71 2 22 20 0 0 72 2 0 20 0 0 73 2 0 0 0 0
                                    74 1 7 0 0 75 2 0 20 0 0 1 0 3 0 1 2 0 0 0
                                    6 1 2 0 0 0 0 74 2 0 0 6 0 1 2 0 0 0 0 71 2
                                    0 20 0 0 73 2 2 20 0 0 1 2 0 20 0 8 1 0 3 8
                                    1 0 0 0 13 1 0 0 17 1 2 9 0 29 0 1 2 9 0 29
                                    0 1 0 0 0 1 1 10 0 0 1 2 10 0 6 0 65 2 9 0
                                    29 0 1 2 10 0 6 0 1 2 9 0 29 0 1 4 10 6 35
                                    0 6 6 41 2 9 6 35 0 37 3 9 6 35 0 6 39 0 3
                                    0 1 1 9 17 0 19 2 0 20 0 8 1 1 7 6 0 53 1 9
                                    17 0 1 2 10 20 6 0 64 1 7 6 0 51 2 8 0 32 0
                                    33 2 0 0 32 0 34 1 3 78 0 1 2 0 20 0 8 1 1
                                    0 81 0 1 2 0 0 0 0 69 1 0 6 0 25 2 0 0 6 0
                                    63 1 3 0 78 1 2 0 82 82 0 1 1 0 80 0 1 2 0
                                    28 29 0 31 1 0 6 0 27 2 9 20 29 0 1 3 4 0 0
                                    17 17 1 2 4 0 0 76 1 3 4 0 0 6 6 1 2 4 0 0
                                    77 1 2 0 20 0 0 1 0 3 46 1 1 0 20 0 21 0 0
                                    0 11 2 0 0 0 6 1 2 0 0 0 0 70 1 0 0 17 1 0
                                    0 0 1 2 10 8 6 0 1 2 9 8 29 0 1 1 0 0 0 16
                                    1 1 43 0 48 1 0 0 17 59 1 3 0 0 1 1 0 79 0
                                    1 1 0 8 0 1 1 0 0 17 1 0 0 0 12 2 9 20 29 0
                                    1 2 0 20 0 0 1 2 0 20 0 0 1 2 0 20 0 0 50 2
                                    0 20 0 0 1 2 0 20 0 0 1 1 9 8 0 10)))))
           '|lookupComplete|)) 
