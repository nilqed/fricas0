
(SDEFUN |SOLVEFOR;mapSolve;UPMR;1|
        ((|p| UP) (|fn| |Mapping| F F)
         ($ |Record| (|:| |solns| (|List| F))
          (|:| |maps| (|List| (|Record| (|:| |arg| F) (|:| |res| F))))))
        (SPROG ((|locmap| (|Mapping| F F)) (|slist| (|List| F)))
               (SEQ (LETT |locmap| |fn| . #1=(|SOLVEFOR;mapSolve;UPMR;1|))
                    (SETELT $ 10 (IDENTITY |locmap|)) (SETELT $ 9 'T)
                    (SETELT $ 8 NIL)
                    (LETT |slist| (SPADCALL |p| (QREFELT $ 12)) . #1#)
                    (SETELT $ 9 NIL)
                    (LETT |locmap| (LIST #'|SOLVEFOR;mapSolve;UPMR;1!0|) . #1#)
                    (SETELT $ 10 (IDENTITY |locmap|))
                    (EXIT (CONS |slist| (QREFELT $ 8)))))) 

(SDEFUN |SOLVEFOR;mapSolve;UPMR;1!0| ((|x| NIL) ($$ NIL)) (IDENTITY |x|)) 

(SDEFUN |SOLVEFOR;part| ((|s| F) ($ F))
        (SPROG ((|t| (F)))
               (SEQ
                (COND
                 ((QREFELT $ 9)
                  (SEQ (LETT |t| (SPADCALL |s| (QREFELT $ 10)) |SOLVEFOR;part|)
                       (EXIT
                        (COND ((SPADCALL |t| |s| (QREFELT $ 18)) |s|)
                              (#1='T
                               (SEQ
                                (SETELT $ 8
                                        (CONS (CONS |t| |s|) (QREFELT $ 8)))
                                (EXIT |t|)))))))
                 (#1# |s|))))) 

(SDEFUN |SOLVEFOR;intsolve| ((|u| UP) ($ |List| F))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |u|
                      (QCAR
                       (SPADCALL
                        (SPADCALL (SPADCALL |u| (QREFELT $ 20)) (QREFELT $ 24))
                        1 (QREFELT $ 26)))
                      . #1=(|SOLVEFOR;intsolve|))
                (LETT |n| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SPADCALL (SPADCALL |u| 1 (QREFELT $ 31))
                             (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 34)))
                  ((EQL |n| 2)
                   (SPADCALL (SPADCALL |u| 2 (QREFELT $ 31))
                             (SPADCALL |u| 1 (QREFELT $ 31))
                             (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 35)))
                  ((EQL |n| 3)
                   (SPADCALL (SPADCALL |u| 3 (QREFELT $ 31))
                             (SPADCALL |u| 2 (QREFELT $ 31))
                             (SPADCALL |u| 1 (QREFELT $ 31))
                             (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 36)))
                  ((EQL |n| 4)
                   (SPADCALL (SPADCALL |u| 4 (QREFELT $ 31))
                             (SPADCALL |u| 3 (QREFELT $ 31))
                             (SPADCALL |u| 2 (QREFELT $ 31))
                             (SPADCALL |u| 1 (QREFELT $ 31))
                             (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 37)))
                  ('T
                   (|error|
                    "All sqfr factors of polynomial must be of degree < 5"))))))) 

(SDEFUN |SOLVEFOR;solve;UPL;4| ((|u| UP) ($ |List| F))
        (SPROG
         ((|ls| (|List| F)) (#1=#:G749 NIL) (|i| NIL) (|lsf| (|List| F))
          (#2=#:G748 NIL) (|f| NIL))
         (SEQ (LETT |ls| NIL . #3=(|SOLVEFOR;solve;UPL;4|))
              (SEQ (LETT |f| NIL . #3#)
                   (LETT #2#
                         (SPADCALL (SPADCALL |u| (QREFELT $ 20))
                                   (QREFELT $ 24))
                         . #3#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |lsf| (|SOLVEFOR;intsolve| (QCAR |f|) $) . #3#)
                        (EXIT
                         (SEQ (LETT |i| 1 . #3#) (LETT #1# (QCDR |f|) . #3#)
                              G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |ls| (SPADCALL |lsf| |ls| (QREFELT $ 38))
                                      . #3#)))
                              (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |ls|)))) 

(SDEFUN |SOLVEFOR;particularSolution;UPF;5| ((|u| UP) ($ F))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |u|
                      (QCAR
                       (SPADCALL
                        (SPADCALL (SPADCALL |u| (QREFELT $ 20)) (QREFELT $ 24))
                        1 (QREFELT $ 26)))
                      . #1=(|SOLVEFOR;particularSolution;UPF;5|))
                (LETT |n| (SPADCALL |u| (QREFELT $ 28)) . #1#)
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SPADCALL (SPADCALL |u| 1 (QREFELT $ 31))
                             (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 39)))
                  ((EQL |n| 2)
                   (SPADCALL (SPADCALL |u| 2 (QREFELT $ 31))
                             (SPADCALL |u| 1 (QREFELT $ 31))
                             (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 40)))
                  ((EQL |n| 3)
                   (SPADCALL (SPADCALL |u| 3 (QREFELT $ 31))
                             (SPADCALL |u| 2 (QREFELT $ 31))
                             (SPADCALL |u| 1 (QREFELT $ 31))
                             (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 41)))
                  ((EQL |n| 4)
                   (SPADCALL (SPADCALL |u| 4 (QREFELT $ 31))
                             (SPADCALL |u| 3 (QREFELT $ 31))
                             (SPADCALL |u| 2 (QREFELT $ 31))
                             (SPADCALL |u| 1 (QREFELT $ 31))
                             (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 42)))
                  ('T
                   (|error|
                    "All sqfr factors of polynomial must be of degree < 5"))))))) 

(SDEFUN |SOLVEFOR;needDegree| ((|n| |Integer|) (|u| UP) ($ |Boolean|))
        (COND ((EQL (SPADCALL |u| (QREFELT $ 28)) |n|) 'T)
              ('T
               (|error|
                (STRCONC "Polynomial must be of degree " (STRINGIMAGE |n|)))))) 

(SDEFUN |SOLVEFOR;needLcoef| ((|cn| F) ($ |Boolean|))
        (COND ((SPADCALL |cn| (|spadConstant| $ 33) (QREFELT $ 44)) 'T)
              ('T (|error| "Leading coefficient must not be 0.")))) 

(SDEFUN |SOLVEFOR;needChar0| (($ |Boolean|))
        (COND ((EQL (SPADCALL (QREFELT $ 45)) 0) 'T)
              ('T
               (|error|
                "Formula defined only for fields of characteristic 0.")))) 

(SDEFUN |SOLVEFOR;linear;UPL;9| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 1 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 1 (QREFELT $ 31))
                        (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 34))))) 

(SDEFUN |SOLVEFOR;quadratic;UPL;10| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 2 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 2 (QREFELT $ 31))
                        (SPADCALL |u| 1 (QREFELT $ 31))
                        (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 35))))) 

(SDEFUN |SOLVEFOR;cubic;UPL;11| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 3 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 3 (QREFELT $ 31))
                        (SPADCALL |u| 2 (QREFELT $ 31))
                        (SPADCALL |u| 1 (QREFELT $ 31))
                        (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 36))))) 

(SDEFUN |SOLVEFOR;quartic;UPL;12| ((|u| UP) ($ |List| F))
        (SEQ (|SOLVEFOR;needDegree| 4 |u| $)
             (EXIT
              (SPADCALL (SPADCALL |u| 4 (QREFELT $ 31))
                        (SPADCALL |u| 3 (QREFELT $ 31))
                        (SPADCALL |u| 2 (QREFELT $ 31))
                        (SPADCALL |u| 1 (QREFELT $ 31))
                        (SPADCALL |u| 0 (QREFELT $ 31)) (QREFELT $ 37))))) 

(SDEFUN |SOLVEFOR;equ| ((|x| F) (|y| F) ($ |Boolean|))
        (COND
         ((QEQCAR (SPADCALL (SPADCALL |x| |y| (QREFELT $ 50)) (QREFELT $ 52))
                  1)
          'T)
         ('T NIL))) 

(SDEFUN |SOLVEFOR;linear;2FL;14| ((|c1| F) (|c0| F) ($ |List| F))
        (SEQ (|SOLVEFOR;needLcoef| |c1| $)
             (EXIT
              (LIST
               (SPADCALL (SPADCALL |c0| |c1| (QREFELT $ 53)) (QREFELT $ 54)))))) 

(SDEFUN |SOLVEFOR;aLinear;3F;15| ((|c1| F) (|c0| F) ($ F))
        (|SPADfirst| (SPADCALL |c1| |c0| (QREFELT $ 34)))) 

(SDEFUN |SOLVEFOR;quadratic;3FL;16| ((|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG ((D (F)))
               (SEQ (|SOLVEFOR;needLcoef| |c2| $) (|SOLVEFOR;needChar0| $)
                    (EXIT
                     (COND
                      ((SPADCALL |c0| (|spadConstant| $ 33) (QREFELT $ 18))
                       (CONS (|spadConstant| $ 33)
                             (SPADCALL |c2| |c1| (QREFELT $ 34))))
                      ((SPADCALL |c1| (|spadConstant| $ 33) (QREFELT $ 18))
                       (LIST
                        (SPADCALL
                         (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 53))
                                   (QREFELT $ 54))
                         (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 53))
                                    (QREFELT $ 54))
                          (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                         (QREFELT $ 54))))
                      ('T
                       (SEQ
                        (LETT D
                              (SPADCALL
                               (|SOLVEFOR;part|
                                (SPADCALL (SPADCALL |c1| 2 (QREFELT $ 59))
                                          (SPADCALL
                                           (SPADCALL 4 |c2| (QREFELT $ 60))
                                           |c0| (QREFELT $ 61))
                                          (QREFELT $ 50))
                                $)
                               (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                              |SOLVEFOR;quadratic;3FL;16|)
                        (EXIT
                         (LIST
                          (SPADCALL
                           (SPADCALL (SPADCALL |c1| (QREFELT $ 54)) D
                                     (QREFELT $ 62))
                           (SPADCALL 2 |c2| (QREFELT $ 60)) (QREFELT $ 53))
                          (SPADCALL
                           (SPADCALL (SPADCALL |c1| (QREFELT $ 54)) D
                                     (QREFELT $ 50))
                           (SPADCALL 2 |c2| (QREFELT $ 60))
                           (QREFELT $ 53))))))))))) 

(SDEFUN |SOLVEFOR;aQuadratic;4F;17| ((|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG ((D (F)))
               (SEQ (|SOLVEFOR;needLcoef| |c2| $) (|SOLVEFOR;needChar0| $)
                    (EXIT
                     (COND
                      ((SPADCALL |c0| (|spadConstant| $ 33) (QREFELT $ 18))
                       (|spadConstant| $ 33))
                      ((SPADCALL |c1| (|spadConstant| $ 33) (QREFELT $ 18))
                       (SPADCALL
                        (SPADCALL (SPADCALL |c0| |c2| (QREFELT $ 53))
                                  (QREFELT $ 54))
                        (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57)))
                      ('T
                       (SEQ
                        (LETT D
                              (SPADCALL
                               (|SOLVEFOR;part|
                                (SPADCALL (SPADCALL |c1| 2 (QREFELT $ 59))
                                          (SPADCALL
                                           (SPADCALL 4 |c2| (QREFELT $ 60))
                                           |c0| (QREFELT $ 61))
                                          (QREFELT $ 50))
                                $)
                               (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                              |SOLVEFOR;aQuadratic;4F;17|)
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |c1| (QREFELT $ 54)) D
                                    (QREFELT $ 62))
                          (SPADCALL 2 |c2| (QREFELT $ 60))
                          (QREFELT $ 53)))))))))) 

(SDEFUN |SOLVEFOR;cubic;4FL;18|
        ((|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG
         ((#1=#:G793 NIL) (|u| NIL) (#2=#:G792 NIL) (S (F)) (D (F)) (R (F))
          (Q (F)) (#3=#:G791 NIL) (#4=#:G790 NIL) (P (F)) (#5=#:G789 NIL)
          (#6=#:G788 NIL) (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c3| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 33) (QREFELT $ 18))
                 (CONS (|spadConstant| $ 33)
                       (SPADCALL |c3| |c2| |c1| (QREFELT $ 35))))
                (#7='T
                 (SEQ
                  (LETT |a1| (SPADCALL |c2| |c3| (QREFELT $ 53))
                        . #8=(|SOLVEFOR;cubic;4FL;18|))
                  (LETT |a2| (SPADCALL |c1| |c3| (QREFELT $ 53)) . #8#)
                  (LETT |a3| (SPADCALL |c0| |c3| (QREFELT $ 53)) . #8#)
                  (COND
                   ((SPADCALL |a1| (|spadConstant| $ 33) (QREFELT $ 18))
                    (COND
                     ((SPADCALL |a2| (|spadConstant| $ 33) (QREFELT $ 18))
                      (EXIT
                       (PROGN
                        (LETT #6# NIL . #8#)
                        (SEQ (LETT |u| NIL . #8#)
                             (LETT #5#
                                   (LIST (|spadConstant| $ 30) (QREFELT $ 64)
                                         (SPADCALL (QREFELT $ 64) 2
                                                   (QREFELT $ 59)))
                                   . #8#)
                             G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |u| (CAR #5#) . #8#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #6#
                                     (CONS
                                      (SPADCALL |u|
                                                (SPADCALL
                                                 (SPADCALL |a3| (QREFELT $ 54))
                                                 (SPADCALL 1 3 (QREFELT $ 56))
                                                 (QREFELT $ 57))
                                                (QREFELT $ 61))
                                      #6#)
                                     . #8#)))
                             (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                             (EXIT (NREVERSE #6#)))))))))
                  (LETT P
                        (|SOLVEFOR;part|
                         (SPADCALL
                          (SPADCALL |a1| (SPADCALL 3 (QREFELT $ 63))
                                    (QREFELT $ 53))
                          (QREFELT $ 54))
                         $)
                        . #8#)
                  (EXIT
                   (COND
                    ((|SOLVEFOR;equ| (SPADCALL |a1| 2 (QREFELT $ 59))
                      (SPADCALL 3 |a2| (QREFELT $ 60)) $)
                     (SEQ
                      (LETT S
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL (SPADCALL |a3| (QREFELT $ 54))
                                        (SPADCALL
                                         (SPADCALL |a1| 3 (QREFELT $ 59))
                                         (SPADCALL 27 (QREFELT $ 63))
                                         (QREFELT $ 53))
                                        (QREFELT $ 62))
                              (SPADCALL 1 3 (QREFELT $ 56)) (QREFELT $ 57))
                             $)
                            . #8#)
                      (EXIT
                       (PROGN
                        (LETT #4# NIL . #8#)
                        (SEQ (LETT |u| NIL . #8#)
                             (LETT #3#
                                   (LIST (|spadConstant| $ 30) (QREFELT $ 64)
                                         (SPADCALL (QREFELT $ 64) 2
                                                   (QREFELT $ 59)))
                                   . #8#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |u| (CAR #3#) . #8#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #4#
                                     (CONS
                                      (SPADCALL P
                                                (SPADCALL S |u| (QREFELT $ 61))
                                                (QREFELT $ 62))
                                      #4#)
                                     . #8#)))
                             (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                             (EXIT (NREVERSE #4#)))))))
                    (#7#
                     (SEQ
                      (LETT Q
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL (SPADCALL 3 |a2| (QREFELT $ 60))
                                        (SPADCALL |a1| 2 (QREFELT $ 59))
                                        (QREFELT $ 50))
                              (SPADCALL 9 (QREFELT $ 63)) (QREFELT $ 53))
                             $)
                            . #8#)
                      (LETT R
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL 9 |a1| (QREFELT $ 60)) |a2|
                                          (QREFELT $ 61))
                                (SPADCALL 27 |a3| (QREFELT $ 60))
                                (QREFELT $ 50))
                               (SPADCALL 2 (SPADCALL |a1| 3 (QREFELT $ 59))
                                         (QREFELT $ 60))
                               (QREFELT $ 50))
                              (SPADCALL 54 (QREFELT $ 63)) (QREFELT $ 53))
                             $)
                            . #8#)
                      (LETT D
                            (SPADCALL
                             (|SOLVEFOR;part|
                              (SPADCALL (SPADCALL Q 3 (QREFELT $ 59))
                                        (SPADCALL R 2 (QREFELT $ 59))
                                        (QREFELT $ 62))
                              $)
                             (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                            . #8#)
                      (LETT S
                            (SPADCALL
                             (|SOLVEFOR;part| (SPADCALL R D (QREFELT $ 62)) $)
                             (SPADCALL 1 3 (QREFELT $ 56)) (QREFELT $ 57))
                            . #8#)
                      (EXIT
                       (PROGN
                        (LETT #2# NIL . #8#)
                        (SEQ (LETT |u| NIL . #8#)
                             (LETT #1#
                                   (LIST (|spadConstant| $ 30) (QREFELT $ 64)
                                         (SPADCALL (QREFELT $ 64) 2
                                                   (QREFELT $ 59)))
                                   . #8#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #8#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL P
                                                 (SPADCALL S |u|
                                                           (QREFELT $ 61))
                                                 (QREFELT $ 62))
                                       (SPADCALL Q
                                                 (SPADCALL S |u|
                                                           (QREFELT $ 61))
                                                 (QREFELT $ 53))
                                       (QREFELT $ 50))
                                      #2#)
                                     . #8#)))
                             (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))))))))))))) 

(SDEFUN |SOLVEFOR;aCubic;5F;19| ((|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG
         ((S (F)) (D (F)) (R (F)) (Q (F)) (P (F)) (|a3| (F)) (|a2| (F))
          (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c3| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 33) (QREFELT $ 18))
                 (|spadConstant| $ 33))
                (#1='T
                 (SEQ
                  (LETT |a1| (SPADCALL |c2| |c3| (QREFELT $ 53))
                        . #2=(|SOLVEFOR;aCubic;5F;19|))
                  (LETT |a2| (SPADCALL |c1| |c3| (QREFELT $ 53)) . #2#)
                  (LETT |a3| (SPADCALL |c0| |c3| (QREFELT $ 53)) . #2#)
                  (COND
                   ((SPADCALL |a1| (|spadConstant| $ 33) (QREFELT $ 18))
                    (COND
                     ((SPADCALL |a2| (|spadConstant| $ 33) (QREFELT $ 18))
                      (EXIT
                       (SPADCALL (SPADCALL |a3| (QREFELT $ 54))
                                 (SPADCALL 1 3 (QREFELT $ 56))
                                 (QREFELT $ 57)))))))
                  (LETT P
                        (|SOLVEFOR;part|
                         (SPADCALL
                          (SPADCALL |a1| (SPADCALL 3 (QREFELT $ 63))
                                    (QREFELT $ 53))
                          (QREFELT $ 54))
                         $)
                        . #2#)
                  (EXIT
                   (COND
                    ((|SOLVEFOR;equ| (SPADCALL |a1| 2 (QREFELT $ 59))
                      (SPADCALL 3 |a2| (QREFELT $ 60)) $)
                     (SEQ
                      (LETT S
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL (SPADCALL |a3| (QREFELT $ 54))
                                        (SPADCALL
                                         (SPADCALL |a1| 3 (QREFELT $ 59))
                                         (SPADCALL 27 (QREFELT $ 63))
                                         (QREFELT $ 53))
                                        (QREFELT $ 62))
                              (SPADCALL 1 3 (QREFELT $ 56)) (QREFELT $ 57))
                             $)
                            . #2#)
                      (EXIT (SPADCALL P S (QREFELT $ 62)))))
                    (#1#
                     (SEQ
                      (LETT Q
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL (SPADCALL 3 |a2| (QREFELT $ 60))
                                        (SPADCALL |a1| 2 (QREFELT $ 59))
                                        (QREFELT $ 50))
                              (SPADCALL 9 (QREFELT $ 63)) (QREFELT $ 53))
                             $)
                            . #2#)
                      (LETT R
                            (|SOLVEFOR;part|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL 9 |a1| (QREFELT $ 60)) |a2|
                                          (QREFELT $ 61))
                                (SPADCALL 27 |a3| (QREFELT $ 60))
                                (QREFELT $ 50))
                               (SPADCALL 2 (SPADCALL |a1| 3 (QREFELT $ 59))
                                         (QREFELT $ 60))
                               (QREFELT $ 50))
                              (SPADCALL 54 (QREFELT $ 63)) (QREFELT $ 53))
                             $)
                            . #2#)
                      (LETT D
                            (SPADCALL
                             (|SOLVEFOR;part|
                              (SPADCALL (SPADCALL Q 3 (QREFELT $ 59))
                                        (SPADCALL R 2 (QREFELT $ 59))
                                        (QREFELT $ 62))
                              $)
                             (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                            . #2#)
                      (LETT S
                            (SPADCALL
                             (|SOLVEFOR;part| (SPADCALL R D (QREFELT $ 62)) $)
                             (SPADCALL 1 3 (QREFELT $ 56)) (QREFELT $ 57))
                            . #2#)
                      (EXIT
                       (SPADCALL (SPADCALL P S (QREFELT $ 62))
                                 (SPADCALL Q S (QREFELT $ 53))
                                 (QREFELT $ 50)))))))))))))) 

(SDEFUN |SOLVEFOR;quartic;5FL;20|
        ((|c4| F) (|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ |List| F))
        (SPROG
         ((#1=#:G805 NIL) (|s| NIL) (#2=#:G804 NIL) (|slist| (|List| F))
          (|rt| (F)) (|t0| (F)) (|r| (F)) (|q| (F)) (|p| (F)) (|a4| (F))
          (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c4| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 33) (QREFELT $ 18))
                 (CONS (|spadConstant| $ 33)
                       (SPADCALL |c4| |c3| |c2| |c1| (QREFELT $ 36))))
                (#3='T
                 (SEQ
                  (LETT |a1| (SPADCALL |c3| |c4| (QREFELT $ 53))
                        . #4=(|SOLVEFOR;quartic;5FL;20|))
                  (LETT |a2| (SPADCALL |c2| |c4| (QREFELT $ 53)) . #4#)
                  (LETT |a3| (SPADCALL |c1| |c4| (QREFELT $ 53)) . #4#)
                  (LETT |a4| (SPADCALL |c0| |c4| (QREFELT $ 53)) . #4#)
                  (COND
                   ((SPADCALL |a1| (|spadConstant| $ 33) (QREFELT $ 18))
                    (COND
                     ((SPADCALL |a2| (|spadConstant| $ 33) (QREFELT $ 18))
                      (COND
                       ((SPADCALL |a3| (|spadConstant| $ 33) (QREFELT $ 18))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 30) (|spadConstant| $ 33)
                                    (SPADCALL (SPADCALL |a4| (QREFELT $ 54))
                                              (SPADCALL 1 2 (QREFELT $ 56))
                                              (QREFELT $ 57))
                                    (QREFELT $ 35))
                          (SPADCALL (|spadConstant| $ 30) (|spadConstant| $ 33)
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |a4| (QREFELT $ 54))
                                               (SPADCALL 1 2 (QREFELT $ 56))
                                               (QREFELT $ 57))
                                     (QREFELT $ 54))
                                    (QREFELT $ 35))
                          (QREFELT $ 38)))))))))
                  (LETT |p|
                        (|SOLVEFOR;part|
                         (SPADCALL |a2|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 |a1| (QREFELT $ 60))
                                              |a1| (QREFELT $ 61))
                                    (SPADCALL 8 (QREFELT $ 63)) (QREFELT $ 53))
                                   (QREFELT $ 50))
                         $)
                        . #4#)
                  (LETT |q|
                        (|SOLVEFOR;part|
                         (SPADCALL
                          (SPADCALL |a3|
                                    (SPADCALL
                                     (SPADCALL |a1| |a2| (QREFELT $ 61))
                                     (SPADCALL 2 (QREFELT $ 63))
                                     (QREFELT $ 53))
                                    (QREFELT $ 50))
                          (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 59))
                                    (SPADCALL 8 (QREFELT $ 63)) (QREFELT $ 53))
                          (QREFELT $ 62))
                         $)
                        . #4#)
                  (LETT |r|
                        (|SOLVEFOR;part|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |a4|
                                     (SPADCALL
                                      (SPADCALL |a1| |a3| (QREFELT $ 61))
                                      (SPADCALL 4 (QREFELT $ 63))
                                      (QREFELT $ 53))
                                     (QREFELT $ 50))
                           (SPADCALL
                            (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 59)) |a2|
                                      (QREFELT $ 61))
                            (SPADCALL 16 (QREFELT $ 63)) (QREFELT $ 53))
                           (QREFELT $ 62))
                          (SPADCALL
                           (SPADCALL 3 (SPADCALL |a1| 4 (QREFELT $ 59))
                                     (QREFELT $ 60))
                           (SPADCALL 256 (QREFELT $ 63)) (QREFELT $ 53))
                          (QREFELT $ 50))
                         $)
                        . #4#)
                  (COND
                   ((|SOLVEFOR;equ| |q| (|spadConstant| $ 33) $)
                    (LETT |t0|
                          (|SOLVEFOR;part|
                           (SPADCALL 2
                                     (SPADCALL |r|
                                               (SPADCALL 1 2 (QREFELT $ 56))
                                               (QREFELT $ 57))
                                     (QREFELT $ 60))
                           $)
                          . #4#))
                   (#3#
                    (LETT |t0|
                          (SPADCALL (|spadConstant| $ 30)
                                    (SPADCALL |p| (QREFELT $ 54))
                                    (SPADCALL (SPADCALL 4 |r| (QREFELT $ 60))
                                              (QREFELT $ 54))
                                    (SPADCALL
                                     (SPADCALL (SPADCALL 4 |p| (QREFELT $ 60))
                                               |r| (QREFELT $ 61))
                                     (SPADCALL |q| 2 (QREFELT $ 59))
                                     (QREFELT $ 50))
                                    (QREFELT $ 41))
                          . #4#)))
                  (LETT |rt|
                        (SPADCALL
                         (|SOLVEFOR;part| (SPADCALL |t0| |p| (QREFELT $ 50)) $)
                         (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                        . #4#)
                  (LETT |slist|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 30) |rt|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |q| |rt| (QREFELT $ 53))
                                      (QREFELT $ 54))
                                     |t0| (QREFELT $ 62))
                                    (SPADCALL 2 (QREFELT $ 63)) (QREFELT $ 53))
                                   (QREFELT $ 35))
                         (SPADCALL (|spadConstant| $ 30)
                                   (SPADCALL |rt| (QREFELT $ 54))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |q| |rt| (QREFELT $ 53)) |t0|
                                     (QREFELT $ 62))
                                    (SPADCALL 2 (QREFELT $ 63)) (QREFELT $ 53))
                                   (QREFELT $ 35))
                         (QREFELT $ 38))
                        . #4#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #4#)
                    (SEQ (LETT |s| NIL . #4#) (LETT #1# |slist| . #4#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |s| (CAR #1#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL |s|
                                            (SPADCALL |a1|
                                                      (SPADCALL 4
                                                                (QREFELT $ 63))
                                                      (QREFELT $ 53))
                                            (QREFELT $ 50))
                                  #2#)
                                 . #4#)))
                         (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |SOLVEFOR;aQuartic;6F;21|
        ((|c4| F) (|c3| F) (|c2| F) (|c1| F) (|c0| F) ($ F))
        (SPROG
         ((|s| (F)) (|rt| (F)) (|t0| (F)) (|r| (F)) (|q| (F)) (|p| (F))
          (|a4| (F)) (|a3| (F)) (|a2| (F)) (|a1| (F)))
         (SEQ (|SOLVEFOR;needLcoef| |c4| $) (|SOLVEFOR;needChar0| $)
              (EXIT
               (COND
                ((SPADCALL |c0| (|spadConstant| $ 33) (QREFELT $ 18))
                 (|spadConstant| $ 33))
                (#1='T
                 (SEQ
                  (LETT |a1| (SPADCALL |c3| |c4| (QREFELT $ 53))
                        . #2=(|SOLVEFOR;aQuartic;6F;21|))
                  (LETT |a2| (SPADCALL |c2| |c4| (QREFELT $ 53)) . #2#)
                  (LETT |a3| (SPADCALL |c1| |c4| (QREFELT $ 53)) . #2#)
                  (LETT |a4| (SPADCALL |c0| |c4| (QREFELT $ 53)) . #2#)
                  (COND
                   ((SPADCALL |a1| (|spadConstant| $ 33) (QREFELT $ 18))
                    (COND
                     ((SPADCALL |a2| (|spadConstant| $ 33) (QREFELT $ 18))
                      (COND
                       ((SPADCALL |a3| (|spadConstant| $ 33) (QREFELT $ 18))
                        (EXIT
                         (SPADCALL (SPADCALL |a4| (QREFELT $ 54))
                                   (SPADCALL 1 4 (QREFELT $ 56))
                                   (QREFELT $ 57)))))))))
                  (LETT |p|
                        (|SOLVEFOR;part|
                         (SPADCALL |a2|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 |a1| (QREFELT $ 60))
                                              |a1| (QREFELT $ 61))
                                    (SPADCALL 8 (QREFELT $ 63)) (QREFELT $ 53))
                                   (QREFELT $ 50))
                         $)
                        . #2#)
                  (LETT |q|
                        (|SOLVEFOR;part|
                         (SPADCALL
                          (SPADCALL |a3|
                                    (SPADCALL
                                     (SPADCALL |a1| |a2| (QREFELT $ 61))
                                     (SPADCALL 2 (QREFELT $ 63))
                                     (QREFELT $ 53))
                                    (QREFELT $ 50))
                          (SPADCALL
                           (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 59)) |a1|
                                     (QREFELT $ 61))
                           (SPADCALL 8 (QREFELT $ 63)) (QREFELT $ 53))
                          (QREFELT $ 62))
                         $)
                        . #2#)
                  (LETT |r|
                        (|SOLVEFOR;part|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |a4|
                                     (SPADCALL
                                      (SPADCALL |a1| |a3| (QREFELT $ 61))
                                      (SPADCALL 4 (QREFELT $ 63))
                                      (QREFELT $ 53))
                                     (QREFELT $ 50))
                           (SPADCALL
                            (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 59)) |a2|
                                      (QREFELT $ 61))
                            (SPADCALL 16 (QREFELT $ 63)) (QREFELT $ 53))
                           (QREFELT $ 62))
                          (SPADCALL
                           (SPADCALL 3 (SPADCALL |a1| 4 (QREFELT $ 59))
                                     (QREFELT $ 60))
                           (SPADCALL 256 (QREFELT $ 63)) (QREFELT $ 53))
                          (QREFELT $ 50))
                         $)
                        . #2#)
                  (COND
                   ((|SOLVEFOR;equ| |q| (|spadConstant| $ 33) $)
                    (LETT |t0|
                          (|SOLVEFOR;part|
                           (SPADCALL 2
                                     (SPADCALL |r|
                                               (SPADCALL 1 2 (QREFELT $ 56))
                                               (QREFELT $ 57))
                                     (QREFELT $ 60))
                           $)
                          . #2#))
                   (#1#
                    (LETT |t0|
                          (SPADCALL (|spadConstant| $ 30)
                                    (SPADCALL |p| (QREFELT $ 54))
                                    (SPADCALL (SPADCALL 4 |r| (QREFELT $ 60))
                                              (QREFELT $ 54))
                                    (SPADCALL
                                     (SPADCALL (SPADCALL 4 |p| (QREFELT $ 60))
                                               |r| (QREFELT $ 61))
                                     (SPADCALL |q| 2 (QREFELT $ 59))
                                     (QREFELT $ 50))
                                    (QREFELT $ 41))
                          . #2#)))
                  (LETT |rt|
                        (SPADCALL
                         (|SOLVEFOR;part| (SPADCALL |t0| |p| (QREFELT $ 50)) $)
                         (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                        . #2#)
                  (LETT |s|
                        (SPADCALL (|spadConstant| $ 30) |rt|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |q| |rt| (QREFELT $ 53))
                                     (QREFELT $ 54))
                                    |t0| (QREFELT $ 62))
                                   (SPADCALL 2 (QREFELT $ 63)) (QREFELT $ 53))
                                  (QREFELT $ 40))
                        . #2#)
                  (EXIT
                   (SPADCALL |s|
                             (SPADCALL |a1| (SPADCALL 4 (QREFELT $ 63))
                                       (QREFELT $ 53))
                             (QREFELT $ 50)))))))))) 

(DECLAIM (NOTINLINE |PolynomialSolveByFormulas;|)) 

(DEFUN |PolynomialSolveByFormulas| (&REST #1=#:G810)
  (SPROG NIL
         (PROG (#2=#:G811)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialSolveByFormulas|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialSolveByFormulas|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialSolveByFormulas;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialSolveByFormulas|)))))))))) 

(DEFUN |PolynomialSolveByFormulas;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialSolveByFormulas|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PolynomialSolveByFormulas| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 65) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PolynomialSolveByFormulas|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 NIL)
          (QSETREFV $ 9 NIL)
          (QSETREFV $ 10 NIL)
          (QSETREFV $ 64
                    (SPADCALL
                     (SPADCALL (SPADCALL (|spadConstant| $ 30) (QREFELT $ 54))
                               (SPADCALL
                                (SPADCALL (SPADCALL 3 (QREFELT $ 63))
                                          (QREFELT $ 54))
                                (SPADCALL 1 2 (QREFELT $ 56)) (QREFELT $ 57))
                               (QREFELT $ 62))
                     (SPADCALL 2 (QREFELT $ 63)) (QREFELT $ 53)))
          $))) 

(MAKEPROP '|PolynomialSolveByFormulas| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|maplist|
              '|mapSolving?| '|map| (|List| 7) |SOLVEFOR;solve;UPL;4|
              (|Record| (|:| |arg| 7) (|:| |res| 7))
              (|Record| (|:| |solns| 11) (|:| |maps| (|List| 13)))
              (|Mapping| 7 7) |SOLVEFOR;mapSolve;UPMR;1| (|Boolean|) (0 . =)
              (|Factored| $) (6 . |squareFree|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 25)) (|List| 21)
              (|Factored| 6) (11 . |factors|) (|Integer|) (16 . |elt|)
              (|NonNegativeInteger|) (22 . |degree|) (27 . |One|) (31 . |One|)
              (35 . |coefficient|) (41 . |Zero|) (45 . |Zero|)
              |SOLVEFOR;linear;2FL;14| |SOLVEFOR;quadratic;3FL;16|
              |SOLVEFOR;cubic;4FL;18| |SOLVEFOR;quartic;5FL;20| (49 . |append|)
              |SOLVEFOR;aLinear;3F;15| |SOLVEFOR;aQuadratic;4F;17|
              |SOLVEFOR;aCubic;5F;19| |SOLVEFOR;aQuartic;6F;21|
              |SOLVEFOR;particularSolution;UPF;5| (55 . ~=)
              (61 . |characteristic|) |SOLVEFOR;linear;UPL;9|
              |SOLVEFOR;quadratic;UPL;10| |SOLVEFOR;cubic;UPL;11|
              |SOLVEFOR;quartic;UPL;12| (65 . -) (|Union| $ '"failed")
              (71 . |recip|) (76 . /) (82 . -) (|Fraction| 25) (87 . /)
              (93 . ^) (|PositiveInteger|) (99 . ^) (105 . *) (111 . *)
              (117 . +) (123 . |coerce|) '|w3|)
           '#(|solve| 128 |quartic| 133 |quadratic| 147 |particularSolution|
              159 |mapSolve| 164 |linear| 170 |cubic| 181 |aQuartic| 194
              |aQuadratic| 203 |aLinear| 210 |aCubic| 216)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 63
                                                 '(2 7 17 0 0 18 1 6 19 0 20 1
                                                   23 22 0 24 2 22 21 0 25 26 1
                                                   6 27 0 28 0 6 0 29 0 7 0 30
                                                   2 6 7 0 27 31 0 6 0 32 0 7 0
                                                   33 2 11 0 0 0 38 2 7 17 0 0
                                                   44 0 7 27 45 2 7 0 0 0 50 1
                                                   7 51 0 52 2 7 0 0 0 53 1 7 0
                                                   0 54 2 55 0 25 25 56 2 7 0 0
                                                   55 57 2 7 0 0 58 59 2 7 0 58
                                                   0 60 2 7 0 0 0 61 2 7 0 0 0
                                                   62 1 7 0 25 63 1 0 11 6 12 1
                                                   0 11 6 49 5 0 11 7 7 7 7 7
                                                   37 1 0 11 6 47 3 0 11 7 7 7
                                                   35 1 0 7 6 43 2 0 14 6 15 16
                                                   1 0 11 6 46 2 0 11 7 7 34 1
                                                   0 11 6 48 4 0 11 7 7 7 7 36
                                                   5 0 7 7 7 7 7 7 42 3 0 7 7 7
                                                   7 40 2 0 7 7 7 39 4 0 7 7 7
                                                   7 7 41)))))
           '|lookupComplete|)) 
