
(SDEFUN |PERMGRP;shortenWord|
        ((|lw| |List| (|NonNegativeInteger|)) (|gp| $)
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|do_res| #1=(|Boolean|)) (|flag1| #1#)
          (|newlw| (|List| (|NonNegativeInteger|))) (#2=#:G790 NIL)
          (|anzahl| (|NonNegativeInteger|)) (|flag2| #1#)
          (|res| (|List| #3=(|NonNegativeInteger|))) (|test| #3#)
          (#4=#:G794 NIL) (|el| NIL) (|pos| (|Integer|)) (#5=#:G793 NIL)
          (|i| NIL) (|orderList| (|List| (|NonNegativeInteger|)))
          (#6=#:G792 NIL) (|gen| NIL) (#7=#:G791 NIL)
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
                                               (GO #9=#:G781)))))
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
        (SPROG ((#1=#:G798 NIL) (|i| NIL) (|degree| (|NonNegativeInteger|)))
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
         ((#1=#:G804 NIL) (|i| NIL) (|q| (|Vector| (|NonNegativeInteger|)))
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
         ((#1=#:G810 NIL) (#2=#:G811 NIL) (#3=#:G812 NIL) (|i| NIL)
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
                        (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5=#:G809))
                              . #4#)
                        (GO #6=#:G807))))))
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
         ((#3=#:G823 NIL) (|p| (|Integer|))
          (|word| (|List| (|NonNegativeInteger|)))
          (|xelt| #4=(|Vector| (|NonNegativeInteger|)))
          (|tmpv| #5=(|Vector| (|NonNegativeInteger|))) (|#G25| #5#)
          (|#G24| #4#) (|x| (|Vector| (|NonNegativeInteger|))) (|osvc| #2#)
          (|oorb| #1#) (#6=#:G824 NIL) (#7=#:G826 NIL) (|n| NIL)
          (#8=#:G825 NIL) (|degree| (|NonNegativeInteger|)))
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
                  (GO #11=#:G822)))
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
          (|noresult| (|Boolean|)) (#4=#:G841 NIL) (|entry| (|Integer|))
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
                                    (GO #6=#:G836))))
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
          (|j| NIL) (|workList| (|List| S)) (#2=#:G851 NIL) (|gen| NIL)
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
          (|words| (|List| (|NonNegativeInteger|))) (#2=#:G856 NIL)
          (|randomElement| (|Vector| (|NonNegativeInteger|)))
          (|randomInteger| #1#) (#3=#:G854 NIL) (|do_words| (|Boolean|))
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
         ((|res| (|List| S)) (|p0| (S)) (#1=#:G871 NIL) (|p| NIL)
          (|support| (|List| S)) (#2=#:G870 NIL) (|perm| NIL))
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
        (SPROG ((|support| (|Set| S)) (#1=#:G877 NIL) (|perm| NIL))
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
         ((#1=#:G896 NIL) (|pp| NIL) (#2=#:G895 NIL)
          (|rp2| (|List| (|List| (|NonNegativeInteger|))))
          (|ls2|
           (|List|
            (|Record| (|:| |preimage| (|NonNegativeInteger|))
                      (|:| |image| S))))
          (|p1| (S))
          (|pel|
           (|Record| (|:| |preimage| (|NonNegativeInteger|)) (|:| |image| S)))
          (|flag| (|Boolean|)) (#3=#:G894 NIL) (|p2| NIL) (|i| NIL)
          (#4=#:G893 NIL) (|p| NIL) (#5=#:G892 NIL))
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
         ((#1=#:G904 NIL) (|pp| NIL) (#2=#:G905 NIL) (|ip| NIL)
          (|il| #3=(|List| (|NonNegativeInteger|))) (|pl| #3#) (#4=#:G903 NIL)
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
         ((|pos2| (|Integer|)) (|newEl| (S)) (#1=#:G911 NIL) (|i| NIL)
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
          (#2=#:G923 NIL) (|i| NIL) (#3=#:G924 NIL) (|grv| NIL)
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
         ((|grpinv| (|List| (|Vector| (|NonNegativeInteger|)))) (#1=#:G928 NIL)
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
         ((|sizeOfGroup| (|NonNegativeInteger|)) (|k2| #1#) (#2=#:G953 NIL)
          (|j| (|Integer|)) (|words3| (|List| (|List| (|NonNegativeInteger|))))
          (|help| (|List| (|NonNegativeInteger|)))
          (|group2| (|List| (|Vector| (|NonNegativeInteger|))))
          (|el2| (|Vector| (|NonNegativeInteger|)))
          (|str|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|ran|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|words2| (|List| (|List| (|NonNegativeInteger|))))
          (|gpsgs| (|List| (|Vector| (|NonNegativeInteger|)))) (#3=#:G956 NIL)
          (|k| (|List| (|NonNegativeInteger|))) (#4=#:G951 NIL) (#5=#:G955 NIL)
          (|jj| NIL) (|gplength| (|NonNegativeInteger|)) (#6=#:G952 NIL)
          (|k1| (|NonNegativeInteger|))
          (|ort|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (#7=#:G954 NIL) (|i| NIL) (|wordProblem| (|Boolean|))
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
                  . #8=(|PERMGRP;bsgs1|))
            (LETT |gp_info| (QCDR |gp|) . #8#)
            (LETT |wordProblem| (NULL (NULL |words|)) . #8#)
            (SEQ
             (EXIT
              (SEQ (LETT |i| |number1| . #8#) (LETT #7# |degree| . #8#) G190
                   (COND ((> |i| #7#) (GO G191)))
                   (SEQ
                    (LETT |ort| (|PERMGRP;orbitWithSvc| |group| |i| $) . #8#)
                    (LETT |k| (QCAR |ort|) . #8#)
                    (LETT |k1| (SPADCALL |k| (QREFELT $ 22)) . #8#)
                    (EXIT
                     (COND
                      ((SPADCALL |k1| 1 (QREFELT $ 24))
                       (PROGN (LETT #6# |$NoValue| . #8#) (GO #9=#:G932))))))
                   (LETT |i| (+ |i| 1) . #8#) (GO G190) G191 (EXIT NIL)))
             #9# (EXIT #6#))
            (LETT |gpsgs| NIL . #8#) (LETT |words2| NIL . #8#)
            (LETT |gplength| (LENGTH |group|) . #8#)
            (SEQ
             (EXIT
              (SEQ (LETT |jj| 1 . #8#) (LETT #5# |gplength| . #8#) G190
                   (COND ((|greater_SI| |jj| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL |group| |jj| (QREFELT $ 45)) |i|
                                  (QREFELT $ 74))
                        |i| (QREFELT $ 24))
                       (PROGN (LETT #4# |$NoValue| . #8#) (GO #10=#:G935))))))
                   (LETT |jj| (|inc_SI| |jj|) . #8#) (GO G190) G191
                   (EXIT NIL)))
             #10# (EXIT #4#))
            (SEQ (LETT |k| 1 . #8#) (LETT #3# |gplength| . #8#) G190
                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                 (SEQ (LETT |el2| (SPADCALL |group| |k| (QREFELT $ 45)) . #8#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |el2| |i| (QREFELT $ 74)) |i|
                                   (QREFELT $ 24))
                         (SEQ (LETT |gpsgs| (CONS |el2| |gpsgs|) . #8#)
                              (EXIT
                               (COND
                                (|wordProblem|
                                 (LETT |words2|
                                       (CONS
                                        (SPADCALL |words| |k| (QREFELT $ 46))
                                        |words2|)
                                       . #8#))))))
                        ('T
                         (SEQ
                          (LETT |gpsgs|
                                (CONS
                                 (|PERMGRP;times|
                                  (SPADCALL |group| |jj| (QREFELT $ 45)) |el2|
                                  $)
                                 |gpsgs|)
                                . #8#)
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
                                   . #8#)))))))))
                 (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191 (EXIT NIL))
            (LETT |group2| NIL . #8#) (LETT |words3| NIL . #8#)
            (LETT |j| 15 . #8#)
            (SEQ G190 (COND ((NULL (SPADCALL |j| 0 (QREFELT $ 47))) (GO G191)))
                 (SEQ
                  (LETT |ran| (|PERMGRP;ranelt| |group| |words| |maxLoops| $)
                        . #8#)
                  (LETT |str|
                        (|PERMGRP;strip1| (QCAR |ran|) |ort| |group| |words| $)
                        . #8#)
                  (LETT |el2| (QCAR |str|) . #8#)
                  (COND
                   ((NULL (|PERMGRP;testIdentity| |el2| $))
                    (COND
                     ((NULL (SPADCALL |el2| |group2| (QREFELT $ 75)))
                      (SEQ (LETT |group2| (CONS |el2| |group2|) . #8#)
                           (COND
                            (|wordProblem|
                             (SEQ
                              (LETT |help|
                                    (SPADCALL (REVERSE (QCDR |str|))
                                              (QCDR |ran|) (QREFELT $ 33))
                                    . #8#)
                              (LETT |help|
                                    (|PERMGRP;shortenWord| |help| |gp| $)
                                    . #8#)
                              (EXIT
                               (LETT |words3| (CONS |help| |words3|) . #8#)))))
                           (EXIT (LETT |j| (- |j| 2) . #8#)))))))
                  (EXIT (LETT |j| (- |j| 1) . #8#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             (|wordProblem| (LETT |maxLoops| (- |maxLoops| |diff|) . #8#)))
            (COND
             ((OR (NULL |group2|) (< |maxLoops| 0))
              (SEQ (QSETVELT |gp_info| 2 (LIST |i|))
                   (SPADCALL |out| (LIST |gpsgs|) (QREFELT $ 78))
                   (SPADCALL |outword| (LIST |words2|) (QREFELT $ 81))
                   (EXIT (PROGN (LETT #2# |k1| . #8#) (GO #11=#:G950))))))
            (LETT |k2|
                  (|PERMGRP;bsgs1| |group2| (+ |i| 1) |words3| |maxLoops| |gp|
                   |diff| |out| |outword| $)
                  . #8#)
            (LETT |sizeOfGroup| (* |k1| |k2|) . #8#)
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
          #11# (EXIT #2#)))) 

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
          (|grpinv| (|List| (|Vector| (|NonNegativeInteger|))))
          (|sgs| (|List| (|Vector| (|NonNegativeInteger|))))
          (|res| (|List| (|Vector| (|NonNegativeInteger|))))
          (|obs2|
           #3=(|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                        (|:| |svc| (|Vector| (|Integer|)))))
          (|grpinv2| #4=(|List| (|Vector| (|NonNegativeInteger|))))
          (|sgs2| #4#) (|pos| (|Integer|)) (|removedGenerator| (|Boolean|))
          (|obs_len| #5=(|NonNegativeInteger|)) (|obs| #3#) (|pt| (|Integer|))
          (|baseLength| #5#) (#6=#:G977 NIL) (|orbv| #2#) (|base_lst| #1#))
         (SEQ
          (LETT |base_lst| (QVELT |gp_info| 2)
                . #7=(|PERMGRP;reduceGenerators|))
          (LETT |orbv| (QVELT |gp_info| 3) . #7#) (LETT |sgs| NIL . #7#)
          (LETT |res| NIL . #7#) (LETT |grpinv| NIL . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #6# |kkk| . #7#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (LETT |sgs|
                      (SPADCALL |sgs| (SPADCALL |outl| |i| (QREFELT $ 86))
                                (QREFELT $ 87))
                      . #7#)
                (EXIT
                 (LETT |grpinv|
                       (SPADCALL |grpinv|
                                 (SPADCALL (CONS (|function| |PERMGRP;inv|) $)
                                           (SPADCALL |outl| |i| (QREFELT $ 86))
                                           (QREFELT $ 89))
                                 (QREFELT $ 87))
                       . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |removedGenerator| NIL . #7#)
          (LETT |baseLength| (SPADCALL |base_lst| (QREFELT $ 22)) . #7#)
          (LETT |pt| (+ (- |baseLength| |kkk|) 1) . #7#)
          (LETT |obs|
                (|PERMGRP;orbitWithSvc1| |sgs| |grpinv|
                 (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $)
                . #7#)
          (SPADCALL |orbv| |kkk| |obs| (QREFELT $ 92))
          (LETT |obs_len| (SPADCALL (QCAR |obs|) (QREFELT $ 22)) . #7#)
          (COND
           ((EQL |obs_len| 1)
            (SEQ (LETT |removedGenerator| 'T . #7#)
                 (EXIT (SPADCALL |outl| |kkk| NIL (QREFELT $ 93))))))
          (LETT |i| 1 . #7#)
          (LETT |outlk| (SPADCALL |outl| |kkk| (QREFELT $ 86)) . #7#)
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
                      . #7#)
                (LETT |sgs2| (SPADCALL |sgs| |pos| (QREFELT $ 96)) . #7#)
                (LETT |grpinv2| (SPADCALL |grpinv| |pos| (QREFELT $ 96)) . #7#)
                (LETT |obs2|
                      (|PERMGRP;orbitWithSvc1| |sgs2| |grpinv2|
                       (SPADCALL |base_lst| |pt| (QREFELT $ 17)) $)
                      . #7#)
                (EXIT
                 (COND
                  ((EQL (SPADCALL (QCAR |obs2|) (QREFELT $ 22)) |obs_len|)
                   (SEQ
                    (LETT |res|
                          (CONS (SPADCALL |outlk| |i| (QREFELT $ 45)) |res|)
                          . #7#)
                    (LETT |sgs| |sgs2| . #7#) (LETT |grpinv| |grpinv2| . #7#)
                    (LETT |outlk| (SPADCALL |outlk| |i| (QREFELT $ 96)) . #7#)
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
                  ('T (LETT |i| (+ |i| 1) . #7#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |PERMGRP;bsgs|
        ((|group| $) (|wordProblem| |Boolean|) (|maxLoops| |Integer|)
         (|diff| |Integer|) ($ |NonNegativeInteger|))
        (SPROG
         ((|sizeOfGroup| (|NonNegativeInteger|)) (#1=#:G1034 NIL) (|j| NIL)
          (|kkk| (|Integer|))
          (|outword| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|out| (|List| (|List| (|Vector| (|NonNegativeInteger|)))))
          (|orbv|
           (|Vector|
            (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                      (|:| |svc| (|Vector| (|Integer|))))))
          (#2=#:G1021 NIL) (|baseOfGroup| (|List| (|NonNegativeInteger|)))
          (#3=#:G1033 NIL) (|i| NIL)
          (|word| #4=(|List| (|NonNegativeInteger|)))
          (|ttt| (|Vector| (|NonNegativeInteger|)))
          (|word2| (|List| (|NonNegativeInteger|))) (#5=#:G1032 NIL)
          (|wdi| NIL) (|add_cnt| (|Integer|)) (|noAnswer| #6=(|Boolean|))
          (#7=#:G1022 NIL) (|basePoint| (|NonNegativeInteger|)) (#8=#:G997 NIL)
          (|newBasePoint| #6#) (#9=#:G1031 NIL) (|p| NIL) (|ii| NIL)
          (|z| #10=(|Vector| (|NonNegativeInteger|)))
          (|ppp|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|noresult| #6#) (#11=#:G1030 NIL) (|jjj| NIL) (|word3| #4#)
          (|y1| (|Vector| (|NonNegativeInteger|))) (#12=#:G1029 NIL) (|pt| NIL)
          (#13=#:G1028 NIL) (|z0| NIL)
          (|gporbi|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|wordlist| (|List| (|List| (|NonNegativeInteger|))))
          (|sgsv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (|sgs| (|List| (|Vector| (|NonNegativeInteger|))))
          (|rejects| (|List| (|Vector| (|NonNegativeInteger|))))
          (#14=#:G1027 NIL) (#15=#:G1026 NIL)
          (|dummy_rec|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (|newGroup| (|List| (|Vector| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|))
          (|words| (|List| (|List| (|NonNegativeInteger|))))
          (|q| (|Vector| (|NonNegativeInteger|))) (#16=#:G1024 NIL) (|ggg| NIL)
          (#17=#:G1025 NIL) (|ggp| NIL) (|gp| (|List| (|Permutation| S)))
          (|tmpv| #10#) (#18=#:G1023 NIL)
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
           (SEQ (LETT |basePoint| 0 . #19=(|PERMGRP;bsgs|))
                (LETT |newBasePoint| NIL . #19#)
                (LETT |baseOfGroup| NIL . #19#) (LETT |out| NIL . #19#)
                (LETT |outword| NIL . #19#)
                (LETT |outr| (SPADCALL NIL (QREFELT $ 100)) . #19#)
                (LETT |outwordr| (SPADCALL NIL (QREFELT $ 101)) . #19#)
                (LETT |supp| (SPADCALL |group| (QREFELT $ 53)) . #19#)
                (LETT |degree| (LENGTH |supp|) . #19#)
                (LETT |gp_info| (VECTOR 1 NIL NIL #() NIL NIL) . #19#)
                (COND
                 ((EQL |degree| 0)
                  (SEQ (PROGN (RPLACD |group| |gp_info|) (QCDR |group|))
                       (EXIT (PROGN (LETT #18# 1 . #19#) (GO #20=#:G1020))))))
                (LETT |newGroup| NIL . #19#)
                (LETT |tmpv| (SPADCALL |degree| 0 (QREFELT $ 28)) . #19#)
                (LETT |gp| (QCAR |group|) . #19#) (LETT |words| NIL . #19#)
                (SEQ (LETT |ggp| NIL . #19#) (LETT #17# |gp| . #19#)
                     (LETT |ggg| 1 . #19#) (LETT #16# (LENGTH |gp|) . #19#)
                     G190
                     (COND
                      ((OR (|greater_SI| |ggg| #16#) (ATOM #17#)
                           (PROGN (LETT |ggp| (CAR #17#) . #19#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |q| (SPADCALL |supp| |ggp| |degree| (QREFELT $ 70))
                            . #19#)
                      (LETT |newGroup| (CONS |q| |newGroup|) . #19#)
                      (EXIT
                       (COND
                        (|wordProblem|
                         (LETT |words|
                               (CONS (SPADCALL |ggg| (QREFELT $ 102)) |words|)
                               . #19#)))))
                     (LETT |ggg|
                           (PROG1 (|inc_SI| |ggg|)
                             (LETT #17# (CDR #17#) . #19#))
                           . #19#)
                     (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |maxLoops| 1)
                  (SEQ
                   (COND
                    ((ZEROP (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22)))
                     (LETT |k|
                           (|PERMGRP;bsgs1| |newGroup| 1 NIL 20 |group| 0
                            |outr| |outwordr| $)
                           . #19#)))
                   (EXIT
                    (LETT |maxLoops|
                          (- (SPADCALL (QVELT (QCDR |group|) 2) (QREFELT $ 22))
                             1)
                          . #19#)))))
                (LETT |k|
                      (|PERMGRP;bsgs1| |newGroup| 1 |words| |maxLoops| |group|
                       |diff| |outr| |outwordr| $)
                      . #19#)
                (LETT |out| (SPADCALL |outr| (QREFELT $ 82)) . #19#)
                (LETT |outword| (SPADCALL |outwordr| (QREFELT $ 84)) . #19#)
                (LETT |kkk| 1 . #19#)
                (LETT |newGroup| (REVERSE |newGroup|) . #19#)
                (LETT |noAnswer| 'T . #19#) (LETT |add_cnt| 0 . #19#)
                (LETT |dummy_rec| (CONS NIL (MAKE-ARRAY 0)) . #19#)
                (LETT |baseOfGroup| (QVELT (QCDR |group|) 2) . #19#)
                (QSETVELT |gp_info| 2 |baseOfGroup|)
                (LETT |orbv|
                      (MAKEARR1 (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                |dummy_rec|)
                      . #19#)
                (SEQ G190 (COND ((NULL |noAnswer|) (GO G191)))
                     (SEQ (QSETVELT |gp_info| 2 |baseOfGroup|)
                          (QSETVELT |gp_info| 3 |orbv|) (LETT |sgs| NIL . #19#)
                          (LETT |wordlist| NIL . #19#)
                          (SEQ (LETT |i| 1 . #19#)
                               (LETT #15# (- |kkk| 1) . #19#) G190
                               (COND ((|greater_SI| |i| #15#) (GO G191)))
                               (SEQ
                                (LETT |sgs|
                                      (SPADCALL |sgs|
                                                (SPADCALL |out| |i|
                                                          (QREFELT $ 86))
                                                (QREFELT $ 87))
                                      . #19#)
                                (EXIT
                                 (COND
                                  (|wordProblem|
                                   (LETT |wordlist|
                                         (SPADCALL |wordlist|
                                                   (SPADCALL |outword| |i|
                                                             (QREFELT $ 97))
                                                   (QREFELT $ 103))
                                         . #19#)))))
                               (LETT |i| (|inc_SI| |i|) . #19#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |noresult| 'T . #19#)
                          (LETT |z| (SPADCALL |degree| 0 (QREFELT $ 28))
                                . #19#)
                          (SEQ (LETT |i| |kkk| . #19#)
                               (LETT #14#
                                     (SPADCALL |baseOfGroup| (QREFELT $ 22))
                                     . #19#)
                               G190
                               (COND
                                ((OR (> |i| #14#) (NULL |noresult|))
                                 (GO G191)))
                               (SEQ
                                (LETT |rejects|
                                      (|PERMGRP;reduceGenerators| |i|
                                       |wordProblem| |gp_info| |out| |outword|
                                       $)
                                      . #19#)
                                (LETT |sgs|
                                      (SPADCALL |sgs|
                                                (SPADCALL |out| |i|
                                                          (QREFELT $ 86))
                                                (QREFELT $ 87))
                                      . #19#)
                                (LETT |sgsv| (SPADCALL |sgs| (QREFELT $ 35))
                                      . #19#)
                                (LETT |wordv| (MAKE-ARRAY 0) . #19#)
                                (COND
                                 (|wordProblem|
                                  (SEQ
                                   (LETT |wordlist|
                                         (SPADCALL |wordlist|
                                                   (SPADCALL |outword| |i|
                                                             (QREFELT $ 97))
                                                   (QREFELT $ 103))
                                         . #19#)
                                   (EXIT
                                    (LETT |wordv|
                                          (SPADCALL |wordlist| (QREFELT $ 37))
                                          . #19#)))))
                                (LETT |gporbi|
                                      (SPADCALL |orbv| |i| (QREFELT $ 104))
                                      . #19#)
                                (SEQ (LETT |z0| NIL . #19#)
                                     (LETT #13# |rejects| . #19#) G190
                                     (COND
                                      ((OR (ATOM #13#)
                                           (PROGN
                                            (LETT |z0| (CAR #13#) . #19#)
                                            NIL)
                                           (NULL |noresult|))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |z| (SPADCALL |z0| (QREFELT $ 105))
                                            . #19#)
                                      (LETT |ppp|
                                            (|PERMGRP;strip| |z| |i| NIL |orbv|
                                             |sgsv| |wordv| $)
                                            . #19#)
                                      (LETT |noresult|
                                            (|PERMGRP;testIdentity|
                                             (QCAR |ppp|) $)
                                            . #19#)
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
                                                   . #19#)
                                             (EXIT
                                              (LETT |ppp|
                                                    (|PERMGRP;strip| |z| |i| 'T
                                                     |orbv| |sgsv| |wordv| $)
                                                    . #19#)))))
                                          (LETT |z| (QCAR |ppp|) . #19#)
                                          (EXIT
                                           (LETT |word| (QCDR |ppp|)
                                                 . #19#)))))))
                                     (LETT #13# (CDR #13#) . #19#) (GO G190)
                                     G191 (EXIT NIL))
                                (SEQ (LETT |pt| NIL . #19#)
                                     (LETT #12# (QCAR |gporbi|) . #19#) G190
                                     (COND
                                      ((OR (ATOM #12#)
                                           (PROGN
                                            (LETT |pt| (CAR #12#) . #19#)
                                            NIL)
                                           (NULL |noresult|))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |ppp|
                                            (|PERMGRP;cosetRep1| |pt|
                                             |wordProblem| |gporbi| |sgsv|
                                             |wordv| $)
                                            . #19#)
                                      (LETT |y1| (|PERMGRP;inv| (QCAR |ppp|) $)
                                            . #19#)
                                      (LETT |word3| (QCDR |ppp|) . #19#)
                                      (EXIT
                                       (SEQ (LETT |jjj| 1 . #19#)
                                            (LETT #11# (LENGTH |sgs|) . #19#)
                                            G190
                                            (COND
                                             ((OR (|greater_SI| |jjj| #11#)
                                                  (NULL |noresult|))
                                              (GO G191)))
                                            (SEQ (LETT |word| NIL . #19#)
                                                 (|PERMGRP;times!| |z|
                                                  (QAREF1O |sgsv| |jjj| 1) |y1|
                                                  $)
                                                 (COND
                                                  (|wordProblem|
                                                   (LETT |word|
                                                         (QAREF1O |wordv| |jjj|
                                                                  1)
                                                         . #19#)))
                                                 (LETT |ppp|
                                                       (|PERMGRP;strip| |z| |i|
                                                        NIL |orbv| |sgsv|
                                                        |wordv| $)
                                                       . #19#)
                                                 (LETT |z| (QCAR |ppp|) . #19#)
                                                 (LETT |noresult|
                                                       (|PERMGRP;testIdentity|
                                                        |z| $)
                                                       . #19#)
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
                                                             . #19#)
                                                       (LETT |ppp|
                                                             (|PERMGRP;strip|
                                                              |z| |i| 'T |orbv|
                                                              |sgsv| |wordv| $)
                                                             . #19#)
                                                       (LETT |z| (QCAR |ppp|)
                                                             . #19#)
                                                       (EXIT
                                                        (LETT |word|
                                                              (SPADCALL
                                                               (QCDR |ppp|)
                                                               |word|
                                                               (QREFELT $ 33))
                                                              . #19#)))))))))
                                            (LETT |jjj| (|inc_SI| |jjj|)
                                                  . #19#)
                                            (GO G190) G191 (EXIT NIL))))
                                     (LETT #12# (CDR #12#) . #19#) (GO G190)
                                     G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((NULL |noresult|)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |ii| 1 . #19#)
                                          (LETT |p| NIL . #19#)
                                          (LETT #9# |baseOfGroup| . #19#) G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |p| (CAR #9#) . #19#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ (LETT |basePoint| 1 . #19#)
                                               (LETT |newBasePoint| 'T . #19#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QAREF1O |z| |p| 1)
                                                            |p| (QREFELT $ 24))
                                                  (SEQ
                                                   (LETT |newBasePoint| NIL
                                                         . #19#)
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
                                                                   . #19#)
                                                           (|check_subtype2|
                                                            (>= #8# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #8#))
                                                         . #19#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #7# |$NoValue|
                                                           . #19#)
                                                     (GO #21=#:G1000))))))))
                                          (LETT #9#
                                                (PROG1 (CDR #9#)
                                                  (LETT |ii| (|inc_SI| |ii|)
                                                        . #19#))
                                                . #19#)
                                          (GO G190) G191 (EXIT NIL)))
                                    #21# (EXIT #7#))))))
                               (LETT |i| (+ |i| 1) . #19#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |noAnswer|
                                (NULL (|PERMGRP;testIdentity| |z| $)) . #19#)
                          (EXIT
                           (COND
                            (|noAnswer|
                             (SEQ (LETT |add_cnt| (+ |add_cnt| 1) . #19#)
                                  (LETT |word2| NIL . #19#)
                                  (COND
                                   (|wordProblem|
                                    (SEQ
                                     (SEQ (LETT |wdi| NIL . #19#)
                                          (LETT #5# |word3| . #19#) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |wdi| (CAR #5#) . #19#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |ttt|
                                                 (SPADCALL |newGroup| |wdi|
                                                           (QREFELT $ 45))
                                                 . #19#)
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
                                                        . #19#)
                                                  (EXIT
                                                   (LETT |ttt|
                                                         (|PERMGRP;times| |ttt|
                                                          (SPADCALL |newGroup|
                                                                    |wdi|
                                                                    (QREFELT $
                                                                             45))
                                                          $)
                                                         . #19#)))
                                                 NIL (GO G190) G191
                                                 (EXIT NIL))))
                                          (LETT #5# (CDR #5#) . #19#) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |word|
                                           (SPADCALL |word| |word2|
                                                     (QREFELT $ 33))
                                           . #19#)
                                     (EXIT
                                      (LETT |word|
                                            (|PERMGRP;shortenWord| |word|
                                             |group| $)
                                            . #19#)))))
                                  (COND
                                   (|newBasePoint|
                                    (SEQ
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |i| 1 . #19#)
                                            (LETT #3# |degree| . #19#) G190
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
                                                       . #19#)
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #2# |$NoValue| . #19#)
                                                   (GO #22=#:G1012))))))))
                                            (LETT |i| (|inc_SI| |i|) . #19#)
                                            (GO G190) G191 (EXIT NIL)))
                                      #22# (EXIT #2#))
                                     (LETT |orbv|
                                           (MAKEARR1
                                            (SPADCALL |baseOfGroup|
                                                      (QREFELT $ 22))
                                            |dummy_rec|)
                                           . #19#)
                                     (LETT |out|
                                           (CONS (SPADCALL |z| (QREFELT $ 106))
                                                 |out|)
                                           . #19#)
                                     (EXIT
                                      (COND
                                       (|wordProblem|
                                        (LETT |outword|
                                              (CONS
                                               (SPADCALL |word|
                                                         (QREFELT $ 107))
                                               |outword|)
                                              . #19#))))))
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
                                  (EXIT (LETT |kkk| |basePoint| . #19#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |sizeOfGroup| 1 . #19#)
                (SEQ (LETT |j| 1 . #19#)
                     (LETT #1# (SPADCALL |baseOfGroup| (QREFELT $ 22)) . #19#)
                     G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |sizeOfGroup|
                             (* |sizeOfGroup|
                                (SPADCALL
                                 (QCAR (SPADCALL |orbv| |j| (QREFELT $ 104)))
                                 (QREFELT $ 22)))
                             . #19#)))
                     (LETT |j| (|inc_SI| |j|) . #19#) (GO G190) G191
                     (EXIT NIL))
                (PROGN
                 (RPLACD |group|
                         (VECTOR |sizeOfGroup| |sgs| |baseOfGroup| |orbv|
                                 |supp| |wordlist|))
                 (QCDR |group|))
                (EXIT |sizeOfGroup|)))
          #20# (EXIT #18#)))) 

(SDEFUN |PERMGRP;initialize| ((|group| $) ($ |Set| (|Permutation| S)))
        (SPROG
         ((#1=#:G1039 NIL) (|gen| NIL) (|gp| (|List| (|Permutation| S)))
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
         ((#1=#:G1050 NIL) (#2=#:G1051 NIL) (#3=#:G1052 NIL) (|el| NIL)
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
                                  (PROGN (LETT #2# NIL . #5#) (GO #6=#:G1049))
                                  . #5#)
                            (GO #7=#:G1046))))))
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
          (#1=#:G1066 NIL) (|i| NIL)
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
          (#2=#:G1064 NIL) (#3=#:G1063 NIL) (#4=#:G1065 NIL) (|x| NIL)
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
                               (GO #6=#:G1062))
                              . #5#)
                        (GO #7=#:G1056))))))
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

(SDEFUN |PERMGRP;orbit_words1|
        ((|p0| |NonNegativeInteger|) (|p| |NonNegativeInteger|)
         (|grp| |List| (|Vector| (|NonNegativeInteger|)))
         (|acc| |List| (|NonNegativeInteger|))
         (|res| |Vector| (|List| (|NonNegativeInteger|))) ($ |Void|))
        (SPROG
         ((|acc1| (|List| (|NonNegativeInteger|))) (|q| (|NonNegativeInteger|))
          (#1=#:G1073 NIL) (|g| NIL) (|i| NIL))
         (SEQ (LETT |i| 1 . #2=(|PERMGRP;orbit_words1|)) (LETT |g| NIL . #2#)
              (LETT #1# |grp| . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ (LETT |q| (QAREF1O |g| |p| 1) . #2#)
                   (EXIT
                    (COND
                     ((OR (EQL |p0| |q|) (NULL (NULL (QAREF1O |res| |q| 1))))
                      "skip")
                     ('T
                      (SEQ (LETT |acc1| (CONS |i| |acc|) . #2#)
                           (SPADCALL |res| |q| |acc1| (QREFELT $ 120))
                           (EXIT
                            (|PERMGRP;orbit_words1| |p0| |q| |grp| |acc1| |res|
                             $)))))))
              (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #2#))
                    . #2#)
              (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |PERMGRP;orbit_words|
        ((|p| |NonNegativeInteger|)
         (|grp| |List| (|Vector| (|NonNegativeInteger|)))
         ($ |Vector| (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|res| (|Vector| (|List| (|NonNegativeInteger|))))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL (|SPADfirst| |grp|) (QREFELT $ 27))
                . #1=(|PERMGRP;orbit_words|))
          (LETT |res| (MAKEARR1 |n| NIL) . #1#)
          (|PERMGRP;orbit_words1| |p| |p| |grp| NIL |res| $) (EXIT |res|)))) 

(SDEFUN |PERMGRP;relations_for_orbit|
        ((|p| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         (|orbd| |Vector|
          (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                    (|:| |svc| (|Vector| (|Integer|)))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (|rl| (|List| (|Integer|)))
          (|ll| (|List| (|Integer|))) (#1=#:G1101 NIL) (|k| NIL)
          (#2=#:G1100 NIL) (|rh| (|List| (|NonNegativeInteger|)))
          (|rhr|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|nw| (|Vector| (|NonNegativeInteger|)))
          (|iw| (|List| (|NonNegativeInteger|))) (|p1| (|NonNegativeInteger|))
          (#3=#:G1099 NIL) (|j| NIL) (|wi| (|Vector| (|NonNegativeInteger|)))
          (|wi_l| (|List| (|NonNegativeInteger|))) (#4=#:G1098 NIL) (|i| NIL)
          (#5=#:G1097 NIL) (#6=#:G1096 NIL) (#7=#:G1095 NIL)
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|wvi| #8=(|Vector| (|Vector| (|NonNegativeInteger|)))) (|wv| #8#)
          (|n0| (|NonNegativeInteger|))
          (|ww| (|Vector| (|List| (|NonNegativeInteger|))))
          (|grpl| (|List| (|Vector| (|NonNegativeInteger|)))))
         (SEQ (LETT |res| NIL . #9=(|PERMGRP;relations_for_orbit|))
              (LETT |grpl|
                    (SPADCALL (SPADCALL |grpv| (QREFELT $ 121)) |m|
                              (QREFELT $ 122))
                    . #9#)
              (LETT |ww| (|PERMGRP;orbit_words| |p| |grpl| $) . #9#)
              (LETT |n0| (QVSIZE (QCDR (SPADCALL |orbd| 1 (QREFELT $ 104))))
                    . #9#)
              (LETT |wv| (MAKEARR1 |n0| (MAKE-ARRAY 0)) . #9#)
              (LETT |wvi| (MAKEARR1 |n0| (MAKE-ARRAY 0)) . #9#)
              (LETT |wordv| (MAKEARR1 |n0| NIL) . #9#)
              (SEQ (LETT |i| 1 . #9#) (LETT #7# |n0| . #9#) G190
                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                   (SEQ (SPADCALL |wordv| |i| (LIST |i|) (QREFELT $ 120))
                        (LETT |wi_l| (QAREF1O |ww| |i| 1) . #9#)
                        (EXIT
                         (COND ((NULL |wi_l|) "skip")
                               ('T
                                (SEQ
                                 (LETT |wi| (SPADCALL |n0| 0 (QREFELT $ 28))
                                       . #9#)
                                 (SEQ (LETT |j| 1 . #9#) (LETT #6# |n0| . #9#)
                                      G190
                                      (COND ((|greater_SI| |j| #6#) (GO G191)))
                                      (SEQ (EXIT (QSETAREF1O |wi| |j| |j| 1)))
                                      (LETT |j| (|inc_SI| |j|) . #9#) (GO G190)
                                      G191 (EXIT NIL))
                                 (SEQ (LETT |j| NIL . #9#)
                                      (LETT #5# (REVERSE |wi_l|) . #9#) G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN
                                             (LETT |j| (CAR #5#) . #9#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (|PERMGRP;times!| |wi|
                                         (QAREF1O |grpv| |j| 1) |wi| $)))
                                      (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                      (EXIT NIL))
                                 (QSETAREF1O |wv| |i| |wi| 1)
                                 (EXIT
                                  (QSETAREF1O |wvi| |i| (|PERMGRP;inv| |wi| $)
                                              1)))))))
                   (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1 . #9#) (LETT #4# |n0| . #9#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |wi_l| (QAREF1O |ww| |i| 1) . #9#)
                        (EXIT
                         (COND ((NULL |wi_l|) "skip")
                               ('T
                                (SEQ (LETT |wi| (QAREF1O |wv| |i| 1) . #9#)
                                     (EXIT
                                      (SEQ (LETT |j| 1 . #9#)
                                           (LETT #3# |m| . #9#) G190
                                           (COND
                                            ((|greater_SI| |j| #3#) (GO G191)))
                                           (SEQ
                                            (LETT |nw|
                                                  (|PERMGRP;times|
                                                   (SPADCALL |grpv| |j|
                                                             (QREFELT $ 30))
                                                   |wi| $)
                                                  . #9#)
                                            (LETT |p1| (QAREF1O |nw| |p| 1)
                                                  . #9#)
                                            (LETT |iw| NIL . #9#)
                                            (COND
                                             ((SPADCALL |p1| |p|
                                                        (QREFELT $ 24))
                                              (SEQ
                                               (LETT |nw|
                                                     (|PERMGRP;times|
                                                      (SPADCALL |wvi| |p1|
                                                                (QREFELT $ 30))
                                                      |nw| $)
                                                     . #9#)
                                               (EXIT
                                                (LETT |iw|
                                                      (SPADCALL |ww| |p1|
                                                                (QREFELT $ 32))
                                                      . #9#)))))
                                            (EXIT
                                             (COND
                                              ((SPADCALL (CONS |j| |wi_l|) |iw|
                                                         (QREFELT $ 123))
                                               "skip")
                                              ('T
                                               (SEQ
                                                (LETT |nw|
                                                      (|PERMGRP;inv| |nw| $)
                                                      . #9#)
                                                (LETT |rhr|
                                                      (|PERMGRP;strip| |nw|
                                                       (QVSIZE |orbd|) 'T
                                                       |orbd| |grpv| |wordv| $)
                                                      . #9#)
                                                (LETT |rh|
                                                      (SPADCALL |iw|
                                                                (QCDR |rhr|)
                                                                (QREFELT $
                                                                         124))
                                                      . #9#)
                                                (LETT |rl| NIL . #9#)
                                                (SEQ (LETT |k| NIL . #9#)
                                                     (LETT #2# |rh| . #9#) G190
                                                     (COND
                                                      ((OR (ATOM #2#)
                                                           (PROGN
                                                            (LETT |k| (CAR #2#)
                                                                  . #9#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |rl|
                                                             (CONS (- |k|)
                                                                   |rl|)
                                                             . #9#)))
                                                     (LETT #2# (CDR #2#) . #9#)
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |ll| NIL . #9#)
                                                (SEQ (LETT |k| NIL . #9#)
                                                     (LETT #1#
                                                           (QAREF1O |ww| |i| 1)
                                                           . #9#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #1#)
                                                           (PROGN
                                                            (LETT |k| (CAR #1#)
                                                                  . #9#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |ll|
                                                             (CONS |k| |ll|)
                                                             . #9#)))
                                                     (LETT #1# (CDR #1#) . #9#)
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |ll| (NREVERSE |ll|)
                                                      . #9#)
                                                (LETT |rl|
                                                      (SPADCALL |ll| |rl|
                                                                (QREFELT $
                                                                         126))
                                                      . #9#)
                                                (LETT |rl| (CONS |j| |rl|)
                                                      . #9#)
                                                (EXIT
                                                 (LETT |res| (CONS |rl| |res|)
                                                       . #9#)))))))
                                           (LETT |j| (|inc_SI| |j|) . #9#)
                                           (GO G190) G191 (EXIT NIL))))))))
                   (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |PERMGRP;relations_in_strong_generators|
        ((|orbd| |Vector|
          (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                    (|:| |svc| (|Vector| (|Integer|)))))
         (|grpv| |Vector| (|Vector| (|NonNegativeInteger|)))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (#1=#:G1114 NIL) (|p0| NIL)
          (#2=#:G1115 NIL) (|m1| NIL) (|blp| (|List| (|NonNegativeInteger|)))
          (|p1| (|NonNegativeInteger|)) (#3=#:G1112 NIL)
          (|gri_l| (|List| #4=(|NonNegativeInteger|)))
          (|p2| (|NonNegativeInteger|))
          (|gv| (|Vector| (|NonNegativeInteger|))) (|j| NIL)
          (|bl| (|List| (|NonNegativeInteger|)))
          (|orbi|
           (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                     (|:| |svc| (|Vector| (|Integer|)))))
          (#5=#:G1113 NIL) (|i| NIL) (|m| #4#) (|k| (|NonNegativeInteger|)))
         (SEQ
          (LETT |k| (QVSIZE |orbd|)
                . #6=(|PERMGRP;relations_in_strong_generators|))
          (LETT |m| (QVSIZE |grpv|) . #6#) (LETT |res| NIL . #6#)
          (LETT |bl| NIL . #6#)
          (SEQ (LETT |i| 1 . #6#) (LETT #5# |k| . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ (LETT |orbi| (QAREF1O |orbd| |i| 1) . #6#)
                    (EXIT
                     (LETT |bl| (CONS (|SPADfirst| (QCAR |orbi|)) |bl|)
                           . #6#)))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |gri_l| (LIST |m|) . #6#) (LETT |blp| |bl| . #6#)
          (LETT |p1| (|SPADfirst| |blp|) . #6#) (LETT |blp| (CDR |blp|) . #6#)
          (SEQ
           (EXIT
            (SEQ (LETT |j| |m| . #6#) G190 (COND ((< |j| 1) (GO G191)))
                 (SEQ (LETT |gv| (QAREF1O |grpv| |j| 1) . #6#)
                      (LETT |p2| (QAREF1O |gv| |p1| 1) . #6#)
                      (EXIT
                       (COND
                        ((EQL |p1| |p2|)
                         (SEQ (LETT |gri_l| (CONS |j| |gri_l|) . #6#)
                              (EXIT
                               (COND
                                ((NULL |blp|)
                                 (PROGN
                                  (LETT #3# |$NoValue| . #6#)
                                  (GO #7=#:G1108)))
                                ('T
                                 (SEQ (LETT |p1| (|SPADfirst| |blp|) . #6#)
                                      (EXIT
                                       (LETT |blp| (CDR |blp|) . #6#)))))))))))
                 (LETT |j| (+ |j| -1) . #6#) (GO G190) G191 (EXIT NIL)))
           #7# (EXIT #3#))
          (SEQ (LETT |m1| NIL . #6#) (LETT #2# |gri_l| . #6#)
               (LETT |p0| NIL . #6#) (LETT #1# (REVERSE |bl|) . #6#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p0| (CAR #1#) . #6#) NIL)
                     (ATOM #2#) (PROGN (LETT |m1| (CAR #2#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL
                        (|PERMGRP;relations_for_orbit| |p0| |m1| |orbd| |grpv|
                         $)
                        |res| (QREFELT $ 128))
                       . #6#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |PERMGRP;relationsInStrongGenerators;$L;29|
        ((|gp| $) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|grpv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (|gi|
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
         (SEQ (|PERMGRP;knownGroup?| |gp| $)
              (LETT |gi| (QCDR |gp|)
                    . #1=(|PERMGRP;relationsInStrongGenerators;$L;29|))
              (LETT |grpv| (SPADCALL (QVELT |gi| 1) (QREFELT $ 35)) . #1#)
              (EXIT
               (|PERMGRP;relations_in_strong_generators| (QVELT |gi| 3) |grpv|
                $))))) 

(SDEFUN |PERMGRP;relationsInGenerators;$L;30|
        ((|gp| $) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (|nrel| (|List| (|Integer|)))
          (#1=#:G1153 NIL) (|k| NIL) (|cw| (|List| (|Integer|)))
          (#2=#:G1152 NIL) (|j| NIL)
          (|rhr|
           (|Record| (|:| |elt| (|Vector| (|NonNegativeInteger|)))
                     (|:| |lst| (|List| (|NonNegativeInteger|)))))
          (|q| (|Vector| (|NonNegativeInteger|))) (#3=#:G1150 NIL) (|i| NIL)
          (#4=#:G1151 NIL) (|ggp| NIL) (#5=#:G1149 NIL)
          (|wordv| (|Vector| (|List| (|NonNegativeInteger|))))
          (|n0| (|NonNegativeInteger|)) (|nn| (|NonNegativeInteger|))
          (|supp| (|List| S)) (#6=#:G1148 NIL) (#7=#:G1147 NIL)
          (#8=#:G1146 NIL) (|srel| NIL) (|iwd| (|List| (|Integer|)))
          (#9=#:G1145 NIL) (#10=#:G1144 NIL) (#11=#:G1143 NIL)
          (#12=#:G1141 NIL) (#13=#:G1142 NIL) (|wli| NIL)
          (|iwords| #14=(|Vector| (|List| (|Integer|)))) (|words| #14#)
          (|srels| (|List| (|List| (|Integer|))))
          (|orbd|
           #15=(|Vector|
                (|Record| (|:| |orb| (|List| (|NonNegativeInteger|)))
                          (|:| |svc| (|Vector| (|Integer|))))))
          (|grpv| (|Vector| (|Vector| (|NonNegativeInteger|))))
          (|gi|
           (|Record| (|:| |order| (|NonNegativeInteger|))
                     (|:| |sgset| (|List| (|Vector| (|NonNegativeInteger|))))
                     (|:| |gpbase| (|List| (|NonNegativeInteger|)))
                     (|:| |orbs| #15#) (|:| |mp| (|List| S))
                     (|:| |wd| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (LETT |gi| (QCDR |gp|) . #16=(|PERMGRP;relationsInGenerators;$L;30|))
          (COND
           ((EQL (LENGTH (QVELT |gi| 5)) 0)
            (SEQ (SPADCALL |gp| (QREFELT $ 130))
                 (EXIT (LETT |gi| (QCDR |gp|) . #16#)))))
          (LETT |grpv| (SPADCALL (QVELT |gi| 1) (QREFELT $ 35)) . #16#)
          (LETT |orbd| (QVELT |gi| 3) . #16#)
          (LETT |srels|
                (|PERMGRP;relations_in_strong_generators| |orbd| |grpv| $)
                . #16#)
          (LETT |words| (MAKEARR1 (LENGTH (QVELT |gi| 5)) NIL) . #16#)
          (LETT |iwords| (MAKEARR1 (QVSIZE |words|) NIL) . #16#)
          (SEQ (LETT |wli| NIL . #16#) (LETT #13# (QVELT |gi| 5) . #16#)
               (LETT |i| 1 . #16#) (LETT #12# (QVSIZE |words|) . #16#) G190
               (COND
                ((OR (|greater_SI| |i| #12#) (ATOM #13#)
                     (PROGN (LETT |wli| (CAR #13#) . #16#) NIL))
                 (GO G191)))
               (SEQ
                (SPADCALL |words| |i|
                          (PROGN
                           (LETT #11# NIL . #16#)
                           (SEQ (LETT |j| NIL . #16#) (LETT #10# |wli| . #16#)
                                G190
                                (COND
                                 ((OR (ATOM #10#)
                                      (PROGN (LETT |j| (CAR #10#) . #16#) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #11# (CONS |j| #11#) . #16#)))
                                (LETT #10# (CDR #10#) . #16#) (GO G190) G191
                                (EXIT (NREVERSE #11#))))
                          (QREFELT $ 132))
                (LETT |iwd| NIL . #16#)
                (SEQ (LETT |j| NIL . #16#) (LETT #9# |wli| . #16#) G190
                     (COND
                      ((OR (ATOM #9#) (PROGN (LETT |j| (CAR #9#) . #16#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT |iwd| (CONS (- |j|) |iwd|) . #16#)))
                     (LETT #9# (CDR #9#) . #16#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |iwords| |i| |iwd| (QREFELT $ 132))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #13# (CDR #13#) . #16#))
                     . #16#)
               (GO G190) G191 (EXIT NIL))
          (LETT |res| NIL . #16#)
          (SEQ (LETT |srel| NIL . #16#) (LETT #8# |srels| . #16#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |srel| (CAR #8#) . #16#) NIL))
                 (GO G191)))
               (SEQ (LETT |nrel| NIL . #16#)
                    (SEQ (LETT |i| NIL . #16#) (LETT #7# |srel| . #16#) G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |i| (CAR #7#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |cw|
                                (COND
                                 ((SPADCALL |i| 0 (QREFELT $ 47))
                                  (QAREF1O |words| |i| 1))
                                 ('T (QAREF1O |iwords| (- |i|) 1)))
                                . #16#)
                          (EXIT
                           (SEQ (LETT |j| NIL . #16#) (LETT #6# |cw| . #16#)
                                G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |j| (CAR #6#) . #16#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT |nrel| (CONS |j| |nrel|) . #16#)))
                                (LETT #6# (CDR #6#) . #16#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #7# (CDR #7#) . #16#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |res| (CONS (NREVERSE |nrel|) |res|) . #16#)))
               (LETT #8# (CDR #8#) . #16#) (GO G190) G191 (EXIT NIL))
          (LETT |supp| (SPADCALL |gp| (QREFELT $ 53)) . #16#)
          (LETT |nn| (LENGTH |supp|) . #16#) (LETT |n0| (QVSIZE |grpv|) . #16#)
          (LETT |wordv| (MAKEARR1 |n0| NIL) . #16#)
          (SEQ (LETT |i| 1 . #16#) (LETT #5# |n0| . #16#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ (EXIT (SPADCALL |wordv| |i| (LIST |i|) (QREFELT $ 120))))
               (LETT |i| (|inc_SI| |i|) . #16#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |ggp| NIL . #16#) (LETT #4# (QCAR |gp|) . #16#)
               (LETT |i| 1 . #16#) (LETT #3# (QVSIZE |words|) . #16#) G190
               (COND
                ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                     (PROGN (LETT |ggp| (CAR #4#) . #16#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |q| (SPADCALL |supp| |ggp| |nn| (QREFELT $ 70)) . #16#)
                (LETT |rhr|
                      (|PERMGRP;strip| |q| (QVSIZE |orbd|) 'T |orbd| |grpv|
                       |wordv| $)
                      . #16#)
                (LETT |nrel| NIL . #16#)
                (SEQ (LETT |j| NIL . #16#) (LETT #2# (QCDR |rhr|) . #16#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #16#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |cw| (SPADCALL |words| |j| (QREFELT $ 133)) . #16#)
                      (EXIT
                       (SEQ (LETT |k| NIL . #16#) (LETT #1# |cw| . #16#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |k| (CAR #1#) . #16#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT |nrel| (CONS |k| |nrel|) . #16#)))
                            (LETT #1# (CDR #1#) . #16#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #2# (CDR #2#) . #16#) (GO G190) G191 (EXIT NIL))
                (LETT |nrel| (NREVERSE |nrel|) . #16#)
                (LETT |nrel| (CONS |i| |nrel|) . #16#)
                (EXIT (LETT |res| (CONS |nrel| |res|) . #16#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #16#))
                     . #16#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(PUT '|PERMGRP;coerce;$L;31| '|SPADreplace| 'QCAR) 

(SDEFUN |PERMGRP;coerce;$L;31| ((|gp| $) ($ |List| (|Permutation| S)))
        (QCAR |gp|)) 

(PUT '|PERMGRP;generators;$L;32| '|SPADreplace| 'QCAR) 

(SDEFUN |PERMGRP;generators;$L;32| ((|gp| $) ($ |List| (|Permutation| S)))
        (QCAR |gp|)) 

(SDEFUN |PERMGRP;strongGenerators;$L;33|
        ((|group| $) ($ |List| (|Permutation| S)))
        (SPROG
         ((|strongGens| (|List| (|Permutation| S)))
          (|pairs| (|List| (|List| S))) (#1=#:G1163 NIL) (|j| NIL)
          (#2=#:G1162 NIL) (|i| NIL) (|degree| (|NonNegativeInteger|))
          (|gr_sgs| (|List| (|Vector| (|NonNegativeInteger|))))
          (|gr_supp| (|List| S)))
         (SEQ (|PERMGRP;knownGroup?| |group| $)
              (LETT |gr_supp| (QVELT (QCDR |group|) 4)
                    . #3=(|PERMGRP;strongGenerators;$L;33|))
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
                               (CONS (SPADCALL |pairs| (QREFELT $ 136))
                                     |strongGens|)
                               . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |strongGens|))))) 

(SDEFUN |PERMGRP;elt;$NniP;34|
        ((|gp| $) (|i| |NonNegativeInteger|) ($ |Permutation| S))
        (SPADCALL (QCAR |gp|) |i| (QREFELT $ 138))) 

(SDEFUN |PERMGRP;movedPoints;$S;35| ((|gp| $) ($ |Set| S))
        (SPADCALL (SPADCALL |gp| (QREFELT $ 53)) (QREFELT $ 140))) 

(SDEFUN |PERMGRP;random;$IP;36|
        ((|group| $) (|maximalNumberOfFactors| |Integer|) ($ |Permutation| S))
        (SPROG
         ((|numberOfLoops| #1=(|Integer|)) (|randomElement| (|Permutation| S))
          (|randomInteger| #1#) (|numberOfGenerators| (|NonNegativeInteger|))
          (|gp| (|List| (|Permutation| S))))
         (SEQ
          (COND ((< |maximalNumberOfFactors| 1) (|spadConstant| $ 23))
                ('T
                 (SEQ (LETT |gp| (QCAR |group|) . #2=(|PERMGRP;random;$IP;36|))
                      (LETT |numberOfGenerators| (LENGTH |gp|) . #2#)
                      (LETT |randomInteger| (+ 1 (RANDOM |numberOfGenerators|))
                            . #2#)
                      (LETT |randomElement|
                            (SPADCALL |gp| |randomInteger| (QREFELT $ 138))
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
                                             (QREFELT $ 138))
                                   |randomElement| (QREFELT $ 142))
                                  . #2#)
                            (EXIT
                             (LETT |numberOfLoops| (- |numberOfLoops| 1)
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |randomElement|))))))) 

(SDEFUN |PERMGRP;random;$P;37| ((|group| $) ($ |Permutation| S))
        (SPADCALL |group| 20 (QREFELT $ 143))) 

(SDEFUN |PERMGRP;order;$Nni;38| ((|group| $) ($ |NonNegativeInteger|))
        (SEQ (|PERMGRP;knownGroup?| |group| $) (EXIT (QVELT (QCDR |group|) 0)))) 

(SDEFUN |PERMGRP;degree;$Nni;39| ((|group| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |group| (QREFELT $ 53)))) 

(SDEFUN |PERMGRP;base;$L;40| ((|group| $) ($ |List| S))
        (SPROG
         ((|groupBase| (|List| S)) (#1=#:G1180 NIL) (|i| NIL)
          (|gr_supp| (|List| S)) (|gr_base| (|List| (|NonNegativeInteger|))))
         (SEQ (|PERMGRP;knownGroup?| |group| $)
              (LETT |gr_base| (QVELT (QCDR |group|) 2)
                    . #2=(|PERMGRP;base;$L;40|))
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

(SDEFUN |PERMGRP;wordsForStrongGenerators;$L;41|
        ((|group| $) ($ |List| (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|gi|
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
          (LETT |gi| (QCDR |group|)
                . #1=(|PERMGRP;wordsForStrongGenerators;$L;41|))
          (COND
           ((EQL (LENGTH (QVELT |gi| 5)) 0)
            (SEQ (SPADCALL |group| (QREFELT $ 130))
                 (EXIT (LETT |gi| (QCDR |group|) . #1#)))))
          (EXIT (QVELT |gi| 5))))) 

(SDEFUN |PERMGRP;coerce;L$;42| ((|gp| |List| (|Permutation| S)) ($ $))
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
                . #1=(|PERMGRP;coerce;L$;42|))
          (EXIT (LETT |group| (CONS |gp| |result|) . #1#))))) 

(SDEFUN |PERMGRP;permutationGroup;L$;43|
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
                . #1=(|PERMGRP;permutationGroup;L$;43|))
          (EXIT (LETT |group| (CONS |gp| |result|) . #1#))))) 

(SDEFUN |PERMGRP;coerce;$Of;44| ((|group| $) ($ |OutputForm|))
        (SPROG
         ((|outList| (|List| (|OutputForm|))) (|i| NIL)
          (|gp| (|List| (|Permutation| S))))
         (SEQ (LETT |outList| NIL . #1=(|PERMGRP;coerce;$Of;44|))
              (LETT |gp| (QCAR |group|) . #1#)
              (SEQ (LETT |i| (SPADCALL |gp| (QREFELT $ 151)) . #1#) G190
                   (COND ((< |i| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |outList|
                           (CONS
                            (SPADCALL (SPADCALL |gp| |i| (QREFELT $ 138))
                                      (QREFELT $ 153))
                            |outList|)
                           . #1#)))
                   (LETT |i| (+ |i| -1) . #1#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL '> (QREFELT $ 155))
                         (SPADCALL (SPADCALL |outList| (QREFELT $ 157))
                                   (SPADCALL '< (QREFELT $ 155))
                                   (QREFELT $ 158))
                         (QREFELT $ 158)))))) 

(SDEFUN |PERMGRP;orbit;$SS;45| ((|gp| $) (|el| S) ($ |Set| S))
        (SPROG
         ((#1=#:G1201 NIL) (|i| NIL) (|outSet| (|Set| S))
          (|outList| (|List| (|List| S))) (|elList| (|List| S)))
         (SEQ (LETT |elList| (LIST |el|) . #2=(|PERMGRP;orbit;$SS;45|))
              (LETT |outList| (|PERMGRP;orbitInternal| |gp| |elList| $) . #2#)
              (LETT |outSet| (SPADCALL (QREFELT $ 55)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (LENGTH |outList|) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |outList| |i| (QREFELT $ 41)) 1
                                (QREFELT $ 42))
                      |outSet| (QREFELT $ 160))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |outSet|)))) 

(SDEFUN |PERMGRP;orbits;$S;46| ((|gp| $) ($ |Set| (|Set| S)))
        (SPROG
         ((|spp| (|Set| S)) (|orbits| (|List| (|Set| S)))
          (|orbitSet| (|Set| S)) (|el| (S)))
         (SEQ
          (LETT |spp| (SPADCALL |gp| (QREFELT $ 141))
                . #1=(|PERMGRP;orbits;$S;46|))
          (LETT |orbits| NIL . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |spp| (QREFELT $ 162)) 0 (QREFELT $ 94)))
                 (GO G191)))
               (SEQ (LETT |el| (SPADCALL |spp| (QREFELT $ 163)) . #1#)
                    (LETT |orbitSet| (SPADCALL |gp| |el| (QREFELT $ 161))
                          . #1#)
                    (LETT |orbits| (CONS |orbitSet| |orbits|) . #1#)
                    (EXIT
                     (LETT |spp| (SPADCALL |spp| |orbitSet| (QREFELT $ 164))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |orbits| (QREFELT $ 167)))))) 

(SDEFUN |PERMGRP;member?;P$B;47| ((|p| |Permutation| S) (|gp| $) ($ |Boolean|))
        (SPROG
         ((|mi|
           (|Record| (|:| |bool| (|Boolean|))
                     (|:| |lst| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |mi| (|PERMGRP;memberInternal| |p| |gp| NIL $)
                |PERMGRP;member?;P$B;47|)
          (EXIT (QCAR |mi|))))) 

(SDEFUN |PERMGRP;wordInStrongGenerators;P$L;48|
        ((|p| |Permutation| S) (|gp| $) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|mi|
           (|Record| (|:| |bool| (|Boolean|))
                     (|:| |lst| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |mi|
                (|PERMGRP;memberInternal| (SPADCALL |p| (QREFELT $ 169)) |gp|
                 'T $)
                |PERMGRP;wordInStrongGenerators;P$L;48|)
          (COND
           ((NULL (QCAR |mi|)) (EXIT (|error| "p is not an element of gp"))))
          (EXIT (QCDR |mi|))))) 

(SDEFUN |PERMGRP;wordInGenerators;P$L;49|
        ((|p| |Permutation| S) (|gp| $) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|outlist| (|List| (|NonNegativeInteger|))) (#1=#:G1218 NIL)
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
          (LETT |gp_info| (QCDR |gp|) . #3=(|PERMGRP;wordInGenerators;P$L;49|))
          (COND
           ((EQL (LENGTH (QVELT |gp_info| 5)) 0)
            (SEQ (SPADCALL |gp| (QREFELT $ 130))
                 (EXIT (LETT |gp_info| (QCDR |gp|) . #3#)))))
          (LETT |lll| (SPADCALL |p| |gp| (QREFELT $ 170)) . #3#)
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

(SDEFUN |PERMGRP;<;2$B;50| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (COND
         ((NULL
           (SPADCALL
            (SPADCALL (SPADCALL |gp1| (QREFELT $ 141))
                      (SPADCALL |gp2| (QREFELT $ 141)) (QREFELT $ 164))
            (QREFELT $ 172)))
          NIL)
         ((NULL (|PERMGRP;subgroup| |gp1| |gp2| $)) NIL)
         ('T
          (NULL
           (EQL (SPADCALL |gp1| (QREFELT $ 145))
                (SPADCALL |gp2| (QREFELT $ 145))))))) 

(SDEFUN |PERMGRP;<=;2$B;51| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (COND
         ((NULL
           (SPADCALL
            (SPADCALL (SPADCALL |gp1| (QREFELT $ 141))
                      (SPADCALL |gp2| (QREFELT $ 141)) (QREFELT $ 164))
            (QREFELT $ 172)))
          NIL)
         ('T (|PERMGRP;subgroup| |gp1| |gp2| $)))) 

(SDEFUN |PERMGRP;=;2$B;52| ((|gp1| $) (|gp2| $) ($ |Boolean|))
        (SPROG ((#1=#:G1234 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |gp1| (QREFELT $ 141))
                             (SPADCALL |gp2| (QREFELT $ 141)) (QREFELT $ 175))
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
                          (LETT #1# NIL . #3=(|PERMGRP;=;2$B;52|))
                          (GO #4=#:G1233))))))
                     ((NULL (|PERMGRP;subgroup| |gp2| |gp1| $))
                      (EXIT (PROGN (LETT #1# NIL . #3#) (GO #4#)))))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |gp1| (QREFELT $ 145))
                            (SPADCALL |gp2| (QREFELT $ 145)))
                       'T)
                      (#2# NIL)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |PERMGRP;orbit;$SS;53|
        ((|gp| $) (|startSet| |Set| S) ($ |Set| (|Set| S)))
        (SPROG
         ((|newSet| (|Set| S)) (#1=#:G1239 NIL) (|i| NIL)
          (|outSet| (|Set| (|Set| S))) (|outList| (|List| (|List| S)))
          (|startList| (|List| S)))
         (SEQ
          (LETT |startList| (SPADCALL |startSet| (QREFELT $ 58))
                . #2=(|PERMGRP;orbit;$SS;53|))
          (LETT |outList| (|PERMGRP;orbitInternal| |gp| |startList| $) . #2#)
          (LETT |outSet| (SPADCALL (QREFELT $ 177)) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (LENGTH |outList|) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |newSet|
                      (SPADCALL (SPADCALL |outList| |i| (QREFELT $ 41))
                                (QREFELT $ 140))
                      . #2#)
                (EXIT (SPADCALL |newSet| |outSet| (QREFELT $ 178))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |outSet|)))) 

(SDEFUN |PERMGRP;orbit;$LS;54|
        ((|gp| $) (|startList| |List| S) ($ |Set| (|List| S)))
        (SPADCALL (|PERMGRP;orbitInternal| |gp| |startList| $) (QREFELT $ 181))) 

(SDEFUN |PERMGRP;initializeGroupForWordProblem;$2IV;55|
        ((|gp| $) (|maxLoops| |Integer|) (|diff| |Integer|) ($ |Void|))
        (SEQ (|PERMGRP;bsgs| |gp| 'T |maxLoops| |diff| $)
             (EXIT (SPADCALL (QREFELT $ 113))))) 

(SDEFUN |PERMGRP;initializeGroupForWordProblem;$V;56| ((|gp| $) ($ |Void|))
        (SPADCALL |gp| 0 1 (QREFELT $ 183))) 

(DECLAIM (NOTINLINE |PermutationGroup;|)) 

(DEFUN |PermutationGroup| (#1=#:G1244)
  (SPROG NIL
         (PROG (#2=#:G1245)
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
          (LETT $ (GETREFV 187) . #1#)
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
              |PERMGRP;coerce;$L;31| (|NonNegativeInteger|) (|Permutation| 6)
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
              (163 . =) (169 . |pointList|) (|Set| 6) (174 . |empty|)
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
              (|Set| 11) (412 . |empty|) (416 . |degree|) (421 . |insert!|)
              (|Void|) (427 . |void|) (431 . |difference|) (437 . |empty?|)
              (442 . |parts|) |PERMGRP;member?;P$B;47| (447 . |member?|)
              (453 . |member?|) (459 . |setelt!|) (466 . |members|)
              (471 . |first|) (477 . =) (483 . |concat|) (|List| 15)
              (489 . |concat|) (|List| 125) (495 . |concat|)
              |PERMGRP;relationsInStrongGenerators;$L;29|
              |PERMGRP;initializeGroupForWordProblem;$V;56| (|Vector| 125)
              (501 . |setelt!|) (508 . |elt|)
              |PERMGRP;relationsInGenerators;$L;30| |PERMGRP;generators;$L;32|
              (514 . |coerceListOfPairs|) |PERMGRP;strongGenerators;$L;33|
              (519 . |elt|) |PERMGRP;elt;$NniP;34| (525 . |set|)
              |PERMGRP;movedPoints;$S;35| (530 . *) |PERMGRP;random;$IP;36|
              |PERMGRP;random;$P;37| |PERMGRP;order;$Nni;38|
              |PERMGRP;degree;$Nni;39| |PERMGRP;base;$L;40|
              |PERMGRP;wordsForStrongGenerators;$L;41| |PERMGRP;coerce;L$;42|
              |PERMGRP;permutationGroup;L$;43| (536 . |maxIndex|)
              (|OutputForm|) (541 . |coerce|) (|Symbol|) (546 . |outputForm|)
              (|List| $) (551 . |commaSeparate|) (556 . |postfix|)
              |PERMGRP;coerce;$Of;44| (562 . |insert!|) |PERMGRP;orbit;$SS;45|
              (568 . |cardinality|) (573 . |extract!|) (578 . |difference|)
              (|List| 54) (|Set| 54) (584 . |set|) |PERMGRP;orbits;$S;46|
              (589 . |inv|) |PERMGRP;wordInStrongGenerators;P$L;48|
              |PERMGRP;wordInGenerators;P$L;49| (594 . |empty?|)
              |PERMGRP;<;2$B;50| |PERMGRP;<=;2$B;51| (599 . ~=)
              |PERMGRP;=;2$B;52| (605 . |empty|) (609 . |insert!|)
              |PERMGRP;orbit;$SS;53| (|Set| 39) (615 . |set|)
              |PERMGRP;orbit;$LS;54|
              |PERMGRP;initializeGroupForWordProblem;$2IV;55| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 620 |wordsForStrongGenerators| 626 |wordInStrongGenerators|
              631 |wordInGenerators| 637 |strongGenerators| 643
              |relationsInStrongGenerators| 648 |relationsInGenerators| 653
              |random| 658 |pointList| 669 |permutationGroup| 674 |perm_to_vec|
              679 |order| 686 |orbits| 691 |orbit| 696 |movedPoints| 714
              |member?| 719 |latex| 725 |initializeGroupForWordProblem| 730
              |hashUpdate!| 742 |hash| 748 |generators| 753 |elt| 758 |degree|
              764 |coerce| 769 |base| 784 = 789 <= 795 < 801)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 152))
                        (|makeByteWordVec2| 186
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
                                              29 34 0 121 2 34 0 0 10 122 2 13
                                              18 0 0 123 2 13 0 0 0 124 2 125 0
                                              0 0 126 2 127 0 0 0 128 3 131 125
                                              0 15 125 132 2 131 125 0 15 133 1
                                              11 0 40 136 2 8 11 0 15 138 1 54
                                              0 39 140 2 11 0 0 0 142 1 8 15 0
                                              151 1 11 152 0 153 1 152 0 154
                                              155 1 152 0 156 157 2 152 0 0 0
                                              158 2 54 0 6 0 160 1 54 10 0 162
                                              1 54 6 0 163 2 54 0 0 0 164 1 166
                                              0 165 167 1 11 0 0 169 1 54 18 0
                                              172 2 54 18 0 0 175 0 166 0 177 2
                                              166 0 54 0 178 1 180 0 40 181 2 0
                                              18 0 0 1 1 0 36 0 148 2 0 13 11 0
                                              170 2 0 13 11 0 171 1 0 8 0 137 1
                                              0 127 0 129 1 0 127 0 134 2 0 11
                                              0 15 143 1 0 11 0 144 1 0 39 0 53
                                              1 0 0 8 150 3 0 26 39 11 10 70 1
                                              0 10 0 145 1 0 166 0 168 2 0 166
                                              0 54 179 2 0 180 0 39 182 2 0 54
                                              0 6 161 1 0 54 0 141 2 0 18 11 0
                                              117 1 0 184 0 1 1 0 112 0 130 3 0
                                              112 0 15 15 183 2 0 186 186 0 1 1
                                              0 185 0 1 1 0 8 0 135 2 0 11 0 10
                                              139 1 0 10 0 146 1 0 0 8 149 1 0
                                              8 0 9 1 0 152 0 159 1 0 39 0 147
                                              2 0 18 0 0 176 2 0 18 0 0 174 2 0
                                              18 0 0 173)))))
           '|lookupComplete|)) 
