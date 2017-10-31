
(SDEFUN |PERMGRP;shortenWord|
        ((|lw| |List| (|NonNegativeInteger|)) (|gp| $)
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|do_res| #1=(|Boolean|)) (|flag1| #1#)
          (|newlw| (|List| (|NonNegativeInteger|))) (#2=#:G778 NIL)
          (|anzahl| (|NonNegativeInteger|)) (|flag2| #1#)
          (|res| (|List| #3=(|NonNegativeInteger|))) (|test| #3#)
          (#4=#:G782 NIL) (|el| NIL) (|pos| (|Integer|)) (#5=#:G781 NIL)
          (|i| NIL) (|orderList| (|List| (|NonNegativeInteger|)))
          (#6=#:G780 NIL) (|gen| NIL) (#7=#:G779 NIL)
          (|gpgens| (|List| (|Permutation| S))))
         (SEQ
          (LETT |gpgens| (SPADCALL |gp| (QREFELT $ 9))
                . #8=(|PERMGRP;shortenWord|))
          (LETT |orderList|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |gen| NIL . #8#) (LETT #6# |gpgens| . #8#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |gen| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7# (CONS (SPADCALL |gen| (QREFELT $ 12)) #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |newlw| (SPADCALL |lw| (QREFELT $ 14)) . #8#)
          (SEQ (LETT |i| 1 . #8#)
               (LETT #5# (SPADCALL |orderList| (QREFELT $ 16)) . #8#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (SPADCALL |orderList| |i| (QREFELT $ 17)) 1)
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |i| |newlw| (QREFELT $ 19)))
                          (GO G191)))
                        (SEQ
                         (LETT |pos| (SPADCALL |i| |newlw| (QREFELT $ 20))
                               . #8#)
                         (EXIT
                          (LETT |newlw| (SPADCALL |newlw| |pos| (QREFELT $ 21))
                                . #8#)))
                        NIL (GO G190) G191 (EXIT NIL))))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((< (SPADCALL |newlw| (QREFELT $ 22)) 2) |newlw|)
                 ('T
                  (SEQ (LETT |test| (|SPADfirst| |newlw|) . #8#)
                       (LETT |anzahl| 0 . #8#) (LETT |flag1| 'T . #8#)
                       (LETT |do_res| NIL . #8#)
                       (SEQ G190 (COND ((NULL |flag1|) (GO G191)))
                            (SEQ (LETT |test| (|SPADfirst| |newlw|) . #8#)
                                 (LETT |anzahl| 1 . #8#)
                                 (COND
                                  (|do_res| (LETT |res| (LIST |test|) . #8#)))
                                 (LETT |flag2| 'T . #8#)
                                 (SEQ (LETT |el| NIL . #8#)
                                      (LETT #4# |newlw| . #8#) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN
                                             (LETT |el| (CAR #4#) . #8#)
                                             NIL)
                                            (NULL |flag2|))
                                        (GO G191)))
                                      (SEQ
                                       (COND
                                        (|do_res|
                                         (LETT |res| (CONS |el| |res|) . #8#)))
                                       (LETT |anzahl| (+ |anzahl| 1) . #8#)
                                       (EXIT
                                        (COND
                                         ((EQL |anzahl| 1)
                                          (LETT |test| |el| . #8#))
                                         ((SPADCALL |test| |el| (QREFELT $ 24))
                                          (SEQ (LETT |test| |el| . #8#)
                                               (EXIT (LETT |anzahl| 1 . #8#))))
                                         ('T
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((EQL |anzahl|
                                                   (SPADCALL |orderList| |test|
                                                             (QREFELT $ 17)))
                                              (PROGN
                                               (LETT #2#
                                                     (SEQ
                                                      (COND
                                                       (|do_res|
                                                        (LETT |res|
                                                              (SPADCALL |res|
                                                                        |anzahl|
                                                                        (QREFELT
                                                                         $ 25))
                                                              . #8#))
                                                       ('T
                                                        (LETT |flag2| NIL
                                                              . #8#)))
                                                      (EXIT
                                                       (LETT |anzahl| 0
                                                             . #8#)))
                                                     . #8#)
                                               (GO #9=#:G769)))))
                                           #9# (EXIT #2#))))))
                                      (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                      (EXIT NIL))
                                 (COND
                                  (|do_res|
                                   (LETT |newlw| (NREVERSE |res|) . #8#)))
                                 (LETT |flag1| |do_res| . #8#)
                                 (EXIT (LETT |do_res| (NULL |flag2|) . #8#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |newlw|)))))))) 

(SDEFUN |PERMGRP;times!|
        ((|res| |Vector| (|NonNegativeInteger|))
         (|p| |Vector| (|NonNegativeInteger|))
         (|q| |Vector| (|NonNegativeInteger|)) ($ |Void|))
        (SPROG ((#1=#:G786 NIL) (|i| NIL) (|degree| (|NonNegativeInteger|)))
               (SEQ
                (LETT |degree| (SPADCALL |p| (QREFELT $ 27))
                      . #2=(|PERMGRP;times!|))
                (EXIT
                 (SEQ (LETT |i| 1 . #2#) (LETT #1# |degree| . #2#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1O |res| |i|
                                    (QAREF1O |p| (QAREF1O |q| |i| 1) 1) 1)))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT NIL)))))) 

(SDEFUN |PERMGRP;times|
        ((|p| |Vector| (|NonNegativeInteger|))
         (|q| |Vector| (|NonNegativeInteger|))
         ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degree| (SPADCALL |p| (QREFELT $ 27)) . #1=(|PERMGRP;times|))
          (LETT |res| (SPADCALL |degree| 0 (QREFELT $ 28)) . #1#)
          (|PERMGRP;times!| |res| |p| |q| $) (EXIT |res|)))) 

(SDEFUN |PERMGRP;inv|
        ((|p| |Vector| (|NonNegativeInteger|))
         ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G792 NIL) (|i| NIL) (|q| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degree| (SPADCALL |p| (QREFELT $ 27)) . #2=(|PERMGRP;inv|))
          (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# |degree| . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (EXIT (QSETAREF1O |q| (QAREF1O |p| |i| 1) |i| 1)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |q|)))) 

(SDEFUN |PERMGRP;testIdentity|
        ((|p| |Vector| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G798 NIL) (#2=#:G799 NIL) (#3=#:G800 NIL) (|i| NIL)
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |degree| (SPADCALL |p| (QREFELT $ 27))
                  . #4=(|PERMGRP;testIdentity|))
            (SEQ
             (EXIT
              (SEQ (LETT |i| 1 . #4#) (LETT #3# |degree| . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF1O |p| |i| 1) |i| (QREFELT $ 24))
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5=#:G797))
                              . #4#)
                        (GO #6=#:G795))))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |PERMGRP;cosetRep1|
        ((|ppt| |NonNegativeInteger|) (|do_words| |Boolean|)
         (|o| |Record| (|:| |orb| #1=(|List| (|NonNegativeInteger|)))
          (|:| |svc| #2=(|Vector| (|Integer|))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         (|wordv| |Vector| (|List| (|NonNegativeInteger|)))
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((#3=#:G811 NIL) (|p| (|Integer|))
          (|word| (|List| (|NonNegativeInteger|)))
          (|xelt| #4=(|Vector| (|NonNegativeInteger|)))
          (|tmpv| #5=(|Vector| (|NonNegativeInteger|))) (|#G25| #5#)
          (|#G24| #4#) (|x| (|Vector| (|NonNegativeInteger|))) (|osvc| #2#)
          (|oorb| #1#) (#6=#:G812 NIL) (#7=#:G814 NIL) (|n| NIL)
          (#8=#:G813 NIL) (|degree| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((EQL (QVSIZE |grpv|) 0) (|error| "cosetRep needs nonempty group"))
            (#9='T
             (SEQ
              (LETT |degree|
                    (SPADCALL (SPADCALL |grpv| 1 (QREFELT $ 30))
                              (QREFELT $ 27))
                    . #10=(|PERMGRP;cosetRep1|))
              (LETT |xelt|
                    (PROGN
                     (LETT #8# (GETREFV |degree|) . #10#)
                     (SEQ (LETT |n| 1 . #10#) (LETT #7# |degree| . #10#)
                          (LETT #6# 0 . #10#) G190
                          (COND ((|greater_SI| |n| #7#) (GO G191)))
                          (SEQ (EXIT (SETELT #8# #6# |n|)))
                          (LETT #6#
                                (PROG1 (|inc_SI| #6#)
                                  (LETT |n| (|inc_SI| |n|) . #10#))
                                . #10#)
                          (GO G190) G191 (EXIT NIL))
                     #8#)
                    . #10#)
              (LETT |word| NIL . #10#) (LETT |oorb| (QCAR |o|) . #10#)
              (LETT |osvc| (QCDR |o|) . #10#)
              (LETT |p| (QAREF1O |osvc| |ppt| 1) . #10#)
              (EXIT
               (COND
                ((< |p| 0)
                 (PROGN
                  (LETT #3# (CONS |xelt| |word|) . #10#)
                  (GO #11=#:G810)))
                (#9#
                 (SEQ (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #10#)
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ (LETT |x| (QAREF1O |grpv| |p| 1) . #10#)
                                 (|PERMGRP;times!| |tmpv| |x| |xelt| $)
                                 (PROGN
                                  (LETT |#G24| |xelt| . #10#)
                                  (LETT |#G25| |tmpv| . #10#)
                                  (LETT |tmpv| |#G24| . #10#)
                                  (LETT |xelt| |#G25| . #10#))
                                 (COND
                                  (|do_words|
                                   (LETT |word|
                                         (SPADCALL
                                          (SPADCALL |wordv| |p| (QREFELT $ 32))
                                          |word| (QREFELT $ 33))
                                         . #10#)))
                                 (LETT |ppt| (QAREF1O |x| |ppt| 1) . #10#)
                                 (LETT |p| (QAREF1O |osvc| |ppt| 1) . #10#)
                                 (EXIT
                                  (COND
                                   ((< |p| 0)
                                    (PROGN
                                     (LETT #3# (CONS |xelt| |word|) . #10#)
                                     (GO #11#))))))
                            NIL (GO G190) G191 (EXIT NIL)))))))))))
          #11# (EXIT #3#)))) 

(SDEFUN |PERMGRP;strip1|
        ((|element| |Vector| (|NonNegativeInteger|))
         (|orbit| |Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
          (|:| |svc| (|Vector| (|Integer|))))
         (|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|words| |List| (|List| (|NonNegativeInteger|)))
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|cr|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|point| (|NonNegativeInteger|))
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|do_words| (|Boolean|))
          (|grpv| (|Vector| (|Vector| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |grpv| (SPADCALL |group| (QREFELT $ 35))
                . #1=(|PERMGRP;strip1|))
          (LETT |wordv| (MAKE-ARRAY 0) . #1#)
          (LETT |do_words| (NULL (NULL |words|)) . #1#)
          (COND
           (|do_words| (LETT |wordv| (SPADCALL |words| (QREFELT $ 37)) . #1#)))
          (LETT |point|
                (QAREF1O |element| (SPADCALL (QCAR |orbit|) 1 (QREFELT $ 38))
                         1)
                . #1#)
          (LETT |cr|
                (|PERMGRP;cosetRep1| |point| |do_words| |orbit| |grpv| |wordv|
                 $)
                . #1#)
          (EXIT
           (CONS (|PERMGRP;times| (QCAR |cr|) |element| $)
                 (REVERSE (QCDR |cr|))))))) 

(SDEFUN |PERMGRP;strip|
        ((|z| . #1=(|Vector| (|NonNegativeInteger|))) (|i| |Integer|)
         (|do_words| |Boolean|)
         (|orbs| |Vector|
          (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                    (|:| |svc| #2=(|Vector| (|Integer|)))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         (|wordv| |Vector| (|List| (|NonNegativeInteger|)))
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|word| (|List| (|NonNegativeInteger|)))
          (|tmpv| #3=(|Vector| (|NonNegativeInteger|))) (|#G38| #1#)
          (|#G37| #3#) (|ee| (|Vector| (|NonNegativeInteger|)))
          (|noresult| (|Boolean|)) (#4=#:G829 NIL) (|entry| (|Integer|))
          (|p| (|NonNegativeInteger|)) (|s| #2#)
          (|orbj|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|j| NIL) (|degree| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degree| (SPADCALL |z| (QREFELT $ 27)) . #5=(|PERMGRP;strip|))
          (LETT |word| NIL . #5#)
          (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #5#)
          (LETT |noresult| 'T . #5#)
          (SEQ (LETT |j| |i| . #5#) G190
               (COND ((OR (< |j| 1) (NULL |noresult|)) (GO G191)))
               (SEQ (LETT |orbj| (QAREF1O |orbs| |j| 1) . #5#)
                    (LETT |s| (QCDR |orbj|) . #5#)
                    (LETT |p| (|SPADfirst| (QCAR |orbj|)) . #5#)
                    (EXIT
                     (SEQ
                      (EXIT
                       (SEQ G190 (COND ((NULL |noresult|) (GO G191)))
                            (SEQ
                             (LETT |entry| (QAREF1O |s| (QAREF1O |z| |p| 1) 1)
                                   . #5#)
                             (EXIT
                              (COND
                               ((< |entry| 0)
                                (SEQ
                                 (COND
                                  ((EQL |entry| -1)
                                   (PROGN
                                    (LETT #4# |$NoValue| . #5#)
                                    (GO #6=#:G824))))
                                 (EXIT (LETT |noresult| NIL . #5#))))
                               ('T
                                (SEQ
                                 (LETT |ee| (QAREF1O |grpv| |entry| 1) . #5#)
                                 (|PERMGRP;times!| |tmpv| |ee| |z| $)
                                 (PROGN
                                  (LETT |#G37| |tmpv| . #5#)
                                  (LETT |#G38| |z| . #5#)
                                  (LETT |z| |#G37| . #5#)
                                  (LETT |tmpv| |#G38| . #5#))
                                 (EXIT
                                  (COND
                                   (|do_words|
                                    (LETT |word|
                                          (SPADCALL
                                           (SPADCALL |wordv| |entry|
                                                     (QREFELT $ 32))
                                           |word| (QREFELT $ 33))
                                          . #5#)))))))))
                            NIL (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #4#))))
               (LETT |j| (+ |j| -1) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |z| |word|))))) 

(SDEFUN |PERMGRP;orbitInternal|
        ((|gp| $) (|startList| . #1=(|List| S)) ($ |List| (|List| S)))
        (SPROG
         ((|pos| (|Integer|)) (|orbitList| (|List| #1#)) (|newList| (|List| S))
          (|j| NIL) (|workList| (|List| S)) (#2=#:G839 NIL) (|gen| NIL)
          (|gpset| (|List| (|Permutation| S))))
         (SEQ
          (LETT |orbitList| (LIST |startList|) . #3=(|PERMGRP;orbitInternal|))
          (LETT |pos| 1 . #3#)
          (SEQ G190 (COND ((NULL (NULL (ZEROP |pos|))) (GO G191)))
               (SEQ (LETT |gpset| (QCAR |gp|) . #3#)
                    (SEQ (LETT |gen| NIL . #3#) (LETT #2# |gpset| . #3#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |gen| (CAR #2#) . #3#) NIL))
                           (GO G191)))
                         (SEQ (LETT |newList| NIL . #3#)
                              (LETT |workList|
                                    (SPADCALL |orbitList| |pos| (QREFELT $ 41))
                                    . #3#)
                              (SEQ (LETT |j| (LENGTH |workList|) . #3#) G190
                                   (COND ((< |j| 1) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |newList|
                                           (CONS
                                            (SPADCALL |gen|
                                                      (SPADCALL |workList| |j|
                                                                (QREFELT $ 42))
                                                      (QREFELT $ 43))
                                            |newList|)
                                           . #3#)))
                                   (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |newList| |orbitList|
                                            (QREFELT $ 44)))
                                 (SEQ
                                  (LETT |orbitList|
                                        (CONS |newList| |orbitList|) . #3#)
                                  (EXIT (LETT |pos| (+ |pos| 1) . #3#)))))))
                         (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |pos| (- |pos| 1) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (REVERSE |orbitList|))))) 

(SDEFUN |PERMGRP;ranelt|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|word| |List| (|List| (|NonNegativeInteger|))) (|maxLoops| |Integer|)
         ($ |Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|numberOfLoops| #1=(|Integer|))
          (|words| (|List| (|NonNegativeInteger|))) (#2=#:G844 NIL)
          (|randomElement| (|Vector| (|NonNegativeInteger|)))
          (|randomInteger| #1#) (#3=#:G842 NIL) (|do_words| (|Boolean|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ
          (LETT |numberOfGenerators| (LENGTH |group|) . #4=(|PERMGRP;ranelt|))
          (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|)) . #4#)
          (LETT |randomElement|
                (SPADCALL |group| |randomInteger| (QREFELT $ 45)) . #4#)
          (LETT |words| NIL . #4#) (LETT |do_words| (NULL (NULL |word|)) . #4#)
          (COND
           (|do_words|
            (LETT |words|
                  (SPADCALL |word|
                            (PROG1 (LETT #3# |randomInteger| . #4#)
                              (|check_subtype2| (>= #3# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #3#))
                            (QREFELT $ 46))
                  . #4#)))
          (COND
           ((SPADCALL |maxLoops| 0 (QREFELT $ 47))
            (LETT |numberOfLoops| (+ 1 (RANDOM |maxLoops|)) . #4#))
           ('T (LETT |numberOfLoops| |maxLoops| . #4#)))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |numberOfLoops| 0 (QREFELT $ 47))) (GO G191)))
               (SEQ
                (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|))
                      . #4#)
                (LETT |randomElement|
                      (|PERMGRP;times|
                       (SPADCALL |group| |randomInteger| (QREFELT $ 45))
                       |randomElement| $)
                      . #4#)
                (COND
                 (|do_words|
                  (LETT |words|
                        (SPADCALL
                         (SPADCALL |word|
                                   (PROG1 (LETT #2# |randomInteger| . #4#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT $ 46))
                         |words| (QREFELT $ 33))
                        . #4#)))
                (EXIT (LETT |numberOfLoops| (- |numberOfLoops| 1) . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |randomElement| |words|))))) 

(SDEFUN |PERMGRP;pointList;$L;11| ((|group| $) ($ |List| S))
        (SPROG
         ((|res| (|List| S)) (|p0| (S)) (#1=#:G859 NIL) (|p| NIL)
          (|support| (|List| S)) (#2=#:G858 NIL) (|perm| NIL))
         (SEQ
          (COND
           ((NULL (NULL (QVELT (QCDR |group|) 4))) (QVELT (QCDR |group|) 4))
           ('T
            (SEQ (LETT |support| NIL . #3=(|PERMGRP;pointList;$L;11|))
                 (SEQ (LETT |perm| NIL . #3#) (LETT #2# (QCAR |group|) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |perm| (CAR #2#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |support|
                              (SPADCALL
                               (SPADCALL
                                (QCAR (SPADCALL |perm| (QREFELT $ 49)))
                                (QREFELT $ 50))
                               |support| (QREFELT $ 51))
                              . #3#)))
                      (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                 (LETT |res| NIL . #3#)
                 (EXIT
                  (COND ((NULL |support|) |res|)
                        ('T
                         (SEQ (LETT |p0| (|SPADfirst| |support|) . #3#)
                              (LETT |res| (LIST |p0|) . #3#)
                              (SEQ (LETT |p| NIL . #3#)
                                   (LETT #1# (CDR |support|) . #3#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |p| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL |p| |p0| (QREFELT $ 52))
                                       "iterate")
                                      ('T
                                       (SEQ (LETT |p0| |p| . #3#)
                                            (EXIT
                                             (LETT |res| (CONS |p| |res|)
                                                   . #3#)))))))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (QSETVELT (QCDR |group|) 4
                                         (NREVERSE |res|))))))))))))) 

(SDEFUN |PERMGRP;pointList;$L;12| ((|group| $) ($ |List| S))
        (SPROG ((|support| (|Set| S)) (#1=#:G865 NIL) (|perm| NIL))
               (SEQ
                (COND
                 ((NULL (NULL (QVELT (QCDR |group|) 4)))
                  (QVELT (QCDR |group|) 4))
                 ('T
                  (SEQ
                   (LETT |support| (SPADCALL (QREFELT $ 55))
                         . #2=(|PERMGRP;pointList;$L;12|))
                   (SEQ (LETT |perm| NIL . #2#) (LETT #1# (QCAR |group|) . #2#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |perm| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |support|
                                (SPADCALL |support|
                                          (SPADCALL |perm| (QREFELT $ 56))
                                          (QREFELT $ 57))
                                . #2#)))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (QSETVELT (QCDR |group|) 4
                              (SPADCALL |support| (QREFELT $ 58)))))))))) 

(SDEFUN |PERMGRP;ls_to_lnni|
        ((|ls| |List| S) (|supp| |List| S) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G884 NIL) (|pp| NIL) (#2=#:G883 NIL)
          (|rp2| (|List| (|List| (|NonNegativeInteger|))))
          (|ls2|
           (|List|
            (|Record| (|:| |preimage| (|NonNegativeInteger|))
                      (|:| |image| S))))
          (|p1| (S))
          (|pel|
           (|Record| (|:| |preimage| (|NonNegativeInteger|)) (|:| |image| S)))
          (|flag| (|Boolean|)) (#3=#:G882 NIL) (|p2| NIL) (|i| NIL)
          (#4=#:G881 NIL) (|p| NIL) (#5=#:G880 NIL))
         (SEQ
          (COND ((NULL |ls|) NIL)
                ('T
                 (SEQ
                  (LETT |ls2|
                        (PROGN
                         (LETT #5# NIL . #6=(|PERMGRP;ls_to_lnni|))
                         (SEQ (LETT |i| 1 . #6#) (LETT |p| NIL . #6#)
                              (LETT #4# |ls| . #6#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5# (CONS (CONS |i| |p|) #5#) . #6#)))
                              (LETT #4#
                                    (PROG1 (CDR #4#)
                                      (LETT |i| (|inc_SI| |i|) . #6#))
                                    . #6#)
                              (GO G190) G191 (EXIT (NREVERSE #5#))))
                        . #6#)
                  (LETT |ls2|
                        (SPADCALL (CONS #'|PERMGRP;ls_to_lnni!0| $) |ls2|
                                  (QREFELT $ 63))
                        . #6#)
                  (LETT |pel| (|SPADfirst| |ls2|) . #6#)
                  (LETT |p1| (QCDR |pel|) . #6#) (LETT |ls2| (CDR |ls2|) . #6#)
                  (LETT |rp2| NIL . #6#) (LETT |flag| 'T . #6#)
                  (SEQ (LETT |i| 1 . #6#) (LETT |p2| NIL . #6#)
                       (LETT #3# |supp| . #6#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |p2| (CAR #3#) . #6#) NIL)
                             (NULL |flag|))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |p1| |p2| (QREFELT $ 52))
                           (SEQ
                            (LETT |rp2| (CONS (LIST (QCAR |pel|) |i|) |rp2|)
                                  . #6#)
                            (EXIT
                             (COND ((NULL |ls2|) (LETT |flag| NIL . #6#))
                                   ('T
                                    (SEQ (LETT |pel| (|SPADfirst| |ls2|) . #6#)
                                         (LETT |p1| (QCDR |pel|) . #6#)
                                         (EXIT
                                          (LETT |ls2| (CDR |ls2|)
                                                . #6#)))))))))))
                       (LETT #3#
                             (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |rp2|
                        (SPADCALL (CONS #'|PERMGRP;ls_to_lnni!1| $) |rp2|
                                  (QREFELT $ 67))
                        . #6#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #6#)
                    (SEQ (LETT |pp| NIL . #6#) (LETT #1# |rp2| . #6#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |pp| (CAR #1#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (SPADCALL |pp| (QREFELT $ 68)) #2#)
                                 . #6#)))
                         (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |PERMGRP;ls_to_lnni!1| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (SPADCALL |y| (QREFELT $ 64))
                  (QREFELT $ 65))) 

(SDEFUN |PERMGRP;ls_to_lnni!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 59))) 

(SDEFUN |PERMGRP;perm_to_vec;LPNniV;14|
        ((|supp| |List| S) (|p| |Permutation| S)
         (|degree| |NonNegativeInteger|) ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G892 NIL) (|pp| NIL) (#2=#:G893 NIL) (|ip| NIL)
          (|il| #3=(|List| (|NonNegativeInteger|))) (|pl| #3#) (#4=#:G891 NIL)
          (|i| NIL) (|q| (|Vector| (|NonNegativeInteger|)))
          (|pr|
           (|Record| (|:| |preimage| (|List| S)) (|:| |image| (|List| S)))))
         (SEQ
          (LETT |pr| (SPADCALL |p| (QREFELT $ 49))
                . #5=(|PERMGRP;perm_to_vec;LPNniV;14|))
          (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28)) . #5#)
          (SEQ (LETT |i| 1 . #5#) (LETT #4# |degree| . #5#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ (EXIT (SPADCALL |q| |i| |i| (QREFELT $ 69))))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |pl| (|PERMGRP;ls_to_lnni| (QCAR |pr|) |supp| $) . #5#)
          (LETT |il| (|PERMGRP;ls_to_lnni| (QCDR |pr|) |supp| $) . #5#)
          (SEQ (LETT |ip| NIL . #5#) (LETT #2# |il| . #5#)
               (LETT |pp| NIL . #5#) (LETT #1# |pl| . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #5#) NIL)
                     (ATOM #2#) (PROGN (LETT |ip| (CAR #2#) . #5#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |q| |pp| |ip| (QREFELT $ 69))))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |q|)))) 

(SDEFUN |PERMGRP;perm_to_vec;LPNniV;15|
        ((|supp| |List| S) (|p| |Permutation| S)
         (|degree| |NonNegativeInteger|) ($ |Vector| (|NonNegativeInteger|)))
        (SPROG
         ((|pos2| (|Integer|)) (|newEl| (S)) (#1=#:G899 NIL) (|i| NIL)
          (|q| (|Vector| (|NonNegativeInteger|))))
         (SEQ
          (LETT |q| (SPADCALL |degree| 0 (QREFELT $ 28))
                . #2=(|PERMGRP;perm_to_vec;LPNniV;15|))
          (SEQ (LETT |i| 1 . #2#) (LETT #1# |degree| . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |newEl|
                      (SPADCALL |p| (SPADCALL |supp| |i| (QREFELT $ 42))
                                (QREFELT $ 43))
                      . #2#)
                (LETT |pos2| (SPADCALL |newEl| |supp| (QREFELT $ 71)) . #2#)
                (EXIT (SPADCALL |q| |i| |pos2| (QREFELT $ 69))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |q|)))) 

(SDEFUN |PERMGRP;orbitWithSvc1|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|grpinv| |List| (|Vector| (|NonNegativeInteger|)))
         (|point| . #1=(|NonNegativeInteger|))
         ($ |Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
          (|:| |svc| (|Vector| (|Integer|)))))
        (SPROG
         ((|position| (|Integer|)) (|orbit_size| (|NonNegativeInteger|))
          (|orbit| (|List| #1#)) (|newPoint| (|NonNegativeInteger|))
          (#2=#:G910 NIL) (|i| NIL) (#3=#:G911 NIL) (|grv| NIL)
          (|schreierVector| (|Vector| (|Integer|)))
          (|orbitv| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (LETT |degree| (SPADCALL (|SPADfirst| |group|) (QREFELT $ 27))
                . #4=(|PERMGRP;orbitWithSvc1|))
          (LETT |orbit| (LIST |point|) . #4#)
          (LETT |orbitv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #4#)
          (SPADCALL |orbitv| 1 |point| (QREFELT $ 69))
          (LETT |orbit_size| 1 . #4#)
          (LETT |schreierVector| (MAKEARR1 |degree| -2) . #4#)
          (SPADCALL |schreierVector| |point| -1 (QREFELT $ 73))
          (LETT |position| 1 . #4#)
          (SEQ G190 (COND ((NULL (NULL (ZEROP |position|))) (GO G191)))
               (SEQ
                (SEQ (LETT |grv| NIL . #4#) (LETT #3# |grpinv| . #4#)
                     (LETT |i| 1 . #4#) (LETT #2# (LENGTH |grpinv|) . #4#) G190
                     (COND
                      ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                           (PROGN (LETT |grv| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |newPoint|
                            (QAREF1O |orbitv| (+ (- |orbit_size| |position|) 1)
                                     1)
                            . #4#)
                      (LETT |newPoint| (QAREF1O |grv| |newPoint| 1) . #4#)
                      (EXIT
                       (COND
                        ((EQL (QAREF1O |schreierVector| |newPoint| 1) -2)
                         (SEQ (LETT |orbit| (CONS |newPoint| |orbit|) . #4#)
                              (LETT |orbit_size| (+ |orbit_size| 1) . #4#)
                              (SPADCALL |orbitv| |orbit_size| |newPoint|
                                        (QREFELT $ 69))
                              (LETT |position| (+ |position| 1) . #4#)
                              (EXIT
                               (SPADCALL |schreierVector| |newPoint| |i|
                                         (QREFELT $ 73))))))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |position| (- |position| 1) . #4#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (NREVERSE |orbit|) |schreierVector|))))) 

(SDEFUN |PERMGRP;orbitWithSvc|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|point| |NonNegativeInteger|)
         ($ |Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
          (|:| |svc| (|Vector| (|Integer|)))))
        (SPROG
         ((|grpinv| (|List| (|Vector| (|NonNegativeInteger|)))) (#1=#:G915 NIL)
          (|el| NIL))
         (SEQ (LETT |grpinv| NIL . #2=(|PERMGRP;orbitWithSvc|))
              (SEQ (LETT |el| NIL . #2#) (LETT #1# |group| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |grpinv| (CONS (|PERMGRP;inv| |el| $) |grpinv|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |grpinv| (REVERSE |grpinv|) . #2#)
              (EXIT (|PERMGRP;orbitWithSvc1| |group| |grpinv| |point| $))))) 

(SDEFUN |PERMGRP;bsgs1|
        ((|group| |List| (|Vector| (|NonNegativeInteger|)))
         (|number1| |NonNegativeInteger|)
         (|words| |List| (|List| (|NonNegativeInteger|)))
         (|maxLoops| |Integer|) (|gp| $) (|diff| |Integer|)
         (|out| |Reference|
          (|List| (|List| (|Vector| (|NonNegativeInteger|)))))
         (|outword| |Reference|
          (|List| (|List| (|List| (|NonNegativeInteger|)))))
         ($ . #1=(|NonNegativeInteger|)))
        (SPROG
         ((|sizeOfGroup| (|NonNegativeInteger|)) (|k2| #1#) (#2=#:G939 NIL)
          (|j| (|Integer|))
          (|words3| #3=(|List| (|List| (|NonNegativeInteger|))))
          (|help| (|List| (|NonNegativeInteger|)))
          (|group2| #4=(|List| (|Vector| (|NonNegativeInteger|))))
          (|el2| (|Vector| (|NonNegativeInteger|)))
          (|str|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|ran|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|words2| #3#) (|gpsgs| #4#) (#5=#:G942 NIL)
          (|k| (|List| (|NonNegativeInteger|))) (#6=#:G937 NIL) (#7=#:G941 NIL)
          (|jj| NIL) (|gplength| (|NonNegativeInteger|)) (#8=#:G938 NIL)
          (|k1| (|NonNegativeInteger|))
          (|ort|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (#9=#:G940 NIL) (|i| NIL) (|wordProblem| (|Boolean|))
          (|gp_info|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|))))))
          (|degree| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |degree| (SPADCALL (|SPADfirst| |group|) (QREFELT $ 27))
                  . #10=(|PERMGRP;bsgs1|))
            (LETT |gp_info| (QCDR |gp|) . #10#)
            (LETT |wordProblem| (NULL (NULL |words|)) . #10#)
            (SEQ
             (EXIT
              (SEQ (LETT |i| |number1| . #10#) (LETT #9# |degree| . #10#) G190
                   (COND ((> |i| #9#) (GO G191)))
                   (SEQ
                    (LETT |ort| (|PERMGRP;orbitWithSvc| |group| |i| $) . #10#)
                    (LETT |k| (QCAR |ort|) . #10#)
                    (LETT |k1| (SPADCALL |k| (QREFELT $ 22)) . #10#)
                    (EXIT
                     (COND
                      ((SPADCALL |k1| 1 (QREFELT $ 24))
                       (PROGN (LETT #8# |$NoValue| . #10#) (GO #11=#:G919))))))
                   (LETT |i| (+ |i| 1) . #10#) (GO G190) G191 (EXIT NIL)))
             #11# (EXIT #8#))
            (LETT |gpsgs| NIL . #10#) (LETT |words2| NIL . #10#)
            (LETT |gplength| (LENGTH |group|) . #10#)
            (SEQ
             (EXIT
              (SEQ (LETT |jj| 1 . #10#) (LETT #7# |gplength| . #10#) G190
                   (COND ((|greater_SI| |jj| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL |group| |jj| (QREFELT $ 45)) |i|
                                  (QREFELT $ 74))
                        |i| (QREFELT $ 24))
                       (PROGN (LETT #6# |$NoValue| . #10#) (GO #12=#:G922))))))
                   (LETT |jj| (|inc_SI| |jj|) . #10#) (GO G190) G191
                   (EXIT NIL)))
             #12# (EXIT #6#))
            (SEQ (LETT |k| 1 . #10#) (LETT #5# |gplength| . #10#) G190
                 (COND ((|greater_SI| |k| #5#) (GO G191)))
                 (SEQ (LETT |el2| (SPADCALL |group| |k| (QREFELT $ 45)) . #10#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |el2| |i| (QREFELT $ 74)) |i|
                                   (QREFELT $ 24))
                         (SEQ (LETT |gpsgs| (CONS |el2| |gpsgs|) . #10#)
                              (EXIT
                               (COND
                                (|wordProblem|
                                 (LETT |words2|
                                       (CONS
                                        (SPADCALL |words| |k| (QREFELT $ 46))
                                        |words2|)
                                       . #10#))))))
                        ('T
                         (SEQ
                          (LETT |gpsgs|
                                (CONS
                                 (|PERMGRP;times|
                                  (SPADCALL |group| |jj| (QREFELT $ 45)) |el2|
                                  $)
                                 |gpsgs|)
                                . #10#)
                          (EXIT
                           (COND
                            (|wordProblem|
                             (LETT |words2|
                                   (CONS
                                    (SPADCALL
                                     (SPADCALL |words| |jj| (QREFELT $ 46))
                                     (SPADCALL |words| |k| (QREFELT $ 46))
                                     (QREFELT $ 33))
                                    |words2|)
                                   . #10#)))))))))
                 (LETT |k| (|inc_SI| |k|) . #10#) (GO G190) G191 (EXIT NIL))
            (LETT |group2| NIL . #10#) (LETT |words3| NIL . #10#)
            (LETT |j| 15 . #10#)
            (SEQ G190 (COND ((NULL (SPADCALL |j| 0 (QREFELT $ 47))) (GO G191)))
                 (SEQ
                  (LETT |ran| (|PERMGRP;ranelt| |group| |words| |maxLoops| $)
                        . #10#)
                  (LETT |str|
                        (|PERMGRP;strip1| (QCAR |ran|) |ort| |group| |words| $)
                        . #10#)
                  (LETT |el2| (QCAR |str|) . #10#)
                  (COND
                   ((NULL (|PERMGRP;testIdentity| |el2| $))
                    (COND
                     ((NULL (SPADCALL |el2| |group2| (QREFELT $ 75)))
                      (SEQ (LETT |group2| (CONS |el2| |group2|) . #10#)
                           (COND
                            (|wordProblem|
                             (SEQ
                              (LETT |help|
                                    (SPADCALL (REVERSE (QCDR |str|))
                                              (QCDR |ran|) (QREFELT $ 33))
                                    . #10#)
                              (LETT |help|
                                    (|PERMGRP;shortenWord| |help| |gp| $)
                                    . #10#)
                              (EXIT
                               (LETT |words3| (CONS |help| |words3|)
                                     . #10#)))))
                           (EXIT (LETT |j| (- |j| 2) . #10#)))))))
                  (EXIT (LETT |j| (- |j| 1) . #10#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             (|wordProblem| (LETT |maxLoops| (- |maxLoops| |diff|) . #10#)))
            (COND
             ((OR (NULL |group2|) (< |maxLoops| 0))
              (SEQ (QSETVELT |gp_info| 2 (LIST |i|))
                   (SPADCALL |out| (LIST |gpsgs|) (QREFELT $ 78))
                   (SPADCALL |outword| (LIST |words2|) (QREFELT $ 81))
                   (EXIT (PROGN (LETT #2# |k1| . #10#) (GO #13=#:G936))))))
            (LETT |k2|
                  (|PERMGRP;bsgs1| |group2| (+ |i| 1) |words3| |maxLoops| |gp|
                   |diff| |out| |outword| $)
                  . #10#)
            (LETT |sizeOfGroup| (* |k1| |k2|) . #10#)
            (SPADCALL |out|
                      (SPADCALL (SPADCALL |out| (QREFELT $ 82)) (LIST |gpsgs|)
                                (QREFELT $ 83))
                      (QREFELT $ 78))
            (SPADCALL |outword|
                      (SPADCALL (SPADCALL |outword| (QREFELT $ 84))
                                (LIST |words2|) (QREFELT $ 85))
                      (QREFELT $ 81))
            (QSETVELT |gp_info| 2 (CONS |i| (QVELT |gp_info| 2)))
            (EXIT |sizeOfGroup|)))
          #13# (EXIT #2#)))) 

(SDEFUN |PERMGRP;reduceGenerators|
        ((|kkk| |Integer|) (|do_words| |Boolean|)
         (|gp_info| |Record| (|:| |order| (|NonNegativeInteger|))
          (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
          (|:| |gpbase| #1=(|List| (|NonNegativeInteger|)))
          (|:| |orbs|
               #2=(|Vector|
                   (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                             (|:| |svc| (|Vector| (|Integer|))))))
          (|:| |mp| (|List| S))
          (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))
         (|outl| |List| (|List| (|Vector| (|NonNegativeInteger|))))
         (|outword| |List| (|List| (|List| (|NonNegativeInteger|))))
         ($ |List| (|Vector| (|NonNegativeInteger|))))
        (SPROG
         ((|i| (|NonNegativeInteger|))
          (|outlk| (|List| (|Vector| (|NonNegativeInteger|))))
          (|grpinv| #3=(|List| (|Vector| (|NonNegativeInteger|)))) (|sgs| #3#)
          (|res| #3#)
          (|obs2|
           #4=(|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                        (|:| |svc| (|Vector| (|Integer|)))))
          (|grpinv2| #5=(|List| (|Vector| (|NonNegativeInteger|))))
          (|sgs2| #5#) (|pos| (|Integer|)) (|removedGenerator| (|Boolean|))
          (|obs_len| #6=(|NonNegativeInteger|)) (|obs| #4#) (|pt| (|Integer|))
          (|baseLength| #6#) (#7=#:G963 NIL) (|orbv| #2#) (|base_lst| #1#))
         (SEQ
          (LETT |base_lst| (QVELT |gp_info| 2)
                . #8=(|PERMGRP;reduceGenerators|))
          (LETT |orbv| (QVELT |gp_info| 3) . #8#) (LETT |sgs| NIL . #8#)
          (LETT |res| NIL . #8#) (LETT |grpinv| NIL . #8#)
          (SEQ (LETT |i| 1 . #8#) (LETT #7# |kkk| . #8#) G190
               (COND ((|greater_SI| |i| #7#) (GO G191)))
               (SEQ
                (LETT |sgs|
                      (SPADCALL |sgs| (SPADCALL |outl| |i| (QREFELT $ 86))
                                (QREFELT $ 87))
                      . #8#)
                (EXIT
                 (LETT |grpinv|
                       (SPADCALL |grpinv|
                                 (SPADCALL (CONS (|function| |PERMGRP;inv|) $)
                                           (SPADCALL |outl| |i| (QREFELT $ 86))
                                           (QREFELT $ 89))
                                 (QREFELT $ 87))
                       . #8#)))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (LETT |removedGenerator| NIL . #8#)
          (LETT |baseLength| (SPADCALL |base_lst| (QREFELT $ 22)) . #8#)
          (LETT |pt| (+ (- |baseLength| |kkk|) 1) . #8#)
          (LETT |obs|
                (|PERMGRP;orbitWithSvc1| |sgs| |grpinv|
                 (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $)
                . #8#)
          (SPADCALL |orbv| |kkk| |obs| (QREFELT $ 92))
          (LETT |obs_len| (SPADCALL (QCAR |obs|) (QREFELT $ 22)) . #8#)
          (COND
           ((EQL |obs_len| 1)
            (SEQ (LETT |removedGenerator| 'T . #8#)
                 (EXIT (SPADCALL |outl| |kkk| NIL (QREFELT $ 93))))))
          (LETT |i| 1 . #8#)
          (LETT |outlk| (SPADCALL |outl| |kkk| (QREFELT $ 86)) . #8#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((SPADCALL |i| (LENGTH |outlk|) (QREFELT $ 94)) NIL)
                        ('T (SPADCALL (LENGTH |outlk|) 1 (QREFELT $ 94)))))
                 (GO G191)))
               (SEQ
                (LETT |pos|
                      (SPADCALL (SPADCALL |outlk| |i| (QREFELT $ 45)) |sgs|
                                (QREFELT $ 95))
                      . #8#)
                (LETT |sgs2| (SPADCALL |sgs| |pos| (QREFELT $ 96)) . #8#)
                (LETT |grpinv2| (SPADCALL |grpinv| |pos| (QREFELT $ 96)) . #8#)
                (LETT |obs2|
                      (|PERMGRP;orbitWithSvc1| |sgs2| |grpinv2|
                       (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $)
                      . #8#)
                (EXIT
                 (COND
                  ((EQL (SPADCALL (QCAR |obs2|) (QREFELT $ 22)) |obs_len|)
                   (SEQ
                    (LETT |res|
                          (CONS (SPADCALL |outlk| |i| (QREFELT $ 45)) |res|)
                          . #8#)
                    (LETT |sgs| |sgs2| . #8#) (LETT |grpinv| |grpinv2| . #8#)
                    (LETT |outlk| (SPADCALL |outlk| |i| (QREFELT $ 96)) . #8#)
                    (SPADCALL |outl| |kkk| |outlk| (QREFELT $ 93))
                    (SPADCALL |orbv| |kkk| |obs2| (QREFELT $ 92))
                    (EXIT
                     (COND
                      (|do_words|
                       (SPADCALL |outword| |kkk|
                                 (SPADCALL
                                  (SPADCALL |outword| |kkk| (QREFELT $ 97)) |i|
                                  (QREFELT $ 98))
                                 (QREFELT $ 99)))))))
                  ('T (LETT |i| (+ |i| 1) . #8#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |PERMGRP;bsgs|
        ((|group| $) (|wordProblem| |Boolean|) (|maxLoops| |Integer|)
         (|diff| |Integer|) ($ |NonNegativeInteger|))
        (SPROG
         ((|sizeOfGroup| (|NonNegativeInteger|)) (#1=#:G1020 NIL) (|j| NIL)
          (|kkk| (|Integer|))
          (|outword| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|out| (|List| (|List| (|Vector| (|NonNegativeInteger|)))))
          (|orbv|
           (|Vector|
            (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                      (|:| |svc| (|Vector| (|Integer|))))))
          (#2=#:G1007 NIL) (|baseOfGroup| (|List| (|NonNegativeInteger|)))
          (#3=#:G1019 NIL) (|i| NIL)
          (|word| #4=(|List| (|NonNegativeInteger|)))
          (|ttt| (|Vector| (|NonNegativeInteger|)))
          (|word2| (|List| (|NonNegativeInteger|))) (#5=#:G1018 NIL)
          (|wdi| NIL) (|add_cnt| (|Integer|)) (|noAnswer| #6=(|Boolean|))
          (#7=#:G1008 NIL) (|basePoint| (|NonNegativeInteger|)) (#8=#:G983 NIL)
          (|newBasePoint| #6#) (#9=#:G1017 NIL) (|p| NIL) (|ii| NIL)
          (|z| #10=(|Vector| (|NonNegativeInteger|)))
          (|ppp|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|noresult| #6#) (#11=#:G1016 NIL) (|jjj| NIL) (|word3| #4#)
          (|y1| (|Vector| (|NonNegativeInteger|))) (#12=#:G1015 NIL) (|pt| NIL)
          (#13=#:G1014 NIL) (|z0| NIL)
          (|gporbi|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|wordlist| #14=(|List| (|List| (|NonNegativeInteger|))))
          (|sgsv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (|sgs| #15=(|List| (|Vector| (|NonNegativeInteger|))))
          (|rejects| (|List| (|Vector| (|NonNegativeInteger|))))
          (#16=#:G1013 NIL) (#17=#:G1012 NIL)
          (|dummy_rec|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|newGroup| #15#) (|k| (|NonNegativeInteger|)) (|words| #14#)
          (|q| (|Vector| (|NonNegativeInteger|))) (#18=#:G1010 NIL) (|ggg| NIL)
          (#19=#:G1011 NIL) (|ggp| NIL) (|gp| (|List| (|Permutation| S)))
          (|tmpv| #10#) (#20=#:G1009 NIL)
          (|gp_info|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|))))))
          (|degree| (|NonNegativeInteger|)) (|supp| (|List| S))
          (|outwordr|
           (|Reference| (|List| (|List| (|List| (|NonNegativeInteger|))))))
          (|outr|
           (|Reference| (|List| (|List| (|Vector| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |basePoint| 0 . #21=(|PERMGRP;bsgs|))
                (LETT |newBasePoint| NIL . #21#)
                (LETT |baseOfGroup| NIL . #21#) (LETT |out| NIL . #21#)
                (LETT |outword| NIL . #21#)
                (LETT |outr| (SPADCALL NIL (QREFELT $ 100)) . #21#)
                (LETT |outwordr| (SPADCALL NIL (QREFELT $ 101)) . #21#)
                (LETT |supp| (SPADCALL |group| (QREFELT $ 53)) . #21#)
                (LETT |degree| (LENGTH |supp|) . #21#)
                (LETT |gp_info| (VECTOR 1 NIL NIL #() NIL NIL) . #21#)
                (COND
                 ((EQL |degree| 0)
                  (SEQ (PROGN (RPLACD |group| |gp_info|) (QCDR |group|))
                       (EXIT (PROGN (LETT #20# 1 . #21#) (GO #22=#:G1006))))))
                (LETT |newGroup| NIL . #21#)
                (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #21#)
                (LETT |gp| (QCAR |group|) . #21#) (LETT |words| NIL . #21#)
                (SEQ (LETT |ggp| NIL . #21#) (LETT #19# |gp| . #21#)
                     (LETT |ggg| 1 . #21#) (LETT #18# (LENGTH |gp|) . #21#)
                     G190
                     (COND
                      ((OR (|greater_SI| |ggg| #18#) (ATOM #19#)
                           (PROGN (LETT |ggp| (CAR #19#) . #21#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |q| (SPADCALL |supp| |ggp| |degree| (QREFELT $ 70))
                            . #21#)
                      (LETT |newGroup| (CONS |q| |newGroup|) . #21#)
                      (EXIT
                       (COND
                        (|wordProblem|
                         (LETT |words|
                               (CONS (SPADCALL |ggg| (QREFELT $ 102)) |words|)
                               . #21#)))))
                     (LETT |ggg|
                           (PROG1 (|inc_SI| |ggg|)
                             (LETT #19# (CDR #19#) . #21#))
                           . #21#)
                     (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |maxLoops| 1)
                  (SEQ
                   (COND
                    ((ZEROP (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22)))
                     (LETT |k|
                           (|PERMGRP;bsgs1| |newGroup| 1 NIL 20 |group| 0
                            |outr| |outwordr| $)
                           . #21#)))
                   (EXIT
                    (LETT |maxLoops|
                          (- (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22))
                             1)
                          . #21#)))))
                (LETT |k|
                      (|PERMGRP;bsgs1| |newGroup| 1 |words| |maxLoops| |group|
                       |diff| |outr| |outwordr| $)
                      . #21#)
                (LETT |out| (SPADCALL |outr| (QREFELT $ 82)) . #21#)
                (LETT |outword| (SPADCALL |outwordr| (QREFELT $ 84)) . #21#)
                (LETT |kkk| 1 . #21#)
                (LETT |newGroup| (REVERSE |newGroup|) . #21#)
                (LETT |noAnswer| 'T . #21#) (LETT |add_cnt| 0 . #21#)
                (LETT |dummy_rec| (CONS NIL (MAKE-ARRAY 0)) . #21#)
                (LETT |baseOfGroup| (QVELT (QCDR |group|) 2) . #21#)
                (QSETVELT |gp_info| 2 |baseOfGroup|)
                (LETT |orbv|
                      (MAKEARR1 (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                |dummy_rec|)
                      . #21#)
                (SEQ G190 (COND ((NULL |noAnswer|) (GO G191)))
                     (SEQ (QSETVELT |gp_info| 2 |baseOfGroup|)
                          (QSETVELT |gp_info| 3 |orbv|) (LETT |sgs| NIL . #21#)
                          (LETT |wordlist| NIL . #21#)
                          (SEQ (LETT |i| 1 . #21#)
                               (LETT #17# (- |kkk| 1) . #21#) G190
                               (COND ((|greater_SI| |i| #17#) (GO G191)))
                               (SEQ
                                (LETT |sgs|
                                      (SPADCALL |sgs|
                                                (SPADCALL |out| |i|
                                                          (QREFELT $ 86))
                                                (QREFELT $ 87))
                                      . #21#)
                                (EXIT
                                 (COND
                                  (|wordProblem|
                                   (LETT |wordlist|
                                         (SPADCALL |wordlist|
                                                   (SPADCALL |outword| |i|
                                                             (QREFELT $ 97))
                                                   (QREFELT $ 103))
                                         . #21#)))))
                               (LETT |i| (|inc_SI| |i|) . #21#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |noresult| 'T . #21#)
                          (LETT |z| (SPADCALL |degree| 0 (QREFELT $ 28))
                                . #21#)
                          (SEQ (LETT |i| |kkk| . #21#)
                               (LETT #16#
                                     (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                     . #21#)
                               G190
                               (COND
                                ((OR (> |i| #16#) (NULL |noresult|))
                                 (GO G191)))
                               (SEQ
                                (LETT |rejects|
                                      (|PERMGRP;reduceGenerators| |i|
                                       |wordProblem| |gp_info| |out| |outword|
                                       $)
                                      . #21#)
                                (LETT |sgs|
                                      (SPADCALL |sgs|
                                                (SPADCALL |out| |i|
                                                          (QREFELT $ 86))
                                                (QREFELT $ 87))
                                      . #21#)
                                (LETT |sgsv| (SPADCALL |sgs| (QREFELT $ 35))
                                      . #21#)
                                (LETT |wordv| (MAKE-ARRAY 0) . #21#)
                                (COND
                                 (|wordProblem|
                                  (SEQ
                                   (LETT |wordlist|
                                         (SPADCALL |wordlist|
                                                   (SPADCALL |outword| |i|
                                                             (QREFELT $ 97))
                                                   (QREFELT $ 103))
                                         . #21#)
                                   (EXIT
                                    (LETT |wordv|
                                          (SPADCALL |wordlist| (QREFELT $ 37))
                                          . #21#)))))
                                (LETT |gporbi|
                                      (SPADCALL |orbv| |i| (QREFELT $ 104))
                                      . #21#)
                                (SEQ (LETT |z0| NIL . #21#)
                                     (LETT #13# |rejects| . #21#) G190
                                     (COND
                                      ((OR (ATOM #13#)
                                           (PROGN
                                            (LETT |z0| (CAR #13#) . #21#)
                                            NIL)
                                           (NULL |noresult|))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |z| (SPADCALL |z0| (QREFELT $ 105))
                                            . #21#)
                                      (LETT |ppp|
                                            (|PERMGRP;strip| |z| |i| NIL |orbv|
                                             |sgsv| |wordv| $)
                                            . #21#)
                                      (LETT |noresult|
                                            (|PERMGRP;testIdentity|
                                             (QCAR |ppp|) $)
                                            . #21#)
                                      (EXIT
                                       (COND
                                        ((NULL |noresult|)
                                         (SEQ
                                          (COND
                                           (|wordProblem|
                                            (SEQ
                                             (LETT |z|
                                                   (SPADCALL |z0|
                                                             (QREFELT $ 105))
                                                   . #21#)
                                             (EXIT
                                              (LETT |ppp|
                                                    (|PERMGRP;strip| |z| |i| 'T
                                                     |orbv| |sgsv| |wordv| $)
                                                    . #21#)))))
                                          (LETT |z| (QCAR |ppp|) . #21#)
                                          (EXIT
                                           (LETT |word| (QCDR |ppp|)
                                                 . #21#)))))))
                                     (LETT #13# (CDR #13#) . #21#) (GO G190)
                                     G191 (EXIT NIL))
                                (SEQ (LETT |pt| NIL . #21#)
                                     (LETT #12# (QCAR |gporbi|) . #21#) G190
                                     (COND
                                      ((OR (ATOM #12#)
                                           (PROGN
                                            (LETT |pt| (CAR #12#) . #21#)
                                            NIL)
                                           (NULL |noresult|))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |ppp|
                                            (|PERMGRP;cosetRep1| |pt|
                                             |wordProblem| |gporbi| |sgsv|
                                             |wordv| $)
                                            . #21#)
                                      (LETT |y1| (|PERMGRP;inv| (QCAR |ppp|) $)
                                            . #21#)
                                      (LETT |word3| (QCDR |ppp|) . #21#)
                                      (EXIT
                                       (SEQ (LETT |jjj| 1 . #21#)
                                            (LETT #11# (LENGTH |sgs|) . #21#)
                                            G190
                                            (COND
                                             ((OR (|greater_SI| |jjj| #11#)
                                                  (NULL |noresult|))
                                              (GO G191)))
                                            (SEQ (LETT |word| NIL . #21#)
                                                 (|PERMGRP;times!| |z|
                                                  (QAREF1O |sgsv| |jjj| 1) |y1|
                                                  $)
                                                 (COND
                                                  (|wordProblem|
                                                   (LETT |word|
                                                         (QAREF1O |wordv| |jjj|
                                                                  1)
                                                         . #21#)))
                                                 (LETT |ppp|
                                                       (|PERMGRP;strip| |z| |i|
                                                        NIL |orbv| |sgsv|
                                                        |wordv| $)
                                                       . #21#)
                                                 (LETT |z| (QCAR |ppp|) . #21#)
                                                 (LETT |noresult|
                                                       (|PERMGRP;testIdentity|
                                                        |z| $)
                                                       . #21#)
                                                 (EXIT
                                                  (COND
                                                   ((NULL |noresult|)
                                                    (COND
                                                     (|wordProblem|
                                                      (SEQ
                                                       (LETT |z|
                                                             (|PERMGRP;times|
                                                              (QAREF1O |sgsv|
                                                                       |jjj| 1)
                                                              |y1| $)
                                                             . #21#)
                                                       (LETT |ppp|
                                                             (|PERMGRP;strip|
                                                              |z| |i| 'T |orbv|
                                                              |sgsv| |wordv| $)
                                                             . #21#)
                                                       (LETT |z| (QCAR |ppp|)
                                                             . #21#)
                                                       (EXIT
                                                        (LETT |word|
                                                              (SPADCALL
                                                               (QCDR |ppp|)
                                                               |word|
                                                               (QREFELT $ 33))
                                                              . #21#)))))))))
                                            (LETT |jjj| (|inc_SI| |jjj|)
                                                  . #21#)
                                            (GO G190) G191 (EXIT NIL))))
                                     (LETT #12# (CDR #12#) . #21#) (GO G190)
                                     G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((NULL |noresult|)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |ii| 1 . #21#)
                                          (LETT |p| NIL . #21#)
                                          (LETT #9# |baseOfGroup| . #21#) G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |p| (CAR #9#) . #21#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ (LETT |basePoint| 1 . #21#)
                                               (LETT |newBasePoint| 'T . #21#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QAREF1O |z| |p| 1)
                                                            |p| (QREFELT $ 24))
                                                  (SEQ
                                                   (LETT |newBasePoint| NIL
                                                         . #21#)
                                                   (LETT |basePoint|
                                                         (PROG1
                                                             (LETT #8#
                                                                   (+
                                                                    (-
                                                                     (SPADCALL
                                                                      |baseOfGroup|
                                                                      (QREFELT
                                                                       $ 22))
                                                                     |ii|)
                                                                    1)
                                                                   . #21#)
                                                           (|check_subtype2|
                                                            (>= #8# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #8#))
                                                         . #21#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #7# |$NoValue|
                                                           . #21#)
                                                     (GO #23=#:G986))))))))
                                          (LETT #9#
                                                (PROG1 (CDR #9#)
                                                  (LETT |ii| (|inc_SI| |ii|)
                                                        . #21#))
                                                . #21#)
                                          (GO G190) G191 (EXIT NIL)))
                                    #23# (EXIT #7#))))))
                               (LETT |i| (+ |i| 1) . #21#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |noAnswer|
                                (NULL (|PERMGRP;testIdentity| |z| $)) . #21#)
                          (EXIT
                           (COND
                            (|noAnswer|
                             (SEQ (LETT |add_cnt| (+ |add_cnt| 1) . #21#)
                                  (LETT |word2| NIL . #21#)
                                  (COND
                                   (|wordProblem|
                                    (SEQ
                                     (SEQ (LETT |wdi| NIL . #21#)
                                          (LETT #5# |word3| . #21#) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |wdi| (CAR #5#) . #21#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |ttt|
                                                 (SPADCALL |newGroup| |wdi|
                                                           (QREFELT $ 45))
                                                 . #21#)
                                           (EXIT
                                            (SEQ G190
                                                 (COND
                                                  ((NULL
                                                    (NULL
                                                     (|PERMGRP;testIdentity|
                                                      |ttt| $)))
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |word2|
                                                        (CONS |wdi| |word2|)
                                                        . #21#)
                                                  (EXIT
                                                   (LETT |ttt|
                                                         (|PERMGRP;times| |ttt|
                                                          (SPADCALL |newGroup|
                                                                    |wdi|
                                                                    (QREFELT $
                                                                             45))
                                                          $)
                                                         . #21#)))
                                                 NIL (GO G190) G191
                                                 (EXIT NIL))))
                                          (LETT #5# (CDR #5#) . #21#) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |word|
                                           (SPADCALL |word| |word2|
                                                     (QREFELT $ 33))
                                           . #21#)
                                     (EXIT
                                      (LETT |word|
                                            (|PERMGRP;shortenWord| |word|
                                             |group| $)
                                            . #21#)))))
                                  (COND
                                   (|newBasePoint|
                                    (SEQ
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |i| 1 . #21#)
                                            (LETT #3# |degree| . #21#) G190
                                            (COND
                                             ((|greater_SI| |i| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((SPADCALL
                                                 (SPADCALL |z| |i|
                                                           (QREFELT $ 74))
                                                 |i| (QREFELT $ 24))
                                                (SEQ
                                                 (LETT |baseOfGroup|
                                                       (SPADCALL |baseOfGroup|
                                                                 (LIST |i|)
                                                                 (QREFELT $
                                                                          33))
                                                       . #21#)
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #2# |$NoValue| . #21#)
                                                   (GO #24=#:G998))))))))
                                            (LETT |i| (|inc_SI| |i|) . #21#)
                                            (GO G190) G191 (EXIT NIL)))
                                      #24# (EXIT #2#))
                                     (LETT |orbv|
                                           (MAKEARR1
                                            (SPADCALL |baseOfGroup|
                                                      (QREFELT $ 22))
                                            |dummy_rec|)
                                           . #21#)
                                     (LETT |out|
                                           (CONS (SPADCALL |z| (QREFELT $ 106))
                                                 |out|)
                                           . #21#)
                                     (EXIT
                                      (COND
                                       (|wordProblem|
                                        (LETT |outword|
                                              (CONS
                                               (SPADCALL |word|
                                                         (QREFELT $ 107))
                                               |outword|)
                                              . #21#))))))
                                   ('T
                                    (SEQ
                                     (SPADCALL |out| |basePoint|
                                               (CONS |z|
                                                     (SPADCALL |out|
                                                               |basePoint|
                                                               (QREFELT $ 86)))
                                               (QREFELT $ 93))
                                     (EXIT
                                      (COND
                                       (|wordProblem|
                                        (SPADCALL |outword| |basePoint|
                                                  (CONS |word|
                                                        (SPADCALL |outword|
                                                                  |basePoint|
                                                                  (QREFELT $
                                                                           97)))
                                                  (QREFELT $ 99))))))))
                                  (EXIT (LETT |kkk| |basePoint| . #21#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |sizeOfGroup| 1 . #21#)
                (SEQ (LETT |j| 1 . #21#)
                     (LETT #1# (SPADCALL |baseOfGroup| (QREFELT $ 22)) . #21#)
                     G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |sizeOfGroup|
                             (* |sizeOfGroup|
                                (SPADCALL
                                 (QCAR (SPADCALL |orbv| |j| (QREFELT $ 104)))
                                 (QREFELT $ 22)))
                             . #21#)))
                     (LETT |j| (|inc_SI| |j|) . #21#) (GO G190) G191
                     (EXIT NIL))
                (PROGN
                 (RPLACD |group|
                         (VECTOR |sizeOfGroup| |sgs| |baseOfGroup| |orbv|
                                 |supp| |wordlist|))
                 (QCDR |group|))
                (EXIT |sizeOfGroup|)))
          #22# (EXIT #20#)))) 

(SDEFUN |PERMGRP;initialize| ((|group| $) ($ |Set| (|Permutation| S)))
        (SPROG
         ((#1=#:G1025 NIL) (|gen| NIL) (|gp| (|List| (|Permutation| S)))
          (|group2| (|Set| (|Permutation| S))))
         (SEQ
          (LETT |group2| (SPADCALL (QREFELT $ 109))
                . #2=(|PERMGRP;initialize|))
          (LETT |gp| (QCAR |group|) . #2#)
          (SEQ (LETT |gen| NIL . #2#) (LETT #1# |gp| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |gen| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |gen| (QREFELT $ 110)) 0 (QREFELT $ 94))
                   (SPADCALL |gen| |group2| (QREFELT $ 111))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |group2|)))) 

(SDEFUN |PERMGRP;knownGroup?| ((|gp| $) ($ |Void|))
        (SEQ
         (COND
          ((EQL (QVELT (QCDR |gp|) 0) 0) (|PERMGRP;bsgs| |gp| NIL 20 0 $)))
         (EXIT (SPADCALL (QREFELT $ 113))))) 

(SDEFUN |PERMGRP;subgroup| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G1036 NIL) (#2=#:G1037 NIL) (#3=#:G1038 NIL) (|el| NIL)
          (|gpset2| #4=(|Set| (|Permutation| S))) (|gpset1| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gpset1| (|PERMGRP;initialize| |gp1| $)
                  . #5=(|PERMGRP;subgroup|))
            (LETT |gpset2| (|PERMGRP;initialize| |gp2| $) . #5#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |gpset1| |gpset2| (QREFELT $ 114))
                         (QREFELT $ 115))
               'T)
              ('T
               (SEQ
                (SEQ
                 (EXIT
                  (SEQ (LETT |el| NIL . #5#)
                       (LETT #3# (SPADCALL |gpset1| (QREFELT $ 116)) . #5#)
                       G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |el| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |el| |gp2| (QREFELT $ 117)))
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# NIL . #5#) (GO #6=#:G1035))
                                  . #5#)
                            (GO #7=#:G1032))))))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL)))
                 #7# (EXIT #1#))
                (EXIT 'T)))))))
          #6# (EXIT #2#)))) 

(SDEFUN |PERMGRP;memberInternal|
        ((|p| |Permutation| S) (|gp| $) (|do_words| |Boolean|)
         ($ |Record| (|:| |bool| (|Boolean|))
          (|:| |lst| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|str|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|grpv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (#1=#:G1052 NIL) (|i| NIL)
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|pp| (|Vector| (|NonNegativeInteger|)))
          (|degree| (|NonNegativeInteger|))
          (|base_lst| (|List| (|NonNegativeInteger|)))
          (|orbv|
           (|Vector|
            (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                      (|:| |svc| (|Vector| (|Integer|))))))
          (|sgsl| (|List| (|Vector| (|NonNegativeInteger|))))
          (|gp_info|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|))))))
          (#2=#:G1050 NIL) (#3=#:G1049 NIL) (#4=#:G1051 NIL) (|x| NIL)
          (|mP| (|List| S)) (|gr_supp| (|List| S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gr_supp| (SPADCALL |gp| (QREFELT $ 53))
                  . #5=(|PERMGRP;memberInternal|))
            (LETT |mP| (SPADCALL (SPADCALL |p| (QREFELT $ 56)) (QREFELT $ 58))
                  . #5#)
            (SEQ
             (EXIT
              (SEQ (LETT |x| NIL . #5#) (LETT #4# |mP| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |x| |gr_supp| (QREFELT $ 118)))
                       (PROGN
                        (LETT #3#
                              (PROGN
                               (LETT #2# (CONS NIL NIL) . #5#)
                               (GO #6=#:G1048))
                              . #5#)
                        (GO #7=#:G1042))))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
             #7# (EXIT #3#))
            (COND
             ((NULL |do_words|)
              (COND
               ((SPADCALL |p| (QCAR |gp|) (QREFELT $ 119))
                (EXIT (PROGN (LETT #2# (CONS 'T NIL) . #5#) (GO #6#)))))))
            (|PERMGRP;knownGroup?| |gp| $) (LETT |gp_info| (QCDR |gp|) . #5#)
            (LETT |sgsl| (QVELT |gp_info| 1) . #5#)
            (LETT |orbv| (QVELT |gp_info| 3) . #5#)
            (LETT |base_lst| (QVELT |gp_info| 2) . #5#)
            (LETT |degree| (LENGTH |gr_supp|) . #5#)
            (LETT |pp| (SPADCALL |gr_supp| |p| |degree| (QREFELT $ 70)) . #5#)
            (LETT |wordv| (MAKE-ARRAY 0) . #5#)
            (COND
             (|do_words|
              (SEQ (LETT |wordv| (MAKEARR1 (LENGTH |sgsl|) NIL) . #5#)
                   (EXIT
                    (SEQ (LETT |i| 1 . #5#) (LETT #1# (LENGTH |sgsl|) . #5#)
                         G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |wordv| |i| (LIST |i|) (QREFELT $ 120))))
                         (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                         (EXIT NIL))))))
            (LETT |grpv| (SPADCALL |sgsl| (QREFELT $ 35)) . #5#)
            (LETT |str|
                  (|PERMGRP;strip| |pp| (SPADCALL |base_lst| (QREFELT $ 22))
                   |do_words| |orbv| |grpv| |wordv| $)
                  . #5#)
            (EXIT
             (CONS (|PERMGRP;testIdentity| (QCAR |str|) $) (QCDR |str|)))))
          #6# (EXIT #2#)))) 

(PUT '|PERMGRP;coerce;$L;25| '|SPADreplace| 'QCAR) 

(SDEFUN |PERMGRP;coerce;$L;25| ((|gp| $) ($ |List| (|Permutation| S)))
        (QCAR |gp|)) 

(PUT '|PERMGRP;generators;$L;26| '|SPADreplace| 'QCAR) 

(SDEFUN |PERMGRP;generators;$L;26| ((|gp| $) ($ |List| (|Permutation| S)))
        (QCAR |gp|)) 

(SDEFUN |PERMGRP;strongGenerators;$L;27|
        ((|group| $) ($ |List| (|Permutation| S)))
        (SPROG
         ((|strongGens| (|List| (|Permutation| S)))
          (|pairs| (|List| (|List| S))) (#1=#:G1062 NIL) (|j| NIL)
          (#2=#:G1061 NIL) (|i| NIL) (|degree| (|NonNegativeInteger|))
          (|gr_sgs| (|List| (|Vector| (|NonNegativeInteger|))))
          (|gr_supp| (|List| S)))
         (SEQ (|PERMGRP;knownGroup?| |group| $)
              (LETT |gr_supp| (QVELT (QCDR |group|) 4)
                    . #3=(|PERMGRP;strongGenerators;$L;27|))
              (LETT |gr_sgs| (QVELT (QCDR |group|) 1) . #3#)
              (LETT |degree| (LENGTH |gr_supp|) . #3#)
              (LETT |strongGens| NIL . #3#)
              (SEQ (LETT |i| NIL . #3#) (LETT #2# |gr_sgs| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pairs| NIL . #3#)
                        (SEQ (LETT |j| 1 . #3#) (LETT #1# |degree| . #3#) G190
                             (COND ((|greater_SI| |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |pairs|
                                     (CONS
                                      (LIST
                                       (SPADCALL |gr_supp| |j| (QREFELT $ 42))
                                       (SPADCALL |gr_supp|
                                                 (SPADCALL |i| |j|
                                                           (QREFELT $ 74))
                                                 (QREFELT $ 42)))
                                      |pairs|)
                                     . #3#)))
                             (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |strongGens|
                               (CONS (SPADCALL |pairs| (QREFELT $ 122))
                                     |strongGens|)
                               . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |strongGens|))))) 

(SDEFUN |PERMGRP;elt;$NniP;28|
        ((|gp| $) (|i| |NonNegativeInteger|) ($ |Permutation| S))
        (SPADCALL (QCAR |gp|) |i| (QREFELT $ 124))) 

(SDEFUN |PERMGRP;movedPoints;$S;29| ((|gp| $) ($ |Set| S))
        (SPADCALL (SPADCALL |gp| (QREFELT $ 53)) (QREFELT $ 126))) 

(SDEFUN |PERMGRP;random;$IP;30|
        ((|group| $) (|maximalNumberOfFactors| |Integer|) ($ |Permutation| S))
        (SPROG
         ((|numberOfLoops| #1=(|Integer|)) (|randomElement| (|Permutation| S))
          (|randomInteger| #1#) (|numberOfGenerators| (|NonNegativeInteger|))
          (|gp| (|List| (|Permutation| S))))
         (SEQ
          (COND ((< |maximalNumberOfFactors| 1) (|spadConstant| $ 23))
                ('T
                 (SEQ (LETT |gp| (QCAR |group|) . #2=(|PERMGRP;random;$IP;30|))
                      (LETT |numberOfGenerators| (LENGTH |gp|) . #2#)
                      (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|))
                            . #2#)
                      (LETT |randomElement|
                            (SPADCALL |gp| |randomInteger| (QREFELT $ 124))
                            . #2#)
                      (LETT |numberOfLoops|
                            (+ 1 (RANDOM |maximalNumberOfFactors|)) . #2#)
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |numberOfLoops| 0 (QREFELT $ 47)))
                             (GO G191)))
                           (SEQ
                            (LETT |randomInteger|
                                  (+ 1 (RANDOM |numberOfGenerators|)) . #2#)
                            (LETT |randomElement|
                                  (SPADCALL
                                   (SPADCALL |gp| |randomInteger|
                                             (QREFELT $ 124))
                                   |randomElement| (QREFELT $ 128))
                                  . #2#)
                            (EXIT
                             (LETT |numberOfLoops| (- |numberOfLoops| 1)
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |randomElement|))))))) 

(SDEFUN |PERMGRP;random;$P;31| ((|group| $) ($ |Permutation| S))
        (SPADCALL |group| 20 (QREFELT $ 129))) 

(SDEFUN |PERMGRP;order;$Nni;32| ((|group| $) ($ |NonNegativeInteger|))
        (SEQ (|PERMGRP;knownGroup?| |group| $) (EXIT (QVELT (QCDR |group|) 0)))) 

(SDEFUN |PERMGRP;degree;$Nni;33| ((|group| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |group| (QREFELT $ 53)))) 

(SDEFUN |PERMGRP;base;$L;34| ((|group| $) ($ |List| S))
        (SPROG
         ((|groupBase| (|List| S)) (#1=#:G1079 NIL) (|i| NIL)
          (|gr_supp| (|List| S)) (|gr_base| (|List| (|NonNegativeInteger|))))
         (SEQ (|PERMGRP;knownGroup?| |group| $)
              (LETT |gr_base| (QVELT (QCDR |group|) 2)
                    . #2=(|PERMGRP;base;$L;34|))
              (LETT |gr_supp| (QVELT (QCDR |group|) 4) . #2#)
              (LETT |groupBase| NIL . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |gr_base| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |groupBase|
                           (CONS (SPADCALL |gr_supp| |i| (QREFELT $ 42))
                                 |groupBase|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |groupBase|))))) 

(SDEFUN |PERMGRP;wordsForStrongGenerators;$L;35|
        ((|group| $) ($ |List| (|List| (|NonNegativeInteger|))))
        (SEQ (|PERMGRP;knownGroup?| |group| $) (EXIT (QVELT (QCDR |group|) 5)))) 

(SDEFUN |PERMGRP;coerce;L$;36| ((|gp| |List| (|Permutation| S)) ($ $))
        (SPROG
         ((|group| ($))
          (|result|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (LETT |result| (VECTOR 0 NIL NIL #() NIL NIL)
                . #1=(|PERMGRP;coerce;L$;36|))
          (EXIT (LETT |group| (CONS |gp| |result|) . #1#))))) 

(SDEFUN |PERMGRP;permutationGroup;L$;37|
        ((|gp| |List| (|Permutation| S)) ($ $))
        (SPROG
         ((|group| ($))
          (|result|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (LETT |result| (VECTOR 0 NIL NIL #() NIL NIL)
                . #1=(|PERMGRP;permutationGroup;L$;37|))
          (EXIT (LETT |group| (CONS |gp| |result|) . #1#))))) 

(SDEFUN |PERMGRP;coerce;$Of;38| ((|group| $) ($ |OutputForm|))
        (SPROG
         ((|outList| (|List| (|OutputForm|))) (|i| NIL)
          (|gp| (|List| (|Permutation| S))))
         (SEQ (LETT |outList| NIL . #1=(|PERMGRP;coerce;$Of;38|))
              (LETT |gp| (QCAR |group|) . #1#)
              (SEQ (LETT |i| (SPADCALL |gp| (QREFELT $ 137)) . #1#) G190
                   (COND ((< |i| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |outList|
                           (CONS
                            (SPADCALL (SPADCALL |gp| |i| (QREFELT $ 124))
                                      (QREFELT $ 139))
                            |outList|)
                           . #1#)))
                   (LETT |i| (+ |i| -1) . #1#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL '> (QREFELT $ 141))
                         (SPADCALL (SPADCALL |outList| (QREFELT $ 143))
                                   (SPADCALL '< (QREFELT $ 141))
                                   (QREFELT $ 144))
                         (QREFELT $ 144)))))) 

(SDEFUN |PERMGRP;orbit;$SS;39| ((|gp| $) (|el| S) ($ |Set| S))
        (SPROG
         ((#1=#:G1097 NIL) (|i| NIL) (|outSet| (|Set| S))
          (|outList| (|List| (|List| S))) (|elList| (|List| S)))
         (SEQ (LETT |elList| (LIST |el|) . #2=(|PERMGRP;orbit;$SS;39|))
              (LETT |outList| (|PERMGRP;orbitInternal| |gp| |elList| $) . #2#)
              (LETT |outSet| (SPADCALL (QREFELT $ 55)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (LENGTH |outList|) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |outList| |i| (QREFELT $ 41)) 1
                                (QREFELT $ 42))
                      |outSet| (QREFELT $ 146))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |outSet|)))) 

(SDEFUN |PERMGRP;orbits;$S;40| ((|gp| $) ($ |Set| (|Set| S)))
        (SPROG
         ((|spp| (|Set| S)) (|orbits| (|List| (|Set| S)))
          (|orbitSet| (|Set| S)) (|el| (S)))
         (SEQ
          (LETT |spp| (SPADCALL |gp| (QREFELT $ 127))
                . #1=(|PERMGRP;orbits;$S;40|))
          (LETT |orbits| NIL . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |spp| (QREFELT $ 148)) 0 (QREFELT $ 94)))
                 (GO G191)))
               (SEQ (LETT |el| (SPADCALL |spp| (QREFELT $ 149)) . #1#)
                    (LETT |orbitSet| (SPADCALL |gp| |el| (QREFELT $ 147))
                          . #1#)
                    (LETT |orbits| (CONS |orbitSet| |orbits|) . #1#)
                    (EXIT
                     (LETT |spp| (SPADCALL |spp| |orbitSet| (QREFELT $ 150))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |orbits| (QREFELT $ 153)))))) 

(SDEFUN |PERMGRP;member?;P$B;41| ((|p| |Permutation| S) (|gp| $) ($ |Boolean|))
        (SPROG
         ((|mi|
           (|Record| (|:| |bool| (|Boolean|))
                     (|:| |lst| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |mi| (|PERMGRP;memberInternal| |p| |gp| NIL $)
                |PERMGRP;member?;P$B;41|)
          (EXIT (QCAR |mi|))))) 

(SDEFUN |PERMGRP;wordInStrongGenerators;P$L;42|
        ((|p| |Permutation| S) (|gp| $) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|mi|
           (|Record| (|:| |bool| (|Boolean|))
                     (|:| |lst| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |mi|
                (|PERMGRP;memberInternal| (SPADCALL |p| (QREFELT $ 155)) |gp|
                 'T $)
                |PERMGRP;wordInStrongGenerators;P$L;42|)
          (COND
           ((NULL (QCAR |mi|)) (EXIT (|error| "p is not an element of gp"))))
          (EXIT (QCDR |mi|))))) 

(SDEFUN |PERMGRP;wordInGenerators;P$L;43|
        ((|p| |Permutation| S) (|gp| $) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|outlist| (|List| (|NonNegativeInteger|))) (#1=#:G1113 NIL)
          (|n| NIL) (|words| #2=(|List| (|List| (|NonNegativeInteger|))))
          (|lll| (|List| (|NonNegativeInteger|)))
          (|gp_info|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs|
                          (|Vector|
                           (|Record|
                            (|:| |orb| (|List| (|NonNegativeInteger|)))
                            (|:| |svc| (|Vector| (|Integer|))))))
                     (|:| |mp| (|List| S)) (|:| |wd| #2#))))
         (SEQ
          (LETT |gp_info| (QCDR |gp|) . #3=(|PERMGRP;wordInGenerators;P$L;43|))
          (COND
           ((EQL (LENGTH (QVELT |gp_info| 5)) 0)
            (SPADCALL |gp| (QREFELT $ 157))))
          (LETT |lll| (SPADCALL |p| |gp| (QREFELT $ 156)) . #3#)
          (LETT |outlist| NIL . #3#) (LETT |words| (QVELT (QCDR |gp|) 5) . #3#)
          (SEQ (LETT |n| NIL . #3#) (LETT #1# |lll| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |outlist|
                       (SPADCALL |outlist|
                                 (SPADCALL |words| |n| (QREFELT $ 46))
                                 (QREFELT $ 33))
                       . #3#)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (|PERMGRP;shortenWord| |outlist| |gp| $))))) 

(SDEFUN |PERMGRP;<;2$B;44| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (COND
         ((NULL
           (SPADCALL
            (SPADCALL (SPADCALL |gp1| (QREFELT $ 127))
                      (SPADCALL |gp2| (QREFELT $ 127)) (QREFELT $ 150))
            (QREFELT $ 159)))
          NIL)
         ((NULL (|PERMGRP;subgroup| |gp1| |gp2| $)) NIL)
         ('T
          (NULL
           (EQL (SPADCALL |gp1| (QREFELT $ 131))
                (SPADCALL |gp2| (QREFELT $ 131))))))) 

(SDEFUN |PERMGRP;<=;2$B;45| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (COND
         ((NULL
           (SPADCALL
            (SPADCALL (SPADCALL |gp1| (QREFELT $ 127))
                      (SPADCALL |gp2| (QREFELT $ 127)) (QREFELT $ 150))
            (QREFELT $ 159)))
          NIL)
         ('T (|PERMGRP;subgroup| |gp1| |gp2| $)))) 

(SDEFUN |PERMGRP;=;2$B;46| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (SPROG ((#1=#:G1129 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |gp1| (QREFELT $ 127))
                             (SPADCALL |gp2| (QREFELT $ 127)) (QREFELT $ 162))
                   NIL)
                  (#2='T
                   (SEQ
                    (COND
                     ((SPADCALL (LENGTH (QCAR |gp1|)) (LENGTH (QCAR |gp2|))
                                (QREFELT $ 65))
                      (COND
                       ((NULL (|PERMGRP;subgroup| |gp1| |gp2| $))
                        (EXIT
                         (PROGN
                          (LETT #1# NIL . #3=(|PERMGRP;=;2$B;46|))
                          (GO #4=#:G1128))))))
                     ((NULL (|PERMGRP;subgroup| |gp2| |gp1| $))
                      (EXIT (PROGN (LETT #1# NIL . #3#) (GO #4#)))))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |gp1| (QREFELT $ 131))
                            (SPADCALL |gp2| (QREFELT $ 131)))
                       'T)
                      (#2# NIL)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |PERMGRP;orbit;$SS;47|
        ((|gp| $) (|startSet| |Set| S) ($ |Set| (|Set| S)))
        (SPROG
         ((|newSet| (|Set| S)) (#1=#:G1134 NIL) (|i| NIL)
          (|outSet| (|Set| (|Set| S))) (|outList| (|List| (|List| S)))
          (|startList| (|List| S)))
         (SEQ
          (LETT |startList| (SPADCALL |startSet| (QREFELT $ 58))
                . #2=(|PERMGRP;orbit;$SS;47|))
          (LETT |outList| (|PERMGRP;orbitInternal| |gp| |startList| $) . #2#)
          (LETT |outSet| (SPADCALL (QREFELT $ 164)) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (LENGTH |outList|) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |newSet|
                      (SPADCALL (SPADCALL |outList| |i| (QREFELT $ 41))
                                (QREFELT $ 126))
                      . #2#)
                (EXIT (SPADCALL |newSet| |outSet| (QREFELT $ 165))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |outSet|)))) 

(SDEFUN |PERMGRP;orbit;$LS;48|
        ((|gp| $) (|startList| |List| S) ($ |Set| (|List| S)))
        (SPADCALL (|PERMGRP;orbitInternal| |gp| |startList| $) (QREFELT $ 168))) 

(SDEFUN |PERMGRP;initializeGroupForWordProblem;$2IV;49|
        ((|gp| $) (|maxLoops| |Integer|) (|diff| |Integer|) ($ |Void|))
        (SEQ (|PERMGRP;bsgs| |gp| 'T |maxLoops| |diff| $)
             (EXIT (SPADCALL (QREFELT $ 113))))) 

(SDEFUN |PERMGRP;initializeGroupForWordProblem;$V;50| ((|gp| $) ($ |Void|))
        (SPADCALL |gp| 0 1 (QREFELT $ 170))) 

(DECLAIM (NOTINLINE |PermutationGroup;|)) 

(DEFUN |PermutationGroup| (#1=#:G1139)
  (SPROG NIL
         (PROG (#2=#:G1140)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PermutationGroup|)
                                               '|domainEqualList|)
                    . #3=(|PermutationGroup|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PermutationGroup;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PermutationGroup|)))))))))) 

(DEFUN |PermutationGroup;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PermutationGroup|))
          (LETT |dv$| (LIST '|PermutationGroup| DV$1) . #1#)
          (LETT $ (GETREFV 174) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PermutationGroup| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |gens| (|List| (|Permutation| |#1|)))
                              (|:| |information|
                                   (|Record|
                                    (|:| |order| (|NonNegativeInteger|))
                                    (|:| |sgset|
                                         (|List|
                                          (|Vector| (|NonNegativeInteger|))))
                                    (|:| |gpbase|
                                         (|List| (|NonNegativeInteger|)))
                                    (|:| |orbs|
                                         (|Vector|
                                          (|Record|
                                           (|:| |orb|
                                                (|List|
                                                 (|NonNegativeInteger|)))
                                           (|:| |svc|
                                                (|Vector| (|Integer|))))))
                                    (|:| |mp| (|List| |#1|))
                                    (|:| |wd|
                                         (|List|
                                          (|List| (|NonNegativeInteger|))))))))
          (COND
           ((|HasCategory| |#1| '(|OrderedSet|))
            (QSETREFV $ 53
                      (CONS (|dispatchFunction| |PERMGRP;pointList;$L;11|) $)))
           ('T
            (QSETREFV $ 53
                      (CONS (|dispatchFunction| |PERMGRP;pointList;$L;12|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|OrderedSet|))
            (PROGN
             (QSETREFV $ 70
                       (CONS
                        (|dispatchFunction| |PERMGRP;perm_to_vec;LPNniV;14|)
                        $))))
           ('T
            (QSETREFV $ 70
                      (CONS
                       (|dispatchFunction| |PERMGRP;perm_to_vec;LPNniV;15|)
                       $))))
          $))) 

(MAKEPROP '|PermutationGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 11)
              |PERMGRP;coerce;$L;25| (|NonNegativeInteger|) (|Permutation| 6)
              (0 . |order|) (|List| 10) (5 . |copy|) (|Integer|)
              (10 . |maxIndex|) (15 . |elt|) (|Boolean|) (21 . |member?|)
              (27 . |position|) (33 . |delete|) (39 . |#|) (44 . |One|)
              (48 . ~=) (54 . |rest|) (|Vector| 10) (60 . |#|) (65 . |new|)
              (|Vector| 26) (71 . |elt|) (|Vector| 13) (77 . |elt|)
              (83 . |append|) (|List| 26) (89 . |vector|) (|List| 13)
              (94 . |vector|) (99 . |qelt|) (|List| 6) (|List| 39)
              (105 . |elt|) (111 . |elt|) (117 . |eval|) (123 . |member?|)
              (129 . |elt|) (135 . |elt|) (141 . >)
              (|Record| (|:| |preimage| 39) (|:| |image| 39))
              (147 . |listRepresentation|) (152 . |sort|) (157 . |merge|)
              (163 . =) (169 . |pointList|) (|Set| 6) (174 . |brace|)
              (178 . |movedPoints|) (183 . |union|) (189 . |parts|) (194 . <=)
              (|Record| (|:| |preimage| 10) (|:| |image| 6))
              (|Mapping| 18 60 60) (|List| 60) (200 . |sort|) (206 . |first|)
              (211 . <=) (|Mapping| 18 13 13) (217 . |sort|) (223 . |second|)
              (228 . |setelt!|) (235 . |perm_to_vec|) (242 . |position|)
              (|Vector| 15) (248 . |setelt!|) (255 . |elt|) (261 . |member?|)
              (|List| 34) (|Reference| 76) (267 . |setref|) (|List| 36)
              (|Reference| 79) (273 . |setref|) (279 . |deref|)
              (284 . |append|) (290 . |deref|) (295 . |append|) (301 . |elt|)
              (307 . |append|) (|Mapping| 26 26) (313 . |map|)
              (|Record| (|:| |orb| 13) (|:| |svc| 72)) (|Vector| 90)
              (319 . |setelt!|) (326 . |setelt!|) (333 . >) (339 . |position|)
              (345 . |delete|) (351 . |elt|) (357 . |delete|) (363 . |setelt!|)
              (370 . |ref|) (375 . |ref|) (380 . |list|) (385 . |append|)
              (391 . |elt|) (397 . |copy|) (402 . |list|) (407 . |list|)
              (|Set| 11) (412 . |brace|) (416 . |degree|) (421 . |insert!|)
              (|Void|) (427 . |void|) (431 . |difference|) (437 . |empty?|)
              (442 . |parts|) |PERMGRP;member?;P$B;41| (447 . |member?|)
              (453 . |member?|) (459 . |setelt!|) |PERMGRP;generators;$L;26|
              (466 . |coerceListOfPairs|) |PERMGRP;strongGenerators;$L;27|
              (471 . |elt|) |PERMGRP;elt;$NniP;28| (477 . |brace|)
              |PERMGRP;movedPoints;$S;29| (482 . *) |PERMGRP;random;$IP;30|
              |PERMGRP;random;$P;31| |PERMGRP;order;$Nni;32|
              |PERMGRP;degree;$Nni;33| |PERMGRP;base;$L;34|
              |PERMGRP;wordsForStrongGenerators;$L;35| |PERMGRP;coerce;L$;36|
              |PERMGRP;permutationGroup;L$;37| (488 . |maxIndex|)
              (|OutputForm|) (493 . |coerce|) (|Symbol|) (498 . |outputForm|)
              (|List| $) (503 . |commaSeparate|) (508 . |postfix|)
              |PERMGRP;coerce;$Of;38| (514 . |insert!|) |PERMGRP;orbit;$SS;39|
              (520 . |cardinality|) (525 . |extract!|) (530 . |difference|)
              (|List| 54) (|Set| 54) (536 . |brace|) |PERMGRP;orbits;$S;40|
              (541 . |inv|) |PERMGRP;wordInStrongGenerators;P$L;42|
              |PERMGRP;initializeGroupForWordProblem;$V;50|
              |PERMGRP;wordInGenerators;P$L;43| (546 . |empty?|)
              |PERMGRP;<;2$B;44| |PERMGRP;<=;2$B;45| (551 . ~=)
              |PERMGRP;=;2$B;46| (557 . |brace|) (561 . |insert!|)
              |PERMGRP;orbit;$SS;47| (|Set| 39) (567 . |brace|)
              |PERMGRP;orbit;$LS;48|
              |PERMGRP;initializeGroupForWordProblem;$2IV;49| (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 572 |wordsForStrongGenerators| 578 |wordInStrongGenerators|
              583 |wordInGenerators| 589 |strongGenerators| 595 |random| 600
              |pointList| 611 |permutationGroup| 616 |perm_to_vec| 621 |order|
              628 |orbits| 633 |orbit| 638 |movedPoints| 656 |member?| 661
              |latex| 667 |initializeGroupForWordProblem| 672 |hashUpdate!| 684
              |hash| 690 |generators| 695 |elt| 700 |degree| 706 |coerce| 711
              |base| 726 = 731 <= 737 < 743)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 138))
                        (|makeByteWordVec2| 173
                                            '(1 11 10 0 12 1 13 0 0 14 1 13 15
                                              0 16 2 13 10 0 15 17 2 13 18 10 0
                                              19 2 13 15 10 0 20 2 13 0 0 15 21
                                              1 13 10 0 22 0 11 0 23 2 10 18 0
                                              0 24 2 13 0 0 10 25 1 26 10 0 27
                                              2 26 0 10 10 28 2 29 26 0 15 30 2
                                              31 13 0 15 32 2 13 0 0 0 33 1 29
                                              0 34 35 1 31 0 36 37 2 13 10 0 15
                                              38 2 40 39 0 15 41 2 39 6 0 15 42
                                              2 11 6 0 6 43 2 40 18 39 0 44 2
                                              34 26 0 15 45 2 36 13 0 15 46 2
                                              15 18 0 0 47 1 11 48 0 49 1 39 0
                                              0 50 2 39 0 0 0 51 2 6 18 0 0 52
                                              1 0 39 0 53 0 54 0 55 1 11 54 0
                                              56 2 54 0 0 0 57 1 54 39 0 58 2 6
                                              18 0 0 59 2 62 0 61 0 63 1 13 10
                                              0 64 2 10 18 0 0 65 2 36 0 66 0
                                              67 1 13 10 0 68 3 26 10 0 15 10
                                              69 3 0 26 39 11 10 70 2 39 15 6 0
                                              71 3 72 15 0 15 15 73 2 26 10 0
                                              15 74 2 34 18 26 0 75 2 77 76 0
                                              76 78 2 80 79 0 79 81 1 77 76 0
                                              82 2 76 0 0 0 83 1 80 79 0 84 2
                                              79 0 0 0 85 2 76 34 0 15 86 2 34
                                              0 0 0 87 2 34 0 88 0 89 3 91 90 0
                                              15 90 92 3 76 34 0 15 34 93 2 10
                                              18 0 0 94 2 34 15 26 0 95 2 34 0
                                              0 15 96 2 79 36 0 15 97 2 36 0 0
                                              15 98 3 79 36 0 15 36 99 1 77 0
                                              76 100 1 80 0 79 101 1 13 0 10
                                              102 2 36 0 0 0 103 2 91 90 0 15
                                              104 1 26 0 0 105 1 34 0 26 106 1
                                              36 0 13 107 0 108 0 109 1 11 10 0
                                              110 2 108 0 11 0 111 0 112 0 113
                                              2 108 0 0 0 114 1 108 18 0 115 1
                                              108 8 0 116 2 39 18 6 0 118 2 8
                                              18 11 0 119 3 31 13 0 15 13 120 1
                                              11 0 40 122 2 8 11 0 15 124 1 54
                                              0 39 126 2 11 0 0 0 128 1 8 15 0
                                              137 1 11 138 0 139 1 138 0 140
                                              141 1 138 0 142 143 2 138 0 0 0
                                              144 2 54 0 6 0 146 1 54 10 0 148
                                              1 54 6 0 149 2 54 0 0 0 150 1 152
                                              0 151 153 1 11 0 0 155 1 54 18 0
                                              159 2 54 18 0 0 162 0 152 0 164 2
                                              152 0 54 0 165 1 167 0 40 168 2 0
                                              18 0 0 1 1 0 36 0 134 2 0 13 11 0
                                              156 2 0 13 11 0 158 1 0 8 0 123 1
                                              0 11 0 130 2 0 11 0 15 129 1 0 39
                                              0 53 1 0 0 8 136 3 0 26 39 11 10
                                              70 1 0 10 0 131 1 0 152 0 154 2 0
                                              152 0 54 166 2 0 167 0 39 169 2 0
                                              54 0 6 147 1 0 54 0 127 2 0 18 11
                                              0 117 1 0 172 0 1 1 0 112 0 157 3
                                              0 112 0 15 15 170 2 0 171 171 0 1
                                              1 0 173 0 1 1 0 8 0 121 2 0 11 0
                                              10 125 1 0 10 0 132 1 0 0 8 135 1
                                              0 8 0 9 1 0 138 0 145 1 0 39 0
                                              133 2 0 18 0 0 163 2 0 18 0 0 161
                                              2 0 18 0 0 160)))))
           '|lookupComplete|)) 
