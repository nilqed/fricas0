
(SDEFUN |SCONF;spnt;2Df$;1| ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) ($ $))
        (SPROG ((|z| ($)) (|inf| (|DoubleFloat|)))
               (SEQ
                (LETT |inf|
                      (|mul_DF|
                       (|add_DF| (|mul_DF| |a| |a|) (|mul_DF| |b| |b|))
                       (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                 (QREFELT $ 14))))
                (LETT |z| (MAKEARR1 (QREFELT $ 7) 0.0))
                (QSETAREF1 |z| 1 (|minus_DF| 1.0)) (QSETAREF1 |z| 2 |inf|)
                (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|) (EXIT |z|)))) 

(SDEFUN |SCONF;spnt;3Df$;2|
        ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) (|c| . #1#) ($ $))
        (SPROG ((|z| ($)) (|inf| (|DoubleFloat|)))
               (SEQ
                (LETT |inf|
                      (|mul_DF|
                       (|add_DF|
                        (|add_DF| (|mul_DF| |a| |a|) (|mul_DF| |b| |b|))
                        (|mul_DF| |c| |c|))
                       (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                 (QREFELT $ 14))))
                (LETT |z| (MAKEARR1 (QREFELT $ 7) 0.0))
                (QSETAREF1 |z| 1 (|minus_DF| 1.0)) (QSETAREF1 |z| 2 |inf|)
                (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|)
                (COND ((> (QREFELT $ 6) 2) (QSETAREF1 |z| 16 |c|)))
                (EXIT |z|)))) 

(SDEFUN |SCONF;svec;2Df$;3| ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) ($ $))
        (SPROG ((|z| ($)))
               (SEQ (LETT |z| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (QSETAREF1 |z| 1 0.0) (QSETAREF1 |z| 2 0.0)
                    (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|) (EXIT |z|)))) 

(SDEFUN |SCONF;svec;3Df$;4|
        ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) (|c| . #1#) ($ $))
        (SPROG ((|z| ($)))
               (SEQ (LETT |z| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (QSETAREF1 |z| 1 0.0) (QSETAREF1 |z| 2 0.0)
                    (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|)
                    (COND ((> (QREFELT $ 6) 2) (QSETAREF1 |z| 16 |c|)))
                    (EXIT |z|)))) 

(SDEFUN |SCONF;min;3$;5| ((|a| $) (|b| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (QSETAREF1 |pt| 8 (|min_DF| (QAREF1 |a| 8) (QAREF1 |b| 8)))
                    (QSETAREF1 |pt| 4 (|min_DF| (QAREF1 |a| 4) (QAREF1 |b| 4)))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                          (QREFELT $ 14))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;max;3$;6| ((|a| $) (|b| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (QSETAREF1 |pt| 8 (|max_DF| (QAREF1 |a| 8) (QAREF1 |b| 8)))
                    (QSETAREF1 |pt| 4 (|max_DF| (QAREF1 |a| 4) (QAREF1 |b| 4)))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                          (QREFELT $ 14))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(PUT '|SCONF;dimension;$Pi;7| '|SPADreplace| '(XLAM (|p|) 2)) 

(SDEFUN |SCONF;dimension;$Pi;7| ((|p| $) ($ |PositiveInteger|)) 2) 

(SDEFUN |SCONF;nan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 24))) 

(SDEFUN |SCONF;Pnan?;$B;9| ((|p| $) ($ |Boolean|))
        (SPROG ((#1=#:G410 NIL) (#2=#:G411 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 7) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((|SCONF;nan?| (QAREF1 |p| |i|) $)
                           (PROGN (LETT #1# 'T) (GO #3=#:G409))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |SCONF;unitVector;2$;10| ((|p| $) ($ $))
        (SPROG ((|pt| ($)) (|factor| (|DoubleFloat|)))
               (SEQ
                (LETT |factor|
                      (SPADCALL
                       (|add_DF| (|mul_DF| (QAREF1 |p| 4) (QAREF1 |p| 4))
                                 (|mul_DF| (QAREF1 |p| 8) (QAREF1 |p| 8)))
                       (QREFELT $ 26)))
                (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                (QSETAREF1 |pt| 4 (|div_DF| (QAREF1 |p| 4) |factor|))
                (QSETAREF1 |pt| 8 (|div_DF| (QAREF1 |p| 8) |factor|))
                (QSETAREF1 |pt| 2
                           (|mul_DF|
                            (|add_DF|
                             (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                             (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                      (QREFELT $ 14))))
                (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(PUT '|SCONF;distanceSquared;2$Df;11| '|SPADreplace| '(XLAM (|p1| |p2|) 1.0)) 

(SDEFUN |SCONF;distanceSquared;2$Df;11| ((|p1| $) (|p2| $) ($ |DoubleFloat|))
        1.0) 

(SDEFUN |SCONF;parallel;2$Df;12| ((|x| $) (|y| $) ($ |DoubleFloat|))
        (|add_DF| (|mul_DF| (QAREF1 |x| 6) (QAREF1 |y| 6))
                  (|mul_DF| (QAREF1 |x| 10) (QAREF1 |y| 10)))) 

(SDEFUN |SCONF;perpendicular;3$;13| ((|x| $) (|y| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (QSETAREF1 |pt| 4 0.0) (QSETAREF1 |pt| 8 1.0)
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                          (QREFELT $ 14))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;*;Df2$;14| ((|s| |DoubleFloat|) (|x| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (QSETAREF1 |pt| 4 (|mul_DF| (QAREF1 |x| 4) |s|))
                    (QSETAREF1 |pt| 8 (|mul_DF| (QAREF1 |x| 8) |s|))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                          (QREFELT $ 14))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;+;3$;15| ((|x| $) (|y| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (QSETAREF1 |pt| 4 (|add_DF| (QAREF1 |x| 4) (QAREF1 |y| 4)))
                    (QSETAREF1 |pt| 8 (|add_DF| (QAREF1 |x| 8) (QAREF1 |y| 8)))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                          (QREFELT $ 14))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;-;3$;16| ((|x| $) (|y| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (QSETAREF1 |pt| 4 (|sub_DF| (QAREF1 |x| 4) (QAREF1 |y| 4)))
                    (QSETAREF1 |pt| 8 (|sub_DF| (QAREF1 |x| 8) (QAREF1 |y| 8)))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 12))
                                          (QREFELT $ 14))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;inBounds?;3$B;17| ((|pt| $) (|mns| $) (|mxs| $) ($ |Boolean|))
        (COND
         ((OR (|less_DF| (QAREF1 |pt| 4) (QAREF1 |mns| 4))
              (OR (SPADCALL (QAREF1 |pt| 4) (QAREF1 |mxs| 4) (QREFELT $ 34))
                  (|less_DF| (QAREF1 |pt| 8) (QAREF1 |mns| 8))))
          NIL)
         ('T
          (NULL (SPADCALL (QAREF1 |pt| 8) (QAREF1 |mxs| 8) (QREFELT $ 34)))))) 

(PUT '|SCONF;screenCoordX;$Df;18| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 4))) 

(SDEFUN |SCONF;screenCoordX;$Df;18| ((|pt| $) ($ |DoubleFloat|))
        (QAREF1 |pt| 4)) 

(PUT '|SCONF;screenCoordY;$Df;19| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 8))) 

(SDEFUN |SCONF;screenCoordY;$Df;19| ((|pt| $) ($ |DoubleFloat|))
        (QAREF1 |pt| 8)) 

(SDEFUN |SCONF;screenCoordZ;$Df;20| ((|pt| $) ($ |DoubleFloat|))
        (COND ((> (QREFELT $ 6) 2) (QAREF1 |pt| 16)) ('T 0.0))) 

(SDEFUN |SCONF;screenCoords;$L;21| ((|pt| $) ($ |List| (|DoubleFloat|)))
        (SPROG ((#1=#:G434 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> (QREFELT $ 6) 2)
                    (PROGN
                     (LETT #1#
                           (LIST (QAREF1 |pt| 4) (QAREF1 |pt| 8)
                                 (QAREF1 |pt| 16)))
                     (GO #2=#:G433))))
                  (EXIT (LIST (QAREF1 |pt| 4) (QAREF1 |pt| 8)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCONF;extendedCoords;$L;22| ((|pt| $) ($ |List| (|DoubleFloat|)))
        (SPADCALL |pt| (QREFELT $ 41))) 

(SDEFUN |SCONF;normalisePoint;2$;23| ((|pt| $) ($ $))
        (SPROG
         ((|infin| (|DoubleFloat|)) (|index| (|PositiveInteger|))
          (#1=#:G446 NIL) (|x| NIL) (|pt2| ($)) (#2=#:G445 NIL)
          (|scaleFactor| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |scaleFactor| (QAREF1 |pt| 1))
                (COND
                 ((|less_DF| |scaleFactor|
                             (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 12))
                                       (QREFELT $ 14)))
                  (COND
                   ((SPADCALL |scaleFactor|
                              (|minus_DF|
                               (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 12))
                                         (QREFELT $ 14)))
                              (QREFELT $ 34))
                    (SEQ
                     (SPADCALL
                      (SPADCALL "can't apply normalisePoint to a vector"
                                (QREFELT $ 45))
                      (QREFELT $ 47))
                     (EXIT (PROGN (LETT #2# |pt|) (GO #3=#:G444))))))))
                (COND
                 ((|less_DF| |scaleFactor|
                             (|minus_DF|
                              (SPADCALL (SPADCALL 99 -2 10 (QREFELT $ 12))
                                        (QREFELT $ 14))))
                  (COND
                   ((SPADCALL |scaleFactor|
                              (|minus_DF|
                               (SPADCALL (SPADCALL 101 -2 10 (QREFELT $ 12))
                                         (QREFELT $ 14)))
                              (QREFELT $ 34))
                    (PROGN (LETT #2# |pt|) (GO #3#))))))
                (LETT |pt2| (MAKEARR1 (QREFELT $ 7) 0.0)) (LETT |infin| 0.0)
                (SEQ (LETT |x| 1) (LETT #1# (QREFELT $ 6)) G190
                     (COND ((|greater_SI| |x| #1#) (GO G191)))
                     (SEQ (LETT |index| (EXPT 2 (+ |x| 1)))
                          (QSETAREF1 |pt2| |index|
                                     (|div_DF| (QAREF1 |pt| |index|)
                                               (|minus_DF| |scaleFactor|)))
                          (EXIT
                           (LETT |infin|
                                 (|add_DF| |infin|
                                           (|mul_DF|
                                            (|mul_DF| (QAREF1 |pt2| |index|)
                                                      (QAREF1 |pt2| |index|))
                                            (SPADCALL
                                             (SPADCALL 5 -1 10 (QREFELT $ 12))
                                             (QREFELT $ 14)))))))
                     (LETT |x| (|inc_SI| |x|)) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt2| 1 (|minus_DF| 1.0))
                (QSETAREF1 |pt2| 2 |infin|) (EXIT |pt2|)))
          #3# (EXIT #2#)))) 

(SDEFUN |SCONF;toPoint;2$;24| ((|p| $) ($ $))
        (SPROG ((#1=#:G450 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 7) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;toVector;2$;25| ((|p| $) ($ $))
        (SPROG ((#1=#:G454 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 7) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 7) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| 1 0.0) (EXIT |pt|)))) 

(SDEFUN |SCONF;isPoint?;$B;26| ((|p| $) ($ |Boolean|))
        (|less_DF| (QAREF1 |p| 1)
                   (|minus_DF|
                    (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 12))
                              (QREFELT $ 14))))) 

(SDEFUN |SCONF;isVector?;$B;27| ((|p| $) ($ |Boolean|))
        (SPADCALL (QAREF1 |p| 1)
                  (|minus_DF|
                   (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 12)) (QREFELT $ 14)))
                  (QREFELT $ 34))) 

(PUT '|SCONF;hash;$Si;28| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |SCONF;hash;$Si;28| ((|s| $) ($ |SingleInteger|)) 0) 

(SDEFUN |SCONF;=;2$B;29| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G462 NIL) (#2=#:G463 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 7) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|)
                                     (QREFELT $ 24))
                           (PROGN (LETT #1# NIL) (GO #3=#:G461))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |SCONF;~=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 55)))) 

(SDEFUN |SCONF;coerce;$Of;31| ((|pt| $) ($ |OutputForm|))
        (SPROG
         ((|eles| (|List| (|OutputForm|))) (#1=#:G469 NIL) (|i| NIL)
          (#2=#:G468 NIL))
         (SEQ
          (LETT |eles|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 7) 1)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL (QAREF1 |pt| |i|) (QREFELT $ 57))
                                    #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL |eles| (QREFELT $ 59)))))) 

(DECLAIM (NOTINLINE |SConformal;|)) 

(DEFUN |SConformal| (#1=#:G470)
  (SPROG NIL
         (PROG (#2=#:G471)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SConformal|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SConformal;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SConformal|)))))))))) 

(DEFUN |SConformal;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SConformal| DV$1))
          (LETT $ (GETREFV 62))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SConformal| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (EXPT 2 (+ |#1| 2)))
          (QSETREFV $ 8 (|PrimitiveArray| (|DoubleFloat|)))
          $))) 

(MAKEPROP '|SConformal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|dim| '|Rep| (|Integer|)
              (|PositiveInteger|) (|Float|) (0 . |float|) (|DoubleFloat|)
              (7 . |coerce|) |SCONF;spnt;2Df$;1| |SCONF;spnt;3Df$;2|
              |SCONF;svec;2Df$;3| |SCONF;svec;3Df$;4| |SCONF;min;3$;5|
              (12 . |elt|) |SCONF;max;3$;6| |SCONF;dimension;$Pi;7| (|Boolean|)
              (18 . ~=) |SCONF;Pnan?;$B;9| (24 . |sqrt|)
              |SCONF;unitVector;2$;10| |SCONF;distanceSquared;2$Df;11|
              |SCONF;parallel;2$Df;12| |SCONF;perpendicular;3$;13|
              |SCONF;*;Df2$;14| |SCONF;+;3$;15| |SCONF;-;3$;16| (29 . >)
              |SCONF;inBounds?;3$B;17| |SCONF;screenCoordX;$Df;18|
              |SCONF;screenCoordY;$Df;19| |SCONF;screenCoordZ;$Df;20|
              (|List| 13) |SCONF;screenCoords;$L;21| (35 . |entries|)
              |SCONF;extendedCoords;$L;22| (|String|) (|OutputForm|)
              (40 . |message|) (|Void|) (45 . |print|)
              |SCONF;normalisePoint;2$;23| |SCONF;toPoint;2$;24|
              |SCONF;toVector;2$;25| |SCONF;isPoint?;$B;26|
              |SCONF;isVector?;$B;27| (|SingleInteger|) |SCONF;hash;$Si;28|
              |SCONF;=;2$B;29| |SCONF;~=;2$B;30| (50 . |coerce|) (|List| $)
              (55 . |paren|) |SCONF;coerce;$Of;31| (|HashState|))
           '#(~= 60 |unitVector| 66 |toVector| 71 |toPoint| 76 |svec| 81 |spnt|
              94 |sivec| 107 |sipnt| 120 |screenCoords| 133 |screenCoordZ| 138
              |screenCoordY| 143 |screenCoordX| 148 |perpendicular| 153
              |parallel| 159 |normalisePoint| 165 |min| 170 |max| 176 |latex|
              182 |isVector?| 187 |isPoint?| 192 |inBounds?| 197 |hashUpdate!|
              204 |hash| 210 |extendedCoords| 215 |distanceSquared| 220
              |distance| 226 |dimension| 232 |colinearity| 237 |coerce| 243
              |Pnan?| 248 = 253 - 259 + 265 * 271)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SPointCategory&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SPointCategory|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 44))
                        (|makeByteWordVec2| 61
                                            '(3 11 0 9 9 10 12 1 11 13 0 14 2 8
                                              13 0 9 20 2 13 23 0 0 24 1 13 0 0
                                              26 2 13 23 0 0 34 1 8 39 0 41 1
                                              44 0 43 45 1 44 46 0 47 1 13 44 0
                                              57 1 44 0 58 59 2 0 23 0 0 56 1 0
                                              0 0 27 1 0 0 0 50 1 0 0 0 49 3 0
                                              0 13 13 13 18 2 0 0 13 13 17 3 0
                                              0 13 13 13 16 2 0 0 13 13 15 3 0
                                              0 9 9 9 1 2 0 0 9 9 1 3 0 0 9 9 9
                                              1 2 0 0 9 9 1 1 0 39 0 40 1 0 13
                                              0 38 1 0 13 0 37 1 0 13 0 36 2 0
                                              0 0 0 30 2 0 13 0 0 29 1 0 0 0 48
                                              2 0 0 0 0 19 2 0 0 0 0 21 1 0 43
                                              0 1 1 0 23 0 52 1 0 23 0 51 3 0
                                              23 0 0 0 35 2 0 61 61 0 1 1 0 53
                                              0 54 1 0 39 0 42 2 0 13 0 0 28 2
                                              0 13 0 0 1 1 0 10 0 22 2 0 13 0 0
                                              1 1 0 44 0 60 1 0 23 0 25 2 0 23
                                              0 0 55 2 0 0 0 0 33 2 0 0 0 0 32
                                              2 0 0 13 0 31)))))
           '|lookupComplete|)) 
