
(SDEFUN |FDIV;Zero;$;1| (($ $)) (|spadConstant| $ 13)) 

(SDEFUN |FDIV;coerce;$Of;2| ((|d| $) ($ |OutputForm|))
        (SPADCALL |d| (QREFELT $ 16))) 

(SDEFUN |FDIV;=;2$B;3| ((|d1| $) (|d2| $) ($ |Boolean|))
        (SPADCALL |d1| |d2| (QREFELT $ 19))) 

(SDEFUN |FDIV;*;I2$;4| ((|n| |Integer|) (|d| $) ($ $))
        (SPADCALL |n| |d| (QREFELT $ 22))) 

(SDEFUN |FDIV;+;3$;5| ((|d1| $) (|d2| $) ($ $))
        (SPADCALL |d1| |d2| (QREFELT $ 24))) 

(SDEFUN |FDIV;-;2$;6| ((|d| $) ($ $)) (SPADCALL |d| (QREFELT $ 26))) 

(SDEFUN |FDIV;ideal;$Fi;7|
        ((|d| $) ($ |FractionalIdeal| UP (|Fraction| UP) UPUP R))
        (SPADCALL |d| (QREFELT $ 29))) 

(SDEFUN |FDIV;reduce;2$;8| ((|d| $) ($ $)) (SPADCALL |d| (QREFELT $ 31))) 

(SDEFUN |FDIV;generator;$U;9| ((|d| $) ($ |Union| R "failed"))
        (SPADCALL |d| (QREFELT $ 34))) 

(SDEFUN |FDIV;decompose;$R;10|
        ((|d| $)
         ($ |Record| (|:| |id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|:| |principalPart| R)))
        (SPADCALL |d| (QREFELT $ 37))) 

(SDEFUN |FDIV;divisor;Fi$;11|
        ((|i| |FractionalIdeal| UP (|Fraction| UP) UPUP R) ($ $))
        (SPADCALL |i| (QREFELT $ 39))) 

(SDEFUN |FDIV;divisor;R$;12| ((|f| R) ($ $)) (SPADCALL |f| (QREFELT $ 41))) 

(SDEFUN |FDIV;divisor;2F$;13| ((|a| F) (|b| F) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 43))) 

(SDEFUN |FDIV;divisor;2FI$;14| ((|a| F) (|b| F) (|n| |Integer|) ($ $))
        (SPADCALL |a| |b| |n| (QREFELT $ 45))) 

(SDEFUN |FDIV;divisor;R3UPF$;15|
        ((|h| R) (|d| UP) (|dp| UP) (|g| UP) (|r| F) ($ $))
        (SPADCALL |h| |d| |dp| |g| |r| (QREFELT $ 47))) 

(SDEFUN |FDIV;Zero;$;16| (($ $)) (CONS (|spadConstant| $ 54) (MAKE-ARRAY 0))) 

(SDEFUN |FDIV;divisor;Fi$;17|
        ((|i| |FractionalIdeal| UP (|Fraction| UP) UPUP R) ($ $))
        (CONS |i| (MAKE-ARRAY 0))) 

(SDEFUN |FDIV;divisor;R$;18| ((|f| R) ($ $))
        (SPADCALL (SPADCALL (VECTOR |f|) (QREFELT $ 56)) (QREFELT $ 40))) 

(SDEFUN |FDIV;coerce;$Of;19| ((|d| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |d| (QREFELT $ 30)) (QREFELT $ 57))) 

(PUT '|FDIV;ideal;$Fi;20| '|SPADreplace| 'QCAR) 

(SDEFUN |FDIV;ideal;$Fi;20|
        ((|d| $) ($ |FractionalIdeal| UP (|Fraction| UP) UPUP R)) (QCAR |d|)) 

(SDEFUN |FDIV;decompose;$R;21|
        ((|d| $)
         ($ |Record| (|:| |id| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|:| |principalPart| R)))
        (CONS (SPADCALL |d| (QREFELT $ 30)) (|spadConstant| $ 58))) 

(SDEFUN |FDIV;=;2$B;22| ((|d1| $) (|d2| $) ($ |Boolean|))
        (SPADCALL (SPADCALL (SPADCALL |d1| (QREFELT $ 30)) (QREFELT $ 60))
                  (SPADCALL (SPADCALL |d2| (QREFELT $ 30)) (QREFELT $ 60))
                  (QREFELT $ 61))) 

(SDEFUN |FDIV;*;I2$;23| ((|n| |Integer|) (|d| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |d| (QREFELT $ 30)) |n| (QREFELT $ 62))
                  (QREFELT $ 40))) 

(SDEFUN |FDIV;+;3$;24| ((|d1| $) (|d2| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |d1| (QREFELT $ 30))
                   (SPADCALL |d2| (QREFELT $ 30)) (QREFELT $ 63))
         (QREFELT $ 40))) 

(SDEFUN |FDIV;-;2$;25| ((|d| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |d| (QREFELT $ 30)) (QREFELT $ 64))
                  (QREFELT $ 40))) 

(SDEFUN |FDIV;divisor;R3UPF$;26|
        ((|h| R) (|d| UP) (|dp| UP) (|g| UP) (|r| F) ($ $))
        (|FDIV;makeDivisor| |d|
         (SPADCALL (SPADCALL |h| (QREFELT $ 65))
                   (SPADCALL
                    (SPADCALL (SPADCALL |r| |dp| (QREFELT $ 66))
                              (QREFELT $ 68))
                    (QREFELT $ 69))
                   (QREFELT $ 70))
         |g| $)) 

(SDEFUN |FDIV;intReduce| ((|h| R) (|b| UP) ($ R))
        (SPROG
         ((#1=#:G750 NIL) (#2=#:G752 NIL) (|i| NIL) (#3=#:G751 NIL)
          (|v| (|Vector| UP)))
         (SEQ
          (LETT |v| (QCAR (SPADCALL |h| (QREFELT $ 72)))
                . #4=(|FDIV;intReduce|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #3#
                   (GETREFV
                    (|inc_SI|
                     (- #5=(QVSIZE |v|) #6=(SPADCALL |v| (QREFELT $ 74)))))
                   . #4#)
             (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                  G190 (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (QAREF1O |v| |i| 1) |b|
                                      (QREFELT $ 75)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            (|spadConstant| $ 53) (QREFELT $ 76)))))) 

(SDEFUN |FDIV;divisor;2F$;28| ((|a| F) (|b| F) ($ $))
        (SPROG ((|d| (UP)) (|x| (UP)))
               (SEQ
                (LETT |x| (SPADCALL (|spadConstant| $ 52) 1 (QREFELT $ 78))
                      . #1=(|FDIV;divisor;2F$;28|))
                (COND
                 ((NULL
                   (SPADCALL
                    (SPADCALL
                     (LETT |d|
                           (SPADCALL |x| (SPADCALL |a| (QREFELT $ 79))
                                     (QREFELT $ 80))
                           . #1#)
                     (SPADCALL (SPADCALL (QREFELT $ 81)) (QREFELT $ 82))
                     (QREFELT $ 83))
                    (QREFELT $ 84)))
                  (EXIT (|error| "divisor: point is singular"))))
                (EXIT
                 (|FDIV;makeDivisor| |d|
                  (SPADCALL (SPADCALL (|spadConstant| $ 85) 1 (QREFELT $ 86))
                            (SPADCALL
                             (SPADCALL (SPADCALL |b| (QREFELT $ 79))
                                       (QREFELT $ 68))
                             (QREFELT $ 69))
                            (QREFELT $ 70))
                  (|spadConstant| $ 53) $))))) 

(SDEFUN |FDIV;divisor;2FI$;29| ((|a| F) (|b| F) (|n| |Integer|) ($ $))
        (SPROG
         ((|g| ($)) (|m| (|NonNegativeInteger|)) (#1=#:G762 NIL)
          (#2=#:G761 NIL) (|d| (UP)))
         (SEQ
          (COND
           ((NULL
             (SPADCALL
              (SPADCALL
               (LETT |d|
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 52) 1 (QREFELT $ 78))
                      (SPADCALL |a| (QREFELT $ 79)) (QREFELT $ 80))
                     . #3=(|FDIV;divisor;2FI$;29|))
               (SPADCALL (SPADCALL (QREFELT $ 81)) (QREFELT $ 82))
               (QREFELT $ 83))
              (QREFELT $ 84)))
            (COND
             ((QEQCAR (SPADCALL |n| (SPADCALL (QREFELT $ 88)) (QREFELT $ 90))
                      1)
              (EXIT (|error| "divisor: point is singular"))))))
          (LETT |m|
                (COND
                 ((< |n| 0)
                  (PROG1 (LETT #2# (- |n|) . #3#)
                    (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #2#)))
                 (#4='T
                  (PROG1 (LETT #1# |n| . #3#)
                    (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #1#))))
                . #3#)
          (LETT |g|
                (|FDIV;makeDivisor| (SPADCALL |d| |m| (QREFELT $ 92))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 85) 1 (QREFELT $ 86))
                            (SPADCALL
                             (SPADCALL (SPADCALL |b| (QREFELT $ 79))
                                       (QREFELT $ 68))
                             (QREFELT $ 69))
                            (QREFELT $ 70))
                  |m| (QREFELT $ 93))
                 (|spadConstant| $ 53) $)
                . #3#)
          (EXIT (COND ((< |n| 0) (SPADCALL |g| (QREFELT $ 27))) (#4# |g|)))))) 

(SDEFUN |FDIV;reduce;2$;30| ((|d| $) ($ $))
        (SPROG
         ((|e| (UP)) (|b| (UP))
          (|cd| (|Record| (|:| |num| UPUP) (|:| |den| UP))) (|n| (|Vector| R))
          (|i| (|FractionalIdeal| UP (|Fraction| UP) UPUP R))
          (|j| (|FractionalIdeal| UP (|Fraction| UP) UPUP R)))
         (SEQ
          (LETT |i|
                (SPADCALL
                 (LETT |j| (SPADCALL |d| (QREFELT $ 30))
                       . #1=(|FDIV;reduce;2$;30|))
                 (QREFELT $ 94))
                . #1#)
          (EXIT
           (COND ((SPADCALL |i| |j| (QREFELT $ 95)) |d|)
                 ((SPADCALL
                   (QVSIZE (LETT |n| (SPADCALL |i| (QREFELT $ 96)) . #1#)) 2
                   (QREFELT $ 97))
                  (SPADCALL |i| (QREFELT $ 40)))
                 ('T
                  (SEQ
                   (LETT |cd|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |n| (+ 1 (SPADCALL |n| (QREFELT $ 98)))
                                     (QREFELT $ 99))
                           (QREFELT $ 65))
                          (QREFELT $ 102))
                         . #1#)
                   (LETT |b|
                         (SPADCALL
                          (SPADCALL (QCDR |cd|)
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |n|
                                                (SPADCALL |n| (QREFELT $ 98))
                                                (QREFELT $ 99))
                                      (QREFELT $ 103))
                                     (QREFELT $ 82))
                                    (QREFELT $ 104))
                          (SPADCALL
                           (SPADCALL (SPADCALL (QCAR |cd|) (QREFELT $ 105))
                                     (QREFELT $ 106))
                           (QREFELT $ 82))
                          (QREFELT $ 83))
                         . #1#)
                   (LETT |e|
                         (SPADCALL (QCDR |cd|) (SPADCALL |i| (QREFELT $ 107))
                                   (QREFELT $ 104))
                         . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (VECTOR
                       (SPADCALL (SPADCALL |b| |e| (QREFELT $ 108))
                                 (QREFELT $ 109))
                       (SPADCALL
                        (SPADCALL
                         (CONS #'|FDIV;reduce;2$;30!0| (VECTOR |e| |b| $))
                         (QCAR |cd|) (QREFELT $ 111))
                        (QREFELT $ 105)))
                      (QREFELT $ 56))
                     (QREFELT $ 40)))))))))) 

(SDEFUN |FDIV;reduce;2$;30!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |b| |e|)
          (LETT $ (QREFELT $$ 2) . #1=(|FDIV;reduce;2$;30|))
          (LETT |b| (QREFELT $$ 1) . #1#)
          (LETT |e| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |s| (QREFELT $ 82)) |b| (QREFELT $ 75)) |e|
             (QREFELT $ 108)))))) 

(SDEFUN |FDIV;finiteBasis;$V;31| ((|d| $) ($ |Vector| R))
        (SEQ
         (COND
          ((SPADCALL (QCDR |d|) (QREFELT $ 112))
           (PROGN
            (RPLACD |d|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |d| (QREFELT $ 30)) (QREFELT $ 114))
                      (QREFELT $ 115))
                     (QREFELT $ 116)))
            (QCDR |d|))))
         (EXIT (QCDR |d|)))) 

(SDEFUN |FDIV;generator;$U;32| ((|d| $) ($ |Union| R "failed"))
        (SPROG
         ((#1=#:G789 NIL) (#2=#:G790 NIL) (#3=#:G791 NIL) (|i| NIL)
          (|bsis| (|Vector| R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |bsis| (SPADCALL |d| (QREFELT $ 117))
                  . #4=(|FDIV;generator;$U;32|))
            (SEQ
             (EXIT
              (SEQ (LETT |i| (SPADCALL |bsis| (QREFELT $ 98)) . #4#)
                   (LETT #3# (QVSIZE |bsis|) . #4#) G190
                   (COND ((> |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF1O |bsis| |i| 1) (QREFELT $ 118))
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2#
                                     (CONS 0
                                           (SPADCALL (QAREF1O |bsis| |i| 1)
                                                     (QREFELT $ 119)))
                                     . #4#)
                               (GO #5=#:G788))
                              . #4#)
                        (GO #6=#:G786))))))
                   (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
          #5# (EXIT #2#)))) 

(SDEFUN |FDIV;lSpaceBasis;$V;33| ((|d| $) ($ |Vector| R))
        (SPADCALL (ELT $ 119)
                  (SPADCALL
                   (SPADCALL (SPADCALL |d| (QREFELT $ 27)) (QREFELT $ 117))
                   (QREFELT $ 120))
                  (QREFELT $ 122))) 

(SDEFUN |FDIV;makeDivisor| ((|b| UP) (|hh| UPUP) (|g| UP) ($ $))
        (SPROG ((|h| (R)))
               (SEQ
                (LETT |b|
                      (SPADCALL |b|
                                (SPADCALL
                                 (SPADCALL
                                  (LETT |h| (SPADCALL |hh| (QREFELT $ 105))
                                        . #1=(|FDIV;makeDivisor|))
                                  (QREFELT $ 106))
                                 (QREFELT $ 82))
                                (QREFELT $ 83))
                      . #1#)
                (LETT |h| (|FDIV;intReduce| |h| |b| $) . #1#)
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |g| |b| (QREFELT $ 83)) (QREFELT $ 84)))
                  (LETT |h|
                        (|FDIV;intReduce|
                         (SPADCALL |h| (SPADCALL (QREFELT $ 88))
                                   (QREFELT $ 124))
                         |b| $)
                        . #1#)))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (VECTOR
                    (SPADCALL (SPADCALL |b| (QREFELT $ 68)) (QREFELT $ 109))
                    |h|)
                   (QREFELT $ 56))
                  (QREFELT $ 40)))))) 

(DECLAIM (NOTINLINE |FiniteDivisor;|)) 

(DEFUN |FiniteDivisor| (&REST #1=#:G798)
  (SPROG NIL
         (PROG (#2=#:G799)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteDivisor|)
                                               '|domainEqualList|)
                    . #3=(|FiniteDivisor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteDivisor;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FiniteDivisor|)))))))))) 

(DEFUN |FiniteDivisor;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteDivisor|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|FiniteDivisor| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 128) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|FiniteDivisor| (LIST DV$1 DV$2 DV$3 DV$4)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((QEQCAR (SPADCALL (QREFELT $ 11)) 0)
      (PROGN
       (QSETREFV $ 12 (|HyperellipticFiniteDivisor| |#1| |#2| |#3| |#4|))
       (QSETREFV $ 14
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |FDIV;Zero;$;1|) $ 14)))
       (QSETREFV $ 17 (CONS (|dispatchFunction| |FDIV;coerce;$Of;2|) $))
       (QSETREFV $ 20 (CONS (|dispatchFunction| |FDIV;=;2$B;3|) $))
       (QSETREFV $ 23 (CONS (|dispatchFunction| |FDIV;*;I2$;4|) $))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |FDIV;+;3$;5|) $))
       (QSETREFV $ 27 (CONS (|dispatchFunction| |FDIV;-;2$;6|) $))
       (QSETREFV $ 30 (CONS (|dispatchFunction| |FDIV;ideal;$Fi;7|) $))
       (QSETREFV $ 32 (CONS (|dispatchFunction| |FDIV;reduce;2$;8|) $))
       (QSETREFV $ 35 (CONS (|dispatchFunction| |FDIV;generator;$U;9|) $))
       (QSETREFV $ 38 (CONS (|dispatchFunction| |FDIV;decompose;$R;10|) $))
       (QSETREFV $ 40 (CONS (|dispatchFunction| |FDIV;divisor;Fi$;11|) $))
       (QSETREFV $ 42 (CONS (|dispatchFunction| |FDIV;divisor;R$;12|) $))
       (QSETREFV $ 44 (CONS (|dispatchFunction| |FDIV;divisor;2F$;13|) $))
       (QSETREFV $ 46 (CONS (|dispatchFunction| |FDIV;divisor;2FI$;14|) $))
       (QSETREFV $ 48 (CONS (|dispatchFunction| |FDIV;divisor;R3UPF$;15|) $))))
     ('T
      (PROGN
       (SETELT $ 12
               (|Record|
                (|:| |id| (|FractionalIdeal| |#2| (|Fraction| |#2|) |#3| |#4|))
                (|:| |fbasis| (|Vector| |#4|))))
       NIL
       NIL
       (QSETREFV $ 51 (SPADCALL (QREFELT $ 50)))
       (QSETREFV $ 14
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |FDIV;Zero;$;16|) $ 14)))
       (QSETREFV $ 40 (CONS (|dispatchFunction| |FDIV;divisor;Fi$;17|) $))
       (QSETREFV $ 42 (CONS (|dispatchFunction| |FDIV;divisor;R$;18|) $))
       (QSETREFV $ 17 (CONS (|dispatchFunction| |FDIV;coerce;$Of;19|) $))
       (QSETREFV $ 30 (CONS (|dispatchFunction| |FDIV;ideal;$Fi;20|) $))
       (QSETREFV $ 38 (CONS (|dispatchFunction| |FDIV;decompose;$R;21|) $))
       (QSETREFV $ 20 (CONS (|dispatchFunction| |FDIV;=;2$B;22|) $))
       (QSETREFV $ 23 (CONS (|dispatchFunction| |FDIV;*;I2$;23|) $))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |FDIV;+;3$;24|) $))
       (QSETREFV $ 27 (CONS (|dispatchFunction| |FDIV;-;2$;25|) $))
       (QSETREFV $ 48 (CONS (|dispatchFunction| |FDIV;divisor;R3UPF$;26|) $))
       (QSETREFV $ 44 (CONS (|dispatchFunction| |FDIV;divisor;2F$;28|) $))
       (QSETREFV $ 46 (CONS (|dispatchFunction| |FDIV;divisor;2FI$;29|) $))
       (QSETREFV $ 32 (CONS (|dispatchFunction| |FDIV;reduce;2$;30|) $))
       (QSETREFV $ 117 (CONS (|dispatchFunction| |FDIV;finiteBasis;$V;31|) $))
       (QSETREFV $ 35 (CONS (|dispatchFunction| |FDIV;generator;$U;32|) $))
       (QSETREFV $ 123
                 (CONS (|dispatchFunction| |FDIV;lSpaceBasis;$V;33|) $)))))
    $))) 

(MAKEPROP '|FiniteDivisor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Union| 7 '"failed")
              (0 . |hyperelliptic|) '|Rep| (4 . |Zero|) (8 . |Zero|)
              (|OutputForm|) (12 . |coerce|) (17 . |coerce|) (|Boolean|)
              (22 . =) (28 . =) (|Integer|) (34 . *) (40 . *) (46 . +) (52 . +)
              (58 . -) (63 . -) (|FractionalIdeal| 7 67 8 9) (68 . |ideal|)
              (73 . |ideal|) (78 . |reduce|) (83 . |reduce|)
              (|Union| 9 '"failed") (88 . |generator|) (93 . |generator|)
              (|Record| (|:| |id| 28) (|:| |principalPart| 9))
              (98 . |decompose|) (103 . |decompose|) (108 . |divisor|)
              (113 . |divisor|) (118 . |divisor|) (123 . |divisor|)
              (128 . |divisor|) (134 . |divisor|) (140 . |divisor|)
              (147 . |divisor|) (154 . |divisor|) (163 . |divisor|)
              (|Vector| $) (172 . |integralBasis|) '|ww| (176 . |One|)
              (180 . |One|) (184 . |One|) (|Vector| 9) (188 . |ideal|)
              (193 . |coerce|) (198 . |One|) (202 . |basis|) (206 . |basis|)
              (211 . =) (217 . ^) (223 . *) (229 . |inv|) (234 . |lift|)
              (239 . *) (|Fraction| 7) (245 . |coerce|) (250 . |coerce|)
              (255 . -) (|Record| (|:| |num| 73) (|:| |den| 7))
              (261 . |integralCoordinates|) (|Vector| 7) (266 . |minIndex|)
              (271 . |rem|) (277 . |integralRepresents|) (|NonNegativeInteger|)
              (283 . |monomial|) (289 . |coerce|) (294 . -)
              (300 . |discriminant|) (304 . |retract|) (309 . |gcd|)
              (315 . |ground?|) (320 . |One|) (324 . |monomial|)
              (|PositiveInteger|) (330 . |rank|) (|Union| $ '"failed")
              (334 . |exquo|) (340 . |Zero|) (344 . ^) (350 . ^)
              (356 . |minimize|) (361 . =) (367 . |numer|) (372 . ~=)
              (378 . |minIndex|) (383 . |elt|)
              (|Record| (|:| |num| 8) (|:| |den| 7))
              (|UnivariatePolynomialCommonDenominator| 7 67 8)
              (389 . |splitDenominator|) (394 . |retract|) (399 . *)
              (405 . |reduce|) (410 . |norm|) (415 . |denom|) (420 . /)
              (426 . |coerce|) (|Mapping| 67 67) (431 . |map|) (437 . |empty?|)
              (|FractionalIdealAsModule| 7 67 8 9 (NRTEVAL (QREFELT $ 51)))
              (442 . |module|) (447 . |basis|) (452 . |normalizeAtInfinity|)
              (457 . |finiteBasis|) (462 . |integralAtInfinity?|)
              (467 . |primitivePart|) (472 . |reduceBasisAtInfinity|)
              (|Mapping| 9 9) (477 . |map!|) (483 . |lSpaceBasis|) (488 . ^)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 494 |zero?| 500 |subtractIfCan| 505 |sample| 511 |reduce| 515
              |principal?| 520 |opposite?| 525 |latex| 531 |lSpaceBasis| 536
              |ideal| 541 |hashUpdate!| 546 |hash| 552 |generator| 557
              |finiteBasis| 562 |divisor| 567 |decompose| 599 |coerce| 604
              |Zero| 609 = 613 - 619 + 630 * 636)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|FiniteDivisorCategory&| |AbelianGroup&| NIL
                     |AbelianMonoid&| |AbelianSemiGroup&| |SetCategory&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|FiniteDivisorCategory| 6 7 8 9) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                      (|CoercibleTo| 15))
                   (|makeByteWordVec2| 127
                                       '(0 9 10 11 0 12 0 13 0 0 0 14 1 12 15 0
                                         16 1 0 15 0 17 2 12 18 0 0 19 2 0 18 0
                                         0 20 2 12 0 21 0 22 2 0 0 21 0 23 2 12
                                         0 0 0 24 2 0 0 0 0 25 1 12 0 0 26 1 0
                                         0 0 27 1 12 28 0 29 1 0 28 0 30 1 12 0
                                         0 31 1 0 0 0 32 1 12 33 0 34 1 0 33 0
                                         35 1 12 36 0 37 1 0 36 0 38 1 12 0 28
                                         39 1 0 0 28 40 1 12 0 9 41 1 0 0 9 42
                                         2 12 0 6 6 43 2 0 0 6 6 44 3 12 0 6 6
                                         21 45 3 0 0 6 6 21 46 5 12 0 9 7 7 7 6
                                         47 5 0 0 9 7 7 7 6 48 0 9 49 50 0 6 0
                                         52 0 7 0 53 0 28 0 54 1 28 0 55 56 1
                                         28 15 0 57 0 9 0 58 0 9 49 59 1 28 55
                                         0 60 2 55 18 0 0 61 2 28 0 0 21 62 2
                                         28 0 0 0 63 1 28 0 0 64 1 9 8 0 65 2 7
                                         0 6 0 66 1 67 0 7 68 1 8 0 67 69 2 8 0
                                         0 0 70 1 9 71 0 72 1 73 21 0 74 2 7 0
                                         0 0 75 2 9 0 73 7 76 2 7 0 6 77 78 1 7
                                         0 6 79 2 7 0 0 0 80 0 9 67 81 1 67 7 0
                                         82 2 7 0 0 0 83 1 7 18 0 84 0 67 0 85
                                         2 8 0 67 77 86 0 9 87 88 2 21 89 0 0
                                         90 0 6 0 91 2 7 0 0 77 92 2 8 0 0 77
                                         93 1 28 0 0 94 2 28 18 0 0 95 1 28 55
                                         0 96 2 77 18 0 0 97 1 55 21 0 98 2 55
                                         9 0 21 99 1 101 100 8 102 1 9 67 0 103
                                         2 7 0 0 0 104 1 9 0 8 105 1 9 67 0 106
                                         1 28 7 0 107 2 67 0 7 7 108 1 9 0 67
                                         109 2 8 0 110 0 111 1 55 18 0 112 1
                                         113 0 28 114 1 113 55 0 115 1 9 49 49
                                         116 1 0 55 0 117 1 9 18 0 118 1 9 0 0
                                         119 1 9 49 49 120 2 55 0 121 0 122 1 0
                                         55 0 123 2 9 0 0 87 124 2 0 18 0 0 1 1
                                         0 18 0 1 2 0 89 0 0 1 0 0 0 1 1 0 0 0
                                         32 1 0 18 0 1 2 0 18 0 0 1 1 0 126 0 1
                                         1 0 55 0 123 1 0 28 0 30 2 0 125 125 0
                                         1 1 0 127 0 1 1 0 33 0 35 1 0 55 0 117
                                         5 0 0 9 7 7 7 6 48 3 0 0 6 6 21 46 1 0
                                         0 9 42 2 0 0 6 6 44 1 0 0 28 40 1 0 36
                                         0 38 1 0 15 0 17 0 0 0 14 2 0 18 0 0
                                         20 2 0 0 0 0 1 1 0 0 0 27 2 0 0 0 0 25
                                         2 0 0 21 0 23 2 0 0 77 0 1 2 0 0 87 0
                                         1)))))
           '|lookupComplete|)) 
