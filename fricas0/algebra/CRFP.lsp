
(SDEFUN |CRFP;complexZeros;UPRL;1|
        ((|p| UP) (|eps| R) ($ |List| (|Complex| R)))
        (SPROG
         ((#1=#:G732 NIL) (|linfac| NIL) (#2=#:G731 NIL)
          (|facs| (|Factored| UP)) (|eps0| (R)))
         (SEQ
          (LETT |eps0|
                (SPADCALL |eps|
                          (SPADCALL (QREFELT $ 25)
                                    (SPADCALL |p| (QREFELT $ 29))
                                    (QREFELT $ 30))
                          (QREFELT $ 14))
                . #3=(|CRFP;complexZeros;UPRL;1|))
          (LETT |facs| (SPADCALL |p| |eps0| (QREFELT $ 32)) . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |linfac| NIL . #3#)
                 (LETT #1# (SPADCALL |facs| (QREFELT $ 35)) . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |linfac| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (SPADCALL (SPADCALL (QCAR |linfac|) 0 (QREFELT $ 37))
                                    (QREFELT $ 38))
                          #2#)
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |CRFP;complexZeros;UPL;2| ((|p| UP) ($ |List| (|Complex| R)))
        (SPADCALL |p| (QREFELT $ 15) (QREFELT $ 40))) 

(SDEFUN |CRFP;setErrorBound;2R;3| ((|r| R) ($ R))
        (SPROG ((|lof| (|List| (|OutputForm|))) (|rd| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 42) (QREFELT $ 45))
                  (|error| "setErrorBound: need error bound greater 0"))
                 ('T
                  (SEQ (SETELT $ 15 |r|)
                       (COND
                        ((|HasCategory| (QREFELT $ 6)
                                        (LIST '|QuotientFieldCategory|
                                              '(|Integer|)))
                         (SEQ
                          (LETT |rd|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 12) |r|
                                           (QREFELT $ 14))
                                 (QREFELT $ 46))
                                . #1=(|CRFP;setErrorBound;2R;3|))
                          (SETELT $ 9 (* (* |rd| |rd|) 10))
                          (LETT |lof|
                                (LIST "setErrorBound: internal digits set to"
                                      (SPADCALL (QREFELT $ 9) (QREFELT $ 47)))
                                . #1#)
                          (EXIT
                           (SPADCALL (SPADCALL |lof| (QREFELT $ 49))
                                     (QREFELT $ 51))))))
                       (SPADCALL "setErrorBound: internal error bound set to"
                                 (QREFELT $ 53))
                       (EXIT (QREFELT $ 15)))))))) 

(SDEFUN |CRFP;pleskenSplit;UPRBF;4|
        ((|poly| UP) (|eps| R) (|info| |Boolean|) ($ |Factored| UP))
        (SPROG
         ((|fp| (|Factored| UP)) (#1=#:G762 NIL) (|fac| NIL)
          (|notFoundSplit| (|Boolean|))
          (|split| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R)))
          (|splits|
           (|List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
          (|tp| (UP)) (|psR| (|Rep|)) (|sR| (|Rep|)) (|nm| (R)) (|st| (UP))
          (|p| (UP)) (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|sP| (|Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
          (|md| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p| (|CRFP;makeMonic| |poly| $)
                . #2=(|CRFP;pleskenSplit;UPRBF;4|))
          (COND
           ((NULL (ZEROP (LETT |md| (SPADCALL |p| (QREFELT $ 55)) . #2#)))
            (SEQ
             (LETT |fp|
                   (SPADCALL (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 57))
                             |md| (QREFELT $ 58))
                   . #2#)
             (EXIT
              (LETT |p|
                    (SPADCALL |p|
                              (SPADCALL (|spadConstant| $ 56) |md|
                                        (QREFELT $ 57))
                              (QREFELT $ 59))
                    . #2#)))))
          (LETT |sP| (SPADCALL |p| (QREFELT $ 61)) . #2#)
          (LETT |fp| (QCDR |sP|) . #2#)
          (COND
           ((NULL (SPADCALL |fp| (|spadConstant| $ 62) (QREFELT $ 63)))
            (SEQ
             (LETT |qr|
                   (SPADCALL |p|
                             (|CRFP;makeMonic| (SPADCALL |fp| (QREFELT $ 64))
                              $)
                             (QREFELT $ 66))
                   . #2#)
             (EXIT (LETT |p| (QCAR |qr|) . #2#)))))
          (LETT |st| (QCAR |sP|) . #2#)
          (EXIT
           (COND ((ZEROP (SPADCALL |st| (QREFELT $ 29))) |fp|)
                 ('T
                  (SEQ (SPADCALL |p| (QREFELT $ 67)) (LETT |nm| |eps| . #2#)
                       (LETT |sR| (SPADCALL |st| (QREFELT $ 68)) . #2#)
                       (LETT |psR|
                             (SPADCALL |sR| (SPADCALL |poly| (QREFELT $ 29))
                                       (QREFELT $ 69))
                             . #2#)
                       (LETT |notFoundSplit| 'T . #2#)
                       (SEQ G190 (COND ((NULL |notFoundSplit|) (GO G191)))
                            (SEQ
                             (LETT |psR|
                                   (SPADCALL
                                    (SPADCALL |psR| |psR| (QREFELT $ 70)) |sR|
                                    (QREFELT $ 70))
                                   . #2#)
                             (LETT |tp| (SPADCALL |psR| (QREFELT $ 71)) . #2#)
                             (EXIT
                              (COND
                               ((ZEROP (SPADCALL |tp| (QREFELT $ 29)))
                                (SEQ
                                 (COND
                                  (|info|
                                   (SPADCALL
                                    "we leave as we got constant factor"
                                    (QREFELT $ 51))))
                                 (EXIT (SPADCALL |poly| 1 (QREFELT $ 72)))))
                               ('T
                                (SEQ
                                 (LETT |splits|
                                       (SPADCALL |p| (|CRFP;makeMonic| |tp| $)
                                                 |info| (QREFELT $ 75))
                                       . #2#)
                                 (LETT |split|
                                       (SPADCALL
                                        (CONS (|function| |CRFP;min|) $)
                                        |splits| (QREFELT $ 77))
                                       . #2#)
                                 (EXIT
                                  (LETT |notFoundSplit|
                                        (SPADCALL |eps| (QCDR |split|)
                                                  (QREFELT $ 45))
                                        . #2#)))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (SEQ (LETT |fac| NIL . #2#)
                            (LETT #1# (QCAR |split|) . #2#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |fac| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |fp|
                                    (COND
                                     ((EQL (SPADCALL |fac| (QREFELT $ 29)) 1)
                                      (SPADCALL |fp|
                                                (SPADCALL |fac| 1
                                                          (QREFELT $ 72))
                                                (QREFELT $ 78)))
                                     ('T
                                      (SPADCALL |fp|
                                                (SPADCALL |fac| 1
                                                          (QREFELT $ 58))
                                                (QREFELT $ 78))))
                                    . #2#)))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |fp|)))))))) 

(SDEFUN |CRFP;startPolynomial;UPR;5|
        ((|p| UP)
         ($ |Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
        (SPROG
         ((|po| (|Integer|)) (|maxq| (R)) (#1=#:G790 NIL) (|qq| (R)) (|rd| (R))
          (|r1| (R)) (#2=#:G794 NIL) (|q| NIL) (|j| NIL)
          (|sP| (|Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
          (|fp| (|Factored| UP)) (|centerIsRoot| (|Boolean|)) (|pp| (UP))
          (|mD| (|NonNegativeInteger|)) (#3=#:G793 NIL) (|i| NIL)
          (|lp| (|List| UP)) (#4=#:G792 NIL) (|v| NIL) (#5=#:G791 NIL)
          (|listOfCenters| (|List| (|Complex| R))) (|startPoly| (UP))
          (|u| (|Complex| R)) (|eps| (R)))
         (SEQ
          (LETT |fp| (|spadConstant| $ 62) . #6=(|CRFP;startPolynomial;UPR;5|))
          (EXIT
           (COND
            ((EQL (SPADCALL |p| (QREFELT $ 29)) 1)
             (SEQ (LETT |p| (|CRFP;makeMonic| |p| $) . #6#)
                  (EXIT (CONS |p| (SPADCALL |p| 1 (QREFELT $ 58))))))
            (#7='T
             (SEQ
              (LETT |startPoly|
                    (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 57)) . #6#)
              (LETT |eps| (QREFELT $ 27) . #6#)
              (LETT |r1| (SPADCALL |p| |eps| (QREFELT $ 80)) . #6#)
              (LETT |rd|
                    (SPADCALL (|spadConstant| $ 12)
                              (SPADCALL (SPADCALL |p| (QREFELT $ 81)) |eps|
                                        (QREFELT $ 80))
                              (QREFELT $ 14))
                    . #6#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |r1| |rd| (QREFELT $ 14))
                           (SPADCALL (SPADCALL 3 (QREFELT $ 11))
                                     (SPADCALL 2 (QREFELT $ 11))
                                     (QREFELT $ 14))
                           (QREFELT $ 82))
                 (CONS |startPoly| |fp|))
                (#7#
                 (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 83)) . #6#)
                      (LETT |startPoly|
                            (SPADCALL |startPoly|
                                      (SPADCALL |u| 0 (QREFELT $ 57))
                                      (QREFELT $ 84))
                            . #6#)
                      (LETT |p|
                            (|CRFP;shift| |p| (SPADCALL |u| (QREFELT $ 38)) $)
                            . #6#)
                      (LETT |r1| (SPADCALL |p| |eps| (QREFELT $ 80)) . #6#)
                      (LETT |startPoly|
                            (SPADCALL |startPoly|
                                      (SPADCALL |r1| (QREFELT $ 85))
                                      (QREFELT $ 86))
                            . #6#)
                      (LETT |listOfCenters|
                            (LIST
                             (SPADCALL |r1| (|spadConstant| $ 42)
                                       (QREFELT $ 87))
                             (SPADCALL (|spadConstant| $ 42) |r1|
                                       (QREFELT $ 87))
                             (SPADCALL (SPADCALL |r1| (QREFELT $ 88))
                                       (|spadConstant| $ 42) (QREFELT $ 87))
                             (SPADCALL (|spadConstant| $ 42)
                                       (SPADCALL |r1| (QREFELT $ 88))
                                       (QREFELT $ 87)))
                            . #6#)
                      (LETT |lp|
                            (PROGN
                             (LETT #5# NIL . #6#)
                             (SEQ (LETT |v| NIL . #6#)
                                  (LETT #4# |listOfCenters| . #6#) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |v| (CAR #4#) . #6#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS (|CRFP;shift| |p| |v| $) #5#)
                                          . #6#)))
                                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                  (EXIT (NREVERSE #5#))))
                            . #6#)
                      (LETT |centerIsRoot| NIL . #6#)
                      (SEQ (LETT |i| 1 . #6#)
                           (LETT #3# (SPADCALL |lp| (QREFELT $ 90)) . #6#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (LETT |mD|
                                  (SPADCALL (SPADCALL |lp| |i| (QREFELT $ 91))
                                            (QREFELT $ 55))
                                  . #6#)
                            (EXIT
                             (COND
                              ((SPADCALL |mD| 0 (QREFELT $ 92))
                               (SEQ
                                (LETT |pp|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 56) 1
                                                 (QREFELT $ 57))
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |listOfCenters| |i|
                                                   (QREFELT $ 93))
                                         |u| (QREFELT $ 94))
                                        0 (QREFELT $ 57))
                                       (QREFELT $ 84))
                                      . #6#)
                                (LETT |centerIsRoot| 'T . #6#)
                                (EXIT
                                 (LETT |fp|
                                       (SPADCALL |fp|
                                                 (SPADCALL |pp| |mD|
                                                           (QREFELT $ 58))
                                                 (QREFELT $ 78))
                                       . #6#)))))))
                           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        (|centerIsRoot|
                         (SEQ
                          (LETT |p|
                                (SPADCALL (|CRFP;shift| |p| |u| $)
                                          (SPADCALL |fp| (QREFELT $ 64))
                                          (QREFELT $ 59))
                                . #6#)
                          (EXIT
                           (COND
                            ((ZEROP (SPADCALL |p| (QREFELT $ 29)))
                             (CONS |p| |fp|))
                            (#7#
                             (SEQ
                              (LETT |sP| (SPADCALL |p| (QREFELT $ 61)) . #6#)
                              (EXIT (CONS (QCAR |sP|) |fp|))))))))
                        (#7#
                         (SEQ (LETT |po| 1 . #6#)
                              (LETT |maxq| (|spadConstant| $ 12) . #6#)
                              (SEQ
                               (EXIT
                                (SEQ (LETT |j| 1 . #6#) (LETT |q| NIL . #6#)
                                     (LETT #2# |lp| . #6#) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |q| (CAR #2#) . #6#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |r1|
                                            (SPADCALL |q| |eps| (QREFELT $ 80))
                                            . #6#)
                                      (LETT |rd|
                                            (SPADCALL (|spadConstant| $ 12)
                                                      (SPADCALL
                                                       (SPADCALL |q|
                                                                 (QREFELT $
                                                                          81))
                                                       |eps| (QREFELT $ 80))
                                                      (QREFELT $ 14))
                                            . #6#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL
                                          (LETT |qq|
                                                (SPADCALL |r1| |rd|
                                                          (QREFELT $ 14))
                                                . #6#)
                                          (SPADCALL (SPADCALL 3 (QREFELT $ 11))
                                                    (SPADCALL 2 (QREFELT $ 11))
                                                    (QREFELT $ 14))
                                          (QREFELT $ 82))
                                         (SEQ (LETT |po| |j| . #6#)
                                              (EXIT
                                               (PROGN
                                                (LETT #1# |$NoValue| . #6#)
                                                (GO #8=#:G784)))))
                                        ('T
                                         (SEQ
                                          (COND
                                           ((EQL |j| 1)
                                            (LETT |maxq| |qq| . #6#)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |qq| |maxq|
                                                       (QREFELT $ 82))
                                             (SEQ (LETT |maxq| |qq| . #6#)
                                                  (EXIT
                                                   (LETT |po| |j|
                                                         . #6#)))))))))))
                                     (LETT #2#
                                           (PROG1 (CDR #2#)
                                             (LETT |j| (|inc_SI| |j|) . #6#))
                                           . #6#)
                                     (GO G190) G191 (EXIT NIL)))
                               #8# (EXIT #1#))
                              (EXIT
                               (CONS
                                (SPADCALL |startPoly|
                                          (SPADCALL
                                           (SPADCALL |listOfCenters| |po|
                                                     (QREFELT $ 93))
                                           0 (QREFELT $ 57))
                                          (QREFELT $ 84))
                                |fp|))))))))))))))))) 

(SDEFUN |CRFP;norm;UPR;6| ((|p| UP) ($ R))
        (SPROG ((|nm| (R)) (#1=#:G798 NIL) (|c| NIL))
               (SEQ (LETT |nm| (|spadConstant| $ 42) . #2=(|CRFP;norm;UPR;6|))
                    (SEQ (LETT |c| NIL . #2#)
                         (LETT #1# (SPADCALL |p| (QREFELT $ 95)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |nm|
                                 (SPADCALL |nm| (|CRFP;absC| |c| $)
                                           (QREFELT $ 96))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |nm|)))) 

(SDEFUN |CRFP;pleskenSplit;UPRF;7| ((|poly| UP) (|eps| R) ($ |Factored| UP))
        (SPADCALL |poly| |eps| NIL (QREFELT $ 79))) 

(SDEFUN |CRFP;graeffe;2UP;8| ((|p| UP) ($ UP))
        (SPROG
         ((|aBack| #1=(|List| (|Complex| R))) (|gp| (UP)) (#2=#:G803 NIL)
          (|const| (|Integer|)) (|aBackCopy| #1#)
          (|aForthCopy| (|List| (|Complex| R))) (|sum| (|Complex| R))
          (#3=#:G810 NIL) (|aminus| NIL) (#4=#:G811 NIL) (|aplus| NIL)
          (|aForth| (|List| (|Complex| R))) (|ak| (|Complex| R))
          (#5=#:G809 NIL) (|k| NIL) (#6=#:G808 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |p| (QREFELT $ 29)) . #7=(|CRFP;graeffe;2UP;8|))
          (LETT |aForth| NIL . #7#)
          (SEQ (LETT |k| 0 . #7#) (LETT #6# |n| . #7#) G190
               (COND ((|greater_SI| |k| #6#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |aForth|
                       (CONS (SPADCALL |p| |k| (QREFELT $ 37)) |aForth|)
                       . #7#)))
               (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |aBack| NIL . #7#) (LETT |gp| (|spadConstant| $ 43) . #7#)
          (SEQ (LETT |k| 0 . #7#) (LETT #5# |n| . #7#) G190
               (COND ((|greater_SI| |k| #5#) (GO G191)))
               (SEQ (LETT |ak| (|SPADfirst| |aForth|) . #7#)
                    (LETT |aForth| (CDR |aForth|) . #7#)
                    (LETT |aForthCopy| |aForth| . #7#)
                    (LETT |aBackCopy| |aBack| . #7#)
                    (LETT |sum| (|spadConstant| $ 99) . #7#)
                    (LETT |const| -1 . #7#)
                    (SEQ (LETT |aplus| NIL . #7#) (LETT #4# |aForth| . #7#)
                         (LETT |aminus| NIL . #7#) (LETT #3# |aBack| . #7#)
                         G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |aminus| (CAR #3#) . #7#) NIL)
                               (ATOM #4#)
                               (PROGN (LETT |aplus| (CAR #4#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |sum|
                                (SPADCALL |sum|
                                          (SPADCALL
                                           (SPADCALL |const| |aminus|
                                                     (QREFELT $ 100))
                                           |aplus| (QREFELT $ 101))
                                          (QREFELT $ 102))
                                . #7#)
                          (LETT |aForthCopy| (CDR |aForthCopy|) . #7#)
                          (LETT |aBackCopy| (CDR |aBackCopy|) . #7#)
                          (EXIT (LETT |const| (- |const|) . #7#)))
                         (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #7#))
                               . #7#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |gp|
                          (SPADCALL |gp|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |ak| |ak| (QREFELT $ 101))
                                      (SPADCALL 2 |sum| (QREFELT $ 103))
                                      (QREFELT $ 102))
                                     (PROG1 (LETT #2# (- |n| |k|) . #7#)
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT $ 57))
                                    (QREFELT $ 104))
                          . #7#)
                    (EXIT (LETT |aBack| (CONS |ak| |aBack|) . #7#)))
               (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |CRFP;rootRadius;UP2R;9| ((|p| UP) (|errorQuotient| R) ($ R))
        (SPROG
         ((|pp| (UP)) (|rR| (R)) (|expo| (|NonNegativeInteger|)) (|rho| (R))
          (|currentError| (R)) (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL |errorQuotient| (|spadConstant| $ 12) (QREFELT $ 45))
            (|error| "rootRadius: second Parameter must be greater than 1"))
           ('T
            (SEQ (LETT |pp| |p| . #1=(|CRFP;rootRadius;UP2R;9|))
                 (LETT |rho|
                       (|CRFP;calculateScale| (|CRFP;makeMonic| |pp| $) $)
                       . #1#)
                 (LETT |rR| |rho| . #1#)
                 (LETT |pp|
                       (|CRFP;makeMonic|
                        (|CRFP;scale| |pp|
                         (SPADCALL |rho| (|spadConstant| $ 42) (QREFELT $ 87))
                         $)
                        $)
                       . #1#)
                 (LETT |expo| 1 . #1#)
                 (LETT |d| (SPADCALL |p| (QREFELT $ 29)) . #1#)
                 (LETT |currentError|
                       (|CRFP;nthRoot| (SPADCALL 2 (QREFELT $ 11)) 2 $) . #1#)
                 (LETT |currentError|
                       (SPADCALL (* |d| 20) |currentError| (QREFELT $ 106))
                       . #1#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |currentError| |errorQuotient|
                                   (QREFELT $ 107)))
                        (GO G191)))
                      (SEQ (LETT |pp| (SPADCALL |pp| (QREFELT $ 105)) . #1#)
                           (LETT |rho| (|CRFP;calculateScale| |pp| $) . #1#)
                           (LETT |expo| (SPADCALL 2 |expo| (QREFELT $ 108))
                                 . #1#)
                           (LETT |errorQuotient|
                                 (SPADCALL |errorQuotient| |errorQuotient|
                                           (QREFELT $ 109))
                                 . #1#)
                           (LETT |rR|
                                 (SPADCALL (|CRFP;nthRoot| |rho| |expo| $) |rR|
                                           (QREFELT $ 109))
                                 . #1#)
                           (EXIT
                            (LETT |pp|
                                  (|CRFP;makeMonic|
                                   (|CRFP;scale| |pp|
                                    (SPADCALL |rho| (|spadConstant| $ 42)
                                              (QREFELT $ 87))
                                    $)
                                   $)
                                  . #1#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rR|))))))) 

(SDEFUN |CRFP;rootRadius;UPR;10| ((|p| UP) ($ R))
        (SPADCALL |p|
                  (SPADCALL (|spadConstant| $ 12) (QREFELT $ 15)
                            (QREFELT $ 96))
                  (QREFELT $ 80))) 

(SDEFUN |CRFP;schwerpunkt;UPC;11| ((|p| UP) ($ |Complex| R))
        (SPROG
         ((|denom| (|Union| (|Complex| R) "failed")) (|nC| #1=(|Complex| R))
          (|lC| #1#) (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 111)) (|spadConstant| $ 99))
                ((ZEROP
                  (LETT |d| (SPADCALL |p| (QREFELT $ 29))
                        . #2=(|CRFP;schwerpunkt;UPC;11|)))
                 (|error|
                  "schwerpunkt: non-zero const. polynomial has no roots and no schwerpunkt"))
                (#3='T
                 (SEQ (LETT |lC| (SPADCALL |p| |d| (QREFELT $ 37)) . #2#)
                      (LETT |nC| (SPADCALL |p| (- |d| 1) (QREFELT $ 37)) . #2#)
                      (LETT |denom|
                            (SPADCALL
                             (SPADCALL (SPADCALL |d| (QREFELT $ 112)) |lC|
                                       (QREFELT $ 101))
                             (QREFELT $ 114))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |denom| 1)
                         (|error|
                          "schwerpunkt:          degree * leadingCoefficient not invertible in ring of coefficients"))
                        (#3#
                         (SPADCALL
                          (SPADCALL |nC| (QCDR |denom|) (QREFELT $ 101))
                          (QREFELT $ 38))))))))))) 

(SDEFUN |CRFP;reciprocalPolynomial;2UP;12| ((|p| UP) ($ UP))
        (SPROG
         ((|sol| (UP)) (|lm| (|List| UP)) (#1=#:G825 NIL) (#2=#:G833 NIL)
          (|i| NIL) (#3=#:G832 NIL) (|md| (|NonNegativeInteger|))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 111)) (|spadConstant| $ 43))
                ('T
                 (SEQ
                  (LETT |d| (SPADCALL |p| (QREFELT $ 29))
                        . #4=(|CRFP;reciprocalPolynomial;2UP;12|))
                  (LETT |md| (+ |d| (SPADCALL |p| (QREFELT $ 55))) . #4#)
                  (LETT |lm|
                        (PROGN
                         (LETT #3# NIL . #4#)
                         (SEQ (LETT |i| 0 . #4#) (LETT #2# |d| . #4#) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |p| |i| (QREFELT $ 37))
                                        (PROG1 (LETT #1# (- |md| |i|) . #4#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 57))
                                       #3#)
                                      . #4#)))
                              (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT
                   (LETT |sol| (SPADCALL (ELT $ 104) |lm| (QREFELT $ 116))
                         . #4#)))))))) 

(SDEFUN |CRFP;divisorCascade;2UPBL;13|
        ((|p| UP) (|tp| UP) (|info| |Boolean|)
         ($ |List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
        (SPROG
         ((|lof| (|List| (|OutputForm|)))
          (|lfae|
           (|List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
          (|listOfFactors| (|List| UP)) (|nm| (R)) (|factor2| (UP))
          (|factor1| (UP))
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (#1=#:G842 NIL) (|i| NIL))
         (SEQ (LETT |lfae| NIL . #2=(|CRFP;divisorCascade;2UPBL;13|))
              (SEQ (LETT |i| 1 . #2#)
                   (LETT #1# (SPADCALL |tp| (QREFELT $ 29)) . #2#) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#)
                         (NULL
                          (SPADCALL (SPADCALL |tp| (QREFELT $ 29)) 0
                                    (QREFELT $ 92))))
                     (GO G191)))
                   (SEQ (LETT |qr| (SPADCALL |p| |tp| (QREFELT $ 66)) . #2#)
                        (LETT |factor1| |tp| . #2#)
                        (LETT |factor2| (|CRFP;makeMonic| (QCAR |qr|) $) . #2#)
                        (LETT |tp| (QCDR |qr|) . #2#)
                        (LETT |nm| (SPADCALL |tp| (QREFELT $ 97)) . #2#)
                        (LETT |listOfFactors| (CONS |factor2| NIL) . #2#)
                        (LETT |listOfFactors| (CONS |factor1| |listOfFactors|)
                              . #2#)
                        (LETT |lfae| (CONS (CONS |listOfFactors| |nm|) |lfae|)
                              . #2#)
                        (EXIT
                         (COND
                          (|info|
                           (SEQ (SPADCALL (QREFELT $ 16) (QREFELT $ 51))
                                (LETT |lof|
                                      (LIST "error polynomial has degree "
                                            (SPADCALL
                                             (SPADCALL |tp| (QREFELT $ 29))
                                             (QREFELT $ 117))
                                            " and norm "
                                            (SPADCALL |nm| (QREFELT $ 118)))
                                      . #2#)
                                (SPADCALL
                                 (SPADCALL (SPADCALL |lof| (QREFELT $ 49))
                                           (QREFELT $ 18))
                                 (QREFELT $ 51))
                                (LETT |lof|
                                      (LIST "degrees of factors:"
                                            (SPADCALL
                                             (SPADCALL |factor1|
                                                       (QREFELT $ 29))
                                             (QREFELT $ 117))
                                            "  "
                                            (SPADCALL
                                             (SPADCALL |factor2|
                                                       (QREFELT $ 29))
                                             (QREFELT $ 117)))
                                      . #2#)
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |lof| (QREFELT $ 49))
                                            (QREFELT $ 18))
                                  (QREFELT $ 51))))))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (COND (|info| (SPADCALL (QREFELT $ 16) (QREFELT $ 51))))
              (EXIT (REVERSE |lfae|))))) 

(SDEFUN |CRFP;divisorCascade;2UPL;14|
        ((|p| UP) (|tp| UP)
         ($ |List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
        (SPADCALL |p| |tp| NIL (QREFELT $ 75))) 

(SDEFUN |CRFP;factor;UPRF;15| ((|poly| UP) (|eps| R) ($ |Factored| UP))
        (SPADCALL |poly| |eps| NIL (QREFELT $ 120))) 

(SDEFUN |CRFP;factor;UPF;16| ((|p| UP) ($ |Factored| UP))
        (SPADCALL |p| (QREFELT $ 15) (QREFELT $ 32))) 

(SDEFUN |CRFP;factor;UPRBF;17|
        ((|poly| UP) (|eps| R) (|info| |Boolean|) ($ |Factored| UP))
        (SPROG
         ((|listOfFactors|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|result| (|Factored| UP)) (|expOfFactor| (|Integer|))
          (|newFactor| (UP)) (#1=#:G858 NIL) (|rec| NIL)
          (|lof| (|List| (|OutputForm|))) (|split| (|Factored| UP))
          (|exponentOfp| (|Integer|)) (|p| (UP)) (|eps0| (R))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |result|
                (SPADCALL
                 (SPADCALL (SPADCALL |poly| (QREFELT $ 122)) 0 (QREFELT $ 57))
                 (QREFELT $ 123))
                . #2=(|CRFP;factor;UPRBF;17|))
          (LETT |d| (SPADCALL |poly| (QREFELT $ 29)) . #2#)
          (LETT |eps0|
                (SPADCALL |eps|
                          (SPADCALL (QREFELT $ 25) (QREFELT $ 25)
                                    (QREFELT $ 109))
                          (QREFELT $ 14))
                . #2#)
          (EXIT
           (COND ((EQL |d| 1) (SPADCALL |poly| 1 (QREFELT $ 58)))
                 ('T
                  (SEQ
                   (LETT |listOfFactors|
                         (SPADCALL (CONS (|CRFP;makeMonic| |poly| $) 1)
                                   (QREFELT $ 124))
                         . #2#)
                   (COND
                    (|info|
                     (SEQ
                      (LETT |lof|
                            (LIST (QREFELT $ 19) (QREFELT $ 20)
                                  "list of Factors:" (QREFELT $ 20)
                                  (SPADCALL |listOfFactors| (QREFELT $ 125))
                                  (QREFELT $ 19) "list of Linear Factors:"
                                  (QREFELT $ 20)
                                  (SPADCALL |result| (QREFELT $ 126))
                                  (QREFELT $ 20) (QREFELT $ 19))
                            . #2#)
                      (EXIT
                       (SPADCALL (SPADCALL |lof| (QREFELT $ 127))
                                 (QREFELT $ 51))))))
                   (SEQ G190 (COND ((NULL |listOfFactors|) (GO G191)))
                        (SEQ
                         (LETT |p| (QCAR (|SPADfirst| |listOfFactors|)) . #2#)
                         (LETT |exponentOfp|
                               (QCDR (|SPADfirst| |listOfFactors|)) . #2#)
                         (LETT |listOfFactors| (CDR |listOfFactors|) . #2#)
                         (COND
                          (|info|
                           (SEQ
                            (LETT |lof|
                                  (LIST
                                   "just now we try to split the polynomial:"
                                   (SPADCALL |p| (QREFELT $ 128)))
                                  . #2#)
                            (EXIT
                             (SPADCALL (SPADCALL |lof| (QREFELT $ 127))
                                       (QREFELT $ 51))))))
                         (LETT |split|
                               (SPADCALL |p| |eps0| |info| (QREFELT $ 79))
                               . #2#)
                         (EXIT
                          (COND
                           ((EQL (SPADCALL |split| (QREFELT $ 129)) 1)
                            (SEQ
                             (LETT |lof|
                                   (LIST "factor: couldn't split factor"
                                         (SPADCALL
                                          (SPADCALL |p| (QREFELT $ 128))
                                          (QREFELT $ 18))
                                         "with required error bound")
                                   . #2#)
                             (SPADCALL (SPADCALL |lof| (QREFELT $ 127))
                                       (QREFELT $ 51))
                             (EXIT
                              (LETT |result|
                                    (SPADCALL |result|
                                              (SPADCALL |p| |exponentOfp|
                                                        (QREFELT $ 72))
                                              (QREFELT $ 78))
                                    . #2#))))
                           ('T
                            (SEQ (LETT |rec| NIL . #2#)
                                 (LETT #1# (SPADCALL |split| (QREFELT $ 35))
                                       . #2#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN
                                        (LETT |rec| (CAR #1#) . #2#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ (LETT |newFactor| (QCAR |rec|) . #2#)
                                      (LETT |expOfFactor|
                                            (* |exponentOfp| (QCDR |rec|))
                                            . #2#)
                                      (EXIT
                                       (COND
                                        ((EQL
                                          (SPADCALL |newFactor| (QREFELT $ 29))
                                          1)
                                         (LETT |result|
                                               (SPADCALL |result|
                                                         (SPADCALL |newFactor|
                                                                   |expOfFactor|
                                                                   (QREFELT $
                                                                            72))
                                                         (QREFELT $ 78))
                                               . #2#))
                                        ('T
                                         (LETT |listOfFactors|
                                               (CONS
                                                (CONS |newFactor|
                                                      |expOfFactor|)
                                                |listOfFactors|)
                                               . #2#)))))
                                 (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                 (EXIT NIL))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |result|)))))))) 

(SDEFUN |CRFP;absC| ((|c| |Complex| R) ($ R))
        (|CRFP;nthRoot| (SPADCALL |c| (QREFELT $ 130)) 2 $)) 

(SDEFUN |CRFP;absR| ((|r| R) ($ R))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 42) (QREFELT $ 131))
          (SPADCALL |r| (QREFELT $ 88)))
         ('T |r|))) 

(SDEFUN |CRFP;min|
        ((|fae1| |Record| (|:| |factors| (|List| UP)) (|:| |error| R))
         (|fae2| |Record| (|:| |factors| (|List| UP)) (|:| |error| R))
         ($ |Record| (|:| |factors| (|List| UP)) (|:| |error| R)))
        (COND ((SPADCALL (QCDR |fae2|) (QCDR |fae1|) (QREFELT $ 131)) |fae2|)
              ('T |fae1|))) 

(SDEFUN |CRFP;calculateScale| ((|p| UP) ($ R))
        (SPROG
         ((|rho| (R)) (|maxi| (R)) (|locmax| (R)) (|ic| (R)) (|rc| (R))
          (|cof| (|Complex| R)) (|j| (|NonNegativeInteger|)) (#1=#:G873 NIL)
          (|mon| NIL) (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |d| (SPADCALL |p| (QREFELT $ 29)) . #2=(|CRFP;calculateScale|))
          (LETT |maxi| (|spadConstant| $ 42) . #2#)
          (SEQ (LETT |mon| NIL . #2#)
               (LETT #1# (CDR (SPADCALL |p| (QREFELT $ 132))) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |mon| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |j| (- |d| (SPADCALL |mon| (QREFELT $ 29))) . #2#)
                    (LETT |cof| (SPADCALL |mon| (QREFELT $ 122)) . #2#)
                    (LETT |rc| (|CRFP;absR| (SPADCALL |cof| (QREFELT $ 133)) $)
                          . #2#)
                    (LETT |ic| (|CRFP;absR| (SPADCALL |cof| (QREFELT $ 134)) $)
                          . #2#)
                    (LETT |locmax| (SPADCALL |rc| |ic| (QREFELT $ 135)) . #2#)
                    (EXIT
                     (LETT |maxi|
                           (SPADCALL
                            (|CRFP;nthRoot|
                             (SPADCALL |locmax|
                                       (SPADCALL
                                        (SPADCALL |d| |j| (QREFELT $ 137))
                                        (QREFELT $ 11))
                                       (QREFELT $ 14))
                             |j| $)
                            |maxi| (QREFELT $ 135))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |maxi| (|spadConstant| $ 42) (QREFELT $ 138))
             (|error| "Internal Error: scale cannot be 0"))
            (#3='T
             (SEQ (LETT |rho| (QREFELT $ 21) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |rho| |maxi| (QREFELT $ 131))
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |rho| |maxi| (QREFELT $ 131)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |rho|
                                   (SPADCALL (QREFELT $ 25) |rho|
                                             (QREFELT $ 109))
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL |rho| (QREFELT $ 25) (QREFELT $ 14)))))
                    (#3#
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |maxi| |rho| (QREFELT $ 131)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |rho|
                                   (SPADCALL |rho| (QREFELT $ 25)
                                             (QREFELT $ 14))
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |rho| (|spadConstant| $ 42) (QREFELT $ 138))
                         (QREFELT $ 21))
                        (#3# |rho|)))))))))))))) 

(SDEFUN |CRFP;makeMonic| ((|p| UP) ($ UP))
        (COND ((SPADCALL |p| (|spadConstant| $ 43) (QREFELT $ 139)) |p|)
              ('T
               (SPADCALL
                (SPADCALL (|spadConstant| $ 56) (SPADCALL |p| (QREFELT $ 29))
                          (QREFELT $ 57))
                (SPADCALL (SPADCALL |p| (QREFELT $ 140))
                          (SPADCALL |p| (QREFELT $ 122)) (QREFELT $ 86))
                (QREFELT $ 104))))) 

(SDEFUN |CRFP;scale| ((|p| UP) (|c| |Complex| R) ($ UP))
        (SPROG ((|eq| (|Equation| UP)))
               (SEQ
                (LETT |eq|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 57))
                       (SPADCALL |c| 1 (QREFELT $ 57)) (QREFELT $ 142))
                      |CRFP;scale|)
                (EXIT (SPADCALL |p| |eq| (QREFELT $ 144)))))) 

(SDEFUN |CRFP;shift| ((|p| UP) (|c| |Complex| R) ($ UP))
        (SPROG ((|eq| (|Equation| UP)) (|rhs| (UP)))
               (SEQ
                (LETT |rhs|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 57))
                       (SPADCALL |c| 0 (QREFELT $ 57)) (QREFELT $ 104))
                      . #1=(|CRFP;shift|))
                (LETT |eq|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 57)) |rhs|
                       (QREFELT $ 142))
                      . #1#)
                (EXIT (SPADCALL |p| |eq| (QREFELT $ 144)))))) 

(SDEFUN |CRFP;nthRoot| ((|r| R) (|n| |NonNegativeInteger|) ($ R))
        (SPROG ((|num| #1=(|Integer|)) (|den| #1#))
               (SEQ
                (COND
                 ((|HasCategory| (QREFELT $ 6) '(|RealNumberSystem|))
                  (SPADCALL |r| (SPADCALL 1 |n| (QREFELT $ 146))
                            (QREFELT $ 147)))
                 ((|HasCategory| (QREFELT $ 6)
                                 (LIST '|QuotientFieldCategory| '(|Integer|)))
                  (SEQ
                   (LETT |den|
                         (SPADCALL
                          (* (QREFELT $ 9) (SPADCALL |r| (QREFELT $ 148))) |n|
                          (QREFELT $ 150))
                         . #2=(|CRFP;nthRoot|))
                   (LETT |num|
                         (SPADCALL
                          (* (QREFELT $ 9) (SPADCALL |r| (QREFELT $ 151))) |n|
                          (QREFELT $ 150))
                         . #2#)
                   (EXIT (SPADCALL |num| |den| (QREFELT $ 152)))))
                 ('T (|error| "unimplemented")))))) 

(DECLAIM (NOTINLINE |ComplexRootFindingPackage;|)) 

(DEFUN |ComplexRootFindingPackage| (&REST #1=#:G881)
  (SPROG NIL
         (PROG (#2=#:G882)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ComplexRootFindingPackage|)
                                               '|domainEqualList|)
                    . #3=(|ComplexRootFindingPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ComplexRootFindingPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ComplexRootFindingPackage|)))))))))) 

(DEFUN |ComplexRootFindingPackage;| (|#1| |#2|)
  (SPROG ((|a| NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (SEQ
          (PROGN
           (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexRootFindingPackage|))
           (LETT DV$2 (|devaluate| |#2|) . #1#)
           (LETT |dv$| (LIST '|ComplexRootFindingPackage| DV$1 DV$2) . #1#)
           (LETT $ (GETREFV 153) . #1#)
           (QSETREFV $ 0 |dv$|)
           (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
           (|haddProp| |$ConstructorCache| '|ComplexRootFindingPackage|
                       (LIST DV$1 DV$2) (CONS 1 $))
           (|stuffDomainSlots| $)
           (QSETREFV $ 6 |#1|)
           (QSETREFV $ 7 |#2|)
           (SETF |pv$| (QREFELT $ 3))
           (QSETREFV $ 8 (|ModMonic| (|Complex| |#1|) |#2|))
           (QSETREFV $ 9 (EXPT 10 7))
           (QSETREFV $ 15
                     (SEQ (LETT |a| (SPADCALL 1000 (QREFELT $ 11)) . #1#)
                          (EXIT
                           (SPADCALL (|spadConstant| $ 12) |a|
                                     (QREFELT $ 14)))))
           (QSETREFV $ 16 "  ")
           (QSETREFV $ 19
                     (SPADCALL
                      "---------------------------------------------------"
                      (QREFELT $ 18)))
           (QSETREFV $ 20
                     (SPADCALL
                      "..................................................."
                      (QREFELT $ 18)))
           (QSETREFV $ 21 (|spadConstant| $ 12))
           (QSETREFV $ 24 (SPADCALL 2 (QREFELT $ 21) (QREFELT $ 23)))
           (QSETREFV $ 25 (SPADCALL 10 (QREFELT $ 21) (QREFELT $ 23)))
           (QSETREFV $ 26 (SPADCALL 11 (QREFELT $ 21) (QREFELT $ 23)))
           (QSETREFV $ 27
                     (SPADCALL (QREFELT $ 26) (QREFELT $ 25) (QREFELT $ 14)))
           $)))) 

(MAKEPROP '|ComplexRootFindingPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              '|globalDigits| (|Integer|) (0 . |coerce|) (5 . |One|)
              (9 . |One|) (13 . /) '|globalEps| '|emptyLine| (|OutputForm|)
              (19 . |center|) '|dashes| '|dots| '|one| (|PositiveInteger|)
              (24 . *) '|two| '|ten| '|eleven| '|weakEps|
              (|NonNegativeInteger|) (30 . |degree|) (35 . ^) (|Factored| 7)
              |CRFP;factor;UPRF;15|
              (|Record| (|:| |factor| 7) (|:| |exponent| 10)) (|List| 33)
              (41 . |factors|) (|Complex| 6) (46 . |coefficient|) (52 . -)
              (|List| 36) |CRFP;complexZeros;UPRL;1| |CRFP;complexZeros;UPL;2|
              (57 . |Zero|) (61 . |Zero|) (|Boolean|) (65 . <=)
              (71 . |ceiling|) (76 . |coerce|) (|List| $) (81 . |hconcat|)
              (|Void|) (86 . |print|) (|String|) (91 . |messagePrint|)
              |CRFP;setErrorBound;2R;3| (96 . |minimumDegree|) (101 . |One|)
              (105 . |monomial|) (111 . |irreducibleFactor|) (117 . |quo|)
              (|Record| (|:| |start| 7) (|:| |factors| 31))
              |CRFP;startPolynomial;UPR;5| (123 . |One|) (127 . =)
              (133 . |expand|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (138 . |divide|) (144 . |setPoly|) (149 . |coerce|) (154 . ^)
              (160 . *) (166 . |lift|) (171 . |nilFactor|)
              (|Record| (|:| |factors| 89) (|:| |error| 6)) (|List| 73)
              |CRFP;divisorCascade;2UPBL;13| (|Mapping| 73 73 73)
              (177 . |reduce|) (183 . *) |CRFP;pleskenSplit;UPRBF;4|
              |CRFP;rootRadius;UP2R;9| |CRFP;reciprocalPolynomial;2UP;12|
              (189 . >) |CRFP;schwerpunkt;UPC;11| (195 . -) (201 . |coerce|)
              (206 . /) (212 . |complex|) (218 . -) (|List| 7)
              (223 . |maxIndex|) (228 . |elt|) (234 . >) (240 . |elt|)
              (246 . -) (252 . |coefficients|) (257 . +) |CRFP;norm;UPR;6|
              |CRFP;pleskenSplit;UPRF;7| (263 . |Zero|) (267 . *) (273 . *)
              (279 . +) (285 . *) (291 . +) |CRFP;graeffe;2UP;8| (297 . *)
              (303 . >=) (309 . *) (315 . *) |CRFP;rootRadius;UPR;10|
              (321 . |zero?|) (326 . |coerce|) (|Union| $ '"failed")
              (331 . |recip|) (|Mapping| 7 7 7) (336 . |reduce|)
              (342 . |coerce|) (347 . |coerce|) |CRFP;divisorCascade;2UPL;14|
              |CRFP;factor;UPRBF;17| |CRFP;factor;UPF;16|
              (352 . |leadingCoefficient|) (357 . |coerce|) (362 . |list|)
              (367 . |coerce|) (372 . |coerce|) (377 . |vconcat|)
              (382 . |coerce|) (387 . |numberOfFactors|) (392 . |norm|)
              (397 . <) (403 . |monomials|) (408 . |real|) (413 . |imag|)
              (418 . |max|) (|IntegerCombinatoricFunctions| 10)
              (424 . |binomial|) (430 . =) (436 . =) (442 . |reductum|)
              (|Equation| 7) (447 . |equation|) (|Equation| $) (453 . |eval|)
              (|Fraction| 10) (459 . /) (465 . ^) (471 . |denom|)
              (|IntegerRoots| 10) (476 . |approxNthRoot|) (482 . |numer|)
              (487 . /))
           '#(|startPolynomial| 493 |setErrorBound| 498 |schwerpunkt| 503
              |rootRadius| 508 |reciprocalPolynomial| 519 |pleskenSplit| 524
              |norm| 537 |graeffe| 542 |factor| 547 |divisorCascade| 565
              |complexZeros| 578)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 152
                                                 '(1 6 0 10 11 0 6 0 12 0 7 0
                                                   13 2 6 0 0 0 14 1 17 0 0 18
                                                   2 6 0 22 0 23 1 7 28 0 29 2
                                                   6 0 0 28 30 1 31 34 0 35 2 7
                                                   36 0 28 37 1 36 0 0 38 0 6 0
                                                   42 0 7 0 43 2 6 44 0 0 45 1
                                                   6 10 0 46 1 10 17 0 47 1 17
                                                   0 48 49 1 17 50 0 51 1 17 50
                                                   52 53 1 7 28 0 55 0 36 0 56
                                                   2 7 0 36 28 57 2 31 0 7 10
                                                   58 2 7 0 0 0 59 0 31 0 62 2
                                                   31 44 0 0 63 1 31 7 0 64 2 7
                                                   65 0 0 66 1 8 7 7 67 1 8 0 7
                                                   68 2 8 0 0 28 69 2 8 0 0 0
                                                   70 1 8 7 0 71 2 31 0 7 10 72
                                                   2 74 73 76 0 77 2 31 0 0 0
                                                   78 2 6 44 0 0 82 2 7 0 0 0
                                                   84 1 36 0 6 85 2 7 0 0 36 86
                                                   2 36 0 6 6 87 1 6 0 0 88 1
                                                   89 10 0 90 2 89 7 0 10 91 2
                                                   28 44 0 0 92 2 39 36 0 10 93
                                                   2 36 0 0 0 94 1 7 39 0 95 2
                                                   6 0 0 0 96 0 36 0 99 2 36 0
                                                   10 0 100 2 36 0 0 0 101 2 36
                                                   0 0 0 102 2 36 0 22 0 103 2
                                                   7 0 0 0 104 2 6 0 28 0 106 2
                                                   6 44 0 0 107 2 28 0 22 0 108
                                                   2 6 0 0 0 109 1 7 44 0 111 1
                                                   36 0 10 112 1 36 113 0 114 2
                                                   89 7 115 0 116 1 28 17 0 117
                                                   1 6 17 0 118 1 7 36 0 122 1
                                                   31 0 7 123 1 34 0 33 124 1
                                                   34 17 0 125 1 31 17 0 126 1
                                                   17 0 48 127 1 7 17 0 128 1
                                                   31 28 0 129 1 36 6 0 130 2 6
                                                   44 0 0 131 1 7 48 0 132 1 36
                                                   6 0 133 1 36 6 0 134 2 6 0 0
                                                   0 135 2 136 10 10 10 137 2 6
                                                   44 0 0 138 2 7 44 0 0 139 1
                                                   7 0 0 140 2 141 0 7 7 142 2
                                                   7 0 0 143 144 2 145 0 10 10
                                                   146 2 6 0 0 145 147 1 6 10 0
                                                   148 2 149 10 10 28 150 1 6
                                                   10 0 151 2 6 0 10 10 152 1 0
                                                   60 7 61 1 0 6 6 54 1 0 36 7
                                                   83 1 0 6 7 110 2 0 6 7 6 80
                                                   1 0 7 7 81 3 0 31 7 6 44 79
                                                   2 0 31 7 6 98 1 0 6 7 97 1 0
                                                   7 7 105 2 0 31 7 6 32 3 0 31
                                                   7 6 44 120 1 0 31 7 121 2 0
                                                   74 7 7 119 3 0 74 7 7 44 75
                                                   2 0 39 7 6 40 1 0 39 7
                                                   41)))))
           '|lookupComplete|)) 
