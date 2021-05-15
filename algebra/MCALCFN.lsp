
(SDEFUN |MCALCFN;localGradient| ((|v| F) (|xlist| |List| S) ($ |Vector| F))
        (SPROG ((#1=#:G381 NIL) (|x| NIL) (#2=#:G380 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |x| NIL) (LETT #1# |xlist|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS (SPADCALL |v| |x| (QREFELT $ 10)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 13))))) 

(SDEFUN |MCALCFN;gradient;FFLASV;2| ((|v| F) (|xflas| FLAS) ($ |Vector| F))
        (SPROG ((|xlist| (|List| S)))
               (SEQ (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15)))
                    (EXIT (|MCALCFN;localGradient| |v| |xlist| $))))) 

(SDEFUN |MCALCFN;localDivergence| ((|vf| |Vector| F) (|xlist| |List| S) ($ F))
        (SPROG
         ((|ans| (F)) (#1=#:G388 NIL) (|i| NIL) (|n| (|NonNegativeInteger|))
          (#2=#:G384 NIL))
         (SEQ
          (LETT |n|
                (MIN (LENGTH |xlist|)
                     (PROG1 (LETT #2# (QVSIZE |vf|))
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))))
          (LETT |ans| (|spadConstant| $ 17))
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ans|
                       (SPADCALL |ans|
                                 (SPADCALL (SPADCALL |vf| |i| (QREFELT $ 19))
                                           (SPADCALL |xlist| |i|
                                                     (QREFELT $ 20))
                                           (QREFELT $ 10))
                                 (QREFELT $ 21)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |MCALCFN;divergence;FLAFFLASF;4| ((|vf| FLAF) (|xflas| FLAS) ($ F))
        (SPROG
         ((|ans| (F)) (#1=#:G393 NIL) (|i| NIL) (|n| (|NonNegativeInteger|))
          (#2=#:G389 NIL) (|xlist| (|List| S)))
         (SEQ (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15)))
              (LETT |n|
                    (MIN (LENGTH |xlist|)
                         (PROG1 (LETT #2# (SPADCALL |vf| (QREFELT $ 22)))
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#))))
              (LETT |ans| (|spadConstant| $ 17))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL
                                      (SPADCALL |vf| |i| (QREFELT $ 23))
                                      (SPADCALL |xlist| |i| (QREFELT $ 20))
                                      (QREFELT $ 10))
                                     (QREFELT $ 21)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MCALCFN;laplacian;FFLASF;5| ((|v| F) (|xflas| FLAS) ($ F))
        (SPROG ((|gv| (|Vector| F)) (|xlist| (|List| S)))
               (SEQ (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15)))
                    (LETT |gv| (|MCALCFN;localGradient| |v| |xlist| $))
                    (EXIT (|MCALCFN;localDivergence| |gv| |xlist| $))))) 

(SDEFUN |MCALCFN;hessian;FFLASM;6| ((|v| F) (|xflas| FLAS) ($ |Matrix| F))
        (SPROG
         ((#1=#:G403 NIL) (|x| NIL) (#2=#:G402 NIL) (#3=#:G401 NIL) (|y| NIL)
          (#4=#:G400 NIL) (|xlist| (|List| S)))
         (SEQ (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15)))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |y| NIL) (LETT #3# |xlist|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |y| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |x| NIL) (LETT #1# |xlist|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |x| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |v| (LIST |x| |y|)
                                                        (QREFELT $ 26))
                                              #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT $ 29)))))) 

(SDEFUN |MCALCFN;jacobian;FLAFFLASM;7|
        ((|vf| FLAF) (|xflas| FLAS) ($ |Matrix| F))
        (SPROG
         ((#1=#:G411 NIL) (|x| NIL) (#2=#:G410 NIL) (#3=#:G409 NIL) (|i| NIL)
          (#4=#:G408 NIL) (|xlist| (|List| S)))
         (SEQ (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15)))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |i| 1) (LETT #3# (SPADCALL |vf| (QREFELT $ 22)))
                      G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |x| NIL) (LETT #1# |xlist|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |x| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL |vf| |i|
                                                         (QREFELT $ 23))
                                               |x| (QREFELT $ 10))
                                              #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT $ 29)))))) 

(SDEFUN |MCALCFN;bandedHessian;FFLASNniM;8|
        ((|v| F) (|xflas| FLAS) (|k| |NonNegativeInteger|) ($ |Matrix| F))
        (SPROG
         ((#1=#:G419 NIL) (|j| NIL) (#2=#:G418 NIL) (|iw| NIL) (#3=#:G417 NIL)
          (|bandM| (|Matrix| F)) (|n| (|NonNegativeInteger|))
          (|xlist| (|List| S)))
         (SEQ (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15)))
              (LETT |n| (LENGTH |xlist|))
              (LETT |bandM| (MAKE_MATRIX1 (+ |k| 1) |n| (|spadConstant| $ 17)))
              (SEQ (LETT |j| 1) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |j| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bandM| 1 |j|
                               (SPADCALL |v|
                                         (SPADCALL |xlist| |j| (QREFELT $ 20))
                                         2 (QREFELT $ 34))
                               (QREFELT $ 35))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |iw| 2) (LETT #2# (+ |k| 1)) G190
                   (COND ((|greater_SI| |iw| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# (+ (- |n| |iw|) 1)) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |bandM| |iw| |j|
                                      (SPADCALL |v|
                                                (LIST
                                                 (SPADCALL |xlist| |j|
                                                           (QREFELT $ 20))
                                                 (SPADCALL |xlist|
                                                           (- (+ |j| |iw|) 1)
                                                           (QREFELT $ 20)))
                                                (QREFELT $ 26))
                                      (QREFELT $ 35))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |iw| (|inc_SI| |iw|)) (GO G190) G191 (EXIT NIL))
              (EXIT |bandM|)))) 

(SDEFUN |MCALCFN;jacobian;FLAFFLASM;9|
        ((|vf| FLAF) (|xflas| FLAS) ($ |Matrix| F))
        (SPROG
         ((#1=#:G427 NIL) (|x| NIL) (#2=#:G426 NIL) (#3=#:G425 NIL) (|i| NIL)
          (#4=#:G424 NIL) (|xlist| (|List| S)))
         (SEQ (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15)))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |i| 1) (LETT #3# (SPADCALL |vf| (QREFELT $ 22)))
                      G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |x| NIL) (LETT #1# |xlist|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |x| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL |vf| |i|
                                                         (QREFELT $ 23))
                                               |x| (QREFELT $ 10))
                                              #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT $ 29)))))) 

(SDEFUN |MCALCFN;bandedJacobian;FLAFFLAS2NniM;10|
        ((|vf| FLAF) (|xflas| FLAS) (|kl| |NonNegativeInteger|)
         (|ku| |NonNegativeInteger|) ($ |Matrix| F))
        (SPROG
         ((#1=#:G439 NIL) (|j| NIL) (#2=#:G438 NIL) (|iw| NIL) (#3=#:G437 NIL)
          (#4=#:G436 NIL) (#5=#:G435 NIL) (|bandM| (|Matrix| F))
          (|n| (|NonNegativeInteger|)) (|xlist| (|List| S)))
         (SEQ (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15)))
              (LETT |n| (LENGTH |xlist|))
              (LETT |bandM|
                    (MAKE_MATRIX1 (+ (+ |kl| |ku|) 1) |n|
                                  (|spadConstant| $ 17)))
              (SEQ (LETT |j| 1) (LETT #5# |n|) G190
                   (COND ((|greater_SI| |j| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bandM| (+ |ku| 1) |j|
                               (SPADCALL (SPADCALL |vf| |j| (QREFELT $ 23))
                                         (SPADCALL |xlist| |j| (QREFELT $ 20))
                                         (QREFELT $ 10))
                               (QREFELT $ 35))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |iw| (+ |ku| 2)) (LETT #4# (+ (+ |ku| |kl|) 1)) G190
                   (COND ((> |iw| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #3# (+ (+ (- |n| |iw|) |ku|) 1))
                          G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |bandM| |iw| |j|
                                      (SPADCALL
                                       (SPADCALL |vf|
                                                 (- (- (+ |j| |iw|) 1) |ku|)
                                                 (QREFELT $ 23))
                                       (SPADCALL |xlist| |j| (QREFELT $ 20))
                                       (QREFELT $ 10))
                                      (QREFELT $ 35))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |iw| (+ |iw| 1)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |iw| 1) (LETT #2# |ku|) G190
                   (COND ((|greater_SI| |iw| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (- (+ |ku| 2) |iw|)) (LETT #1# |n|) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |bandM| |iw| |j|
                                      (SPADCALL
                                       (SPADCALL |vf|
                                                 (- (- (+ |j| |iw|) 1) |ku|)
                                                 (QREFELT $ 23))
                                       (SPADCALL |xlist| |j| (QREFELT $ 20))
                                       (QREFELT $ 10))
                                      (QREFELT $ 35))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |iw| (|inc_SI| |iw|)) (GO G190) G191 (EXIT NIL))
              (EXIT |bandM|)))) 

(DECLAIM (NOTINLINE |MultiVariableCalculusFunctions;|)) 

(DEFUN |MultiVariableCalculusFunctions| (&REST #1=#:G440)
  (SPROG NIL
         (PROG (#2=#:G441)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultiVariableCalculusFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |MultiVariableCalculusFunctions;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|MultiVariableCalculusFunctions|)))))))))) 

(DEFUN |MultiVariableCalculusFunctions;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MultiVariableCalculusFunctions| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 38))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|MultiVariableCalculusFunctions|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MultiVariableCalculusFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . D) (|List| 7) (|Vector| 7)
              (6 . |vector|) (|List| 6) (11 . |parts|)
              |MCALCFN;gradient;FFLASV;2| (16 . |Zero|) (|Integer|)
              (20 . |elt|) (26 . |elt|) (32 . +) (38 . |maxIndex|) (43 . |elt|)
              |MCALCFN;divergence;FLAFFLASF;4| |MCALCFN;laplacian;FFLASF;5|
              (49 . D) (|List| 11) (|Matrix| 7) (55 . |matrix|)
              |MCALCFN;hessian;FFLASM;6| |MCALCFN;jacobian;FLAFFLASM;9|
              (60 . |One|) (|NonNegativeInteger|) (64 . D) (71 . |setelt!|)
              |MCALCFN;bandedHessian;FFLASNniM;8|
              |MCALCFN;bandedJacobian;FLAFFLAS2NniM;10|)
           '#(|laplacian| 79 |jacobian| 85 |hessian| 91 |gradient| 97
              |divergence| 103 |bandedJacobian| 109 |bandedHessian| 117)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|gradient| ((|Vector| |#2|) |#2| |#4|)) T)
                              '((|divergence| (|#2| |#3| |#4|)) T)
                              '((|laplacian| (|#2| |#2| |#4|)) T)
                              '((|hessian| ((|Matrix| |#2|) |#2| |#4|)) T)
                              '((|bandedHessian|
                                 ((|Matrix| |#2|) |#2| |#4|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|jacobian| ((|Matrix| |#2|) |#3| |#4|)) T)
                              '((|bandedJacobian|
                                 ((|Matrix| |#2|) |#3| |#4|
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 37
                                            '(2 7 0 0 6 10 1 12 0 11 13 1 9 14
                                              0 15 0 7 0 17 2 12 7 0 18 19 2 14
                                              6 0 18 20 2 7 0 0 0 21 1 8 18 0
                                              22 2 8 7 0 18 23 2 7 0 0 14 26 1
                                              28 0 27 29 0 7 0 32 3 7 0 0 6 33
                                              34 4 28 7 0 18 18 7 35 2 0 7 7 9
                                              25 2 0 28 8 9 31 2 0 28 7 9 30 2
                                              0 12 7 9 16 2 0 7 8 9 24 4 0 28 8
                                              9 33 33 37 3 0 28 7 9 33 36)))))
           '|lookupComplete|)) 
