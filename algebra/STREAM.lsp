
(SDEFUN |STREAM;explicitlyEmpty?;$B;1| ((|x| $) ($ |Boolean|))
        (EQ (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 7))) 

(SDEFUN |STREAM;lazy?;$B;2| ((|x| $) ($ |Boolean|))
        (EQ (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 8))) 

(SDEFUN |STREAM;uninitialized?| ((|x| $) ($ |Boolean|))
        (EQ (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 9))) 

(PUT '|STREAM;frst;$S;4| '|SPADreplace| 'QCAR) 

(SDEFUN |STREAM;frst;$S;4| ((|x| $) ($ S)) (QCAR |x|)) 

(PUT '|STREAM;rst;2$;5| '|SPADreplace| 'QCDR) 

(SDEFUN |STREAM;rst;2$;5| ((|x| $) ($ $)) (QCDR |x|)) 

(SDEFUN |STREAM;setfrst!| ((|x| $) (|s| S) ($ S))
        (PROGN (RPLACA |x| |s|) (QCAR |x|))) 

(SDEFUN |STREAM;setrst!| ((|x| $) (|y| $) ($ $))
        (PROGN (RPLACD |x| |y|) (QCDR |x|))) 

(SDEFUN |STREAM;setToNil!| ((|x| $) ($ $))
        (SEQ (|STREAM;setfrst!| |x| (QREFELT $ 7) $)
             (|STREAM;setrst!| |x| NIL $) (EXIT |x|))) 

(SDEFUN |STREAM;getm|
        ((|x| $) (|le| |List| (|OutputForm|)) (|n| |Integer|)
         ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |x| (QREFELT $ 13)) |le|)
              ((SPADCALL |x| (QREFELT $ 14))
               (COND
                ((SPADCALL |n| 0 (QREFELT $ 17))
                 (COND ((SPADCALL |x| (QREFELT $ 18)) |le|)
                       (#1='T
                        (|STREAM;getm| (SPADCALL |x| (QREFELT $ 15))
                         (CONS
                          (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                    (QREFELT $ 20))
                          |le|)
                         (- |n| 1) $))))
                (#1# (CONS (SPADCALL "..." (QREFELT $ 22)) |le|))))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (CONS
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20))
                 (QREFELT $ 24))
                |le|))
              ((SPADCALL |n| 0 (QREFELT $ 17))
               (|STREAM;getm| (SPADCALL |x| (QREFELT $ 15))
                (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20))
                      |le|)
                (- |n| 1) $))
              (#1# (CONS (SPADCALL "..." (QREFELT $ 22)) |le|)))) 

(SDEFUN |STREAM;showElements;Nni$Of;10|
        ((|count| |NonNegativeInteger|) (|x| $) ($ |OutputForm|))
        (SPROG
         ((|pp| (|OutputForm|)) (|pl| #1=(|List| (|OutputForm|)))
          (#2=#:G812 NIL) (|i| NIL) (|le| #1#) (#3=#:G811 NIL)
          (|fc|
           (|Record| (|:| |cycle?| (|Boolean|))
                     (|:| |prefix| (|NonNegativeInteger|))
                     (|:| |period| (|NonNegativeInteger|))))
          (|y| ($)) (#4=#:G810 NIL))
         (SEQ (LETT |y| |x| . #5=(|STREAM;showElements;Nni$Of;10|))
              (SEQ (LETT |i| 1 . #5#) (LETT #4# |count| . #5#) G190
                   (COND
                    ((OR (|greater_SI| |i| #4#)
                         (NULL (NULL (SPADCALL |y| (QREFELT $ 18)))))
                     (GO G191)))
                   (SEQ (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 15)) . #5#)))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |fc| (SPADCALL |count| |x| (QREFELT $ 27)) . #5#)
              (COND
               ((NULL (QVELT |fc| 0))
                (EXIT
                 (SPADCALL (NREVERSE (|STREAM;getm| |x| NIL |count| $))
                           (QREFELT $ 29)))))
              (LETT |le| NIL . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #3# (QVELT |fc| 1) . #5#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |le|
                          (CONS
                           (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                                     (QREFELT $ 20))
                           |le|)
                          . #5#)
                    (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 31)) . #5#)))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |pp|
                    (COND
                     ((EQL (QVELT |fc| 2) 1)
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20))
                       (QREFELT $ 24)))
                     ('T
                      (SEQ (LETT |pl| NIL . #5#)
                           (SEQ (LETT |i| 1 . #5#)
                                (LETT #2# (QVELT |fc| 2) . #5#) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (LETT |pl|
                                       (CONS
                                        (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                                  (QREFELT $ 20))
                                        |pl|)
                                       . #5#)
                                 (EXIT
                                  (LETT |x| (SPADCALL |x| (QREFELT $ 31))
                                        . #5#)))
                                (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL (SPADCALL (NREVERSE |pl|) (QREFELT $ 32))
                                      (QREFELT $ 24))))))
                    . #5#)
              (EXIT (SPADCALL (NREVERSE (CONS |pp| |le|)) (QREFELT $ 29)))))) 

(SDEFUN |STREAM;streamCountCoerce| ((|x| $) ($ |OutputForm|))
        (SPROG ((|count| (|NonNegativeInteger|)))
               (SEQ (LETT |count| |$streamCount| |STREAM;streamCountCoerce|)
                    (EXIT (SPADCALL |count| |x| (QREFELT $ 33)))))) 

(SDEFUN |STREAM;listm|
        ((|x| $) (|le| |List| (|OutputForm|)) (|n| |Integer|)
         ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |x| (QREFELT $ 13)) |le|)
              ((SPADCALL |x| (QREFELT $ 14))
               (COND
                ((SPADCALL |n| 0 (QREFELT $ 17))
                 (COND ((SPADCALL |x| (QREFELT $ 18)) |le|)
                       (#1='T
                        (|STREAM;listm| (SPADCALL |x| (QREFELT $ 15))
                         (CONS
                          (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                    (QREFELT $ 20))
                          |le|)
                         (- |n| 1) $))))
                (#1# (CONS (SPADCALL "..." (QREFELT $ 22)) |le|))))
              (#1#
               (|STREAM;listm| (SPADCALL |x| (QREFELT $ 15))
                (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20))
                      |le|)
                (- |n| 1) $)))) 

(SDEFUN |STREAM;showAllElements;$Of;13| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|pp| (|OutputForm|)) (|pl| (|List| (|OutputForm|))) (#1=#:G832 NIL)
          (|i| NIL) (|len| (|NonNegativeInteger|))
          (|le| (|List| (|OutputForm|))) (|cycEnt| ($))
          (|cycElt| (|Union| $ "failed")))
         (SEQ (SPADCALL |x| |$streamCount| (QREFELT $ 34))
              (LETT |cycElt| (SPADCALL |x| (QREFELT $ 37))
                    . #2=(|STREAM;showAllElements;$Of;13|))
              (EXIT
               (COND
                ((QEQCAR |cycElt| 1)
                 (SEQ
                  (LETT |le| (|STREAM;listm| |x| NIL |$streamCount| $) . #2#)
                  (EXIT (SPADCALL (NREVERSE |le|) (QREFELT $ 29)))))
                (#3='T
                 (SEQ
                  (LETT |cycEnt| (SPADCALL |x| (QCDR |cycElt|) (QREFELT $ 38))
                        . #2#)
                  (LETT |le| NIL . #2#)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |x| |cycEnt| (QREFELT $ 23))))
                         (GO G191)))
                       (SEQ
                        (LETT |le|
                              (CONS
                               (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                         (QREFELT $ 20))
                               |le|)
                              . #2#)
                        (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 15)) . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |len| (SPADCALL (QCDR |cycElt|) (QREFELT $ 39)) . #2#)
                  (LETT |pp|
                        (COND
                         ((EQL |len| 1)
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                     (QREFELT $ 20))
                           (QREFELT $ 24)))
                         (#3#
                          (SEQ (LETT |pl| NIL . #2#)
                               (SEQ (LETT |i| 1 . #2#) (LETT #1# |len| . #2#)
                                    G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (LETT |pl|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| (QREFELT $ 11))
                                             (QREFELT $ 20))
                                            |pl|)
                                           . #2#)
                                     (EXIT
                                      (LETT |x| (SPADCALL |x| (QREFELT $ 15))
                                            . #2#)))
                                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL (NREVERSE |pl|) (QREFELT $ 32))
                                 (QREFELT $ 24))))))
                        . #2#)
                  (EXIT
                   (SPADCALL (NREVERSE (CONS |pp| |le|)) (QREFELT $ 29)))))))))) 

(PUT '|STREAM;showAll?;B;14| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |STREAM;showAll?;B;14| (($ |Boolean|)) |$streamsShowAll|) 

(SDEFUN |STREAM;coerce;$Of;15| ((|x| $) ($ |OutputForm|))
        (COND ((SPADCALL (QREFELT $ 41)) (SPADCALL |x| (QREFELT $ 40)))
              ('T (|STREAM;streamCountCoerce| |x| $)))) 

(SDEFUN |STREAM;lazyCopy| ((|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;lazyCopy!0| (VECTOR $ |x|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;lazyCopy!0| (($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|STREAM;lazyCopy|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 43)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 44))
                             (QREFELT $ 45)))))))) 

(SDEFUN |STREAM;copy;2$;17| ((|x| $) ($ $))
        (SPROG
         ((|head| ($)) (#1=#:G848 NIL) (|cycle| ($)) (|d| (|Integer|))
          (|e| ($)) (|len| (|NonNegativeInteger|)) (|ce| ($))
          (|cycElt| (|Union| $ "failed")))
         (SEQ
          (LETT |cycElt| (SPADCALL |x| (QREFELT $ 37))
                . #2=(|STREAM;copy;2$;17|))
          (EXIT
           (COND ((QEQCAR |cycElt| 1) (|STREAM;lazyCopy| |x| $))
                 (#3='T
                  (SEQ (LETT |ce| (QCDR |cycElt|) . #2#)
                       (LETT |len| (SPADCALL |ce| (QREFELT $ 39)) . #2#)
                       (LETT |e| (SPADCALL |x| |ce| (QREFELT $ 38)) . #2#)
                       (LETT |d| (SPADCALL |x| |e| (QREFELT $ 48)) . #2#)
                       (LETT |cycle|
                             (SPADCALL (SPADCALL |e| |len| (QREFELT $ 49))
                                       (QREFELT $ 50))
                             . #2#)
                       (|STREAM;setrst!| (SPADCALL |cycle| (QREFELT $ 51))
                        |cycle| $)
                       (EXIT
                        (COND ((EQL |d| 0) |cycle|)
                              (#3#
                               (SEQ
                                (LETT |head|
                                      (SPADCALL
                                       (SPADCALL |x|
                                                 (PROG1 (LETT #1# |d| . #2#)
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (QREFELT $ 49))
                                       (QREFELT $ 50))
                                      . #2#)
                                (|STREAM;setrst!|
                                 (SPADCALL |head| (QREFELT $ 51)) |cycle| $)
                                (EXIT |head|)))))))))))) 

(SDEFUN |STREAM;construct;L$;18| ((|l| |List| S) ($ $))
        (COND ((NULL |l|) (SPADCALL (QREFELT $ 43)))
              ('T
               (SPADCALL (|SPADfirst| |l|) (SPADCALL (CDR |l|) (QREFELT $ 53))
                         (QREFELT $ 45))))) 

(SDEFUN |STREAM;elt;$IS;19| ((|x| $) (|n| |Integer|) ($ S))
        (COND
         ((OR (< |n| 1) (SPADCALL |x| (QREFELT $ 18)))
          (|error| "elt: no such element"))
         ('T
          (COND ((EQL |n| 1) (SPADCALL |x| (QREFELT $ 11)))
                ('T
                 (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (- |n| 1)
                           (QREFELT $ 54))))))) 

(SDEFUN |STREAM;seteltt| ((|x| $) (|n| |Integer|) (|s| S) ($ S))
        (COND ((EQL |n| 1) (|STREAM;setfrst!| |x| |s| $))
              ('T
               (|STREAM;seteltt| (SPADCALL |x| (QREFELT $ 15)) (- |n| 1) |s|
                $)))) 

(SDEFUN |STREAM;setelt!;$I2S;21| ((|x| $) (|n| |Integer|) (|s| S) ($ S))
        (SEQ
         (COND
          ((OR (< |n| 1) (SPADCALL |x| (QREFELT $ 18)))
           (|error| "setelt!: no such element"))
          ('T
           (SEQ
            (LETT |x| (|STREAM;expand!| |x| (+ (- |n| 1) 1) $)
                  |STREAM;setelt!;$I2S;21|)
            (EXIT (|STREAM;seteltt| |x| |n| |s| $))))))) 

(SDEFUN |STREAM;removee| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;removee!0| (VECTOR |p| $ |x|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;removee!0| (($$ NIL))
        (PROG (|x| $ |p|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;removee|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 43)))
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)
                   (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 57)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 57))
                             (QREFELT $ 45)))))))) 

(SDEFUN |STREAM;remove;M2$;23| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 43)))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)
                 (SPADCALL (QREFELT $ 43)))
                (#1='T |x|)))
              (#1# (|STREAM;removee| |p| |x| $)))) 

(SDEFUN |STREAM;selectt| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;selectt!0| (VECTOR |p| $ |x|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;selectt!0| (($$ NIL))
        (PROG (|x| $ |p|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;selectt|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 43)))
                  ((NULL (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|))
                   (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 58)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 58))
                             (QREFELT $ 45)))))))) 

(SDEFUN |STREAM;select;M2$;25| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 43)))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (COND ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|) |x|)
                     (#1='T (SPADCALL (QREFELT $ 43)))))
              (#1# (|STREAM;selectt| |p| |x| $)))) 

(SDEFUN |STREAM;map;M2$;26| ((|f| |Mapping| S S) (|x| $) ($ $))
        (SPADCALL |f| |x| (QREFELT $ 62))) 

(SDEFUN |STREAM;map;M3$;27| ((|g| |Mapping| S S S) (|x| $) (|y| $) ($ $))
        (SPROG ((|ys| (|Stream| S)) (|xs| (|Stream| S)))
               (SEQ (LETT |xs| |x| . #1=(|STREAM;map;M3$;27|))
                    (LETT |ys| |y| . #1#)
                    (EXIT (SPADCALL |g| |xs| |ys| (QREFELT $ 66)))))) 

(SDEFUN |STREAM;fill!;$S$;28| ((|x| $) (|s| S) ($ $))
        (SEQ (|STREAM;setfrst!| |x| |s| $) (EXIT (|STREAM;setrst!| |x| |x| $)))) 

(SDEFUN |STREAM;map!;M2$;29| ((|f| |Mapping| S S) (|x| $) ($ $))
        (SPROG ((|y| ($)) (#1=#:G953 NIL) (|tail| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 69))
                  (SEQ
                   (LETT |tail| (SPADCALL |x| (QREFELT $ 70))
                         . #2=(|STREAM;map!;M2$;29|))
                   (LETT |y| |x| . #2#)
                   (SEQ (LETT #1# NIL . #2#) G190 (COND (#1# (GO G191)))
                        (SEQ
                         (|STREAM;setfrst!| |y|
                          (SPADCALL (SPADCALL |y| (QREFELT $ 11)) |f|) $)
                         (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 15)) . #2#)))
                        (LETT #1# (SPADCALL |y| |tail| (QREFELT $ 71)) . #2#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |x|)))
                 ((SPADCALL |x| (QREFELT $ 72))
                  (SEQ (LETT |y| |x| . #2#)
                       (SEQ G190
                            (COND
                             ((NULL (NULL (SPADCALL |y| (QREFELT $ 18))))
                              (GO G191)))
                            (SEQ
                             (|STREAM;setfrst!| |y|
                              (SPADCALL (SPADCALL |y| (QREFELT $ 11)) |f|) $)
                             (EXIT
                              (LETT |y| (SPADCALL |y| (QREFELT $ 15)) . #2#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |x|)))
                 ('T (|error| "map!: stream with lazy evaluation")))))) 

(SDEFUN |STREAM;swap!;$2IV;30|
        ((|x| $) (|m| . #1=(|Integer|)) (|n| . #1#) ($ |Void|))
        (SPROG ((|xn| (S)) (|xm| (S)))
               (SEQ
                (COND
                 ((SPADCALL |m| |x| (QREFELT $ 74))
                  (COND
                   ((NULL (SPADCALL |n| |x| (QREFELT $ 74)))
                    (EXIT (|error| #2="swap!: no such elements")))))
                 ('T (EXIT (|error| #2#))))
                (LETT |x| (|STREAM;expand!| |x| (+ (- (MAX |m| |n|) 1) 1) $)
                      . #3=(|STREAM;swap!;$2IV;30|))
                (LETT |xm| (SPADCALL |x| |m| (QREFELT $ 54)) . #3#)
                (LETT |xn| (SPADCALL |x| |n| (QREFELT $ 54)) . #3#)
                (SPADCALL |x| |m| |xn| (QREFELT $ 55))
                (SPADCALL |x| |n| |xm| (QREFELT $ 55)) (EXIT |x|)))) 

(SDEFUN |STREAM;concat;$S$;31| ((|x| $) (|s| S) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;concat;$S$;31!0| (VECTOR |s| $ |x|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;concat;$S$;31!0| (($$ NIL))
        (PROG (|x| $ |s|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;concat;$S$;31|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |s| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |x| (QREFELT $ 18))
              (SPADCALL |s| (SPADCALL (QREFELT $ 43)) (QREFELT $ 45)))
             ('T
              (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                        (SPADCALL (SPADCALL |x| (QREFELT $ 15)) |s|
                                  (QREFELT $ 77))
                        (QREFELT $ 45)))))))) 

(SDEFUN |STREAM;concat;3$;32| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;concat;3$;32!0| (VECTOR |y| $ |x|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;concat;3$;32!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;concat;3$;32|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL |y| (QREFELT $ 44)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL (SPADCALL |x| (QREFELT $ 15)) |y|
                                       (QREFELT $ 78))
                             (QREFELT $ 45)))))))) 

(SDEFUN |STREAM;concat;L$;33| ((|l| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;concat;L$;33!0| (VECTOR $ |l|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;concat;L$;33!0| (($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1) . #1=(|STREAM;concat;L$;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|x| NIL))
                   (COND
                    ((SPADCALL |l| (QREFELT $ 80)) (SPADCALL (QREFELT $ 43)))
                    ((SPADCALL (LETT |x| (SPADCALL |l| (QREFELT $ 81)) NIL)
                               (QREFELT $ 18))
                     (SPADCALL (SPADCALL |l| (QREFELT $ 82)) (QREFELT $ 83)))
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                         (SPADCALL
                                          (SPADCALL |l| (QREFELT $ 82))
                                          (QREFELT $ 83))
                                         (QREFELT $ 78))
                               (QREFELT $ 45))))))))) 

(SDEFUN |STREAM;setelt!;$Us2S;34|
        ((|x| $) (|seg| |UniversalSegment| (|Integer|)) (|s| S) ($ S))
        (SPROG
         ((#1=#:G999 NIL) (|y| ($)) (#2=#:G1003 NIL) (|i| NIL) (#3=#:G993 NIL)
          (|h| (|Integer|)) (|l| (|Integer|)))
         (SEQ
          (LETT |l| (SPADCALL |seg| (QREFELT $ 85))
                . #4=(|STREAM;setelt!;$Us2S;34|))
          (EXIT
           (COND
            ((SPADCALL |seg| (QREFELT $ 86))
             (SEQ (LETT |h| (SPADCALL |seg| (QREFELT $ 87)) . #4#)
                  (EXIT
                   (COND ((< |h| |l|) |s|)
                         (#5='T
                          (SEQ
                           (COND
                            ((SPADCALL |l| |x| (QREFELT $ 74))
                             (COND
                              ((NULL (SPADCALL |h| |x| (QREFELT $ 74)))
                               (EXIT
                                (|error| #6="setelt!: index out of range")))))
                            (#5# (EXIT (|error| #6#))))
                           (LETT |x| (|STREAM;expand!| |x| (+ (- |h| 1) 1) $)
                                 . #4#)
                           (LETT |y|
                                 (SPADCALL |x|
                                           (PROG1 (LETT #3# (- |l| 1) . #4#)
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           (QREFELT $ 88))
                                 . #4#)
                           (SEQ (LETT |i| 0 . #4#) (LETT #2# (- |h| |l|) . #4#)
                                G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ (|STREAM;setfrst!| |y| |s| $)
                                     (EXIT
                                      (LETT |y| (SPADCALL |y| (QREFELT $ 15))
                                            . #4#)))
                                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |s|)))))))
            ((NULL (SPADCALL |l| |x| (QREFELT $ 74)))
             (|error| "setelt!: index out of range"))
            ('T
             (SEQ
              (LETT |x|
                    (SPADCALL |x|
                              (PROG1 (LETT #1# (- |l| 1) . #4#)
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT $ 88))
                    . #4#)
              (|STREAM;setrst!| |x| |x| $)
              (EXIT (|STREAM;setfrst!| |x| |s| $))))))))) 

(SDEFUN |STREAM;empty;$;35| (($ $)) (CONS (QREFELT $ 7) NIL)) 

(SDEFUN |STREAM;lazyEval| ((|x| $) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 15)))) 

(SDEFUN |STREAM;lazyEvaluate;2$;37| ((|x| $) ($ $))
        (SPROG ((|st| ($)))
               (SEQ
                (LETT |st| (|STREAM;lazyEval| |x| $)
                      |STREAM;lazyEvaluate;2$;37|)
                (|STREAM;setfrst!| |x| (SPADCALL |st| (QREFELT $ 11)) $)
                (|STREAM;setrst!| |x|
                 (COND ((EQ (SPADCALL |st| (QREFELT $ 15)) |st|) |x|)
                       ('T (SPADCALL |st| (QREFELT $ 15))))
                 $)
                (EXIT |x|)))) 

(SDEFUN |STREAM;empty?;$B;38| ((|x| $) ($ |Boolean|))
        (SPROG ((|st| ($)))
               (SEQ
                (SEQ G190
                     (COND ((NULL (SPADCALL |x| (QREFELT $ 14))) (GO G191)))
                     (SEQ
                      (LETT |st| (|STREAM;lazyEval| |x| $)
                            |STREAM;empty?;$B;38|)
                      (|STREAM;setfrst!| |x| (SPADCALL |st| (QREFELT $ 11)) $)
                      (EXIT
                       (|STREAM;setrst!| |x|
                        (COND ((EQ (SPADCALL |st| (QREFELT $ 15)) |st|) |x|)
                              ('T (SPADCALL |st| (QREFELT $ 15))))
                        $)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((|STREAM;uninitialized?| |x| $)
                   (|error| "Trying to use uninitialized stream"))
                  ('T (SPADCALL |x| (QREFELT $ 13)))))))) 

(SDEFUN |STREAM;first;$Nni$;39| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;first;$Nni$;39!0| (VECTOR |x| $ |n|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;first;$Nni$;39!0| (($$ NIL))
        (PROG (|n| $ |x|)
          (LETT |n| (QREFELT $$ 2) . #1=(|STREAM;first;$Nni$;39|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1031 NIL))
                   (COND
                    ((OR (SPADCALL |n| (|spadConstant| $ 91) (QREFELT $ 93))
                         (SPADCALL |x| (QREFELT $ 18)))
                     (SPADCALL (QREFELT $ 43)))
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                         (PROG1
                                             (LETT #2#
                                                   (SPADCALL |n|
                                                             (|spadConstant| $
                                                                             94)
                                                             (QREFELT $ 96))
                                                   NIL)
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (QREFELT $ 49))
                               (QREFELT $ 45))))))))) 

(PUT '|STREAM;concat;S2$;40| '|SPADreplace| 'CONS) 

(SDEFUN |STREAM;concat;S2$;40| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(SDEFUN |STREAM;cons;S2$;41| ((|s| S) (|x| $) ($ $))
        (SPADCALL |s| |x| (QREFELT $ 45))) 

(SDEFUN |STREAM;cycleSplit!;2$;42| ((|x| $) ($ $))
        (SPROG
         ((|z| ($)) (#1=#:G1049 NIL) (|y| ($)) (|cycElt| (|Union| $ "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cycElt| (SPADCALL |x| (QREFELT $ 37))
                  . #2=(|STREAM;cycleSplit!;2$;42|))
            (EXIT
             (COND
              ((QEQCAR |cycElt| 1) (|error| "cycleSplit!: non-cyclic stream"))
              (#3='T
               (SEQ
                (LETT |y| (SPADCALL |x| (QCDR |cycElt|) (QREFELT $ 38)) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |x| |y| (QREFELT $ 23))
                   (SEQ (|STREAM;setToNil!| |x| $)
                        (EXIT (PROGN (LETT #1# |y| . #2#) (GO #4=#:G1048)))))
                  (#3#
                   (SEQ (LETT |z| (SPADCALL |x| (QREFELT $ 15)) . #2#)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |y| |z| (QREFELT $ 23))
                                  (SEQ
                                   (SPADCALL |x| (SPADCALL (QREFELT $ 43))
                                             (QREFELT $ 98))
                                   (EXIT
                                    (PROGN (LETT #1# |y| . #2#) (GO #4#)))))
                                 ('T
                                  (SEQ (LETT |x| |z| . #2#)
                                       (EXIT
                                        (LETT |z| (SPADCALL |z| (QREFELT $ 15))
                                              . #2#)))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |STREAM;expand!| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG
         ((#1=#:G1060 NIL) (|e| ($)) (|y| ($))
          (|nLessD| (|NonNegativeInteger|)) (#2=#:G1059 NIL) (|t| ($))
          (|d| (|Integer|)) (|cycElt| (|Union| $ "failed")) (#3=#:G1065 NIL)
          (|i| NIL))
         (SEQ
          (COND ((< |n| 1) |x|)
                (#4='T
                 (SEQ (LETT |y| |x| . #5=(|STREAM;expand!|))
                      (SEQ (LETT |i| 1 . #5#) (LETT #3# |n| . #5#) G190
                           (COND
                            ((OR (|greater_SI| |i| #3#)
                                 (NULL (NULL (SPADCALL |y| (QREFELT $ 18)))))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |y| (SPADCALL |y| (QREFELT $ 15)) . #5#)))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |cycElt| (SPADCALL |x| (QREFELT $ 37)) . #5#)
                      (EXIT
                       (COND ((QEQCAR |cycElt| 1) |x|)
                             (#4#
                              (SEQ
                               (LETT |e|
                                     (SPADCALL |x| (QCDR |cycElt|)
                                               (QREFELT $ 38))
                                     . #5#)
                               (LETT |d| (SPADCALL |x| |e| (QREFELT $ 48))
                                     . #5#)
                               (EXIT
                                (COND ((>= |d| |n|) |x|)
                                      (#4#
                                       (SEQ
                                        (COND
                                         ((EQL |d| 0)
                                          (SEQ (LETT |d| 1 . #5#)
                                               (LETT |t|
                                                     (SPADCALL |e|
                                                               (QREFELT $ 70))
                                                     . #5#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |t| |e|
                                                            (QREFELT $ 23))
                                                  (SEQ
                                                   (LETT |t|
                                                         (SPADCALL
                                                          (SPADCALL |t|
                                                                    (QREFELT $
                                                                             11))
                                                          (SPADCALL
                                                           (QREFELT $ 43))
                                                          (QREFELT $ 45))
                                                         . #5#)
                                                   (LETT |e|
                                                         (|STREAM;setrst!| |t|
                                                          |t| $)
                                                         . #5#)
                                                   (EXIT
                                                    (|STREAM;setrst!| |x| |e|
                                                     $))))
                                                 (#4#
                                                  (SEQ
                                                   (|STREAM;setrst!| |t|
                                                    (SPADCALL
                                                     (SPADCALL |e|
                                                               (QREFELT $ 11))
                                                     (SPADCALL |e|
                                                               (QREFELT $ 15))
                                                     (QREFELT $ 45))
                                                    $)
                                                   (EXIT
                                                    (LETT |e|
                                                          (SPADCALL |e|
                                                                    (QREFELT $
                                                                             15))
                                                          . #5#)))))))))
                                        (LETT |nLessD|
                                              (PROG1
                                                  (LETT #2# (- |n| |d|) . #5#)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                              . #5#)
                                        (LETT |y|
                                              (SPADCALL
                                               (SPADCALL |e| |nLessD|
                                                         (QREFELT $ 49))
                                               (QREFELT $ 50))
                                              . #5#)
                                        (LETT |e|
                                              (SPADCALL |e| |nLessD|
                                                        (QREFELT $ 88))
                                              . #5#)
                                        (|STREAM;setrst!|
                                         (SPADCALL |y| (QREFELT $ 51)) |e| $)
                                        (|STREAM;setrst!|
                                         (SPADCALL |x|
                                                   (PROG1
                                                       (LETT #1# (- |d| 1)
                                                             . #5#)
                                                     (|check_subtype2|
                                                      (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                                   (QREFELT $ 88))
                                         |y| $)
                                        (EXIT |x|))))))))))))))) 

(SDEFUN |STREAM;first;$S;44| ((|x| $) ($ S))
        (COND
         ((SPADCALL |x| (QREFELT $ 18))
          (|error| "Can't take the first of an empty stream."))
         ('T (SPADCALL |x| (QREFELT $ 11))))) 

(SDEFUN |STREAM;concat!;3$;45| ((|x| $) (|y| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 18)) |y|)
              ('T (|STREAM;setrst!| (SPADCALL |x| (QREFELT $ 51)) |y| $)))) 

(SDEFUN |STREAM;concat!;$S$;46| ((|x| $) (|s| S) ($ $))
        (SPADCALL |x| (SPADCALL |s| (SPADCALL (QREFELT $ 43)) (QREFELT $ 45))
                  (QREFELT $ 100))) 

(SDEFUN |STREAM;setfirst!;$2S;47| ((|x| $) (|s| S) ($ S))
        (SPADCALL |x| 0 |s| (QREFELT $ 55))) 

(SDEFUN |STREAM;setelt!;$first2S;48| ((|x| $) (T5 "first") (|s| S) ($ S))
        (SPADCALL |x| |s| (QREFELT $ 102))) 

(SDEFUN |STREAM;setrest!;3$;49| ((|x| $) (|y| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 18)) (|error| "setrest!: empty stream"))
         ('T (|STREAM;setrst!| |x| |y| $)))) 

(SDEFUN |STREAM;setelt!;$rest2$;50| ((|x| $) (T6 "rest") (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 98))) 

(SDEFUN |STREAM;setlast!;$2S;51| ((|x| $) (|s| S) ($ S))
        (COND
         ((SPADCALL |x| (QREFELT $ 18)) (|error| "setlast!: empty stream"))
         ('T (|STREAM;setfrst!| (SPADCALL |x| (QREFELT $ 51)) |s| $)))) 

(SDEFUN |STREAM;setelt!;$last2S;52| ((|x| $) (T7 "last") (|s| S) ($ S))
        (SPADCALL |x| |s| (QREFELT $ 107))) 

(SDEFUN |STREAM;split!;$Nni$;53| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|y| ($)) (#1=#:G1080 NIL))
               (SEQ
                (COND ((< |n| 1) (|error| "split!: index out of range"))
                      ((EQL |n| 1)
                       (SEQ
                        (LETT |y| (SPADCALL (QREFELT $ 43))
                              . #2=(|STREAM;split!;$Nni$;53|))
                        (|STREAM;setfrst!| |y| (SPADCALL |x| (QREFELT $ 11)) $)
                        (|STREAM;setrst!| |y| (SPADCALL |x| (QREFELT $ 15)) $)
                        (|STREAM;setToNil!| |x| $) (EXIT |y|)))
                      ('T
                       (SEQ (LETT |x| (|STREAM;expand!| |x| (- |n| 1) $) . #2#)
                            (LETT |x|
                                  (SPADCALL |x|
                                            (PROG1
                                                (LETT #1# (- (- |n| 1) 1)
                                                      . #2#)
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 88))
                                  . #2#)
                            (LETT |y| (SPADCALL |x| (QREFELT $ 31)) . #2#)
                            (|STREAM;setrst!| |x| (SPADCALL (QREFELT $ 43)) $)
                            (EXIT |y|))))))) 

(SDEFUN |STREAM;coerce;L$;54| ((|l| |List| S) ($ $))
        (SPADCALL |l| (QREFELT $ 53))) 

(SDEFUN |STREAM;repeating;L$;55| ((|l| |List| S) ($ $))
        (SPROG ((|x| ($)) (|x0| ($)))
               (SEQ
                (COND
                 ((NULL |l|)
                  (|error| "Need a non-null list to make a repeating stream."))
                 ('T
                  (SEQ
                   (LETT |x0|
                         (LETT |x| (SPADCALL |l| (QREFELT $ 53))
                               . #1=(|STREAM;repeating;L$;55|))
                         . #1#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (NULL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                      (QREFELT $ 18))))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 15)) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (|STREAM;setrst!| |x| |x0| $)))))))) 

(SDEFUN |STREAM;repeating?;L$B;56| ((|l| |List| S) (|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G1100 NIL) (#2=#:G1101 NIL) (|s| NIL) (|x0| ($)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL |l|)
                   (|error|
                    "Need a non-empty? list to make a repeating stream."))
                  ((NULL (CDR |l|))
                   (COND
                    ((OR (SPADCALL |x| (QREFELT $ 18))
                         (NULL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                    (|SPADfirst| |l|) (QREFELT $ 113))))
                     NIL)
                    ('T
                     (SPADCALL |x| (SPADCALL |x| (QREFELT $ 15))
                               (QREFELT $ 114)))))
                  ('T
                   (SEQ (LETT |x0| |x| . #3=(|STREAM;repeating?;L$B;56|))
                        (SEQ (LETT |s| NIL . #3#) (LETT #2# |l| . #3#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((OR (SPADCALL |x| (QREFELT $ 18))
                                     (SPADCALL |s|
                                               (SPADCALL |x| (QREFELT $ 11))
                                               (QREFELT $ 115)))
                                 (PROGN (LETT #1# NIL . #3#) (GO #4=#:G1099)))
                                ('T
                                 (LETT |x| (SPADCALL |x| (QREFELT $ 15))
                                       . #3#)))))
                             (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (SPADCALL |x| |x0| (QREFELT $ 23)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |STREAM;findCycle;Nni$R;57|
        ((|n| |NonNegativeInteger|) (|x| $)
         ($ |Record| (|:| |cycle?| (|Boolean|))
          (|:| |prefix| (|NonNegativeInteger|))
          (|:| |period| (|NonNegativeInteger|))))
        (SPROG
         ((|npp| #1=(|NonNegativeInteger|)) (|xp| ($))
          (|per| (|NonNegativeInteger|)) (|i| #1#) (|tl| ($)) (|hd| ($)))
         (SEQ (LETT |hd| |x| . #2=(|STREAM;findCycle;Nni$R;57|))
              (LETT |tl| (SPADCALL |x| |n| (QREFELT $ 88)) . #2#)
              (EXIT
               (COND ((SPADCALL |tl| (QREFELT $ 13)) (VECTOR NIL 0 0))
                     (#3='T
                      (SEQ (LETT |i| 0 . #2#)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (NULL (SPADCALL |x| |tl| (QREFELT $ 23))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |x| (SPADCALL |x| (QREFELT $ 15)) . #2#)
                                 (EXIT (LETT |i| (+ |i| 1) . #2#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND ((EQL |i| |n|) (VECTOR NIL 0 0))
                                  (#3#
                                   (SEQ
                                    (LETT |x| (SPADCALL |x| (QREFELT $ 15))
                                          . #2#)
                                    (LETT |per| 1 . #2#)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (NULL
                                             (SPADCALL |x| |tl|
                                                       (QREFELT $ 23))))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |x|
                                                (SPADCALL |x| (QREFELT $ 15))
                                                . #2#)
                                          (EXIT
                                           (LETT |per| (+ |per| 1) . #2#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (LETT |x| |hd| . #2#)
                                    (LETT |xp|
                                          (SPADCALL |hd| |per| (QREFELT $ 88))
                                          . #2#)
                                    (LETT |npp| 0 . #2#)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (NULL
                                             (SPADCALL |x| |xp|
                                                       (QREFELT $ 23))))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |x|
                                                (SPADCALL |x| (QREFELT $ 15))
                                                . #2#)
                                          (LETT |xp|
                                                (SPADCALL |xp| (QREFELT $ 15))
                                                . #2#)
                                          (EXIT
                                           (LETT |npp| (+ |npp| 1) . #2#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT (VECTOR 'T |npp| |per|))))))))))))) 

(SDEFUN |STREAM;delay;M$;58| ((|fs| |Mapping| $) ($ $))
        (CONS (QREFELT $ 8) |fs|)) 

(SDEFUN |STREAM;explicitEntries?;$B;59| ((|x| $) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 13)) NIL)
              ('T (NULL (SPADCALL |x| (QREFELT $ 14)))))) 

(SDEFUN |STREAM;numberOfComputedEntries;$Nni;60|
        ((|x| $) ($ |NonNegativeInteger|))
        (COND
         ((SPADCALL |x| (QREFELT $ 117))
          (+ (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 118)) 1))
         ('T 0))) 

(SDEFUN |STREAM;setrestt!| ((|x| $) (|n| |Integer|) (|y| $) ($ $))
        (COND ((EQL |n| 0) (|STREAM;setrst!| |x| |y| $))
              ('T
               (|STREAM;setrestt!| (SPADCALL |x| (QREFELT $ 15)) (- |n| 1) |y|
                $)))) 

(SDEFUN |STREAM;setrest!;$I2$;62| ((|x| $) (|n| |Integer|) (|y| $) ($ $))
        (SEQ
         (COND
          ((OR (< |n| 0) (SPADCALL |x| (QREFELT $ 18)))
           (|error| "setrest!: no such rest"))
          ('T
           (SEQ
            (LETT |x| (|STREAM;expand!| |x| (+ |n| 1) $)
                  |STREAM;setrest!;$I2$;62|)
            (EXIT (|STREAM;setrestt!| |x| |n| |y| $))))))) 

(SDEFUN |STREAM;stream;M$;63| ((|f| |Mapping| S) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;stream;M$;63!0| (VECTOR $ |f|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;stream;M$;63!0| (($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|STREAM;stream;M$;63|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |f|) (SPADCALL |f| (QREFELT $ 121))
                      (QREFELT $ 45)))))) 

(SDEFUN |STREAM;gen| ((|f| |Mapping| S S) (|s| S) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STREAM;gen!0| (VECTOR $ |f| |s|))
                          (QREFELT $ 47))))) 

(SDEFUN |STREAM;gen!0| (($$ NIL))
        (PROG (|s| |f| $)
          (LETT |s| (QREFELT $$ 2) . #1=(|STREAM;gen|))
          (LETT |f| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|ss| NIL))
                   (SEQ (LETT |ss| (SPADCALL |s| |f|) NIL)
                        (EXIT
                         (SPADCALL |ss| (|STREAM;gen| |f| |ss| $)
                                   (QREFELT $ 45))))))))) 

(SDEFUN |STREAM;stream;MS$;65| ((|f| |Mapping| S S) (|s| S) ($ $))
        (SPADCALL |s| (|STREAM;gen| |f| |s| $) (QREFELT $ 45))) 

(SDEFUN |STREAM;concat;3$;66| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;concat;3$;66!0| (VECTOR |y| $ |x|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;concat;3$;66!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;concat;3$;66|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) |y|)
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL (SPADCALL |x| (QREFELT $ 15)) |y|
                                       (QREFELT $ 78))
                             (QREFELT $ 45)))))))) 

(SDEFUN |STREAM;swhilee| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;swhilee!0| (VECTOR |p| $ |x|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;swhilee!0| (($$ NIL))
        (PROG (|x| $ |p|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;swhilee|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |x| (QREFELT $ 18))
                  (NULL (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)))
              (SPADCALL (QREFELT $ 43)))
             ('T
              (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                        (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15))
                                  (QREFELT $ 123))
                        (QREFELT $ 45)))))))) 

(SDEFUN |STREAM;filterWhile;M2$;68|
        ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 43)))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (COND ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|) |x|)
                     (#1='T (SPADCALL (QREFELT $ 43)))))
              (#1# (|STREAM;swhilee| |p| |x| $)))) 

(SDEFUN |STREAM;suntill| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;suntill!0| (VECTOR |p| $ |x|))
                         (QREFELT $ 47)))) 

(SDEFUN |STREAM;suntill!0| (($$ NIL))
        (PROG (|x| $ |p|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;suntill|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 43)))
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL (QREFELT $ 43)) (QREFELT $ 45)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 124))
                             (QREFELT $ 45)))))))) 

(SDEFUN |STREAM;filterUntil;M2$;70|
        ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 43)))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)
                 (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                           (SPADCALL (QREFELT $ 43)) (QREFELT $ 45)))
                (#1='T |x|)))
              (#1# (|STREAM;suntill| |p| |x| $)))) 

(DECLAIM (NOTINLINE |Stream;|)) 

(DEFUN |Stream| (#1=#:G1225)
  (SPROG NIL
         (PROG (#2=#:G1226)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Stream|)
                                               '|domainEqualList|)
                    . #3=(|Stream|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Stream;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Stream|)))))))))) 

(DEFUN |Stream;| (|#1|)
  (SPROG
   ((#1=#:G1221 NIL) (#2=#:G1222 NIL) (#3=#:G1224 NIL) (#4=#:G1223 NIL)
    (|pv$| NIL) (#5=#:G1219 NIL) (#6=#:G1220 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #7=(|Stream|))
    (LETT |dv$| (LIST '|Stream| DV$1) . #7#)
    (LETT $ (GETREFV 134) . #7#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #7#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #6#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #7#)
                                        (OR #5# #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))
                    . #7#))
    (|haddProp| |$ConstructorCache| '|Stream| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)) . #7#)
         (|augmentPredVector| $ 512))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #7#)
     (|augmentPredVector| $ 1024))
    (AND (OR #5# (AND (|HasCategory| |#1| '(|Comparable|)) #4#) #3#)
         (|augmentPredVector| $ 2048))
    (AND (OR (AND (|HasCategory| |#1| '(|Comparable|)) #4#) #3# #6#)
         (|augmentPredVector| $ 4096))
    (AND (OR (AND (|HasCategory| |#1| '(|Comparable|)) #4#) #3#)
         (|augmentPredVector| $ 8192))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #7#)
     (|augmentPredVector| $ 16384))
    (AND (OR #2# (AND (|HasCategory| |#1| '(|Comparable|)) #4#) #3# #6#)
         (|augmentPredVector| $ 32768))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #7#)
         (|augmentPredVector| $ 65536))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| $ 131072))
    (AND #4# #1# (|augmentPredVector| $ 262144))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 |$NullStream|)
    (QSETREFV $ 8 |$NonNullStream|)
    (QSETREFV $ 9 |$UninitializedStream|)
    (QSETREFV $ 10 (|Record| (|:| |firstElt| |#1|) (|:| |restOfStream| $)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 33
                 (CONS (|dispatchFunction| |STREAM;showElements;Nni$Of;10|) $))
       (QSETREFV $ 40
                 (CONS (|dispatchFunction| |STREAM;showAllElements;$Of;13|) $))
       (QSETREFV $ 41 (CONS (|dispatchFunction| |STREAM;showAll?;B;14|) $))
       (QSETREFV $ 42 (CONS (|dispatchFunction| |STREAM;coerce;$Of;15|) $)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 116
                (CONS (|dispatchFunction| |STREAM;repeating?;L$B;56|) $))))
    $))) 

(MAKEPROP '|Stream| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|NullStream|
              '|NonNullStream| '|UninitializedStream| '|Rep| |STREAM;frst;$S;4|
              (|Boolean|) |STREAM;explicitlyEmpty?;$B;1| |STREAM;lazy?;$B;2|
              |STREAM;rst;2$;5| (|Integer|) (0 . >) |STREAM;empty?;$B;38|
              (|OutputForm|) (6 . |coerce|) (|String|) (11 . |message|)
              (16 . |eq?|) (22 . |overbar|)
              (|Record| (|:| |cycle?| 12) (|:| |prefix| 26) (|:| |period| 26))
              (|NonNegativeInteger|) |STREAM;findCycle;Nni$R;57| (|List| $)
              (27 . |bracket|) |STREAM;first;$S;44| (32 . |rest|)
              (37 . |commaSeparate|) (42 . |showElements|) (48 . |extend|)
              (|Union| $$ '"failed") (|CyclicStreamTools| 6 $$)
              (54 . |cycleElt|) (59 . |computeCycleEntry|)
              (65 . |computeCycleLength|) (70 . |showAllElements|)
              (75 . |showAll?|) (79 . |coerce|) |STREAM;empty;$;35|
              |STREAM;copy;2$;17| |STREAM;concat;S2$;40| (|Mapping| $)
              |STREAM;delay;M$;58| (84 . |distance|) |STREAM;first;$Nni$;39|
              (90 . |complete|) (95 . |tail|) (|List| 6)
              |STREAM;construct;L$;18| |STREAM;elt;$IS;19|
              |STREAM;setelt!;$I2S;21| (|Mapping| 12 6) |STREAM;remove;M2$;23|
              |STREAM;select;M2$;25| (|Stream| 6) (|Mapping| 6 6)
              (|StreamFunctions2| 6 6) (100 . |map|) |STREAM;map;M2$;26|
              (|Mapping| 6 6 6) (|StreamFunctions3| 6 6 6) (106 . |map|)
              |STREAM;map;M3$;27| |STREAM;fill!;$S$;28| (113 . |cyclic?|)
              (118 . |cycleTail|) (123 . =) (129 . |explicitlyFinite?|)
              |STREAM;map!;M2$;29| (134 . |index?|) (|Void|)
              |STREAM;swap!;$2IV;30| |STREAM;concat;$S$;31|
              |STREAM;concat;3$;66| (|List| $$) (140 . |empty?|)
              (145 . |first|) (150 . |rest|) |STREAM;concat;L$;33|
              (|UniversalSegment| 16) (155 . |low|) (160 . |hasHi|)
              (165 . |high|) (170 . |rest|) |STREAM;setelt!;$Us2S;34|
              |STREAM;lazyEvaluate;2$;37| (176 . |Zero|) (180 . |Zero|)
              (184 . =) (190 . |One|) (194 . |One|) (198 . -)
              |STREAM;cons;S2$;41| |STREAM;setrest!;3$;49|
              |STREAM;cycleSplit!;2$;42| |STREAM;concat!;3$;45|
              |STREAM;concat!;$S$;46| |STREAM;setfirst!;$2S;47| '"first"
              |STREAM;setelt!;$first2S;48| '"rest" |STREAM;setelt!;$rest2$;50|
              |STREAM;setlast!;$2S;51| '"last" |STREAM;setelt!;$last2S;52|
              |STREAM;split!;$Nni$;53| |STREAM;coerce;L$;54|
              |STREAM;repeating;L$;55| (204 . =) (210 . =) (216 . ~=)
              (222 . |repeating?|) |STREAM;explicitEntries?;$B;59|
              |STREAM;numberOfComputedEntries;$Nni;60|
              |STREAM;setrest!;$I2$;62| (|Mapping| 6) |STREAM;stream;M$;63|
              |STREAM;stream;MS$;65| |STREAM;filterWhile;M2$;68|
              |STREAM;filterUntil;M2$;70| (|Mapping| 12 6 6) (|Equation| 6)
              (|List| 126) (|SingleInteger|) (|HashState|) '"value"
              (|InputForm|) (|List| 16) (|Union| 6 '"failed"))
           '#(~= 228 |value| 234 |trim| 239 |third| 245 |tail| 250 |swap!| 255
              |stream| 262 |split!| 273 |sorted?| 279 |sort!| 290 |sort| 301
              |smaller?| 312 |size?| 318 |showElements| 324 |showAllElements|
              330 |showAll?| 335 |setvalue!| 339 |setrest!| 345 |setlast!| 358
              |setfirst!| 364 |setelt!| 370 |setchildren!| 412 |select| 418
              |second| 424 |sample| 429 |rst| 433 |rightTrim| 438 |reverse!|
              444 |reverse| 449 |rest| 454 |repeating?| 465 |repeating| 471
              |removeDuplicates| 476 |remove| 481 |reduce| 493 |qsetrest!| 514
              |qsetfirst!| 520 |qsetelt!| 526 |qelt| 533 |possiblyInfinite?|
              539 |position| 544 |parts| 563 |numberOfComputedEntries| 568
              |nodes| 573 |node?| 578 |new| 584 |more?| 590 |minIndex| 596
              |min| 601 |merge| 607 |members| 620 |member?| 625 |maxIndex| 631
              |max| 636 |map!| 642 |map| 648 |less?| 661 |leftTrim| 667
              |leaves| 673 |leaf?| 678 |lazyEvaluate| 683 |lazy?| 688 |latex|
              693 |last| 698 |insert| 709 |indices| 723 |index?| 728
              |hashUpdate!| 734 |hash| 740 |frst| 745 |first| 750 |findCycle|
              761 |find| 767 |filterWhile| 773 |filterUntil| 779 |fill!| 785
              |extend| 791 |explicitlyFinite?| 797 |explicitlyEmpty?| 802
              |explicitEntries?| 807 |every?| 812 |eval| 818 |eq?| 844 |entry?|
              850 |entries| 856 |empty?| 861 |empty| 866 |elt| 870 |distance|
              913 |delete| 919 |delay| 931 |cyclic?| 936 |cycleTail| 941
              |cycleSplit!| 946 |cycleLength| 951 |cycleEntry| 956 |count| 961
              |copyInto!| 973 |copy| 980 |convert| 985 |construct| 990 |cons|
              995 |concat!| 1001 |concat| 1013 |complete| 1036 |coerce| 1041
              |children| 1051 |child?| 1056 |any?| 1062 >= 1068 > 1074 = 1080
              <= 1086 < 1092 |#| 1098)
           'NIL
           (CONS
            (|makeByteWordVec2| 8 '(0 0 0 0 0 0 0 0 0 0 2 1 0 0 0 0 2 1 8 3))
            (CONS
             '#(|LazyStreamAggregate&| |StreamAggregate&|
                |UnaryRecursiveAggregate&| |LinearAggregate&|
                |RecursiveAggregate&| |Collection&| |IndexedAggregate&|
                |HomogeneousAggregate&| |EltableAggregate&| |Aggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL NIL |InnerEvalable&|
                |BasicType&| NIL NIL)
             (CONS
              '#((|LazyStreamAggregate| 6) (|StreamAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|Collection| 6)
                 (|IndexedAggregate| 16 6) (|HomogeneousAggregate| 6)
                 (|EltableAggregate| 16 6) (|Aggregate|) (|Evalable| 6)
                 (|SetCategory|) (|shallowlyMutable|) (|Eltable| 84 $$)
                 (|Eltable| 16 6) (|Type|) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 19) (|ConvertibleTo| 131))
              (|makeByteWordVec2| 133
                                  '(2 16 12 0 0 17 1 6 19 0 20 1 19 0 21 22 2 0
                                    12 0 0 23 1 19 0 0 24 1 19 0 28 29 1 0 0 0
                                    31 1 19 0 28 32 2 0 19 26 0 33 2 0 0 0 16
                                    34 1 36 35 2 37 2 36 2 2 2 38 1 36 26 2 39
                                    1 0 19 0 40 0 0 12 41 1 0 19 0 42 2 0 16 0
                                    0 48 1 0 0 0 50 1 0 0 0 51 2 61 59 60 59 62
                                    3 65 59 64 59 59 66 1 0 12 0 69 1 0 0 0 70
                                    2 10 12 2 2 71 1 0 12 0 72 2 0 12 16 0 74 1
                                    79 12 0 80 1 79 2 0 81 1 79 0 0 82 1 84 16
                                    0 85 1 84 12 0 86 1 84 16 0 87 2 0 0 0 26
                                    88 0 26 0 91 0 16 0 92 2 26 12 0 0 93 0 26
                                    0 94 0 16 0 95 2 16 0 0 0 96 2 6 12 0 0 113
                                    2 0 12 0 0 114 2 6 12 0 0 115 2 0 12 52 0
                                    116 2 16 12 0 0 1 1 0 6 0 1 2 15 0 0 6 1 1
                                    0 6 0 1 1 0 0 0 51 3 17 75 0 16 16 76 1 0 0
                                    120 121 2 0 0 60 6 122 2 17 0 0 26 110 1 11
                                    12 0 1 2 10 12 125 0 1 1 18 0 0 1 2 19 0
                                    125 0 1 1 11 0 0 1 2 10 0 125 0 1 2 14 12 0
                                    0 1 2 0 12 0 26 1 2 1 19 26 0 33 1 1 19 0
                                    40 0 1 12 41 2 17 6 0 6 1 2 17 0 0 0 98 3 0
                                    0 0 16 0 119 2 17 6 0 6 107 2 17 6 0 6 102
                                    3 17 6 0 16 6 55 3 17 6 0 84 6 89 3 17 6 0
                                    108 6 109 3 17 0 0 105 0 106 3 17 6 0 103 6
                                    104 3 17 6 0 130 6 1 2 17 0 0 28 1 2 0 0 56
                                    0 58 1 0 6 0 1 0 0 0 1 1 0 0 0 15 2 15 0 0
                                    6 1 1 19 0 0 1 1 10 0 0 1 2 0 0 0 26 88 1 0
                                    0 0 31 2 1 12 52 0 116 1 0 0 52 112 1 15 0
                                    0 1 2 15 0 6 0 1 2 0 0 56 0 57 4 15 6 64 0
                                    6 6 1 3 10 6 64 0 6 1 2 10 6 64 0 1 2 17 0
                                    0 0 1 2 17 6 0 6 1 3 17 6 0 16 6 1 2 0 6 0
                                    16 1 1 0 12 0 1 2 15 16 6 0 1 3 15 16 6 0
                                    16 1 2 10 16 56 0 1 1 10 52 0 1 1 0 26 0
                                    118 1 0 28 0 1 2 4 12 0 0 1 2 0 0 26 6 1 2
                                    0 12 0 26 1 1 9 16 0 1 2 11 0 0 0 1 2 11 0
                                    0 0 1 3 10 0 125 0 0 1 1 10 52 0 1 2 15 12
                                    6 0 1 1 9 16 0 1 2 11 0 0 0 1 2 17 0 60 0
                                    73 3 0 0 64 0 0 67 2 0 0 60 0 63 2 0 12 0
                                    26 1 2 15 0 0 6 1 1 0 52 0 1 1 0 12 0 1 1 0
                                    0 0 90 1 0 12 0 14 1 13 21 0 1 2 0 0 0 26 1
                                    1 0 6 0 1 3 0 0 0 0 16 1 3 0 0 6 0 16 1 1 0
                                    132 0 1 2 0 12 16 0 74 2 13 129 129 0 1 1
                                    13 128 0 1 1 0 6 0 11 2 0 0 0 26 49 1 0 6 0
                                    30 2 0 25 26 0 27 2 0 133 56 0 1 2 0 0 56 0
                                    123 2 0 0 56 0 124 2 17 0 0 6 68 2 0 0 0 16
                                    34 1 0 12 0 72 1 0 12 0 13 1 0 12 0 117 2
                                    10 12 56 0 1 3 2 0 0 52 52 1 2 2 0 0 126 1
                                    3 2 0 0 6 6 1 2 2 0 0 127 1 2 0 12 0 0 23 2
                                    15 12 6 0 1 1 0 52 0 1 1 0 12 0 18 0 0 0 43
                                    3 0 6 0 16 6 1 2 0 6 0 16 54 2 0 0 0 84 1 2
                                    0 6 0 108 1 2 0 0 0 105 1 2 0 6 0 103 1 2 0
                                    6 0 130 1 2 0 16 0 0 48 2 0 0 0 16 1 2 0 0
                                    0 84 1 1 0 0 46 47 1 0 12 0 69 1 0 0 0 70 1
                                    17 0 0 99 1 0 26 0 1 1 0 0 0 1 2 15 26 6 0
                                    1 2 10 26 56 0 1 3 19 0 0 0 16 1 1 0 0 0 44
                                    1 3 131 0 1 1 0 0 52 53 2 0 0 6 0 97 2 17 0
                                    0 6 101 2 17 0 0 0 100 1 0 0 28 83 2 0 0 0
                                    6 77 2 0 0 6 0 45 2 0 0 0 0 78 1 0 0 0 50 1
                                    12 19 0 42 1 0 0 52 111 1 0 28 0 1 2 4 12 0
                                    0 1 2 10 12 56 0 1 2 11 12 0 0 1 2 11 12 0
                                    0 1 2 16 12 0 0 114 2 11 12 0 0 1 2 11 12 0
                                    0 1 1 10 26 0 1)))))
           '|lookupComplete|)) 
